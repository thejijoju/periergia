-- Astronomy & Space · The Milky Way — Interstellar Medium —
-- "Cosmic Rays and Magnetic Fields". Curated master for
-- astronomy-and-space/milky-way/interstellar-medium/cosmic-rays-and-magnetic-fields
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Taxonomy node added in this batch (Interstellar Medium position 2);
-- seed.sql already carries it.
--
-- The non-thermal half of the interstellar medium, without which the
-- energy budget of the previous two chapters is missing half its
-- entries. Hess's 1912 balloon flights and the electroscope that
-- discharged faster with altitude; what cosmic rays are and the power
-- law they follow across eleven decades, with the knee, the ankle, and
-- the Oh-My-God particle; the supernova origin argument as an energy
-- budget that closes at ten per cent efficiency, diffusive shock
-- acceleration naturally producing a power law, and the pion-bump
-- gamma-ray detections that proved protons are accelerated in remnants;
-- the Larmor radius reaching the disk's thickness exactly at the ankle,
-- marking where Galactic confinement fails; the beryllium-10 clock
-- showing a residence time a thousand times longer than a straight
-- crossing, hence diffusion; measuring the magnetic field by Zeeman
-- splitting, synchrotron emission, Faraday rotation and dust
-- polarisation; the unsolved dynamo; and why both components matter
-- dynamically - cosmic rays as the only ionisation source deep inside
-- molecular clouds, and therefore as the agent that couples gas to
-- field and governs how stars form at all. ~10,000 words,
-- multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/interstellar-medium/cosmic-rays-and-magnetic-fields',
    'research',
    'advanced',
    'read',
    $mwCRMag_master$> **Cosmic rays** are high-energy charged particles — mostly protons — that fill the Galaxy at energies from 10⁹ to beyond 10²⁰ electronvolts. The **interstellar magnetic field** is the roughly 5-microgauss field threading the same volume. Neither is a minor addition to the interstellar medium: together they carry about as much energy per unit volume as the gas's thermal motion, its turbulence, and starlight, and they govern how the medium behaves.

The Gas Phases chapter ended on an admission. The tidy two-phase equilibrium that explains why the interstellar medium separates into cold and warm components rests on pressure balance — and thermal pressure turns out to be roughly a fifth of the total. The other four-fifths are turbulence, radiation, magnetic fields, and cosmic rays. Two of those four have now been discussed. This chapter is about the other two, and about why a component that constitutes roughly one particle in 10⁹ of the interstellar medium exerts a pressure comparable to all of its gas.

That is the first fact to absorb. Cosmic rays are extraordinarily rare — a handful of particles per cubic metre at GeV energies — and yet their energy density is ~1 eV cm⁻³, matching the thermal energy density of a medium containing 10⁹ times more particles. The reason is simply that each cosmic ray carries about a *billion* times the energy of a thermal particle. A population can dominate a budget by being individually enormous rather than by being numerous, and cosmic rays are the interstellar medium's clearest instance.

## An electroscope that would not stay charged

The discovery is one of the cleanest experiments in physics, and it turned on a nuisance.

By 1900 it was known that a charged electroscope slowly loses its charge, because ambient radiation ionises the surrounding air and the ions carry charge away. The obvious source was radioactivity in the ground: rocks contain uranium and thorium, and their radiation ionises the air above. The prediction follows immediately — **go higher and the effect should weaken**, since air absorbs radiation and distance from the source increases.

Between 1911 and 1913, **Victor Hess** carried electroscopes aloft in balloons, ultimately to 5,300 metres, at considerable personal risk and including one flight during a near-total solar eclipse. The ionisation rate did fall at first, as expected, through the first few hundred metres. Then it stopped falling. Then it began to **rise** — and by 5 km it was several times the ground-level value.

Hess drew the conclusion in 1912: "**a radiation of very high penetrating power enters our atmosphere from above.**" The eclipse flight ruled out the Sun as the dominant source, since the ionisation did not drop when the Moon covered it. Something was arriving from beyond the Solar System. Hess received the Nobel Prize in 1936.

The name **cosmic rays** was coined by Millikan and is a misnomer twice over: they are not rays but particles, and while they are cosmic, the term long obscured the fact that what reaches the ground is not the primary particles at all but the **air showers** they generate — cascades of secondaries produced when a primary strikes a nucleus high in the atmosphere. A single 10²⁰ eV proton produces a shower containing billions of particles spread over many square kilometres at sea level, which is how such rare events are detected at all: the atmosphere is the detector, and ground arrays sample the footprint.

Cosmic-ray physics then became particle physics for three decades. The **positron** (1932), the **muon** (1936), the **pion** and the **kaon** (1947) were all discovered in cosmic rays, before any accelerator could reach the relevant energies. Only when accelerators overtook natural sources in the 1950s did the field split into particle physics and the astrophysical study of cosmic rays themselves.

```checkpoint
q: Hess concluded in 1912 that the ionising radiation came from above the atmosphere because, as he ascended,
a: the ionisation rate fell steadily, showing that its source lay below
x: This is what the prevailing ground-radioactivity hypothesis predicted, and it is what Hess observed for only the first few hundred metres. The decisive result was that the trend reversed at greater altitude.
a*: the ionisation rate first fell, then rose, reaching several times the ground-level value by 5 km
a: the ionisation rate stayed exactly constant at all altitudes
x: A constant rate would have been puzzling but would not have located the source above; it could equally have indicated a contaminant within the apparatus. The observed *increase* with altitude is what pointed upward.
a: ionisation occurred only during daylight hours
x: A day-night dependence would have implicated the Sun, and Hess specifically tested that with a flight during a near-total eclipse — the ionisation did not drop, ruling the Sun out as the dominant source.
hint: What did the ground-radioactivity hypothesis predict for high altitude, and what actually happened up there?
why: If rocks were the source, ionisation should decline with height as air absorbs the radiation and distance grows. It declined briefly and then rose sharply, which is only consistent with radiation entering from above. The eclipse flight excluded the Sun, leaving an origin beyond the Solar System — and the term "cosmic rays," though a misnomer for what are actually charged particles, stuck.
---
q: Ground-based arrays detect the very highest-energy cosmic rays by observing
a: the primary particles themselves, which reach sea level intact
x: Primaries almost never reach the ground; they interact with atmospheric nuclei tens of kilometres up. What arrives at sea level is entirely secondary.
a*: extensive air showers — cascades of billions of secondary particles spread over square kilometres, produced when one primary strikes a nucleus high in the atmosphere
a: the radio emission from particles decelerating in the upper atmosphere
x: Radio detection of showers is a genuine and increasingly used technique, but it is a way of observing the shower, not an alternative to it. The shower remains the thing being detected.
a: gamma rays produced when cosmic rays collide with the detector directly
x: Direct collisions with a ground detector would be far too rare to measure a flux of one particle per square kilometre per century. The atmosphere's role as an amplifier is exactly what makes detection feasible.
hint: At the highest energies the flux is about one particle per square kilometre per century. How could such an event ever be caught by an instrument of practical size?
why: The atmosphere acts as both target and amplifier: one primary generates a cascade covering many square kilometres at sea level, so a sparse array of detectors sampling that footprint can reconstruct the original particle's energy and direction. This is what makes measuring a flux of one particle per km² per century possible at all — the effective collecting area is the sky, not the hardware.
```

