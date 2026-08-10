-- Astronomy & Space · The Milky Way — Galactic Anatomy —
-- "The Halo". Curated master for
-- astronomy-and-space/milky-way/galactic-anatomy/the-halo
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (Galactic Anatomy block), so this
-- change is content-only: no seed edit rides with it.
--
-- Everything outside the disk and bulge, in four superimposed
-- components: the stellar halo (a thousandth of the Galaxy's mass but
-- the whole of its early history), the globular clusters, the hot
-- coronal gas, and the dark matter halo that outweighs all the rest a
-- hundredfold. The stellar halo's properties as the fossil record -
-- ancient, metal-poor, non-rotating, radially anisotropic; globular
-- clusters as chronometers, with omega Centauri as a stripped dwarf
-- nucleus and the multiple-population problem still open; the ELS
-- monolithic-collapse versus Searle-Zinn accretion debate and its
-- both-are-right resolution; Gaia-Enceladus, the last major merger,
-- recovered in 2018 from a radially anisotropic sausage in velocity
-- space and distinguished chemically from in-situ stars, supplying
-- half the stellar halo and heating the proto-disk into the thick
-- disk; tidal streams as a crime scene and as scales that weigh the
-- potential, with GD-1's gaps as a possible dynamical detection of
-- dark subhalos; the dark halo's mass, extent, shape, and local
-- density; and the hot corona holding the galaxy's missing baryons.
-- ~10,000 words, checkpoint at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/galactic-anatomy/the-halo',
    'research',
    'advanced',
    'read',
    $mwHalo_master$> The **galactic halo** is the vast, roughly spherical region surrounding the Milky Way's disk and bulge. It contains four superimposed components: a sparse population of ancient metal-poor **stars**, some 160 **globular clusters**, a tenuous **corona of million-degree gas**, and — outweighing everything else in the Galaxy by a factor of roughly a hundred — the **dark matter halo**, which extends to at least 280 kiloparsecs and supplies most of the gravity holding the whole system together.

The previous two chapters described structures made of ordinary matter doing ordinary things: a disk built by dissipation, a bulge built by instability. The halo is different in kind. Its stellar content amounts to about **1 per cent** of the Galaxy's stars — a rounding error in any luminosity budget — and yet it carries information out of all proportion to its mass, because its stars are the **oldest objects in the Galaxy** and they have never been reprocessed. Their compositions record conditions from before the disk existed. Their orbits, which take gigayears to complete, still preserve the memory of the collisions that put them there.

And beneath them lies the component that matters dynamically. Every measurement of the Galaxy's mass, made at every radius by every technique, returns more than the visible matter can account for, by a margin that grows with distance. The halo is where that missing mass lives.

This chapter treats the halo as what it actually is: a **fossil record**, an **archaeological site**, and a **scale**. It is the part of the Galaxy that remembers.

## Four halos, superimposed

The word "halo" covers four distinct things that occupy the same volume. Distinguishing them at the outset prevents most of the confusion the subject generates.

| Component | Mass | Extent | Character |
| --- | --- | --- | --- |
| **Stellar halo** | ~10⁹ $M_\odot$ | ~100+ kpc | Old, metal-poor, pressure-supported field stars |
| **Globular clusters** | ~5 × 10⁷ $M_\odot$ | ~100 kpc | ~160 dense ancient clusters |
| **Hot corona** | ~10¹⁰ $M_\odot$ | ~250 kpc | Diffuse gas at ~2 × 10⁶ K |
| **Dark halo** | ~1.3 × 10¹² $M_\odot$ | ~280 kpc | Non-luminous, dominates the gravity |

The proportions are worth pausing on. The stellar halo contains about **2.5%** of the disk's stellar mass — take every star outside the disk and bulge, and the sum is a fortieth of the disk alone. Yet the dark halo outweighs *all* the Galaxy's stars by a factor near thirty, and the hot corona may hold as much ordinary matter as the disk's stars do. **The luminous Milky Way — the thing in every photograph — is a minority constituent of its own galaxy**, a bright condensation at the centre of a far larger and almost entirely invisible structure.

## The stellar halo: old, poor, and unrotating

The stellar halo's field stars announce themselves by three properties, each of which distinguishes them cleanly from disk stars.

**They are metal-poor.** Typical halo stars have [Fe/H] ≈ −1.6 — about 2.5% of solar iron abundance — with a tail extending to the most metal-poor stars known, below [Fe/H] = −5, where the iron content falls to a hundred-thousandth of solar. Following the Nucleosynthesis chapter's logic, such compositions belong to gas that had been enriched by only a handful of supernovae. These stars formed before the Galaxy had processed much of anything.

**They are old.** Halo ages cluster at 12–13 Gyr, within a gigayear or so of the universe's own age. The halo finished forming before the disk began.

