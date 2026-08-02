-- Astronomy & Space · Stellar Physics — The H–R Diagram —
-- "Lifetimes". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/hr-diagram/lifetimes @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Lord Kelvin's 1860s Kelvin-Helmholtz estimate of the Sun's age and its
-- forty-year dispute with geologists and Darwin, the nuclear resolution
-- (7.4 Gyr, 780x Kelvin's reservoir), the four-ingredient lifetime formula
-- and why only a mass-dependent fraction of a star's hydrogen ever burns,
-- the corrected-lifetime spread of nearly sixteen orders of magnitude, the
-- main-sequence turnoff as a coeval-population clock, the "older than the
-- universe" globular-cluster crisis and its three-part resolution (Hipparcos,
-- helium diffusion, dark energy), and the top and bottom of the main
-- sequence as two unrelated physical limits.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/hr-diagram/lifetimes',
    'research',
    'advanced',
    'read',
    $astroLifetimes_master$> Mass, luminosity, and lifetime together turn the Hertzsprung–Russell diagram into a clock: the main-sequence turnoff of a coeval stellar population reveals the population's age directly, without any cosmological assumption, because a star's mass fixes how long it lives with the same rigor that it fixes how brightly it shines.

## Kelvin's confident, wrong answer

In the 1860s, William Thomson — Lord Kelvin — set out to determine the age of the Sun, and by extension the age of the Earth, from physics rather than from geology. Thomson, born in Belfast in 1824 and professor of natural philosophy at Glasgow for over half a century, was by that point the most authoritative physicist in Britain, and would later be elevated to the peerage as Baron Kelvin of Largs in 1892 — the source of the name now attached to the SI unit of absolute temperature.

His reasoning was excellent. A star radiates energy; that energy must come from somewhere; and the only source anyone could identify at the time was gravitational contraction. The idea itself had been proposed a few years earlier, in 1854, by the German physicist Hermann von Helmholtz, who suggested that a slowly shrinking gas sphere could supply a star's luminosity for a very long time by converting gravitational potential energy into heat. Kelvin took up the idea and worked out its numerical consequences for the Sun with characteristic rigor: as a star slowly shrinks, gravitational potential energy is released, half of it radiated away and half converted to internal thermal energy, in accordance with the virial theorem governing any self-gravitating gas sphere in equilibrium.

The reservoir available is straightforward:

$$E_{KH} \sim \frac{3}{10}\frac{GM_\odot^2}{R_\odot} = 1.14\times10^{41}\ \text{J}$$

Divide by the Sun's luminosity:

$$t_{KH} = \frac{1.14\times10^{41}}{3.83\times10^{26}} = 3\times10^{14}\ \text{s} \approx 9\ \text{Myr}$$

Kelvin's own estimates, with somewhat different assumptions, gave figures in the range of 20 to 40 million years for the Sun and the Earth. He defended them for four decades, with the full authority of the most eminent physicist of the age.

### The dispute

The geologists disagreed, and so did Darwin. Sedimentary sequences, erosion rates, and the sheer thickness of the rock record demanded hundreds of millions of years at minimum. Darwin, in the first edition of *On the Origin of Species*, estimated over 300 million years for the denudation of the Weald alone — and removed the calculation from later editions under pressure, partly from Kelvin's authority.

The disagreement was not marginal. It was a factor of ten to a hundred between two fields each confident in its methods, and it persisted for forty years. Kelvin held his ground with considerable tenacity: he attacked the geological estimates on methodological grounds, and in an 1895 exchange the engineer John Perry pointed out that Kelvin's calculation had implicitly assumed the Earth conducted heat as a rigid solid throughout, when convective circulation within a partially fluid interior could carry heat outward far faster — an objection that, using only terrestrial physics with no new energy source at all, already pushed the permissible age upward by an order of magnitude and showed that Kelvin's own framework contained more flexibility than he had allowed for.

Kelvin was wrong, and he was wrong in the most instructive possible way: his reasoning was valid, his arithmetic was correct, and his premise — that gravitational contraction is the only available energy source — was false, because the relevant physics had not yet been discovered. The final blow came from an unexpected direction. Ernest Rutherford, presenting early work on radioactive decay at the Royal Institution in 1904, recalled being apprehensive about describing evidence for an Earth far older than Kelvin's estimate with Kelvin himself seated in the audience — until, glancing at the old man, Rutherford saw to his relief that Kelvin appeared to have fallen asleep. Rutherford went on to observe that the newly discovered radium supplied a source of heat that Kelvin could not have anticipated, and that it was this discovery, not any flaw in Kelvin's mathematics, that overturned his conclusion. Radioactive decay in the Earth's interior and nuclear fusion in the Sun's core turned out to be two faces of the same missing physics.

### The resolution

Doing the calculation with nuclear fusion instead changes everything. The Sun's core contains roughly 10% of its mass; hydrogen is 71% of that by mass; and hydrogen fusing into helium converts about 0.7% of rest mass into energy:

$$E = 0.71 \times 0.10 \times 0.007 \times M_\odot c^2 = 8.9\times10^{43}\ \text{J}$$

$$t = \frac{E}{L_\odot} = 2.3\times10^{17}\ \text{s} = 7.4\ \text{Gyr}$$

About 780 times Kelvin's reservoir, and comfortably consistent with the meteoritic age of the solar system, 4.57 Gyr — which puts the Sun roughly 60% of the way through its main-sequence life.

{{image: William Thomson, 1st Baron Kelvin | Lord Kelvin around the time he defended a 20–40 million year age for the Sun and Earth, a figure he held for four decades against a geological record that demanded hundreds of millions of years.}}

### The lesson

Three points follow, and the third is the one worth carrying forward.

The order-of-magnitude estimate is the whole method: everything that follows is a variant of dividing the fuel by the burn rate, and the calculation above is the template.

A mismatch between two well-founded estimates is a discovery waiting to happen. The factor-of-a-hundred discrepancy between Kelvin and the geologists was not a failure of either — it was a signpost pointing at missing physics. It is worth noting that the field that turned out to be right was the one with the worse theoretical footing and the better empirical constraint.

And a lifetime calculation is only as good as the inventory of energy sources behind it. Kelvin's arithmetic was flawless. He simply did not know about the largest term.

