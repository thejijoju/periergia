-- Astronomy & Space · Stellar Death — Red Giants —
-- "The AGB and Thermal Pulses". Curated, human-reviewed master for
-- astronomy-and-space/stellar-death/red-giants/the-agb-and-thermal-pulses
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- NOTE: this node is NEW — added to src/lib/seed.ts and regenerated into
-- supabase/seed.sql in the same change. The addition is purely additive: no
-- existing node id changes, only the Pulsation sibling's position shifts
-- (4 -> 5), so cached content and quizzes for the other Red Giants nodes are
-- unaffected. It sits between Shell Burning and Pulsation, which is where the
-- chapter's own cross-references place it: it calls Pulsation "the next node",
-- and counts back three nodes to the helium flash and two to core helium
-- burning.
--
-- The last nuclear-burning phase of a low-mass star, and the one where almost
-- everything interesting happens: a structure whose envelope-to-core volume
-- ratio is 1.2e14, so that essentially the whole star is inert and 60% of its
-- mass sits in eight parts in a thousand trillion of its volume; the thin-shell
-- instability of Schwarzschild and Harm (1965), which is the third distinct way
-- this block breaks the stellar thermostat — not degeneracy failing step 2,
-- nor a trapped shell unable to move, but a shell that moves and gains nothing,
-- because pressure is set by the overlying weight at a radius that barely
-- changes; the resulting limit cycle of ~50,000 yr interpulse and ~200 yr flash
-- at 1e8 solar luminosities, buffered so completely that the surface luminosity
-- does not move; the 13C pocket releasing neutrons over thousands of years at
-- 1e7 cm^-3, so slowly that beta decay always wins and the s-process hugs the
-- valley of stability, building half of everything heavier than iron with peaks
-- at the neutron magic numbers; Merrill's 1952 technetium detection, a
-- categorical argument from a 2e5 yr half-life that is as close as astronomy
-- comes to watching nucleosynthesis happen; the C/O = 1 chemical cliff, where
-- the most tightly bound diatomic molecule consumes the minority element
-- entirely and the spectrum, dust, wind and appearance all flip together; hot
-- bottom burning above 4 Msun destroying the carbon and capping the carbon-star
-- luminosity; and death by mass loss rather than fuel exhaustion, via a
-- dust-driven superwind whose first stage is the pulsation itself.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-death/red-giants/the-agb-and-thermal-pulses',
    'research',
    'advanced',
    'read',
    $astroAGB_master$> Core helium is exhausted. The star now has an inert carbon–oxygen core, a helium-burning shell around it, and a hydrogen-burning shell outside that — and it is climbing the asymptotic giant branch, so named because it approaches the red-giant branch from the blue side on the H–R diagram. This is the last nuclear-burning phase of a low- or intermediate-mass star's life, it lasts about a million years, and it is where almost everything interesting happens. The structure is absurd; the two shells cannot burn at once; each pulse dredges freshly synthesised material to the surface; and the star does not die of fuel exhaustion but of mass loss. AGB stars are where roughly half the carbon in your body was made, and where about half the elements heavier than iron were assembled — one neutron at a time, over thousands of years.

{{image: Asymptotic giant branch | The asymptotic giant branch on the H–R diagram, approaching the red-giant branch from the blue side. A star spends about a million years here — its last nuclear-burning phase, and the one that returns half the carbon and half the heavy elements in the galaxy.}}

## A star that is almost entirely nothing

Take a 1 M☉ star on the thermally pulsing AGB and lay out its structure by radius.

| Region | Radius | Physical scale |
|---|---|---|
| **C/O core** | 0.006 $R_\odot$ | ~4,000 km |
| **Helium-burning shell** | just outside it | thickness ~1,000 km |
| **Hydrogen-burning shell** | 0.007 $R_\odot$ | thickness ~1,000 km |
| **Convective envelope** | **300 $R_\odot$** | **1.4 AU** |

Now take the ratio.

$$\frac{R_{\text{envelope}}}{R_{\text{core}}} = \frac{300}{0.006} = \mathbf{50{,}000}$$

$$\frac{V_{\text{envelope}}}{V_{\text{core}}} = \mathbf{1.2\times10^{14}}$$

The envelope extends to **1.4 astronomical units** — if this star replaced the Sun, its surface would lie beyond the orbit of Mars. And all of its nuclear energy is generated in two shells that together occupy a region **smaller than the Earth**, at the very centre.

> **Something like 99.999999999999% of the star's volume is inert.** It is a two-thousand-kilometre nuclear furnace wrapped in a structure the size of the inner solar system.

The mass distribution is almost as extreme: the core holds ~0.6 M☉ and the envelope ~0.4 M☉, so **the inert core is more than half the star's mass in a millionth of its volume.**

### And it is falling apart

The envelope at 300 $R_\odot$ is barely gravitationally bound — the Kelvin–Helmholtz time computed for a smaller giant on the red-giant branch was already only decades, and this one is looser still. It is **pulsating**, driven by an instability in its ionisation zones. And it is **being blown away**, at rates that will remove it entirely within ten thousand years.

**The AGB is not a stable configuration.** It is a star coming apart while a tiny furnace at its centre continues to run, and the interplay between those two facts is the content of this chapter.

## Two shells that cannot share

The obvious question about a double-shell star is why it does not simply burn both shells steadily. The answer is that **the configuration is unstable**, and understanding why requires a third distinct mode of thermostat failure.

**Schwarzschild and Härm** identified the mechanism in 1965, and it is purely **geometric.**

Consider a burning shell of thickness $D$ at radius $r$, and heat it slightly. In an ordinary burning region, the response is:

heat → pressure rises → **expansion** → cooling → rate falls → **stable**

For a **thin** shell, the third step fails in a specific way. The shell expands, but if $D \ll r$, expanding the shell barely changes its **radius** — a shell 1,000 km thick at 4,000 km can double its thickness while moving its midpoint by only a few hundred kilometres.

And the **pressure** at the shell is not set by the shell itself. It is set by the **weight of everything above it**, which depends on $r$ — and $r$ has barely changed.

$$\text{Thin shell expands} \quad\Longrightarrow\quad P \text{ essentially unchanged} \quad\Longrightarrow\quad T \text{ does not fall}$$

**So the shell heats without cooling, and the reaction rate keeps climbing.**

The approximate criterion for instability is

$$\frac{D}{r} \lesssim \frac{1}{4}$$

and an AGB helium shell has $D/r$ of order 0.1 or less — comfortably unstable.

### Three ways to break a thermostat

This is now the third distinct mechanism, and it is worth tabulating because the distinctions matter.

| Situation | Which step fails | Why |
|---|---|---|
| **Degenerate core** (the helium flash) | **Step 2**: $T \uparrow \Rightarrow P \uparrow$ | The **equation of state** has no temperature dependence |
| **Trapped shell** (red-giant branch ascent) | **Step 3**: $P \uparrow \Rightarrow$ expansion | The shell is **confined** between core and envelope |
| **Thin shell** (AGB pulse) | **Step 3**, differently | Expansion **does not reduce the pressure**, because pressure is set by the overlying weight at a radius that barely moves |

The second and third are related but not identical. On the red-giant branch the shell cannot expand at all; on the AGB it can expand, and expanding **does not help** — which is arguably worse, because the star has no way to signal the problem.

> **A thermostat can fail because the material does not respond, because it cannot move, or because moving does not change anything.** All three occur in a single star's lifetime.

### The cycle

The instability produces a **limit cycle**, and it is worth following through:

