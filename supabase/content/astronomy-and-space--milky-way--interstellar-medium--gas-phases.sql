-- Astronomy & Space · The Milky Way — Interstellar Medium —
-- "Gas Phases". Curated master for
-- astronomy-and-space/milky-way/interstellar-medium/gas-phases
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Taxonomy node already exists; the sibling Cosmic Rays and Magnetic
-- Fields node added alongside this batch rides in seed.sql.
--
-- Why the space between the stars is not one substance but several,
-- coexisting: Hartmann's 1904 stationary calcium lines as the discovery;
-- the emptiness quantified against the best laboratory vacuum; thermal
-- instability as the reason phases exist at all - the Field criterion,
-- and the fact that cold and warm neutral gas sit at the SAME pressure
-- with a hundredfold density contrast, exactly as water and vapour
-- coexist; the five-phase catalogue with the volume/mass inversion that
-- makes the hottest phase fill space and the coldest hold the mass; how
-- each phase is observed, including the 21 cm emission/absorption
-- separation by spin temperature and pulsar dispersion measures
-- inherited from the Pulsars chapter; the energy-density equipartition
-- that shows thermal pressure is only a fifth of the story; the
-- McKee-Ostriker three-phase model and the modern turbulent,
-- supernova-regulated picture that replaced its equilibrium; and where
-- the phases sit vertically, up to the galactic fountain.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/interstellar-medium/gas-phases',
    'research',
    'advanced',
    'read',
    $mwGasPhases_master$> The **interstellar medium** is the gas filling the space between the stars — roughly 10¹⁰ solar masses in the Milky Way, about a sixth of the disk's baryonic mass. It exists not as a single substance but as several distinct **phases** that coexist at similar pressures while differing in temperature and density by factors of up to a hundred thousand: cold molecular clouds, cool and warm neutral hydrogen, warm ionised gas, and a million-degree tenuous plasma blown by supernovae.

The space between the stars looks empty, and by any laboratory standard it is: a typical cubic centimetre of the Galaxy's disk contains about one atom. The best vacuum achievable in a terrestrial laboratory — 10⁻¹² torr, requiring cryogenic pumping and weeks of baking — still holds some **thirty thousand** particles per cubic centimetre. The cool interstellar gas is roughly a thousand times emptier than the emptiest volume ever manufactured on Earth, and the hot phase is emptier still by another four orders of magnitude.

And yet this near-vacuum is where everything happens. It is the material stars form from and the material they return; it carries the elements manufactured in the Nucleosynthesis chapter from the objects that made them to the objects that will use them; it is opaque enough to have concealed the Galaxy's structure from astronomers for a century and a half; and its behaviour governs how fast a galaxy converts gas into stars, which is to say how galaxies evolve at all.

This chapter is about the single most surprising fact concerning it: **the interstellar medium is not one thing.** It separates, spontaneously and stably, into phases that sit side by side — and the reason it does so is a piece of physics that also explains fog, clouds, and the coexistence of water with its own vapour.

## Discovering something in the way

The medium announced itself in 1904, in an observation whose logic is worth following because it is a model of inference from a single anomaly.

**Johannes Hartmann** was observing **delta Orionis**, a spectroscopic binary — two stars orbiting each other, whose spectral lines shift back and forth with the orbital period as first one star and then the other approaches. Every line in the spectrum should participate in that oscillation, because every line originates in the moving stars.

One did not. A pair of **calcium** absorption lines sat perfectly still while everything around them swung. Hartmann called them "stationary" lines, and drew the conclusion: **they are not formed in the stars at all.** Something else lies along the line of sight — a cloud of calcium-bearing gas, between Earth and delta Orionis, not participating in the binary's motion because it has nothing to do with the binary.

This was the first detection of the interstellar medium, and note its structure: not a new instrument, not a survey, but one component of a spectrum failing to do what everything else did. Over subsequent decades the same technique — absorption lines imprinted on background starlight — became the workhorse of interstellar studies, since a bright star behind a cloud is a free backlight, and the cloud writes its composition, temperature, velocity, and column density onto the passing spectrum.

```checkpoint
q: Hartmann concluded in 1904 that the "stationary" calcium lines in delta Orionis were formed outside the star system because they
a: were much stronger than calcium lines usually are in stellar spectra
x: Line strength alone says nothing about location — a strong line could simply mean abundant calcium in the star's atmosphere. What mattered was not how deep the lines were but how they behaved over time.
a: appeared only at certain times of year
x: That would suggest something associated with Earth's orbital motion, not with the interstellar medium. The lines were present continuously; it was their lack of motion, not their intermittency, that was diagnostic.
a*: did not Doppler-shift with the binary's orbital motion, while every other line in the spectrum did
a: had wavelengths that matched no known element
x: The wavelengths matched calcium perfectly well — identification was not the puzzle. The puzzle was that this particular absorber refused to move with the stars producing all the other lines.
hint: In a spectroscopic binary every line originates in moving stars. What does it mean if one line refuses to move?
why: Lines formed in an orbiting star must share that star's motion. A line that stays fixed while the rest oscillate cannot originate there, so it must be imprinted by material somewhere along the line of sight — a cloud between Earth and delta Orionis. One component behaving differently from all the others located a whole new constituent of the Galaxy.
---
q: Absorption-line spectroscopy against background stars became the workhorse technique for studying interstellar gas because a background star provides
a: enough heat to excite the cloud into emitting its own spectrum
x: The technique does not rely on heating the cloud at all — it works precisely because the cloud is cold and simply removes light at particular wavelengths. Emission and absorption studies are complementary, but this is the latter.
a: a gravitational lens that magnifies the intervening material
x: Lensing requires a foreground mass and a more distant source, and it magnifies images rather than revealing composition. Here the star is the more distant object and the cloud is merely in the way.
a*: a free backlight, onto which the intervening cloud writes its composition, velocity, temperature, and column density
a: a reference point for measuring the cloud's distance by parallax
x: Parallax measures distances to the star itself, not to intervening gas — indeed, distances to individual clouds remain one of the hardest quantities in the subject, usually bracketed by comparing stars at known distances that do and do not show the absorption.
hint: What does cold gas do to light that passes through it, and what does the resulting pattern encode?
why: Cold gas absorbs at characteristic wavelengths, so a bright background source lets the cloud imprint its own signature on the spectrum: which elements and molecules are present, in what quantity along the line of sight, at what velocity, and at what temperature. The star supplies photons and asks nothing in return, which is why sightline absorption remains central a century later.
```

