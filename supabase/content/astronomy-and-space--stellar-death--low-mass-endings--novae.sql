-- Astronomy & Space · Stellar Death — Low-Mass Endings —
-- "Novae". Curated master for
-- astronomy-and-space/stellar-death/low-mass-endings/novae
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (position 2, closing the Low-Mass
-- Endings block), so this change is content-only: no seed edit rides.
--
-- The dead star as a loaded weapon: cataclysmic variables and Roche-lobe
-- plumbing; hydrogen pooling on a surface with 100,000 Earth gravities
-- until its base goes degenerate; the fourth appearance of the block's
-- broken thermostat — same failure, new venue — detonating the layer in a
-- beta-limited hot-CNO flash; the eruption (8-15 magnitudes in days,
-- briefly super-Eddington, 10^-4 solar masses flung out); why ejection
-- beats a 6,800 km/s escape velocity (expand first, then blow); ignition
-- mass arithmetic making every classical nova a repeater on a 10^4-10^5 yr
-- cycle (hibernation), with recurrent novae (T CrB due about now) as the
-- fast lane; nova nucleosynthesis - beta-limited CNO isotopes, dust, and
-- the 2015 beryllium-7 detections crowning novae a major source of the
-- Galaxy's lithium; the erosion-vs-growth ledger deciding whether accreting
-- white dwarfs can reach the Chandrasekhar limit (single- vs
-- double-degenerate debate); and dwarf novae as the impostor mechanism.
-- ~10,000 words, checkpoint at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-death/low-mass-endings/novae',
    'research',
    'advanced',
    'read',
    $astroNovae_master$> A **nova** is a thermonuclear explosion on the surface of a white dwarf: hydrogen stolen from a companion star pools on the dead star's surface until it detonates, brightening the system ten-thousand-fold in days. The white dwarf survives, keeps stealing, and — given time — does it again.

The white-dwarf chapter closed on a loophole. A solitary dwarf's story is over: structure pinned by quantum statistics, nothing left but the long fade. But **most stars are born with companions** — and a white dwarf in a close binary can be handed the one thing this block established it must never receive: **fresh hydrogen, delivered onto degenerate ground.**

This chapter is about what happens next, and it is the block's finale for a reason beyond chronology: everything the previous eleven chapters built converges here. The broken thermostat of the helium flash returns for its fourth and most theatrical performance. The mass–radius inversion and the Chandrasekhar ceiling set the stakes. The binary shaping of the nebulae chapter graduates from sculptor to protagonist. Even the lithium problem of Galactic chemistry finds its factory. And at the end, the arithmetic of stolen mass opens directly onto the next block's first question: whether these systems are the fuses of the supernovae that measure the universe.

Three numbers to hold from the start:

| Quantity | Value | Meaning |
|---|---|---|
| Brightening | **8–15 magnitudes** | a factor of 10³–10⁶, in days |
| Ejected mass | ~10⁻⁵–10⁻⁴ $M_\odot$ | flung out at 500–3,000 km/s |
| Repeat interval | 10⁴–10⁵ yr (classical) | **every nova is a rerun** |

A nova is violent, but it is not a death — the same white dwarf, the same companion, the same plumbing survive and reload. It is the universe's most dramatic *recurring* explosion, and the physics of the recurrence is where this chapter ends up: a dead star metering out detonations for as long as its companion holds out, with a ledger that decides whether the story ends in erosion — or at 1.4 $M_\odot$.

## New stars

The name is a fossil of a misunderstanding, and the misunderstanding built modern astronomy.

*Stella nova* — "new star" — was Tycho Brahe's label for the brilliant point that appeared in Cassiopeia in 1572, outshining Venus where no star had been. Tycho's careful parallax argument put it beyond the Moon, among the fixed stars — heresy against the Aristotelian heavens' immutability, and a founding observation of the scientific revolution. (His 1572 event, and Kepler's of 1604, were in fact *supernovae* — the next block's subject, a thousand times more violent; the distinction between nova and supernova would take until the 1930s to draw, and drawing it is one of the ways astronomers discovered the scale of the universe.)

The classical novae — the recurring surface explosions of this chapter — announced themselves in the photographic era with a string of celebrity apparitions. **GK Persei, 1901**: reached magnitude 0.2, briefly among the brightest stars in the sky, and left behind an expanding firework of a remnant plus the first observed **light echoes** — illumination sweeping outward across foreground dust, faster-than-light in appearance and a spooky sensation in the newspapers. **V603 Aquilae, June 1918**: the brightest nova of the telescopic age, peaking near magnitude −1.4 — briefly rivalling Sirius — discovered by multiple observers within the same hour, wartime notwithstanding. **DQ Herculis, 1934**: found by an amateur on patrol; its slow, strange decline (a deep months-long dip, later understood as **dust condensing in the ejecta** and momentarily curtaining the light) made it the field's Rosetta stone. **V1500 Cygni, 1975**: an amplitude of *nineteen magnitudes* — a factor of forty million — from invisibility to naked-eye prominence in two days.

