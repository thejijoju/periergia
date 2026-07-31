-- Astronomy & Space · Stellar Physics — The H–R Diagram —
-- "Binary Stars". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/hr-diagram/binary-stars @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- William Herschel's quarter-century failed parallax hunt and the 1802-1803
-- discovery of orbital binaries, the five detection methods and what each
-- yields, the detached eclipsing double-lined "gold standard" for masses and
-- radii with no distance or model required, the ~300-system calibrating
-- sample against 1.47 billion Gaia parallaxes, multiplicity by spectral type,
-- Roche lobes, and the Algol paradox as proof of mass transfer.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/hr-diagram/binary-stars',
    'research',
    'advanced',
    'read',
    $astroBinary_master$> A detached eclipsing double-lined binary yields two stellar masses and two stellar radii from Kepler's laws, the Doppler effect, and geometry alone, with no distance, no stellar model, and no external calibration required — making binaries to stellar mass what parallax is to stellar distance, and the only route by which a star's mass has ever been measured directly.

## The weighing problem

Temperature comes from a spectrum. Luminosity, once distance is known, comes from flux and the inverse-square law. Radius, for the rare resolvable or eclipsing case, comes from geometry. But mass is different in kind: it is never observed directly, because gravity is the only handle on mass, and gravity is only detectable through its effect on something else. Brightness, colour, and spectrum all report on a star's surface — none of them reaches the interior quantity that determines everything else about a star's structure and evolution.

A single star, however carefully observed, cannot be weighed. An orbit is the only phenomenon in astronomy that responds directly to mass, and an orbit requires two bodies. That fact makes binary stars not a special case or a complication within stellar physics but the foundation of the mass scale — a foundation that, as the sample sizes below make clear, rests on remarkably few objects.

## A failed parallax hunt

William Herschel spent roughly twenty-five years trying to measure stellar parallax, and failed. His method was the standard proposal of the era, going back to a suggestion of Galileo's: measuring an absolute stellar position to a fraction of an arcsecond is nearly impossible, because it requires accounting for refraction, aberration, precession, instrument flexure, and every other effect that shifts a coordinate. But if two stars lie very close together on the sky, and one is assumed to be nearby while the other is a distant background object in chance alignment, then almost all of those errors are common to both and cancel in the difference. Rather than measuring a position, the method measures the separation of a pair, and watches for it to change over a year as the Earth moves along its orbit.

Herschel catalogued around seven hundred such pairs in 1782 and 1785, precisely for this purpose, and then observed them for two decades.

He found no parallax. What he found instead, and announced in 1802 and 1803, was that in several pairs — Castor among them — the separation and orientation were changing in a way that had nothing to do with the Earth's motion. The two stars were orbiting each other. Herschel coined the term binary star, and the consequence of the discovery turned out to be larger than the parallax he had originally been chasing.

Newtonian gravity had never been tested outside the solar system before this. Universal gravitation earned the name "universal" on the strength of its performance on the planets, the Moon, and falling bodies — all within a few light-hours of the Sun. Whether the same law held at interstellar distances was an assumption, and a substantial one. Herschel's binaries showed stars tracing Keplerian orbits about a common centre of mass, trillions of kilometres from the Sun, and the law held.

Two lessons follow. First, a failed programme can be more valuable than a successful one: Herschel was looking for distances and found gravity operating on a galactic scale instead, and it is worth noting that Bessel eventually succeeded at Herschel's original goal in 1838, thirty-five years later, using a related differential technique applied to a well-chosen high-proper-motion star. Second, an orbit is the only phenomenon in astronomy that responds directly to mass, and Herschel had stumbled onto the one observable that reaches the quantity the entire subject of stellar physics turns on.

A footnote on priority is worth recording. John Michell had argued in 1767, on statistical grounds, that there are far more close pairs on the sky than chance alignment can produce, and that most must therefore be physically associated. He was right, and it was a good argument, but a statistical claim about a population is a weaker thing than a measured orbit. Herschel supplied the orbit.

## Five ways to see a binary, and what each is worth

Binaries are classified by how they are detected, and the classification matters because each method yields a different — and mostly incomplete — set of quantities.

### Visual binaries

Both components are resolved, and the orbit is traced directly on the sky over years or centuries. What is measured is the angular semi-major axis $\alpha$ (in arcseconds), the period $P$, the eccentricity, and the position of the barycentre, the point about which both stars move. Kepler's third law in solar units then gives the total mass:

$$M_1 + M_2 = \frac{a^3}{P^2} \qquad (a\ \text{in AU},\ P\ \text{in years})$$

and the barycentre gives the mass ratio, since $M_1 r_1 = M_2 r_2$. Total mass plus ratio gives both masses individually. But there is a catch: $a$ must be expressed in AU, and what was actually measured is an angle. Converting the angle into a physical separation requires the distance. A visual binary cannot be weighed without a parallax — this method depends entirely on the geometric distance rung established for stellar distances generally.

| System | $a$ (AU) | $P$ (yr) | $M_1+M_2$ |
|---|---|---|---|
| Sirius A+B | 19.8 | 50.1 | **3.09 M☉** |
| Alpha Centauri A+B | 23.5 | 79.9 | 2.03 M☉ |
| Procyon A+B | 15.0 | 40.8 | 2.03 M☉ |
| 61 Cygni A+B | 84.0 | 678 | 1.29 M☉ |

These four systems are worth pausing on, because they are among the nearest and best-studied binaries on the sky, and yet none of them yields an individual mass without the barycentre condition on top of Kepler's third law, and none of the totals means anything in physical units until a distance has already been established. Sirius, at 2.6 pc, has the shortest period of the four and the best-determined orbit; 61 Cygni, at over three centuries of recorded observation since it was Bessel's original parallax target, has the longest period and the loosest orbital solution. The variation in period across the table — from 40.8 to 678 years — is itself a reminder that a visual orbit long enough to trace with confidence can demand observation across generations of astronomers, which is one more reason visual binaries supply only a modest fraction of the modern mass catalogue.

### Spectroscopic binaries

The components are unresolved — a single point of light — but orbital motion produces Doppler shifts in the spectral lines, periodically blue- and red-shifted as each star approaches and recedes.

In the single-lined case (SB1), only one star's lines are visible, the companion being too faint. What is measured is the radial velocity amplitude $K_1$ and the period. What is obtained is the mass function:

$$f(M) = \frac{(M_2\sin i)^3}{(M_1+M_2)^2} = \frac{P K_1^3}{2\pi G}$$

which is a combination of the masses and the unknown orbital inclination — not a mass at all. It sets only a lower limit on $M_2$.

The mass function is worth sitting with a moment longer, because its structure explains why an SB1 alone is so limited. The right-hand side, $PK_1^3/(2\pi G)$, is entirely observable — a period and a velocity amplitude, both directly measured from a time series of spectra. The left-hand side packages the two masses and the inclination together in a single irreducible combination: increasing $M_2$, decreasing $M_1+M_2$, or increasing $\sin i$ all move $f(M)$ in the same direction, so no amount of additional precision on $K_1$ or $P$ can separate them. The degeneracy is not a measurement problem to be solved with a better spectrograph; it is baked into the geometry of what a single spectrum, from a single star, in a system with an unknown orientation, can possibly report.

In the double-lined case (SB2), both sets of lines are visible and shift in antiphase. This yields something much better:

$$\frac{M_1}{M_2} = \frac{K_2}{K_1}$$