## Eleven decades of power law

Cosmic rays are, by composition, ordinary matter moving extraordinarily fast: about **90% protons**, **9% helium nuclei**, and **1%** electrons and heavier nuclei. What is remarkable is their energy distribution, which follows a **power law** across an astonishing range:

$\dfrac{dN}{dE} \propto E^{-2.7}$

from about 10⁹ eV to beyond 10²⁰ eV — **eleven orders of magnitude**, with the flux falling by some thirty orders of magnitude across that span. Few natural distributions hold a single functional form over such a range, and a power law is the signature of a **scale-free process**: whatever accelerates these particles has no characteristic energy built into it.

Three features break the smoothness, and each marks a physical transition:

| Feature | Energy | Interpretation |
| --- | --- | --- |
| **The knee** | ~3 × 10¹⁵ eV | Spectrum steepens; supernova remnants reach their acceleration limit |
| **The ankle** | ~3 × 10¹⁸ eV | Spectrum flattens; Galactic gives way to extragalactic sources |
| **GZK cutoff** | ~5 × 10¹⁹ eV | Protons above this lose energy to the cosmic microwave background |

Flux falls steeply with energy, which sets how each regime is observed. At 10⁹ eV, cosmic rays arrive at roughly one particle per square centimetre per second — measurable by a small detector on a balloon or spacecraft. At 10²⁰ eV, the rate is about **one particle per square kilometre per century**, which is why the highest-energy work requires arrays covering thousands of square kilometres, such as the Pierre Auger Observatory.

At the extreme end sits an object worth contemplating. In 1991 the Fly's Eye detector in Utah recorded a particle of about **3 × 10²⁰ eV** — promptly named the **Oh-My-God particle**. That is roughly **50 joules** carried by a single proton: the kinetic energy of a briskly thrown baseball, concentrated into one subatomic particle. It was travelling at a speed differing from light's by about one part in 10²⁴; had it raced a photon to the Andromeda Galaxy, it would have arrived a fraction of a second behind. No known astrophysical accelerator comfortably explains such energies, and the origin of the highest-energy cosmic rays remains genuinely open.

The **GZK cutoff** deserves a note because it is a rare case of a cosmic prediction from laboratory particle physics. Greisen, Zatsepin, and Kuzmin pointed out in 1966 that a proton above ~5 × 10¹⁹ eV sees the cosmic microwave background — 2.7 K photons, utterly negligible to anything slower — as a bath of gamma rays energetic enough to produce pions. Such a proton loses energy rapidly and cannot travel more than ~50 megaparsecs. Particles observed above the cutoff must therefore originate **nearby** in cosmological terms, which sharply constrains their sources. The suppression is observed, at approximately the predicted energy.

```checkpoint
q: The cosmic-ray spectrum follows a single power law across eleven orders of magnitude in energy. This is significant because a power law indicates
a: that all cosmic rays originate from a single source
x: A single source would more plausibly imprint its own characteristic energy scale on the spectrum. The scale-free form suggests a common *mechanism* operating across many sources, not a single origin.
a: that the particles have reached thermal equilibrium with the interstellar medium
x: Thermal equilibrium produces a Maxwell–Boltzmann distribution with a sharp exponential cutoff at the characteristic temperature — the opposite of a scale-free power law extending across eleven decades.
a*: a scale-free acceleration process — one with no characteristic energy built into it, so the same mechanism operates identically at every energy
a: that the measurements are dominated by instrumental effects rather than astrophysics
x: The power law is confirmed by many independent instruments using entirely different detection methods across different energy ranges, and the agreement between them is what establishes its reality.
hint: What would a process with a preferred energy scale imprint on the spectrum? What does the absence of any such feature imply?
why: Any mechanism with a built-in energy scale would leave a bump, break, or cutoff at that scale. A clean power law over eleven decades means the acceleration works the same way regardless of the particle's current energy — each stage multiplies the energy rather than adding a fixed amount. Diffusive shock acceleration has exactly this property, which is a principal reason it is believed to be the mechanism.
---
q: The "knee" in the cosmic-ray spectrum at ~3 × 10¹⁵ eV, where the power law steepens, is generally interpreted as
a: the energy above which cosmic rays begin to lose energy to the microwave background
x: That is the GZK cutoff, which sits some four orders of magnitude higher at ~5 × 10¹⁹ eV and involves pion production off CMB photons — an entirely different physical process.
a*: the maximum energy to which supernova remnant shocks can accelerate particles, above which Galactic sources become inefficient
a: the point at which cosmic rays become energetic enough to escape the Galaxy
x: Escape becomes important around the ankle, three orders of magnitude higher, where the Larmor radius approaches the disk's thickness. At the knee, particles are still comfortably confined.
a: the transition from protons to heavier nuclei in the primary composition
x: Composition does shift toward heavier nuclei through the knee region, but that shift is a *consequence* of the acceleration limit — which scales with nuclear charge — rather than the cause of the spectral break.
hint: Which class of Galactic source is thought to accelerate most cosmic rays, and what happens when it reaches its own limit?
why: A shock can accelerate a particle only while it can be confined near the shock front, which sets a maximum energy depending on the remnant's size, age, and magnetic field. Around 10¹⁵ eV supernova remnants reach that ceiling, so their contribution falls away and the spectrum steepens. Because the limit scales with charge, heavier nuclei reach higher energies, producing the observed compositional shift through the knee — an effect of the same ceiling rather than a separate cause.
```

## Where they come from, and how the numbers close

The dominant Galactic source is **supernova remnants**, and the argument is a budget that balances.

**Step one: how much power is needed?** The cosmic-ray energy density is ~1 eV cm⁻³. Multiplied by the volume of the Galactic disk, that is a total cosmic-ray energy of ~2 × 10⁵⁵ erg. Cosmic rays do not remain forever — they escape on a residence time of roughly 10⁷ years (measured below) — so maintaining the observed density requires a continuous power input of about **6 × 10⁴⁰ erg/s**.