{{image: GK Persei | The remnant of GK Persei, the great nova of 1901 — a firework of ejected knots still expanding a century later. At peak it briefly ranked among the brightest stars in the sky, and its light echoes, sweeping across foreground dust faster than light appears to allow, unsettled the newspapers. The system survives, reloading: it now entertains itself with dwarf-nova outbursts while the next classical eruption's fuel accumulates.}}

Two demographic facts frame everything that follows. Novae are **common**: the Galaxy produces an estimated 30–50 per year (a handful are actually caught — the rest hide behind the dusty plane, and modern infrared surveys keep raising the census). And they are disproportionately an **amateur's game** to this day: a nova is a bright star where none was yesterday, exactly the anomaly a patrolling human or small robotic camera catches first. The professional machinery — spectrographs, space telescopes, gamma-ray satellites — mobilises on alerts that, remarkably often, begin with a hobbyist in a back garden.

```checkpoint
q: Tycho's famous "stella nova" of 1572 mattered for the history of science primarily because
a: it was the first classical nova whose white dwarf was identified
a*: his parallax argument placed it beyond the Moon among the "immutable" fixed stars, breaking Aristotelian cosmology
a: it proved that stars are powered by nuclear fusion
a: it allowed the first measurement of the speed of light
hint: What did Aristotle's heavens forbid, and what does an absent parallax imply about distance?
why: A brilliant newcomer with no measurable parallax had to sit in the supposedly changeless celestial realm — observational proof that the heavens change, a founding crack in the old cosmology. (Ironically, 1572 was a supernova; separating the two classes took until the 1930s and helped reveal the universe's true scale.)
```

## The machine: a star on an intravenous drip

Strip away the fireworks and the underlying object — a **cataclysmic variable** — is a marvel of gravitational plumbing, worth assembling piece by piece.

Take the aftermath of a common-envelope event from the planetary-nebulae chapter: a white dwarf and a low-mass main-sequence star (a red dwarf, typically) left orbiting each other **absurdly close** — separations comparable to the Earth–Moon distance, orbital periods of **a few hours**. Around each star draw the surface where its gravity dominates: the teardrop-shaped **Roche lobes**, meeting at the balance point between the stars. A star that stays inside its lobe keeps its matter. A star that **fills** its lobe spills.

The red dwarf fills its lobe — driven there by the slow shrinkage of the orbit (gravitational radiation and magnetic braking bleed angular momentum on Gyr timescales) — and matter streams off its inner face through the balance point, falling toward the white dwarf at a steady **10⁻⁹–10⁻⁸ $M_\odot$ per year**: an intravenous drip, a few lunar masses per century.

The stolen gas cannot fall straight in — it carries the orbit's angular momentum — so it swings into a ring, and the ring spreads into an **accretion disk**: a whirlpool of hydrogen spiralling gradually inward as internal friction ferries angular momentum outward. Two properties of the disk matter for this chapter. First, it is usually **the brightest component of the system** — friction converts orbital energy to heat so effectively that the glowing disk outshines both stars combined, which is why cataclysmic variables flicker constantly (the drip is lumpy). Second, it is a **reservoir with moods** — a fact set aside for the chapter's final section, where an entirely different kind of "nova" lives.

{{image: Cataclysmic variable star | A cataclysmic variable: the red dwarf, distorted into a teardrop by its companion's gravity, spills matter through the balance point into an accretion disk around the white dwarf. The whole binary would fit inside the Sun; the glowing disk usually outshines both stars; and the hydrogen it delivers pools on the dead star's surface at a hundred thousand Earth gravities.}}

For now, follow the hydrogen all the way down. It lands, spreads evenly over the white dwarf's surface (the ferocious gravity tolerates no mountains), and begins to pile up: a freshly delivered ocean of fuel, deepening by a few metres per year, on a body whose surface gravity is **a hundred thousand Earths**.

```checkpoint
q: In a cataclysmic variable, the matter flowing from the red dwarf forms an accretion disk rather than falling directly onto the white dwarf because
a: radiation pressure from the white dwarf holds the gas away
a: the white dwarf's magnetic field deflects the stream
a*: the transferred gas carries the orbital angular momentum, so it swings into orbit and can only spiral in as friction ferries that angular momentum outward
a: the gas is too hot to be captured directly
hint: The gas leaves a moving star in a rotating system. What conserved quantity prevents a straight-line fall?
why: Angular momentum forbids radial infall: the stream enters orbit, smears into a disk, and inches inward only as viscous friction moves angular momentum out — heating the disk so effectively that it usually outshines both stars. (In strongly magnetic systems the field can truncate or replace the disk — the exception proving the rule.)
```

## Loading the weapon

Now the block's signature physics assembles itself, one familiar step at a time, on a new stage.

The accreted hydrogen layer deepens. Its base — squeezed under the weight of everything above, at $10^{6}$ m/s² — is compressed to densities of order $10^{6}$–$10^{7}$ kg/m³. At those densities, at the modest temperatures of a drip-fed surface, the electrons at the layer's base go **degenerate**: the bottom of the fuel ocean quantum-locks, pressure decoupling from temperature.

Read that sentence against the block's history and the hair should rise. Fuel, sitting on degenerate ground, slowly heated by continued compression (and by the dwarf's own residual warmth seeping up): this is **the helium-flash configuration, rebuilt in miniature on a dead star's skin** — with hydrogen for helium and a surface for a core, but the same loaded spring. The temperature at the base creeps upward over millennia as the layer thickens; hydrogen's CNO burning threshold (~2 × 10⁷ K, using the dwarf's own carbon as catalyst — a detail about to matter enormously) approaches; and the thermostat that would make ignition gentle is **already broken**, because the equation of state at the base has no temperature term.

Ignition, when it comes, follows the block's most-rehearsed script — heating raises the rate, the rate raises the heating, pressure does not respond, nothing expands, nothing cools:

$$T \uparrow \;\Rightarrow\; \epsilon_{\text{CNO}} \uparrow \;\Rightarrow\; T \uparrow\uparrow \;\Rightarrow\; \dots$$

**This is the broken thermostat's fourth appearance** — after the degenerate core (helium flash), the trapped shell (RGB), and the thin shell (AGB pulses) — and the tally is worth a formal row in the block's ledger:

| Venue | Fuel | Failure | Outcome |
|---|---|---|---|
| Degenerate core | helium | no $P(T)$ response | helium flash (hidden) |
| Trapped shell | hydrogen | cannot expand | RGB ascent |
| Thin shell | helium | expansion doesn't help | thermal pulses |
| **Accreted surface layer** | **hydrogen** | **no $P(T)$ response** | **nova (spectacularly visible)** |

The runaway races to ~**2–3 × 10⁸ K** within minutes-to-hours of getting properly underway. And here a nuclear speed limit — new to the block — takes the wheel: the **beta-limited hot CNO cycle**. At these temperatures, proton captures are essentially instantaneous; the cycle's pace is set instead by the **beta-decay half-lives** of its proton-rich waypoints (¹⁴O: 71 s; ¹⁵O: 122 s), which no temperature can hurry. The energy release *saturates* — a flame throttled by the weak interaction — which caps the runaway's fury, stamps the ejecta with a chemical signature no other site produces (patience: two sections), and gives every nova light curve a family resemblance.

The endgame repeats the helium flash's self-disarming logic: the temperature soars until thermal energy overtakes the Fermi energy, **degeneracy lifts**, the base becomes ordinary gas at last — and now expansion *can* happen, violently, into the shallowest gravity available: **up**.

```checkpoint
q: The hydrogen layer on an accreting white dwarf detonates rather than igniting gently because
a: hydrogen is intrinsically explosive at any stellar density
a: the white dwarf's magnetic field confines the burning
a*: the layer's base is degenerate — pressure ignores temperature, so ignition triggers the same runaway that produced the helium flash, now on the star's surface
a: the accretion stream compresses the burning zone from above
hint: Fourth verse, same as the first: what property of the equation of state did every runaway in this block share?
why: Compression at 10⁶ m/s² degenerates the layer's base; when CNO ignition arrives, no pressure response means no expansion, no cooling, no brake — the block's broken thermostat in its fourth venue. The runaway saturates only at the beta-limited hot-CNO ceiling and ends by lifting its own degeneracy, aiming the release upward.
```

## The eruption

What the observer sees follows from the physics with satisfying directness — including one apparent paradox worth savouring.

**The rise.** The flash's energy, deposited beneath the layer, has to shoulder its way out. The envelope inflates enormously — the white dwarf, for a few days, wears a distended shell the size of a giant star — and the system's luminosity vaults to $10^{4}$–$10^{5}\,L_\odot$: **briefly at or above the Eddington limit**, the luminosity at which radiation pressure on the envelope matches gravity. An observer sees a star brighten by 8–15 magnitudes in a day or three: the "new star," which is really the least new object imaginable — a corpse relit.

**The ejection — and the paradox.** The white-dwarf chapter computed an escape velocity of ~**6,800 km/s**; measured nova ejecta travel at 500–3,000 km/s. How does slower-than-escape material leave? Resolution: it does not leave from the surface. The runaway's first act was to **inflate the envelope to giant dimensions** — and escape velocity falls with radius. From a photosphere swollen a hundredfold, escape costs only hundreds of km/s; the super-Eddington radiation then drives a wind off that distended surface for days to weeks. **Expand first, then blow**: the nova ejects its shell in two moves, neither of which needs surface-escape speeds. (The block has seen the trick before — the AGB superwind's pulsation-then-radiation two-step is the same choreography with different actors.)

**The decline** is the shell's story: weeks to months of fading as $10^{-5}$–$10^{-4}\,M_\odot$ of ejecta expands, thins, and transitions from opaque pseudo-photosphere to transparent emission-line nebula — a miniature, fast-forward planetary nebula, spectroscopically speaking, wrapped around a system rebuilding itself. Slower novae often interrupt the fade with DQ Herculis' signature move: a sudden **deep dip** as carbon dust condenses in the cooling ejecta and curtains the light — the AGB chapters' dust chemistry, re-run in months instead of millennia — before the shell thins and the light returns. Decades later, telescopes resolve the expanding shells directly (GK Persei's firework is the pin-up), and their measured expansion, matched against the years elapsed, hands out distances by pure geometry.