## The emptiness, quantified

Some numbers, because the medium's extremity is easy to state and hard to feel.

| Quantity | Value |
| --- | --- |
| Mean density in the disk | ~1 atom cm⁻³ |
| Total ISM mass | ~10¹⁰ $M_\odot$ (~15–20% of disk baryons) |
| Composition by mass | ~70% hydrogen, ~28% helium, ~2% heavier + dust |
| Typical thermal pressure $P/k$ | ~3,000 K cm⁻³ |
| Best laboratory vacuum | ~3 × 10⁴ cm⁻³ |
| Mean free path in cool gas | ~2 AU |
| Time between collisions (cool gas) | ~10 years |

The mean free path deserves a moment. In the cool neutral medium, an atom travels roughly **two astronomical units** — twice the Earth–Sun distance — between collisions, and waits about **ten years** for each one. By any laboratory standard this is not a fluid at all. Yet on galactic scales it behaves as one, because the relevant comparison is not the mean free path against a laboratory apparatus but against the *system*: two AU is a ten-billionth of the distance across a molecular cloud. A gas whose particles collide even that rarely still shares pressure, supports sound waves, and shocks — provided one waits long enough and looks at large enough scales. The lesson recurs throughout astrophysics: **whether a medium is "collisional" is a statement about the ratio of two lengths, not about a density.**

## Why there are phases at all

Here is the chapter's central physics, and it is genuinely surprising the first time it is met.

Gas in the interstellar medium is **heated** — chiefly by photoelectrons knocked off dust grains by starlight, plus cosmic rays and shocks — and it **cools**, chiefly by emitting radiation in atomic and molecular lines that then escapes. In equilibrium, heating balances cooling, and that balance sets the temperature.

The complication is that the cooling rate is a strongly non-monotonic function of temperature. Different coolants switch on and off at different temperatures: fine-structure lines of carbon and oxygen at tens to hundreds of kelvin, hydrogen's Lyman-alpha transition explosively above ~8,000 K, metal lines in the hot regime. The **net** heating-minus-cooling curve therefore has structure — and the consequence, worked out by **George Field** in 1965, is that the medium can be **thermally unstable**.

The argument runs as follows. Take a parcel of gas in pressure equilibrium with its surroundings, and perturb it slightly cooler. It contracts to stay in pressure balance, becoming denser. Now: does it cool *more* efficiently at higher density and lower temperature? If yes, it cools further, contracts further, and runs away — the perturbation grows. If no, it returns. The instability condition is a statement about the slope of the cooling function at fixed pressure, and over a range of interstellar conditions the answer is *yes*: the gas runs away.

The consequence is not chaos but **separation**. Gas on the unstable branch does not stay there — it runs to one of the stable branches on either side. And because both stable branches exist at the **same pressure**, they can sit side by side indefinitely. That is exactly what is observed:

| Phase | Temperature | Density | $P/k$ |
| --- | --- | --- | --- |
| **Cold neutral medium (CNM)** | ~80 K | ~30 cm⁻³ | ~2,400 K cm⁻³ |
| **Warm neutral medium (WNM)** | ~8,000 K | ~0.3 cm⁻³ | ~2,400 K cm⁻³ |

**A hundredfold difference in temperature, a hundredfold difference in density, and identical pressure.** Neither is more "correct" than the other; both are stable solutions of the same balance equation, and gas between them is unstable and drains into one or the other.

The right analogy is not to a gradient but to a **phase transition**. Water and steam coexist at 100 °C and one atmosphere; the two states differ enormously in density while sharing a pressure, and intermediate states are not stable. Fog is not a stage between liquid and vapour — it is droplets of one suspended in the other. Interstellar cold clouds are the same: not a dense region of a single medium, but a distinct thermodynamic phase embedded in another. The word "phase," in this subject, is not a loose metaphor. It is the same physics.