**Step two: what is available?** The Galaxy hosts roughly two supernovae per century, each releasing ~10⁵¹ erg in kinetic energy. That is an average mechanical power of **6 × 10⁴¹ erg/s**.

**Step three: compare.** The required power is **ten per cent** of the supernova power. Supernova remnants need to convert about a tenth of their kinetic energy into relativistic particles — an efficiency that is demanding but entirely plausible, and which independent modelling of shock acceleration supports.

This argument, essentially due to Baade, Zwicky, and later Ginzburg and Syrovatskii, is the foundation of cosmic-ray astrophysics: no other Galactic energy source comes close to supplying the requirement. Stellar winds fall short by an order of magnitude; the Galactic centre's activity is episodic and insufficient.

**The mechanism** was worked out in stages. Enrico Fermi proposed in 1949 that particles could gain energy by bouncing off moving magnetised clouds — gaining slightly more often than they lost, because head-on collisions are more frequent than following ones. This **second-order Fermi acceleration** works but is slow, since the fractional gain per encounter goes as $(v/c)^2$.

The efficient version, developed in the 1970s, is **diffusive shock acceleration**, and its elegance is worth spelling out. A particle near a shock front is scattered by magnetic irregularities on both sides. Crucially, the gas on either side of the shock is *converging* — upstream and downstream material approach each other in the shock frame — so **every crossing is a head-on collision**, and every crossing gains energy. The particle random-walks back and forth, gaining a fractional energy $\Delta E/E \sim v_{\text{shock}}/c$ each round trip, until it eventually escapes downstream.

Two features make this the mechanism of choice. It is **first-order** in $v/c$, hence far faster than Fermi's original scheme. And because each crossing multiplies the energy by a constant factor while each particle has a constant probability of escaping per cycle, the resulting spectrum is **naturally a power law** — with a predicted index close to the observed one. A mechanism that produces the right *functional form* without tuning is considerably more convincing than one fitted to the data.

**The direct evidence** arrived in 2013. Cosmic-ray protons colliding with interstellar gas produce neutral pions, which decay into two gamma rays — a process leaving a distinctive spectral signature known as the **pion bump**, at an energy fixed by the pion's rest mass. Electrons accelerated in the same remnants also produce gamma rays, but by different processes with different spectra, so the two can be distinguished. The *Fermi* Large Area Telescope detected the pion bump in the supernova remnants **IC 443 and W44**, establishing that these objects accelerate **protons**, not merely electrons. After a century, cosmic rays were caught being made.

```checkpoint
q: The energy budget argument for a supernova origin of cosmic rays rests on the finding that maintaining the observed cosmic-ray density requires
a: essentially all of the Galaxy's supernova power, leaving no margin
x: If 100% efficiency were required the argument would fail, since no mechanism converts all of a blast wave's kinetic energy into relativistic particles. The comfortable margin is what makes the case persuasive.
a*: about ten per cent of the Galaxy's total supernova kinetic power — a demanding but achievable acceleration efficiency
a: far more power than supernovae can supply, so another source must dominate
x: The comparison runs the other way: supernovae supply roughly ten times the required power, which is why they are the leading candidate. No other Galactic source comes within an order of magnitude.
a: only a millionth of supernova power, so almost any source would suffice
x: If the requirement were that small, the budget would not discriminate between candidate sources at all and the argument would carry no weight. It is the fact that the requirement is a substantial but attainable fraction that makes it evidence.
hint: Compare ~6 × 10⁴⁰ erg/s required against ~6 × 10⁴¹ erg/s available from two supernovae per century.
why: The observed cosmic-ray energy divided by the ~10⁷ yr residence time gives the power that must be continuously supplied; two supernovae per century at 10⁵¹ erg apiece gives ten times that. A required efficiency of ~10% is demanding enough to be a real constraint and achievable enough to be plausible, while stellar winds and other candidates fall short by an order of magnitude or more. A budget that closes at a sensible efficiency is the argument's whole strength.
---
q: Diffusive shock acceleration is far more efficient than Fermi's original 1949 mechanism because at a shock front
a: the magnetic field is strong enough to trap particles permanently
x: Permanent trapping would prevent particles from ever escaping to be observed, and would also stop the acceleration, since the process depends on repeated crossings followed by eventual escape.
a*: the gas on both sides is converging, so every crossing is a head-on collision and gains energy — making the process first-order in v/c rather than second-order
a: particles are accelerated directly by an electric field along the shock
x: Large-scale electric fields are quickly shorted out in a conducting plasma, which is why astrophysical acceleration relies on magnetic scattering rather than on sustained electric fields.
a: the shock heats particles thermally to relativistic temperatures
x: Thermal heating produces a Maxwellian distribution with an exponential cutoff, not a power law extending to 10¹⁵ eV. Shock acceleration is a non-thermal process acting on particles already above the thermal pool.
hint: In Fermi's original scheme some collisions were head-on and some were following. What does the geometry of a shock do to that mixture?
why: Because material on the two sides of a shock approaches in the shock frame, a particle crossing in either direction always meets converging scatterers — so it gains on every crossing rather than on a statistical majority of them. That makes the fractional gain first-order in v/c instead of second-order, and therefore vastly faster. It also produces a power-law spectrum automatically, since each cycle multiplies the energy while each particle has a fixed escape probability per cycle — the right functional form with nothing tuned.
---
q: Gamma-ray observations of the remnants IC 443 and W44 established that supernova remnants accelerate protons specifically, rather than only electrons, by detecting
a: gamma rays at energies too high for electrons to produce
x: Electrons can produce very high-energy gamma rays efficiently through inverse Compton scattering, so energy alone does not discriminate between the two populations.
a*: the pion bump — a spectral feature at an energy fixed by the neutral pion's rest mass, produced only when cosmic-ray protons collide with interstellar gas
a: polarised gamma-ray emission characteristic of proton synchrotron radiation
x: Protons do radiate synchrotron emission, but so feebly at these energies that it is undetectable; their signature comes through nuclear collisions producing pions, not through radiation.
a: a time delay between the gamma rays and the remnant's radio emission
x: Both emissions are effectively simultaneous on observable timescales, and a delay would not identify the particle species in any case. The discriminant is spectral shape.
hint: When a fast proton hits a gas nucleus it makes neutral pions, which decay to gamma rays. What does the pion's rest mass impose on the resulting spectrum?
why: Neutral pion decay produces a gamma-ray spectrum with a characteristic break fixed by the pion rest mass — a feature electrons cannot mimic, since their gamma-ray production proceeds by bremsstrahlung and inverse Compton scattering with quite different spectral shapes. Detecting that bump in 2013 confirmed proton acceleration in remnants directly, closing a century-old inference with an observation.
```