Energetically, the whole affair is a footnote with a bullhorn: burning ~$10^{-4}\,M_\odot$ of hydrogen releases ~$10^{40}$ J, of which the kinetic ejecta carry a few $10^{38}$ — a *ten-billionth* of a supernova's budget. The spectacle is real; the catastrophe is not. Which is exactly the point: **the system is built to survive its own explosions.**

```checkpoint
q: Nova ejecta move at 500–3,000 km/s, far below the white dwarf's 6,800 km/s surface escape velocity. The shell escapes anyway because
a: the explosion's radiation pushes it to escape speed once clear of the system
a: the companion star's gravity cancels most of the white dwarf's pull
a*: the runaway first inflates the envelope to giant size — where escape velocity is only hundreds of km/s — and a super-Eddington wind then blows the shell off that swollen surface
a: measured velocities are underestimates caused by viewing angle
hint: Escape velocity depends on the radius you start from. What did the flash's energy do to the envelope before anything was ejected?
why: Expand first, then blow: the deposited energy balloons the layer to giant dimensions, collapsing the escape cost hundredfold, and days of super-Eddington luminosity drive the wind from there. The AGB's lift-then-push choreography, restaged in fast-forward on a corpse.
```

## The reload: every nova is a rerun

Now the arithmetic that turns an explosion into a schedule — and reframes the entire phenomenon.

Theory and observation agree the runaway fires when the accreted layer reaches a critical **ignition mass** of roughly $10^{-5}$–$10^{-4}\,M_\odot$ (thinner for heavier dwarfs: their fiercer gravity reaches ignition pressure with less fuel — a detail about to organise the whole zoo). Divide by the drip rate:

$$t_{\text{recur}} \sim \frac{10^{-5}\ M_\odot}{10^{-9}\ M_\odot/\text{yr}} \sim 10^{4}\ \text{years}.$$

**Every classical nova recurs.** The eruption spends the layer; the drip resumes; the layer rebuilds; the fuse relights — on a cycle of ten to a hundred millennia. Humanity, watching for roughly a century with decent records, has seen **less than one percent of a single cycle** of any classical system: every "one-off" nova in the catalogue is a repeater caught once. (The long gaps have their own proposed drama — the **hibernation hypothesis** holds that post-eruption systems may slacken their mass transfer for millennia, the plumbing itself resting between shots — one way to reconcile nova statistics with the census of quiet cataclysmic variables.)

And the scaling with white-dwarf mass creates a fast lane. A **massive dwarf near the Chandrasekhar limit**, fed at a generous rate (often by a giant companion's wind rather than a dribbling red dwarf), reaches its thin ignition layer in mere **decades**: the **recurrent novae**, the only systems polite enough to erupt within a career. RS Ophiuchi detonates every ~15–20 years (most recently 2021, its blast wave into the companion's wind observed in gamma rays). U Scorpii runs on a ~10-year cycle. And **T Coronae Borealis** — the "Blaze Star," a naked-eye event in 1866 and again in 1946 — runs an ~80-year clock whose pre-eruption warning signs have been flashing since the early 2020s: its third recorded performance is expected **imminently**, the rare astronomical prediction with a due date inside a reader's lifetime. When it fires, a "new star" of second magnitude will sit in the Northern Crown for a few nights — the block's physics, performed live.

The recurrents matter beyond spectacle: they are the systems whose dwarfs are **heaviest and most frequently refuelled** — which makes them the natural suspects for the chapter's final question, the one with a 1.4 $M_\odot$ answer.

```checkpoint
q: Classical novae are described as "recurrent on 10,000–100,000 year cycles" even though each has been seen to erupt only once because
a: their light curves show periodic sub-eruptions that reveal the cycle
a*: the ignition-mass arithmetic guarantees a rerun — the layer rebuilds at the measured drip rate — and a century of records covers under 1% of one cycle
a: ancient records document previous eruptions of every known nova
a: their companions are observed to pulse on the same timescale
hint: Critical layer ~10⁻⁵ M☉, drip ~10⁻⁹ M☉/yr. Divide — and compare with how long astronomy has kept good records.
why: The eruption spends the layer, the drip refills it, the physics has no off switch: recurrence is arithmetic. Massive, fast-fed dwarfs shorten the cycle to decades — the recurrent novae like T CrB, whose ~80-year clock (1866, 1946) is expected to strike again about now.
```

## The isotope factory — and the lithium surprise

The beta-limited furnace stamps the ejecta with a signature found nowhere else in nature, and one line of that signature solved a forty-year-old accounting scandal.

**The signature.** Ordinary CNO burning, ambling along at equilibrium, fills the ejecta of stars with its familiar ratios — much ¹⁴N, the isotopes near stability. The *hot* CNO cycle, racing proton captures against 100-second beta clocks and then quenching mid-stride as the envelope flings itself into space, freezes the chemistry at the moment of interruption: nova ejecta arrive **wildly enriched in the rare heavy isotopes of the light elements** — ¹³C, ¹⁵N, ¹⁷O — at hundreds to thousands of times solar proportions. No other astrophysical site produces that mix; when isotopic analysis of meteoritic stardust turns up presolar grains with precisely those ratios, the attribution line reads *condensed in the ejecta of a nova* — grains from identified dead stars' explosions, held in terrestrial laboratories. (Novae on heavyweight **neon dwarfs** — cores of oxygen and neon from progenitors near the massive-star boundary — extend the signature upward, seasoning their ejecta with neon, sodium, aluminium: the "neon novae," whose spectra read out the *white dwarf's own* composition and thereby weigh its ancestry.)