```checkpoint
q: The cold and warm neutral phases of the interstellar medium can coexist indefinitely because they
a: are physically separated into different regions of the Galaxy and never come into contact
x: They are thoroughly interleaved — cold clouds sit embedded within warm gas along essentially every sightline, which is precisely why both appear in the same 21 cm spectra.
a: are prevented from mixing by interstellar magnetic fields
x: Magnetic fields do influence the medium's structure, but they are not what permits coexistence. Two phases at different pressures would still be driven toward each other regardless of field geometry; what matters here is that their pressures are equal.
a*: sit at the same pressure — the hundredfold density difference is exactly offset by the hundredfold temperature difference, so neither compresses the other
a: are continuously replenished, so any gas that leaves one phase is replaced
x: Replenishment describes throughput, not stability. Even a perfectly steady supply would not let two phases sit adjacent if one were at higher pressure — that one would expand and crush the other until pressures matched.
hint: Look at the P/k column for the two phases. What does mechanical equilibrium between adjacent gas parcels require?
why: Adjacent gas parcels must match in pressure or one will expand into the other. The CNM (80 K, 30 cm⁻³) and WNM (8,000 K, 0.3 cm⁻³) both give P/k ≈ 2,400 K cm⁻³, so they are in mechanical equilibrium despite differing enormously in every other respect. This is the defining feature of coexisting phases, exactly as water and steam share a pressure at the boiling point.
---
q: Field's thermal instability causes the medium to separate into phases because a parcel perturbed slightly cooler
a: expands, lowering its density until it matches the surrounding medium
x: This has the direction of the response backwards. To stay in pressure balance while cooling, a parcel must *contract*, not expand — pressure is proportional to the product of density and temperature, so falling temperature at fixed pressure means rising density.
a*: contracts to maintain pressure balance, becoming denser — and if the denser, cooler gas radiates more efficiently still, it cools further and runs away
a: is reheated by starlight until it returns to its original temperature
x: Heating does act, but the question is whether heating or cooling wins *after* the perturbation. Instability arises precisely when the enhanced cooling at the new density outpaces the heating, so the parcel does not return.
a: immediately forms molecules, which changes its chemistry but not its temperature
x: Molecule formation happens at much higher densities than the instability's onset, and molecules are themselves coolants. Chemistry follows the thermal runaway; it does not substitute for it.
hint: At fixed pressure, cooling forces a density change. Then ask whether the gas at that new density cools faster or slower than before.
why: Pressure balance links temperature and density inversely, so a cooling parcel densifies. Whether that is stable depends on the cooling function's slope: if the denser, cooler gas radiates even more efficiently, the perturbation feeds itself and the parcel runs away to a much colder, denser state. Gas on the unstable branch therefore cannot remain there and drains into one of the two stable branches — which is why the medium is found in distinct phases rather than a continuum.
---
q: The comparison between interstellar phases and the coexistence of water with steam is
a: a loose analogy — the underlying physics is entirely different
x: The correspondence is closer than "loose." In both cases two states of the same substance, differing greatly in density, are simultaneously stable at one pressure, with intermediate states unstable. The physics of the bistability is genuinely the same kind.
a*: physically apt — in both cases two states of one substance are simultaneously stable at a common pressure, with intermediate states unstable
a: misleading, because interstellar gas never actually changes state
x: It changes state constantly: warm gas cools and condenses into cold clouds, and cold clouds are heated and evaporated back. The cycle is central to how the medium works.
a: valid only for the molecular phase, which involves an actual chemical change
x: The molecular transition does involve chemistry, but the phase structure appears already in the purely atomic CNM/WNM pair, where no chemical change occurs at all — only a thermal one.
hint: What do a fog droplet and an interstellar cold cloud have in common, structurally?
why: A fog droplet is not an intermediate stage between liquid and vapour; it is one phase suspended within the other, at a shared pressure. Interstellar cold clouds sit within warm gas in exactly that relationship. The instability that forbids intermediate states is what makes both systems separate rather than blend, so "phase" here is a technical description rather than a metaphor.
```

## The five phases

The full catalogue, as now understood:

| Phase | Temperature | Density (cm⁻³) | Volume filled | Mass share |
| --- | --- | --- | --- | --- |
| **Molecular** | 10–20 K | 10²–10⁶ | ~1% | ~20% |
| **Cold neutral (CNM)** | ~80 K | ~30 | ~2% | ~30% |
| **Warm neutral (WNM)** | ~8,000 K | ~0.3 | ~30% | ~35% |
| **Warm ionised (WIM)** | ~8,000 K | ~0.1 | ~20% | ~15% |
| **Hot ionised (HIM)** | ~10⁶ K | ~0.004 | ~30–50% | <1% |

Two features of this table matter more than the individual numbers.

**The volume–mass inversion.** The hot phase fills perhaps half the disk's volume and contains under one per cent of its mass; the molecular phase occupies about one per cent of the volume and holds a fifth of the mass. Asking "what is the interstellar medium mostly?" therefore has two opposite correct answers depending on whether "mostly" means by volume or by mass. This is not a quirk of definitions — it is the direct consequence of phases sharing a pressure across a density range of 10⁸.

**Where the action is.** Stars form exclusively in the molecular phase, which is the least voluminous, coldest, and densest. The Galaxy's star formation is therefore confined to about one per cent of the disk's volume, and everything the other phases do matters mainly through how it delivers gas to, or removes gas from, that one per cent.

Brief characterisations:

- **Molecular gas** is cold enough and dense enough for hydrogen to be H₂ and for dust to shield the interior from ultraviolet starlight. It is organised into giant molecular clouds of 10⁴–10⁶ solar masses, and it is the direct fuel of star formation.
- **The cold neutral medium** is atomic hydrogen in sheets and filaments, detected in 21 cm absorption against background radio sources.
- **The warm neutral medium** is the diffuse atomic phase that fills much of the disk and provides the reservoir from which cold clouds condense.
- **The warm ionised medium** — also called the Reynolds layer — is diffuse hydrogen kept ionised by ultraviolet photons that leak out of H II regions. It is surprisingly extensive, reaching a kiloparsec above the plane, and it accounts for most of the Galaxy's ionised hydrogen.
- **The hot ionised medium**, or coronal gas, is shock-heated debris from supernovae, at a million degrees or above. It is so tenuous that it cools extremely slowly, so it persists, expands, and merges into interconnected tunnels — and it is buoyant enough to escape the disk entirely, feeding the galactic fountain described below.

```checkpoint
q: The hot ionised medium fills roughly half the disk's volume but contributes under 1% of its mass. This is possible because
a: it consists of unusually light particles compared with the other phases
x: All phases are predominantly hydrogen and helium; composition is essentially the same throughout. The difference is in number density, not in what the particles are.
a: much of its mass has already escaped into the halo
x: Some hot gas does escape, feeding the galactic fountain — but that is not why its mass fraction is small. Even the hot gas that remains in the disk contributes almost nothing to the mass budget, because of how few particles it contains per unit volume.
a*: all phases sit at comparable pressure, so the million-degree gas must be extraordinarily dilute — roughly 10⁴ times thinner than the cold neutral medium
a: it is not gravitationally bound and therefore is not counted in the disk's mass
x: Gravitational binding does not determine whether mass is counted, and much of the hot phase is bound. The mass fraction is small for the straightforward reason that its density is minuscule.
hint: If every phase has roughly the same product of density and temperature, what must a phase at a million kelvin have?
why: Rough pressure equality means density scales inversely with temperature. At 10⁶ K the hot phase must be about 10⁴ times more dilute than 80 K gas at the same pressure, so it can occupy enormous volume while carrying negligible mass. The same constraint produces the whole table's structure, in which volume share and mass share run in opposite directions.
---
q: Star formation in the Milky Way is confined to about 1% of the disk's volume because
a: only that fraction of the disk contains any gas at all
x: Gas is present essentially everywhere in the disk; the other 99% of the volume is filled with warm and hot phases. Availability of gas is not the constraint — availability of *cold, dense* gas is.
a: magnetic fields exclude star formation from the rest of the disk
x: Magnetic fields do resist collapse and slow star formation, but they do not carve out a 1% region. The restriction is thermodynamic: only the molecular phase is cold and dense enough for gravity to win.
a*: stars form only in the molecular phase, which is the coldest and densest and therefore occupies the least volume despite holding a fifth of the mass
a: the rest of the disk has already exhausted its star-forming gas
x: The warm and hot phases have not "used up" anything; they are simply in thermodynamic states from which collapse cannot proceed. Much of that gas will cool and condense into molecular form later.
hint: Which phase do stars actually form in, and what share of the volume does the table give it?
why: Gravitational collapse requires gas cold enough that thermal pressure cannot resist it and dense enough for self-gravity to dominate — conditions met only in molecular clouds, which fill about 1% of the volume while holding ~20% of the mass. Everything the other phases do matters chiefly through whether it delivers gas into that small fraction of space or removes it.
```