## Where the Galaxy stops holding on

Cosmic rays are charged, so they do not travel in straight lines: the magnetic field bends them into helices, and the radius of that helix — the **Larmor radius** — determines whether the Galaxy can hold on to them.

$r_L = \dfrac{p}{qB}$

For a 5-microgauss field:

| Energy | Larmor radius |
| --- | --- |
| 10⁹ eV | 2 × 10⁻⁷ pc (~10⁷ m) |
| 10¹² eV | 2 × 10⁻⁴ pc |
| 10¹⁵ eV | 0.2 pc |
| 10¹⁸ eV | 216 pc |
| 10²⁰ eV | 2 × 10⁴ pc |

The comparison to make is with the **thickness of the disk**, a few hundred parsecs. At GeV energies the gyroradius is smaller than the Solar System: such particles are thoroughly tied to field lines and wander the Galaxy for millions of years. At 10¹⁸ eV the gyroradius **matches the disk's half-thickness** — the Galaxy can barely bend such a particle before it leaves. At 10²⁰ eV the gyroradius exceeds the entire Galaxy by a factor of several, so the Milky Way is essentially transparent.

This computation produces one of the field's cleanest conclusions. The **ankle** — where the spectrum flattens — sits at ~3 × 10¹⁸ eV, precisely where confinement fails. Below it, cosmic rays are Galactic, accumulated and stored. Above it, the Galaxy cannot retain particles, so what is observed must be **extragalactic** — arriving from other galaxies, and passing straight through. A spectral feature and a geometric calculation agree, and the interpretation follows without adjustment.

The same reasoning explains why cosmic-ray astronomy is nearly blind directionally. Because the field scrambles trajectories, arrival directions carry almost no information about sources: the cosmic-ray sky is close to isotropic, and one cannot point back along a track to find its origin. Only at the very highest energies, where deflection is small, does directional astronomy become marginally possible — which is a principal motivation for studying particles whose flux is one per square kilometre per century.

## How long they stay: a radioactive clock

If cosmic rays travelled straight, they would cross the Galaxy's disk in a few thousand years. Do they leave that quickly?

The measurement uses a **radioactive clock** of considerable ingenuity. Cosmic rays fragment when they strike interstellar nuclei, producing secondary species — including **beryllium-10**, which is radioactive with a half-life of 1.4 million years, alongside stable beryllium-9. Both are made at a known ratio by the same spallation process. If cosmic rays leave the Galaxy quickly, the ¹⁰Be will not have had time to decay and the observed ratio will match production. If they linger, ¹⁰Be will be depleted, and by how much measures the elapsed time.

The measured ¹⁰Be/⁹Be ratio implies a residence time of roughly **15 million years** — about a thousand times longer than a straight-line crossing.

The conclusion is that cosmic rays do not stream out of the Galaxy; they **diffuse**, scattered repeatedly by magnetic irregularities, executing a random walk that keeps them confined far longer than their speed would suggest. A related measurement supports this: the ratio of secondary nuclei (boron, produced only by fragmentation) to primaries (carbon) measures how much material a typical cosmic ray traverses — about 5–10 g/cm², corresponding to a path length far exceeding the disk's thickness. Cosmic rays wander for millions of years through a volume including a substantial halo, before finally escaping.

```checkpoint
q: The Larmor radius of a 10¹⁸ eV proton in the Galaxy's 5-microgauss field is about 216 pc, comparable to the disk's half-thickness. The significance is that
a: such particles are accelerated most efficiently at this energy
x: The Larmor radius describes confinement, not acceleration efficiency. The acceleration ceiling for Galactic sources lies near the knee, three orders of magnitude lower.
a*: the Galaxy can no longer confine particles at this energy — which is why the ankle, marking the transition from Galactic to extragalactic cosmic rays, sits at almost exactly this energy
a: the magnetic field must be much stronger than 5 microgauss to explain the observations
x: The calculation uses the independently measured field strength and produces a result matching an observed spectral feature, which supports rather than challenges the field measurement.
a: these particles will spiral inward toward the Galactic centre
x: A magnetic field bends trajectories into helices about field lines; it does not draw particles toward the centre. Confinement is about whether the gyroradius fits within the system, not about inward drift.
hint: Compare the gyroradius with the size of the container. What happens when they become equal?
why: A particle can be held only if its gyroradius is small compared with the confining region. Below ~10¹⁸ eV the gyration is far smaller than the disk and cosmic rays are stored for millions of years; at that energy the radius matches the disk's half-thickness and confinement fails; above it the Galaxy is effectively transparent. That the ankle sits at exactly this energy is strong evidence that it marks the Galactic-to-extragalactic transition — a spectral feature and a geometric calculation agreeing with nothing adjusted.
---
q: The beryllium-10 clock shows that cosmic rays reside in the Galaxy for ~15 million years rather than the few thousand years a straight crossing would take. This establishes that cosmic rays
a: are produced continuously rather than in discrete events
x: Continuous production is indeed likely, but the ¹⁰Be measurement constrains how long particles *remain* after production, not the time structure of their sources.
a*: diffuse rather than stream — they are scattered repeatedly by magnetic irregularities, executing a random walk that confines them far longer than their speed alone would allow
a: travel much more slowly than the speed of light
x: Cosmic rays are relativistic and move at essentially light speed along their paths; the long residence time comes from the tortuous route, not from slow motion.
a: originate outside the Galaxy and are captured on arrival
x: The energy budget and the pion-bump detections place the origin of Galactic cosmic rays in supernova remnants within the Galaxy. Extragalactic origin becomes relevant only above the ankle.
hint: The particles move at nearly light speed but take a thousand times longer than a direct crossing. What does that say about the shape of the path?
why: ¹⁰Be and ⁹Be are produced together in known proportion by spallation, and only ¹⁰Be decays, so the observed ratio times the 1.4 Myr half-life measures elapsed time since production. Fifteen million years against a few thousand for a straight crossing means the path is enormously longer than the distance — a random walk imposed by scattering off magnetic irregularities. The secondary-to-primary ratio, showing 5–10 g/cm² of traversed material, independently confirms it.
```

{{image: Cosmic ray | A cosmic-ray air shower. A single primary particle striking a nucleus high in the atmosphere generates a cascade of billions of secondaries spread across square kilometres at ground level — which is how events with a flux of one particle per square kilometre per century are detected at all. Cosmic rays gave physics the positron, muon, pion and kaon before any accelerator could reach the relevant energies.}}