**1. Interpulse (~50,000 years).** The hydrogen shell burns steadily, converting hydrogen to helium and **depositing the ash onto the helium shell below.** The helium shell is inactive — too cool to burn. The star is quiescent. **This is ~90% of the time.**

**2. Ignition.** The accumulated helium layer grows and is compressed until it reaches ignition temperature. Being thin, it flashes.

**3. The flash (~200 years).** The helium shell luminosity rises to of order **10⁸ $L_\odot$** — briefly comparable to a small galaxy.

**4. Expansion and shutdown.** The flash energy expands the region above the helium shell. The **hydrogen shell is pushed outward, cools, and switches off entirely.**

**5. Power-down and dredge-up (~1,000 years).** With the hydrogen shell off, the convective envelope can penetrate **downward** into the intershell region, which is now enriched in freshly made carbon and s-process elements. **This is third dredge-up.**

**6. Contraction and restart.** The helium exhausts its fuel and switches off; the region contracts; the hydrogen shell reignites; the cycle repeats.

**Recurrence: 10⁴–10⁵ years**, shorter for more massive cores. A star experiences perhaps **10 to 50 pulses** during its AGB lifetime.

### And the surface barely notices

| | Interpulse | Flash peak |
|---|---|---|
| Helium shell luminosity | ~0 | **10⁸ $L_\odot$** |
| Hydrogen shell luminosity | ~7,000 $L_\odot$ | ~0 (off) |
| **Surface luminosity** | **~7,000 $L_\odot$** | **~7,000 $L_\odot$** |

**The surface luminosity is almost unchanged.** The envelope's enormous thermal inertia buffers the pulse exactly as it buffered the core helium flash, and the two shells hand off to each other in a way that keeps the total roughly constant.

**But unlike the core flash, the AGB pulse leaves an observable trace** — not in the brightness, but in the **composition.** That is the subject of the next two sections, and it is why the AGB is the phase where stellar nucleosynthesis became directly observable.

## Building the heavy elements

Between the pulses, in a thin layer at the top of the helium shell, the star manufactures about half of everything in the universe heavier than iron.

### Why iron is a wall

Binding energy per nucleon peaks at **iron-56**. Fusing lighter nuclei releases energy; fusing heavier ones **absorbs** it. So fusion stops at iron, and everything above must be built another way.

The other way is **neutron capture.** Neutrons are uncharged, so there is no Coulomb barrier — a neutron can walk into a nucleus at any energy. Capture builds heavier isotopes of the same element; when the isotope becomes unstable, a beta decay converts a neutron to a proton and the **element number rises.**

The question is which happens first, and the answer defines two entirely different processes.

### Slow versus rapid

| | **s-process** (slow) | **r-process** (rapid) |
|---|---|---|
| Neutron density | ~10⁷ cm⁻³ | **~10²² cm⁻³** |
| Time between captures | **10–100 years** | milliseconds |
| Beta decay half-life on the path | hours to days | hours to days |
| Which wins | **decay always** | **capture always** |
| Path on the nuclide chart | hugs the **valley of stability** | far to the neutron-rich side |
| Site | **AGB stars** | neutron star mergers, some supernovae |

The distinction is entirely about **which timescale is shorter.**

In the s-process, a nucleus captures a neutron and then waits — on average decades — before the next one arrives. If the new isotope is unstable, it has ample time to beta-decay first. **The path therefore never strays from stability**, stepping up the chart one nucleon at a time along the line of stable isotopes.

$$\text{capture} \rightarrow \text{wait} \rightarrow \text{decay if unstable} \rightarrow \text{capture} \rightarrow \dots$$

*(The r-process is the subject of a later block; it produces the elements the s-process cannot reach, including gold, platinum, uranium and thorium.)*

### Where the neutrons come from

This is the part that makes the AGB special, because free neutrons are not otherwise available in a star — they decay in about fifteen minutes.

**The main source is $^{13}\text{C}(\alpha,n)^{16}\text{O}$**, and the way the ¹³C gets there is intricate.

During third dredge-up, the convective envelope penetrates into the intershell region and leaves behind a small amount of **protons** mixed into helium-rich, carbon-rich material. When the region reheats, those protons are captured by ¹²C to make ¹³C, forming what is called the **¹³C pocket** — a thin layer, perhaps 10⁻³ M☉, of ¹³C-enriched material.

The pocket then burns radiatively during the interpulse phase, releasing neutrons **slowly over thousands of years** — exactly the condition the s-process requires.

*(A secondary source, $^{22}\text{Ne}(\alpha,n)^{25}\text{Mg}$, operates during the flash itself in more massive AGB stars, at higher neutron density and for a much shorter time.)*

### What gets made

The s-process builds up the chart in a characteristic pattern, with **abundance peaks at the neutron magic numbers** — nuclei with closed neutron shells have small capture cross-sections, so material accumulates there before proceeding:

| Peak | Elements | Neutron number |
|---|---|---|
| First | Sr, Y, Zr | $N = 50$ |
| Second | **Ba, La, Ce** | $N = 82$ |
| Third | **Pb** | $N = 126$ |

**About half of all the elements heavier than iron are made this way**, with the r-process supplying most of the rest.

> **Roughly half the strontium, barium, zirconium and lead in the universe — and in you — was assembled inside AGB stars, one neutron every few decades, and then dredged to the surface and blown into space.**

### The smoking gun

And there is a direct proof.

**Technetium has no stable isotope.** The relevant one produced by the s-process, ⁹⁹Tc, has a half-life of about **2 × 10⁵ years** — utterly negligible against a star's billions.

**Merrill detected technetium in the spectra of S-type AGB stars in 1952.**

Any technetium present when the star formed would have decayed away completely long before now. Its presence in the photosphere therefore means it was **made inside that star and brought to the surface within the last few hundred thousand years.**

**There is no alternative explanation and no model dependence.** The element is there; it cannot have been there long; it cannot have come from anywhere else.

> **Technetium in an AGB spectrum is the closest thing astronomy has to watching nucleosynthesis happen.**