**They do not rotate.** This is the sharpest discriminator. Disk stars share a common circular motion of ~235 km/s; halo stars, on average, have essentially **zero net rotation** (some outer-halo populations even show a slight retrograde drift). Instead they move on **plunging, eccentric orbits** with large random velocities — a velocity dispersion near 160 km/s radially against ~90 km/s tangentially. The resulting **anisotropy parameter** $\beta = 1 - \sigma_t^2/\sigma_r^2 \approx 0.7$ describes a population dominated by radial motion: halo stars fall in toward the centre, whip through, and climb back out. The Sun and its neighbours are all travelling together at 235 km/s; a halo star passing through the solar neighbourhood therefore appears as a **high-velocity star**, moving at hundreds of km/s relative to everything around it. It is not moving fast in any absolute sense — it is nearly stationary, and the disk is moving fast past it.

The stellar halo's density falls off steeply, roughly as $\rho \propto r^{-3}$, so most of its stars lie within ~20 kpc even though individual members are found beyond 100 kpc. Its tracers of choice are **RR Lyrae variables** and **blue horizontal-branch stars** — both old, both standard candles, both bright enough to be found across the halo's full extent. An RR Lyrae star at 100 kpc has an apparent magnitude near 20.6: faint, but well within reach of survey telescopes, which is why the halo's three-dimensional structure is mapped considerably better than the far side of the disk despite being far less massive.

```checkpoint
q: A star passing through the solar neighbourhood at 300 km/s relative to the Sun is most likely
a: a young disk star that has been gravitationally slingshot by a passing cloud
a: a runaway star ejected from a binary by a supernova
a*: a halo star on a plunging eccentric orbit with little net rotation — nearly at rest with respect to the Galaxy, while the Sun and the whole disk sweep past it at 235 km/s
a: a star bound to the Galactic centre's black hole on a wide orbit
hint: The disk is the thing that is moving. What does an object with no net rotation look like from inside a rotating frame?
why: Halo stars have essentially zero mean rotation and large random velocities, moving radially in and out rather than circling. Since the Sun and its neighbours all orbit together at 235 km/s, an unrotating halo star appears to rush past at comparable speed — its "high velocity" is the disk's motion, seen from the wrong reference frame. Such stars are also metal-poor and ancient, which is how they are confirmed.
```

```checkpoint
q: Halo stars reaching [Fe/H] = −4 or below are significant because such compositions
a: prove that the Big Bang produced small quantities of iron
a*: belong to gas enriched by only a handful of supernovae, so these stars carry a near-direct record of the yields of the universe's first stellar generation
a: indicate the stars have lost their outer layers to a companion
a: show the stars formed outside the Milky Way entirely
hint: If solar iron represents billions of years of accumulated enrichment, what does a hundred-thousandth of that amount represent?
why: At [Fe/H] = −4 or −5 the gas had seen almost no enrichment — the abundance pattern approximates the yield table of one or a few early supernovae, as the Nucleosynthesis chapter's stellar archaeology described. Because low-mass stars outlive the universe, these objects still shine today with their birth composition intact in their outer layers, making the halo the only place the first stellar generation's chemical output can be read directly.
```

## Globular clusters: the Galaxy's chronometers

Some 160 **globular clusters** orbit in the halo — gravitationally bound swarms of 10⁵ to 10⁶ stars packed into a few tens of parsecs, so dense at their centres that the night sky from within one would hold thousands of stars brighter than Sirius. They have served galactic astronomy in more roles than any other class of object.