the mass ratio, exactly, with no inclination dependence whatsoever, because the unknown $\sin i$ appears identically in both velocity amplitudes and cancels in the ratio. Individually, $M_1\sin^3 i$ and $M_2\sin^3 i$ are also obtained. But $i$ itself remains unknown: a system seen nearly face-on has a small $\sin i$ and looks artificially low-mass, while one seen edge-on is measured correctly. This $\sin^3 i$ degeneracy is the central problem of spectroscopic binaries, and it cannot be solved with spectra alone.

### Eclipsing binaries

The orbital plane happens to lie close to the line of sight, so the stars pass in front of one another and the combined brightness dips periodically. This matters because an eclipse requires $i \approx 90°$ — the very geometry that produces the eclipse is itself a measurement of the inclination:

$$\sin^3 i \approx 1$$

The degeneracy is broken by the fact of the eclipse occurring at all. Better still, the shape and duration of the eclipses encode the stellar radii as fractions of the orbital separation: how long a dip lasts relative to the period reveals how large the stars are compared with their orbit.

### Astrometric binaries

One star is visible and traces a wobble against the background — the barycentric motion produced by an unseen companion. This is how Friedrich Bessel inferred the existence of Sirius B in 1844, eighteen years before it was actually seen through a telescope. It yields a mass function, exactly as an SB1 system does.