**The lithium surprise.** The Galaxy's lithium ledger spent decades refusing to balance. The Big Bang made a precisely calculable trace; cosmic-ray spallation adds a calculable dribble; ordinary stars *destroy* the fragile stuff (the brown-dwarf lithium test of earlier blocks trades on exactly that fragility). Yet young stars carry several times more lithium than those sources supply. Some factory was missing.

Novae had been proposed on paper since the 1970s, via an elegant relay: the runaway's alpha captures forge **beryllium-7**, which is not lithium but *becomes* it — decaying to ⁷Li with a 53-day half-life. The trick is the same one the block met in the AGB's Cameron–Fowler mechanism: **make the fragile product's parent, and move it somewhere safe before the conversion.** The nova's ejection does the moving — ⁷Be rides the shell out of the furnace and decays to lithium in the cool, safe expanse of the ejecta.

For forty years this was theory. In **2015** it became measurement: high-resolution spectra of Nova Delphini 2013 caught the **absorption lines of ⁷Be itself** in the fresh ejecta — the parent isotope, mid-relay, weeks from becoming lithium — with companion detections of nova lithium following in short order. The measured yields, multiplied by the Galactic nova rate, cover a substantial share (plausibly the majority) of the missing production. **The Galaxy's lithium — the element in the battery of the device displaying this sentence — is significantly the ash of white-dwarf surface explosions.** The block's quietest chapter-ending object turns out to be a named supplier of the periodic table's third entry.

```checkpoint
q: The 2015 detection of beryllium-7 in nova ejecta mattered because ⁷Be
a: proves the ejecta reached temperatures found nowhere else
a: is stable and traces the total mass of the explosion
a*: decays to lithium-7 in 53 days — so catching it mid-flight confirmed novae as a long-theorised major factory for the Galaxy's missing lithium
a: shows the white dwarf itself is being eroded
hint: Lithium is destroyed wherever it's made hot. What's the trick for delivering a fragile element — and which isotope is the courier?
why: Make the parent, ship it, let it become the fragile child in safety: ⁷Be forged in the flash rides the ejecta out and decays to ⁷Li in the cool shell — the Cameron–Fowler relay at explosive speed. Seeing ⁷Be itself in Nova Del 2013 turned a 40-year-old proposal into a measured supply line for the Galaxy's lithium budget.
```

## The ledger: erosion or the ceiling?

And so to the question the whole block has been aiming at — the one that decides whether this chapter ends a story or lights a fuse.

Each cycle, the white dwarf **gains** the accreted layer and **loses** the ejected shell. If ejection merely refunded the accretion, the dwarf would tread water. The spectra say something sharper: nova ejecta are typically **laced with the white dwarf's own substance** — carbon and oxygen (or neon, on the heavyweight systems) at abundances far above any companion's donation — because the runaway's convection chews into the dwarf's surface and flings some of it out with the shell. Careful accounting of well-observed classical novae usually finds **ejected mass exceeding plausibly accreted mass**: the explosion not only spends the fuel but bites the gun. **Classical novae likely erode their white dwarfs.**

Which would close the book — dwarfs nibbling themselves away, forever short of the ceiling — except that the ledger's sign appears to **flip in the fast lane**. Models and observations agree that at high accretion rates onto massive dwarfs, burning is gentler and less of the dwarf is excavated per cycle; the recurrent-nova systems, with their near-limit dwarfs and generous feeds, plausibly **retain net mass**, ratcheting cycle by cycle toward 1.4 $M_\odot$. T CrB's dwarf is measured close to the limit already.

At the ceiling waits the event the White Dwarfs chapter promised in fine print: a carbon–oxygen dwarf pushed to the Chandrasekhar mass does not politely collapse — compressed carbon **ignites first**, under total degeneracy, in the ultimate rendition of the broken thermostat: not a surface layer this time but **the entire star as fuel**, a runaway with no envelope to eject and no ceiling to save it. The result — the complete thermonuclear disassembly of the white dwarf — is a **Type Ia supernova**: the standardisable candle that measured cosmic acceleration, the next block's opening subject.

Whether accreting novae actually *supply* the Type Ia rate is the **single-degenerate versus double-degenerate debate**, one of stellar astrophysics' liveliest open cases. The single-degenerate route (this chapter's systems, ratcheted to the limit) explains the uniformity but struggles with censuses — surviving ex-companions are largely missing from supernova remnants, and the X-ray glow expected from populations of steadily burning pre-Ia accretors falls short. The double-degenerate route — **two** white dwarfs, spiralling together on gravitational radiation and merging past the limit — dodges those objections and has gained ground steadily; the modern synthesis suspects **both channels operate**, in proportions still being fought over, with the answer mattering at the percent level to the cosmology built on the candles. The block hands that fight, along with its fuse, to the next one.

*(For completeness of the ledger's stakes: on oxygen–neon dwarfs, reaching the limit ends differently — electron capture triggers collapse to a neutron star rather than detonation. Even the ceiling's fine print branches.)*

```checkpoint
q: Whether accreting white dwarfs can actually reach the Chandrasekhar limit is uncertain because
a: the limit itself is only approximately known
a: no white dwarf has ever been observed in a binary system
a*: classical nova eruptions appear to eject MORE mass than was accreted — eroding the dwarf — and only fast-fed massive systems plausibly show net growth
a: accretion always stops once the dwarf is hot enough
hint: Check the ejecta's chemistry: whose carbon and oxygen is in the shell — the donor's, or the dwarf's own?
why: Ejecta laced with the dwarf's excavated C/O, in amounts exceeding the accreted layer, mean classical novae bite the gun as they fire: net erosion. The recurrents' gentler, faster-fed cycles may flip the sign and ratchet toward 1.4 M☉ — the single-degenerate route to Type Ia supernovae, still contested against white-dwarf mergers (double-degenerate) in a debate with percent-level stakes for cosmology.
```

## The impostor: dwarf novae

One clarification guards the whole chapter against its commonest confusion, and it makes a fitting close because the distinction *is* the chapter's physics, inverted.

The variable-star catalogues teem with **dwarf novae** — U Geminorum and its kin — systems that brighten by 2–5 magnitudes every few weeks-to-months. Same binary, same Roche spill, same disk; the name suggests a junior version of the same explosion. **It is nothing of the kind.** A dwarf nova is not a thermonuclear event at all: it is the **accretion disk's** tantrum — the "reservoir with moods" flagged earlier, paying off.