## Reading the phases

Each phase requires its own observational technique, and the collection is a good illustration of how a single physical system is assembled from mutually incompatible measurements.

**Molecular gas: carbon monoxide.** Molecular hydrogen is nearly invisible — a symmetric molecule with no permanent dipole moment, whose lowest transitions require temperatures far above those of the clouds it constitutes. CO, present at about 10⁻⁴ of H₂ by number, is bright in the millimetre and serves as a proxy, converted to H₂ mass through a calibration factor whose variation with environment is a standing systematic worry. Dust emission in the far infrared provides an independent mass estimate.

**Neutral atomic gas: 21 centimetres.** The hyperfine line of neutral hydrogen sees both CNM and WNM, and separating them uses a technique worth understanding. In **emission**, the 21 cm signal is roughly proportional to the total column of hydrogen regardless of temperature, so an emission survey measures everything. In **absorption** against a background radio source, the optical depth scales as column density divided by **spin temperature** — so cold gas absorbs strongly and warm gas barely at all. Comparing emission and absorption along the same sightline therefore separates the phases and yields the temperature of each. The narrow, deep absorption features are the CNM; the broad, shallow emission that shows no corresponding absorption is the WNM.

**Warm ionised gas: H-alpha and dispersion.** Diffuse ionised hydrogen recombines and emits H-alpha, which deep narrow-band surveys map across the whole sky. An independent and elegant probe comes from **pulsars**: as the Pulsars chapter described, a pulse's arrival time depends on frequency in proportion to the column of free electrons along the path, so a pulsar's **dispersion measure** weighs the ionised gas between it and Earth. Pulsars at known distances therefore calibrate the WIM's density directly — a measurement of the interstellar medium made with a stellar corpse's clock.

**Hot gas: absorption in highly ionised species, and X-rays.** At a million degrees, hydrogen is fully ionised and radiates poorly, so the hot phase is nearly invisible in the usual ways. It is detected through ultraviolet absorption lines of highly ionised oxygen (O VI) and other species that exist only at such temperatures, and through diffuse soft X-ray emission — a background that was for years mistaken for something more exotic before being recognised as the Galaxy's own hot phase, together with the **Local Bubble**, a supernova-blown cavity a hundred parsecs across in which the Sun happens to sit.

```checkpoint
q: Comparing 21 cm emission with 21 cm absorption along the same sightline separates cold from warm atomic gas because absorption optical depth scales as
a: column density multiplied by spin temperature, so warm gas dominates absorption
x: The dependence is inverted here. Optical depth scales *inversely* with spin temperature, which is why warm gas is nearly transparent rather than dominant in absorption.
a*: column density divided by spin temperature, so cold gas absorbs strongly while warm gas at the same column is nearly transparent
a: the square of the density, so only the densest clumps appear
x: That describes recombination or collisional emission processes, not 21 cm absorption, which depends on column density rather than the square of volume density. Density enters only through what it implies about temperature.
a: the velocity dispersion, so only turbulent gas is detected
x: Velocity dispersion sets a line's width, not the strength of absorption. Broad lines from warm gas are shallow because of their temperature, not because of their motion.
hint: Emission counts all the hydrogen. What extra factor enters absorption, and which phase does that factor favour?
why: Emission is roughly proportional to total column regardless of temperature, while absorption goes as column over spin temperature. Cold gas at 80 K therefore produces deep narrow absorption features, and warm gas at 8,000 K produces almost none at the same column. Differencing the two measurements along one sightline yields both the amount of each phase and its temperature — a decomposition that neither measurement provides alone.
---
q: Pulsar dispersion measures weigh the warm ionised medium because a pulse's arrival time depends on frequency in proportion to
a: the total mass of gas along the path, regardless of its ionisation state
x: Neutral gas has no free electrons and does not disperse radio pulses at all. The effect is specific to ionised material, which is exactly what makes it a clean probe of the WIM rather than of gas in general.
a*: the column of free electrons along the line of sight, so a pulsar at known distance calibrates the ionised gas density directly
a: the strength of the magnetic field threading the intervening gas
x: The magnetic field produces a different effect — Faraday rotation of the polarisation angle — which is measured separately and yields the field rather than the electron column.
a: the number of dust grains encountered, which scatter low frequencies more
x: Dust affects optical and infrared light through extinction and scattering, but it is essentially irrelevant at radio wavelengths. That transparency is what made radio astronomy able to map the Galaxy at all.
hint: What does a radio wave interact with in an ionised plasma, and what quantity therefore accumulates along the path?
why: Free electrons slow low-frequency radio waves more than high-frequency ones, so the arrival-time difference across a receiver band measures the integrated electron column — the dispersion measure. With an independently known distance, that column converts into a mean electron density, which is how the diffuse ionised medium is weighed. It is a striking piece of reuse: a neutron star's rotation clock, deployed as an instrument for measuring interstellar gas.
```

## Thermal pressure is only a fifth of the story

A caution now, because the phase picture developed above rests on pressure equilibrium, and interstellar pressure is not only thermal.

Compare the energy densities of the disk's various components in the solar neighbourhood, in the convenient unit of electronvolts per cubic centimetre:

| Component | Energy density (eV cm⁻³) |
| --- | --- |
| Thermal gas | ~0.4 |
| Turbulent motion | ~0.5 |
| Magnetic field (~5 μG) | ~0.6 |
| Cosmic rays | ~1.0 |
| Starlight | ~0.5 |
| Cosmic microwave background | ~0.26 |

They are all **within a factor of a few of one another**. This rough equipartition is one of the most quoted facts about the interstellar medium, and its implications are substantial:

**Thermal pressure does not dominate.** Turbulent, magnetic, and cosmic-ray pressures are each comparable to or larger than the thermal pressure, so the tidy two-phase equilibrium is at best a first approximation. The medium is supported and structured by several agencies at once.

**The medium is dynamic, not static.** Turbulent velocities in the cool phases (~10 km/s) exceed the sound speed of cold gas (~1 km/s) by a factor of ten — the turbulence is **supersonic**, so it constantly generates shocks, compressions, and rarefactions. Structures form and dissolve on timescales of a few million years rather than sitting in equilibrium.

**Whether the near-equality is meaningful is debated.** It may indicate genuine physical coupling — the same supernovae that drive turbulence also accelerate cosmic rays and amplify magnetic fields, so equality would reflect a shared energy source and shared regulation. Or it may be partly coincidence, with several independent processes happening to land within a factor of a few. The honest position is that the coupling is real but its tightness is not established.

```checkpoint
q: In the solar neighbourhood, the energy densities of thermal gas, turbulence, magnetic fields, cosmic rays, and starlight are all within a factor of a few of one another. The most important consequence is that
a: the interstellar medium must be in perfect equilibrium, since no component dominates
x: Rough equality of energy densities implies the opposite of quiescence: several agencies compete on comparable terms, and the medium is dynamic rather than settled. Equality of magnitudes is not equilibrium.
a*: thermal pressure alone cannot govern the medium's structure — turbulent, magnetic, and cosmic-ray pressures are comparable, so the simple two-phase picture is only a first approximation
a: the medium's temperature must be the same everywhere
x: Temperatures span 10 K to 10⁶ K across the phases. Energy density is a product of several quantities and can be similar in regions whose temperatures differ by five orders of magnitude.
a: cosmic rays are the dominant source of interstellar pressure
x: Cosmic rays are the largest single entry in the table, but only by a factor of about two over the smallest — which is precisely the point. No component dominates enough to be treated alone.
hint: The phase argument assumed pressure balance meant thermal pressure balance. What does the table say about that assumption?
why: The clean CNM/WNM coexistence argument treats pressure as thermal, but thermal energy density is roughly a fifth of the total. Turbulent, magnetic, and cosmic-ray pressures each match or exceed it, so real phase structure is set by several agencies at once. The two-phase model remains a valuable idealisation — it explains why phases exist at all — but it is not a complete account of what sets their properties.
---
q: Turbulent velocities in the cool interstellar phases are around 10 km/s while the sound speed in cold gas is around 1 km/s. This matters because supersonic turbulence
a: heats the gas until it reaches the warm phase everywhere
x: Shocks do heat gas locally, but cooling in the dense post-shock regions is rapid, so the medium does not simply warm up uniformly. The lasting effect is structural rather than thermal.
a: cannot persist, since supersonic motions decay instantly
x: Supersonic turbulence does decay quickly — within roughly a crossing time — but it is continuously replenished by supernovae and other driving. Its persistence is a statement about resupply, not about it being impossible.
a*: continuously generates shocks, compressions, and rarefactions, so structures form and dissolve within a few million years rather than settling into equilibrium
a: prevents molecular clouds from ever forming
x: Supersonic turbulence is in fact one of the mechanisms that *creates* molecular clouds, by compressing gas in shocks. It both builds and disrupts structure — which is why clouds are transient rather than absent.
hint: What happens whenever gas moves through a medium faster than that medium's sound speed?
why: Motion faster than the sound speed cannot be smoothly accommodated, so it produces shocks. With turbulent motions ten times the cold-gas sound speed, the medium is continuously being compressed and rarefied, building and destroying structure on timescales of a few million years. The equilibrium language of the phase diagram therefore describes tendencies within a medium that is never actually at rest.
```