## Measuring a field of five microgauss

The interstellar magnetic field is about **5 microgauss** — roughly a hundred-thousandth of Earth's surface field, and a hundred million times weaker than a hospital MRI magnet. It divides into a **regular** component (~2 μG) that follows the spiral arms coherently, and a **turbulent** component (~3–5 μG) that fluctuates on scales from parsecs downward. Measuring something so faint across kiloparsecs requires four independent techniques, each with distinct strengths.

**Zeeman splitting** is the only direct measurement. A magnetic field splits spectral lines by an amount proportional to field strength, so the splitting of the 21 cm line or of OH maser lines measures $B$ along the line of sight. The effect is minuscule — a few hertz per microgauss — so it works only where the field is strong (dense clouds, masers), but it requires no modelling assumptions whatever.

**Synchrotron emission** is the workhorse. Relativistic electrons spiralling in the field radiate, at a frequency depending on field strength and electron energy: a GeV electron in 5 μG radiates near 80 MHz. The Galaxy's diffuse radio emission is largely synchrotron, so radio maps trace the field — with the caveat that intensity depends on the product of field strength and cosmic-ray electron density, so the two must be disentangled, usually by assuming equipartition between them. This is where cosmic rays and magnetic fields become observationally inseparable: **the standard method of measuring each requires the other**, which is a real limitation and a reason the two belong in one chapter.

**Faraday rotation** measures the line-of-sight field component with a sign. As polarised radiation traverses magnetised plasma, its plane of polarisation rotates by an amount proportional to wavelength squared and to the integral of electron density times the parallel field. Measuring the rotation at several wavelengths yields the **rotation measure**, and using pulsars — whose dispersion measures independently supply the electron column, as the Pulsars chapter described — the two together give the **mean field strength along the path**, sign included. Rotation measures toward thousands of pulsars and extragalactic sources have mapped the Galactic field's large-scale structure, including its **reversals**: regions where the field direction flips between arms, a feature no simple dynamo model comfortably explains.

**Dust polarisation**, as the previous chapter described, gives the field's orientation projected on the sky — perpendicular to the far-infrared emission's polarisation, parallel to starlight's. *Planck*'s all-sky polarised dust maps are the most detailed picture of Galactic field geometry available.

The four methods are complementary in exactly the right way: Zeeman gives strength directly but only where fields are strong; synchrotron gives strength but tangled with cosmic rays; Faraday gives the line-of-sight component with sign; dust polarisation gives the plane-of-sky orientation. Combining them yields a three-dimensional picture obtainable by no single technique — a recurring pattern in this block.

**Where the field comes from** is not settled. A **dynamo** is required: turbulent motions plus differential rotation can amplify a weak seed field exponentially and sustain it against decay, and the general framework is well established. The unresolved questions are the seed's origin — primordial fields from the early universe, or fields generated by the Biermann battery in early ionised gas, or ejection from the first stars — and whether dynamo amplification is fast enough to produce microgauss fields in galaxies observed at high redshift, where strong fields are already present when the universe was young. Observations of magnetised galaxies at early epochs put real pressure on the timescales.

```checkpoint
q: Synchrotron radio emission is the standard method for mapping the Galactic magnetic field, but its principal limitation is that the emission's intensity depends on
a: the temperature of the interstellar gas, which varies by orders of magnitude between phases
x: Synchrotron emission is non-thermal — it comes from relativistic electrons spiralling in the field and is independent of the gas temperature entirely. That independence is one of its advantages.
a*: both the field strength and the density of relativistic electrons, so the two must be disentangled — usually by assuming equipartition between them
a: the amount of dust along the line of sight, which absorbs radio waves
x: Dust is essentially transparent at radio wavelengths, which is precisely why radio astronomy could map the Galaxy where optical astronomy failed. Extinction is not a factor here.
a: the observer's velocity relative to the emitting region
x: Doppler effects shift frequencies slightly but do not compromise intensity-based field measurements at these velocities. The degeneracy is between field strength and particle density, not kinematic.
hint: What two ingredients does synchrotron radiation require? If you measure only the emitted power, how many unknowns does that leave?
why: Synchrotron power depends on the product of magnetic field strength and relativistic electron density, so one measurement constrains two unknowns. The usual escape is to assume rough equipartition between magnetic and cosmic-ray energy densities — reasonable given the observed near-equality of energy densities, but an assumption nonetheless. This is why cosmic rays and magnetic fields are treated together: the standard method of measuring either requires knowledge of the other.
---
q: Combining a pulsar's Faraday rotation measure with its dispersion measure yields the mean line-of-sight magnetic field because the two observables depend on
a: the same quantity, so their ratio is a consistency check rather than new information
x: They depend on different combinations, which is exactly why combining them is informative. A ratio of identical quantities would indeed be a mere check, but that is not the situation here.
a*: different combinations of the same path — dispersion on the electron column alone, rotation on the electron column weighted by the parallel field — so their ratio isolates the field
a: the distance to the pulsar, which must be known independently for either to be useful
x: Distance is needed to convert a column into a mean density, but the field determination from the *ratio* of the two measures does not require it, since the path length cancels between them.
a: the pulsar's spin period, which sets both the dispersion and the rotation
x: Neither quantity depends on the pulsar's rotation. The pulsar serves only as a source of polarised, sharply pulsed radiation; the measured effects are imposed entirely by the intervening medium.
hint: One effect counts electrons. The other counts electrons multiplied by the field along the path. What does dividing one by the other leave?
why: Dispersion measures the integrated electron column, while Faraday rotation measures that same column weighted by the parallel magnetic field. Dividing removes the electron content and leaves the density-weighted mean field along the line of sight, with its sign. Applied to thousands of pulsars and extragalactic sources, this has mapped the large-scale Galactic field including its reversals between arms — a structure that remains difficult for dynamo models to reproduce.
```