*(The logical structure — a categorical conclusion from a threshold rather than a measurement — is the same as the lithium test for brown dwarfs and Titan's missing ³⁶Ar. A short half-life converts a detection into a clock.)*

## The chemical cliff

Third dredge-up changes the surface composition, and one of the changes has a disproportionate effect.

Each dredge-up episode brings freshly made **¹²C** to the surface. The oxygen abundance changes little. So the surface **C/O ratio rises**, pulse by pulse:

| Dredge-up episodes | C/O | Spectral type |
|---|---|---|
| 0 | 0.4 | **M star** — oxygen-rich |
| 3 | 0.7 | MS star |
| **6** | **1.0** | **S star — the transition** |
| 10 | 1.5 | **C star** — carbon star |
| 20 | 2.5 | strongly carbon-rich |

### Why crossing one matters so much

Because of a single molecule.

**Carbon monoxide is exceptionally stable** — a triple bond with a dissociation energy of 11.1 eV, the strongest of any diatomic molecule. In a cool stellar atmosphere, essentially **all** available carbon and oxygen lock up into CO first, before anything else can form.

Whichever element is in **excess** is then free to form other compounds. Whichever is in **deficit** is entirely consumed.

$$\textbf{C/O} < 1: \quad\text{all C locked in CO; excess \textbf{oxygen} remains}$$
$$\textbf{C/O} > 1: \quad\text{all O locked in CO; excess \textbf{carbon} remains}$$

And the consequences cascade:

| | C/O < 1 (M star) | C/O > 1 (carbon star) |
|---|---|---|
| Molecules | **TiO, VO, H₂O** | **C₂, CN, SiC, HCN** |
| Spectrum | TiO bands (defining M-type) | Swan bands of C₂ |
| **Dust** | **silicates** | **carbonaceous — soot** |
| Dust opacity | moderate | **high** |
| Wind driving | less efficient | **more efficient** |
| Appearance | red giant | **deep red, often heavily obscured** |

> **The star's spectrum, its chemistry, its dust, its wind and its appearance all change together when the ratio crosses one.** A compositional change of a few percent flips the observable nature of the object entirely.

{{image: Carbon star | A carbon star. Once dredge-up pushes the surface carbon-to-oxygen ratio past one, carbon monoxide consumes all the available oxygen and the leftover carbon forms soot — so the star reddens, its spectrum switches from titanium oxide bands to the Swan bands of C₂, and its wind grows more efficient at destroying it.}}

**This is a genuine threshold phenomenon**, and it is why carbon stars are a distinct observational class rather than the tail of a continuum. It also has a practical consequence: **counting carbon stars in a galaxy measures how many stars have completed enough thermal pulses**, which constrains the dredge-up efficiency — a parameter that models cannot compute reliably.

### Hot bottom burning

There is a mass-dependent complication worth knowing, because it produces an exception.

In AGB stars above about **4 M☉**, the base of the convective envelope becomes hot enough (~$8\times10^{7}$ K) for the **CNO cycle to operate there.** Material circulating through the envelope is therefore processed as it passes the bottom.

The CNO cycle converts carbon to **nitrogen.** So in these stars, the ¹²C brought up by dredge-up is destroyed before it can accumulate:

**Massive AGB stars do not become carbon stars.** They become **nitrogen-rich** instead, and the observed upper luminosity limit for carbon stars is direct evidence that hot bottom burning operates.

*(It also makes intermediate-mass AGB stars a significant source of cosmic nitrogen, and it is one of the candidate polluters invoked for the globular cluster multiple-population problem.)*

## How the star ends

Not by running out of fuel.

### The superwind

Mass loss on the AGB accelerates catastrophically as the star evolves:

| Phase | $\dot{M}$ (M☉/yr) | Duration |
|---|---|---|
| Early AGB | 10⁻⁸ | ~10⁶ yr |
| Thermally pulsing | 10⁻⁷ | ~10⁵ yr |
| **Superwind** | **10⁻⁵ to 10⁻⁴** | **~10⁴ yr** |

At superwind rates, a 0.4 M☉ envelope is removed in **4,000 to 40,000 years.**

Compare with the nuclear timescale: the core could continue burning for far longer, and there is plenty of hydrogen and helium left in the envelope.

> **The star does not run out of fuel. It runs out of star.**

**Mass loss terminates the AGB**, and it does so long before nuclear exhaustion — which is why a 1 M☉ star ends as a 0.54 M☉ white dwarf with most of its hydrogen unburnt.

### The mechanism requires two things

The superwind is **dust-driven**, and the mechanism has two stages that are both essential:

**Stage 1: pulsation lifts the material.** The AGB envelope pulsates with periods of hundreds of days and amplitudes of several magnitudes — these are the **Mira variables**. Each pulsation drives a shock through the atmosphere that levitates material to a few stellar radii, where the temperature has dropped below about **1,500 K** — cool enough for **dust to condense.**

**Stage 2: radiation pressure drives the dust.** Dust grains have enormous opacity per unit mass compared with gas. The star's radiation field pushes on them, and the grains — coupled to the gas by collisions — **drag the gas outward with them.**

**Neither stage works alone.** Without pulsation, the material never reaches a radius cool enough for dust to form. Without dust, radiation pressure on the gas is far too weak — line driving requires a hot star's ultraviolet field and millions of metal lines, and neither is available here.

> **The pulsation is not incidental to the mass loss; it is half of the engine.** This is why Miras and AGB mass loss are the same phenomenon, and why the next chapter — Pulsation — is a prerequisite for understanding how these stars die.

*(This also connects to the C/O cliff. A carbon star makes **carbonaceous** dust, which is more opaque than silicate dust in the relevant wavelengths — so becoming a carbon star **increases the mass-loss rate**, accelerating the star's own destruction. Dredge-up hastens the end it also makes possible.)*

### What is returned

| Initial mass | Final white dwarf | Returned | Fraction |
|---|---|---|---|
| 1 M☉ | 0.54 | 0.46 | **46%** |
| 2 M☉ | 0.63 | 1.37 | 68% |
| 3 M☉ | 0.70 | 2.30 | 77% |
| 5 M☉ | 0.85 | 4.15 | 83% |
| **8 M☉** | 1.10 | 6.90 | **86%** |

And the returned material is **enriched.** AGB stars are the dominant cosmic source of:

- **Carbon** — roughly half of all cosmic carbon
- **Nitrogen** — particularly from hot bottom burning
- **s-process elements** — about half of everything above iron
- **Interstellar dust** — both silicate and carbonaceous

> **AGB stars are the galaxy's principal chemical factories for the elements that are not made in supernovae**, and they deliver their product gently, at 10 km/s, rather than explosively.

That gentleness matters. Supernova ejecta are hot, fast and destructive; AGB winds are cool, slow and **dusty**, so the material survives to be incorporated into new molecular clouds. **A substantial fraction of the dust in the interstellar medium — including the grains that catalyse H₂ formation in molecular clouds — was made in AGB atmospheres.**

The loop closes: the dust that makes the molecules that make the clouds that make the stars was manufactured by dying stars three generations back.

## What happens next

The envelope is gone. What remains is the **exposed core** — a 0.5–1.1 M☉ ball of degenerate carbon and oxygen at 10⁵ K, and the ejected envelope drifting outward at ~10 km/s.

As the core is uncovered, its ultraviolet output **ionises the surrounding ejecta**, which fluoresces. The result is a **planetary nebula** — and the object at its centre cools and contracts onto the white dwarf sequence.

{{image: Cat's Eye Nebula | A planetary nebula: the ejected AGB envelope, lit up by the exposed core at its centre. The AGB wind is roughly spherical, yet observed planetary nebulae are overwhelmingly elliptical or bipolar — something breaks the symmetry between the two stages, and the leading suspect is a binary companion.}}

That is the subject of the next sub-block. Three things to carry forward:

**The white dwarf's mass is set here**, by the competition between core growth (which continues during the AGB as the shells add ash) and envelope removal. **Mass loss, not nuclear physics, determines the final mass** — which is why the initial–final mass relation is uncertain in proportion to the mass-loss rate.

**Its composition is set two chapters ago**, by the $^{12}\text{C}(\alpha,\gamma)^{16}\text{O}$ competition during core helium burning.

**And the planetary nebula's shape is set by something not yet discussed.** Observed planetary nebulae are overwhelmingly **bipolar or elliptical**, not spherical — while the AGB wind is roughly spherical. Something breaks the symmetry between the two stages, and the leading candidate is a **binary companion.** That is a live problem.

## Pulling the thread

- **The structure is absurd.** A C/O core of ~4,000 km, two burning shells of ~1,000 km each, inside an envelope of **1.4 AU** — a radius ratio of **50,000** and a volume ratio of **10¹⁴**. **Essentially the entire star is inert**, and more than half its mass sits in a millionth of its volume.
- **The two shells cannot burn steadily together.** A **thin shell** is unstable because expanding it barely changes its radius, so the pressure — set by the overlying weight — does not fall, so the temperature does not fall, so the rate climbs. This is the **third distinct way to break the thermostat**: degeneracy fails at step 2; a **trapped** shell fails at step 3 because it cannot move; a **thin** shell fails at step 3 because **moving does not help.**
- **The cycle:** ~50,000 years of quiet hydrogen burning (90% of the time), then a helium shell flash reaching **10⁸ $L_\odot$** for ~200 years, which switches the hydrogen shell **off**, allowing convection to dredge material up before the cycle restarts. **10 to 50 pulses** per star. **And the surface luminosity barely changes** — the envelope buffers it, as it buffered the core flash.
- **Between pulses, the star builds the heavy elements.** In the **¹³C pocket**, $^{13}\text{C}(\alpha,n)^{16}\text{O}$ releases neutrons over thousands of years at ~10⁷ cm⁻³ — so slowly that beta decay **always** wins, and the **s-process** path hugs the valley of stability. It builds **about half of everything heavier than iron**, with peaks at Sr–Y–Zr, Ba–La–Ce and Pb.
- **And technetium proves it.** ⁹⁹Tc has a half-life of 2 × 10⁵ years and no stable isotope, so its detection in AGB spectra (Merrill, 1952) means it was **made in that star within the last few hundred thousand years.** No alternative explanation exists. **The closest thing astronomy has to watching nucleosynthesis happen.**
- **Dredge-up raises the surface C/O ratio, and crossing one is a cliff.** Carbon monoxide is the most tightly bound diatomic molecule and forms first, consuming whichever element is scarcer. Below one: excess oxygen → TiO bands, **silicate dust**. Above one: excess carbon → C₂ bands, **carbon dust**. **The spectrum, chemistry, dust, wind and appearance all flip together.**
- **Above ~4 M☉, hot bottom burning destroys the carbon** at the base of the convective envelope, converting it to nitrogen — so massive AGB stars never become carbon stars, and the observed **upper luminosity limit for carbon stars** is the evidence.
- **The star dies of mass loss, not fuel exhaustion.** The **superwind** at 10⁻⁵–10⁻⁴ M☉/yr strips a 0.4 M☉ envelope in 4,000–40,000 years. The mechanism needs **both** stages: pulsation lifts material to where it is cool enough for **dust to condense at ~1,500 K**, and radiation pressure on the dust drags the gas out. **The pulsation is half the engine** — which is why Miras and AGB mass loss are one phenomenon.
- **And becoming a carbon star accelerates the end**, because carbonaceous dust is more opaque than silicate. **Dredge-up hastens the death it also makes possible.**
- **AGB stars return 46–86% of their mass**, enriched in carbon, nitrogen, s-process elements and **dust** — gently, at 10 km/s, so the grains survive. **The dust that catalyses H₂ formation in molecular clouds was made in the atmospheres of dying stars**, and the loop closes.

The transferable idea: three chapters ago the thermostat failed thermodynamically and produced a flash. Two chapters ago it worked and produced the most stable burning a star achieves. Here it fails **geometrically**, and produces a limit cycle — recurring, survivable, and productive. **The same broken feedback loop, failing in three different ways, produces an explosion, a rhythm, and the elements.** This chapter has twice made pulsation load-bearing — it is half the mass-loss engine, and it is what makes AGB stars observable as Miras — and the horizontal branch needed it too, for RR Lyrae. So arrive at the next chapter with this question: a star is a system in hydrostatic equilibrium with a thermostat, so why would it oscillate at all, and what makes an ionisation zone act as a valve rather than a damper?

## Further reading

The standard modern account of AGB evolution, dredge-up, the thermal pulse cycle and dust-driven mass loss is the multi-author volume {{book: Harm J. Habing | Asymptotic Giant Branch Stars | 2004}}, and the nuclear physics of neutron capture is developed in {{book: Donald D. Clayton | Principles of Stellar Evolution and Nucleosynthesis | 1983}}.

- **Harm J. Habing and Hans Olofsson (eds.), *Asymptotic Giant Branch Stars* (2004).** The reference work for the phase, with chapters on the thermal pulse cycle, third dredge-up, s-process nucleosynthesis, circumstellar chemistry and the dust-driven wind, each written by specialists and each explicit about which numbers are calculated and which are fitted.
- **Donald D. Clayton, *Principles of Stellar Evolution and Nucleosynthesis* (1983).** The standard reference on stellar nuclear astrophysics, including the neutron-capture chapters that derive the s-process path, the role of the magic-number cross-section minima, and why a slow neutron exposure produces the observed abundance peaks.
- **Maurizio Salaris and Santi Cassisi, *Evolution of Stars and Stellar Populations* (2005).** A graduate text that treats the thin-shell instability analytically and is unusually careful about the convective-boundary problem underlying the dredge-up efficiency parameter.

Beyond the books: the thin-shell instability is Schwarzschild and Härm's 1965 analysis; Merrill's technetium detection is a two-page 1952 *Astrophysical Journal* note that repays reading in the original; Herwig's 2005 *Annual Review of Astronomy and Astrophysics* article on AGB evolution is the compact modern survey; and Käppeler and collaborators' 2011 *Reviews of Modern Physics* review is the current reference on the s-process.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, $L_\odot = 3.828\times10^{26}$ W, 1 AU = 1.496 × 10¹¹ m, 1 yr = 3.156 × 10⁷ s, $R_\oplus$ = 6,371 km, $\sigma = 5.670\times10^{-8}$ W m⁻² K⁻⁴. AGB structure: core 0.006 $R_\odot$, envelope 300 $R_\odot$. Thin-shell instability criterion $D/r \lesssim 1/4$. Thermal pulse: interpulse ~50,000 yr, flash ~200 yr, peak He-shell luminosity ~10⁸ $L_\odot$. Superwind $\dot{M} = 10^{-5}$–$10^{-4}\,M_\odot$/yr. s-process neutron density ~10⁷ cm⁻³; r-process ~10²² cm⁻³. ⁹⁹Tc half-life 2 × 10⁵ yr. CO dissociation energy 11.1 eV.*

### 1 — A star that is almost entirely nothing
**(a)** Compute the ratio of envelope radius to core radius, and the corresponding volume ratio.
**(b)** Express the envelope radius in AU and compare with the orbits of Mars and Jupiter.
**(c)** Express the core radius in Earth radii.
**(d)** Given a core of ~0.6 M☉ and an envelope of ~0.4 M☉, compute the fraction of the star's mass in the core and the fraction of its volume.
**(e)** State, in one sentence, what is unusual about the distribution of nuclear burning in this star.

### 2 — Three ways to break a thermostat *(the structural argument)*
**(a)** State the five-step thermostat loop from hydrostatic equilibrium.
**(b)** For a **degenerate core**, identify the failing step and the physical reason.
**(c)** For a **trapped shell** on the red-giant branch, identify the failing step and the reason.
**(d)** For a **thin shell** on the AGB, identify the failing step and explain carefully why it differs from (c).
**(e)** Explain why a thin shell's expansion does not reduce its pressure. What sets the pressure, and why does it not change?
**(f)** State the approximate instability criterion and evaluate it for a shell of thickness 1,000 km at radius 4,000 km.
**(g)** Summarise the three failure modes in a single sentence.

### 3 — The pulse cycle
**(a)** Set out the six stages of a thermal pulse cycle in order, with approximate durations.
**(b)** State what fraction of the AGB lifetime is spent in the quiescent interpulse phase.
**(c)** Explain why the helium flash switches the hydrogen shell **off**, and why this matters for dredge-up.
**(d)** Compare the helium shell luminosity at peak with the surface luminosity. Explain why the surface barely changes.
**(e)** Contrast with the core helium flash of the red-giant branch: what is similar, and what is different in terms of observability?
**(f)** Estimate the number of pulses in a 10⁶ year AGB lifetime with a 5 × 10⁴ year recurrence time.

### 4 — Slow and rapid
**(a)** Explain why fusion cannot build elements heavier than iron, referring to binding energy per nucleon.
**(b)** Explain why neutron capture can, and what advantage a neutron has over a charged particle.
**(c)** Tabulate the s- and r-processes on neutron density, time between captures, which timescale wins, and the path taken on the nuclide chart.
**(d)** Compute the ratio of the two neutron densities.
**(e)** Explain precisely what "slow" means in "slow neutron capture" — slow relative to what?
**(f)** Explain how the ¹³C pocket forms, and why it releases neutrons over thousands of years rather than in a burst.
**(g)** Explain why the s-process abundance distribution has peaks, and name the elements at each.

### 5 — Technetium *(the categorical argument)*
**(a)** State the half-life of ⁹⁹Tc and compare with a stellar lifetime.
**(b)** Set out the argument from a technetium detection to a conclusion about nucleosynthesis, as a numbered chain.
**(c)** Explain why this is a categorical conclusion rather than a probabilistic one.
**(d)** Name two other arguments met earlier with the same logical structure, and state what all three have in common.
**(e)** What would falsify the argument? Consider carefully whether anything could.

### 6 — The chemical cliff
**(a)** Explain why the surface C/O ratio rises with successive dredge-up episodes.
**(b)** State the dissociation energy of CO and explain why it is the relevant quantity.
**(c)** Explain what happens to the excess element in each case, and tabulate the consequences for molecules, dust and wind driving.
**(d)** Explain why this constitutes a genuine threshold rather than a gradual transition.
**(e)** Explain why becoming a carbon star **accelerates** the star's destruction.
**(f)** Explain hot bottom burning, the mass above which it operates, and the observational evidence that it does.
**(g)** Counting carbon stars in a galaxy is used to constrain dredge-up efficiency. Explain the logic, and state one systematic that would limit it.

### 7 — Death by mass loss
**(a)** Tabulate the mass-loss rates through the AGB phases and compute how long a 0.4 M☉ envelope survives at superwind rates.
**(b)** State what actually terminates the AGB phase, and contrast with the naive expectation.
**(c)** Describe the two stages of the dust-driven wind and explain why neither works alone.
**(d)** State the temperature at which dust condenses and explain why pulsation is needed to reach a radius where it can.
**(e)** Explain why the pulsation is described as "half the engine" rather than a side effect.
**(f)** Using the initial–final mass relation, compute the fraction of its mass returned by a 1 M☉ and an 8 M☉ star.
**(g)** Explain why AGB winds contribute dust to the interstellar medium more effectively than supernovae do, and name the process from an earlier chapter that depends on this.

### 8 — Numerical
**(a)** An AGB star has $L = 7{,}000\,L_\odot$ and $T_{\text{eff}} = 3{,}000$ K. Compute its radius in $R_\odot$ and AU.
**(b)** Compute its mean density given a total mass of 1 M☉, and compare with air at sea level (1.2 kg/m³).
**(c)** During a flash the helium shell reaches 10⁸ $L_\odot$ for 200 years. Compute the total energy released and compare with the Sun's entire main-sequence output (~1.2 × 10⁴⁴ J).
**(d)** At $\dot{M} = 3\times10^{-5}\,M_\odot$/yr and an outflow speed of 10 km/s, compute the mass-loss rate in kg/s and the kinetic energy carried away over 10⁴ years.
**(e)** Compare (d) with (c) and comment.

### 9 — Open problem: how efficient is dredge-up?
Third dredge-up efficiency is a free parameter in every AGB model.
**(a)** Explain what the efficiency parameter represents physically and why it cannot be computed from first principles.
**(b)** Explain why the convective boundary during dredge-up is a particularly difficult numerical problem. Refer to the analogous problem from core helium burning.
**(c)** Name three observable quantities that constrain it, and state what limits each.
**(d)** Explain why the s-process abundance pattern is a more powerful constraint than the carbon star fraction.
**(e)** Planetary nebulae are overwhelmingly bipolar while AGB winds are roughly spherical. State the leading explanation and why it is a problem for the standard single-star picture.

## Worked answers

### 1 — A star that is almost entirely nothing

**(a)** $R_{\text{env}}/R_{\text{core}} = 300/0.006 = \mathbf{50{,}000}$. Volume ratio $= 50{,}000^3 = \mathbf{1.25\times10^{14}}$.

**(b)** $300 \times 6.957\times10^{8}/1.496\times10^{11} = \mathbf{1.40\ AU}$.

Mars orbits at 1.52 AU — **the star's surface nearly reaches it.** Jupiter at 5.20 AU is safely outside. So an AGB star placed at the Sun's position would engulf Mercury, Venus, Earth and very nearly Mars.

**(c)** $0.006 \times 6.957\times10^{8} = 4.17\times10^{6}$ m $= \mathbf{0.66\ R_\oplus}$ — the core is **smaller than the Earth.**

**(d)** Mass fraction in the core: $0.6/1.0 = \mathbf{60\%}$.
Volume fraction: $(0.006/300)^3 = \mathbf{8\times10^{-15}}$.

**Sixty percent of the mass in eight parts in a thousand trillion of the volume.**

**(e)** **All of the star's nuclear energy is generated in two shells occupying a region smaller than the Earth, at the centre of a structure 1.4 astronomical units across** — so essentially the entire object is inert material being heated from a point.

### 2 — Three ways to break a thermostat

**(a)** (1) Excess generation → core heats. (2) Higher $T$ → higher $P$. (3) Higher $P$ → expansion. (4) Expansion → cooling. (5) Steep rate → generation falls → **balance restored.**

**(b)** **Step 2 fails.** In degenerate matter $P = K\rho^{5/3}$ with **no temperature dependence** — the pressure arises from the Pauli exclusion principle rather than thermal motion, so heating the gas does not raise the pressure at all. It is a failure of the **equation of state.**

**(c)** **Step 3 fails.** The shell is geometrically **confined** between a contracting core below and a massive envelope above. Its pressure does rise when heated — the gas is perfectly ideal — but it **cannot expand**, because expanding would require lifting the entire envelope while the core beneath is shrinking rather than yielding.

**(d)** **Step 3 fails again, but for a different reason.** A thin shell **can** expand — it is not confined in the red-giant-branch sense. The problem is that expansion **does not achieve anything.**

The difference: on the red-giant branch the shell is prevented from moving; on the AGB it moves and the movement is useless. The second is arguably worse, because the system has no way to register that the response has failed — it does exactly what a stable system would do, and gets no benefit.

**(e)** Because the pressure at the shell is set by **hydrostatic equilibrium** — it must support the weight of everything above it, which depends on the **radius** $r$ at which the shell sits, not on the shell's own thickness.

For a thin shell with $D \ll r$, expanding by a factor of two in thickness moves the midpoint radius by only $\sim D/2$, a fraction $D/2r \ll 1$ of the radius. **The overlying weight is essentially unchanged**, so the pressure the shell must support is essentially unchanged, so the temperature does not fall.

For a **thick** region — a stellar core, say — expansion moves material a distance comparable to $r$ itself, the overlying weight genuinely decreases, the pressure falls, and the gas cools. **Thickness relative to radius is the whole difference.**

**(f)** Criterion $D/r \lesssim 1/4$. For $D = 1{,}000$ km at $r = 4{,}000$ km: $D/r = \mathbf{0.25}$ — **marginally unstable**, at the boundary.

Real AGB helium shells are thinner relative to their radius than this example (values of 0.1 or below are typical during the interpulse phase, as the shell is compressed), so they are comfortably unstable. **The example is deliberately at the threshold to show where the boundary lies.**

**(g)** **A thermostat can fail because the material does not respond to heating (degeneracy), because it cannot move (a trapped shell), or because moving does not change the pressure (a thin shell) — and all three occur in the life of a single low-mass star.**

### 3 — The pulse cycle

**(a)**
1. **Interpulse**, ~50,000 yr — hydrogen shell burns steadily, depositing helium ash on the shell below.
2. **Ignition** — the accumulated helium layer is compressed to ignition temperature.
3. **Flash**, ~200 yr — helium shell luminosity reaches ~10⁸ $L_\odot$.
4. **Expansion and shutdown** — the flash pushes the layers above outward; the hydrogen shell cools and **switches off.**
5. **Power-down and dredge-up**, ~1,000 yr — the convective envelope penetrates into the intershell.
6. **Contraction and restart** — helium exhausts, the region contracts, hydrogen reignites.

**(b)** Roughly **90%** — the interpulse phase dominates the cycle by an order of magnitude over everything else combined.

**(c)** Because the flash releases enough energy to **expand the region between the two shells**, pushing the hydrogen shell outward to a larger radius where it is cooler. Since hydrogen burning is steeply temperature-dependent ($T^{17}$ for CNO), a modest cooling extinguishes it.

**Why it matters for dredge-up:** while the hydrogen shell burns, it forms an **entropy barrier** that the convective envelope cannot penetrate — the envelope's convection stops at the top of the burning region. With the shell **off**, that barrier disappears, and convection can reach **down into the intershell region** where the freshly synthesised carbon and s-process elements are.

**Dredge-up is only possible during the brief window when the hydrogen shell is extinguished**, which is why it occurs once per pulse rather than continuously.

**(d)** Peak helium shell luminosity: 10⁸ $L_\odot$. Surface luminosity: ~7,000 $L_\odot$, essentially unchanged.

**Why:** the envelope's thermal timescale is far longer than the 200-year flash, so it absorbs the energy and releases it gradually. And the two shells **hand off**: as the helium shell switches on, the hydrogen shell switches off, so the total energy input to the envelope does not change much.

**Two independent buffering mechanisms**, which is why the surface response is so muted.

**(e)** **Similar:** both are thin-shell or degenerate runaways producing enormous internal luminosities; both are buffered by the envelope so that the surface barely responds.

**Different in observability:** the **core** flash occurs once, deep inside a star with a massive envelope, and produces **no observable consequence at all.** The **AGB shell** flash recurs 10–50 times, and each one **dredges material to the surface**, changing the photospheric composition measurably. **The evidence is chemical rather than photometric.**

Additionally, in **post-AGB** stars with much-reduced envelopes, a late thermal pulse *can* produce dramatic observable changes — Sakurai's Object.

**(f)** $10^{6}/(5\times10^{4}) = \mathbf{20\ pulses}$.

### 4 — Slow and rapid

**(a)** Because binding energy per nucleon **peaks at ⁵⁶Fe** (8.79 MeV). Fusing nuclei lighter than iron produces a more tightly bound product and **releases** energy; fusing nuclei heavier than iron produces a less tightly bound product and **absorbs** it.

A star cannot power itself by fusing beyond iron, so fusion stops there.

**(b)** Because a neutron is **uncharged** and therefore faces **no Coulomb barrier.** It can approach and enter a nucleus at arbitrarily low energy — indeed, capture cross-sections generally *increase* as the neutron energy falls.

The advantage over a charged particle is decisive: the Gamow suppression that makes ⁴He + ¹²C so slow simply does not apply. Neutron capture works at temperatures where charged-particle reactions on heavy nuclei are utterly impossible.

**(c)**

| | s-process | r-process |
|---|---|---|
| Neutron density | ~10⁷ cm⁻³ | ~10²² cm⁻³ |
| Time between captures | 10–100 yr | milliseconds |
| Which wins | **beta decay** | **capture** |
| Path | hugs the valley of stability | far to the neutron-rich side |

**(d)** $10^{22}/10^{7} = \mathbf{10^{15}}$.

**(e)** **Slow relative to the beta-decay half-lives of the unstable nuclei on the path**, which are typically hours to days.

The time between neutron captures is 10–100 years, so an unstable nucleus produced by a capture has **millions of half-lives** in which to decay before the next neutron arrives. **The decay always wins**, and the path therefore never moves more than one or two steps from stability.

The r-process is "rapid" in exactly the inverse sense: captures arrive in milliseconds, far faster than the decays, so a nucleus accumulates many neutrons before decaying, and the path runs far into the neutron-rich region.

**Neither term refers to an absolute rate.** Both describe a **comparison of two timescales**, and it is the comparison that determines the products.

**(f)** During **third dredge-up**, the convective envelope penetrates into the intershell region and leaves behind a small quantity of **protons** mixed into helium- and carbon-rich material.

When that region is reheated during the subsequent interpulse phase, the protons are captured by ¹²C: $^{12}\text{C}(p,\gamma)^{13}\text{N}(\beta^+)^{13}\text{C}$. The result is a thin layer — perhaps 10⁻³ M☉ — enriched in ¹³C: the **¹³C pocket.**

**Why the neutron release is slow:** the pocket burns **radiatively**, at the relatively modest temperatures of the interpulse phase, rather than explosively during the flash. $^{13}\text{C}(\alpha,n)^{16}\text{O}$ proceeds gradually over the **thousands of years** between pulses, maintaining a low steady neutron density — exactly the condition the s-process requires.

*(Had the neutrons been released in a burst during the flash, the density would be far higher and the products different — which is what happens with the secondary $^{22}\text{Ne}$ source in more massive AGB stars.)*

**(g)** Because nuclei with **closed neutron shells** — the magic numbers $N$ = 50, 82, 126 — have anomalously **small neutron-capture cross-sections.** Material reaching such a nucleus waits much longer than usual before capturing the next neutron, so it **accumulates** there.

The result is abundance peaks at the elements sitting at each magic number:

| Peak | $N$ | Elements |
|---|---|---|
| First | 50 | **Sr, Y, Zr** |
| Second | 82 | **Ba, La, Ce** |
| Third | 126 | **Pb** |

**The peaks in the cosmic abundance curve are a direct fingerprint of nuclear shell structure**, visible in the composition of the solar system.

### 5 — Technetium

**(a)** ⁹⁹Tc: half-life **2 × 10⁵ years.** A star's lifetime is 10⁹–10¹⁰ years — **four to five orders of magnitude longer.**

**(b)**
1. **Technetium is detected** in the photospheric spectrum of an S-type AGB star.
2. **⁹⁹Tc has a half-life of 2 × 10⁵ years**, and technetium has **no stable isotope.**
3. **Therefore any technetium present at the star's formation has decayed away** — after 10⁹ years, the surviving fraction is $2^{-5000}$, which is zero by any standard.
4. **Therefore the technetium observed was produced recently**, within the last few hundred thousand years.
5. **The only process that produces it is neutron capture**, and the only site available is the star's own interior.
6. **Therefore this star manufactured technetium and transported it to its surface** within the last ~10⁵ years.

**(c)** Because the intermediate step is not a probability but an **impossibility.** After a billion years, the fraction of original technetium surviving is $2^{-5000} \approx 10^{-1500}$ — not "unlikely," but smaller than any number that could describe a physical quantity.

There is no version of the primordial hypothesis that survives, however generous one is with the assumptions. **The conclusion does not depend on a model, a calibration or a threshold choice.**

**(d)** **The lithium test for brown dwarfs:** detecting lithium in a cool object of sufficient age proves it is substellar, because any object above 0.06 M☉ would have destroyed it. **Titan's missing ³⁶Ar:** the absence of primordial argon proves the nitrogen arrived as ammonia rather than N₂.

**What all three share:** a **threshold rather than a measurement.** Each turns on a categorical fact — the element is destroyed or it is not, the temperature was reached or it was not — so the conclusion is binary and model-independent. Two of the three argue from an **absence** and one from a **presence**, but in each case the informative quantity is whether a process ran to completion.

**(e)** **Essentially nothing could falsify it**, and it is worth being precise about why that is a strength here rather than a defect.

The candidates and their failures: **a longer half-life** — measured in the laboratory, not inferred. **Misidentified lines** — the spectroscopy is unambiguous and has been repeated. **Accretion from a companion** — would require the companion to be an AGB star making technetium, which relocates the conclusion rather than avoiding it. **A primordial origin** — excluded by 1,500 orders of magnitude.

The argument is unfalsifiable **not because it is vague but because the alternatives are excluded by an enormous margin.** That is different from an unfalsifiable claim in the pejorative sense, which fails because it forbids nothing. This one forbids a great deal — it would have been falsified by *not detecting* technetium, which is exactly what one would have expected before 1952.

### 6 — The chemical cliff

**(a)** Because each dredge-up episode brings **freshly synthesised ¹²C** from the intershell region to the surface, while the oxygen abundance is essentially unchanged — oxygen is not a significant product of helium shell burning in these stars.

Carbon accumulates; oxygen does not; **the ratio rises monotonically with the number of pulses.**

**(b)** **11.1 eV** — the highest dissociation energy of any diatomic molecule.

**Why it is the relevant quantity:** in a cool stellar atmosphere, molecules form and dissociate in equilibrium, and the most tightly bound species forms **preferentially and essentially completely.** CO's exceptional stability means that carbon and oxygen combine into CO before either can form anything else, so the CO abundance is set by whichever element is **less** abundant, and that element is entirely consumed.

**(c)** The **excess** element is left over and free to form other compounds; the **deficient** element is entirely locked into CO.

| | C/O < 1 | C/O > 1 |
|---|---|---|
| Excess element | oxygen | carbon |
| Molecules | TiO, VO, H₂O | C₂, CN, SiC, HCN |
| Spectral signature | **TiO bands** (defining M-type) | **Swan bands** of C₂ |
| Dust | **silicates** | **carbonaceous (soot)** |
| Dust opacity | moderate | **higher** |
| Wind driving | less efficient | **more efficient** |

**(d)** Because the transition is controlled by a **competition for a limited resource**, and the winner takes essentially everything.

A gradual transition would occur if both elements were partly available across the crossover. Instead, CO consumes the minority species completely, so at C/O = 0.99 there is **no free carbon at all** and at C/O = 1.01 there is **no free oxygen.** The change in the excess element is not gradual — it is a switch.

**A few percent change in composition produces a complete change in the atmospheric chemistry, the emergent spectrum, the condensed dust species and the wind efficiency.**

**(e)** Because **carbonaceous dust is more opaque** than silicate dust at the relevant wavelengths, and the superwind is **dust-driven.**

More opaque dust means radiation pressure couples more efficiently to the outflowing material, so the mass-loss rate **increases** when the star becomes carbon-rich.

**Dredge-up therefore hastens the end it also makes possible** — the process that brings carbon to the surface, and thereby produces the enrichment the galaxy depends on, also accelerates the removal of the envelope that permits further dredge-up. **The star's most productive activity is also what kills it.**

**(f)** **Hot bottom burning:** in AGB stars above about **4 M☉**, the base of the convective envelope reaches ~8 × 10⁷ K — hot enough for the **CNO cycle to operate there.**

Since the envelope is convective, all of it circulates through that hot base, and the CNO cycle converts **carbon to nitrogen.** The ¹²C delivered by dredge-up is therefore destroyed before it can accumulate.

**Consequence: massive AGB stars do not become carbon stars.** They become **nitrogen-rich** instead.

**The observational evidence:** there is an observed **upper luminosity limit for carbon stars.** Since AGB luminosity correlates with core mass and hence with initial mass, the absence of carbon stars above a certain luminosity is direct evidence that something destroys carbon in the more massive objects — which is what hot bottom burning does.

**(g)** **The logic:** a star becomes a carbon star only after enough dredge-up episodes to push C/O above 1. The **number of pulses required** depends on how much carbon each episode delivers — the dredge-up efficiency. So the **fraction of AGB stars in a galaxy that are carbon stars** measures how efficiently dredge-up operates, given the population's mass and metallicity distribution.

**A limiting systematic:** the fraction depends on **metallicity** as well as on efficiency, and in the opposite direction. A metal-poor star has less initial oxygen, so **less carbon is needed to cross C/O = 1** — metal-poor populations produce carbon stars more readily at any given efficiency. Disentangling the two requires knowing the metallicity distribution independently, and the two effects are partly degenerate.

*(Also creditable: carbon stars are heavily dust-obscured, so optical surveys undercount them — the observability bias of molecular clouds and protostars, in a new setting.)*

### 7 — Death by mass loss

**(a)**

| Phase | $\dot{M}$ (M☉/yr) | Duration |
|---|---|---|
| Early AGB | 10⁻⁸ | 10⁶ yr |
| Thermally pulsing | 10⁻⁷ | 10⁵ yr |
| **Superwind** | **10⁻⁵–10⁻⁴** | **10⁴ yr** |

At $10^{-5}$: $0.4/10^{-5} = \mathbf{40{,}000\ yr}$. At $10^{-4}$: $\mathbf{4{,}000\ yr}$.

**(b)** **Mass loss terminates the AGB.** The envelope is stripped away, exposing the core, long before nuclear fuel is exhausted.

**The naive expectation** is that a star's life ends when it runs out of fuel — which is what happens on the main sequence and during core helium burning. Here it does not: substantial hydrogen and helium remain in the envelope when the star ends its nuclear life, and they are simply **carried away.**

**The star does not run out of fuel; it runs out of star.**

**(c)** **Stage 1 — pulsation lifts the material.** The Mira pulsation drives shocks through the atmosphere that levitate gas to a few stellar radii, where the temperature has fallen below ~1,500 K.

**Stage 2 — radiation pressure drives the dust.** Dust condenses at that temperature, and grains have very high opacity per unit mass. The radiation field pushes on the grains, which drag the gas outward by collisional coupling.

**Neither works alone.** Without **pulsation**, the gas never reaches a radius cool enough for dust to condense — close to the star it is too hot, and static atmospheres do not extend far enough. Without **dust**, radiation pressure on gas alone is utterly insufficient for a cool star: the relevant opacity is far too low, since line driving requires the hot star's ultraviolet field and millions of metal lines, neither available here.

**(d)** ~**1,500 K** — the condensation temperature for the relevant grain species (silicates or carbon).

The photosphere is at ~3,000 K, so dust cannot form there. The temperature falls with radius, but in a **static** atmosphere the density falls faster than the temperature, so by the time the gas is cool enough there is too little of it to matter.

**Pulsation solves this by moving material outward faster than a static atmosphere would allow** — the shock lifts dense gas to a radius where it can cool and condense while still dense enough for the resulting dust to couple effectively to the radiation field.

**(e)** Because without it there is **no mass loss**, and without mass loss the star does not end — the AGB would continue until nuclear exhaustion, producing a completely different final mass and a completely different chemical return to the galaxy.

Describing the pulsation as a side effect would suggest the star pulsates and, incidentally, also loses mass. **The correct statement is that the pulsation is the first stage of a two-stage mass-loss mechanism**, and removing it removes the outcome.

**(f)** 1 M☉ → 0.54: $(1-0.54)/1 = \mathbf{46\%}$.
8 M☉ → 1.10: $(8-1.10)/8 = \mathbf{86\%}$.

**(g)** Because AGB winds are **cool, slow and dense**, so dust grains **condense in them and survive.** The outflow is at ~10 km/s and the material is at ~1,000 K — conditions in which grains grow and are not destroyed.

Supernova ejecta are **hot, fast (thousands of km/s) and pass through a reverse shock**, which sputters and destroys much of the dust that forms. Supernovae do produce dust, but a substantial fraction is destroyed before it reaches the interstellar medium.

**The process that depends on this: H₂ formation on grain surfaces.** The gas-phase route to molecular hydrogen is closed because it requires a three-body encounter; essentially all H₂ in the universe is manufactured on dust grains.

**So the dust made in the atmospheres of dying AGB stars is what enables the molecular clouds in which new stars form.** The cycle closes across three stellar generations.

### 8 — Numerical

**(a)** $R = \sqrt{L/4\pi\sigma T^4} = \sqrt{7000(3.828\times10^{26})/[4\pi(5.670\times10^{-8})(3000)^4]} = 2.16\times10^{11}$ m $= \mathbf{310\ R_\odot} = \mathbf{1.44\ AU}$.

**(b)** $\rho = 1.989\times10^{30}/[\tfrac{4}{3}\pi(2.16\times10^{11})^3] = \mathbf{4.8\times10^{-5}\ kg/m^3}$.

Compared with air: $4.8\times10^{-5}/1.2 = \mathbf{4\times10^{-5}}$ — about **one twenty-five-thousandth** of air's density.

**Comment:** the mean density is comparable to a good laboratory vacuum, and the outer layers are far thinner still. This is the physical basis for the envelope being so loosely bound and so easily removed.

**(c)** $E = 10^{8}(3.828\times10^{26})(200)(3.156\times10^{7}) = \mathbf{2.4\times10^{44}\ J}$.

Compared with the Sun's entire main-sequence output of ~1.2 × 10⁴⁴ J: **a factor of 2.**

**A single 200-year helium shell flash releases about twice the energy the Sun emits in ten billion years.** And the surface luminosity barely changes, because the envelope absorbs it.

**(d)** $\dot{M} = 3\times10^{-5}(1.989\times10^{30})/3.156\times10^{7} = \mathbf{1.9\times10^{18}\ kg/s}$.

Mass lost over 10⁴ yr: $0.3\,M_\odot = 5.97\times10^{29}$ kg.
$E_K = \tfrac{1}{2}mv^2 = \tfrac{1}{2}(5.97\times10^{29})(10^{4})^2 = \mathbf{3.0\times10^{37}\ J}$.

**(e)** Flash energy / wind kinetic energy $= 2.4\times10^{44}/3.0\times10^{37} = \mathbf{8\times10^{6}}$.

**Comment:** the nuclear energy released in a **single flash** exceeds the kinetic energy of the entire superwind — the whole envelope, ejected — by **seven orders of magnitude.**

The wind is energetically trivial. What makes it decisive is not the energy but the **momentum coupling**: radiation pressure on dust transfers momentum efficiently at very low energy cost, and it is momentum, not energy, that removes a loosely bound envelope. **A process can dominate a star's fate while being energetically negligible**, which is worth remembering whenever an energy budget is used to argue that something is unimportant.

### 9 — Open problem: how efficient is dredge-up?

**(a)** It represents **how deeply the convective envelope penetrates into the intershell region after each flash**, and hence how much processed material is brought to the surface per pulse — conventionally parametrised as $\lambda$, the fraction of the mass by which the core grew during the interpulse that is subsequently dredged up.

**Why it cannot be computed:** it depends entirely on the behaviour of the **convective boundary** — where convection stops, and whether material is mixed across the formal Schwarzschild boundary by overshooting. That is precisely the aspect of convection that mixing-length theory does not address: MLT describes transport *within* a convective region and says nothing about its edge.

**(b)** Because the boundary sits at a **steep composition discontinuity** — helium- and carbon-rich material below, hydrogen-rich above — and the position of the boundary depends on the composition, which depends on the mixing, which depends on the boundary.

**The problem is circular and numerically ill-conditioned**, and different codes make different choices about how to resolve it, producing dredge-up efficiencies that differ substantially.

**The analogous problem from core helium burning:** the growing convective core, where the conversion of He to C and O raises the opacity, pushes the boundary outward, engulfs fresh fuel, and produces "breathing pulses" that may or may not be physical. **Both are convective-boundary problems at a composition discontinuity**, and both are unresolved for the same reason.

**(c)** **The carbon star fraction** in a population — but it is degenerate with metallicity and biased by dust obscuration. **The s-process abundance pattern** in AGB stars and in their descendants — but interpreting it requires knowing the ¹³C pocket mass, which is itself uncertain. **The initial–final mass relation** — but it is also sensitive to the mass-loss rate, which is uncertain by a factor of a few.

**Each constraint is degenerate with a different uncertain parameter**, which is why the problem has resisted resolution.

**(d)** Because the s-process pattern contains **many numbers rather than one.**

The carbon star fraction is a **single** quantity, so it constrains a single combination of parameters and cannot separate efficiency from metallicity.

The s-process pattern is a **distribution across dozens of elements**, with the relative heights of the three abundance peaks depending on the **total neutron exposure**, which depends on the number of dredge-up episodes and the ¹³C pocket size. Fitting many abundances with few parameters is **overdetermined**, so the fit can fail — and a constraint that can fail is worth far more than one that cannot.

**This is the overdetermination criterion from spectral classification applied to nucleosynthesis.**

**(e)** **The leading explanation is a binary companion.**

An AGB star's wind is roughly spherical, but if a companion is present, its orbital motion and gravity shape the outflow — concentrating material toward the orbital plane and producing a density contrast that channels the subsequent fast wind into a **bipolar** structure. Common-envelope evolution, jets from an accreting companion, and orbital angular momentum all contribute.

**Why it is a problem for the standard single-star picture:** planetary nebulae are **overwhelmingly** aspherical — the great majority are elliptical or bipolar, and round ones are a minority. If binarity is required to produce that shape, then **most planetary nebulae come from binaries** — which conflicts with the observed binary fraction of their progenitor population unless the fraction is higher than measured, or unless very wide binaries and even planets can do the job.

**Either most planetary nebulae have companions that have not been found, or something else breaks the symmetry.** The question is open, and it matters beyond aesthetics: if binarity shapes the ejection, it may also affect the mass-loss rate and hence the initial–final mass relation, which would propagate into white dwarf masses and Type Ia supernova progenitors.$astroAGB_master$,
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