{{image: Interstellar medium | The interstellar medium is not one substance but several coexisting phases, spanning temperatures from 10 K to 10⁶ K and densities across eight orders of magnitude — yet all at roughly the same pressure. The dense, cold molecular phase visible as dark obscuration occupies about 1% of the disk's volume while holding a fifth of its mass, and is the only phase in which stars form.}}

{{image: Local Bubble | The Local Bubble — a cavity roughly a hundred parsecs across, blown clear through the interstellar medium by supernovae a few million years ago, and filled with million-degree gas. The Sun happens to sit inside it. Structures like this are what the hot phase looks like from within: not a smooth substrate but a network of interconnected supernova-blown tunnels occupying much of the disk's volume while holding almost none of its mass.}}

## The three-phase model, and what replaced it

The synthesis that organised the field was proposed by **Christopher McKee and Jeremiah Ostriker** in 1977, and its argument was that the medium's structure is set not by static thermal balance but by **supernovae**.

Their reasoning: supernovae occur often enough, and their remnants expand far enough, that a substantial fraction of the disk's volume is swept by a blast wave before it has time to settle. The result is a medium dominated by hot, supernova-blown cavities — the HIM — which grow, merge, and form an interconnected network of tunnels filling most of the volume. Embedded within this hot substrate are cooler clouds: cold cores wrapped in warm envelopes, evaporating where they meet the hot phase and re-condensing elsewhere. The three phases exchange mass continuously through evaporation and condensation, and the whole arrangement is regulated by the supernova rate.

The model was enormously influential and is substantially right in outline: the hot phase is real and extensive, supernovae do regulate the medium, and phases do exchange mass. What has not survived is its **equilibrium** framing. Modern numerical simulations, which can follow supernova-driven turbulence across a patch of galactic disk, produce a medium that is far more chaotic than the tidy nested-cloud picture: filamentary, transient, with phases that are constantly being created and destroyed rather than persisting in steady exchange. Volume filling factors fluctuate; the "phases" are better described as regions of a continuous distribution that happen to cluster near the stable branches than as discrete components with fixed properties.

The modern picture, then: **thermal instability explains why the medium clusters into distinct states; supernova-driven turbulence explains why those states are perpetually mixed, disrupted, and reformed.** Neither alone suffices.

## The vertical dimension, and the fountain

The phases stratify vertically, and the ordering is instructive:

| Phase | Scale height |
| --- | --- |
| Molecular | ~60–80 pc |
| Cold neutral | ~150 pc |
| Warm neutral | ~300–400 pc |
| Warm ionised | ~1 kpc |
| Hot ionised | Several kpc, into the halo |

The pattern is straightforward once the Disk chapter's hydrostatic argument is applied: a phase's scale height reflects its ability to resist the disk's gravity, and hotter gas — with larger thermal velocities — extends further. Molecular gas, coldest and heaviest, hugs the midplane in the thinnest layer of any galactic component; hot gas is barely bound at all.

Which produces the **galactic fountain**. Hot gas from clustered supernovae is buoyant and over-pressured relative to its surroundings, so it does not stay in the disk. It vents upward — sometimes through "chimneys" blown clear through the disk by whole OB associations — rising kiloparsecs into the halo. There it cools, condenses into clouds, and rains back down. The observational evidence is a population of **high-velocity clouds**: neutral hydrogen at kiloparsec heights moving at velocities inconsistent with disk rotation, some of it falling.

The fountain matters for reasons beyond its own elegance. It **mixes** the disk, transporting freshly synthesised elements far from where they were made before returning them — a point the Chemical Enrichment chapter develops. It **exchanges** material with the hot corona described in the Halo chapter, which is both the destination of fountain gas and a source of fresh accretion. And it is one component of the **feedback** that keeps galaxies from converting their gas into stars too quickly, which the Star-Formation Cycle chapter takes up next.

```checkpoint
q: Molecular gas has the smallest scale height of any Galactic component (~60–80 pc) because
a: it is confined by the strong magnetic fields found in molecular clouds
x: Molecular clouds are magnetised, and fields do affect their internal structure, but the vertical extent of the molecular layer is set by the same hydrostatic balance that governs every other component — velocity dispersion against gravity.
a*: it is the coldest phase, with the smallest velocity dispersion, so it is least able to resist the disk's gravitational pull toward the midplane
a: it formed most recently and has not yet had time to spread vertically
x: The molecular layer is continuously replenished and destroyed, but its thickness is an equilibrium property rather than a matter of elapsed time. Even long-lived molecular gas would remain thin.
a: it is denser, and denser material always settles lower in any gravitational field
x: Density alone does not determine scale height in a gas — the atmosphere's layers are not sorted by density but by temperature and composition. The controlling quantity is velocity dispersion, and cold gas has the least.
hint: Apply the Disk chapter's vertical hydrostatic argument. What quantity plays the role of pressure, and which phase has the least of it?
why: Vertical extent follows from the balance between random motions and the disk's gravity, so a phase's scale height rises with its velocity dispersion. Molecular gas at 10–20 K has the smallest dispersion of any component and is therefore squeezed into the thinnest layer, while million-degree gas is barely bound and reaches kiloparsecs into the halo. The ordering of the whole table follows from temperature alone.
---
q: The galactic fountain describes hot gas that
a: falls inward toward the Galactic centre, feeding the black hole
x: That describes the bar-driven inflow of the Bulge chapter, which is a distinct process operating in the plane. The fountain is a vertical circulation, not a radial one.
a*: vents out of the disk because it is buoyant and over-pressured, rises kiloparsecs into the halo, cools, condenses into clouds, and rains back down
a: escapes the Galaxy permanently, steadily depleting the disk of gas
x: Some material may escape, but the defining feature of a fountain is that most of it returns — which is why the process mixes the disk rather than simply draining it. High-velocity clouds falling back are the observational signature.
a: is drawn up by the gravity of satellite galaxies passing overhead
x: Satellite passages do perturb the disk, but the fountain is driven from below by supernova heating and buoyancy, and it operates continuously rather than in response to external encounters.
hint: What does supernova-heated gas do when it is far hotter and more buoyant than its surroundings, and what happens to it once it cools at altitude?
why: Clustered supernovae heat gas to a million degrees, leaving it over-pressured and buoyant enough to vent upward, sometimes through chimneys blown clear through the disk. At kiloparsec heights it cools and condenses, returning as the observed high-velocity clouds. The circulation mixes newly synthesised elements across the disk, exchanges material with the hot corona, and forms part of the feedback that keeps galaxies from consuming their gas too rapidly.
```

## Pulling the thread

- The interstellar medium is **~10¹⁰ $M_\odot$** at roughly one atom per cubic centimetre — about a thousand times emptier than the best laboratory vacuum — and it was discovered in 1904 by **one spectral line refusing to move** with the binary that produced all the others.
- Whether a medium is "collisional" is a **ratio of two lengths**, not a density: a two-AU mean free path is negligible compared with a molecular cloud, so the near-vacuum behaves as a fluid.
- **Thermal instability** (Field 1965) is why phases exist: a cooling parcel densifies to hold pressure, and if it then cools faster still it runs away, draining out of intermediate states. Two stable branches remain — the CNM and WNM — at **identical pressure**, ~2,400 K cm⁻³, with hundredfold contrasts in temperature and density. The water/steam analogy is physics, not metaphor.
- The **five phases** invert volume against mass: the hot phase fills ~half the volume with <1% of the mass, the molecular phase ~1% of the volume with ~20% of the mass. **Star formation happens only in that 1%.**
- Each phase demands its own instrument: **CO** for molecular gas, **21 cm emission versus absorption** (separated by spin temperature) for the neutral phases, **H-alpha and pulsar dispersion measures** for the WIM, **O VI absorption and soft X-rays** for the HIM.
- Thermal pressure is roughly a **fifth** of the total: turbulent, magnetic, cosmic-ray, and radiation energy densities are all within a factor of a few, and the turbulence is **supersonic**, so the medium is perpetually shocked rather than settled.
- **McKee–Ostriker's** supernova-regulated three-phase model was right in outline and wrong in its equilibrium framing; the modern picture keeps thermal instability to explain why states cluster and adds turbulence to explain why they are constantly destroyed and remade.
- Phases **stratify by temperature**, from a 60 pc molecular layer to hot gas reaching into the halo — and the hot phase's buoyancy drives the **galactic fountain** that mixes the disk and exchanges material with the corona.

The transferable idea: **when a system's response to a small disturbance amplifies that disturbance, the system will not be found in the intermediate state at all.** The interstellar medium is not a gas with a range of temperatures; it is a gas found at two temperatures, because everything between them is unstable and drains away. The same logic explains why a supersaturated vapour produces droplets rather than a uniform mist, why populations segregate rather than blending along a gradient, and why markets clear at prices rather than hovering between them. Wherever an observed distribution is sharply bimodal, the productive question is not "what makes these two states special?" but "what is unstable about the middle?" — because bimodality is usually the signature of an evacuated centre rather than of two independently favoured extremes.

## Further reading

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Lyman Spitzer | Physical Processes in the Interstellar Medium | 1978}}

{{book: Donald Osterbrock | Astrophysics of Gaseous Nebulae and Active Galactic Nuclei | 2006}}

Beyond the books: Field's 1965 thermal-instability paper is the origin of the whole phase picture and its central argument is short; McKee and Ostriker's 1977 three-phase paper is worth reading for how far a single organising idea can be pushed; and Hartmann's 1904 note on delta Orionis is barely more than a page, and is the entire subject's founding document.

## Problems

*Useful numbers: k = 1.381 × 10⁻²³ J/K; m_H = 1.673 × 10⁻²⁷ kg; 1 pc = 3.086 × 10¹⁶ m; M☉ = 1.989 × 10³⁰ kg; 1 eV = 1.602 × 10⁻¹⁹ J; sound speed c_s ≈ √(1.4 kT/m_H); collision cross-section σ ≈ 10⁻¹⁵ cm²; 1 AU = 1.496 × 10¹³ cm.*

**1.** *(How empty.)* **(a)** The best laboratory vacuum reaches 10⁻¹² torr (1 torr = 133.3 Pa) at 300 K. Compute its number density in cm⁻³. **(b)** Compare with the CNM's 30 cm⁻³ and the HIM's 0.004 cm⁻³. **(c)** Comment on what this implies about simulating interstellar conditions in a laboratory.

**2.** *(Is it even a fluid?)* In the CNM (n = 30 cm⁻³, σ = 10⁻¹⁵ cm²): **(a)** compute the mean free path in cm and in AU. **(b)** At a typical thermal speed of 1 km/s, compute the time between collisions. **(c)** Compare the mean free path with the ~30 pc size of a molecular cloud and state whether a fluid description is justified.

**3.** *(Two phases, one pressure.)* **(a)** Compute P/k for the CNM (n = 30 cm⁻³, T = 80 K) and the WNM (n = 0.3 cm⁻³, T = 8,000 K). **(b)** Explain why this equality is required rather than coincidental. **(c)** A parcel at n = 3 cm⁻³, T = 800 K has the same pressure. Explain what happens to it and why it is not observed.

**4.** *(Sound and turbulence.)* Using c_s ≈ √(1.4kT/m_H): **(a)** compute the sound speed in molecular gas (15 K), CNM (80 K), WNM (8,000 K), and HIM (10⁶ K). **(b)** Given turbulent velocities of ~10 km/s, identify in which phases the turbulence is supersonic. **(c)** State one structural consequence.

**5.** *(Energy budget.)* **(a)** Compute the thermal energy density (3/2)nkT for P/k = 3,000 K cm⁻³, in eV cm⁻³. **(b)** Compute the magnetic energy density B²/2μ₀ for B = 5 μG, in the same units. **(c)** Given cosmic rays at ~1.0 and starlight at ~0.5 eV cm⁻³, comment on what "pressure equilibrium" can and cannot mean in this medium.

**6.** *(Volume against mass.)* Take the HIM at n = 0.004 cm⁻³ filling 40% of the volume, and molecular gas at a mean n = 100 cm⁻³ filling 1%. **(a)** Compute the ratio of their contributions to the total mass. **(b)** Explain why the answer runs opposite to the ratio of volumes, and what single physical constraint produces the inversion.

**7.** *(Separating the neutral phases.)* Two sightlines show identical 21 cm emission, implying identical hydrogen columns. One shows deep narrow absorption against a background source; the other shows almost none. **(a)** What does each contain? **(b)** Explain the physics that makes the comparison diagnostic. **(c)** State why emission alone could not have distinguished them.

**8.** *(Weighing the ionised gas with a pulsar.)* A pulsar at 1 kpc has a dispersion measure of 30 pc cm⁻³. **(a)** Compute the mean free-electron density along the line of sight. **(b)** Compare with the WIM density quoted in the chapter and comment. **(c)** Explain why this method requires no assumption about the gas's temperature.

**9.** *(Stratification.)* **(a)** Rank the five phases by scale height and state the single quantity that determines the ordering. **(b)** Explain why the hot phase escapes the disk while the molecular phase does not. **(c)** Describe the galactic fountain in two sentences and name one observational signature.

## Worked answers

**1.** **(a)** $P = 10^{-12} \times 133.3 = 1.333\times10^{-10}$ Pa; $n = P/kT = 1.333\times10^{-10}/(1.381\times10^{-23} \times 300) = 3.2\times10^{10}$ m⁻³ $= \mathbf{3.2\times10^{4}\ cm^{-3}}$. **(b)** That is **~1,000 times denser** than the CNM and **~8 million times denser** than the HIM. **(c)** Interstellar densities cannot be reproduced on Earth — the emptiest volume ever manufactured is crowded by comparison — so interstellar chemistry and microphysics must be studied through theory, through astronomical observation itself, or in experiments that reproduce one relevant parameter (grain surfaces, radiation field, collision energy) while abandoning the others. This is why laboratory astrophysics works on processes rather than on conditions.

**2.** **(a)** $\ell = 1/(n\sigma) = 1/(30 \times 10^{-15}) = \mathbf{3.3\times10^{13}\ cm} = \mathbf{2.2\ AU}$. **(b)** $t = \ell/v = 3.3\times10^{13}/10^{5} = 3.3\times10^{8}$ s $= \mathbf{10.6\ yr}$. **(c)** A molecular cloud is 30 pc $= 9.3\times10^{19}$ cm, so the mean free path is about **3 × 10⁻⁷** of the system size. Despite the absurd sparseness by laboratory standards, particles collide ten million times while crossing the system, so pressure is shared, sound waves propagate, and shocks form: the fluid description is thoroughly justified. What matters is the ratio of lengths, not the density.

**3.** **(a)** CNM: $30 \times 80 = \mathbf{2{,}400}$ K cm⁻³. WNM: $0.3 \times 8{,}000 = \mathbf{2{,}400}$ K cm⁻³. **(b)** Adjacent gas parcels not in pressure balance cannot persist — the higher-pressure one expands into the lower until they equalise, on a sound-crossing time. Coexistence therefore *requires* equal pressures, and the observed equality is a consequence of mechanical equilibrium rather than a numerical accident. **(c)** It sits on the **thermally unstable branch**: perturbed slightly cooler it densifies, cools faster, and runs away to the CNM; perturbed warmer it runs away to the WNM. Gas passes through this state but cannot remain in it, so little is found there — the reason the medium appears as discrete phases rather than a continuum. (Some genuinely unstable-branch gas *is* detected, indicating that turbulence continually pushes material into states thermal physics alone would evacuate.)

**4.** **(a)** $c_s = \sqrt{1.4kT/m_H}$: at 15 K, **0.42 km/s**; at 80 K, **0.96 km/s**; at 8,000 K, **9.6 km/s**; at 10⁶ K, **108 km/s**. **(b)** Turbulence at 10 km/s is **strongly supersonic** in the molecular phase (Mach ~24) and the CNM (Mach ~10), roughly **transonic** in the warm phases (Mach ~1), and firmly **subsonic** in the hot phase. **(c)** In the cold phases, supersonic turbulence continuously drives shocks that compress gas into filaments and clumps — building the density structure from which stars eventually form, while also disrupting it. The cold medium's filamentary appearance is a direct consequence.

**5.** **(a)** $u = \tfrac{3}{2}nkT = 1.5 \times 3{,}000\ \text{K cm}^{-3} \times 1.381\times10^{-16}\ \text{erg K}^{-1} = 6.2\times10^{-13}$ erg cm⁻³ $= \mathbf{0.39\ eV\,cm^{-3}}$. **(b)** $B = 5\ \mu\text{G} = 5\times10^{-10}$ T; $u_B = B^2/2\mu_0 = (5\times10^{-10})^2/(2 \times 1.257\times10^{-6}) = 9.9\times10^{-14}$ J m⁻³ $= \mathbf{0.62\ eV\,cm^{-3}}$. **(c)** Thermal energy density is roughly a **fifth** of the total, and is exceeded by the magnetic and cosmic-ray contributions individually. "Pressure equilibrium" can therefore mean that phases share a *total* pressure to which several agencies contribute; it cannot mean that thermal pressure alone determines the structure. The two-phase argument remains valid as an explanation for *why* phases exist, while being incomplete as an account of their detailed properties.

**6.** **(a)** Mass goes as $n \times f_V$: HIM gives $0.004 \times 0.40 = 1.6\times10^{-3}$; molecular gives $100 \times 0.01 = 1.0$. The ratio is $\mathbf{{\sim}1:625}$ in favour of the molecular phase. **(b)** The volume ratio runs the other way, 40:1 in favour of the hot phase, so mass and volume orderings are inverted. The constraint producing this is **rough pressure equality across phases**: with $nT$ roughly constant, density scales inversely with temperature, and the temperature range from 15 K to 10⁶ K spans nearly five orders of magnitude. A phase can therefore be voluminous or massive, but not both.

**7.** **(a)** The sightline with deep narrow absorption contains a substantial **cold neutral** component; the one without contains predominantly **warm neutral** gas. **(b)** Emission is roughly proportional to column density independent of temperature, whereas absorption optical depth scales as column divided by **spin temperature**. Equal columns therefore give equal emission but very different absorption — strong for 80 K gas, negligible for 8,000 K gas at the same column. **(c)** Emission measures total hydrogen and is blind to how that hydrogen is partitioned between phases; only the temperature-weighted measurement breaks the degeneracy. Pairing the two is what converts a column measurement into a phase decomposition with temperatures attached.

**8.** **(a)** $\langle n_e \rangle = \text{DM}/d = 30\ \text{pc cm}^{-3}/1{,}000\ \text{pc} = \mathbf{0.03\ cm^{-3}}$. **(b)** Lower than the ~0.1 cm⁻³ quoted for WIM regions, which is expected: the dispersion measure averages over the whole path, including the substantial fraction that passes through neutral gas contributing no free electrons at all. The WIM's *in-situ* density exceeds the path-averaged value because it does not fill the path. **(c)** Dispersion depends only on the **number of free electrons** encountered, through the plasma frequency — not on their temperature, ionisation source, or thermal state. It is therefore a clean column measurement, which is exactly what makes it so useful alongside H-alpha, whose emissivity depends on density squared and on temperature.

**9.** **(a)** Molecular (~70 pc) < cold neutral (~150 pc) < warm neutral (~350 pc) < warm ionised (~1 kpc) < hot ionised (several kpc). The ordering is set by **velocity dispersion**, which for a thermal phase means **temperature**. **(b)** Vertical extent follows from the balance between random motions and the disk's gravity: at 10⁶ K the hot gas's thermal speeds approach the escape velocity and it is buoyant relative to everything around it, so it vents upward, while 15 K molecular gas has thermal speeds of 0.4 km/s and is bound into the thinnest layer of any Galactic component. **(c)** Supernova-heated gas rises out of the disk, cools at kiloparsec altitudes, condenses into clouds and falls back, circulating material between disk and halo. The observational signature is the population of **high-velocity clouds** — neutral hydrogen well above the plane moving at velocities inconsistent with disk rotation, some of it descending.$mwGasPhases_master$,
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