{{image: Interstellar magnetic field | The Galactic magnetic field mapped through polarised dust emission. At roughly five microgauss — a hundred-thousandth of Earth's surface field — it is far too weak to notice locally, yet it threads the whole disk, confines cosmic rays for tens of millions of years, resists the collapse of molecular clouds, and carries away the angular momentum that would otherwise prevent stars from forming.}}

## Why they matter

Two components carrying half the interstellar medium's energy inevitably shape it, and three consequences stand out.

**Cosmic rays push, and they do not cool.** Ordinary gas that is heated radiates the energy away, but cosmic rays are collisionless and radiate only feebly, so their pressure persists. Because they are tied to magnetic field lines and stream along them, they can push gas out of the disk far more effectively than thermal pressure alone, and modern galaxy-formation simulations find that cosmic-ray pressure is important in driving **galactic winds** — outflows that expel gas and regulate how much of it becomes stars. A component representing one particle in 10⁹ helps determine a galaxy's star-formation history.

**Cosmic rays are the only ionising agent deep inside molecular clouds**, and this is the most consequential item in the chapter. Ultraviolet starlight, which ionises and heats the diffuse medium, is absorbed by dust in the outer layers of a dense cloud — that shielding is what allows molecules to survive at all. But cosmic rays penetrate: they are energetic enough to pass through columns that stop photons entirely, and they maintain a small residual ionisation, roughly one part in 10⁷, throughout even the darkest cloud interiors.

That trace ionisation is not a detail. It is what **couples the gas to the magnetic field**. A perfectly neutral gas would ignore the field entirely; it is the charged fraction, tied to field lines and colliding with neutrals, that transmits magnetic forces to the bulk. The rate at which neutral gas slips relative to the field — **ambipolar diffusion** — depends directly on the ionisation fraction, and it governs how quickly a magnetised cloud core can shed magnetic support and collapse. Cosmic rays therefore set, through a chain of three steps, the timescale on which stars form:

**cosmic rays → residual ionisation → coupling of gas to field → rate of magnetic flux loss → collapse timescale.**

They also provide heating in cloud interiors where no other source reaches, and drive the ion-molecule chemistry that builds interstellar molecules, since the reaction networks in cold clouds are initiated by cosmic-ray ionisation of H₂ producing H₃⁺ — the starting point for essentially all interstellar chemistry.

**Magnetic fields resist collapse and remove angular momentum.** A magnetised cloud resists compression across field lines, adding support that gravity must overcome — one reason molecular clouds convert only a few per cent of their mass into stars per free-fall time, a puzzle the Star-Formation Cycle chapter takes up. Fields also transport angular momentum outward through **magnetic braking**, which is central to how a collapsing core sheds the rotation that would otherwise prevent it from becoming a star, and to launching the jets and outflows of young stellar objects.

```checkpoint
q: Deep inside a dense molecular cloud, cosmic rays are the only significant ionising agent because
a: ultraviolet photons are absent from the interstellar radiation field
x: The ultraviolet field is present throughout the Galaxy and dominates ionisation in the diffuse medium. What changes inside a cloud is not the field's existence but whether it can reach the interior.
a*: dust absorbs ultraviolet starlight in the cloud's outer layers, while cosmic rays are energetic enough to penetrate columns that stop photons completely
a: the gas is too cold for photoionisation to occur at any depth
x: Photoionisation depends on photon energy, not on gas temperature — a cold atom absorbs an ionising photon as readily as a warm one. Temperature is not the barrier; shielding is.
a: molecular hydrogen cannot be ionised by any process
x: H₂ is ionised routinely — by cosmic rays, which is precisely the process in question, producing H₂⁺ and then H₃⁺, the starting point of interstellar chemistry.
hint: What protects molecules in a dense cloud from being destroyed by starlight — and what can get through that protection anyway?
why: Dust shielding is what lets molecules survive inside clouds by blocking ultraviolet photons, but the same shielding removes the diffuse medium's main ionisation source. Cosmic rays pass through columns opaque to photons and maintain a residual ionisation of roughly one part in 10⁷ even in the darkest interiors — which turns out to matter enormously, because that trace of charge is what couples the gas to the magnetic field.
---
q: The residual ionisation maintained by cosmic rays governs the rate of star formation because a gas that is essentially neutral
a: cannot cool efficiently, so it never reaches the temperature required for collapse
x: Cooling in dense clouds is handled by molecular lines and by dust, and proceeds perfectly well at low ionisation. The connection between ionisation and star formation runs through magnetic coupling, not through thermal physics.
a: cannot form molecules, since molecule formation requires ions
x: The dominant molecule-formation route is grain-surface catalysis, which needs no ions at all. Ion-molecule chemistry does build the more complex species, but it is not what limits collapse.
a*: would not feel the magnetic field at all — it is the charged fraction, tied to field lines and colliding with neutrals, that transmits magnetic support to the bulk gas
a: would collapse instantly under its own gravity with nothing to oppose it
x: This has the causation inverted. Low ionisation weakens magnetic support and therefore *speeds* collapse, which is the point — but the collapse is not instantaneous, and thermal and turbulent pressure still resist.
hint: A magnetic field exerts force only on charges. How does that force reach the 99.99999% of the gas that is neutral?
why: Magnetic forces act on charged particles, so a neutral gas is invisible to the field; the coupling is indirect, through collisions between the trace ions locked to field lines and the surrounding neutrals. The rate at which neutrals slip past the field — ambipolar diffusion — therefore depends directly on the ionisation fraction, and that sets how fast a magnetised core can shed magnetic support and collapse. The chain runs from cosmic rays to ionisation to coupling to collapse timescale, which makes a component of one particle in 10⁹ a regulator of when stars form.
```

## Pulling the thread

- Cosmic rays are ~1 particle in 10⁹ of the interstellar medium yet carry ~1 eV cm⁻³ — matching the thermal energy density — because **each carries about a billion times a thermal particle's energy**. A population can dominate a budget by magnitude rather than by number.
- **Hess (1912)** found ionisation *rising* with altitude, locating the source above the atmosphere; an eclipse flight excluded the Sun. Cosmic rays then supplied the positron, muon, pion, and kaon before accelerators existed.
- The spectrum is a **power law over eleven decades** — the signature of a scale-free process — broken by the **knee** (~3 × 10¹⁵ eV, supernova remnants reaching their acceleration ceiling), the **ankle** (~3 × 10¹⁸ eV), and the **GZK cutoff** (~5 × 10¹⁹ eV, pion production off the CMB).
- The **supernova origin** rests on a budget that closes at **10% efficiency**, on **diffusive shock acceleration** producing a power law with nothing tuned, and — since 2013 — on the **pion bump** detected in IC 443 and W44, proving protons are accelerated there.
- The **Larmor radius** reaches the disk's half-thickness at 10¹⁸ eV, exactly where the ankle sits: below it cosmic rays are Galactic and stored, above it extragalactic and passing through. The same scrambling makes cosmic-ray astronomy nearly directionless.
- The **¹⁰Be clock** gives a residence time of ~15 Myr against a few thousand years for a straight crossing: cosmic rays **diffuse**, not stream.
- The ~5 μG field is measured four complementary ways — **Zeeman** (direct, strong fields only), **synchrotron** (degenerate with electron density), **Faraday rotation with pulsar dispersion** (line-of-sight component with sign), **dust polarisation** (plane-of-sky orientation). Its **dynamo origin** is understood in outline and unresolved in detail.
- Both components matter dynamically: cosmic rays **push without cooling** and help drive galactic winds; they are the **only ioniser deep inside clouds**, and that trace ionisation **couples gas to field**, setting the ambipolar diffusion rate and hence the collapse timescale; fields **resist collapse** and **remove angular momentum**.

The transferable idea: **energy density, not number density, determines what a component does.** Cosmic rays are outnumbered a billion to one and matter as much as everything they are outnumbered by, because importance in a dynamical system is measured in energy and momentum rather than in headcount. The same reasoning applies wherever a rare but energetic population coexists with an abundant quiescent one — a few relativistic electrons outshining a whole galaxy's thermal gas at radio wavelengths, a handful of high-energy photons dominating a chemical network, a small number of large events dominating a distribution of consequences. When tempted to neglect a component because it is rare, the right check is not how many there are but how much each one carries.

## Further reading

{{book: Malcolm Longair | High Energy Astrophysics | 2011}}

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Michael Friedlander | A Thin Cosmic Rain: Particles from Outer Space | 2000}}