{{image: Sirius B | Sirius B, the white dwarf companion whose gravitational pull on Sirius A was inferred by Friedrich Bessel in 1844 from the visible star's wobbling proper motion, eighteen years before Alvan Graham Clark resolved the faint companion directly through a telescope in 1862.}}

Bessel's inference is worth dwelling on, because it shows the astrometric method working in its purest form. Sirius, the brightest star in the night sky, had been tracked with enough precision that its proper motion showed a small periodic deviation from a straight line — a wobble with a period of about fifty years. Bessel concluded that Sirius was not a single star but a binary, with an unseen companion massive enough to produce the observed swing of the visible star about their common barycentre. No spectrum of the companion was needed and none was available; the wobble alone was sufficient to establish both the existence of a second body and, combined with Kepler's third law once a distance and full orbit were available, an estimate of its mass. When Alvan Graham Clark finally resolved Sirius B optically in 1862 while testing a new telescope objective, the object was found essentially where the astrometric orbit had placed it.

## The gold standard

Combining the last two detection methods produces something remarkable. A double-lined spectroscopic binary that also eclipses yields:

| From spectroscopy (SB2) | From eclipses |
|---|---|
| $K_1$, $K_2$ → mass ratio exactly | $i \approx 90°$, breaking the $\sin^3 i$ degeneracy |
| $M_1\sin^3 i$, $M_2\sin^3 i$ | $R_1/a$, $R_2/a$ from eclipse durations |
| $P$, $e$ | |

Together: $M_1$, $M_2$, $R_1$, and $R_2$ — two masses and two radii, absolutely.

What was not required is worth noting carefully. No distance was needed: everything comes from a period, two velocity amplitudes, and the timing of brightness dips, and parallax plays no role. No stellar model was needed: there is no assumption about how the star generates energy, what it is made of, or how its interior is structured. And no calibration against other stars was needed either.

A detached eclipsing double-lined binary therefore yields masses and radii from Kepler's laws, the Doppler effect, and geometry alone — it is to stellar mass what parallax is to stellar distance: the one clean rung. The qualification "detached" matters: the components must not be distorted by tides or exchanging mass, or the geometry is no longer that of two spheres in a clean Keplerian orbit.

It is worth being explicit about why this combination of two ordinary, individually incomplete techniques produces something so much stronger than either. Spectroscopy alone leaves an unresolvable degeneracy in the inclination; photometry alone, from the eclipses, gives relative sizes and a rough inclination but nothing about mass at all, since a light curve contains no information about how much material is producing the gravity that holds the orbit together. Neither technique, applied on its own to a large sample of stars, would have built a mass scale. It is specifically the conjunction — the same system happening to be both double-lined and eclipsing — that converts two partial measurements into a complete one, and that conjunction is itself a matter of luck: nature must have oriented the orbital plane within a few degrees of the line of sight, and must have arranged for both stars to contribute comparably to the combined spectrum. Neither requirement is guaranteed by anything about how binaries form, which is one more reason the calibrating sample stays small no matter how many binaries are eventually catalogued.

{{image: Eclipsing binary | The light curve of a detached eclipsing double-lined binary: the depth and duration of each dip encode the stellar radii as fractions of the orbital separation, while the very existence of the eclipse pins the orbital inclination to within a few degrees of ninety, breaking the sine-cubed-i degeneracy left by spectroscopy alone.}}

There is a bonus here, significant enough to be a distance method in its own right. With $R_1$ and $R_2$ available from geometry, and effective temperatures available from the spectra, the Stefan–Boltzmann law gives the luminosities with no calibration whatever:

$$L = 4\pi R^2\sigma T^4$$

Comparing the resulting luminosity with the observed flux and applying the inverse-square law returns the distance. Detached eclipsing binaries are therefore a geometric distance indicator entirely independent of parallax. Applied to the Large Magellanic Cloud, the method gives a distance good to about 1%, and that measurement anchors the extragalactic distance ladder — and hence the Hubble constant. Stellar distance work rests on a single geometric rung; this is a second one, resting on completely different physics.

## The sample is tiny

Here is the fact that ought to be uncomfortable. Systems with both masses and radii determined to better than about 3% number roughly 95 systems (190 stars) in the standard 2010 critical compilation, and roughly 300 systems in the continually updated catalogue used today. That is the entire empirical foundation of the stellar mass scale.

The mass–luminosity relation is fitted to those stars. The main sequence is labelled with masses derived from that fit. Every stellar lifetime, every cluster age drawn from a main-sequence turnoff, every initial mass function, and the calibration of asteroseismic mass determinations all descend from it.

Set that against the distance scale:

| | Calibrating sample |
|---|---|
| Distance (parallax) | **1.47 × 10⁹** |
| Mass (eclipsing binaries) | **~300** |

The mass axis of stellar astrophysics is calibrated about five million times more sparsely than the distance axis. That is not a scandal — the measurements are excellent, the physics is clean, and a few hundred well-measured systems spanning a wide mass range genuinely do constrain a smooth relation — but it carries real consequences.

Coverage is uneven. Detached eclipsing binaries are found preferentially at masses and separations where eclipses are likely and both components are bright. Very low-mass stars are poorly represented; very massive stars are rare and often interacting, hence not detached.

Selection is not random. A system must eclipse, which requires favourable inclination, and both spectra must be visible, which requires comparable brightness — so the sample is biased toward near-equal-mass pairs. The population that is found is not the same as the population that exists.

And a systematic error in this sample propagates everywhere, because there is no independent check on the mass scale of the kind quasars provide for parallax zero points.

It is worth naming what a genuinely independent check would look like, if only to see how far the field currently is from having one. For the distance scale, quasars work because their true parallax is known in advance, on grounds entirely external to stellar astrophysics, to be indistinguishable from zero — so any non-zero measurement is pure instrumental artefact, fully separable from the quantity of interest. Nothing plays that role for stellar mass. There is no class of object whose mass is knowable a priori and that also resembles an ordinary star closely enough to expose a bias in stellar mass determinations. The Sun's mass is known independently and exactly, from the orbits of the planets, but it is a single point, not a population, and it cannot reveal whether the mass scale drifts with spectral type or evolutionary state the way a large, diverse set of reference objects could. Every other candidate — asteroseismology, microlensing, gravitational waves from compact mergers — either borrows part of its own calibration from the binary sample or applies to a different class of object altogether. The mass scale, in short, is checked for self-consistency far more thoroughly than it is checked against anything outside itself.

## How common are they?

Binaries are not a curiosity. For much of the stellar mass range, they are the normal arrangement.

| Type | Fraction in multiple systems |
|---|---|
| **O stars** (> 16 M☉) | **> 70%** — and most will interact |
| A stars | ~50% |
| **Solar-type** (F6–K3) | **~44%** |
| M dwarfs | ~27% |
| Brown dwarfs | ~20% |

Multiplicity rises steeply with mass, and the trend has a consequence that is easy to state backwards. Since M dwarfs make up the great majority of all stars and only about a quarter of them are multiple, the majority of individual stars are single. But the majority of solar-type systems are not, and the majority of massive stars will exchange mass with a companion at some point in their lives. That last point matters most: every conclusion about massive-star evolution is a conclusion about binaries, whether or not it says so, and a single-star model of a 20 M☉ star describes a minority case.

{{image: William Herschel | William Herschel, whose two-decade search for stellar parallax using close double stars instead revealed, in 1802 and 1803, that pairs such as Castor orbit one another under ordinary gravity, and who coined the term binary star for the phenomenon.}}

Binaries form during the collapse of a molecular cloud core. A core carrying too much angular momentum to collapse into a single object fragments instead, and the fragments end up in orbit around one another — the same physics, at a scale ten billion times larger, that produced the two lobes of the Kuiper Belt object Arrokoth. The distribution of separations is broad, roughly log-normal, peaking near 50 AU for solar-type stars, and spans from contact systems separated by a few stellar radii to wide pairs separated by tens of thousands of AU. The separation determines everything about a system's future evolution.

The steep rise in multiplicity with mass is itself a clue to the formation process. A massive protostellar core is both more turbulent and more strongly supported by rotation than a low-mass one, so it is more prone to fragmentation, and the cores that form O and B stars typically fragment several times over, producing not simple pairs but hierarchical systems of three, four, or more components. Close binaries among massive stars appear to form via fragmentation within a shared accretion disc rather than via the more distant fragmentation typical of solar-type pairs, which is part of why so many O stars end up in orbits tight enough to interact within a stellar lifetime rather than in the wide, dynamically inert pairs that dominate among lower-mass stars. A wide pair separated by tens of thousands of AU and a contact system separated by a few stellar radii may both trace back to fragmentation of a collapsing core, but only the second is a candidate for the interactions described below.

## When binaries interact

### The Roche lobe

Around each star in a binary is a teardrop-shaped region within which material is gravitationally bound to that star. The two regions meet at the inner Lagrange point $L_1$, where the gravitational pulls balance; these regions are the Roche lobes. Eggleton's approximation gives the size:

$$\frac{R_L}{a} = \frac{0.49\,q^{2/3}}{0.6\,q^{2/3} + \ln(1+q^{1/3})}, \qquad q = M_1/M_2$$

| $q = M_1/M_2$ | $R_L/a$ |
|---|---|
| 0.1 | 0.207 |
| 0.5 | 0.321 |
| **1.0** | **0.379** |
| 2.0 | 0.440 |
| 10.0 | 0.578 |

For equal masses, each star's lobe extends to about 38% of the separation.

{{image: Roche lobe | The Roche lobes of a binary system: each teardrop-shaped surface marks the boundary within which material remains gravitationally bound to its own star, meeting at the inner Lagrange point L1, where a star that expands past its lobe begins spilling matter onto its companion.}}

The table shows $R_L/a$ for the star of mass $M_1$ growing steadily as $q = M_1/M_2$ increases — the more dominant a star is over its companion, the larger, relative to the separation, its own Roche lobe becomes, because the inner Lagrange point sits further from the dominant star's centre. A star's evolutionary fate in a binary therefore depends not only on its own properties but on the mass of its companion and on the orbital separation, both of which are set at formation and evolve only slowly compared with a stellar lifetime, right up until one star begins to expand.

Stars expand enormously when they leave the main sequence — a solar-mass star becomes a red giant tens of times its original radius, and a supergiant hundreds of times. If a star expands past its Roche lobe, material at its surface is no longer gravitationally bound to it, and it spills through $L_1$ onto the companion. That is mass transfer, and it changes both stars irreversibly. Binaries are classified accordingly: detached, where neither star fills its lobe (the systems used for mass measurement); semi-detached, where one fills its lobe and is transferring; and contact, where both fill and overflow a common envelope.

### The Algol paradox

Here is the observation that proved mass transfer happens, and it is a lovely piece of reasoning.

Algol consists of a 3.7 M☉ B8 main-sequence star and a 0.8 M☉ K-type subgiant — a star that has already left the main sequence. The less massive star is the more evolved one. That is impossible for two stars evolving independently, and the arithmetic shows exactly how impossible:

| Mass | Main-sequence lifetime |
|---|---|
| 0.8 M☉ | **17 Gyr** |
| 3.7 M☉ | **0.38 Gyr** |

Both stars formed at the same time, from the same cloud. The 3.7 M☉ star should have exhausted its hydrogen after about 380 million years; the 0.8 M☉ star should still be on the main sequence for another seventeen billion years. Instead the situation is exactly reversed, and the lifetimes differ by a factor of 46 in the wrong direction.

The resolution is that the K subgiant was originally the more massive star. It evolved first, expanded, overflowed its Roche lobe, and transferred the bulk of its mass to its companion, reversing the mass ratio. What is observed now is a stripped remnant orbiting a star that has been fattened on its material. The paradox is not an anomaly to be explained away — it is the observational proof that mass transfer occurs, and it is why any stellar evolution model applied to a close binary must include it.

{{image: Algol | The Algol system: a 0.8 solar-mass K-type subgiant, already evolved, orbits a 3.7 solar-mass B8 main-sequence star. Independent evolution would require the more massive star to age 46 times faster, so the subgiant's advanced state is evidence that it was once the heavier star and transferred most of its mass to its companion.}}

### What interaction produces

Nearly every violent or exotic stellar phenomenon requires a companion:

| Phenomenon | Requires |
|---|---|
| **Novae** | Hydrogen accreted onto a white dwarf; surface thermonuclear runaway; recurs |
| **Type Ia supernovae** | A white dwarf driven toward the Chandrasekhar limit (1.4 M☉) |
| **X-ray binaries** | Accretion onto a neutron star or black hole |
| **Blue stragglers** | Mergers or mass-gainers, appearing bluer than a cluster's turnoff |
| **Type Ib/Ic supernovae** | A star whose envelope was stripped by a companion |
| **Gravitational-wave sources** | Compact-object mergers — GW150914, GW170817 |

Not one of these is possible for a single star. A stellar physics account that omits binaries can describe a working star and its remnant, and cannot explain novae, cannot explain the standard candles behind the discovery of dark energy, cannot explain the sources LIGO detects, and cannot explain why some supernovae show no hydrogen in their spectra. It connects back to smaller scales too: the Chandrasekhar limit of 1.4 M☉ is the mass above which electron degeneracy pressure fails — the same physics that sets the hydrogen-burning limit at 0.08 M☉ from below, and that makes brown dwarfs and giant planets Jupiter-sized.

## Pulling the thread

Herschel spent twenty-five years hunting parallax with double stars and failed. What he found in 1802–3 was that the pairs were orbiting each other — the first demonstration that Newtonian gravity operates outside the solar system, which had been an assumption for over a century. Bessel eventually succeeded at Herschel's original parallax goal thirty-five years later.

An orbit is the only astronomical observable that responds directly to mass. Everything else — brightness, colour, spectrum — reports on a surface, and a single star cannot be weighed. Each detection method yields a different and mostly incomplete set of quantities: visual binaries give the total mass and the ratio, but need a distance; SB1 systems give only a mass function; SB2 systems give the mass ratio exactly, since the $\sin i$ cancels, but leave $M\sin^3 i$ degenerate. Eclipses break the degeneracy by existing: an eclipse requires $i \approx 90°$, so $\sin^3 i \approx 1$, and eclipse durations give the radii.

A detached eclipsing double-lined binary therefore yields two masses and two radii from Kepler's laws, the Doppler effect, and geometry, with no distance, no stellar model, and no calibration required — it is to mass what parallax is to distance. And it returns the favour: radii from geometry plus temperatures from spectra give luminosities with no calibration, hence a geometric distance independent of parallax, which applied to the Large Magellanic Cloud reaches about 1% and anchors the extragalactic ladder.

The calibrating sample is about 300 systems, against 1.47 billion parallaxes — the mass scale is calibrated roughly five million times more sparsely than the distance scale, with uneven coverage and a selection bias toward near-equal-mass pairs. Multiplicity rises steeply with mass: about 27% for M dwarfs, about 44% for solar-type stars, and over 70% for O stars, most of which will exchange mass. Most individual stars are single because most stars are M dwarfs, but most massive stars are not single in effect, so every conclusion about massive-star evolution is a conclusion about binaries.

A star that expands past its Roche lobe — about 38% of the separation for equal masses — spills matter onto its companion. The Algol paradox, in which the less massive star is the more evolved one, is impossible for independent evolution by a factor of 46 in lifetime, and is the observational proof that mass transfer reversed the ratio. Interaction produces novae, Type Ia supernovae, X-ray binaries, blue stragglers, stripped-envelope supernovae, and gravitational-wave sources — none of which a single star can do.

Two clean rungs, with everything else calibrated against them: parallax supplies distance and therefore luminosity, and eclipsing binaries supply mass and radius. The natural next question is what happens when mass, now measured for a few hundred stars, is plotted against luminosity, now measured for a great many. Doing so reveals $L \propto M^{3.5}$ — a steeper dependence than almost anyone would guess — and an exponent of 3.5 has direct consequences for how long a massive star can last, given that it starts with proportionally more fuel to burn but consumes it far faster still.

## Further reading

An accessible account of Herschel's parallax programme, his double-star catalogues, and the 1802–3 discovery of orbital motion is given in {{book: Michael Hoskin | Discoverers of the Universe: William and Caroline Herschel | 2011}}.

- **Michael Hoskin, *Discoverers of the Universe: William and Caroline Herschel* (2011).** A history of William Herschel's astronomical career built substantially from his own observing journals, including the double-star catalogues of 1782 and 1785, the two-decade search for parallax that they were intended to support, and the 1802–3 papers in which Herschel concluded that several pairs — Castor among them — were executing genuine orbital motion under mutual gravity, work that made the term "binary star" part of the standard vocabulary of astronomy.

## Problems

*Data: Kepler's third law in solar units, $a^3/P^2 = M_1 + M_2$ ($a$ in AU, $P$ in years, $M$ in M☉). Barycentre condition $M_1 r_1 = M_2 r_2$. Mass ratio from radial velocities $M_1/M_2 = K_2/K_1$. Main-sequence lifetime $t \approx 10\,M^{-2.5}$ Gyr. Eggleton: $R_L/a = 0.49q^{2/3}/[0.6q^{2/3} + \ln(1+q^{1/3})]$. Chandrasekhar limit 1.4 M☉. Sirius: $a$ = 19.8 AU, $P$ = 50.1 yr, parallax 0.379″. Algol: 3.7 M☉ B8 V + 0.8 M☉ K subgiant.*

### 1 — A failed parallax hunt
**(a)** Explain Herschel's differential method for measuring parallax, and why using a close pair cancels most systematic errors.
**(b)** State the assumption the method requires about the two stars, and explain why its failure was the discovery.
**(c)** Herschel's binaries provided the first test of something that had been assumed for over a century. State what, and why it had not been tested before.
**(d)** John Michell argued in 1767 that most close pairs must be physical. Explain his reasoning, and state precisely why Herschel's contribution was stronger.
**(e)** Bessel succeeded at Herschel's original goal in 1838. What does the pairing of these two episodes suggest about the value of a well-designed programme that fails?

### 2 — Why two stars are needed
**(a)** Explain why a single star cannot be weighed, however well observed. Name the only handle available on mass.
**(b)** List four observable properties of a single star, and state what each reports on.
**(c)** State in one sentence why this makes binaries foundational rather than a special case.

### 3 — What each method yields
**(a)** For each of visual, SB1, SB2 and eclipsing binaries, state what is measured and what can be deduced.
**(b)** Explain why a visual binary cannot be weighed without a parallax. Which quantity requires the distance, and why?
**(c)** Show that the mass ratio from an SB2 system, $M_1/M_2 = K_2/K_1$, is independent of the inclination. Explain physically why the $\sin i$ cancels.
**(d)** Explain the $\sin^3 i$ degeneracy and why it cannot be resolved with spectra alone.
**(e)** An SB1 system yields only a mass function. State what a mass function is a lower limit on, and why that is still useful.

### 4 — The gold standard *(the central argument)*
**(a)** Explain why an eclipse constitutes a measurement of the inclination.
**(b)** Explain how eclipse durations yield stellar radii, and state what they are radii *relative to* before the orbit is scaled.
**(c)** List the four quantities obtained from a detached eclipsing SB2 system.
**(d)** State the three things **not** required. Compare explicitly with the requirements of a visual binary.
**(e)** Explain why "detached" is a necessary qualifier.
**(f)** Show how such a system yields a **distance**, and explain why this makes it independent of parallax. Why does that independence matter cosmologically?

### 5 — Sirius
Sirius A and B form a visual binary with $a$ = 19.8 AU and $P$ = 50.1 yr. Sirius B lies 2.1 times further from the barycentre than Sirius A.
**(a)** Compute the total mass of the system.
**(b)** Use the barycentre condition to compute the mass ratio, and then the individual masses.
**(c)** The parallax is 0.379″. Compute the distance and the angular semi-major axis of the orbit in arcseconds.
**(d)** Suppose the parallax were in error by 5%. Compute the resulting error in the total mass, and explain the scaling.
**(e)** Sirius B is a white dwarf of about 0.98 M☉ and roughly Earth's radius. Compute its mean density in kg/m³ and compare with water.

### 6 — A tiny foundation
**(a)** State the approximate number of systems with masses and radii known to better than 3%, and contrast with the number of Gaia parallaxes.
**(b)** List four results that descend from that sample.
**(c)** Give two distinct selection biases affecting which systems enter it, and state which part of the mass range each distorts.
**(d)** Gaia's parallax zero point can be checked against quasars. Is there an equivalent check on the mass scale? Discuss.

### 7 — Multiplicity
**(a)** Tabulate multiplicity fraction against spectral type and state the trend.
**(b)** Reconcile these two statements: "most stars are single" and "most massive stars will exchange mass with a companion."
**(c)** State the consequence for how single-star evolutionary models should be interpreted at high mass.
**(d)** Explain why binaries form. What is the conserved quantity that drives fragmentation?

### 8 — Algol *(the proof that mass transfer happens)*
**(a)** Compute the main-sequence lifetimes of a 3.7 M☉ and a 0.8 M☉ star.
**(b)** State the paradox precisely, and explain why it is impossible for two independently evolving coeval stars.
**(c)** Compute the ratio of the two lifetimes and state which direction the discrepancy runs.
**(d)** Give the resolution, and explain what the K subgiant originally was.
**(e)** Compute the Roche lobe radius as a fraction of separation for $q$ = 1 and $q$ = 5. Explain what a star does on reaching it.
**(f)** Explain why the Algol paradox is evidence rather than an anomaly.

### 9 — Open problem: how would you test the mass scale?
The stellar mass scale rests on ~300 eclipsing binaries and has no external calibration.
**(a)** Explain why comparing masses derived from stellar models against the binary sample is not an independent test.
**(b)** Name two physically independent methods of determining a stellar mass, and state their limitations.
**(c)** Design a programme to expand and check the mass scale. Distinguish what is achievable now from what is not.
**(d)** Suppose the mass scale were found to carry a 5% systematic. Trace the consequences through at least three other results.

## Worked answers

### 1 — A failed parallax hunt

**(a)** Instead of measuring one star's absolute position to a fraction of an arcsecond, the method measures the separation of a close pair and watches it change over a year. It cancels systematics because refraction, aberration, precession, instrumental flexure and thermal drift all act on both stars in nearly the same way — they are at nearly the same place on the sky, observed through the same air, with the same instrument, at the same moment. A difference measurement subtracts every error that is common to the two.

**(b)** It requires that one star is nearby and the other is a distant background object in chance alignment. Only then does the relative shift measure the near star's parallax. Its failure was the discovery because the pairs turned out to be physically associated — both stars at the same distance, orbiting a common centre of mass. There was no differential parallax to detect because there was no distant background star. The assumption that made the method work was exactly the assumption that turned out to be false, and its failure identified a new class of object.

**(c)** That Newtonian gravity operates outside the solar system. It had not been tested because every previous confirmation — the planets, the Moon, the tides, cometary orbits, falling bodies — lay within a few light-hours of the Sun. Calling the law "universal" was a claim of enormous scope supported by evidence of very narrow scope, and there was no way to check it until an orbit was observed somewhere else. Herschel's binaries provided Keplerian orbits at interstellar distances, and the law held.

**(d)** Michell argued statistically: if stars were scattered at random, the number of pairs appearing within a small angular separation could be computed, and the observed number of close pairs vastly exceeds it. So most must be physically associated rather than chance alignments. The reasoning is sound and the conclusion correct. Herschel's contribution is stronger because it is a direct observation of the individual case rather than an inference about the population. Michell established that most close pairs must be binary; he could not say of any particular pair that it was one. And a statistical argument is vulnerable to an unmodelled clustering in the stellar distribution, whereas an observed orbit is not vulnerable to anything.

**(e)** That a programme designed well enough to produce a definitive result will produce one even when its hypothesis fails. Herschel's method was sound, his sample was large, and he observed for two decades, so when no parallax appeared, the data were good enough to reveal why. A weaker programme would have produced only a null result. The pairing with Bessel makes the point sharper: the goal was achievable and Herschel simply did not have the precision — Bessel got there thirty-five years later with a better instrument and a smarter target. So Herschel's programme failed on its own terms and succeeded at something larger, and neither outcome was luck.

### 2 — Why two stars are needed

**(a)** Because mass is only detectable through its gravitational effect on something else, and a single star has nothing to act on. Its own gravity is not an observable; the acceleration it produces is, and only if there is a test body. The only handle is gravity, and gravity is only measurable through motion.

**(b)** Brightness reports the flux arriving, hence luminosity if distance is known. Colour reports surface temperature. Spectrum reports surface temperature, composition, gravity (from line widths), and line-of-sight velocity. Angular diameter, for the few resolvable stars, reports radius if distance is known. Every one reports on the surface, or on the total emergent radiation. None reaches the mass. Two partial exceptions are worth noting: surface gravity, $g = GM/R^2$, from line widths gives a combination of mass and radius, not a mass; and asteroseismology gives mean density from oscillation frequencies, again a combination. Both need external input to yield a mass, and both are calibrated on binaries.

**(c)** Because mass is the parameter the whole subject turns on, and binaries are the only place it can be measured, so the mass scale is not a topic within stellar physics but a precondition for it.

### 3 — What each method yields

**(a)**

| Type | Measured | Deduced |
|---|---|---|
| **Visual** | angular orbit $\alpha$, $P$, barycentre | total mass (with a distance) and mass ratio → both masses |
| **SB1** | $K_1$, $P$, $e$ | mass function only — a combination |
| **SB2** | $K_1$, $K_2$, $P$, $e$ | mass ratio **exactly**; $M_1\sin^3 i$, $M_2\sin^3 i$ |
| **Eclipsing** | eclipse depths and durations | $i \approx 90°$; $R_1/a$, $R_2/a$ |

**(b)** Because Kepler's third law requires $a$ in physical units (AU), and what is observed is an angle $\alpha$ in arcseconds. The conversion is $a = \alpha d$. Without a distance, the orbit's shape and period are known but not its size, and $M_1 + M_2 = a^3/P^2$ needs the size. The mass ratio, by contrast, needs no distance — it comes from the ratio of angular distances to the barycentre, and the distance cancels.

**(c)** For each component, the radial velocity semi-amplitude is

$$K_i = \frac{2\pi a_i \sin i}{P\sqrt{1-e^2}}$$

Taking the ratio, everything except $a_i$ is common to both:

$$\frac{K_1}{K_2} = \frac{a_1}{a_2}$$

and the barycentre condition $M_1a_1 = M_2a_2$ gives $a_1/a_2 = M_2/M_1$. Hence $M_1/M_2 = K_2/K_1$, with no $i$. Physically, the inclination determines what fraction of each star's orbital velocity is directed along the line of sight — and it is the same fraction for both, because both orbit in the same plane. Projection scales both velocities identically, so it cancels in their ratio: this is the ratio of two projections of the same projection.

**(d)** Radial velocities give only the line-of-sight component, so what is measured is $K \propto v\sin i$. Working through Kepler's laws, the masses appear only in the combination $M\sin^3 i$. It cannot be resolved with spectra alone because the spectrum contains no information about the orbital orientation. A face-on system ($i \approx 0$) shows almost no Doppler variation and mimics a low-mass system; an edge-on one is measured correctly. Breaking it requires an independent constraint on $i$ — from eclipses, from astrometry, or from resolving the orbit.

**(e)** It is a lower limit on the companion's mass $M_2$, since $\sin i \le 1$ and the true mass can only be larger than the value obtained by setting $\sin i = 1$. Still useful because a lower limit can be decisive when it is large enough: if the mass function requires $M_2 > 3$ M☉ for a compact, dark companion, the object exceeds the maximum neutron star mass and is a black hole candidate — established without ever knowing $i$. Several stellar-mass black holes were identified exactly this way.

### 4 — The gold standard

**(a)** Because an eclipse can only occur if the orbital plane lies close to the line of sight. If $i$ were far from 90° the stars would never pass in front of one another, and no dip would be seen. The observation of an eclipse is therefore a constraint on the geometry, and for close binaries with stars small compared with their separation, it pins $i$ to within a few degrees of 90° — enough that $\sin^3 i \approx 1$ to better than 1%. The degeneracy is broken by the fact that the phenomenon occurs at all.

**(b)** The duration of an eclipse relative to the orbital period measures how far the stars move while one is passing across the other, which depends on the stellar diameters compared with the orbital circumference. The shape (partial versus total, and any flat-bottomed portion) further constrains the two radii separately and the exact inclination. They are radii relative to the orbital semi-major axis — $R_1/a$ and $R_2/a$ — because the light curve only ever compares a stellar size with the orbit's size. Absolute radii follow once $a$ is known, which comes from the spectroscopy ($K_1 + K_2$ and $P$).

**(c)** $M_1$, $M_2$, $R_1$, $R_2$.

**(d)** No distance, no stellar model, no calibration against other stars. Contrast with a visual binary, which requires a parallax to convert its angular orbit into physical units, so its masses carry the full uncertainty of the distance scale. An eclipsing SB2 needs only a period, two velocity amplitudes, and eclipse timings, all measured directly from the system itself.

**(e)** Because the analysis assumes two spherical stars on a Keplerian orbit. If a star fills or nearly fills its Roche lobe it is tidally distorted — pear-shaped rather than spherical — which corrupts both the eclipse modelling (the projected area is no longer a circle) and the orbital dynamics. Worse, a semi-detached system is actively transferring mass, so the masses are changing and the orbit is evolving. Only detached systems are clean, which is one reason the calibrating sample is small.

**(f)** With $R$ from geometry and $T_{\text{eff}}$ from the spectrum, $L = 4\pi R^2\sigma T^4$ gives the luminosity with no calibration. Comparing with the observed flux and applying the inverse-square law gives the distance. It is independent of parallax because no step used one — the chain runs from Kepler's laws and eclipse geometry to a radius, and from a spectrum to a temperature, sharing no systematic with trigonometric parallax at all. Cosmologically it matters because the entire distance ladder is otherwise anchored on a single geometric rung. Applied to the Large Magellanic Cloud, eclipsing binaries give a distance good to about 1%, providing a second independent anchor for the Cepheid calibration and hence for the Hubble constant. Two anchors resting on disjoint physics is worth far more than one anchor measured twice.

### 5 — Sirius

**(a)** $M_1 + M_2 = a^3/P^2 = 19.8^3/50.1^2 = 7762/2510 = \mathbf{3.09\ M_\odot}$

**(b)** $M_A r_A = M_B r_B$ with $r_B = 2.1 r_A$, so $M_A = 2.1 M_B$. $2.1M_B + M_B = 3.09 \Rightarrow M_B = \mathbf{1.00\ M_\odot}$, $M_A = \mathbf{2.09\ M_\odot}$. (Accepted: 2.06 and 1.02 M☉.)

**(c)** $d = 1/0.379 = \mathbf{2.64\ pc}$. Angular semi-major axis $\alpha = a/d = 19.8/2.64 = \mathbf{7.5\ arcsec}$.

**(d)** Since $a = \alpha d$ and $M \propto a^3$, it follows that $M \propto d^3$. A 5% distance error gives $1.05^3 = 1.158$, i.e. a 16% mass error. Distance errors are amplified by a factor of three in mass — precisely why visual binaries were historically a poor mass source and why eclipsing systems, which need no distance, are the standard.

**(e)** $M = 0.98 \times 1.989\times10^{30} = 1.95\times10^{30}$ kg; $V = \tfrac{4}{3}\pi(6.371\times10^{6})^3 = 1.08\times10^{21}$ m³.

$$\rho = 1.8\times10^{9}\ \text{kg/m}^3$$

About 1.8 million times the density of water — a teaspoon would weigh some nine tonnes. This is degenerate matter, and it is the same physics that caps brown dwarfs at Jupiter's radius and sets the Chandrasekhar limit at 1.4 M☉.

### 6 — A tiny foundation

**(a)** About 300 systems (roughly 95 in the standard critical compilation at the 3% level), against 1.47 × 10⁹ Gaia parallaxes — a ratio of about 5 × 10⁶ to 1.

**(b)** The mass–luminosity relation; the mass labelling of the main sequence on the H–R diagram; stellar lifetimes and therefore cluster ages from main-sequence turnoffs; and the calibration of asteroseismic masses, which convert mean densities into masses using models tuned on binaries. Also creditable: the initial mass function, and every stellar population synthesis model.

**(c)** Inclination selection: a system must eclipse, requiring $i$ near 90°. The probability scales roughly as $(R_1+R_2)/a$, so close systems are strongly favoured — biasing against long-period binaries and therefore against systems containing evolved giants, distorting the high-mass and evolved end. Brightness selection: both spectra must be measurable, so the components must be of comparable luminosity, biasing toward near-equal-mass pairs and against systems with a faint low-mass companion, distorting the low-mass end, where masses are most poorly determined.

**(d)** There is no equivalent, and that is a real weakness. The quasar check works because quasars have a parallax known a priori to be zero — an external reference requiring no astronomical model. There is no class of star whose mass is known independently of dynamics. The nearest available substitutes are all partial. The Sun's mass is known exactly from planetary orbits and provides one anchor point, but only one, at one mass. Asteroseismology gives mean densities independently, and combining with binary radii tests consistency, but the seismic scaling relations are themselves calibrated on binaries, so the test is partly circular. Gravitational-wave measurements of compact-object masses are genuinely independent but apply to neutron stars and black holes, not to main-sequence stars. The mass scale is checked for internal consistency and anchored at one point — meaningfully weaker than the distance scale's position.

### 7 — Multiplicity

**(a)** O stars greater than 70%; A stars about 50%; solar-type about 44%; M dwarfs about 27%; brown dwarfs about 20%. Multiplicity rises steeply and monotonically with mass.

**(b)** They are statements about different populations. M dwarfs make up roughly three-quarters of all stars and only about 27% are multiple, so weighting by number, the majority of individual stars are single. But the statement about massive stars concerns a small, distinct subpopulation in which multiplicity exceeds 70% and separations are typically small enough for interaction. No contradiction: one is a claim about the numerically dominant population, the other about the dynamically dominant one.

**(c)** That a single-star model of a massive star is a model of a minority case, and should be treated as an idealisation rather than a default. Concretely, predicted supernova types, remnant masses, rotation rates, and chemical yields all change substantially when a companion strips the envelope or spins up the star. Population-level conclusions drawn from single-star tracks at high mass are unreliable, and modern population synthesis is built on binary evolution for exactly this reason.

**(d)** Because a collapsing molecular cloud core must conserve angular momentum. A core with more angular momentum than a single star can accommodate cannot collapse to one object — it spins up faster than gravity can pull it in — and instead fragments, with the pieces ending in orbit about one another. The conserved quantity is angular momentum, and binarity is one of the ways nature disposes of it. This is the same physics that produced the two lobes of the Kuiper Belt object Arrokoth, at a scale ten billion times smaller.

### 8 — Algol

**(a)** $t = 10M^{-2.5}$ Gyr: 3.7 M☉ → $10/26.3 = \mathbf{0.38\ Gyr}$. 0.8 M☉ → $10/0.572 = \mathbf{17.5\ Gyr}$.

**(b)** The less massive star (0.8 M☉) is the more evolved — it is a subgiant, while the 3.7 M☉ star is still on the main sequence. This is impossible for independent coeval evolution because both formed at the same time from the same cloud, and more massive stars evolve faster. The 3.7 M☉ star should have exhausted core hydrogen after 0.38 Gyr; the 0.8 M☉ star should remain on the main sequence for 17.5 Gyr, longer than the age of the universe. The observed situation is the exact reverse of the only possible ordering.

**(c)** $17.5/0.38 = \mathbf{46}$, and the discrepancy runs in the wrong direction — the star that should evolve 46 times more slowly has evolved first.

**(d)** The K subgiant was originally the more massive component. It evolved first (correctly), expanded as it left the main sequence, overflowed its Roche lobe, and transferred the bulk of its envelope to its companion. The mass ratio was thereby reversed: the donor is now the light star and the gainer the heavy one. What is observed is a stripped remnant orbiting a star fattened on its material, and the B8 star's apparent youth is real, because the mass it has gained rejuvenated it.

**(e)** $q = 1$: $R_L/a = \mathbf{0.379}$. $q = 5$: $R_L/a = \mathbf{0.521}$. On reaching its Roche lobe, material at the star's surface is no longer gravitationally bound to it — the lobe is precisely the boundary of the region where the star's gravity dominates. Matter flows through the inner Lagrange point $L_1$ onto the companion, and mass transfer begins, continuing as long as the donor remains in contact with its lobe.

**(f)** Because a genuine anomaly is an observation with no explanation, whereas this one has a specific, quantitative, independently testable explanation that also predicts other phenomena. Mass transfer is not invented to save Algol. It follows necessarily from stars expanding as they evolve (established independently) plus Roche geometry (elementary mechanics), and it predicts the entire family of interacting binaries — novae, X-ray binaries, blue stragglers, stripped-envelope supernovae — all of which are observed. The paradox is evidence because the resolution was forced by physics that was already in hand and explains far more than the case it was applied to.

### 9 — Open problem: how would you test the mass scale?

**(a)** Because stellar models are calibrated on the binary sample. The mass–luminosity relation, the mass–radius relation, and the interior physics adopted in evolutionary codes are all tuned so that model predictions reproduce those ~300 systems. Comparing model masses with binary masses therefore tests whether the calibration was performed correctly, not whether the underlying scale is right. A systematic error in the binary sample would have been absorbed into the models during calibration, and the comparison would come out fine. A ruler cannot be tested against a copy of itself.

**(b)** Asteroseismology: oscillation frequencies give the mean density directly, and with an independent radius yield a mass. Limitation: the scaling relations linking frequencies to density are themselves calibrated on binaries and the Sun, so the independence is partial, becoming stronger where full frequency modelling replaces scaling relations. Gravitational microlensing: the light curve of a lensing event depends on the lens mass, and with finite-source and parallax effects an absolute mass can be recovered with no assumption about the lens's luminosity, which works for dark objects. Limitation: events are rare, non-repeatable, and the mass is usually degenerate with distance unless both higher-order effects are measured. Also creditable: astrometric orbits from Gaia, which give masses for non-eclipsing systems, though these require a parallax; and dynamical masses in clusters, which are statistical rather than per-star.

**(c)** Achievable now: exploit the fact that eclipsing binaries are found in vast numbers by transit surveys — TESS, Kepler's archive, and Rubin — and follow up spectroscopically. The bottleneck is not discovery but spectroscopy: obtaining double-lined radial velocity curves requires substantial time on medium and large telescopes. A dedicated multi-object spectroscopic campaign could plausibly increase the 3%-accuracy sample by an order of magnitude, and should be targeted deliberately at the under-represented ranges identified above — very low masses, and evolved or long-period systems. Also achievable: Gaia astrometric binary orbits, which will supply masses for large numbers of non-eclipsing systems, a genuinely different selection function and therefore a check on the eclipse-selection bias. Not yet achievable: a truly external calibration analogous to the quasar check. Nothing supplies a stellar mass without either dynamics or a model, so the best available is cross-checking methods with different selection biases rather than testing against a known standard.

**(d)** Three consequences: the mass–luminosity relation shifts, moving the exponent and normalisation of $L \propto M^{3.5}$, and since $t \propto M/L$, a 5% mass error propagates to roughly a 17% error in stellar lifetimes ($t \propto M^{-2.5}$). Cluster ages shift: ages come from the main-sequence turnoff mass converted to a lifetime, so a 17% lifetime error moves every cluster age by that amount, including globular cluster ages, which are used as an independent lower bound on the age of the universe. The initial mass function shifts: the IMF is a distribution over mass, so a systematic in the mass scale rescales it, changing inferred star formation rates, the number of stars massive enough to become supernovae, and hence chemical evolution and feedback in galaxy models. A 5% systematic in a sample of 300 objects would move the inferred age of the universe — that is the honest measure of how much rests on this foundation.$astroBinary_master$,
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
  select $astroBinary_quiz$[{"id": "q1", "type": "mcq", "prompt": "Brightness reports flux, colour and spectrum report surface temperature, and angular diameter reports radius once distance is known. Why can a single star never be weighed, however completely it is observed?", "options": ["Because mass can only be detected through its gravitational effect on something else, and a single star has nothing else present to act on", "Because stellar mass is too small a quantity for any instrument to detect directly", "Because a single star's spectrum does not contain enough absorption lines to determine its composition", "Because mass only affects a star's colour, and colour measurements are not precise enough"], "answerIndex": 0, "explanation": "Every observable a single star offers -- brightness, colour, spectrum, angular diameter -- reports on its surface or its total emergent radiation, none of which is a direct report of mass. Gravity is the only handle on mass that exists, and gravity is only detectable through the motion it produces in something else. An orbit is the one astronomical phenomenon that responds directly to mass, and an orbit requires two bodies, which is exactly why binary stars are the foundation of the entire stellar mass scale rather than a special case within it."}, {"id": "q2", "type": "mcq", "prompt": "In a double-lined spectroscopic binary, both stars' spectral lines are visible and the mass ratio is obtained as M1 divided by M2 equals K2 divided by K1, where K1 and K2 are the two radial velocity amplitudes. Why does this ratio come out independent of the unknown orbital inclination, when a single star's velocity amplitude alone does not?", "options": ["Because the inclination only affects the fainter of the two stars, not the brighter one", "Because both stars orbit in the same plane, so the same sine-of-inclination projection factor multiplies both velocity amplitudes identically, and it cancels exactly when the two are divided", "Because double-lined systems are always observed edge-on, so the inclination is always ninety degrees by definition", "Because the mass ratio is measured from the orbital period alone, not from the velocity amplitudes at all"], "answerIndex": 1, "explanation": "Each star's measured velocity amplitude is proportional to its true orbital speed multiplied by the sine of the inclination, since only the line-of-sight component of the velocity is observed. Because both stars share exactly the same orbital plane, that same projection factor appears in both K1 and K2, and it cancels exactly when the ratio K2 over K1 is formed. What remains is a ratio of the two stars' true orbital speeds, which by the barycentre condition equals the inverse mass ratio -- so the mass ratio is recovered exactly with no dependence on inclination at all, even though neither individual mass can yet be pinned down."}, {"id": "q3", "type": "mcq", "prompt": "A double-lined spectroscopic binary alone leaves individual masses tangled up with the unknown inclination in the combination M sine cubed i. Why does the fact that a system also eclipses break this degeneracy?", "options": ["Because eclipses only occur in systems with exactly equal masses, which removes the need for an inclination at all", "Because an eclipse can only be observed if the orbital plane lies close to the line of sight, so the very occurrence of an eclipse constrains the inclination to be close to ninety degrees, making the sine cubed of it close to one", "Because eclipses make the two stars' spectra impossible to distinguish, which simplifies the velocity measurement", "Because eclipsing systems do not produce Doppler shifts, so the inclination problem does not arise for them"], "answerIndex": 1, "explanation": "For one star to pass in front of the other as seen from Earth, the orbital plane must lie close to the line of sight; if the inclination were far from ninety degrees, the two stars would never appear to cross and no dip in brightness would ever be seen. The observation of an eclipse is therefore itself a geometric measurement: for close binaries it pins the inclination to within a few degrees of ninety, so that sine cubed of the inclination is close enough to one that it can be treated as exactly one. That converts the combination M sine cubed i, left over from spectroscopy, into an actual mass, and the eclipse durations additionally supply the two stellar radii as fractions of the orbital separation, with no distance, stellar model, or external calibration used anywhere in the process."}, {"id": "q4", "type": "mcq", "prompt": "Systems with both stellar masses and both radii measured to better than about 3 percent number roughly 300 in the catalogue used today, compared with about 1.47 billion stars with Gaia parallax measurements. What consequence follows from this roughly five-million-to-one disparity, beyond its sheer size?", "options": ["None, because a few hundred well-measured systems spanning a wide mass range can still constrain a smooth relation reasonably well, though selection effects in which systems qualify become correspondingly important", "It means the mass-luminosity relation is essentially unknown and unusable for any purpose", "It means every star in the galaxy has now had its mass measured directly by extension from these 300 systems", "It means Gaia's parallax measurements must also be inaccurate, since the two catalogues disagree in size"], "answerIndex": 0, "explanation": "The disparity is not automatically a scandal, since the underlying measurements are excellent and the physics is clean, but it does mean the sample is small enough that how its members were selected matters a great deal. A system enters the catalogue only if it happens to eclipse, which requires a favourable inclination, and only if both stars' spectral lines are bright enough to measure, which favours comparable-luminosity pairs -- so the calibrating sample is biased toward near-equal-mass systems and toward whatever separations make eclipses likely, while very low-mass stars and rare, often-interacting massive stars are comparatively under-represented. There is also no independent, quasar-like check on this mass scale the way there is for the parallax zero point, so a systematic error anywhere in the roughly 300 systems would propagate into the mass-luminosity relation, main-sequence mass labels, stellar lifetimes, and cluster ages with nothing external to catch it."}, {"id": "q5", "type": "mcq", "prompt": "Algol consists of a 3.7 solar-mass B8 main-sequence star and a 0.8 solar-mass K-type subgiant that has already left the main sequence, even though the more massive star has an expected main-sequence lifetime of about 0.38 billion years against about 17 billion years for the less massive star. Why is this arrangement treated as proof that mass transfer occurs, rather than as an unexplained anomaly?", "options": ["Because it can only be true if the two stars did not actually form together, so no lifetime comparison is meaningful", "Because the reversed situation is only possible if the less massive, more evolved star was originally the more massive one, which evolved off the main sequence first, expanded past its Roche lobe, and transferred most of its material onto its companion -- a mechanism that follows from stellar expansion and Roche geometry already established independently, and that predicts other observed phenomena as well", "Because subgiants are always less massive than main-sequence stars in every binary system observed", "Because the two stars are not actually gravitationally bound, so their evolutionary histories are unrelated and no paradox exists"], "answerIndex": 1, "explanation": "Both stars formed together from the same cloud at the same time, and since more massive stars evolve faster, the 3.7 solar-mass star should have left the main sequence roughly 46 times sooner than the 0.8 solar-mass star -- yet the observed situation is exactly reversed, with the less massive star being the more evolved one. The resolution is that the subgiant was originally the more massive component: it evolved first as expected, expanded as it left the main sequence, overflowed its Roche lobe, and transferred the bulk of its envelope onto its companion, reversing the mass ratio and leaving a stripped remnant orbiting a star fattened on the transferred material. This is treated as proof rather than mere anomaly because the explanation was not invented to rescue Algol specifically -- it follows necessarily from stellar expansion during evolution and elementary Roche-lobe geometry, both already established, and it correctly predicts the existence of the wider family of interacting binaries, including novae, X-ray binaries, blue stragglers, and stripped-envelope supernovae."}, {"id": "q6", "type": "open", "prompt": "Explain the full chain of reasoning by which a detached, double-lined, eclipsing binary yields two stellar masses and two stellar radii using nothing but Kepler's laws, the Doppler effect, and eclipse geometry, with no distance, no stellar model, and no external calibration. In your answer, explain what each of the two component techniques -- double-lined spectroscopy and eclipse photometry -- supplies on its own, what each fails to supply on its own, and precisely how combining them closes the gap.", "rubric": "A strong answer explains that double-lined spectroscopy, from the radial velocity amplitudes K1 and K2 of both stars, yields the mass ratio M1 over M2 exactly, with no dependence on inclination, because the same sine-of-inclination projection factor multiplies both stars' observed velocities equally and cancels in the ratio; but it also yields only the combinations M1 sine cubed i and M2 sine cubed i for the individual masses, leaving true mass undetermined because the inclination itself remains unknown from spectra alone, since a face-on system mimics a low-mass one by suppressing the observed velocity. It should explain that eclipse photometry alone supplies relative sizes and eclipse timing but nothing about mass, since a light curve contains no direct information about the gravity holding the system together; however, the very fact that an eclipse is observed constrains the inclination to be close to ninety degrees, since eclipses are geometrically impossible unless the orbital plane lies close to the line of sight, and this makes sine cubed of the inclination effectively equal to one. It should state that this breaks the degeneracy left by spectroscopy, converting M1 sine cubed i and M2 sine cubed i into the true masses M1 and M2, and that the durations and shapes of the eclipses independently give the two stellar radii as fractions of the orbital separation, R1 over a and R2 over a, with the absolute separation a itself recoverable from the velocity amplitudes and the period via Kepler's third law. The answer should note explicitly that at no point in this chain is a distance, a stellar structure model, or a calibration against any other star required -- only a period, two velocity amplitudes, and the timing and shape of the eclipses, all measured directly from the system itself -- and that the qualifier detached matters because a star that fills or overflows its Roche lobe is tidally distorted rather than spherical and may be actively transferring mass, which would corrupt both the eclipse modelling and the assumption of a clean two-body Keplerian orbit."}, {"id": "q7", "type": "open", "prompt": "William Herschel spent about twenty-five years attempting to measure stellar parallax using close double stars, and failed at that specific goal, yet the programme is treated as one of the most consequential in the history of stellar astronomy. Explain what Herschel's method was designed to detect, why it failed to detect it, what he found instead in 1802 and 1803, and why that unintended result mattered more than the parallax measurement he had originally been seeking.", "rubric": "A strong answer explains that Herschel's method exploited close pairs of stars on the sky, on the assumption that one member of each pair was a nearby star and the other a much more distant background object in chance alignment, so that measuring the changing separation between the two over the course of a year -- rather than either star's absolute position -- would reveal the near star's parallax while cancelling out systematic errors such as refraction, aberration, precession, and instrument flexure that affect both stars almost identically. It should state that Herschel catalogued roughly seven hundred such pairs in 1782 and 1785 and observed them for about two decades, and that the method failed to detect any parallax at all. It should explain that what he found instead, announced in 1802 and 1803, was that in several pairs, including Castor, the separation and orientation were changing in a way unrelated to the Earth's annual motion, showing that the two stars were genuinely orbiting a common centre of mass rather than being a chance alignment of a near and a far object -- the discovery that led Herschel to coin the term binary star. The answer should explain why this mattered more than the original goal: it provided the first direct evidence that Newtonian gravity, whose validity had previously rested entirely on observations within a few light-hours of the Sun such as the planets, the Moon, and falling bodies, also governs motion at interstellar distances, since the observed pairs traced genuine Keplerian orbits under mutual gravity trillions of kilometres away. A complete answer may also note that John Michell had argued statistically in 1767 that most close pairs must be physically associated, but that Herschel's directly observed orbits were a stronger form of evidence than a statistical argument about a population, and that Bessel eventually succeeded at Herschel's original parallax goal in 1838, thirty-five years later, illustrating that a well-designed programme can produce a genuine and lasting result even when it fails at the specific question it set out to answer."}]$astroBinary_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/hr-diagram/binary-stars', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