A disk fed at these rates is thermally bistable: it can idle cool, ionisation-poor and viscously sluggish, banking the incoming stream — until the stored mass crosses a threshold, hydrogen ionises, viscosity leaps (the moods are literally an ionisation switch on the disk's friction), and the reservoir **dumps** onto the white dwarf in a bright, weeks-long accretion flood. No fusion; no ejecta; just gravitational energy released in a rush. Then the disk empties, cools, and begins banking again.

| | Dwarf nova | Classical nova |
|---|---|---|
| Energy source | **gravity** (disk dump) | **fusion** (surface runaway) |
| Amplitude | 2–5 mag | 8–15 mag |
| Recurrence | weeks–months | 10⁴–10⁵ yr |
| Ejecta | none | 10⁻⁵–10⁻⁴ $M_\odot$ |
| The star after | unchanged | unchanged *(that, they share)* |

The same system can do both — every dwarf-nova outburst delivers fuel toward the *next* classical eruption, thousands of years out (GK Persei, a classical nova in 1901, now entertains itself with dwarf-nova outbursts while reloading). Two utterly different physics, one address: the block's parting reminder that in astronomy, as everywhere, **the label on the light is not the mechanism underneath it** — the entire nebulium lesson, one last time, wearing a different costume.

And with the weapon, the schedule, the factory, the ledger and the impostor all in hand, the Low-Mass Endings block is complete: the quiet majority of stellar deaths, from last flash to eternal fade — except for the fuse still burning at 1.4 $M_\odot$, which belongs to the supernovae.

```checkpoint
q: A dwarf nova differs from a classical nova in that its outburst is powered by
a: a smaller thermonuclear runaway involving less hydrogen
a: the companion star flaring rather than the white dwarf
a*: gravitational energy released when the bistable accretion disk dumps its banked matter — no fusion and no ejected shell at all
a: the white dwarf's crystallised core cracking
hint: One mechanism burns the fuel; the other merely delivers it in a rush. Which component of the system has "moods"?
why: The disk is thermally bistable: it banks the stream cold and sluggish, then an ionisation-triggered viscosity jump dumps the reservoir — a weeks-long gravitational flood, 2–5 magnitudes, no fusion, repeatable on months. Same plumbing as a classical nova, utterly different physics: the label on the light is not the mechanism beneath it.
```

## Pulling the thread

- **The name is a fossil**: Tycho's 1572 "new star" broke the immutable heavens (and was a supernova); the classical novae — GK Per 1901, V603 Aql 1918, DQ Her 1934's dust dip, V1500 Cyg's 19-magnitude leap — are the Galaxy's ~30–50-per-year surface explosions, still routinely first-caught by amateurs.
- **The machine is plumbing**: a post-common-envelope white dwarf + red dwarf in an hours-long orbit; Roche-lobe overflow at 10⁻⁹–10⁻⁸ $M_\odot$/yr; an angular-momentum-mandated accretion disk that usually outshines both stars; hydrogen pooling at metres per year on a 10⁵-gravity surface.
- **The weapon loads itself**: the layer's base degenerates under compression — fuel on quantum ground, the helium-flash configuration in miniature — and CNO ignition triggers **the broken thermostat's fourth appearance**. The runaway races to 2–3 × 10⁸ K, throttled by the **beta-limited hot CNO cycle** (71 s and 122 s half-lives no temperature can hurry), and disarms itself by lifting its own degeneracy.
- **The eruption**: 8–15 magnitudes in days, briefly super-Eddington; the escape-velocity paradox resolved by **expand first, then blow** — inflate to giant dimensions where escape is cheap, then drive a radiation wind. 10⁻⁵–10⁻⁴ $M_\odot$ ejected at 500–3,000 km/s; dust dips; shells that later hand out geometric distances. Energetically a supernova's ten-billionth: built to survive.
- **Every nova is a rerun**: ignition mass over drip rate gives 10⁴–10⁵ yr cycles (hibernation may stretch the quiet spells); humanity has watched <1% of one classical cycle. Massive fast-fed dwarfs compress the cycle to decades — RS Oph, U Sco, and **T CrB, due about now** at naked-eye brightness.
- **The furnace signs its work**: interrupted hot-CNO chemistry (¹³C, ¹⁵N, ¹⁷O at hundreds-of-solar) identifiable in presolar meteorite grains; neon novae reading out the dwarf's own ONe anatomy; and the **⁷Be relay confirmed in 2015** — novae as a major factory of the Galaxy's lithium, closing a forty-year budget scandal.
- **The ledger decides the sequel**: classical novae eject more than they accrete (the dwarf's own C/O rides the shell) — net **erosion**; recurrents plausibly **grow**, ratcheting toward 1.4 $M_\odot$, where compressed carbon ignites the whole star: the Type Ia supernova. Whether novae's channel (single-degenerate) or white-dwarf mergers (double-degenerate) supply the cosmology-grade candles is the next block's inherited fight.
- **The impostor**: dwarf novae are disk dumps — gravity, not fusion; 2–5 magnitudes, no ejecta, weeks-scale recurrence — same address, different physics. The label on the light is not the mechanism underneath.

The transferable idea: a nova is the block's whole argument performed as a repeating experiment. Degeneracy breaks the thermostat (chapters ago, a hidden core event; here, a public spectacle on a schedule); a nuclear speed limit shapes the flame; expansion-then-wind ejects the evidence; and the books must still balance — with the sign of one ledger entry deciding between an eternity of fizzles and the brightest standard candles in the universe. When the same failure mode keeps reappearing in new venues, the venues are the variables and the failure is the law: learn it once, recognise it forever.

## Further reading

The systems are codified in {{book: Brian Warner | Cataclysmic Variable Stars | 1995}}, and the explosions in the standard collection {{book: Michael F. Bode and Aneurin Evans | Classical Novae | 2008}}.

- **Brian Warner, *Cataclysmic Variable Stars* (1995).** The encyclopedic reference for the plumbing: Roche geometry, disks and their instabilities, nova and dwarf-nova observations, the whole binary zoo in one volume.
- **Michael F. Bode and Aneurin Evans (eds.), *Classical Novae* (2008).** The field's standard multi-author treatment: runaway theory, nucleosynthesis, dust formation, recurrent systems, and the nova–supernova connection, each chapter by its specialists.
- **Dina Prialnik, *An Introduction to the Theory of Stellar Structure and Evolution* (2009).** The block's gentle-rigorous companion returns with special authority — its author is one of the architects of modern nova runaway simulation, and the accretion-ignition physics is presented from the source.

Beyond the books: Starrfield, Truran and colleagues' runaway simulations founded the modern theory; Tajitsu et al. (2015, *Nature*) and Izzo et al. (2015) are the beryllium-and-lithium detections; the RS Ophiuchi 2021 gamma-ray papers show a nova blast wave in real time; and the single- versus double-degenerate literature — Maoz, Mannucci & Nelemans' review is the standard door — carries this chapter's ledger into the supernova cosmology it underwrites.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, $R_\odot = 6.957\times10^{8}$ m, $G = 6.674\times10^{-11}$, $c = 2.998\times10^{8}$ m/s, 1 yr = 3.156 × 10⁷ s. H fusion: 6.3 × 10¹⁴ J/kg. White dwarf: $M = 1.0\,M_\odot$, $R = 6\times10^{6}$ m, $v_{\text{esc}} = 6{,}800$ km/s. Accretion: 10⁻⁹–10⁻⁸ $M_\odot$/yr; ignition mass 10⁻⁵–10⁻⁴ $M_\odot$ (smaller for more massive dwarfs). Eddington luminosity: $L_{\text{Edd}} = 4\pi G M m_p c/\sigma_T$ with $m_p = 1.673\times10^{-27}$ kg, $\sigma_T = 6.652\times10^{-29}$ m². Hot CNO beta half-lives: ¹⁴O 71 s, ¹⁵O 122 s. ⁷Be → ⁷Li half-life 53 d. T CrB: eruptions 1866, 1946. Magnitude–flux: $\Delta m = 2.5\log_{10}(f_1/f_2)$.*

### 1 — The scale of the bang
**(a)** A nova burns 3 × 10⁻⁵ $M_\odot$ of hydrogen. Compute the energy released.
**(b)** The eruption radiates ~10⁴·⁵ $L_\odot$ for 50 days. Compute the radiated energy and compare with (a).
**(c)** The ejecta (10⁻⁴ $M_\odot$ at 1,500 km/s) carry what kinetic energy? Express as a fraction of (a).
**(d)** A Type Ia supernova releases ~10⁴⁴ J. Place the nova on that scale, and state why the comparison is nonetheless the chapter's central question.

### 2 — The plumbing
**(a)** A cataclysmic variable has an orbital period of 4 hours. Using Kepler's third law with total mass 1.5 $M_\odot$, compute the orbital separation in units of the Sun's radius.
**(b)** Explain Roche-lobe overflow in two sentences, and why the *red dwarf* is the donor.
**(c)** At $\dot M = 10^{-9}\,M_\odot$/yr, how deep (in metres per year) does the hydrogen ocean grow on the dwarf's surface? (Spread $\dot M$ over the sphere at density ~10³ kg/m³ for the fresh layer.)
**(d)** Explain why the accretion disk usually outshines both stars.

### 3 — The fourth runaway *(the structural argument)*
**(a)** Explain why the base of the accreted layer becomes degenerate.
**(b)** Complete the block's ledger: name all four venues of the broken thermostat, their fuels, and their outcomes.
**(c)** Explain the beta-limited hot CNO cycle: what saturates, why temperature cannot help, and two consequences.
**(d)** Explain how the runaway ends, and the structural rhyme with the helium flash.
**(e)** Why does the *white dwarf's own carbon* matter for ignition — what role does it play in the burning?

### 4 — The eruption
**(a)** Compute the Eddington luminosity for a 1.0 $M_\odot$ white dwarf, in $L_\odot$.
**(b)** A nova peaks at 10⁵ $L_\odot$. Express this as a multiple of (a), and state the dynamical consequence of exceeding it.
**(c)** Resolve the escape-velocity paradox quantitatively: to what radius must the envelope inflate for escape velocity to fall to 1,000 km/s?
**(d)** V1500 Cygni rose ~19 magnitudes. Compute the brightening factor.
**(e)** Explain the DQ Herculis dust dip, naming the earlier block chapter whose chemistry it re-runs.

### 5 — The schedule
**(a)** Compute recurrence times for the four corners of parameter space: ignition mass {10⁻⁵, 10⁻⁴} $M_\odot$ × accretion {10⁻⁹, 10⁻⁸} $M_\odot$/yr.
**(b)** Explain why more massive dwarfs have *smaller* ignition masses, using the block's mass–radius inversion.
**(c)** T CrB erupted in 1866 and 1946. Assuming a strict clock, when is the third eruption "due," and what accretion rate does an ignition mass of 3 × 10⁻⁷ $M_\odot$ imply?
**(d)** State the hibernation hypothesis and the statistical tension it addresses.

### 6 — The factory
**(a)** Explain why interrupted hot-CNO burning enriches ejecta in ¹³C, ¹⁵N, ¹⁷O specifically.
**(b)** Describe how presolar grains in meteorites are attributed to novae.
**(c)** Trace the ⁷Be relay: production site, transport, decay, and why the product survives.
**(d)** A nova ejects 10⁻⁴ $M_\odot$ with lithium mass fraction 10⁻⁵. At 40 novae per year over 10¹⁰ years, what total lithium mass does the Galaxy's nova history supply? Compare with ~150 $M_\odot$ of Galactic lithium.
**(e)** Name the mechanism from the AGB chapters that the ⁷Be relay structurally repeats, and state the shared principle.

### 7 — The ledger
**(a)** State the observational evidence that classical novae excavate white-dwarf material.
**(b)** Explain why erosion versus growth flips with accretion rate and dwarf mass.
**(c)** Lay out the single-degenerate and double-degenerate channels for Type Ia supernovae, one strength and one difficulty each.
**(d)** Explain what an oxygen–neon dwarf does at the limit instead, and why.
**(e)** Why does the SD/DD proportion matter to cosmology at the percent level?

### 8 — The impostor
**(a)** Tabulate dwarf nova versus classical nova on energy source, amplitude, recurrence, and ejecta.
**(b)** Explain the disk-instability mechanism: what is bistable, and what throws the switch?
**(c)** GK Persei was a classical nova (1901) and now shows dwarf-nova outbursts. Reconcile the two behaviours in one sentence.
**(d)** A dwarf nova dumps 10⁻⁹ $M_\odot$ onto the dwarf from a disk at radius 10⁹ m. Estimate the gravitational energy released and compare with a classical nova's 10⁴⁰ J.

### 9 — Open problem: the road to 1.4
**(a)** Summarise why the single-degenerate channel's population accounting falls short (companions, X-rays).
**(b)** Summarise the double-degenerate channel's rise, and its own open difficulty (do mergers detonate or collapse?).
**(c)** Explain how nova ledger measurements — per-cycle mass gain or loss — bear on the debate, and why they are hard.
**(d)** Describe two observations of the coming T CrB eruption that would advance the question.
**(e)** State what is at stake for supernova cosmology if the channel mix evolves with cosmic time.

## Worked answers

### 1 — The scale of the bang

**(a)** $E = 3\times10^{-5} \times 1.989\times10^{30} \times 6.3\times10^{14} = 5.97\times10^{25} \times 6.3\times10^{14} = \mathbf{3.8\times10^{40}\ J}$.

**(b)** $10^{4.5}\,L_\odot = 3.16\times10^{4} \times 3.828\times10^{26} = 1.21\times10^{31}$ W × (50 × 86,400 s) $= 1.21\times10^{31} \times 4.32\times10^{6} = \mathbf{5.2\times10^{37}\ J}$ — about 0.1% of the nuclear release; most of the energy goes into lifting and unbinding the envelope, not light.

**(c)** $E_K = \tfrac12 \times 10^{-4} \times 1.989\times10^{30} \times (1.5\times10^{6})^2 = \tfrac12 \times 1.989\times10^{26} \times 2.25\times10^{12} = \mathbf{2.2\times10^{38}\ J}$ — roughly **0.6%** of (a).

**(d)** The nova sits **~4 orders of magnitude** below a Type Ia (10⁴⁰ vs 10⁴⁴ J): a firecracker beside a bomb. The comparison is central anyway because the firecracker's ledger — does each cycle grow or erode the dwarf? — decides whether these very systems eventually *become* the bombs.

### 2 — The plumbing

**(a)** $a^3 = GM_{\text{tot}}P^2/4\pi^2$: $P = 14{,}400$ s, $M = 2.98\times10^{30}$ kg. $a^3 = 6.674\times10^{-11} \times 2.98\times10^{30} \times 2.074\times10^{8}/39.48 = 1.045\times10^{27}$ m³; $a = 1.015\times10^{9}$ m $= \mathbf{1.46\,R_\odot}$ — the whole binary would fit inside the Sun with room to spare.

**(b)** Each star owns the teardrop region where its gravity dominates; a star swelling to fill its teardrop loses matter through the inner balance point to its partner. The red dwarf donates because orbital shrinkage (magnetic braking, gravitational radiation) closes its lobe onto it — and once contact begins, its convective response keeps the spill going.

**(c)** Delivery: $10^{-9}\,M_\odot$/yr $= 1.989\times10^{21}$ kg/yr, spread over $4\pi R^2 = 4\pi(6\times10^{6})^2 = 4.52\times10^{14}$ m² gives $4.4\times10^{6}$ kg/m² each year. At the fresh layer's ρ ~ 10³ kg/m³ that is $\mathbf{\sim 4\ km/yr}$ of uncompressed hydrogen — but the 10⁵-g gravity immediately crushes it toward degenerate densities, so the *resident* ocean deepens only metres per year. The striking figure is the delivery, not the standing depth.

**(d)** Half the accretion energy is dissipated by viscosity on the way down the disk (the other half at the boundary layer); with $GM/R$ per kilogram enormous for a white dwarf, that steady dissipation outshines two small stars — a gravity-powered lamp fed by the drip.

### 3 — The fourth runaway

**(a)** The layer's base carries the weight of everything above at $g \sim 10^{6}$ m/s²; the pressure demanded compresses the (initially cool) gas to ~10⁶–10⁷ kg/m³, where electron degeneracy sets in — pressure achieved through density, decoupled from temperature.

**(b)** Degenerate **core**/helium → helium flash (hidden, once). Trapped **shell**/hydrogen → RGB ascent (the confined thermostat). Thin **shell**/helium → AGB thermal pulses (expansion that doesn't help). Accreted **surface layer**/hydrogen → nova (public, recurring). Same broken feedback, four venues.

**(c)** Above ~10⁸ K, proton captures in the CNO loop outpace everything except the beta decays of ¹⁴O (71 s) and ¹⁵O (122 s), which are weak-interaction clocks immune to temperature: the cycle idles at the decay rate no matter how hot it gets. Consequences: the energy release **saturates** (capping the runaway's ferocity and standardising light curves), and burning is interrupted mid-cycle, freezing proton-rich isotopes (¹³C, ¹⁵N, ¹⁷O) into the ejecta.

**(d)** Temperature climbs until $kT$ overtakes the base's Fermi energy: degeneracy lifts, the equation of state re-acquires its temperature term, and expansion — impossible during the loading — proceeds explosively upward. The helium flash's self-disarming, restaged: the runaway destroys the condition (degeneracy) that permitted it.

**(e)** CNO burning needs C, N, O nuclei as **catalysts**; the donor's hydrogen arrives nearly metal-free by mass, but convective dredging from the dwarf's own C/O surface salts the layer with catalyst — raising the burning rate, deepening the runaway, and (the ledger's point) ensuring the ejecta carry the dwarf's excavated substance.

### 4 — The eruption

**(a)** $L_{\text{Edd}} = 4\pi G M m_p c/\sigma_T = 4\pi \times 6.674\times10^{-11} \times 1.989\times10^{30} \times 1.673\times10^{-27} \times 2.998\times10^{8}/6.652\times10^{-29}$. Numerator: $4\pi \times 6.674\times10^{-11} \times 1.989\times10^{30} = 1.668\times10^{21}$; × $1.673\times10^{-27}$ = $2.79\times10^{-6}$; × $2.998\times10^{8}$ = $8.37\times10^{2}$; ÷ $6.652\times10^{-29}$ = $1.26\times10^{31}$ W $= \mathbf{3.3\times10^{4}\ L_\odot}$.

**(b)** $10^{5}/3.3\times10^{4} \approx \mathbf{3\times L_{\text{Edd}}}$. Above Eddington, radiation pressure on the envelope exceeds gravity: the outer layers *cannot* be held, and a continuum-driven wind is mandatory — the "then blow" of the ejection mechanism.

**(c)** $v_{\text{esc}}^2 = 2GM/R$ ⇒ $R = 2GM/v^2 = 2 \times 6.674\times10^{-11} \times 1.989\times10^{30}/(10^{6})^2 = 2.655\times10^{20}/10^{12} = 2.66\times10^{8}$ m $= \mathbf{0.38\,R_\odot}$ — inflate from Earth-size to merely half a Sun and 1,000 km/s suffices. The observed giant-scale pseudo-photospheres overshoot this threshold comfortably.

**(d)** $10^{0.4 \times 19} = 10^{7.6} = \mathbf{4\times10^{7}}$ — forty million-fold, in about two days.

**(e)** As the ejecta expand and cool through ~1,500 K, carbon-rich gas condenses solid grains — soot in the shell — which absorb the visible light (re-radiating infrared) and cut the light curve into a deep dip until the thinning shell clears. It is the AGB chapters' dust-condensation chemistry (the C/O cliff's soot) compressed from millennia to months.

### 5 — The schedule

**(a)** $t = M_{\text{ign}}/\dot M$: 10⁻⁵/10⁻⁸ = **10³ yr**; 10⁻⁵/10⁻⁹ = **10⁴ yr**; 10⁻⁴/10⁻⁸ = **10⁴ yr**; 10⁻⁴/10⁻⁹ = **10⁵ yr**. The classical range, corner to corner.

**(b)** More massive dwarfs are *smaller* ($R \propto M^{-1/3}$), so surface gravity — and the pressure at a given layer depth — is much higher: the base of a far thinner layer reaches ignition pressure. Near-limit dwarfs detonate on ~10⁻⁷ $M_\odot$ of fuel, orders of magnitude less than lightweights need.

**(c)** Interval 80 years ⇒ due **~2026** (1946 + 80) — hence the current watch. $\dot M = 3\times10^{-7}/80 = \mathbf{3.8\times10^{-9}\ M_\odot/yr}$ — an ordinary drip achieving decadal recurrence only because the near-limit dwarf's ignition mass is tiny: both fast-lane factors at work.

**(d)** Hibernation: after an eruption, irradiation-driven mass transfer wanes and the system may spend millennia semi-detached and dim, transfer reviving as the orbit tightens — so nova progenitors cycle through low states. It reconciles the observed nova rate with the (too small) census of bright cataclysmic variables that steady-state transfer would predict.

### 6 — The factory

**(a)** The hot cycle's flow parks at the beta-waiting points (¹⁴O, ¹⁵O) and is then flash-frozen by the ejection quenching the burning mid-loop: the decays complete in flight, delivering the daughters' isotopes — ¹³C, ¹⁵N, ¹⁷O — in proportions equilibrium burning never visits (hundreds to thousands of times solar).

**(b)** Certain presolar grains — refractory dust predating the solar system, extracted from meteorites — carry isotopic ratios (huge ¹³C/¹²C, ¹⁵N excesses, ¹⁷O enrichment, ²²Na/²²Ne signatures) matching nova-runaway predictions and no other site: laboratory-held solids condensed in the ejecta of specific ancient novae.

**(c)** ⁷Be is forged by alpha capture in the flash's hottest phase; being hot-fragile *as lithium*, the trick is that it is *not yet* lithium — it rides the ejecta out within days, and only then (53-day half-life, by electron capture) becomes ⁷Li, in shell gas far too cool to destroy it. Parent-couriering: manufacture the precursor, relocate, convert in safety.

**(d)** Per nova: $10^{-4} \times 10^{-5} = 10^{-9}\,M_\odot$ of Li. Galactic total: $10^{-9} \times 40 \times 10^{10} = \mathbf{400\ M_\odot}$ — comfortably the ~150 $M_\odot$ scale of the Galaxy's lithium (the deliberately generous inputs show the channel's capacity; realistic yields and rates put novae at a major fraction rather than the entirety).

**(e)** The **Cameron–Fowler mechanism** (AGB hot bottom burning): make ⁷Be deep, convect it surfaceward faster than it converts, harvest ⁷Li where it survives. Shared principle: **a fragile product can be delivered anywhere if synthesis and residence are separated — ship the parent.**

### 7 — The ledger

**(a)** Nova ejecta spectra show carbon, oxygen (or neon, sodium, aluminium) at abundances tens of times anything the donor's envelope could supply: the shell carries excavated white-dwarf material, and inferred ejecta masses generally exceed the accreted ignition layer.

**(b)** Slow accretion on light dwarfs builds thick degenerate layers that detonate hard and dig deep (erosion); fast accretion on massive dwarfs builds thin layers that flash gently, excavate little, and can even burn quasi-steadily between events (net growth). The ledger's sign tracks the loading conditions.

**(c)** **Single-degenerate** (nova-type accretor ratcheting to the limit): strength — natural uniformity, since every explosion fires at the same 1.4 $M_\odot$ trigger; difficulty — the surviving donor stars and the X-ray glow of steadily burning accretor populations are largely *not found*. **Double-degenerate** (two dwarfs merging past the limit): strength — no survivor or X-ray prediction to violate, and enough merging pairs exist; difficulty — a merger's mass varies, challenging uniformity, and simulations disagree on whether merging C/O dwarfs reliably detonate rather than collapsing or fizzling.

**(d)** An ONe dwarf at the limit undergoes **electron capture** onto ²⁰Ne/²⁴Mg before carbon-style ignition can win: removing electrons removes the supporting pressure itself, and the star **collapses to a neutron star** (accretion-induced collapse) instead of detonating — the ceiling's other exit.

**(e)** Type Ia cosmology assumes the candles' standardisation is stable across cosmic time. The two channels have different delay times and potentially different luminosity calibrations; if their mix evolves with redshift, the standardisation drifts systematically — precisely the kind of percent-level effect that matters in an era of percent-level Hubble-tension arguments.

### 8 — The impostor

**(a)**

| | Dwarf nova | Classical nova |
|---|---|---|
| Source | gravitational (disk dump) | thermonuclear (surface runaway) |
| Amplitude | 2–5 mag | 8–15 mag |
| Recurrence | weeks–months | 10⁴–10⁵ yr |
| Ejecta | none | 10⁻⁵–10⁻⁴ $M_\odot$ |

**(b)** The disk has two stable thermal states — cool/neutral/low-viscosity and hot/ionised/high-viscosity — with none between. Banking in the cool state raises the surface density until hydrogen ionisation flips the viscosity switch; the hot state drains the reservoir onto the dwarf in weeks; drained, the disk cools and the cycle restarts.

**(c)** The 1901 classical eruption was the surface layer detonating; today's dwarf-nova outbursts are the disk's dumps *delivering fuel* for a future repeat — one system, two mechanisms, operating on their two schedules.

**(d)** $E \sim GMm/R_{\text{wd}} - GMm/R_{\text{disk}} \approx GMm/R_{\text{wd}}$ (the disk term is small): $6.674\times10^{-11} \times 1.989\times10^{30} \times (10^{-9}\times1.989\times10^{30})/6\times10^{6} = 1.327\times10^{20} \times 1.989\times10^{21}/6\times10^{6}$ — cleanly: $GM/R = 2.21\times10^{13}$ J/kg; × $1.989\times10^{21}$ kg $= \mathbf{4.4\times10^{34}\ J}$ — five to six orders below a classical nova's 10⁴⁰ J: tantrums versus detonations.

### 9 — Open problem: the road to 1.4

**(a)** If Type Ia's came mainly from nova-type accretors: the donor star survives the explosion and should sit, oddly moving and oddly heated, near remnant centres — searches in the Galaxy's and Magellanic remnants have come up largely empty. And pre-explosion accretors burning steadily should glow in soft X-rays; galaxy-scale X-ray budgets fall an order of magnitude short of the needed population.

**(b)** Gravitational-wave-driven inspirals of double dwarfs are abundant (Gaia and spectroscopic surveys count them), delay-time distributions fit galaxy demographics, and no survivor is predicted. The open end: hydrodynamic simulations of the merger disagree on outcomes — prompt detonation, delayed detonation, or accretion-induced collapse to a neutron star — as functions of masses and mass ratio, so the channel's Ia efficiency remains model-soft.

**(c)** A measured per-cycle ledger — ejecta mass minus accreted mass, across systems of known dwarf mass and accretion rate — would map where growth is possible. Hard because ejecta masses come from model-dependent shell spectroscopy (clumping, filling factors), accreted masses from uncertain quiescent-rate histories over unobserved 10⁴-yr cycles, and dwarf masses from binary solutions with their own errors: every ledger line is inferred, none weighed.

**(d)** (1) Pre- and post-eruption **mass accounting** on a known near-limit dwarf: high-cadence spectroscopy of the 2020s eruption's ejecta mass versus the accretion measured since 1946 — a direct single-system ledger entry. (2) **Post-eruption orbital timing**: a period change measures the mass ejected versus retained gravitationally, independent of spectroscopy. Agreement (or not) between the two would calibrate the whole method.

**(e)** If the SD/DD mix shifts with redshift (younger universe: different binary demographics), then the standardised candle's calibration drifts with lookback time — mimicking or masking cosmological signals at the percent level. The dark-energy equation of state and the local-versus-early Hubble discrepancy are both argued at exactly that precision: the ledger of stolen mass on dead stars is, uncomfortably, a term in cosmology's error budget.$astroNovae_master$,
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