Beyond the books: Hess's 1912 report of the balloon flights is short and its logic is fully visible; the *Fermi*-LAT pion-bump paper of 2013 is the observation that closed a century-old question, and its key figure is a spectrum with a break in it; and the Pierre Auger Observatory's results on the highest-energy events convey how strange the top of the spectrum remains.

## Problems

*Useful numbers: e = 1.602 × 10⁻¹⁹ C; c = 3 × 10⁸ m/s; 1 eV = 1.602 × 10⁻¹⁹ J; 1 pc = 3.086 × 10¹⁶ m; 1 erg = 10⁻⁷ J; Larmor radius r = p/(qB), with p ≈ E/c for relativistic particles; B = 5 μG = 5 × 10⁻¹⁰ T; ¹⁰Be half-life 1.4 Myr.*

**1.** *(One particle, one baseball.)* The Oh-My-God particle had E ≈ 3 × 10²⁰ eV. **(a)** Convert to joules. **(b)** A 145 g baseball thrown at 45 m/s has what kinetic energy? Compare. **(c)** Comment on what makes this remarkable given that the carrier was a single proton.

**2.** *(Where confinement fails.)* Using r = E/(ecB) with B = 5 μG: **(a)** compute the Larmor radius, in parsecs, for protons of 10¹², 10¹⁵, 10¹⁸, and 10²⁰ eV. **(b)** At which energy does the radius match the disk's ~300 pc half-thickness? **(c)** Relate your answer to the position of the ankle and state the physical conclusion.

**3.** *(The budget.)* Take the cosmic-ray energy density as 1 eV cm⁻³, a disk of radius 15 kpc and total thickness 600 pc, and a residence time of 10⁷ yr. **(a)** Compute the disk volume in cm³. **(b)** Compute the total cosmic-ray energy in erg. **(c)** Compute the power needed to sustain it. **(d)** Compare with two supernovae per century at 10⁵¹ erg each, and state the required efficiency.

**4.** *(The radioactive clock.)* **(a)** Explain why ¹⁰Be and ⁹Be together constitute a clock, and what fixes its zero point. **(b)** If the residence time were only 10⁴ years, what would the observed ¹⁰Be/⁹Be ratio look like relative to production? **(c)** Given the measured ~15 Myr, compute the ratio of the actual path length to a straight crossing of a 300 pc half-thickness, and state the implication.

**5.** *(Why the spectrum is a power law.)* In diffusive shock acceleration a particle gains a fixed *fractional* energy per cycle and has a fixed probability of escaping per cycle. **(a)** Explain qualitatively why this produces a power law rather than an exponential. **(b)** Explain why the mechanism is first-order in v/c while Fermi's original scheme was second-order. **(c)** State why producing the right functional form is stronger evidence than fitting the right normalisation.

**6.** *(Synchrotron degeneracy.)* Synchrotron emissivity depends on the product of cosmic-ray electron density and magnetic field strength (to a power). **(a)** Explain why a single intensity measurement cannot determine the field. **(b)** State the assumption normally invoked to break the degeneracy and what justifies it. **(c)** Name one measurement technique that does not suffer this degeneracy, and state its own limitation.

**7.** *(Faraday and dispersion together.)* A pulsar has DM = 30 pc cm⁻³ and RM = 49 rad m⁻². Using RM ≈ 0.81 ∫ n_e B_∥ dl (RM in rad m⁻², n_e in cm⁻³, B in μG, l in pc): **(a)** express the mean parallel field in terms of RM and DM. **(b)** Compute it. **(c)** Explain why the result is a *density-weighted* mean and what that implies about which regions dominate it.

**8.** *(Cosmic rays and star formation.)* **(a)** Write out the four-step causal chain from cosmic rays to the collapse timescale of a molecular cloud core. **(b)** Explain why ultraviolet photons cannot substitute for cosmic rays in the first step. **(c)** Predict qualitatively what would happen to star formation in a galaxy with a much lower cosmic-ray flux, and state which step in the chain drives the answer.

**9.** *(Rare but heavy.)* Cosmic rays number about one particle in 10⁹ of the interstellar medium yet carry comparable energy density to the thermal gas. **(a)** Estimate the ratio of a typical cosmic ray's energy to a thermal particle's at 8,000 K. **(b)** Show that this is consistent with the stated number and energy densities. **(c)** Give one further example, from anywhere in this block, of a rare component dominating a budget.

## Worked answers

**1.** **(a)** $3\times10^{20} \times 1.602\times10^{-19} = \mathbf{48\ J}$. **(b)** $\tfrac{1}{2}mv^2 = 0.5 \times 0.145 \times 45^2 = \mathbf{147\ J}$ — the same order of magnitude; a somewhat gentler throw matches it exactly. **(c)** A baseball contains ~10²⁵ nucleons sharing that energy; here **one proton** carries it. The Lorentz factor is ~3 × 10¹¹, so the particle travels within about one part in 10²³ of light speed — racing a photon to Andromeda, it would lose by under a second over 2.5 million years. No known astrophysical accelerator comfortably reaches these energies, and the origin of such particles remains open.