{{image: Kelvin–Helmholtz mechanism | The gravitational contraction that Kelvin took to be the Sun's only energy source: as a self-gravitating gas sphere slowly shrinks, potential energy is released and half of it is radiated away, yielding a reservoir some 780 times smaller than the one nuclear fusion actually supplies.}}

## Fuel divided by burn rate

The estimate has four ingredients, and each is worth separating out because three of them are mass-dependent.

$$t \sim \frac{X \cdot f \cdot \eta \cdot Mc^2}{L}$$

| Symbol | Meaning | Value for the Sun |
|---|---|---|
| $X$ | hydrogen mass fraction | 0.71 |
| $f$ | fraction of the star hot enough and mixed enough to burn | ~0.10 |
| $\eta$ | rest-mass converted to energy by H → He | 0.007 |
| $L$ | luminosity | 1 $L_\odot$ |

The efficiency $\eta = 0.007$ is fixed physics — the mass defect between four protons and one helium-4 nucleus — and it does not depend on the star. $X$ varies modestly with composition. $f$ does not vary modestly; it varies enormously, and that variation is the correction that follows.

### Only the core burns

A star does not get to use all of its hydrogen. Fusion requires temperatures of order $10^7$ K, occurring only near the center. In the Sun, this proceeds through the proton–proton chain, whose reaction rate depends only weakly on temperature compared with the CNO cycle that dominates in more massive stars — a difference that turns out to matter directly for how much of a star's hydrogen becomes available, since it is temperature sensitivity, not the amount of fuel present, that decides whether a star's core develops the small, ferociously burning convective region characteristic of a massive star.

The Sun's outer layers are radiative and do not mix with the core, so hydrogen in the envelope stays in the envelope, permanently unavailable however much of it there is. Hydrostatic equilibrium — the balance between the inward pull of gravity and the outward push of gas and radiation pressure — sets the temperature profile of the interior, and the temperature falls steeply enough moving outward from the center that only the innermost tenth or so of the Sun's mass is ever hot enough to sustain the proton–proton chain at an appreciable rate.

For the Sun, $f \approx 0.10$. Ninety percent of the Sun's hydrogen will never be burned. The Sun will leave the main sequence still composed mostly of hydrogen, having consumed only a tenth of it.

## Why the spread is wider than the naive scaling

A rough scaling of lifetime against mass, obtained by dividing the fuel supply — proportional to $M$ — by the luminosity — proportional to roughly $M^{3.5}$ — gives $t \propto M^{-2.5}$. That scaling understates how wide the real spread of stellar lifetimes is, because $f$ is not constant. It depends on mass, because it depends on where a star is convective — and convection is what mixes fresh fuel into the burning region.

| Mass | Structure | $f$ |
|---|---|---|
| < 0.35 M☉ | fully convective | ~1.0 |
| 1 M☉ | radiative envelope, radiative core | ~0.10 |
| 5 M☉ | convective core, radiative envelope | ~0.15 |
| 25 M☉ | large convective core | ~0.20 |

Below about 0.35 M☉ a star is fully convective. The entire star circulates through the core on timescales short compared with its life, so essentially all of its hydrogen is available. Nothing is stranded in an envelope, because there is no separate envelope.

At the other end, massive stars have convective cores — the CNO cycle is so temperature-sensitive that it concentrates energy generation in a small central volume, driving convection there — so they tap somewhat more fuel than the Sun does, though the mixing does not reach the envelope. The transition between the two burning modes occurs at roughly 1.3 M☉: below that mass, stars burn primarily via the proton–proton chain with a radiative core much like the Sun's; above it, the CNO cycle takes over, its reaction rate scaling roughly as the seventeenth power of temperature, which is steep enough to make the core convectively unstable and mix additional fuel into the burning region over the star's lifetime.

The direction matters: $f$ is largest exactly where the naive lifetime is already longest. The correction therefore stretches the spread rather than compressing it. It is worth being explicit about why this is not a small effect confined to the extremes: the entire lower main sequence, everything below about a third of a solar mass, is fully convective, and that is not a narrow sliver of the mass function — it is the mode of the stellar initial mass function, the single most populous interval of stellar mass in the galaxy. The correction that widens the lifetime spread applies to the majority of stars that exist, not to a rare tail.

### The corrected lifetimes

| $M/M_\odot$ | Naive $M^{-2.5}$ | $f$ | Corrected | Factor |
|---|---|---|---|---|
| 0.1 | 3,162 Gyr | 1.00 | ~32 trillion yr | 10× |
| 0.3 | 203 Gyr | 1.00 | ~2,000 Gyr | 10× |
| 1.0 | 10 Gyr | 0.10 | 10 Gyr | 1× |
| 5.0 | 179 Myr | 0.15 | 268 Myr | 1.5× |
| 25 | 3.2 Myr | 0.20 | 6.4 Myr | 2× |

$$\frac{t(0.1\,M_\odot)}{t(25\,M_\odot)} \approx 5\times10^{15}$$

A factor of 250 in mass produces a factor of five million billion in lifetime — nearly sixteen orders of magnitude, the single widest dynamic range of any stellar property. Luminosity spans about ten decades across the main sequence; temperature spans roughly one decade. Lifetime is the most extreme consequence of the mass parameter of all of them.

### What the range means

No star below about 0.88 M☉ has ever died. Their lifetimes exceed the age of the universe, so the entire population ever formed is still on the main sequence — and since M dwarfs make up 76% of all stars, three quarters of every star ever born is still burning hydrogen.

A 0.1 M☉ star will burn for roughly 32 trillion years, some 2,300 times the current age of the universe. The universe is, from the point of view of red dwarfs, extremely young.

And a 25 M☉ star lives 6 million years — less than the time since the Miocene, and comparable to the lifetime of a molecular cloud.

## The main-sequence turnoff as a clock

### The idea

A star cluster is a population formed at essentially one time, from one cloud, of one composition. All its members are the same age.

Now let the cluster age. Every star whose main-sequence lifetime is shorter than the cluster's age has already left the main sequence. Every star with a longer lifetime is still on it.

So the main sequence of a cluster's Hertzsprung–Russell diagram is populated only up to a certain point, and then bends away toward the giant branch. That bend is the main-sequence turnoff, and the mass at the turnoff is the mass whose lifetime equals the age of the cluster.

$$t_{\text{cluster}} = t_{MS}(M_{\text{turnoff}})$$

Reading the turnoff and inverting the lifetime relation gives the age. No assumption about the cluster's history is required — only that its members are coeval, which their common distance and common space motion establish independently.

The method has been applied across the full range of star-forming environments the galaxy offers. Young open clusters such as the Pleiades, still populated by hot, short-lived B stars near their turnoff, sit at the young end of the table below. The Hyades, somewhat older, has already lost its most massive members to evolution. M67, an open cluster unusually old for its type at roughly the age of the solar system, has a turnoff near the boundary between F and G stars — close enough to solar conditions that it has served as a benchmark for testing solar evolutionary models against a population with an independently known age. And the globular clusters — dense, roughly spherical swarms of hundreds of thousands to millions of stars orbiting in the galactic halo, among them well-studied examples such as Messier 92 and 47 Tucanae — sit at the oldest end of the table, their turnoffs having receded all the way down to stars only slightly less massive than the Sun.

{{image: Main-sequence turnoff | The main-sequence turnoff in a cluster color–magnitude diagram: stars populate the main sequence up to the mass whose lifetime equals the cluster's age, and bend away toward the giant branch beyond that point.}}

| Cluster age | $M_{\text{turnoff}}$ | Turnoff type | Example |
|---|---|---|---|
| 10 Myr | 15.9 M☉ | O/B | young OB associations |
| 100 Myr | 6.3 M☉ | B | Pleiades-like |
| 700 Myr | 2.9 M☉ | A | Hyades |
| 4.6 Gyr | 1.36 M☉ | F | M67 — solar age |
| 12.5 Gyr | 0.91 M☉ | G | globular clusters |

### Why the clock runs poorly at old ages

$M_{\text{turnoff}} \propto t^{-0.4}$, so the turnoff mass changes rapidly when the cluster is young and very slowly when it is old:

| Age interval | Turnoff moves |
|---|---|
| 10 → 100 Myr | 15.9 → 6.3 M☉ (factor 2.5) |
| 1 → 2 Gyr | 2.51 → 1.90 M☉ (factor 1.3) |
| 10 → 13.8 Gyr | 1.00 → 0.88 M☉ (factor 1.14) |

Distinguishing a 12 Gyr cluster from a 13 Gyr one requires resolving a 3% difference in turnoff mass, which translates into a small difference in luminosity and color at the turnoff point, on top of uncertainties in distance, extinction, composition, and the stellar models themselves.

The clock runs fast when young and slow when old — and old is exactly the regime where the answer matters most.

## Older than the universe

That difficulty produced a genuine crisis, and it is one of the clearest illustrations available of how a single stellar measurement can bear on something much larger than stellar physics.

### The problem

By the early 1990s, globular cluster ages derived from main-sequence turnoffs were coming out at 15 to 18 Gyr, with some estimates higher — figures reported for well-studied clusters such as Messier 92, among the oldest and most metal-poor globulars known, which repeatedly returned ages at or above the upper end of that range under the distance and composition assumptions then in use.

Meanwhile the cosmological age depends on the Hubble constant, and the favored values then — around 80 km/s/Mpc, on the high side of a debate that had itself run for decades between competing observational groups — gave an expansion age of roughly 8 to 12 Gyr for a universe whose matter content was decelerating the expansion, as every cosmological model at the time assumed it must.

> The oldest stars were older than the universe containing them.

This was not a small tension. It was a flat contradiction between two well-established measurements, and it was taken seriously as evidence that something in the cosmological model was wrong.

### The resolution

Three separate developments contributed, and they were not all on one side.

Hipparcos parallaxes, in 1997, improved distances to nearby subdwarfs used to calibrate the globular cluster distance scale, pushing globular distances up. A more distant cluster is intrinsically brighter for the same apparent brightness, which implies a higher-mass turnoff, which implies a younger cluster. Ages fell by 1 to 2 Gyr.

Helium diffusion in stellar models: gravitational settling of helium in the interior changes the turnoff luminosity, and including it in the models reduced the derived ages by roughly another gigayear — a modelling improvement, not a new measurement.

And the discovery of dark energy in 1998: an accelerating expansion means the universe is older, at a given Hubble constant, than a decelerating model implies, because it expanded more slowly in the past. The cosmological age rose to about 13.8 Gyr.

Modern values: globular clusters 12.5–13.5 Gyr; the universe 13.79 ± 0.02 Gyr. Comfortably consistent, with the oldest stars forming a few hundred million years after the Big Bang.

{{image: Globular cluster | A globular cluster: because every member star formed from the same cloud at essentially the same time, the point where its main sequence bends toward the giant branch pins the cluster's age to within the precision of the turnoff mass.}}

### The lesson

For roughly a decade, a stellar-physics measurement was evidence against the prevailing cosmological model — and the cosmology is what changed.

That is worth stating plainly, because the usual assumption is that cosmology sets the framework and stellar astrophysics fills it in. Here the causation ran the other way: main-sequence turnoffs provided a hard lower bound on the age of the universe that was independent of any cosmological assumption, and that bound was one of several pressures that made an accelerating universe thinkable.

A measurement that constrains something far outside its own field is doing more work than a measurement that merely confirms one. Globular cluster ages remain the only age determination for the universe that involves no cosmology whatsoever.

{{image: Age of the universe | The expansion history of the universe: an accelerating expansion, discovered in 1998, means the universe was expanding more slowly in the past than a purely decelerating model would predict, which raises the cosmological age at fixed present-day Hubble constant to about 13.8 billion years.}}

## The top of the main sequence

The observation that stars occupy a line rather than filling the plane has an explanation for why that line ends, and the explanation at the top is not the one that might be expected.

### More than the Eddington limit

There is a physical ceiling: above roughly 150 M☉, radiation pressure exceeds gravity and a star cannot hold itself together. That is a real constraint on what can exist, set by the Eddington limit — the luminosity at which outward radiation pressure on the star's own material balances the inward pull of its self-gravity, so that adding further mass drives the luminosity up faster than the gravity that would be needed to contain it. A small number of stars have been identified with estimated initial masses pushing against this ceiling — R136a1, in the Large Magellanic Cloud's Tarantula Nebula, is among the most massive stars known, with estimates for its birth mass exceeding 150 M☉ and prompting continued debate over exactly how such objects manage to form and hold together at all.

But there is a second constraint, about what can be seen:

| $M/M_\odot$ | Main-sequence lifetime |
|---|---|
| 10 | 47 Myr |
| 25 | 4.8 Myr |
| 60 | 0.54 Myr |
| 150 | 0.05 Myr |

Compare with two other relevant timescales: the free-fall time of a molecular cloud core, 0.3–3 Myr, and the time to cross a galactic spiral arm, about 10 Myr.

> The most massive stars live no longer than the clouds that made them.

A 60 M☉ star is born, spends its entire main-sequence life, and dies in half a million years — less than the free-fall time of the core it condensed from. It never moves away from its birthplace, because there is not time.

This is why O stars are always found in or beside nebulae, and why an O star seen in isolation is a puzzle requiring explanation — usually that it was ejected from a cluster by a dynamical encounter, making it a runaway. It is also why the presence of O stars is used as a marker of ongoing star formation: their existence anywhere is proof that star formation happened there within the last few million years.

And it explains the self-terminating character of star formation: massive stars begin destroying their natal cloud with radiation and winds within a few Myr, comparable to the free-fall time, which is why star formation efficiency runs to only a few percent rather than tens.

### The bottom is set by something else entirely

At the other end, the main sequence stops at 0.08 M☉ — the hydrogen-burning limit. Below it, electron degeneracy halts contraction before the core reaches ignition temperature, and the object cools forever as a brown dwarf.

The two ends of the main sequence are set by completely different physics. The top is a competition between radiation pressure and gravity, and between lifetime and observability. The bottom is a single quantum-mechanical threshold. Neither end is set by anything about fusion rates or fuel supply. The line has the length it does because of gravity at one end and quantum mechanics at the other.

## Pulling the thread

- Kelvin computed the Sun's age from gravitational contraction and got roughly 9 to 40 Myr. The geologists and Darwin needed hundreds of millions. He was confident, authoritative, and wrong for forty years — his arithmetic flawless and his inventory of energy sources incomplete. A mismatch between two well-founded estimates is a signpost to missing physics, and here the field with the worse theory and the better empirical constraint was the one that was right.
- The nuclear calculation gives $t = Xf\eta Mc^2/L$. For the Sun: $0.71 \times 0.10 \times 0.007 \times M_\odot c^2/L_\odot = 7.4$ Gyr — 780 times Kelvin's reservoir, consistent with 4.57 Gyr of meteoritic age, putting the Sun 60% through its life.
- Only the core burns. For the Sun, $f \approx 0.10$: ninety percent of the Sun's hydrogen will never be used. It will leave the main sequence still made mostly of hydrogen.
- But $f$ is mass-dependent, and in the direction that widens the spread. Below 0.35 M☉ stars are fully convective, so essentially all their fuel is available ($f \approx 1$); massive stars have convective cores ($f \approx 0.15$–0.2). Corrected lifetimes run from about 32 trillion years at 0.1 M☉ to 6.4 Myr at 25 M☉ — a factor of $5\times10^{15}$ from a factor of 250 in mass. Nearly sixteen orders of magnitude, the widest dynamic range of any stellar property.
- The turnoff is a clock. In a coeval population, the most massive surviving main-sequence star has a lifetime equal to the population's age — so reading the bend in a cluster's Hertzsprung–Russell diagram and inverting $t \propto M^{-2.5}$ gives the age, with no assumption about the cluster's history.
- But it is a bad clock when old. $M_{turnoff} \propto t^{-0.4}$, so the turnoff moves by a factor of 2.5 between 10 and 100 Myr and by only 1.14 between 10 and 13.8 Gyr. Distinguishing 12 from 13 Gyr means resolving a 3% difference in turnoff mass — and old is exactly where the answer matters.
- That produced a real crisis: early-1990s globular ages of 15–18 Gyr against a cosmological age of 8–12 Gyr. The stars were older than the universe. It was resolved by Hipparcos distances (revised up, yielding younger clusters), helium diffusion in the models, and dark energy (an accelerating universe is older at fixed $H_0$). For a decade a stellar measurement was evidence against the cosmological model, and the cosmology is what changed.
- The main sequence ends at the top partly because massive stars die before they can leave home. A 60 M☉ star lives 0.5 Myr — shorter than the free-fall time of the cloud core that made it. That is why O stars are always found in nebulae, why they mark ongoing star formation, and why star formation is self-terminating.
- The two ends of the line are set by unrelated physics: radiation pressure and observability at the top, a single quantum-mechanical threshold at 0.08 M☉ at the bottom.

## Closing the sub-block

Stars do not fill the luminosity–temperature plane; they lie on a line, and nine out of ten of them are on it at any given moment. That observation now has a complete explanation.

The line exists because stellar structure is fixed by one parameter — mass — so a one-parameter family of stars traces a curve. Position along it is mass. The line has an end at the bottom, at 0.08 M☉, where hydrogen cannot ignite, and an end at the top, at roughly 150 M☉, where radiation pressure wins. Nine tenths of stars are on it because that is the fraction of a stellar lifetime spent there. And the top of the occupied portion moves down as a population ages, at a rate that gives the population's age.

The diagram is a census, a mass sequence, and a clock, simultaneously — and its axes were plotted in 1911 by people who knew none of this.

{{image: Hertzsprung–Russell diagram | The Hertzsprung–Russell diagram, plotted in 1911 with no knowledge of nuclear fusion, convective mixing, or stellar lifetimes — a census of luminosity against temperature that later turned out to encode mass along its main sequence and age at its turnoff.}}

Throughout, mass has been treated as an input, its consequences traced across nearly sixteen orders of magnitude of lifetime — but where that number itself comes from remains unaddressed. If a star's entire biography is fixed by its mass, then the most important event in a star's life happened before it became a star at all: the open question is what determines how much mass a collapsing fragment of a molecular cloud ends up with.

## Further reading

A detailed history of the forty-year controversy between Kelvin's physics-based estimates and the geological and biological evidence for an older Earth is given in {{book: Joe D. Burchfield | Lord Kelvin and the Age of the Earth | 1975}}.

- **Joe D. Burchfield, *Lord Kelvin and the Age of the Earth* (1975).** A history of the controversy from Kelvin's first calculations in the 1860s through its resolution after the discovery of radioactivity, tracing how a rigorous physical argument built on an incomplete inventory of energy sources held sway against geological and evolutionary evidence for four decades, and how the eventual identification of a new energy source rather than a refutation of Kelvin's logic settled the dispute. The book covers the successive rounds of the debate in detail — Kelvin's original contraction argument, the geological and biological objections from figures including Darwin and Thomas Henry Huxley, the tidal-friction and thermal-conduction refinements Kelvin himself introduced along the way, John Perry's 1895 argument that mantle convection alone already loosened Kelvin's bound by an order of magnitude, and finally the radioactive-decay evidence that both extended the Earth's age far beyond Kelvin's estimate and explained why his energy inventory had been incomplete in the first place.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, $R_\odot = 6.957\times10^{8}$ m, $c = 2.998\times10^{8}$ m/s, $G = 6.674\times10^{-11}$. Hydrogen mass fraction $X = 0.71$; H → He efficiency $\eta = 0.007$; solar core fraction $f = 0.10$. $t_{MS} \approx 10\,M^{-2.5}$ Gyr and $M_{turnoff} = (10/t)^{0.4}$. Age of the universe 13.79 Gyr; solar system 4.57 Gyr. 1 yr = 3.156 × 10⁷ s.*

### 1 — Kelvin
**(a)** Compute the Kelvin–Helmholtz reservoir $\tfrac{3}{10}GM_\odot^2/R_\odot$ and the corresponding lifetime.
**(b)** State what was correct and what was incorrect in Kelvin's reasoning.
**(c)** The geologists and Darwin required hundreds of Myr. Express the discrepancy as a factor, and state which field turned out to be right.
**(d)** Comment on the fact that the field with the weaker theoretical foundation was the one with the correct answer. What does this suggest about how to weigh a conflict between theory and field evidence?
**(e)** State the general lesson about lifetime calculations in one sentence.

### 2 — The nuclear calculation
**(a)** Compute the Sun's main-sequence lifetime from $t = Xf\eta M_\odot c^2/L_\odot$.
**(b)** Compare with the meteoritic age of the solar system and state what fraction of its life the Sun has completed.
**(c)** Compute the ratio of the nuclear to the gravitational reservoir.
**(d)** Of the four ingredients $X$, $f$, $\eta$, $L$, state which is fixed physics, which varies with composition, and which varies with mass.
**(e)** Explain why the Sun will leave the main sequence still composed mostly of hydrogen.

### 3 — Why the spread widens *(the central correction)*
**(a)** Explain physically why $f \approx 0.10$ for the Sun rather than 1.
**(b)** Explain why a fully convective star has $f \approx 1$, and state the mass below which stars are fully convective.
**(c)** Explain why massive stars have $f$ somewhat larger than the Sun's, naming the reaction cycle responsible.
**(d)** State whether the mass dependence of $f$ widens or narrows the lifetime spread, and why.
**(e)** Compute corrected lifetimes for 0.1, 1 and 25 M☉ using $t = 10M^{-2.5}(f/0.10)$ Gyr with $f$ = 1.0, 0.10, 0.20.
**(f)** Take the ratio of the extremes and express it as orders of magnitude. Compare with the ranges of luminosity and temperature across the main sequence.

### 4 — Consequences of a wide range
**(a)** Compute the mass whose main-sequence lifetime equals the age of the universe.
**(b)** Using (a) and the fact that M dwarfs are 76% of stars, state what fraction of all stars ever born are still burning hydrogen.
**(c)** Explain why the observed population of stellar remnants is not a fair sample of the stars that have formed.
**(d)** A 0.1 M☉ star lives ~32 trillion years. Express as a multiple of the age of the universe and comment.

### 5 — The turnoff as a clock *(the payoff)*
**(a)** Explain why a star cluster is required rather than a random sample of field stars. Which property is essential?
**(b)** State the turnoff argument in two sentences.
**(c)** Compute the turnoff mass for clusters of age 10 Myr, 700 Myr, 4.6 Gyr and 12.5 Gyr.
**(d)** Compute the factor by which the turnoff mass changes between 10 and 100 Myr, and between 10 and 13.8 Gyr.
**(e)** From (d), explain why the method is a poor clock precisely where it matters most, and quantify the precision required to distinguish a 12 Gyr from a 13 Gyr cluster.
**(f)** List three sources of systematic error in a turnoff age besides the turnoff measurement itself.

### 6 — Older than the universe
**(a)** State the discrepancy as it stood in the early 1990s, with both figures.
**(b)** Explain why an upward revision of globular cluster distances **reduces** their derived ages. Trace the chain.
**(c)** Explain how an accelerating expansion makes the universe older at a fixed Hubble constant.
**(d)** Of the three contributions to the resolution, classify each as a measurement improvement, a modelling improvement, or a change to the cosmological framework.
**(e)** State what is unusual about the direction of influence in this episode, and why globular cluster ages remain valuable even now that the tension is resolved.

### 7 — The end of the line
**(a)** Compute the main-sequence lifetimes of 10, 60 and 150 M☉ stars using $t = 10M^{-2.5}(f/0.10)$ with $f = 0.2$.
**(b)** Compare a 60 M☉ star's lifetime with the free-fall time of a molecular cloud core (0.3–3 Myr) and state the consequence.
**(c)** Explain why O stars are always found in or near nebulae, and what an isolated O star implies.
**(d)** Explain how (b) connects to the self-terminating character of star formation.
**(e)** State the two physically distinct limits that set the top and bottom of the main sequence, and note what is striking about the pair.

### 8 — Numerical
**(a)** A cluster's turnoff is at 1.8 M☉. Estimate its age.
**(b)** A second cluster's turnoff is at 0.95 M☉. Estimate its age and comment on the precision you would trust.
**(c)** Suppose the mass scale carries a 5% systematic, as it plausibly might given that it rests on only a few hundred calibrating eclipsing binaries. Compute the resulting age error for (b), and state why the amplification exceeds 5%.
**(d)** A star of 30 M☉ forms in a cloud with a free-fall time of 2 Myr. Estimate its main-sequence lifetime and comment on what this implies for observing it.

### 9 — Open problem: dating the oldest stars
Globular cluster ages provide a lower bound on the age of the universe that involves no cosmology.
**(a)** List the quantities that must be known to convert a turnoff into an age, and identify which is currently the largest source of uncertainty.
**(b)** Explain why improving the *precision* of the turnoff measurement alone would not proportionally improve the age.
**(c)** Name two techniques other than the main-sequence turnoff that can date an old stellar population, and state each one's independence and limitation.
**(d)** Design a programme to reduce the uncertainty on globular cluster ages to below 0.5 Gyr. State what would then become testable that is not testable now.

## Worked answers

### 1 — Kelvin

**(a)** $E_{KH} = \tfrac{3}{10}\dfrac{(6.674\times10^{-11})(1.989\times10^{30})^2}{6.957\times10^{8}} = 1.14\times10^{41}\ \text{J}$

$t = E/L_\odot = 1.14\times10^{41}/3.828\times10^{26} = 2.98\times10^{14}$ s $= 9.4\ \text{Myr}$.

(Kelvin's own figures of 20–40 Myr differ because of assumptions about the Sun's internal density distribution and its past luminosity; the order of magnitude is the same.)

**(b)** Correct: that a star radiates energy, that the energy must come from a finite reservoir, that gravitational contraction supplies one, and the arithmetic converting that reservoir into a lifetime. Every step is valid.

Incorrect: the premise that gravitational contraction is the only available source. Nuclear energy release was unknown — the mass–energy relation would not be published until 1905 and fusion not understood until the 1930s — so the inventory of energy sources was incomplete by a factor of nearly a thousand.

**(c)** Kelvin: ~20–40 Myr. Geology: several hundred Myr at minimum. A factor of roughly ten to a hundred, and against the modern value of 4,570 Myr, Kelvin was low by more than a factor of a hundred.

The geologists were right.

**(d)** That an empirical constraint from direct observation can outrank a theoretical calculation, even a rigorous one, when the calculation depends on a completeness assumption.

Kelvin's argument had the form "the only source is X, therefore the lifetime is Y." That is only as strong as the claim that X is the only source — and claims of completeness are exactly the kind that a theory cannot check about itself. The geologists' argument had the form "here is a thickness of rock, and here is a rate of deposition," which requires no inventory of anything.

The practical rule: when a theoretical bound conflicts with a direct measurement, examine the bound's assumption of exhaustiveness first. A calculation that enumerates possibilities is vulnerable in a way a measurement is not. A similar failure pattern appears in Tycho Brahe's argument against Copernican heliocentrism from the apparent angular sizes of stars: impeccable reasoning built on a measurement that was actually an optical artefact, invisible from inside the argument itself.

**(e)** A lifetime calculation is only as good as its inventory of energy sources, and a missing term does not announce itself.

### 2 — The nuclear calculation

**(a)** $E = 0.71 \times 0.10 \times 0.007 \times (1.989\times10^{30})(2.998\times10^{8})^2 = 8.88\times10^{43}$ J.
$t = 8.88\times10^{43}/3.828\times10^{26} = 2.32\times10^{17}$ s $= 7.4\ \text{Gyr}$

**(b)** $4.57/7.4 = 62\%$ — the Sun is roughly 60% of the way through its main-sequence life, with about 2.8 Gyr remaining.

(More detailed models give ~10 Gyr total, because the effective core fraction and the evolving luminosity are treated properly. The order-of-magnitude method gets within 30%.)

**(c)** $8.88\times10^{43}/1.14\times10^{41} = 780\times$

**(d)** Fixed physics: $\eta = 0.007$ — the mass defect between four protons and one ⁴He nucleus, a property of nuclear binding energies and identical in every star.

Varies with composition: $X$, the hydrogen mass fraction, which differs between metal-poor and metal-rich stars and changes over a star's life as hydrogen is consumed.

Varies with mass: $f$, the burnable fraction, and $L$, through the mass–luminosity relation.

**(e)** Because only about 10% of its mass is in the core, where temperatures are high enough for fusion, and the radiative envelope does not mix with it. Hydrogen in the outer 90% is permanently unavailable.

So when core hydrogen is exhausted and the Sun leaves the main sequence, roughly 90% of its original hydrogen is still there, untouched, in the envelope. A star does not die of running out of fuel; it dies of running out of fuel in the right place.

### 3 — Why the spread widens

**(a)** Two conditions must both be met, and the second is the binding one.

Temperature: fusion requires ~10⁷ K, which occurs only in the innermost region.

Mixing: the Sun's envelope is radiative, not convective, so material does not circulate between envelope and core. Hydrogen in the outer layers is never transported to where it could burn.

If the Sun were mixed throughout, the temperature condition alone would still limit the instantaneous burning region — but fresh fuel would be continuously supplied to it, and $f$ would approach 1. It is the absence of mixing, not the temperature profile, that strands 90% of the fuel.

**(b)** Because convection physically transports material between the core and the surface. In a fully convective star the entire mass circulates through the burning region on a timescale short compared with the nuclear timescale, so hydrogen from anywhere in the star eventually reaches the core and is available.

Stars are fully convective below about 0.35 M☉.

**(c)** Because massive stars burn hydrogen by the CNO cycle, whose rate scales roughly as $T^{17}$. That extreme temperature sensitivity concentrates energy generation into a very small central volume, producing a steep temperature gradient there — which drives convection in the core.

The convective core mixes fresh fuel inward from a larger region than would otherwise burn, raising $f$ to ~0.15–0.20. The envelope remains radiative, so the mixing does not reach the surface and $f$ stays well below 1.

**(d)** It widens it.

$f$ is largest at low mass (≈1 for fully convective stars) and smallest near a solar mass (0.10) — so the correction multiplies low-mass lifetimes by up to ten while multiplying high-mass lifetimes by only about two.

The correction therefore acts most strongly where the naive lifetime is already longest, stretching the top end of the range further. The naive $M^{-2.5}$ scaling understates the spread.

**(e)** $t = 10M^{-2.5}(f/0.10)$ Gyr:
0.1 M☉, $f$ = 1.0: $10(3162)(10) = 3.2\times10^{4}\ \text{Gyr} = 32$ trillion yr
1.0 M☉, $f$ = 0.10: $10\ \text{Gyr}$
25 M☉, $f$ = 0.20: $10(0.00032)(2) = 6.4\ \text{Myr}$

**(f)** In absolute terms: $3.16\times10^{13}$ yr against $6.4\times10^{6}$ yr, a ratio of $5\times10^{6}$ — nearly seven orders of magnitude across this mass range, approaching sixteen if the full range down to 0.08 M☉ is included.

Compare across the main sequence: luminosity spans 10 decades, temperature spans 1.3 decades, lifetime spans the most of all. Lifetime is the property most extremely determined by mass.

### 4 — Consequences of a wide range

**(a)** $13.79 = 10M^{-2.5} \Rightarrow M = (10/13.79)^{0.4} = 0.88\ M_\odot$

**(b)** Every star below 0.88 M☉ ever formed is still on the main sequence. M dwarfs alone are 76% of stars, and most K dwarfs (below ~0.88 M☉) also qualify, so roughly 80% or more of all stars ever born are still burning hydrogen.

**(c)** Because remnants — white dwarfs, neutron stars, black holes — can only come from the minority of stars massive enough to have finished, i.e. above ~0.88 M☉, which is under 20% of the population.

Worse, the sample is doubly biased: within that minority, the most massive stars died first and longest ago, so their remnants have had the most time to accumulate — but they were also the rarest to begin with. The remnant population reflects the integrated star formation history filtered through the mass-dependent lifetime, and reconstructing the original mass distribution from it requires undoing both effects.

**(d)** $3.16\times10^{13}/1.379\times10^{10} = 2{,}290\times$ the age of the universe.

Comment: no red dwarf has ever died, anywhere. The entire population ever formed is still on the main sequence and will remain so for thousands of times the universe's current age. From the perspective of the objects that dominate the stellar census, the universe is in its infancy — a few hundredths of a percent through the era of hydrogen burning.

### 5 — The turnoff as a clock

**(a)** The essential property is coevality — all members formed at essentially the same time.

A random sample of field stars contains stars of every age, so the presence or absence of a star of given mass tells nothing: a 5 M☉ star in the field merely means star formation occurred somewhere within the last 100 Myr. In a cluster, the absence of 5 M☉ main-sequence stars means the whole population is older than their lifetime.

(Common distance and common composition are valuable too — they remove two free parameters from the fit — but coevality is what makes the method work at all.)

**(b)** At age $t$, every star with a main-sequence lifetime shorter than $t$ has already left the main sequence, and every star with a longer lifetime remains. The most massive star still on the main sequence therefore has a lifetime exactly equal to the cluster's age, so inverting the lifetime relation at the turnoff mass gives the age.

**(c)** $M_{to} = (10/t)^{0.4}$:

| Age | $M_{turnoff}$ |
|---|---|
| 10 Myr | 15.9 M☉ |
| 700 Myr | 2.90 M☉ |
| 4.6 Gyr | 1.36 M☉ |
| 12.5 Gyr | 0.91 M☉ |

**(d)** 10 → 100 Myr: $15.85/6.31 = 2.51$.
10 → 13.8 Gyr: $1.00/0.88 = 1.14$.

**(e)** Because $M_{to} \propto t^{-0.4}$: the fractional change in turnoff mass is only 0.4 times the fractional change in age, and at old ages the absolute change is tiny.

For 12 versus 13 Gyr: $M_{to}$ = 0.930 versus 0.900 M☉ — a difference of 3.25%. That must be detected as a difference in the luminosity and color of the turnoff point, on top of every other uncertainty.

And old is exactly where the answer matters, because that is where the age of the universe is at stake. The method's precision is worst in the only regime where a competing constraint exists.

**(f)** Distance — required to convert apparent to absolute magnitude at the turnoff, and it is what the Hipparcos revision changed.

Composition (metallicity) — enters through opacity, shifting both the turnoff luminosity and the mass–luminosity relation. Globular clusters are metal-poor, so a solar-metallicity relation biases their ages.

The mass scale — the lifetime relation's normalization rests on roughly 300 calibrating eclipsing binaries, and a 5% mass systematic gives an 11.5% age error.

(Also creditable: extinction, and the stellar models themselves — helium diffusion, convective overshoot, mixing length.)

### 6 — Older than the universe

**(a)** Globular cluster turnoff ages: 15–18 Gyr (some estimates higher). Cosmological expansion age, with $H_0 \approx 80$ km/s/Mpc: 8–12 Gyr.

**(b)** The chain:

1. A greater distance means the cluster's stars are intrinsically brighter than previously thought, since the same apparent magnitude at a larger distance implies a larger luminosity.
2. A brighter turnoff corresponds to a more massive star at the turnoff.
3. A more massive turnoff star has a shorter lifetime.
4. The cluster's age equals that lifetime, so the age falls.

More distant → brighter → more massive turnoff → shorter lifetime → younger cluster.

**(c)** Because a decelerating universe expanded faster in the past than it does now, so it reaches its present size in less time for a given current expansion rate. An accelerating universe expanded more slowly in the past, so it takes longer to reach the same size.

Since $H_0$ measures the present rate, the same $H_0$ corresponds to a greater age in an accelerating model. Dark energy therefore raised the cosmological age from ~9–10 Gyr to ~13.8 Gyr at the then-favoured $H_0$.

**(d)** Hipparcos parallaxes — a measurement improvement (better distances, hence better absolute magnitudes).
Helium diffusion — a modelling improvement (a physical process previously omitted from stellar interior models).
Dark energy — a change to the cosmological framework (a new component of the universe's energy budget).

The resolution required all three, and they were not all on the stellar side: the stars came down by 2–3 Gyr and the universe went up by 3–4.

**(e)** The unusual feature is the direction of influence. Normally cosmology sets the framework and stellar astrophysics operates within it. Here a stellar measurement provided a hard lower bound on the age of the universe that involved no cosmological assumptions at all, and that bound was among the pressures that made an accelerating universe seriously considered.

Globular cluster ages remain valuable because the independence has not gone away. They are still the only age determination for the universe derived entirely from local physics — nuclear reaction rates, stellar structure and a distance — with no reference to $H_0$, no cosmological model, and no assumption about the contents of the universe. That makes them a consistency check on cosmology from outside, which is worth far more than a measurement that merely agrees.

### 7 — The end of the line

**(a)** $t = 10M^{-2.5}(0.2/0.10) = 20M^{-2.5}$ Gyr:
10 M☉: $20/316 = 0.063$ Gyr $= 63\ \text{Myr}$
60 M☉: $20/27{,}885 = 0.72\ \text{Myr}$
150 M☉: $20/275{,}568 = 0.073\ \text{Myr}$

**(b)** A 60 M☉ star lives ~0.7 Myr, against a cloud-core free-fall time of 0.3–3 Myr.

The star's entire main-sequence life is comparable to, or shorter than, the collapse time of the material that formed it. It cannot travel any appreciable distance from its birthplace before dying — at a typical stellar velocity dispersion of a few km/s, 0.7 Myr carries it only a few parsecs, less than the size of the cloud.

**(c)** Because they die before they can leave. An O star observed anywhere is therefore necessarily near where it formed, and since it formed in a molecular cloud, the cloud is still there — partly illuminated and ionised by the star itself, which is what makes it a visible H II region.

An isolated O star far from any nebula therefore requires explanation. The usual one is that it is a runaway — ejected at high velocity from its birth cluster by a dynamical three-body encounter, or by the supernova of a binary companion — which is a testable claim, since runaways have anomalously high space velocities that can be traced back.

**(d)** Because massive stars begin destroying their natal cloud — by ionising radiation, winds and eventually supernovae — within a few Myr of forming, which is comparable to the cloud's own free-fall time.

So the cloud is dispersed before most of its mass can be converted into stars. Star formation terminates itself, and the resulting efficiency of a few percent is a direct consequence of the coincidence between massive-star lifetimes and cloud collapse timescales. If O stars lived 100 Myr, star formation would be far more efficient and the galaxy would look completely different.

**(e)** Top: radiation pressure exceeding gravity — the Eddington limit — capping stellar masses near 150 M☉; supplemented by the observational limit that such stars die before they can be seen away from their birthplace.

Bottom: the hydrogen-burning limit at 0.08 M☉, where electron degeneracy pressure halts contraction before the core reaches ignition temperature.

What is striking: the two ends are set by entirely unrelated physics — a competition between radiation and gravity at the top, a quantum-mechanical exclusion effect at the bottom — and neither involves fusion rates or fuel supply. The line's length is fixed by gravity at one end and quantum mechanics at the other.

### 8 — Numerical

**(a)** $t = 10(1.8)^{-2.5} = 10/4.35 = 2.30\ \text{Gyr}$

**(b)** $t = 10(0.95)^{-2.5} = 10/0.879 = 11.4\ \text{Gyr}$

Precision to trust: poor — perhaps ±1.5–2 Gyr at best. At this turnoff mass, $dM/dt$ is very small, so a small error in the turnoff luminosity or in the distance produces a large age error. Add the metallicity dependence and the mass-scale systematic, and quoting such an age to better than about 10% is not defensible.

**(c)** Age factor $= (1.05)^{-2.5} = 0.885$, so $11.4 \to 10.1\ \text{Gyr}$ — an error of 11.5%, or 1.3 Gyr.

The amplification exceeds 5% because the exponent is 2.5: $\delta t/t = -2.5\,\delta M/M$. A systematic in the mass scale is multiplied by two and a half in the age.

**(d)** $t = 20(30)^{-2.5} = 20/4930 = 4.1\ \text{Myr}$, against a cloud free-fall time of 2 Myr.

The star lives about twice the collapse time of its parent cloud. Implications for observing it: it will be found embedded in or immediately adjacent to the cloud, probably still partly enshrouded in dust; it will be a strong ultraviolet source ionising its surroundings; and it will be visible for only a few million years, so any 30 M☉ star seen anywhere is proof that star formation occurred at that location within the last four million years. Massive stars are markers of recent activity, not of the past.

### 9 — Open problem: dating the oldest stars

**(a)** Required: the turnoff apparent magnitude and color; the distance; the extinction; the metallicity (and helium abundance); the mass–luminosity and lifetime relations including their normalization; and the interior physics in the models — nuclear reaction rates, opacities, the treatment of convection, diffusion and overshoot.

The largest current source of uncertainty is the distance scale, with metallicity and the model physics close behind. Historically it was decisively distance — the Hipparcos revision moved globular ages by 1–2 Gyr on its own — and although Gaia has improved matters substantially, globular clusters are distant enough that their parallaxes remain challenging.

**(b)** Because the age is a product of several factors, and the turnoff measurement is not the dominant term. Improving it while leaving distance, metallicity and model systematics unchanged reduces only one contribution in quadrature.

More sharply: at old ages the turnoff mass changes by only 3% between 12 and 13 Gyr, so the conversion from measurement to age is intrinsically lossy. A perfect turnoff measurement combined with a 5% distance error still yields an age uncertain by more than a gigayear. When a method has a small derivative, precision in the input does not buy precision in the output.

**(c)** White dwarf cooling. The faintest white dwarfs in a cluster indicate how long the oldest ones have been cooling, giving an age from an entirely different physical process — degenerate cooling rather than nuclear burning. Independence: complete, and it does not use the turnoff or the mass–luminosity relation. Limitation: white dwarfs at those luminosities are extremely faint, requiring deep imaging on the largest telescopes, and the cooling models depend on uncertain interior physics, particularly crystallisation.

Nucleocosmochronology. Abundance ratios of long-lived radioactive isotopes — thorium-232 and uranium-238 — in very metal-poor stars date the material's formation. Independence: complete, resting on nuclear decay rates. Limitation: requires knowing the initial production ratio from r-process nucleosynthesis, which is theoretically uncertain, and the lines are extremely weak, so it is applicable to only a handful of stars.

(Also creditable: asteroseismology of cluster members, which constrains masses and ages independently of the turnoff.)

**(d)** The programme has three parts, in order of impact.

Distances. Push cluster parallaxes to sub-percent precision — later Gaia data releases for the nearest globulars, supplemented by detached eclipsing binaries within the clusters themselves, which give geometric distances requiring no parallax and no calibration. That is the single highest-value item, and it is a route with disjoint systematics from astrometry.

Composition. High-resolution spectroscopy of many members per cluster to pin metallicity and the helium abundance, which is currently inferred rather than measured and which shifts turnoff luminosities directly.

Model physics. Reduce uncertainties in low-temperature opacities, convective overshoot and diffusion — testable by requiring that the same models reproduce the well-measured masses and radii of eclipsing binaries across the relevant mass range.

What would become testable: at ±0.5 Gyr, whether globular clusters formed before, during or after reionisation, and whether the oldest clusters differ in age from one another in a way that traces the assembly history of the galaxy's halo. Currently the error bars swallow those distinctions entirely.

And more pointedly: a globular age of, say, $13.4 \pm 0.4$ Gyr against a cosmological $13.79 \pm 0.02$ Gyr would leave only ~400 Myr for the first stars and clusters to form. That would be a genuine and quantitative constraint on early structure formation, obtained without any cosmology — exactly the kind of external check that the earlier resolution of the tension between stellar and cosmological ages showed to be valuable.$astroLifetimes_master$,
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
  select $astroLifetimes_quiz$[{"id": "q1", "type": "mcq", "prompt": "Lord Kelvin computed the Sun's age from gravitational contraction with flawless arithmetic, arriving at roughly 20 to 40 million years, yet the geological and biological evidence available at the time demanded hundreds of millions of years at minimum. What was actually wrong with Kelvin's calculation?", "options": ["His arithmetic contained an error in the exponent of the gravitational formula", "His premise that gravitational contraction was the only available energy source was false, because nuclear fusion had not yet been discovered", "He used the wrong value for the mass of the Sun, which was not known precisely in the 1860s", "He failed to account for the Sun's rotation, which his contemporaries had already shown to be significant"], "answerIndex": 1, "explanation": "Every step of Kelvin's reasoning was valid and his arithmetic was correct: a star radiates energy, that energy must come from a finite reservoir, and gravitational contraction supplies one of a definite, calculable size. What failed was the implicit claim that gravitational contraction was the only available source. Nuclear fusion, which supplies a reservoir some 780 times larger, was entirely unknown -- the mass-energy relation was not published until 1905 and fusion was not understood until the 1930s -- so Kelvin's inventory of energy sources was incomplete by nearly a factor of a thousand, and no amount of arithmetic care inside a flawed premise could have caught that."}, {"id": "q2", "type": "mcq", "prompt": "For the Sun, only about ten percent of its hydrogen -- the burnable fraction f -- will ever actually be fused into helium, even though hydrogen makes up 71 percent of its mass throughout. What physically prevents the other ninety percent from ever burning?", "options": ["The Sun does not contain enough hydrogen in total to sustain fusion for its full lifetime", "Fusion requires a temperature reached only near the center, and the radiative envelope does not mix with the core, so hydrogen outside the core is never transported to where it could burn", "Ninety percent of the Sun's hydrogen was already converted to helium during its formation, before it reached the main sequence", "The Sun's magnetic field actively repels hydrogen nuclei away from the fusion region"], "answerIndex": 1, "explanation": "Fusion requires temperatures of order ten million kelvin, occurring only in the innermost region of the star. That alone would only limit which hydrogen is burning at any instant, not which hydrogen is ever available -- the disqualifying factor is that the Sun's outer layers are radiative rather than convective, so material does not circulate between the envelope and the core. Hydrogen sitting in the outer ninety percent of the Sun's mass is therefore permanently stranded, never transported inward to the region hot enough to burn it, and the Sun will leave the main sequence still composed mostly of unburned hydrogen."}, {"id": "q3", "type": "mcq", "prompt": "In a star cluster, every member formed from the same cloud at essentially the same time. Why does the point where a cluster's main sequence bends away toward the giant branch -- the main-sequence turnoff -- function as a clock that reveals the cluster's age?", "options": ["Because the turnoff mass is always exactly one solar mass, regardless of the cluster's age, providing a fixed reference point", "Because every star with a main-sequence lifetime shorter than the cluster's age has already left the main sequence, so the most massive star still remaining has a lifetime exactly equal to the cluster's age, and inverting the mass-lifetime relation at that mass gives the age directly", "Because the turnoff mass measures the cluster's total mass, from which its age can be inferred using the free-fall collapse time", "Because stars at the turnoff are the coolest and faintest members of the cluster, and temperature alone determines stellar age"], "answerIndex": 1, "explanation": "Because coevality holds -- all members share essentially the same age -- every star whose main-sequence lifetime is shorter than that age has already evolved off the main sequence, while every star with a longer lifetime remains on it. The boundary between these two groups, the turnoff, therefore identifies the one mass whose lifetime exactly equals the cluster's age: reading that mass off the diagram and inverting the mass-lifetime relation yields the age with no assumption about the cluster's history required, only that its members formed together, which their shared distance and space motion establish independently."}, {"id": "q4", "type": "mcq", "prompt": "By the early 1990s, main-sequence turnoff ages for globular clusters were coming out at 15 to 18 billion years, while the cosmological expansion age at the then-favored Hubble constant of about 80 kilometers per second per megaparsec was only 8 to 12 billion years -- the oldest stars appeared older than the universe containing them. Which combination of developments resolved this contradiction?", "options": ["Improved distances from Hipparcos parallaxes lowered globular cluster ages, helium diffusion in stellar models lowered them further, and the 1998 discovery of dark energy raised the cosmological age to about 13.8 billion years", "The contradiction was resolved entirely by discovering a calculation error in the original globular cluster age estimates, with no change to either distance or cosmological measurements", "Globular clusters were found to be much younger objects than previously believed, having formed billions of years after the Big Bang rather than shortly after it", "The Hubble constant was revised sharply upward, which alone raised the cosmological expansion age enough to match the stellar ages"], "answerIndex": 0, "explanation": "The resolution required contributions from multiple directions rather than a single fix. Hipparcos parallaxes in 1997 pushed globular cluster distances upward, which meant their stars were intrinsically brighter than assumed, implying a higher-mass and therefore shorter-lived turnoff star and hence a younger cluster, lowering ages by one to two billion years. Including helium diffusion in stellar interior models -- a physics improvement rather than a new measurement -- lowered ages by roughly another billion years. Separately, the 1998 discovery that the universe's expansion is accelerating meant the universe had expanded more slowly in the past than a decelerating model implied, which raises the age corresponding to a given present-day Hubble constant, pushing the cosmological age up to about 13.8 billion years. Modern values -- globular clusters at 12.5 to 13.5 billion years against a universe at 13.79 billion years -- are now comfortably consistent."}, {"id": "q5", "type": "mcq", "prompt": "The most massive stars on the main sequence, above roughly 60 solar masses, are physically capable of existing up to a theoretical ceiling near 150 solar masses set by radiation pressure overcoming gravity. Yet observationally, why is the practical upper end of the main sequence also limited by something besides that physical ceiling?", "options": ["Because stars above 60 solar masses are too faint to detect with current telescopes, regardless of how long they live", "Because such massive stars have main-sequence lifetimes of only a few hundred thousand years, comparable to or shorter than the free-fall collapse time of the molecular cloud cores that form them, so they die before they can move away from or be observed apart from their birth environment", "Because massive stars above 60 solar masses do not actually ignite hydrogen fusion at all, and are instead supported entirely by degeneracy pressure", "Because radiation pressure prevents any star above 60 solar masses from forming in the first place, making the Eddington limit and the observability limit the same constraint"], "answerIndex": 1, "explanation": "A 60 solar mass star lives only about half a million years, and a 150 solar mass star only about fifty thousand years -- timescales comparable to or shorter than the free-fall time of a molecular cloud core, roughly 0.3 to 3 million years, and much shorter than the roughly ten million years needed to cross a galactic spiral arm. Such a star is born, lives out its entire main-sequence life, and dies before it can travel any appreciable distance from the cloud that formed it. This is why O stars are essentially always found in or beside nebulae, why an isolated O star requires an explanation such as dynamical ejection as a runaway, and why the observability ceiling on the main sequence is distinct from and tighter than the pure Eddington-limit physical ceiling near 150 solar masses."}, {"id": "q6", "type": "open", "prompt": "Explain why the fraction of a star's hydrogen that is ever actually burned, denoted f, is not a fixed number but instead depends strongly on stellar mass, and explain why this mass dependence widens the spread of main-sequence lifetimes across the mass range rather than narrowing it. Support the explanation with the specific values of f for stars below 0.35 solar masses, near one solar mass, and near 25 solar masses, and with the resulting range of corrected lifetimes.", "rubric": "A strong answer explains that f depends on whether a star is convective, since convection is what physically transports unburned hydrogen from the outer layers into the hot central region where fusion can occur. Stars below about 0.35 solar masses are fully convective, so their entire mass circulates through the burning region over time and essentially all of their hydrogen becomes available, giving f approximately equal to 1. A star near one solar mass, such as the Sun, has a radiative envelope that does not mix with its core, so only the roughly ten percent of its mass already in the hot central region is ever burned, giving f approximately 0.10. Stars near 25 solar masses burn via the highly temperature-sensitive CNO cycle, which concentrates energy generation in a small central volume and drives convection there, giving a somewhat larger f of roughly 0.20, though the envelope remains radiative so the mixing does not reach the surface. The answer should explain that this widens rather than narrows the lifetime spread because f is largest exactly where the naive mass-luminosity based lifetime estimate, proportional to mass to the negative 2.5 power, is already longest -- at low mass -- so the correction multiplies already-long low-mass lifetimes by up to a factor of ten while multiplying already-short high-mass lifetimes by only about a factor of two. A complete answer gives the resulting corrected lifetimes: roughly 32 trillion years at 0.1 solar masses, 10 billion years at 1 solar mass, and 6.4 million years at 25 solar masses, a ratio of about 5 times 10 to the 15th power across a factor of 250 in mass, nearly sixteen orders of magnitude and the widest dynamic range of any stellar property, compared to about ten decades for luminosity and about one decade for temperature across the same mass range."}, {"id": "q7", "type": "open", "prompt": "For roughly a decade beginning in the early 1990s, main-sequence turnoff ages for globular clusters exceeded the cosmological age of the universe. Explain the full chain of reasoning connecting a revision in measured stellar distances to a change in a cluster's derived age, and then explain why the eventual resolution of this crisis is considered an unusual episode in the normal relationship between stellar astrophysics and cosmology.", "rubric": "A strong answer traces the causal chain precisely: a larger measured distance to a globular cluster means that, for the same observed apparent brightness of its turnoff stars, those stars must be intrinsically more luminous than previously assumed, since apparent brightness falls off with the square of distance. A more luminous turnoff star corresponds, through the mass-luminosity relation, to a more massive star. A more massive star has a shorter main-sequence lifetime. Since the cluster's age equals the lifetime of the star currently at the turnoff, a more massive turnoff star implies a younger cluster -- so the chain runs more distant, therefore brighter, therefore more massive at the turnoff, therefore shorter-lived, therefore a younger age. The answer should state that Hipparcos parallax measurements in 1997 revised globular cluster distances upward via improved calibration of nearby subdwarfs, lowering ages by one to two billion years through exactly this chain, and that this combined with a roughly one billion year reduction from including helium diffusion in stellar interior models, plus a rise in the cosmological age to about 13.8 billion years following the 1998 discovery that the universe's expansion is accelerating -- since an accelerating universe expanded more slowly in the past and therefore takes longer to reach its present state at a fixed current expansion rate. On why the episode is unusual: a strong answer notes that ordinarily cosmology sets the framework within which stellar astrophysics operates, but here a measurement entirely internal to stellar physics -- resting on nuclear reaction rates, stellar structure, and a distance, with no reference to the Hubble constant or any cosmological model -- provided a hard lower bound on the age of the universe that helped make an accelerating universe a serious possibility, reversing the usual direction of influence, and that globular cluster ages remain valuable today specifically because they still offer that same cosmology-independent check, not merely because the numerical tension has since been resolved."}]$astroLifetimes_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/hr-diagram/lifetimes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