**As distance markers**, they gave Shapley the Galaxy's centre and the Sun's displacement from it (the previous chapter's story). **As chronometers**, they provided the first ages for anything in the universe: because all a cluster's stars formed together, the main-sequence turnoff in its colour–magnitude diagram dates the whole population at once, and the resulting 12–13 Gyr ages made globular clusters the oldest known objects and set a hard lower bound on the age of the universe. For a period in the 1990s the best cluster ages exceeded the best estimates of the universe's age — an outright contradiction, resolved when the *Hipparcos* satellite's improved parallaxes revised the cluster distance scale and the discovery of cosmic acceleration revised the cosmic age upward. It is a useful precedent for reading present-day tensions between independently measured cosmological quantities: such conflicts are real, they are informative, and they have been resolved before by corrections on both sides.

The Milky Way's clusters divide into **two families**. A metal-rich group ([Fe/H] > −0.8) concentrates toward the bulge and inner Galaxy and shows some rotation; a metal-poor group ([Fe/H] < −0.8) occupies the extended halo with little net rotation. The division mirrors the halo's own inner/outer structure and, as the next section argues, its two formation channels.

Two open problems keep the subject active. First, **omega Centauri** — by far the most massive cluster — is not a normal cluster at all: it shows a genuine spread in iron abundance, which no simple cluster should (a single star-forming event cannot produce a range of metallicities), and its orbit is retrograde. The consensus is that it is the surviving **nucleus of a dwarf galaxy** whose outer stars were stripped away by the Milky Way — a captured object rather than a native one. Several other clusters are suspected of the same ancestry.

Second, and more troubling: essentially every globular cluster turns out to host **multiple stellar populations**, distinguishable by light-element abundances — sodium anti-correlated with oxygen, and similar patterns in carbon, nitrogen, aluminium and magnesium. Something enriched a second generation of stars with material processed through hot hydrogen burning, within the cluster, very early. Candidate polluters (massive rotating stars, AGB stars, binaries) each fail some quantitative test, usually a "mass budget" problem: producing enough enriched material requires the cluster to have been vastly more massive initially than it now is. That the simplest stellar populations known — the textbook definition of a single-age, single-composition group — turn out not to be simple is one of the more instructive embarrassments in stellar astrophysics.

```checkpoint
q: Globular clusters can be dated as a whole population — unlike field stars, which must be dated individually and poorly — because
a: they contain only stars of a single mass
a: their stars are close enough together to exchange material and stay synchronised
a*: all their stars formed together from the same gas, so the position of the main-sequence turnoff in one colour–magnitude diagram dates the entire cluster at once
a: their distances are known precisely from parallax
hint: What does a coeval population look like in the colour–magnitude diagram after 12 billion years, and what fixes the turnoff's location?
why: In a coeval population, stars leave the main sequence in strict order of mass, so at any moment the turnoff sits at exactly the mass whose lifetime equals the cluster's age. One diagram therefore yields one age for hundreds of thousands of stars. This gave the first ages for anything in the universe — 12–13 Gyr — and set a hard floor on cosmic age that briefly exceeded the best cosmological estimates in the 1990s, a genuine contradiction resolved by corrections to both the cluster distance scale and the cosmic age.
```

{{image: Omega Centauri | Omega Centauri, the Milky Way's most massive globular cluster — and probably not a cluster at all. Its stars span a genuine range of iron abundance, which no single star-forming event can produce, and its orbit is retrograde. It is most plausibly the surviving nucleus of a dwarf galaxy whose outer stars the Milky Way stripped away: a captured object, and a reminder that the halo is largely assembled from debris.}}

## Two theories, both right

How the halo formed was, for sixteen years, the field's defining argument, and its resolution set the pattern for how galaxy formation is now understood.

**The monolithic collapse.** In 1962, Eggen, Lynden-Bell and Sandage — the paper universally cited as **ELS** — proposed that the Galaxy formed from the rapid collapse of a single vast protogalactic gas cloud. Stars forming early, while the cloud was still falling inward, would be metal-poor and would inherit the collapse's plunging radial orbits; the residual gas, dissipating and settling as the Disk chapter describes, would form the disk later out of enriched material on circular orbits. The model made a sharp, testable prediction: **metallicity should correlate with orbital eccentricity**, since both track when a star formed during the collapse. ELS found exactly that correlation in their sample. The collapse was rapid — a few hundred million years.

**The chaotic accretion.** In 1978, Searle and Zinn examined globular clusters in the *outer* halo and found something the ELS picture forbade: **no radial abundance gradient**, and a spread of ages, with some outer clusters younger than inner ones by a gigayear or more. A single rapid collapse cannot produce a chemically unstructured, age-spread outer halo. Their alternative: the halo was assembled **piecemeal**, from many independent protogalactic fragments that formed stars on their own schedules and were subsequently captured and disrupted. Accretion, not collapse.

The modern resolution is that **both processes operated, in different regions**. The **inner halo** (within ~15–20 kpc) is dominated by stars formed in situ during an early dissipative collapse, plus the debris of the largest early mergers — flattened, with some rotation, and following ELS-like correlations. The **outer halo** is dominated by accreted debris from many smaller systems — rounder, unrotating or slightly retrograde, chemically heterogeneous, exactly Searle–Zinn. The Galaxy did both, and the halo's two-component structure is the record of the division.

This resolution generalised into the standard cosmological picture: galaxies grow **hierarchically**, small systems merging into larger ones, with in-situ star formation proceeding alongside. The halo is where the merger debris ends up, because material accreted onto a large system on random orbits has no mechanism to settle into a plane — it lacks the coherent angular momentum that made the disk, and, being stars rather than gas, it cannot dissipate its way into one either. **The halo is round because debris cannot flatten.**

```checkpoint
q: The ELS monolithic-collapse and Searle–Zinn accretion models of halo formation were reconciled by recognising that
a: ELS was correct and Searle–Zinn's outer-cluster ages were measurement errors
a: neither applies — the halo formed from gas expelled by the disk
a*: both operated in different regions — the inner halo formed largely in situ during an early dissipative collapse, while the outer halo was assembled from the debris of many accreted systems
a: the two describe the same process at different times in the same place
hint: What did Searle and Zinn find in the outer halo that a single rapid collapse cannot produce — and does that argument constrain the inner halo too?
why: ELS's metallicity–eccentricity correlation genuinely describes stars formed during an early collapse, which dominate the inner halo. Searle and Zinn's outer clusters showed no abundance gradient and a spread of ages, which only independent fragments forming on their own schedules can produce. The halo has both because the Galaxy did both — and the resolution became the template for hierarchical galaxy formation, in which accreted debris ends up in the halo precisely because stars on random orbits cannot dissipate into a plane.
```

## Gaia-Enceladus: recovering the last major merger

The abstract statement "the halo was partly accreted" became a specific historical event in 2018, in one of the most striking results of the *Gaia* era.

With parallaxes and proper motions for nearly two billion stars, plus chemical abundances from spectroscopic surveys, it became possible to plot nearby halo stars in **velocity space** — radial velocity against rotational velocity — and ask whether they form a smooth distribution. They do not. A very large fraction of them occupy a distinct structure: strongly elongated along the radial-velocity axis and centred on zero rotation, an elongated blob promptly nicknamed **the Sausage**. These stars are on extremely radial orbits, plunging in and out through the inner Galaxy.

Two arguments established that this is debris rather than a native population. First, **chemistry**. At any given iron abundance, Sausage stars have *lower* [α/Fe] than in-situ halo stars. By the Nucleosynthesis chapter's clock, that marks slower, more prolonged enrichment — the signature of a **smaller galaxy**, where a lower star-formation rate lets Type Ia iron accumulate before the alpha elements have built up as far. The stars are chemically foreign. Second, **coherence**: a population sharing distinctive orbits *and* distinctive chemistry is a single accreted system, not a coincidence.

The reconstruction, now called **Gaia-Enceladus** (also Gaia-Sausage-Enceladus), runs as follows. Roughly **8–11 Gyr ago**, a dwarf galaxy of a few times 10⁸ to 10⁹ solar masses in stars — perhaps a quarter of the then-Milky Way — fell in on a radial orbit and was destroyed. Its stars were spread through the inner halo, where they remain on the radial orbits their infall gave them, and they constitute **roughly half of the stellar halo's mass**. The collision's effects went further: the impact appears to have **dynamically heated the pre-existing thin disk**, puffing it into what is now observed as the **thick disk** — the component the Disk chapter described as old, alpha-enhanced, and vertically extended. Two chapters' observations, previously independent, turn out to describe the same event from different angles.

That a merger of this scale could be identified, dated, and mass-weighted from the present-day motions of nearby stars is worth appreciating as a methodological achievement. The event finished before Earth existed. The evidence is that a few million stars, scattered through the solar neighbourhood, still move in a way that only a common violent origin explains — because at halo distances the orbital periods are so long that the debris has not yet had time to mix away.

```checkpoint
q: Gaia-Enceladus stars were identified as debris from an accreted dwarf galaxy — rather than native Milky Way stars — chiefly because
a: they are much younger than other halo stars
a: they orbit in the opposite direction to the disk
a*: they combine distinctive radial orbits with distinctive chemistry — lower [α/Fe] at a given iron abundance, the signature of slower enrichment in a smaller galaxy
a: they lie much farther from the Galactic centre than other halo stars
hint: Orbits alone could be coincidence. What second, independent property showed these stars were manufactured somewhere else?
why: The velocity-space "Sausage" — a population on strongly radial orbits with no net rotation — could conceivably arise in situ. What settles it is chemistry: at fixed [Fe/H] these stars are alpha-poor, indicating slower star formation that let Type Ia iron accumulate, which is characteristic of a smaller galaxy. Orbits plus composition together identify a single accreted system: a dwarf of ~10⁹ M☉ destroyed 8–11 Gyr ago, supplying about half the stellar halo and heating the old disk into the thick disk.
```

## Streams: the halo as a crime scene

Gaia-Enceladus is an old merger whose debris has largely mixed. Halo accretion is also observable **in progress**, and the objects that record it are **tidal streams**.

When a satellite — a dwarf galaxy or a globular cluster — orbits the Milky Way, tides strip stars from its outskirts. Stripped stars leave with slightly more or slightly less orbital energy than the parent, so they drift ahead of or behind it, and over many orbits they draw out into a long thin ribbon following the satellite's path. Dozens of such streams are now mapped.

**The Sagittarius stream** is the spectacular case. The Sagittarius dwarf galaxy, discovered in 1994 on the far side of the Galactic centre, is being torn apart, and its debris wraps **entirely around the sky** — several complete loops of stellar material threading the halo. Its passages through the disk are, as the Disk chapter noted, the leading suspect for the vertical perturbation that set the disk ringing.

**Globular-cluster streams** are thinner and more useful for precision work. Palomar 5 trails tails tens of degrees long; **GD-1** is a narrow ribbon some 100° across the sky, only a few hundred parsecs wide — a stream so cold and thin that anything disturbing it leaves a visible mark.

Streams are not merely evidence of accretion. They are **instruments**, and this is why the field cares about them so much:

**Streams weigh the Galaxy.** Stream stars trace the orbit of their progenitor, so a stream's shape and velocities constrain the gravitational potential through which it moves — at radii where no other tracer exists. This is how the halo's mass profile is measured beyond the disk's edge.

**Streams measure the halo's shape.** A stream in a spherical potential precesses differently than one in a flattened potential, so stream geometry constrains whether the dark halo is round, oblate, or triaxial. Current evidence favours nearly spherical in the inner regions.

**And streams may detect dark matter directly — dynamically.** Cold dark matter theory predicts that the halo should contain thousands of **dark subhalos**: clumps of dark matter, most too small to have formed stars, and therefore invisible by any electromagnetic means. If such a clump passes through a thin stream, its gravity should scatter stream stars, leaving a **gap** and an associated off-track "spur" of displaced stars. GD-1 shows exactly such features. Whether they are subhalo impacts, or the work of known perturbers such as giant molecular clouds and the bar, is actively contested — but the technique is real, and it represents one of the few ways to detect dark matter structure through its gravity alone, without any assumption about what the particles are.

```checkpoint
q: Thin stellar streams such as GD-1 are valuable for dark-matter research because
a: they are made of dark matter that has been made visible by tidal forces
a: they mark the boundary of the dark-matter halo
a*: a dark subhalo passing through a cold, narrow stream would gravitationally scatter its stars, leaving a detectable gap — a way to find invisible clumps through their gravity alone
a: their stars are moving fast enough to escape the dark halo, measuring its depth
hint: The predicted clumps contain no stars at all. What observable trace could something entirely invisible still leave on a delicate structure?
why: Cold dark matter predicts thousands of starless subhalos, undetectable electromagnetically. A stream a few hundred parsecs wide is delicate enough that a passing clump's gravity would visibly scatter its stars, producing gaps and off-track spurs — features GD-1 displays. Whether these particular gaps come from subhalos or from known perturbers like molecular clouds and the bar is contested, but the method detects mass structure without assuming anything about the particles' nature.
```

## The dark halo

Underlying all of the above is the component that supplies most of the Galaxy's gravity, and the halo is where its case is made most plainly.

Take the enclosed mass implied by tracers at increasing radius — satellites, streams, distant halo stars — using $M = v^2R/G$:

| Radius | Tracer velocity | Enclosed mass |
| --- | --- | --- |
| 20 kpc | ~210 km/s | 2.1 × 10¹¹ $M_\odot$ |
| 50 kpc | ~190 km/s | 4.2 × 10¹¹ $M_\odot$ |
| 100 kpc | ~175 km/s | 7.1 × 10¹¹ $M_\odot$ |

The enclosed mass **keeps rising** far beyond where the stars end. Between 20 and 100 kpc the Galaxy acquires another 5 × 10¹¹ solar masses while adding essentially no light — the stellar halo's entire content over that range is a fraction of a per cent of it. Nor does the velocity fall as $R^{-1/2}$, which is what orbits around a finite central mass would require. The mass distribution simply continues.

The resulting picture: a dark halo of roughly **1.3 × 10¹² solar masses** extending to a virial radius near **280 kpc** — some twenty times the disk's radius, and far enough that the Milky Way's and Andromeda's dark halos may already be in contact. Its density profile is consistent with the form predicted by cosmological simulations of cold dark matter (rising steeply toward the centre, falling as $r^{-3}$ outside a characteristic radius), and its shape is close to spherical in the inner regions. The **local dark-matter density** at the Sun's position is about 0.01 $M_\odot$ pc⁻³, more usefully expressed as **~0.4 GeV cm⁻³** — the number every direct-detection experiment depends on, since it fixes the flux of dark-matter particles through a terrestrial detector. For a hypothetical 100 GeV particle that is roughly 4,000 per cubic metre, streaming through Earth at ~230 km/s: about **10⁹ per square metre per second**, passing through every detector, every experimenter, and every reader, essentially all of them without interacting.

```checkpoint
q: Between 20 and 100 kpc the Galaxy's enclosed mass rises from ~2×10¹¹ to ~7×10¹¹ M☉ while the tracer velocities barely decline. Orbits around a finite central mass would instead require velocity to fall as
a: R⁻¹, in proportion to radius
a*: R^(−1/2) — the Keplerian falloff, which is not observed; the near-constant velocities mean mass keeps being enclosed at radii where there is essentially no light
a: R², rising with radius
a: a constant value, exactly as observed
hint: What does Kepler's third law give for orbital speed outside all the mass — and what does the failure of that prediction imply about where the mass ends?
why: Outside a finite mass, v = √(GM/R) declines as R^(−1/2). The observed near-flat velocities to 100 kpc require M to keep growing roughly in proportion to R — another 5×10¹¹ M☉ added across a region whose entire stellar content is a fraction of a per cent of that. Mass rising while light does not is the dark-matter argument in its simplest and most direct form.
```

The physical interpretation of this mass — what it is made of, and the possibility that the gravity law rather than the mass census is at fault — belongs to the Galactic Dynamics block's rotation-curve and missing-mass chapters. What the halo establishes is the *geometry*: whatever supplies the extra gravity is distributed in a vast, roughly spherical, non-dissipative structure, quite unlike the flattened disk of ordinary matter it contains. Something that cannot cool into a disk is exactly what a collisionless, non-radiating substance would look like.

{{image: Dark matter halo | A simulated dark-matter halo. Structures like this — roughly spherical, far larger than the luminous galaxy inside them, and studded with thousands of smaller subhalos — are the standard prediction of cold dark matter cosmology. The Milky Way's extends to ~280 kpc and outweighs every star, gas cloud, and planet in the Galaxy by a factor near thirty.}}

## The corona, and the missing baryons

One further halo component was long predicted and only recently confirmed: a **hot gaseous corona** filling the dark halo's volume.

Its existence follows from simple thermodynamics. Gas falling into a potential well as deep as the Milky Way's is shock-heated to the **virial temperature** — for this Galaxy, a few million kelvin. At that temperature hydrogen is fully ionised and radiates inefficiently, so the gas cannot cool and settle; it sits there, diffuse and enormous, for cosmological times.

Detecting it is difficult precisely because it is so tenuous. The evidence comes chiefly from **absorption**: sight-lines toward distant quasars and X-ray sources show absorption in highly ionised oxygen (O VII and O VIII), tracing gas at ~2 × 10⁶ K along paths through the halo, together with X-ray emission measurements and the observation that satellite galaxies falling into the halo are being **stripped of their own gas** — which requires a medium to strip against.

The corona's importance runs beyond bookkeeping, though the bookkeeping matters. The cosmic ratio of ordinary matter to dark matter is known precisely from cosmology; applying it to the Milky Way's dark halo predicts far more ordinary matter than the disk's stars and gas contain. A substantial part of this **missing baryon** shortfall appears to sit in the corona, which may hold as much ordinary mass as all the disk's stars. The corona is also the disk's **fuel reserve**: the Galaxy forms stars at 1–2 $M_\odot$ per year and would exhaust its cold gas in a couple of gigayears without resupply, so continued star formation requires accretion from the halo. The corona is where the next several billion years of the Milky Way's stars are currently stored.

```checkpoint
q: The hot coronal gas filling the halo sits at ~2 million kelvin and stays there for cosmological times because
a: it is continuously reheated by supernovae in the disk
a*: gas falling into the Galaxy's potential well is shock-heated to the virial temperature, and at that temperature hydrogen is fully ionised and radiates inefficiently — so it cannot cool and settle
a: the dark matter halo transfers energy to it directly
a: it is too far from the disk for gravity to act on it
hint: What temperature does infalling gas reach in a well this deep — and what happens to a gas's ability to radiate once its atoms have lost their electrons?
why: Infall converts gravitational energy into heat, setting the virial temperature — a few million K for the Milky Way. Fully ionised hydrogen has no bound-bound transitions to radiate through, so cooling becomes inefficient and the gas persists as a diffuse corona rather than settling into the disk. It is detected mainly in absorption through highly ionised oxygen (O VII, O VIII) toward background sources, it plausibly holds a large share of the Galaxy's missing baryons, and it is the reservoir that must resupply the disk — which would otherwise exhaust its cold gas within a couple of gigayears.
```

## Pulling the thread

- "Halo" names **four superimposed components**: a stellar halo of ~10⁹ $M_\odot$, ~160 globular clusters, a hot corona of ~10¹⁰ $M_\odot$, and a dark halo of ~1.3 × 10¹² $M_\odot$. The luminous Galaxy is a minority constituent of its own system.
- Halo stars are **old, metal-poor, and unrotating**, on radially anisotropic orbits ($\beta \approx 0.7$). "High-velocity stars" near the Sun are nearly stationary objects being passed by the rotating disk.
- **Globular clusters** dated the universe's floor at 12–13 Gyr, split into metal-rich and metal-poor families, include captured dwarf nuclei such as omega Centauri, and all contain unexplained **multiple populations**.
- The **ELS collapse** and **Searle–Zinn accretion** models were both right, for the inner and outer halo respectively — the template for hierarchical galaxy formation. Debris ends up in a round halo because stars on random orbits cannot dissipate into a plane.
- **Gaia-Enceladus**, identified in 2018 from a radially anisotropic structure in velocity space with distinctively alpha-poor chemistry, was a ~10⁹ $M_\odot$ dwarf accreted 8–11 Gyr ago. It supplied about **half the stellar halo** and heated the old disk into the **thick disk**.
- **Tidal streams** record accretion in progress and serve as instruments: they weigh the Galaxy where no other tracer reaches, measure the halo's shape, and — through gaps like GD-1's — may detect **starless dark subhalos** gravitationally.
- Enclosed mass keeps rising to 100 kpc and beyond while the light does not: the **dark halo** reaches ~280 kpc, with a local density of ~0.4 GeV cm⁻³ — some 10⁹ particles per square metre per second through everything on Earth.
- The **hot corona** holds a large share of the Galaxy's missing baryons and is the fuel reserve for its future star formation.

The transferable idea: **the least massive component of a system is often the most informative one.** The stellar halo is a fortieth of the disk and a thousandth of the Galaxy, and it carries nearly the whole of the Milky Way's early history — because it is the only component that has *not* been reprocessed. The disk's stars have been churned, heated, and enriched until their birth conditions are unrecoverable; halo stars have been left alone, and long orbital periods mean their debris has not yet mixed away. The general rule is that memory survives where activity is lowest: the same reason geologists prize the least disturbed strata, that ice cores are drilled where the flow is slowest, and that the deepest information about a system's origins usually lies in whatever part of it has been doing the least since.

## Further reading

{{book: James Binney | Galactic Dynamics | 2008}}

{{book: Sidney van den Bergh | The Galaxies of the Local Group | 2000}}

{{book: Lisa Randall | Dark Matter and the Dinosaurs | 2015}}

Beyond the books: the ELS paper of 1962 and Searle & Zinn's of 1978 are worth reading in sequence as a compact demonstration of how a field changes its mind; the 2018 Gaia-Enceladus discovery papers (Belokurov et al. and Helmi et al.) present the velocity-space "Sausage" in figures that need no explanation; and the GD-1 gap-and-spur analyses show how far a single thin stream can be pushed as a dark-matter probe.

## Problems

*Useful numbers: G = 6.674×10⁻¹¹ N m² kg⁻²; 1 pc = 3.086×10¹⁶ m; M☉ = 1.989×10³⁰ kg; 1 yr = 3.156×10⁷ s; RR Lyrae M_V ≈ +0.6; 1 GeV/c² = 1.783×10⁻²⁷ kg; local dark-matter density ≈ 0.01 M☉ pc⁻³.*

**1.** *(Finding halo stars.)* Compute the apparent magnitude of an RR Lyrae variable at **(a)** 10 kpc, **(b)** 50 kpc, **(c)** 100 kpc. **(d)** Comment on why the halo's three-dimensional structure is mapped better than the far side of the disk despite containing a fortieth as many stars.

**2.** *(The mass that keeps growing.)* Using M = v²R/G, compute the enclosed mass at **(a)** 20 kpc (v = 210 km/s), **(b)** 50 kpc (v = 190 km/s), **(c)** 100 kpc (v = 175 km/s). **(d)** How much mass is added between 20 and 100 kpc, and how does this compare with the ~10⁹ M☉ stellar halo?

**3.** *(Why the debris survives.)* Compute the orbital period at **(a)** 20 kpc, **(b)** 50 kpc, **(c)** 100 kpc, using the velocities above. **(d)** How many orbits has a stream at 100 kpc completed in 10 Gyr, and why does this explain why streams remain visible as coherent structures?

**4.** *(Anisotropy.)* Halo stars have σ_r ≈ 160 km/s and σ_t ≈ 90 km/s. **(a)** Compute β = 1 − σ_t²/σ_r². **(b)** State what β = 0, β = 1, and β < 0 would each mean physically. **(c)** Explain what the measured value implies about how halo stars reached their present orbits.

**5.** *(Dark matter through a detector.)* Take the local dark-matter density as 0.4 GeV cm⁻³ and a candidate particle mass of 100 GeV. **(a)** Compute the number density in particles per cm³ and per m³. **(b)** With a velocity of 230 km/s, compute the flux in particles per m² per second. **(c)** Comment on what this implies about the interaction cross-section, given that no unambiguous detection has been made.

**6.** *(A cluster's grip.)* A globular cluster has M = 10⁵ M☉ and a radius of 10 pc. **(a)** Compute its escape velocity. **(b)** Compare this with the ~160 km/s velocity dispersion of the halo through which it moves, and with the typical velocity a supernova imparts to gas. **(c)** What does the comparison imply about a cluster's ability to retain gas ejected by its own stars — and why does that sharpen the multiple-populations problem?

**7.** *(Converting the density.)* Show that a local dark-matter density of 0.01 M☉ pc⁻³ corresponds to ~0.4 GeV cm⁻³. State one reason this particular number is quoted in nearly every direct-detection paper.

**8.** *(Two chemical clocks.)* Two halo stars have the same [Fe/H] = −1.0, but one has [α/Fe] = +0.35 and the other +0.05. **(a)** Which formed in a more massive, faster-forming system, and why? **(b)** Which is the more likely Gaia-Enceladus member? **(c)** Explain in one sentence why chemistry can identify accreted stars long after their orbits have mixed.

**9.** *(Reading the geometry.)* **(a)** Explain why accreted stellar debris ends up in a roughly spherical halo rather than settling into the disk. **(b)** Explain why gas accreted onto the Galaxy does *not* stay in a halo but joins the disk. **(c)** State what the contrast implies about whether dark matter can dissipate energy.

## Worked answers

**1.** Using $m = M + 5\log_{10}(d/10\ \text{pc})$: **(a)** $0.6 + 5\log_{10}(10^{3}) = 0.6 + 15 = \mathbf{15.6}$. **(b)** $0.6 + 5\log_{10}(5\times10^{3}) = 0.6 + 18.5 = \mathbf{19.1}$. **(c)** $0.6 + 5\log_{10}(10^{4}) = 0.6 + 20 = \mathbf{20.6}$. **(d)** Because the halo is *out of the plane*, where extinction is negligible — the same advantage that let Shapley's globular clusters succeed where in-plane star counts failed. A 20th-magnitude star is routine for survey telescopes; a disk star at the same distance is hidden behind tens of magnitudes of dust. Sparse and clean beats abundant and obscured.

**2.** $M = v^2R/G$, with $R$ in metres: **(a)** $(2.1\times10^{5})^2 \times 6.17\times10^{20}/6.674\times10^{-11} = \mathbf{2.1\times10^{11}\ M_\odot}$. **(b)** $(1.9\times10^{5})^2 \times 1.54\times10^{21}/6.674\times10^{-11} = \mathbf{4.2\times10^{11}\ M_\odot}$. **(c)** $(1.75\times10^{5})^2 \times 3.09\times10^{21}/6.674\times10^{-11} = \mathbf{7.1\times10^{11}\ M_\odot}$. **(d)** An increase of **5 × 10¹¹ M☉** — five hundred times the entire stellar halo's mass, acquired across a region contributing essentially no light. Mass that rises while luminosity does not is the dark-matter argument in its simplest form, and note that the velocities barely decline rather than falling as $R^{-1/2}$, which a finite central mass would require.

**3.** $T = 2\pi R/v$: **(a)** $2\pi(6.17\times10^{20})/2.1\times10^{5} = 1.85\times10^{16}$ s $= \mathbf{0.59\ Gyr}$. **(b)** $\mathbf{1.6\ Gyr}$. **(c)** $\mathbf{3.5\ Gyr}$. **(d)** In 10 Gyr a stream at 100 kpc completes only **2.8 orbits**. Phase mixing — the process that smears debris into a smooth distribution — requires many orbits, so at these radii the debris has had nowhere near enough time to disperse. That is precisely why streams remain thin and identifiable, and why the outer halo preserves a legible accretion history while the inner Galaxy, with periods of a few hundred Myr, has mixed its early debris away.

**4.** **(a)** $\beta = 1 - (90/160)^2 = 1 - 0.316 = \mathbf{0.68}$. **(b)** $\beta = 0$ means isotropic motion (equal random velocities in all directions); $\beta = 1$ means purely radial orbits, stars falling straight in and out; $\beta < 0$ means tangentially biased, stars preferring circular paths. **(c)** A value near 0.7 is strongly radially biased, exactly what infalling debris produces: material accreted on plunging orbits keeps plunging, since nothing circularises collisionless stars. It is a direct kinematic fingerprint of accretion, and it is why the Gaia-Enceladus "Sausage" appears elongated along the radial axis in velocity space.

**5.** **(a)** $n = 0.4/100 = \mathbf{0.004\ cm^{-3}} = \mathbf{4{,}000\ m^{-3}}$. **(b)** Flux $= nv = 0.004\ \text{cm}^{-3} \times 2.3\times10^{7}\ \text{cm/s} = 9.2\times10^{4}$ cm⁻² s⁻¹ $= \mathbf{9.2\times10^{8}\ m^{-2}\,s^{-1}}$ — nearly a billion particles per square metre per second through every detector and every person. **(c)** With a flux that large and no confirmed detection despite decades of increasingly sensitive experiments, the interaction cross-section with ordinary matter must be extraordinarily small — which is the entire experimental difficulty, and why the field has pushed toward ever larger, deeper, and quieter detectors.

**6.** **(a)** $v_{\text{esc}} = \sqrt{2GM/R} = \sqrt{2 \times 6.674\times10^{-11} \times 1.989\times10^{35}/(3.086\times10^{17})} = \mathbf{9.3\ km/s}$. **(b)** Trivial next to the halo's 160 km/s dispersion, and far below the hundreds to thousands of km/s at which supernova ejecta and massive-star winds travel. **(c)** A cluster cannot retain gas that its own supernovae expel — the ejecta escape easily. This sharpens the multiple-populations problem considerably: the polluting material that enriched the second generation must have been ejected *slowly* (slow winds from AGB stars or rotating massive stars rather than supernovae), and the cluster must have been far more massive initially to have retained enough of it. The mass-budget difficulty this creates is the central obstacle in every proposed solution.

**7.** $0.01\ M_\odot\,\text{pc}^{-3} = 0.01 \times 1.989\times10^{30}\ \text{kg}/(3.086\times10^{16}\ \text{m})^3 = 1.989\times10^{28}/2.939\times10^{49} = 6.77\times10^{-22}$ kg m⁻³. Dividing by 1.783×10⁻²⁷ kg per GeV/c² gives $3.8\times10^{5}$ GeV m⁻³ $= \mathbf{0.38\ GeV\,cm^{-3}}$. It is quoted universally because a direct-detection experiment's expected event rate scales **linearly** with it: every published exclusion limit on the interaction cross-section is really a limit on the product of cross-section and local density, so the uncertainty in this one astronomical number propagates directly into every particle-physics constraint.

**8.** **(a)** The star with **[α/Fe] = +0.35**. High alpha-enhancement means star formation was rapid enough that core-collapse supernovae dominated enrichment before Type Ia iron arrived — characteristic of a massive system forming stars vigorously. The alpha-poor star's gas had time to accumulate Ia iron before reaching the same [Fe/H], indicating slower formation in a smaller system. **(b)** The **[α/Fe] = +0.05** star, whose alpha-poor composition is the Gaia-Enceladus signature. **(c)** Because a star's surface composition is fixed at birth and is not altered by anything its orbit subsequently does — chemistry is a permanent tag, whereas kinematics are gradually erased by mixing, which is why "chemical tagging" can identify accreted populations long after their orbital coherence has faded.

**9.** **(a)** Stars are collisionless: debris arriving on random orbits has no way to shed energy, so it cannot sink toward a plane and simply retains its original orbital distribution, which is roughly isotropic. **(b)** Gas is collisional: infalling gas shocks, radiates away its energy, and — being unable to shed angular momentum — settles into the minimum-energy configuration at fixed angular momentum, which is the disk (the Disk chapter's central argument). **(c)** That the dark halo remains extended and roughly spherical, rather than having collapsed into a dark disk over billions of years, is strong evidence that **dark matter cannot dissipate energy** — it is collisionless and non-radiating, which is a genuine physical constraint on its nature derived from geometry alone.$mwHalo_master$,
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
