-- Astronomy & Space · The Solar System — Origins —
-- "The Disk and the Snow Line: The Boundary That Wrote the Solar System" (from
-- ASTRO-201, Block 1 Lecture 4 -- THE CAUSAL HEART OF THE BLOCK). Curated,
-- human-reviewed master for
-- astronomy-and-space/solar-system/origins/the-disk-and-the-snow-line @
-- research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Original, house-styled rework: the asteroid belt as a boundary you can still see
-- (dry S-type Vesta vs wet C-type Ceres); the minimum-mass solar nebula and the
-- r^-3/2 surface density; the disk's cosmic composition (water 0.6% outweighs rock
-- 0.4%); the CONDENSATION SEQUENCE turning a temperature gradient into a spatial one;
-- LOCATING THE LINE by T(r)=280 r^-1/2 -> 2.71 AU (and the honest note that the line
-- swept inward); THE SOLID DENSITY JUMP (2.5x, decisive only because water is
-- abundant) and the race against the 3-10 Myr gas-dispersal deadline; the complete
-- causal chain distance->...->rock or giant; the THREE FOSSILS (planet densities with
-- Saturn floating, the asteroid-belt positional gradient, and the Galilean moons as an
-- independent instance in miniature); and the EXOPLANET TEST (hot Jupiters, migration,
-- metal-rich stars, and super-Earths -- the mechanism generalizes but our outcome does
-- not). The four-sentence physical explanation of the solar system's architecture.
--
-- VISUALS (engagement pass): embeds a ```condensation explorer (which of six materials
-- are solid vs vapour at each disk distance, with the derived water/ammonia/methane
-- lines; CondensationLadder.tsx) and a ```densitydivide explorer (planet density vs
-- distance split at the snow line, toggling to the Galilean moons for the same pattern
-- in miniature; DensityDivide.tsx). Three interactive ```example practice boxes
-- (surface-density, condensation-line, solid-jump; WorkedExample.tsx), and {image: ...}
-- markers resolving to real imagery (Ceres, Saturn, the Galilean moons). Light inline
-- KaTeX (paired '$'; even count asserted); the dollar-quote tag is checked for
-- collisions.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/origins/the-disk-and-the-snow-line',
    'research',
    'advanced',
    'read',
    $astroDisk_master$> This is the causal heart of the whole story of origins. Everything before it has been preparation — the yardstick of the astronomical unit, the central Sun and its flux gradient, the collapse that produced a rotating disk — and everything after it is consequence. Here we examine the **protoplanetary disk** itself, and we establish the single fact from which the architecture of the entire solar system follows: **the disk had a temperature gradient, and that gradient determined which materials could condense into solid grains at which distances.** Near the young Sun it was hot enough that only metals and silicates could solidify; farther out, past a boundary at roughly **2.7 AU**, it was cold enough for water to freeze into ice. And because water is enormously more abundant than rock — hydrogen and oxygen being the first and third most common elements in the universe — crossing that boundary multiplied the available solid material by a factor of **two to three**. That multiplication was decisive, because planet formation was a *race*: the disk's gas dispersed within three to ten million years, and only a body that assembled a core of roughly ten Earth masses *before the gas vanished* could capture the enormous hydrogen–helium envelope that makes a giant planet. Outside the snow line, with two to three times more solid material to work with, that race was winnable. Inside, it was not. **Four small rocky worlds and four giants: one boundary, one consequence.** We will derive the position of that line from the disk's temperature profile (and find, satisfyingly, that the simple calculation gives 2.71 AU), work through the full **condensation sequence** — the ordered list of what freezes out at what temperature, from refractory oxides at 1,700 K down to nitrogen ice at 25 K — and then, most convincingly, look at the **fossil evidence still visible today**. Because this is not merely a theoretical construction: the snow line left marks we can still read. The densities of the planets divide sharply at the line. The asteroid belt, which straddles it, still preserves a compositional gradient — dry stony bodies in its inner regions, water-bearing carbonaceous bodies outside, with Ceres at 2.77 AU holding perhaps a quarter of its mass as water ice. And the Galilean moons of Jupiter show the *same pattern in miniature*, their densities falling with distance from a body that had its own heat and its own condensation gradient. **The snow line is not a hypothesis we impose on the solar system; it is a boundary we can still see.** We will also be honest about the complications — the line moved as the disk evolved, real disks are more complex than simple models, and the position depends on assumptions — because the concept is robust even where the details are not. By the end of this chapter, the two-family architecture of the solar system should feel not like a curious fact to memorize but like an inevitability.

## The boundary you can still see

Go out to the asteroid belt — the region between Mars and Jupiter, from about 2.1 to 3.3 AU, where hundreds of thousands of rocky bodies orbit the Sun. It is a region we will study properly in a later chapter. For now, notice something about it that is easy to miss and, once seen, is startling.

**The asteroids are not all the same, and their composition changes systematically with distance from the Sun.**

In the *inner* belt, from roughly 2.0 to 2.5 AU, the dominant population is what astronomers classify as **S-type** asteroids: stony bodies, made of silicate rock and metal. They are dry. The largest well-studied example is Vesta, at 2.36 AU — a differentiated body with a basaltic crust, an iron core, and essentially no water. It is, in composition, a small rocky planet.

In the *outer* belt, from roughly 2.7 to 3.5 AU, the dominant population shifts to **C-type** asteroids: dark, carbonaceous bodies, rich in carbon compounds and — crucially — **water**, bound in hydrated minerals and, in the larger bodies, present as actual ice. The largest object in the belt, **Ceres**, sits at 2.77 AU and is estimated to be something like **a quarter water by mass** — an object more comparable to an icy moon than to a rock.

{{image: Ceres (dwarf planet) | Ceres, the largest body in the asteroid belt, photographed by the Dawn spacecraft. At 2.77 AU — just outside the snow line — it is estimated to be roughly a quarter water by mass, an object more like an icy moon than a rock. Its dry, stony neighbour Vesta, at 2.36 AU on the other side of the line, has essentially no water at all. Two bodies in the same belt, less than half an astronomical unit apart, one bone-dry and one a quarter ice: the snow line, preserved in place for four and a half billion years.}}

So: dry stony bodies on one side, wet carbonaceous bodies on the other, with the transition occurring around 2.7 AU. The asteroid belt contains a **compositional boundary**, preserved in place, running right through the middle of it.

Now ask why. These bodies have been orbiting in that region for four and a half billion years. They are, as a later chapter will detail, the *leftovers* — planetesimals that never assembled into a planet, and which have therefore been preserved in something close to their original state and, broadly, their original locations. They are samples of the disk, still sitting roughly where the disk made them.

And the composition they record is the composition of the disk **at the place and moment they formed.** The inner belt asteroids are dry because they condensed where it was too warm for water ice to exist as a solid. The outer belt asteroids are wet because they condensed where it was cold enough for water to freeze. The transition between them marks the place where, four and a half billion years ago, **the temperature of the solar nebula crossed the freezing point of water.**

**That boundary is the snow line, and it is still there.** You can point at it. It is not an inference from theory but a compositional gradient in a real population of real objects, sitting at the distance theory predicts. And the same boundary that sorted the asteroids into wet and dry also — as this chapter will show — sorted the *planets* into rocky and giant. The belt preserves, in miniature and in place, the single most consequential division in the solar system's history.

This chapter is about that line: where it came from, why it sits where it does, and why one temperature boundary in a vanished disk of gas determined the architecture of everything that follows.

### What an explanation owes you

A word on what "explaining" means here, because this chapter is where the distinction between a catalogue and a causal science is cashed out. Consider a fact you have known since childhood: the inner planets are small and rocky, the outer ones are large and gaseous. In a catalogue, that is a fact to be memorized — four of these, four of those. In a causal science, it is a *phenomenon demanding explanation*, and a satisfying explanation must do more than restate it. It must identify a physical mechanism, show that the mechanism follows from established physics, predict the *location* of the division (not merely assert that one exists), and ideally predict *further* consequences that can be checked independently. That is exactly what this chapter attempts. The snow-line explanation identifies a mechanism (condensation of water ice), grounds it in physics already established (the inverse-square flux gradient, and the disk left behind by the collapse), predicts the boundary's position (~2.7 AU, in the asteroid belt), and predicts independent consequences — a compositional gradient across the belt, a density division among the planets, and the same pattern repeating around Jupiter. All of those check out. **By the end, you should be able to explain the architecture of the solar system to someone in about four sentences, and every sentence should be a physical claim rather than a description.** That is the goal.

## The disk: how much, how big, how arranged

Before we can discuss temperatures, we need a working picture of the disk itself — its mass, its extent, and how material was distributed within it.

### How much material? The minimum-mass solar nebula

We cannot observe the solar nebula; it vanished four and a half billion years ago. But we can *reconstruct a lower bound* on it, by a clever piece of reasoning that yields what is called the **minimum-mass solar nebula** (MMSN).

The logic runs as follows. Take each planet as it exists today. Its heavy elements — rock, metal, ice — must have come from the disk. But planets are *depleted* in hydrogen and helium relative to the Sun (the terrestrial planets almost entirely so). So: take each planet's inventory of heavy elements, and **add back enough hydrogen and helium to restore solar composition.** That gives the mass of disk material required to build that planet. Then spread each planet's augmented mass over the annular zone of the disk it presumably drew from, and you obtain a *surface density profile* — mass per unit area as a function of distance — and, integrating, a total disk mass.

The answer: roughly **0.01 to 0.02 solar masses**, or about **4,300 Earth masses** of gas and dust.

Two things about that number deserve comment. First, it is called a **minimum** for good reason: it assumes every scrap of solid material was efficiently incorporated into a surviving planet, which is certainly false. Real disks are inefficient; much material was lost. So the actual solar nebula was probably somewhat more massive — modern estimates often run several times the MMSN.

Second, and more striking: compare 4,300 Earth masses of disk to the **447 Earth masses** that the planets actually total today. **The disk contained at least ten to thirty times more material than survives in the planets** — and the overwhelming majority of that was hydrogen and helium gas, which was blown away when the disk dispersed. The solar system we study is the residue of a residue: the planets are what was left over from the Sun's formation, and the *solid* planets are what was left after the gas departed.

### How was it arranged? The surface density profile

The reconstruction also gives us the shape of the disk. The standard result is that surface density falls off with distance roughly as

$$\Sigma(r) \propto r^{-3/2}$$

Putting in the conventional normalization of about 1,700 g/cm² at 1 AU gives:

| Distance | Surface density |
|---|---|
| 0.4 AU | ~6,700 g/cm² |
| 1.0 AU | ~1,700 g/cm² |
| 2.7 AU | ~380 g/cm² |
| 5.2 AU | ~140 g/cm² |
| 30 AU | ~10 g/cm² |

The material was **strongly concentrated toward the centre**, thinning rapidly outward. This has an important consequence we will use when we build planets in the disk: at large distances there was simply *less stuff per unit area*, and orbital periods were long, so growth was slow. It is part of why Uranus and Neptune are smaller than Jupiter and Saturn despite being outside the snow line, and why the outer solar system's bodies remained small.

Try the falloff yourself:

```example
surface-density
```

### The vertical structure: a flared disk

The disk was not a sheet of zero thickness. Gas has pressure, which puffs it up vertically, balanced by the vertical component of the Sun's gravity. The result is a disk with a definite **scale height** — and, because the outer regions are cooler and the Sun's vertical gravity weaker there, the disk **flares**: it is thin near the star and thickens with distance, like a shallow bowl or a trumpet's bell.

This flaring is not a decorative detail; it affects temperatures. A flared disk presents its upper surface to starlight at a favourable angle far from the star, intercepting and reprocessing more radiation than a flat disk would. This is one reason real disk temperature profiles are shallower than the simplest estimate — a point we return to when we locate the snow line.

### Gas and dust: a hundred to one

Finally, the composition. The disk inherited the composition of the molecular cloud that made it, which is essentially the composition of the universe:

| Component | Approximate fraction by mass |
|---|---|
| Hydrogen and helium (gas) | **98.5%** |
| Water (H₂O) | 0.6% |
| Rock and metal (silicates, Fe, Ni) | 0.4% |
| Other volatiles (CO, CH₄, NH₃, etc.) | ~0.5% |

The ratio that matters here: **the disk was about 99% gas and 1% solids** (dust). Everything solid in the solar system — every planet, moon, asteroid, and the ground beneath you — was built from that 1%.

But look more closely at the breakdown of the solids, because the next three sections turn on it. **Water alone (0.6%) outweighs all rock and metal combined (0.4%).** That single line in the table is the reason the snow line matters. Hold onto it.

## The condensation sequence: what freezes where

Now the chemistry. A disk of hot gas cooling down does not condense all at once; different materials solidify at different temperatures, in a definite order. This ordered list is the **condensation sequence**, and it is the mechanism that translates the temperature gradient into a *compositional* gradient.

### The sequence

As gas of solar composition cools, materials condense out roughly in this order (condensation temperatures at nebular pressures):

| Material | Condenses below about |
|---|---|
| Refractory oxides (Al₂O₃, CaTiO₃) | 1,700 K |
| Iron–nickel metal | 1,400 K |
| Silicates (olivine, pyroxene) | 1,300 K |
| Troilite (FeS) | 700 K |
| Hydrated silicates | 400 K |
| **Water ice (H₂O)** | **~170 K** |
| Ammonia ice (NH₃) | ~100 K |
| Methane ice (CH₄) | ~40 K |
| Carbon monoxide, nitrogen ice | ~25 K |

The pattern is intuitive once stated: **refractory** materials (those with strong chemical bonds and high melting points — oxides, metals, rock) condense at high temperatures and can therefore solidify almost anywhere in the disk. **Volatile** materials (ices — water, then ammonia, then methane, then the most volatile of all) require progressively colder conditions and can only condense far out.

### Reading the sequence as a map

Here is the key move. Because the disk's temperature *falls with distance* — the inverse-square flux gradient, applied to the disk — **the condensation sequence in temperature translates directly into a sequence in space.** Each material has a distance inside which it cannot exist as a solid and outside which it can. Every condensation temperature defines a *line* in the disk. Drag through the disk and watch the inventory of solids grow as it cools:

```condensation
```

So the disk was, in effect, chemically zoned:

- **Innermost** (very hot, above ~1,300 K): only refractory oxides and metals could condense — and in the very hottest inner regions, essentially nothing could solidify at all.
- **Inner disk** (roughly 400–1,300 K): metals and silicates condensed. Rock and iron, and nothing else. **This is the terrestrial planet zone.**
- **Beyond ~170 K:** water ice joins the inventory. **This is the snow line.**
- **Farther still** (~100 K, ~40 K, ~25 K): ammonia, then methane, then CO and N₂ ices condense. These lines are sometimes called the *ammonia line*, *methane line*, and so on — and they matter for the outer solar system, helping explain why Uranus and Neptune are "ice giants" and why the most distant bodies (Kuiper Belt objects, comets) are rich in the most volatile ices.

**The disk was not a uniform soup. It was a chemically stratified structure, with composition varying systematically by distance — and each planet inherited the composition of the zone where it formed.** That is the central idea of this chapter, and everything else is a consequence.

There are, notably, *many* condensation lines — one for each species. But one of them matters far more than the rest, for a reason of pure abundance.

## Locating the line: a derivation

Let us now actually *compute* where water ice begins to condense, because the calculation is simple, satisfying, and lands remarkably close to the observed boundary in the asteroid belt.

### The temperature profile

The disk is heated principally by the young Sun's radiation, which it absorbs and re-radiates. For a simple disk that intercepts and reprocesses starlight, energy balance gives a temperature profile falling as

$$T(r) \propto r^{-1/2}$$

This follows directly from the inverse-square law: the flux falls as $r^{-2}$, and a body in radiative equilibrium has $T \propto F^{1/4}$, so $T \propto (r^{-2})^{1/4} = r^{-1/2}$.

Normalizing at Earth's orbit — where the equilibrium temperature is about 280 K — gives

$$T(r) \approx 280\ \text{K} \times \left(\frac{r}{1\ \text{AU}}\right)^{-1/2}$$

Here is that profile evaluated across the disk, alongside a shallower profile appropriate to a *flared* disk ($T \propto r^{-3/7}$), which real disks approximate more closely:

| Distance | $T \propto r^{-1/2}$ | $T \propto r^{-3/7}$ (flared) |
|---|---|---|
| 0.4 AU | 443 K | 415 K |
| 1.0 AU | 280 K | 280 K |
| 1.5 AU | 229 K | 235 K |
| **2.7 AU** | **170 K** | 183 K |
| 5.2 AU | 123 K | 138 K |
| 9.6 AU | 90 K | 106 K |
| 30 AU | 51 K | 65 K |

### Solving for the snow line

Now set the temperature equal to water ice's condensation point, about 170 K, and solve for $r$:

$$170 = 280 \times r^{-1/2} \quad \Rightarrow \quad r = \left(\frac{280}{170}\right)^{2} = \mathbf{2.71\ AU}$$

**The simple calculation gives 2.71 AU** — squarely in the asteroid belt, and essentially exactly where the observed compositional transition between dry S-type and wet C-type asteroids occurs. Using the flared profile instead gives about 3.2 AU, also within the belt. The standard quoted range for the solar nebula's snow line is **2.5 to 3.5 AU.**

This is genuinely satisfying: a two-line calculation, using nothing but the inverse-square law and the freezing point of water, predicts the location of the most consequential boundary in the solar system — and the prediction is confirmed by the composition of objects still sitting there.

Practice the same calculation for the other condensation lines:

```example
condensation-line
```

### An honest complication: the line moved

The calculation above treats the disk as passively heated by starlight, which is a decent approximation for a mature disk. But **young disks are more complicated, and the snow line was not fixed.** Two effects matter:

**Viscous heating.** In its early, massive phase, the disk generated substantial heat internally, from friction as material spiralled inward (the same viscosity that transports angular momentum outward). This made the young disk considerably hotter than passive reprocessing alone would suggest — pushing the snow line **farther out**, perhaps to 5 AU or beyond in the first hundred thousand years.

**Cooling and dispersal.** As accretion slowed and the disk thinned, viscous heating declined and the disk cooled. The snow line therefore **migrated inward** over the disk's lifetime, sweeping from the outer system toward the inner.

So the snow line is better pictured not as a fixed wall but as a **boundary that swept inward through the disk over millions of years.** This has real consequences that are actively researched: it complicates the question of exactly where any given body's material condensed, it may help explain how water was delivered to the inner planets (a live question we take up again for Earth), and it means the "2.7 AU" figure should be understood as characteristic rather than exact.

**The concept is robust; the precise number is model-dependent.** That distinction is worth internalizing: the *existence* of a condensation boundary with major consequences is certain, evidenced directly by the asteroid belt's composition. Its exact position and history are matters of ongoing modelling.

## Why one line changed everything: the solid density jump

We now come to the causal core of the chapter — the step that converts a chemistry boundary into a planetary architecture.

### The abundance argument

Return to the composition table above, and consider what is available as *solid material* on either side of the snow line.

**Inside the snow line**, only rock and metal can condense. That is about **0.4%** of the nebula's mass.

**Outside the snow line**, rock and metal condense *plus* water ice. That is about $0.4\% + 0.6\% = \mathbf{1.0\%}$ of the nebula's mass.

$$\text{Jump factor} = \frac{1.0}{0.4} = \mathbf{2.5\times}$$

(Different assumed abundances shift this; the literature typically quotes a factor of **2 to 4**. The precise value does not matter; the existence of a large step does.)

Work through the jump for yourself:

```example
solid-jump
```

**Crossing the snow line more than doubles — and by some estimates quadruples — the solid material available for building planets.** And the reason is simply that *water is abundant*: hydrogen is the most common element in the universe and oxygen the third, so water is one of the most common compounds there is, outweighing all rock and metal put together.

This is worth pausing on, because it is the pivot of the whole argument. Had the substance that condenses at 170 K been something rare — say, a trace metal — crossing its condensation line would have made no appreciable difference to planet formation. The snow line matters *because of what water is*: not a minor constituent but the single most abundant condensable substance in the cosmos. **The architecture of the solar system rests on the cosmic abundance of hydrogen and oxygen.**

### Why more material means a different kind of planet

More solid material means faster growth — bodies sweep up mass more quickly when there is more mass to sweep. But why should *faster growth* produce a categorically different planet, rather than merely a somewhat larger one?

The answer is the **deadline**: the disk's gas dispersed in roughly **3 to 10 million years**, blown away by the young Sun's radiation and winds.

And the mechanism of giant-planet formation, developed fully in the next chapter, works like this. A solid core grows by accretion. While it is small, it holds only a thin atmosphere. But once it reaches a critical mass — roughly **ten Earth masses** — its gravity becomes sufficient to trigger **runaway gas accretion**: it begins pulling in hydrogen and helium from the surrounding disk far faster than it can radiate away the heat of accretion, and it rapidly swallows an enormous envelope, becoming a gas giant.

The crucial point is that **this only works while the gas is still there.** So planet formation is a race:

> **Reach ~10 Earth masses of solid core before the disk's gas disperses, and you become a giant. Fail, and you remain a rock — however large you eventually grow.**

Now the snow line's significance is clear. **Outside the line, with two to three times more solid material, cores could reach ten Earth masses within the few-million-year window. Inside the line, with the sparse rock-and-metal inventory, they could not.** Jupiter, forming just outside the boundary where solids were most abundant and orbital periods still reasonably short, won the race most decisively and grew largest of all. Earth, forming inside, never came close: it reached its final mass long after the gas was gone, and so it has no primordial hydrogen envelope at all — only the thin secondary atmosphere it later outgassed.

### The chain, stated completely

We can now write the causal chain that everything so far has been building toward, complete:

$$\text{distance} \rightarrow \text{temperature} \rightarrow \text{what condenses} \rightarrow \text{solid surface density} \rightarrow \text{growth rate} \rightarrow \text{core mass at gas dispersal} \rightarrow \text{rocky planet or gas giant}$$

Every arrow is physics we have established. The first comes from the inverse-square law. The second is the condensation sequence. The third is the abundance of water. The fourth is accretion physics, developed in the next chapter. The fifth is the disk lifetime.

**Four small rocky worlds inside, four giants outside — because water is abundant and freezes at 170 K.** That is the architecture of the solar system, explained.

## The fossils: three independent confirmations

A theory that merely accounts for the fact it was built to explain is not worth much. What makes the snow-line picture convincing is that it predicts *additional* consequences, in independent data sets, which turn out to be there. Here are three, in increasing order of how much they should impress you. Explore them first:

```densitydivide
```

### Fossil 1: the densities of the planets

The most direct test. If planets inside the snow line were built from rock and metal alone, while planets outside were built from rock, metal, *and* abundant ice — and then wrapped in captured hydrogen and helium — the two groups should have markedly different **densities.** They do:

| Planet | Density (kg/m³) |
|---|---|
| Mercury | 5,427 |
| Venus | 5,243 |
| Earth | 5,514 |
| Mars | 3,933 |
| *— snow line —* | |
| Jupiter | 1,326 |
| Saturn | **687** |
| Uranus | 1,271 |
| Neptune | 1,638 |

The division is clean: the inner four run **3,900–5,500 kg/m³**, consistent with rock and iron. The outer four run **690–1,640 kg/m³**, consistent with hydrogen, helium, and ices. There is no overlap and nothing in between.

And note the entry that always delights students: **Saturn's mean density is 687 kg/m³ — less than water.** A body 95 times Earth's mass would, given a sufficiently large ocean, float. That is what it means to be built beyond the snow line from the lightest materials in the universe.

{{image: Saturn | Saturn, imaged by the Cassini spacecraft. Its mean density is just 687 kg/m³ — less than that of water — so a world ninety-five times Earth's mass would, given a large enough ocean, float. That absurd-sounding fact is a direct fossil of the snow line: Saturn formed beyond it, where abundant ice let a large core assemble fast enough to seize an enormous envelope of hydrogen and helium, the two lightest elements in the universe. No planet inside the snow line comes anywhere near this density.}}

### Fossil 2: the compositional gradient across the asteroid belt

This is the one from our opening, and it is more impressive than the density division, because it is *positional*: it does not merely show that two groups differ, it shows composition varying **with distance, across a single population, at the predicted location.**

The belt straddles the snow line. And its composition changes across it:

- **Inner belt (~2.0–2.5 AU): S-type** asteroids dominate — stony, silicate, metal-bearing, **dry.** Vesta (2.36 AU) is the archetype: differentiated, basaltic crust, iron core, essentially waterless.
- **Outer belt (~2.7–3.5 AU): C-type** asteroids dominate — dark, carbonaceous, and **water-bearing**, with hydrated minerals and, in the largest bodies, ice. Ceres (2.77 AU) may be roughly **a quarter water by mass.**

**Two bodies in the same belt, separated by less than half an astronomical unit, one bone-dry and one a quarter water.** That is the snow line, preserved in place, in objects we can observe, sample by meteorite, and visit by spacecraft (Dawn orbited both Vesta and Ceres). The asteroid belt is a museum exhibit of the condensation gradient.

### Fossil 3: the Galilean moons — the same physics in miniature

This is the most compelling of the three, because it is not a repetition of the same event but an **independent instance of the same mechanism**, at a completely different scale.

When Jupiter formed, it was hot — heated by the gravitational energy of its own accretion — and it was surrounded by its own miniature disk of gas and dust, from which its major moons condensed. That mini-disk had its own temperature gradient: hot near Jupiter, cold farther out. **So it should have had its own condensation sequence, and its moons should show a compositional gradient with distance from Jupiter.**

They do:

| Moon | Distance from Jupiter | Density (g/cm³) | Composition |
|---|---|---|---|
| Io | 421,700 km | **5.90** | Rock and metal; no water at all |
| Europa | 671,000 km | 3.01 | Rock with an ice shell and subsurface ocean |
| Ganymede | 1,070,400 km | 1.94 | Roughly half ice |
| Callisto | 1,882,700 km | 1.83 | Roughly half ice |

**Density falls monotonically with distance from Jupiter**, exactly as it falls with distance from the Sun across the solar system. Io, closest and hottest, is bone dry — the most volcanically active body in the solar system, with no water whatsoever. Europa, next out, has enough to make a global ocean. Ganymede and Callisto, farther still, are about half ice by mass.

{{image: Galilean moons | Jupiter's four Galilean moons — Io, Europa, Ganymede, and Callisto — to scale. Their densities fall steadily with distance from Jupiter, from rocky, waterless Io nearest in to half-ice Callisto farthest out, exactly as the planets' densities fall with distance from the Sun. Jupiter formed hot, surrounded by its own miniature disk with its own temperature gradient, and imposed its own condensation sequence on the moons forming around it. The snow line, reproduced at a ten-thousandfold smaller scale — an independent instance of the same physics.}}

**This is the snow line reproduced around a different central body, on a scale ten thousand times smaller, by the same physics.** It is exactly the kind of independent confirmation that turns a plausible story into an established mechanism: the theory says "any hot central body with a disk should impose a condensation gradient on what forms around it," and Jupiter's moons show precisely that. We will return to these moons when we come to habitability, where their compositions turn out to matter enormously.

### What the three fossils establish together

Taken together, these are three independent lines of evidence — planetary densities, asteroid compositions with position, and a miniature repetition around Jupiter — all confirming the same mechanism. **The snow line is not a convenient story invented to explain the inner–outer division; it is a physical boundary whose existence, location, and consequences can be checked in several independent ways, and which passes each check.**

## Does the line hold elsewhere? The exoplanet test

There is one more test available to us, and it is the most severe of all — because it applies the theory to systems it was never designed to describe. **If the snow line picture is right, it should say something true about *other* planetary systems, not just ours.** Since 1995 we have discovered thousands, so this is now a real test rather than a thought experiment. And the story of how the theory fared is one of the most instructive episodes in modern planetary science.

### The theory's prediction, and the shock of 1995

The prediction is clear enough: **giant planets should form beyond the snow line** — for a Sun-like star, beyond roughly 2.7 AU — because only there is there enough solid material to build a critical core before the gas disperses. Giants close to their stars should not exist.

In 1995, the first planet around a Sun-like star was discovered: **51 Pegasi b.** It is roughly Jupiter's mass. And it orbits its star at **0.05 AU**, completing a full orbit in **4.2 days**, with a temperature around 1,200 K. That is *twenty times closer to its star than Mercury is to the Sun* — deep inside where the snow line would be, in a region far too hot and far too sparse to build a giant.

This was a genuine crisis. The object could not possibly have formed where it was found. Such "**hot Jupiters**" appeared, at first sight, to falsify the entire core-accretion-plus-snow-line framework.

### The resolution: formation location is not final location

The resolution was not to abandon the theory but to add something to it. **51 Pegasi b did not form at 0.05 AU. It formed beyond the snow line, where the theory says giants form — and then it moved.**

Planets are embedded in a massive gas disk, and gravitational interaction with that disk can transfer angular momentum, causing a planet to **spiral inward** over time. This is **planetary migration**, and hot Jupiters made it impossible to ignore. The snow-line account of *where giants form* survived intact; what had to be discarded was the tacit assumption that **planets stay where they form.**

This is the subject of an entire coming chapter, and it will turn out to apply to our own system too — the Nice model proposes that Jupiter, Saturn, Uranus, and Neptune are *not* where they were built. Hold that thought.

### What the statistics now show

With thousands of exoplanets catalogued, we can test the picture statistically, and two results stand out.

**First, a genuine confirmation.** Surveys find that the occurrence rate of giant planets **rises beyond the snow-line distance** — giants are preferentially found (or inferred to have originated) in the outer regions, just as core accretion requires. Moreover, giant planets are substantially **more common around metal-rich stars** — stars with more heavy elements, and therefore disks with more solid material. That is precisely what core accretion predicts: more solids means faster core growth means a better chance of winning the race before the gas goes. The theory makes a quantitative prediction about which stars should host giants, and the prediction holds.

**Second, a humbling result.** Hot Jupiters, for all their drama, orbit only about 1% of stars — they are rare, and their prominence in early discoveries was a selection effect (they are the easiest planets to detect). The genuinely *most common* type of planet found so far is something our solar system does not contain at all: **super-Earths and mini-Neptunes**, bodies between Earth and Neptune in size, frequently orbiting close to their stars in tightly-packed systems. Our own architecture — small rocky worlds inside, giants outside, and a conspicuous *gap* where the most common planets in the galaxy should be — **is not the typical arrangement.**

### What this establishes

So the exoplanet test delivers a split verdict, and both halves are valuable. **The mechanism generalizes: condensation, core accretion, and the snow line describe how giants form, and the statistics on stellar metallicity confirm it.** But **our particular outcome does not generalize: the solar system's specific architecture is one possibility among many, not a template.** Why we ended up with this arrangement rather than a system of packed super-Earths is a genuinely open question — and one we will return to at the close of the story, when a thousand other planetary systems let us see our own more clearly.

For now, the point is that the snow line survived its hardest test, but only after being paired with migration. **Where a planet forms and where it ends up are two different questions** — and having settled the first, we will shortly have to take up the second.

## The line that wrote the solar system

Time to gather the argument, because this chapter is the hinge of the story, and everything that follows refers back to it.

**We began at a boundary you can still see.** The asteroid belt preserves a compositional gradient: dry, stony S-type asteroids in its inner regions (Vesta, at 2.36 AU, waterless and basaltic) giving way to dark, water-bearing C-type asteroids outside (Ceres, at 2.77 AU, perhaps a quarter water by mass). These are leftover planetesimals, sitting roughly where the disk made them, recording the composition of the nebula at the place and moment they formed. The transition marks where the solar nebula crossed the freezing point of water — **the snow line, still in place after four and a half billion years.**

**We characterized the disk.** Reconstruction from the planets gives a **minimum-mass solar nebula** of roughly 0.01–0.02 solar masses (~4,300 Earth masses) — at least ten to thirty times the mass that survives in the planets today, the remainder having been blown away as gas. Surface density fell steeply as $r^{-3/2}$, concentrating material inward. The disk was flared, thickening with distance. And its composition was that of the universe: **98.5% hydrogen and helium gas, about 1% solids** — within which, crucially, **water (0.6%) outweighed all rock and metal (0.4%).**

**We laid out the condensation sequence** — refractory oxides at 1,700 K, metals at 1,400 K, silicates at 1,300 K, **water ice at ~170 K**, ammonia at 100 K, methane at 40 K, CO and N₂ at 25 K. Because the disk's temperature fell with distance, this sequence in *temperature* became a sequence in *space*: the disk was chemically stratified, and each planet inherited the composition of its zone.

**We located the line by calculation.** With $T(r) \approx 280\,\text{K} \times r^{-1/2}$ (which follows directly from the inverse-square flux law), setting $T = 170$ K gives $r = (280/170)^2 = \mathbf{2.71\ AU}$ — in the asteroid belt, exactly where the observed compositional transition sits. We were honest that the line **moved**: young disks are viscously heated, so the boundary started farther out (perhaps beyond 5 AU) and swept inward as the disk cooled. The concept is robust; the exact number is model-dependent.

**And we identified why one line changed everything.** Inside, only rock and metal could condense (~0.4% of nebular mass); outside, water ice joined them (~1.0%) — a **jump of roughly 2.5× (literature range 2–4×)** in available solids, and it matters *only because water is abundant*. More solids meant faster growth, and growth rate was decisive because of the **deadline**: the gas dispersed in 3–10 Myr, and only a core reaching **~10 Earth masses** before then could trigger runaway gas accretion and become a giant. **Outside the line that race was winnable; inside it was not.** Hence four small rocky worlds and four giants.

**Three independent fossils confirm it:** the clean density division among the planets (inner 3,900–5,500 kg/m³; outer 690–1,640, with Saturn less dense than water); the compositional gradient *with distance* across the asteroid belt; and — most tellingly — **the Galilean moons**, whose densities fall monotonically with distance from Jupiter (Io 5.90, Europa 3.01, Ganymede 1.94, Callisto 1.83 g/cm³), reproducing the same mechanism around a different central body at a ten-thousand-fold smaller scale.

**Here is the four-sentence explanation of the solar system promised at the outset.** *Sunlight falls off as the inverse square of distance, so the protoplanetary disk was hot near the Sun and cold far away. Water — the most abundant condensable substance in the universe — could only freeze into solid ice beyond about 2.7 AU, more than doubling the solid material available there. Because the disk's gas dispersed within a few million years, only bodies with enough solid material to build a ten-Earth-mass core in that time could capture hydrogen envelopes and become giants. So the solar system has four small rocky planets inside that line and four giants outside it.* Every sentence is a physical claim; none is a description. That is what it means to explain an architecture rather than catalogue it.

**Next: accretion, and the building of worlds.** We now have a chemically stratified disk with the right materials in the right places. What remains is the hardest part of the story: *how do microscopic dust grains actually become planets?* The next chapter follows the growth from micron-sized grains through centimetre pebbles, and immediately runs into a genuine and long-standing difficulty — the **metre-size barrier**, where our understanding of how bodies grow through the metre scale remains incomplete, and where the physics seems to conspire to destroy growing bodies rather than build them. It then follows the successful path onward: planetesimals, runaway growth, oligarchy, and the final chaotic phase of giant impacts — and watches the race against the disk's dispersal play out, showing exactly why Jupiter won it, why Earth did not, and why Mars appears to have been stunted.

## Further reading

Any planetary-science treatment of the solar nebula, the minimum-mass solar nebula, the condensation sequence, and the snow line will cover the material here. Hayashi's classic 1981 minimum-mass solar nebula model is the standard reference point for disk profiles; most modern textbooks present a version of it.

## Problems

*The disk-and-snow-line set — the most important problem set in the story of origins. Problem 3 (locating the line) is the quantitative core; problem 4 (the solid density jump) is the single most important problem in the set; problem 6 (the fossil evidence) asks you to reason from present observations back to formation conditions; problem 9 is the synthesis. Full worked answers follow.*

**1 — The minimum-mass solar nebula.**
**(a)** Explain the reasoning by which the MMSN is reconstructed from the present-day planets.
**(b)** Why is it a *minimum*? Give two reasons the true nebula was likely more massive.
**(c)** The MMSN is ~4,300 Earth masses; the planets today total ~447. Compute the ratio and explain where the missing material went.

**2 — The condensation sequence.**
**(a)** List, in order, the approximate condensation temperatures of: refractory oxides, iron–nickel metal, silicates, water ice, ammonia ice, methane ice.
**(b)** Explain the physical distinction between "refractory" and "volatile" materials.
**(c)** Explain how a sequence in *temperature* becomes a sequence in *space*, and what this implies about the disk's chemical structure.

**3 — Locating the lines. (Quantitative core.)** Use $T(r) = 280\,\text{K} \times (r/1\,\text{AU})^{-1/2}$.
**(a)** Compute the disk temperature at 0.7 AU (Venus's orbit).
**(b)** Derive the snow line's location by setting $T = 170$ K.
**(c)** Compute where ammonia ice (100 K) and methane ice (40 K) would condense. Comment on the locations relative to the known planets.
**(d)** Explain why the profile $T \propto r^{-1/2}$ follows from the inverse-square law.

**4 — The solid density jump. (The most important problem in the set.)**
**(a)** Given that water is ~0.6% and rock+metal ~0.4% of nebular mass, compute the factor by which available solids increase across the snow line.
**(b)** Explain why the snow line's importance depends critically on the *cosmic abundance* of water. What if the substance condensing at 170 K had been rare?
**(c)** Explain the full causal chain from the density jump to the existence of gas giants, including the roles of the critical core mass and the disk lifetime.
**(d)** Why does failing the race produce a *categorically* different planet rather than merely a smaller one?

**5 — Disk structure.**
**(a)** The surface density goes as $\Sigma \propto r^{-3/2}$. If $\Sigma = 1{,}700$ g/cm² at 1 AU, compute it at 5.2 AU, and the ratio between the two.
**(b)** What does this steep falloff imply about growth rates in the outer solar system?
**(c)** What is a "flared" disk, and why does flaring affect the temperature profile?

**6 — The fossil evidence.** For each of the following, explain what it shows and why it supports the snow-line picture:
**(a)** The densities of the eight planets.
**(b)** The S-type/C-type gradient across the asteroid belt, with reference to Vesta and Ceres.
**(c)** The densities of the four Galilean moons.
**(d)** Which of these three do you consider the strongest evidence, and why? (Consider what makes evidence *independent*.)

**7 — Saturn floats.** Saturn's mean density is 687 kg/m³; water's is 1,000 kg/m³.
**(a)** What does this imply?
**(b)** Explain, in terms of this chapter, how a planet 95 times Earth's mass comes to have such a low density.
**(c)** Why is no *inner* planet anywhere near this density?

**8 — The line that moved.**
**(a)** Why was the young disk hotter than simple starlight reprocessing would suggest?
**(b)** In which direction did the snow line migrate over the disk's lifetime, and why?
**(c)** What does this complication imply about how precisely we should take the figure "2.7 AU"? Distinguish between what is robust and what is model-dependent.

**9 — Synthesis (the architecture explained).** In three or four paragraphs, synthesize the chapter: the disk's mass, structure, and composition; the condensation sequence and the chemical stratification it produces; the derivation of the snow line's position; the solid density jump and the race against disk dispersal; and the three fossil confirmations. Conclude by giving your own four-sentence physical explanation of why the solar system has four rocky planets inside and four giants outside — and explain what distinguishes such an explanation from a description. This is the central synthesis essay of the origins story.

## Worked answers

### 1 — The minimum-mass solar nebula

**(a)** Take each planet's present inventory of heavy elements (rock, metal, ice). Since planets are depleted in hydrogen and helium relative to the Sun, **add back enough H and He to restore solar composition** — this gives the mass of disk material required to build that planet. Spread each planet's augmented mass over the annular zone of the disk it plausibly drew from, yielding a surface-density profile; integrate to get a total disk mass. Result: ~0.01–0.02 solar masses.

**(b)** It is a minimum because the reconstruction assumes **perfect efficiency** — that every scrap of solid material in each zone ended up in the surviving planet. Two reasons the true nebula was more massive: (1) accretion is **inefficient** — much solid material was never incorporated into planets (it remains as asteroids and comets, was ejected, or fell into the Sun); (2) planets **migrated**, so a planet's present orbit may not be where its material came from, and material from zones that fed no surviving planet is unaccounted for.

**(c)** Ratio $= 4{,}330/447 \approx \mathbf{9.7}$, so at least ~10× (and plausibly 20–30× using more realistic efficiencies). The missing material was **overwhelmingly hydrogen and helium gas**, which was never incorporated into the terrestrial planets and was **blown away** when the disk dispersed in the T Tauri phase — plus solids that fell into the Sun or were ejected from the system.

### 2 — The condensation sequence

**(a)** Refractory oxides ~1,700 K; iron–nickel metal ~1,400 K; silicates ~1,300 K; water ice ~170 K; ammonia ice ~100 K; methane ice ~40 K.

**(b)** **Refractory** materials have strong chemical bonds and high melting/condensation temperatures — oxides, metals, silicate rock. They condense readily even in hot regions. **Volatile** materials have weak intermolecular bonds and low condensation temperatures — the ices (water, ammonia, methane, CO, N₂). They remain gaseous unless it is very cold. The distinction is essentially about how tightly a substance's molecules bind to one another in the solid phase.

**(c)** Because the disk's temperature **falls with distance** from the Sun (following the inverse-square flux law), each condensation temperature corresponds to a specific *distance*: inside it the material is gas, outside it the material is solid. Each species therefore defines a **line** in the disk. The implication is that the disk was **chemically stratified** — its solid composition varied systematically with distance, with only refractories available in the inner regions and progressively more volatile ices added as one moved outward. Each planet inherited the composition of the zone in which it formed.

### 3 — Locating the lines

**(a)** $T = 280 \times (0.7)^{-1/2} = 280 \times 1.195 = \mathbf{335\ K}$

**(b)** $170 = 280 \times r^{-1/2} \Rightarrow r^{1/2} = 280/170 = 1.647 \Rightarrow r = \mathbf{2.71\ AU}$

**(c)** Ammonia: $r = (280/100)^2 = \mathbf{7.84\ AU}$ — beyond Jupiter, near Saturn. Methane: $r = (280/40)^2 = \mathbf{49\ AU}$ — beyond Neptune, in the Kuiper Belt. **Comment:** these locations align meaningfully with composition. Saturn and beyond could incorporate ammonia ices; only the most distant bodies (Kuiper Belt objects, comets) formed where methane could freeze — which is why such objects are rich in the most volatile ices and why Uranus and Neptune are "ice giants." (These are simple estimates; real condensation depends on pressure and the disk's thermal history too.)

**(d)** The flux falls as $F \propto r^{-2}$ (the inverse-square law). A body in radiative equilibrium radiates as $T^4$ (Stefan–Boltzmann), so $T \propto F^{1/4}$. Therefore $T \propto (r^{-2})^{1/4} = r^{-1/2}$.

### 4 — The solid density jump

**(a)** Inside: solids = 0.4%. Outside: solids = 0.4% + 0.6% = 1.0%. Jump factor $= 1.0/0.4 = \mathbf{2.5\times}$. (Literature values vary from 2 to 4 depending on assumed abundances.)

**(b)** The magnitude of the jump depends entirely on **how abundant the newly-condensable substance is.** Water is one of the most abundant compounds in the universe, because hydrogen is the most common element and oxygen the third — so water alone outweighs *all* rock and metal combined. Crossing its condensation line therefore produces a **step change** in available solids. Had the substance condensing at 170 K been rare (a trace metal, say), crossing its line would have added a negligible amount of material and had no appreciable consequence for planet formation. **The architecture of the solar system rests on the cosmic abundance of hydrogen and oxygen.**

**(c)** The chain: (1) Outside the snow line, solid surface density is 2–4× higher. (2) Growth rate increases with available solid material, so bodies out there grow **faster** and larger. (3) Giant-planet formation requires a solid core of roughly **10 Earth masses**, at which point gravity triggers **runaway accretion** of hydrogen and helium from the disk. (4) But this only works **while disk gas remains** — and the gas dispersed within **3–10 million years**. (5) Therefore only bodies that reached the critical core mass within that window could become giants. Outside the snow line, the extra material made this achievable; inside, it did not.

**(d)** Because the outcome depends on crossing a **threshold within a time limit**, not on gradual accumulation. A body that reaches 10 Earth masses before the gas disperses undergoes runaway gas accretion and acquires an envelope of *hundreds* of Earth masses of hydrogen and helium — becoming a fundamentally different kind of object (a gas giant, mostly H/He by mass, with no surface). A body that misses the deadline keeps *no* primordial envelope at all, however large it later grows, and remains a rocky world with at most a thin secondary atmosphere it outgasses. The threshold-plus-deadline structure converts a quantitative difference in growth rate into a **qualitative** difference in planet type.

### 5 — Disk structure

**(a)** $\Sigma(5.2) = 1{,}700 \times 5.2^{-3/2} = 1{,}700/11.86 = \mathbf{143\ g/cm^2}$. Ratio $= 5.2^{3/2} = \mathbf{11.9}$ — nearly twelve times less material per unit area at Jupiter's orbit than at Earth's.

**(b)** Growth in the outer solar system was **slower**, for two compounding reasons: less material per unit area to sweep up, and **longer orbital periods** (Kepler's third law), so fewer encounters per unit time. This is part of why Uranus and Neptune are much smaller than Jupiter and Saturn *despite* also being outside the snow line — they had less material and more time-per-orbit, so they never reached runaway gas accretion before the disk dispersed. (It is also why their formation location is a live problem, taken up with migration in a later chapter.)

**(c)** A **flared** disk is one whose vertical thickness (scale height) increases with distance from the star, so it resembles a shallow bowl rather than a flat sheet. It arises because gas pressure puffs the disk vertically against the vertical component of stellar gravity, and that gravity weakens with distance faster than pressure support declines. Flaring affects temperature because a flared surface **intercepts starlight at a more favourable angle** at large distances, absorbing and reprocessing more radiation than a flat disk would — making the outer disk *warmer* than a flat model predicts and hence the temperature profile **shallower** (closer to $r^{-3/7}$ than $r^{-1/2}$).

### 6 — The fossil evidence

**(a) Planetary densities.** Inner four: 3,933–5,514 kg/m³ (rock and iron). Outer four: 687–1,638 kg/m³ (hydrogen, helium, ices). Clean division, no overlap. This shows the two families are **compositionally** distinct, exactly as predicted if one formed from rock/metal only and the other from rock + ice + captured gas.

**(b) The asteroid belt gradient.** S-type (stony, dry) asteroids dominate the inner belt (~2.0–2.5 AU), with **Vesta** at 2.36 AU differentiated, basaltic, and essentially waterless; C-type (carbonaceous, water-bearing) dominate the outer belt (~2.7–3.5 AU), with **Ceres** at 2.77 AU perhaps a quarter water by mass. This is stronger than (a) because it is **positional**: composition varies *with distance* across a single population of leftover planetesimals sitting near where they formed, and the transition occurs at the predicted location.

**(c) The Galilean moons.** Densities fall monotonically outward from Jupiter: Io 5.90, Europa 3.01, Ganymede 1.94, Callisto 1.83 g/cm³ — dry rock nearest, roughly half ice farthest. Jupiter was hot during formation and had its own mini-disk with its own temperature gradient, so the same condensation physics operated at a ~10,000× smaller scale.

**(d)** The **Galilean moons** are the strongest, because they are the most *independent*. Evidence (a) and (b) are both observations of the same event — the sorting of material in the solar nebula — so they are, in a sense, two views of one dataset. The Galilean moons are a **separate instance of the mechanism**, around a different central body, at a vastly different scale, at a different time. The theory makes a general claim ("any hot central body with a disk imposes a condensation gradient on what forms around it"), and Jupiter's system tests that claim on a case the theory was not built to explain. Successfully predicting a *new instance* is stronger support than accounting again for the original one.

### 7 — Saturn floats

**(a)** Saturn's mean density (687 kg/m³) is **less than that of water** (1,000 kg/m³), so — given a sufficiently large body of water and ignoring the practical absurdity — **Saturn would float.**

**(b)** Saturn formed **beyond the snow line**, where abundant water ice raised the solid surface density enough for a large core to assemble quickly. Reaching the critical core mass before the disk's gas dispersed, it underwent **runaway gas accretion**, capturing an enormous envelope of **hydrogen and helium** — the two lightest and most abundant elements in the universe. Since the great majority of its 95 Earth masses is that light envelope rather than dense rock, its *mean* density is very low, even though its deep interior is compressed to high density.

**(c)** Because the inner planets formed **inside the snow line**, from rock and metal only, and — crucially — never reached the critical core mass while gas remained, so they **captured no hydrogen–helium envelope at all**. They are made essentially entirely of dense refractory material, giving densities of ~3,900–5,500 kg/m³. Their thin atmospheres are *secondary* (outgassed or delivered later) and contribute negligibly to their mass.

### 8 — The line that moved

**(a)** Because young disks were heated not only by starlight but **internally, by viscous dissipation** — friction as material spiralled inward through the disk (the same viscosity that transports angular momentum outward). In the early, massive, rapidly-accreting phase this internal heating was substantial, making the disk considerably hotter than passive reprocessing of starlight alone would predict.

**(b)** It migrated **inward**. As accretion slowed and the disk thinned and lost mass, viscous heating declined and the disk cooled — so the location at which the temperature fell to ~170 K moved progressively closer to the Sun. Early on the snow line may have been beyond 5 AU; it swept inward over the disk's few-million-year lifetime.

**(c)** The figure 2.7 AU should be taken as **characteristic rather than exact** — a representative value for a mature disk, not a fixed wall. What is **robust**: that a condensation boundary for water existed, that it lay in the general region of the present asteroid belt, and that crossing it produced a large step in available solids with major consequences for planet formation. This is directly evidenced by the belt's preserved compositional gradient. What is **model-dependent**: the precise numerical location at any given epoch, its detailed migration history, and consequently exactly where any particular body's material condensed. The distinction matters: one can be entirely confident in the mechanism while acknowledging genuine uncertainty in the numbers — and the migration is itself an active research topic bearing on how water reached the inner planets.

### 9 — Synthesis

**This chapter is the causal heart of the origins story, because it identifies the single boundary from which the architecture of the entire solar system follows.** The disk left behind by the collapse of the solar nebula can be reconstructed from the planets themselves: the minimum-mass solar nebula held roughly 0.01–0.02 solar masses (~4,300 Earth masses), at least ten times what survives in the planets today, with surface density falling steeply as $r^{-3/2}$ and a flared vertical structure. Its composition was that of the universe — 98.5% hydrogen and helium gas, about 1% solids — and within that 1% lies the fact on which everything turns: **water (0.6% of nebular mass) outweighed all rock and metal combined (0.4%).**

**The disk's temperature gradient converted that composition into a spatial structure.** Materials condense in a definite order — refractory oxides at 1,700 K, metals at 1,400 K, silicates at 1,300 K, water ice at ~170 K, ammonia at 100 K, methane at 40 K — so because the disk was hot near the Sun and cold far out (following directly from the inverse-square flux law), each condensation temperature defined a *distance*. The disk was chemically stratified, and each planet inherited the composition of its zone. The most consequential of these boundaries can be located by a two-line calculation: with $T(r) \approx 280\,\text{K} \times r^{-1/2}$, water ice condenses beyond $r = (280/170)^2 = 2.71$ AU — squarely in the asteroid belt, exactly where the observed transition from dry to wet asteroids occurs.

**Why that boundary was decisive is a matter of abundance and of a deadline.** Inside the line only rock and metal could condense (~0.4% of nebular mass); outside, water ice joined them (~1.0%) — a jump of roughly 2.5× in available solids, and one that matters *only* because water is so abundant. Had the substance freezing at 170 K been rare, the line would have been inconsequential. More solids meant faster growth, and growth rate was decisive because giant-planet formation is a race: a core must reach roughly ten Earth masses to trigger runaway accretion of hydrogen and helium, and the disk's gas dispersed within three to ten million years. Outside the snow line that race was winnable; inside it was not. The threshold-plus-deadline structure is what converts a quantitative difference in growth rate into a **qualitative** difference in planet type — a giant with hundreds of Earth masses of envelope, or a rock with none at all. Three independent fossils confirm the picture: the clean density division among the planets (Saturn, at 687 kg/m³, would float on water); the compositional gradient *with distance* across the asteroid belt, from dry Vesta at 2.36 AU to Ceres at 2.77 AU with perhaps a quarter of its mass as water; and — most tellingly, because it is an independent instance rather than a second view of the same event — the Galilean moons, whose densities fall monotonically outward from Jupiter as the same condensation physics operated on a ten-thousand-fold smaller scale.

**The four-sentence explanation is this.** *Sunlight falls off as the inverse square of distance, so the protoplanetary disk was hot near the Sun and cold far away. Water — the most abundant condensable substance in the universe — could only freeze into solid ice beyond about 2.7 AU, more than doubling the solid material available there. Because the disk's gas dispersed within a few million years, only bodies with enough material to build a ten-Earth-mass core in that time could capture hydrogen envelopes and become giants. So the solar system has four small rocky planets inside that line and four giants outside it.* What distinguishes this from a description is that **every sentence makes a physical claim with independent consequences that can be checked** — it identifies a mechanism, grounds it in established physics, predicts the boundary's *location* rather than merely asserting a division exists, and predicts further phenomena (the belt gradient, the moon densities) that were not part of what it was built to explain. A description tells you what the solar system looks like; an explanation tells you why it could hardly have looked otherwise.$astroDisk_master$,
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
  select $astroDisk_quiz$[{"id": "q1", "type": "mcq", "prompt": "The asteroid belt is described as a boundary 'you can still see.' What does it preserve, and why does that count as evidence for the snow line?", "options": ["It preserves the debris of a destroyed planet, proving planets can shatter", "It preserves a COMPOSITIONAL GRADIENT with distance: dry, stony S-type asteroids in the inner belt (Vesta, 2.36 AU, waterless) give way to dark, water-bearing C-type asteroids outside (Ceres, 2.77 AU, ~a quarter water). These are leftover planetesimals sitting near where they formed, so they record the disk's composition where it crossed water's freezing point \u2014 the snow line, in place", "It preserves the orbit of a former giant planet that migrated away", "It preserves ice from comets that were captured into the belt"], "answerIndex": 1, "explanation": "The belt's asteroids are leftovers \u2014 planetesimals that never assembled into a planet, and so have sat roughly where the disk made them for 4.5 billion years. Their composition records the disk at the place and moment they formed. The inner belt is dominated by dry, stony S-type bodies (Vesta at 2.36 AU: basaltic crust, iron core, no water); the outer belt by dark, water-bearing carbonaceous C-type bodies (Ceres at 2.77 AU: perhaps a quarter water by mass). Two bodies in the same belt, half an AU apart, one bone-dry and one a quarter ice \u2014 the transition marks where the nebula crossed the freezing point of water. The snow line is not an inference imposed on the data; it is a compositional gradient in real objects at the predicted distance."}, {"id": "q2", "type": "mcq", "prompt": "How does the 'condensation sequence' translate the disk's temperature gradient into a compositional structure?", "options": ["All materials condense at the same temperature, so composition is uniform", "Different materials solidify at different temperatures in a fixed order (refractory oxides ~1,700 K, metal ~1,400 K, silicates ~1,300 K, water ice ~170 K, ammonia ~100 K, methane ~40 K). Because the disk was hot near the Sun and cold far out, each condensation temperature marks a DISTANCE \u2014 a line inside which the material is vapour and outside which it is a solid grain \u2014 so the disk became chemically stratified, each planet inheriting its zone's composition", "Heavier elements sink to the disk midplane, sorting by weight", "Magnetic fields separate the materials into rings"], "answerIndex": 1, "explanation": "As gas of cosmic composition cools, materials freeze out in a set order set by their condensation temperatures \u2014 refractory oxides first, then metal, silicate rock, then far cooler the ices: water at ~170 K, ammonia ~100 K, methane ~40 K, nitrogen ~25 K. Refractory materials (strong bonds, high melting points) condense almost anywhere; volatile ices need progressively colder conditions. The key move is that the disk's temperature fell with distance, so a sequence in temperature became a sequence in space: every condensation temperature defines a line, with the material vapour inside it and solid outside. The disk was therefore chemically zoned \u2014 only rock and metal in the inner terrestrial region, with water ice and then more volatile ices added moving outward \u2014 and each planet inherited the composition of the zone where it formed."}, {"id": "q3", "type": "mcq", "prompt": "Using T(r) \u2248 280 K \u00d7 r^(\u22121/2), where does water ice (condensing at ~170 K) begin to condense \u2014 and why does that profile hold?", "options": ["At 1.0 AU, because that is Earth's temperature", "At r = (280/170)\u00b2 \u2248 2.71 AU \u2014 squarely in the asteroid belt, exactly where the dry/wet asteroid transition sits. The r^(\u22121/2) profile follows from L2's inverse-square law: flux falls as r^(\u22122), and a body in radiative equilibrium has T \u221d F^(1/4), so T \u221d (r^(\u22122))^(1/4) = r^(\u22121/2)", "At 5.2 AU, at Jupiter's orbit", "At 30 AU, at Neptune's orbit"], "answerIndex": 1, "explanation": "Setting the disk temperature equal to water's condensation point: 170 = 280\u00b7r^(\u22121/2) gives r^(1/2) = 280/170 = 1.65, so r = 2.71 AU \u2014 in the asteroid belt, essentially exactly where the observed S-type/C-type transition occurs. The temperature profile itself comes straight from the inverse-square flux law: the flux a disk annulus intercepts falls as r^(\u22122), and a body in radiative equilibrium radiates as T^4 (Stefan\u2013Boltzmann), so T \u221d F^(1/4) \u221d r^(\u22121/2). A two-line calculation, using nothing but the inverse-square law and the freezing point of water, predicts the most consequential boundary in the solar system \u2014 and the objects still sitting there confirm it. (The line actually swept inward over the disk's lifetime, so 2.7 AU is characteristic rather than exact.)"}, {"id": "q4", "type": "mcq", "prompt": "Why did crossing the snow line produce two categorically different kinds of planet, rather than merely larger ones outside?", "options": ["Because ice is heavier than rock, so outer planets are denser", "Because outside the line water ice ~doubled the solid material (rock+metal 0.4% \u2192 +water 1.0% of nebular mass), and that mattered against a DEADLINE: the gas dispersed in 3\u201310 Myr, and only a core reaching ~10 Earth masses before then could trigger runaway capture of a hydrogen\u2013helium envelope. Outside, cores won that race and became giants; inside, they never reached critical mass in time and stayed rock", "Because the outer disk was denser than the inner disk", "Because giant planets formed first and stole material from the inner disk"], "answerIndex": 1, "explanation": "Crossing the snow line more than doubled the available solids \u2014 and only because water is abundant (hydrogen the most common element, oxygen the third), so it outweighs all rock and metal combined. More solids meant faster growth, and growth rate was decisive because of a deadline: the disk's gas dispersed within 3\u201310 million years, and giant-planet formation requires a solid core of ~10 Earth masses to trigger runaway accretion of hydrogen and helium WHILE gas remains. Outside the line, the extra material let cores reach that threshold in time \u2014 they captured envelopes of hundreds of Earth masses and became gas giants with no surface. Inside, cores grew too slowly; the gas was gone before they reached critical mass, so they kept no primordial envelope at all and remained rock. The threshold-plus-deadline structure converts a quantitative difference in growth rate into a qualitative difference in planet type."}, {"id": "q5", "type": "mcq", "prompt": "The Galilean moons' densities fall from Io (5,900 kg/m\u00b3) to Callisto (1,830). Why is this considered the strongest fossil evidence for the snow-line mechanism?", "options": ["Because it shows the moons formed from captured comets", "Because it is an INDEPENDENT INSTANCE of the mechanism, not a second view of the same event: Jupiter formed hot with its own miniature disk and temperature gradient, so it imposed its own condensation sequence \u2014 density falling with distance, dry rock near in, half-ice far out \u2014 reproducing the snow line around a different body at a ten-thousandfold smaller scale, exactly as the theory predicts for any hot central body with a disk", "Because the moons are older than the planets", "Because Io's volcanism proves it has no water"], "answerIndex": 1, "explanation": "Planetary densities and the asteroid gradient are both observations of the same event \u2014 the sorting of material in the solar nebula. The Galilean moons are a separate instance of the same mechanism, around a different central body, at a vastly different scale and time. Jupiter was hot from its own accretion and surrounded by a mini-disk with its own temperature gradient, so it should have imposed a condensation gradient on the moons forming around it \u2014 and it did: density falls monotonically outward, from bone-dry, hyper-volcanic Io (no water at all) through Europa and Ganymede to roughly half-ice Callisto. The theory makes a general claim \u2014 any hot central body with a disk imposes a condensation gradient on what forms around it \u2014 and Jupiter's system, ten thousand times smaller than the solar system, confirms it on a case the theory was not built to explain. Successfully predicting a new instance is stronger than re-explaining the original."}, {"id": "q6", "type": "open", "prompt": "Give the complete causal chain from a planet's distance from the Sun to whether it became a rocky world or a gas giant. Identify each link, and explain specifically why the snow line's importance depends on the cosmic ABUNDANCE of water and on the finite lifetime of the disk's gas.", "rubric": "THE CHAIN (each link named): distance \u2192 temperature \u2192 what condenses \u2192 solid surface density \u2192 growth rate \u2192 core mass at gas dispersal \u2192 rocky planet or gas giant. LINK BY LINK: (1) DISTANCE \u2192 TEMPERATURE: sunlight falls as the inverse square of distance (L2), so a disk in radiative equilibrium has T \u221d r^(\u22121/2) \u2014 hot near the Sun, cold far out. (2) TEMPERATURE \u2192 WHAT CONDENSES: the condensation sequence \u2014 each material freezes below its condensation temperature, so a temperature gradient becomes a spatial one; water ice condenses beyond ~170 K, i.e. beyond ~2.7 AU (the snow line). (3) \u2192 SOLID SURFACE DENSITY: inside the line only rock+metal condense (~0.4% of nebular mass); outside, water ice joins them (~1.0%) \u2014 a jump of ~2.5\u00d7 (range 2\u20134\u00d7). (4) \u2192 GROWTH RATE: more solid material means faster growth \u2014 bodies sweep up mass faster. (5) \u2192 CORE MASS AT GAS DISPERSAL: giant formation needs a ~10 Earth-mass core to trigger runaway capture of a hydrogen\u2013helium envelope. (6) \u2192 PLANET TYPE: reach 10 Earth masses before the gas disperses \u2192 giant; miss the deadline \u2192 rock. WHY ABUNDANCE MATTERS: the size of the solid jump depends entirely on how abundant the newly-condensable substance is. Water is one of the most abundant compounds in the universe (hydrogen the 1st and oxygen the 3rd most common elements), so it outweighs all rock and metal combined \u2014 crossing its line produces a STEP CHANGE. Had the substance freezing at 170 K been rare (a trace metal), crossing its line would have added a negligible amount and changed nothing. So the architecture of the solar system rests on the cosmic abundance of hydrogen and oxygen. WHY THE DISK LIFETIME MATTERS: giant formation is a RACE against a deadline \u2014 the disk's gas disperses in 3\u201310 Myr (blown off by the young Sun). Runaway gas accretion only works WHILE gas remains, so the outcome depends on reaching the critical core mass BEFORE the gas is gone. Outside the snow line the extra solids made that achievable; inside they did not. Without a finite disk lifetime, growth rate would not be decisive and the inner\u2013outer split would not be sharp. A strong answer notes this threshold-plus-deadline structure is what makes the difference qualitative (a giant with hundreds of Earth masses of envelope vs a rock with none) rather than merely one of size \u2014 Jupiter won the race, Earth did not."}, {"id": "q7", "type": "open", "prompt": "The snow-line picture predicts additional consequences beyond the inner\u2013outer division it was built to explain. Describe the three 'fossil' confirmations within the solar system, then the exoplanet test. Explain the split verdict the exoplanets deliver, and what it means that our solar system's architecture is 'not the typical arrangement.'", "rubric": "THE THREE FOSSILS: (1) PLANETARY DENSITIES \u2014 the inner four run 3,900\u20135,500 kg/m\u00b3 (rock and iron), the outer four 690\u20131,640 (hydrogen, helium, ices), a clean division with no overlap; Saturn at 687 kg/m\u00b3 is less dense than water. This shows the families are compositionally distinct, as predicted if one formed from rock/metal only and the other added ice + captured gas. (2) THE ASTEROID-BELT GRADIENT \u2014 dry S-type asteroids (Vesta, 2.36 AU) give way to wet C-type ones (Ceres, 2.77 AU, ~a quarter water) across the belt; stronger than (1) because it is POSITIONAL \u2014 composition varies with distance across a single population of leftover planetesimals at the predicted location. (3) THE GALILEAN MOONS \u2014 densities fall monotonically from Io (5,900) to Callisto (1,830); Jupiter formed hot with its own mini-disk and temperature gradient, imposing its own condensation sequence at a 10,000\u00d7 smaller scale. The STRONGEST because it is an INDEPENDENT instance of the mechanism (a different central body, scale, and time), not a second view of the same event. THE EXOPLANET TEST: the theory predicts giants form beyond the snow line. 1995's 51 Pegasi b \u2014 a Jupiter-mass planet at 0.05 AU (a 'hot Jupiter') \u2014 could not have formed where it was found, an apparent crisis. RESOLUTION: it formed beyond the snow line as predicted and then MIGRATED inward (gravitational exchange of angular momentum with the gas disk). The account of WHERE giants form survived; the discarded assumption was that planets STAY where they form. THE SPLIT VERDICT: (a) CONFIRMATION \u2014 giants are preferentially found beyond the snow-line distance, and are more common around METAL-RICH stars (disks with more solids), exactly as core accretion predicts (more solids \u2192 faster core growth \u2192 better chance of winning the race). (b) HUMBLING \u2014 hot Jupiters orbit only ~1% of stars (their early prominence was a selection effect); the most common planets found are super-Earths and mini-Neptunes, which our solar system lacks entirely, often packed close to their stars. WHAT 'NOT TYPICAL' MEANS: the mechanism (condensation + core accretion + snow line) generalizes and is confirmed statistically, but our particular OUTCOME does not \u2014 the solar system's specific architecture (small rocky worlds inside, giants outside, and a gap where the galaxy's most common planets should be) is one possibility among many, not a template. Why we got this arrangement rather than packed super-Earths is an open question. A strong answer distinguishes 'the mechanism generalizes' from 'our outcome generalizes,' and notes that formation location and final location are two different questions (migration)."}]$astroDisk_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/origins/the-disk-and-the-snow-line', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