**2.** Using $r = E/(ecB)$ with $E$ in joules: **(a)** 10¹² eV → $\mathbf{2.2\times10^{-4}}$ pc; 10¹⁵ eV → **0.22 pc**; 10¹⁸ eV → **216 pc**; 10²⁰ eV → **2.2 × 10⁴ pc**. **(b)** At about **10¹⁸ eV** the gyroradius matches the disk's half-thickness. **(c)** The **ankle** sits at ~3 × 10¹⁸ eV, essentially the same energy. Below it the Galaxy confines cosmic rays, which accumulate over millions of years; above it particles cannot be bent enough to be retained, so the observed flux must be **extragalactic**, passing through. A geometric calculation and a spectral feature agree with nothing adjusted, which is why this identification is widely accepted.

**3.** **(a)** $V = \pi R^2 h = \pi (15 \times 3.086\times10^{21})^2 \times (600 \times 3.086\times10^{18}) = \mathbf{2.0\times10^{67}\ cm^3}$. **(b)** $E = 1\ \text{eV cm}^{-3} \times 1.602\times10^{-12}\ \text{erg eV}^{-1} \times 2.0\times10^{67} = \mathbf{3.2\times10^{55}\ erg}$ (the chapter's ~2 × 10⁵⁵ figure uses a slightly smaller effective volume). **(c)** $P = E/\tau = 3.2\times10^{55}/(10^{7} \times 3.156\times10^{7}\ \text{s}) = \mathbf{1.0\times10^{41}\ erg/s}$. **(d)** Supernova power $= 2 \times 10^{51}/(100 \times 3.156\times10^{7}) = 6.3\times10^{41}$ erg/s, so the required efficiency is **~16%** — of the same order as the canonical 10%, and the discrepancy is well within the uncertainties in disk volume, residence time, and supernova rate. The budget closes at a plausible efficiency, which is the argument's whole content.

**4.** **(a)** Both isotopes are produced together, in a ratio fixed by nuclear physics, when cosmic rays fragment on interstellar nuclei; ⁹Be is stable while ¹⁰Be decays with a 1.4 Myr half-life. The zero point is the moment of **production by spallation**, so the depletion of ¹⁰Be relative to the production ratio measures elapsed time since then. **(b)** At 10⁴ years — a fraction of a per cent of the half-life — essentially no ¹⁰Be would have decayed, and the observed ratio would be indistinguishable from the production ratio. **(c)** Path length exceeds a straight crossing by $1.5\times10^{7}/(300\ \text{pc}/c) \approx 1.5\times10^{7}/978 \approx \mathbf{1.5\times10^{4}}$ — the actual route is some ten thousand times longer than the direct distance. Cosmic rays therefore execute a random walk imposed by scattering off magnetic irregularities, wandering a large volume including the halo before escaping.

**5.** **(a)** Because each cycle **multiplies** the energy by a constant factor while removing a constant fraction of the particles, the number surviving to reach energy $E$ falls as a fixed power of $E$ — take logarithms and both energy gain and survival become linear in cycle number, so their ratio is constant and the spectrum is scale-free. An exponential would require a fixed energy *increment* per cycle rather than a fixed factor. **(b)** At a shock the two sides converge, so **every** crossing is head-on and gains energy, giving $\Delta E/E \sim v/c$; Fermi's original clouds moved randomly, so gains and losses nearly cancelled and only the second-order residual $(v/c)^2$ survived. **(c)** A normalisation can be fitted by adjusting free parameters such as efficiency or source rate, but the **exponent** emerges from the mechanism's structure with nothing to tune. A theory that predicts the shape of a distribution it was not built to reproduce is making a genuine prediction rather than accommodating data.

**6.** **(a)** Emissivity depends on the product of electron density and field strength, so one measured intensity gives one equation in two unknowns — any of infinitely many combinations reproduces it. **(b)** **Equipartition** between magnetic and cosmic-ray energy densities is assumed, justified by the observed rough equality of all the interstellar energy densities and by the physical expectation that the same shocks amplify fields and accelerate particles together. It remains an assumption, and fields derived this way inherit its uncertainty. **(c)** **Zeeman splitting** measures field strength directly with no assumption about particle populations; its limitation is sensitivity — the splitting is a few hertz per microgauss, so it is usable only where fields are comparatively strong, in dense clouds and masers, and not across the diffuse medium.

**7.** **(a)** $\text{RM} = 0.81 \int n_e B_\parallel\,dl$ and $\text{DM} = \int n_e\,dl$, so $\langle B_\parallel \rangle = \text{RM}/(0.81\,\text{DM})$. **(b)** $49/(0.81 \times 30) = \mathbf{2.0\ \mu G}$ — consistent with the regular field component quoted in the chapter. **(c)** Both integrals weight by electron density, so the ratio returns a mean **weighted by $n_e$**: regions of higher ionised density contribute disproportionately. The result therefore describes the field in the ionised gas along the path rather than a true volume average, and a sightline passing through a dense H II region will report that region's field far more than the diffuse medium's — one reason rotation measures toward many sources are combined rather than trusted individually.

**8.** **(a)** Cosmic rays penetrate the cloud and maintain a residual ionisation → the trace ions are tied to magnetic field lines and collide with neutrals, coupling the bulk gas to the field → that coupling sets the ambipolar diffusion rate, the speed at which neutral gas slips relative to the field → which determines how quickly the core sheds magnetic support and collapses. **(b)** Ultraviolet photons are absorbed by dust in the cloud's outer layers — the same shielding that permits molecules to survive — so they cannot reach the interior at all, whereas cosmic rays pass through columns opaque to photons. **(c)** Lower cosmic-ray flux means **lower ionisation**, hence **weaker coupling** between gas and field, hence **faster ambipolar diffusion** and more rapid loss of magnetic support: collapse would proceed more quickly. The driving step is the second — coupling — since it is the only place the ionisation fraction enters, and the effect is nonlinear enough that this is an active question in modelling star formation in low-metallicity and early-universe galaxies.

**9.** **(a)** A thermal particle at 8,000 K has $\tfrac{3}{2}kT \approx 1.0$ eV; a typical cosmic ray carries ~1 GeV, so the ratio is $\mathbf{{\sim}10^{9}}$. **(b)** If cosmic rays are outnumbered $10^{9}$:1 but each carries $10^{9}$ times the energy, the two energy densities are equal — which is precisely what is observed, both being ~1 eV cm⁻³. The consistency is exact and is the reason the coincidence is memorable. **(c)** **Dust**: one per cent of the interstellar medium's mass, yet supplying all its optical opacity, its principal heating and cooling, and the only route to molecular hydrogen. Also **massive stars**, which are a tiny fraction of stars by number yet dominate a galaxy's ultraviolet output, its heavy-element production, and its mechanical feedback — the same lesson that headcount is the wrong measure.$mwCRMag_master$,
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
