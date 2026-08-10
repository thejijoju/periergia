-- Astronomy & Space · The Extragalactic Universe — The Galaxy Zoo —
-- "Galaxy Types". Curated master for
-- astronomy-and-space/extragalactic/galaxy-zoo/galaxy-types
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists; two sibling nodes added in this
-- batch (Dwarfs and the Local Group, The Intergalactic Medium) ride in
-- seed.sql alongside.
--
-- Opens the Extragalactic branch. What kinds of galaxy exist and what
-- physically distinguishes them: the two-family division into
-- dispersion-supported spheroids and rotation-supported disks, and the
-- argument that this reflects whether the system's gas dissipated
-- before or after its stars formed - the Disk chapter's angular
-- momentum argument reappearing at the level of whole galaxies; light
-- profiles as a quantitative discriminant, from the de Vaucouleurs n=4
-- to the exponential n=1, and what a Sersic index encodes; the property
-- table across ellipticals, lenticulars, spirals and irregulars, with
-- gas fraction and v/sigma as the two variables doing the work; the
-- colour bimodality of red sequence and blue cloud with the sparse
-- green valley as evidence that quenching is fast; the scaling
-- relations - Faber-Jackson, the fundamental plane, and the virial
-- theorem underlying both; the morphology-density relation as evidence
-- that environment is a cause rather than a correlation; and the
-- Schechter luminosity function showing dwarfs dominate by number while
-- L-star galaxies dominate the light. ~10,000 words, multi-question
-- checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/galaxy-zoo/galaxy-types',
    'research',
    'advanced',
    'read',
    $egTypes_master$> Galaxies divide into a small number of recurring kinds. The primary division is between **spheroids** — ellipticals and the bulges of other galaxies, supported against gravity by random stellar motions, gas-poor and red — and **disks** — supported by ordered rotation, gas-rich, blue, and still forming stars. Almost everything else about a galaxy correlates with which of these it is, and with how massive it is.

The previous branch of this tree took a single galaxy apart. This one asks what the population looks like, and the first observation is that it is not a continuum of arbitrary shapes. Photograph a hundred thousand galaxies and they sort themselves into a few families whose members resemble each other closely — the same handful of structures recurring across billions of light-years and billions of years. That regularity is the subject.

Two questions organise the chapter, and it is worth separating them at the outset because conflating them causes most of the confusion in this area:

- **What kinds are there?** A classification question, answerable by looking.
- **Why are there these kinds?** A physical question, answerable only by understanding how galaxies form and what happens to them afterwards.

This chapter answers the first thoroughly and sketches the second, leaving the full account to the Formation & Evolution and Mergers chapters. But the sketch is worth having early, because the classification makes far more sense once one knows what it is tracking — and what it is tracking, at bottom, is **whether a galaxy's gas got rid of its energy before or after its stars formed**.

## Two families, one physical distinction

Begin with the physics rather than the pictures, since the pictures are easier to remember once the physics is in place.

The Disk chapter established the argument that produces disks: gas can radiate away energy but cannot radiate away angular momentum, so a collapsing gas cloud settles into the minimum-energy configuration at fixed angular momentum, which is a thin rotating disk. Stars formed from that gas inherit its ordered circular motion.

Now consider the alternative. Suppose the stars form **first**, out of gas that has not yet settled — or suppose two stellar systems merge, so that stars from each are thrown onto random orbits by the violently fluctuating potential (the Orbits chapter's violent relaxation). Stars are collisionless: they cannot dissipate, so once they are on disordered orbits, they **stay** on disordered orbits, permanently. There is no mechanism to flatten a stellar system after the fact.

That single asymmetry produces the two families:

| | **Disk-supported** | **Dispersion-supported** |
| --- | --- | --- |
| Stars formed | from settled, rotating gas | before settling, or scrambled afterwards |
| Support against gravity | ordered rotation | random stellar motions |
| $v/\sigma$ | ~10 | < 1 |
| Shape | flattened | round or triaxial |
| Gas today | abundant | little |
| Star formation | ongoing | essentially ceased |
| Colour | blue | red |
| Stellar ages | mixed, some young | uniformly old |

The correlations down that table are not independent facts to be memorised. A system that retains gas keeps forming stars; young massive stars are blue and dominate the light; and gas settles into a disk. A system that lost or consumed its gas early has only old stars, which are red, and no way to become flat afterwards. **One physical distinction propagates into every observable.**

```checkpoint
q: Elliptical galaxies are round and pressure-supported while spirals are flat and rotation-supported. The underlying reason a stellar system cannot flatten itself after forming is that
a: stars are too massive to be moved by gravitational forces
x: Stars are moved by gravity constantly — that is what orbits are. The obstacle is not the force acting on them but the absence of any way to remove their orbital energy.
a*: stars are collisionless and cannot dissipate energy, so disordered orbits persist indefinitely — only gas, which radiates, can settle into a disk
a: the dark matter halo is spherical and holds the stars in a spherical distribution
x: Dark halos are indeed roughly spherical, but they surround flattened disks perfectly well — the Milky Way is the example. Halo shape does not dictate stellar distribution.
a: elliptical galaxies rotate too slowly to become flattened by centrifugal force
x: This restates the observation rather than explaining it. The question is why they have little rotation to begin with, and why they cannot acquire a flattened shape by some other route.
hint: Gas becomes a disk because it can radiate energy away. What is the corresponding option for stars?
why: The Disk chapter's argument turns on dissipation: gas sheds energy as photons while conserving angular momentum, so it settles into the lowest-energy state available, a rotating disk. Stars have no equivalent — they are collisionless, so whatever orbits they are born on or thrown onto, they keep. A galaxy is therefore flat if its stars formed out of already-settled gas, and round if they formed before settling or were scrambled afterwards by a merger. The single distinction propagates into gas content, colour, and stellar age alike.
---
q: Elliptical galaxies are red and spirals are blue. This colour difference is primarily a statement about
a: the chemical composition of the stars, with ellipticals being more metal-rich
x: Ellipticals are somewhat more metal-rich on average, and metallicity does redden a population — but the dominant effect by far is age, since the presence or absence of short-lived blue stars swamps metallicity differences.
a*: current star formation — blue light is dominated by massive short-lived stars, so a galaxy appears blue only while it is still making them
a: the amount of dust, which reddens the light passing through it
x: Dust reddening is real and matters for individual sightlines, but spirals contain far *more* dust than ellipticals while appearing bluer. Dust cannot be the explanation for the population-level trend.
a: their distance, since more distant galaxies are redshifted
x: Cosmological redshift does redden distant galaxies, but the classification is made after correcting for it, and both types are found at all distances.
hint: Which stars produce most of a galaxy's blue light, and how long do they live?
why: Massive O and B stars are blue and enormously luminous but live only a few million to a few tens of millions of years, so they dominate a galaxy's blue output only while star formation continues. Once it stops, they die within a cosmic instant and the light is left to old red giants and low-mass stars. Colour therefore functions as a near-instantaneous indicator of ongoing star formation — which is why it correlates so tightly with gas content and morphology.
```

## Reading the light profile

The classification can be made quantitative, and the tool is the **surface-brightness profile** — how brightness falls off with radius.

Two forms recur, and they are the two limits of a single family:

**The exponential profile**, $I(R) \propto e^{-R/h}$, describes **disks**. It is the same profile the Milky Way's own disk follows, and — as that chapter noted — it lacks a first-principles derivation while being nearly universal.

**The de Vaucouleurs profile**, $I(R) \propto e^{-R^{1/4}}$, describes **ellipticals** and the bulges of spirals. It is far more centrally concentrated and has much broader wings: an elliptical has a bright core and faint outskirts extending a long way.

Both are cases of the **Sérsic profile**, $I(R) \propto \exp(-R^{1/n})$, with $n$ the **Sérsic index**: $n = 1$ is exponential, $n = 4$ is de Vaucouleurs. The index is a quantitative measure of central concentration, and it turns morphology from a matter of visual impression into a number that can be fitted to millions of galaxies automatically — which is exactly what large surveys do.

The physical reading is that $n$ tracks **how violently the system was assembled**. Violent relaxation, redistributing stellar energies during a merger, produces high-$n$ profiles; quiescent settling of gas produces exponential disks. A galaxy's Sérsic index is therefore a compressed record of its dynamical history, and a bulge-plus-disk galaxy is fitted with two components because it *has* two histories.

## The families in detail

**Ellipticals (E).** Smooth, featureless, round to moderately flattened, classified E0 through E7 by apparent flattening — though this measures projection as much as intrinsic shape, since a flattened elliptical seen face-on looks round. They are dispersion-supported, contain little cold gas, form essentially no stars, and host uniformly old populations. They span the widest mass range of any type, from dwarf ellipticals of 10⁷ solar masses to the giant cD galaxies of 10¹² that sit at the centres of clusters, cannibalising their neighbours.

A refinement worth knowing: ellipticals divide into **boxy** and **disky** subtypes by the shape of their isophotes. Disky ellipticals are lower-mass, rotate faster, and appear to be the products of gas-rich mergers; boxy ellipticals are the most massive, rotate slowly, and were assembled by gas-poor mergers of already-formed stellar systems. Two routes to the same broad appearance, distinguishable in detail.

**Spirals (S).** A rotating disk with spiral arms, a central bulge, gas, dust, and ongoing star formation. Subdivided Sa → Sb → Sc → Sd by a combination of decreasing bulge-to-disk ratio, increasing arm openness, and increasing gas content and star formation. About **two-thirds** of disk galaxies are **barred**, denoted SB — the Milky Way among them.

**Lenticulars (S0).** Disks without spiral arms: they have the flattened, rotating structure of a spiral and the gas-poor, red, non-star-forming character of an elliptical. They are the pivotal type for questions about how galaxies change, since the most natural reading is a spiral that lost its gas and stopped forming stars while keeping its disk. Their abundance in clusters supports exactly that.

**Irregulars (Irr).** No organised structure, gas-rich, actively star-forming, generally low mass. The Magellanic Clouds are the nearby examples. Their irregularity is partly intrinsic — a shallow potential well cannot impose order — and partly tidal, since many are being disturbed by larger neighbours.

**Dwarfs.** By number, the overwhelming majority of all galaxies, spanning dwarf ellipticals, dwarf spheroidals, and dwarf irregulars. They receive their own chapter shortly, because their properties are distinctive and their scientific importance is out of all proportion to their size.

Typical values across the sequence:

| Type | Gas fraction | $v/\sigma$ | Colour | Stellar mass range |
| --- | --- | --- | --- | --- |
| E | ~0.01 | < 1 | Red | 10⁷–10¹² $M_\odot$ |
| S0 | ~0.02 | ~3–5 | Red | 10¹⁰–10¹¹ |
| Sa | ~0.05 | ~5 | Intermediate | 10¹⁰–10¹¹ |
| Sc | ~0.20 | ~10 | Blue | 10⁹–10¹¹ |
| Irr | ~0.40 | variable | Blue | 10⁷–10¹⁰ |

```checkpoint
q: The Sérsic index n quantifies a galaxy's light profile, with n = 1 exponential and n = 4 de Vaucouleurs. Physically, a high index indicates a system that was
a: formed more recently, since concentrated profiles take time to develop
x: High-n profiles are found in the oldest galaxies, not the youngest. Concentration reflects how the system was assembled, not how long it has had to evolve.
a*: assembled violently — mergers redistribute stellar energies through a fluctuating potential, producing centrally concentrated profiles, whereas quiescent gas settling produces exponential disks
a: is rotating rapidly, which concentrates light toward the centre
x: Rapid rotation produces flattened, *exponential* disks — the low-n case. Rotational support and high concentration run in opposite directions.
a: contains more dark matter in its centre
x: Dark matter fractions do vary between galaxy types, but the Sérsic index describes the distribution of starlight and traces the stars' dynamical history rather than the halo's structure.
hint: Two assembly routes: gas quietly settling, or stars being thrown around during a merger. Which produces a concentrated profile?
why: Violent relaxation during a merger redistributes stellar energies within a crossing time, scattering stars into a centrally concentrated, extended-wing configuration — the de Vaucouleurs form. Gas that settles quietly while dissipating forms an exponential disk instead. The Sérsic index therefore compresses a galaxy's dynamical history into one number, which is why a bulge-plus-disk galaxy is fitted with two components: it genuinely has two histories, one violent and one quiescent.
---
q: Lenticular (S0) galaxies are pivotal for understanding how galaxies change because they possess
a: neither a disk nor a bulge, making them structurally unique
x: S0s have both — a prominent disk and usually a substantial bulge. Their distinctiveness lies in what they lack, which is gas and star formation, not in lacking structure.
a*: the flattened rotating disk of a spiral together with the gas-poor, red, non-star-forming character of an elliptical — most naturally read as a spiral that lost its gas
a: spiral arms that are unusually tightly wound
x: S0s have no spiral arms at all; that absence is part of their definition, and it follows from having no cold gas in which arms could form stars and become visible.
a: the highest star-formation rates of any galaxy type
x: They have essentially none, which is precisely what makes them interesting as an intermediate state between star-forming spirals and quiescent ellipticals.
hint: A disk cannot be manufactured after the stars form. So what does an S0's disk tell you about its past, and what does its lack of gas tell you about what happened since?
why: A disk requires stars to have formed from settled rotating gas, so an S0 must once have been a star-forming disk galaxy. Its red colour and gas deficiency show that star formation subsequently stopped without the disk being destroyed — which is exactly what gas removal, rather than a merger, would produce. Their strong over-representation in clusters, where gas can be stripped by the intracluster medium, supports that reading and makes S0s the clearest evidence that morphology can change during a galaxy's life.
```

```checkpoint
q: Ellipticals are classified E0 through E7 by apparent flattening, but this classification is unreliable as a measure of intrinsic shape because
a: the classification was made before galaxies were known to be external systems
x: Hubble's classification came after the Great Debate had been settled, so the observers knew what they were looking at. The problem is geometric, not historical.
a*: it records the shape projected on the sky, so a flattened elliptical viewed face-on is indistinguishable from a genuinely round one
a: elliptical galaxies change shape substantially over time
x: Ellipticals are dynamically relaxed and dispersion-supported; their shapes are stable over gigayears. Evolution is not the source of the ambiguity.
a: the outer regions are too faint for the shape to be measured accurately
x: Surface-brightness limits do affect where an isophote is drawn, but the fundamental problem persists even with perfect photometry: projection destroys information that no amount of depth recovers.
hint: A galaxy is a three-dimensional object recorded as a two-dimensional image. What is lost, and can it be recovered from one image?
why: Apparent flattening is the projection of a three-dimensional shape onto the sky, so an E0 classification is consistent both with a genuinely spherical galaxy and with a flattened one seen along its short axis. Since orientation is unknown for any individual object, the intrinsic shape cannot be recovered from an image alone — only statistically across a population, or by measuring kinematics. It is a good example of a classification whose categories are well defined observationally while tracking the underlying variable only loosely.
---
q: Boxy and disky ellipticals are distinguished by the shape of their isophotes, and the distinction is physically meaningful because the two correspond to
a: different viewing angles of the same underlying population
x: The distinction survives statistical analysis across many galaxies and correlates with mass, rotation and radio properties — correlations that random orientation could not produce.
a*: different assembly routes — disky ellipticals are lower-mass and rotate faster, consistent with gas-rich mergers, while boxy ellipticals are the most massive and slowly rotating, from gas-poor mergers of existing stellar systems
a: different stages in the life of a single galaxy, with boxy evolving into disky
x: There is no evolutionary sequence between them; the correlation with mass indicates they are distinct populations formed by distinct processes rather than stages of one process.
a: different dark-matter halo shapes imposed on identical stellar distributions
x: Halo shape does not dictate the fine structure of stellar isophotes, and the observed correlations with rotation and mass point to the stars' own assembly history.
hint: One route involves gas that can dissipate and form new stars; the other involves only stars, which cannot. What would each leave behind?
why: A merger of gas-rich progenitors lets the gas dissipate, settle and form new stars in a residual rotating component — leaving a faster-rotating, disky-isophote system of moderate mass. A merger of gas-poor systems has only collisionless stars to work with, so violent relaxation produces a slowly rotating, boxy remnant, and repeating that process builds the most massive ellipticals. Two routes to a superficially similar appearance, separable by detailed structure — which is why isophote shape is worth measuring.
```

## Two colours, and a nearly empty valley

Plot a large sample of galaxies with colour on one axis and luminosity or stellar mass on the other, and they do not spread out evenly. They occupy **two loci**:

- **The red sequence**: a tight, narrow band of red, passive galaxies, mostly ellipticals and lenticulars, becoming redder with increasing mass.
- **The blue cloud**: a broader scattering of blue, star-forming galaxies, mostly spirals and irregulars.

Between them lies the **green valley**, which is conspicuously **underpopulated**.

The sparseness is the informative part, and the argument is a demographic one worth following carefully. Galaxies must move from the blue cloud to the red sequence — star formation ceases, blue stars die out, colour reddens. Since the red sequence has grown over cosmic time while the blue cloud has not, that traffic is substantial and one-way.

But if the transition were **slow**, galaxies would spend a long time in the intermediate colour range, and the valley would be full — populated in proportion to how long the crossing takes. It is nearly empty. **Therefore the crossing is fast**: galaxies stop forming stars quickly, on timescales short compared with the age of the universe, rather than fading gradually over gigayears.

This is a general inference technique worth naming, because it recurs throughout astrophysics: **the number of objects observed in a state is proportional to how long that state lasts.** Nothing about individual galaxies is measured here — only how many are found where — and yet a timescale falls out. The same logic dates every short-lived stellar phase, from the sparseness of the Hertzsprung gap to the rarity of supernova progenitors caught before explosion.

What causes the rapid shutdown — **quenching** — is a central question of the next chapters. The candidates are gas removal by the environment, gas consumption without resupply, heating by an active nucleus, and disruption by a merger, and they operate in different regimes.

## Relations that ought not be so tight

Galaxies obey scaling relations linking properties that have no obvious reason to be related, and these are among the most useful facts in extragalactic astronomy.

**Faber–Jackson.** For ellipticals, luminosity scales with the fourth power of the central velocity dispersion, $L \propto \sigma^4$. So a dispersion measurement — obtainable from a single spectrum, with no spatial resolution — yields a luminosity, hence a distance.

**The fundamental plane.** Faber–Jackson has real scatter, and the scatter is not random: ellipticals actually occupy a two-dimensional surface in the three-dimensional space of effective radius, surface brightness, and velocity dispersion. Fitting all three reduces the scatter substantially. That such a plane exists is unsurprising — the virial theorem relates mass, size, and velocity dispersion, and mass relates to light through the mass-to-light ratio — but the plane's *observed* orientation differs from the naive virial prediction, indicating that mass-to-light ratio varies systematically with mass. Larger ellipticals have proportionally more mass per unit light, from older populations, more dark matter, or a different stellar mass distribution.

**Tully–Fisher**, the disk counterpart, was covered in the Rotation Curves chapter: $L \propto v^4$, tight, and puzzling because it links the dark halo's depth to the luminous disk's brightness.

**The mass–metallicity relation**, from the Chemical Enrichment chapter: more massive galaxies are more metal-rich, because they retain their metals rather than making more.

The pattern across all four is the same: **a galaxy's properties are not independent.** Mass, or something closely tracking it, determines size, velocity, chemistry, colour, and morphology together. Galaxy formation is evidently a highly regulated process rather than a set of independent accidents — and explaining the tightness of these relations, as the Rotation Curves chapter noted for Tully–Fisher, remains harder than explaining their existence.

```checkpoint
q: The green valley between the red sequence and blue cloud is sparsely populated. The standard inference is that
a: few galaxies ever change colour, so the two populations formed separately
x: The red sequence has grown substantially over cosmic time while the blue cloud has not, so there is heavy one-way traffic between them. Galaxies certainly do change colour.
a*: the transition from star-forming to passive is fast — galaxies spend little time at intermediate colours, so few are caught there
a: intermediate-colour galaxies are harder to detect and are being missed
x: The valley's sparseness survives careful accounting for selection effects, and green-valley galaxies are neither especially faint nor unusually distant. The deficit is real.
a: galaxies in the valley are being destroyed by mergers before they can be observed
x: Mergers do occur, but they cannot remove a whole population selectively by colour, and the merger rate is far too low to deplete an entire evolutionary stage.
hint: If many objects pass through a state but few are seen in it, what does that say about the state's duration?
why: In a population with steady traffic, the number occupying a state is proportional to how long that state lasts. Since galaxies demonstrably move from blue to red — the red sequence has grown while the blue cloud has not — an empty valley means the crossing is rapid, on timescales short compared with cosmic time. Nothing about any individual galaxy was measured; only how many sit where. The same reasoning dates every short-lived stellar phase and is one of the most portable inference techniques in astrophysics.
---
q: The fundamental plane improves on the Faber–Jackson relation by adding effective radius and surface brightness. That such a plane exists is unsurprising because
a: all elliptical galaxies have essentially identical stellar populations
x: They do not — populations vary systematically with mass, which is precisely why the plane's orientation departs from the naive prediction. Uniformity would remove the interesting part of the result.
a*: the virial theorem already relates mass, size and velocity dispersion, and mass connects to light through the mass-to-light ratio
a: galaxies are all observed at similar distances, creating an artificial correlation
x: The relation holds across a wide range of distances and is used *as* a distance indicator, which would be impossible if it were a distance artefact.
a: the three quantities are all measured from the same spectrum
x: Radius and surface brightness come from imaging, dispersion from spectroscopy — different measurements entirely. Shared instrumentation is not the source of the correlation.
hint: For a relaxed self-gravitating system, what equation already links mass, size, and velocity dispersion?
why: The virial theorem gives M ≈ σ²R/G for any relaxed system, so mass, size and dispersion cannot vary independently — a two-dimensional surface in that three-space is expected. What is informative is that the *observed* plane is tilted away from the naive virial prediction, which means the mass-to-light ratio varies systematically with mass: bigger ellipticals carry more mass per unit light, whether from older populations, more dark matter, or a different stellar mass distribution. The deviation, not the existence, is the physics.
```

{{image: Hubble sequence | The principal galaxy types. Ellipticals are smooth, red, gas-poor and supported by random stellar motions; spirals are flattened, blue, gas-rich and supported by rotation; lenticulars have a spiral's disk with an elliptical's dead stellar population. Nearly every difference between the families traces to one distinction — whether the stars formed from gas that had already settled, or before it could.}}

## Where a galaxy sits matters

Morphology is not distributed at random through space. The **morphology–density relation**, established by Alan Dressler in 1980, states that the fraction of elliptical and lenticular galaxies rises steeply with local galaxy density:

- In the **field** — low-density regions — roughly 70% of galaxies are spirals or irregulars.
- In **rich cluster cores**, roughly 80% are ellipticals and lenticulars.

The correlation is strong and unambiguous. Interpreting it requires care, since two readings are possible: galaxies in dense regions might have *formed* differently, or they might have been *transformed* after arriving. The evidence favours transformation as a substantial contributor, and the mechanisms are identifiable:

- **Ram-pressure stripping.** A galaxy moving through a cluster's hot intracluster gas at ~1,000 km/s feels a wind that can strip its own interstellar medium outright. Galaxies are observed mid-strip, with gas tails trailing behind them.
- **Strangulation.** Even without direct stripping, a galaxy in a cluster loses access to the fresh gas accretion it needs — the previous block's point that disks require continuous resupply. Cut off, it consumes its remaining gas and quietly reddens.
- **Harassment.** Repeated high-speed encounters with other cluster members, individually too fast for a merger, cumulatively heat and disturb a disk.
- **Mergers**, which are actually *less* common in cluster cores than in groups, because encounter velocities there are too high for galaxies to capture one another — the reason mergers are most effective in the intermediate-density environments where the largest ellipticals assembled.

The lenticulars are the strongest single piece of evidence for transformation: they are structurally disks, they are gas-poor, and they are strongly over-represented in clusters — precisely the population that gas removal without disk destruction would produce.

{{image: Elliptical galaxy | A giant elliptical: smooth, featureless, red, and supported entirely by the random motions of its stars. Its light follows a de Vaucouleurs profile — a bright concentrated core with faint extended wings — which is the signature of violent relaxation during mergers rather than the quiet settling of gas that builds a disk.}}

## How many of each

A final demographic point that reframes the whole classification.

The **luminosity function** — the number of galaxies per unit volume as a function of luminosity — is well described by the Schechter function, which has a power-law rise toward faint luminosities and an exponential cutoff above a characteristic luminosity $L^*$ near 10¹⁰ solar luminosities. Its faint-end slope is roughly $\alpha \approx -1.2$, meaning the number of galaxies **keeps rising** toward lower luminosities without any turnover yet observed.

The consequences are worth stating plainly:

- **By number**, dwarf galaxies overwhelmingly dominate. Every giant spiral is accompanied by tens or hundreds of dwarfs.
- **By light and stellar mass**, $L^*$ galaxies — Milky Way-scale systems — dominate, because the exponential cutoff prevents very luminous galaxies from being numerous while the faint-end slope is too shallow for dwarfs to contribute much total light.

So the galaxy that is *typical* by number is a dwarf, and the galaxy that contains a *typical* star is an $L^*$ spiral. Both statements are correct and they describe different questions. Textbook images almost always show the second kind, which quietly misrepresents the population — one reason the dwarf chapter that follows shortly matters more than its subjects' size suggests.

For scale: the observable universe contains of order **10¹¹ to 10¹²** galaxies, depending on how faint a system still counts as one.

```checkpoint
q: The morphology–density relation shows ellipticals and lenticulars dominating cluster cores while spirals dominate the field. Evidence that this reflects transformation rather than only differing formation is that
a: cluster galaxies are systematically more massive than field galaxies
x: Mass does correlate with environment, but this would support a formation-based explanation rather than a transformation one. It does not distinguish the hypotheses.
a*: lenticulars — structurally disks but gas-poor and red — are strongly over-represented in clusters, exactly the population that gas removal without disk destruction would produce
a: cluster galaxies have higher rates of ongoing star formation
x: The opposite is observed: cluster galaxies are markedly more quenched than field galaxies at the same mass, which is the phenomenon requiring explanation.
a: mergers are more frequent in cluster cores, converting spirals into ellipticals
x: Mergers are actually *less* frequent in cluster cores, because encounter velocities are too high for galaxies to capture one another. They dominate in intermediate-density groups instead.
hint: A disk cannot be built after the stars form. What kind of galaxy would you expect if a spiral simply lost its gas — and where do you find them?
why: Since a disk requires stars to have formed from settled rotating gas, an S0's disk proves it was once a star-forming spiral, while its red colour and gas deficiency show star formation stopped without the disk being destroyed. That is the specific signature of gas removal rather than merging, and S0s are strongly concentrated in clusters, where ram-pressure stripping and strangulation both operate. Galaxies are observed mid-strip with trailing gas tails, which completes the case.
---
q: Dwarf galaxies dominate the galaxy population by number, while L* galaxies dominate the total stellar mass and light. Both statements are true because the luminosity function
a: has a sharp peak at L*, with few galaxies above or below
x: There is no peak in number at L* — the number density keeps rising toward fainter luminosities. L* marks where the exponential cutoff sets in at the bright end, not a maximum in counts.
a*: rises toward faint luminosities as a power law with slope around −1.2, while an exponential cutoff suppresses galaxies brighter than L* — so counts favour dwarfs but total light favours L*
a: is flat, so each luminosity interval contributes equally to both number and light
x: A flat function would make neither statement true, and the observed steep faint-end rise and bright-end cutoff are both well measured.
a: is measured differently for dwarfs and giants, making the two statements incomparable
x: Both come from the same surveys and the same function; the apparent tension is resolved by noticing that number and integrated light are different weightings of one distribution.
hint: Ask what each statement weights: one counts galaxies, the other weights each galaxy by its luminosity.
why: A faint-end slope near −1.2 means numbers keep climbing toward low luminosities with no observed turnover, so dwarfs dominate any headcount. But integrating luminosity weights each galaxy by its light, and the exponential cutoff prevents very bright galaxies from being numerous while the faint slope is too shallow for dwarfs to contribute much total light — leaving L* systems dominant. The typical galaxy is a dwarf; the galaxy containing a typical star is a Milky Way analogue, and textbook images show only the second.
```

## Pulling the thread

- The primary division is between **dispersion-supported spheroids** and **rotation-supported disks**, and it traces to one asymmetry: **gas dissipates and settles into a disk; stars are collisionless and cannot**. A galaxy is flat if its stars formed from already-settled gas, round if they did not — and every correlated property (gas, colour, age, star formation) follows.
- **Sérsic index** makes this quantitative: $n = 1$ (exponential) for quiescently settled disks, $n = 4$ (de Vaucouleurs) for violently assembled spheroids. A bulge-plus-disk fit reflects two genuine histories.
- The families are **E** (widest mass range, boxy and disky subtypes from gas-poor and gas-rich mergers), **S0**, **S/SB** (two-thirds barred), **Irr**, and **dwarfs** (most numerous of all).
- The colour–magnitude diagram shows a **red sequence** and **blue cloud** with a nearly empty **green valley** — and the emptiness proves **quenching is fast**, via the general rule that *occupancy is proportional to duration*.
- **Faber–Jackson**, the **fundamental plane**, **Tully–Fisher**, and the **mass–metallicity relation** all show galaxy properties are not independent. The fundamental plane's **tilt away from the virial prediction** reveals mass-to-light ratio varying systematically with mass.
- The **morphology–density relation** is substantially causal: **ram-pressure stripping**, **strangulation**, and **harassment** transform cluster galaxies, with **lenticulars** as the signature product. Mergers are rarer in cluster cores than in groups, because encounters there are too fast for capture.
- The **Schechter function** makes dwarfs dominant by number and $L^*$ galaxies dominant by light. Both are true; they answer different questions.

The transferable idea: **a classification is only as good as the physical variable it happens to track.** The galaxy types were defined visually, decades before anyone knew what produced them — and they turned out to be useful not because the categories were well chosen but because they correlate with something real: whether a system's stars formed from dissipated gas. Where a visual taxonomy tracks a physical variable, it survives and deepens; where it does not, it becomes an obstacle, as the Hubble sequence's misleading evolutionary implication (the next chapter's subject) illustrates. The productive question about any classification scheme — of galaxies, of diseases, of economies — is not "are the categories tidy?" but "**what underlying variable is doing the work, and does the scheme actually track it?**"

## Further reading

{{book: Linda Sparke | Galaxies in the Universe: An Introduction | 2007}}

{{book: James Binney | Galactic Astronomy | 1998}}

{{book: Timothy Ferris | Galaxies | 1980}}

Beyond the books: Dressler's 1980 morphology–density paper established environmental dependence from a sample of 55 clusters and remains the standard reference; the Sloan Digital Sky Survey papers establishing the colour bimodality show the red sequence and blue cloud emerging from a sample large enough that the gap between them cannot be doubted; and de Vaucouleurs' original work on the $R^{1/4}$ profile is worth seeing for how much structure one functional form captured.

## Problems

*Useful numbers: L ∝ σ⁴ (Faber–Jackson); virial M ≈ σ²R/G; Sérsic I(R) ∝ exp(−R^(1/n)); Schechter faint-end slope α ≈ −1.2, L* ≈ 10¹⁰ L☉; G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 pc = 3.086 × 10¹⁶ m.*

**1.** *(Two families, one cause.)* **(a)** State why gas can settle into a disk but stars cannot. **(b)** Using this, explain why ellipticals are simultaneously round, red, gas-poor, and old — as consequences rather than coincidences. **(c)** Predict what a galaxy would look like if it lost all its gas immediately after its disk formed, and name the observed type.

**2.** *(Faber–Jackson.)* Two ellipticals have central velocity dispersions of 150 and 300 km/s. **(a)** Compute the ratio of their luminosities. **(b)** Explain why this relation is useful as a distance indicator. **(c)** State one reason its scatter is not random.

**3.** *(The virial basis of the fundamental plane.)* **(a)** Write the virial relation between mass, radius, and velocity dispersion. **(b)** Show that combining it with a constant mass-to-light ratio predicts a relation between luminosity, radius, and dispersion. **(c)** Explain what the observed tilt away from this prediction implies.

**4.** *(An elliptical's mass.)* An elliptical has σ = 250 km/s and an effective radius of 5 kpc. **(a)** Estimate its mass. **(b)** If its luminosity is 5 × 10¹⁰ L☉, compute M/L. **(c)** Compare with the value expected for an old stellar population and comment.

**5.** *(Occupancy and duration.)* **(a)** State the general rule linking the number of objects in a state to the duration of that state. **(b)** Apply it to the green valley and state the conclusion. **(c)** Give one other example of this inference from elsewhere in this tree.

**6.** *(Reading a profile.)* Two galaxies are fitted with Sérsic profiles, one with n = 1.1 and one with n = 3.8. **(a)** Identify the likely morphological type of each. **(b)** State what each index implies about assembly history. **(c)** Explain why some galaxies require a two-component fit.

**7.** *(Environment.)* **(a)** Name three mechanisms that transform galaxies in clusters and state what each does. **(b)** Explain why mergers are *less* effective in cluster cores than in groups. **(c)** State which galaxy type is the clearest evidence for transformation and why.

**8.** *(Counting versus weighing.)* Using a Schechter function with α = −1.2: **(a)** explain why the number density keeps rising toward faint luminosities. **(b)** Explain why the total light is nonetheless dominated by galaxies near L*. **(c)** State which type of galaxy is "typical" under each of the two weightings.

**9.** *(Assembling a classification.)* A survey finds a galaxy that is flattened and rotating, red, gas-poor, with n = 3.5 and no spiral arms. **(a)** Classify it. **(b)** Reconstruct its plausible history from each property in turn. **(c)** Name the observation you would make to distinguish gas stripping from a gas-poor merger as the cause.

## Worked answers

**1.** **(a)** Gas is collisional: parcels on crossing orbits shock, radiate the energy away as photons, and settle toward the minimum-energy configuration at fixed angular momentum, which is a rotating disk. Stars are collisionless — they pass through one another's neighbourhoods without interacting, so they cannot shed orbital energy and keep whatever orbits they were born on. **(b)** If a galaxy's stars formed before the gas settled, or were scrambled by a merger, they are permanently on disordered orbits — hence **round** and dispersion-supported. Such a system either consumed or lost its gas, so it is **gas-poor**; without gas it forms no new stars, so its population is **old**; and an old population contains no short-lived blue stars, so it is **red**. One event determines all four. **(c)** A flattened, rotating, red, gas-poor, non-star-forming disk with no spiral arms — a **lenticular (S0)**, since arms require cold gas to make the young stars that render them visible.

**2.** **(a)** $L \propto \sigma^4$, so $(300/150)^4 = 2^4 = \mathbf{16}$. **(b)** A velocity dispersion is measured from the width of absorption lines in a single spectrum, requiring no spatial resolution and no knowledge of distance; the relation converts it into an intrinsic luminosity, and comparing that with the observed flux gives the distance. **(c)** The scatter is structured, not random: ellipticals actually occupy a two-dimensional **fundamental plane** in the space of radius, surface brightness, and dispersion, so what appears as scatter in the projection onto Faber–Jackson is the plane's third dimension seen edge-on. Fitting all three quantities substantially reduces it.

**3.** **(a)** $M \approx \sigma^2 R/G$ for a relaxed self-gravitating system. **(b)** Writing $L = M/(M/L)$ and using $L = 2\pi R_e^2 I_e$ for the light within the effective radius, constant $M/L$ gives $R_e \propto \sigma^2 I_e^{-1}$ — a plane in the three-dimensional space, since only two of the three quantities are independent. **(c)** The observed plane is tilted: the exponents differ from the virial prediction, which can only happen if $M/L$ is **not constant** but varies systematically with mass. More massive ellipticals carry more mass per unit light — from older stellar populations, a larger dark-matter fraction within the effective radius, or a different distribution of stellar masses. The deviation from the naive expectation is where the physics is.

**4.** **(a)** $M \approx \sigma^2R/G = (2.5\times10^{5})^2 \times (5 \times 3.086\times10^{19})/6.674\times10^{-11} = 6.25\times10^{10} \times 1.543\times10^{20}/6.674\times10^{-11} = 1.44\times10^{41}$ kg $= \mathbf{7.3\times10^{10}\ M_\odot}$. **(b)** $M/L = 7.3\times10^{10}/5\times10^{10} = \mathbf{1.5}$. **(c)** An old stellar population alone gives $M/L \approx 5$–10, so this estimate is **low** — which flags the crudeness of the virial estimator rather than a shortage of mass. Using the effective radius rather than a proper mass-weighted radius, and omitting the geometric factor of order 3–5 that a careful derivation supplies, both push the answer down. Corrected estimates give values consistent with an old population plus a modest dark-matter contribution.

**5.** **(a)** In a population with steady traffic through a sequence of states, **the number of objects found in a state is proportional to the time spent in it**. **(b)** Galaxies demonstrably move from the blue cloud to the red sequence, yet the intermediate green valley is nearly empty — so the crossing must be **fast**, on timescales short compared with cosmic time. Quenching is rapid rather than a slow fade. **(c)** The **Hertzsprung gap** in stellar evolution: few stars are observed between the main sequence and the red-giant branch, because the crossing is quick. The rarity of supernova progenitors caught pre-explosion, and of stars in the brief thermally pulsing AGB phase, are further instances.

**6.** **(a)** $n = 1.1$ is essentially exponential — a **disk**, so a spiral or lenticular. $n = 3.8$ is close to de Vaucouleurs — an **elliptical** or a large bulge. **(b)** The low index indicates quiescent settling of dissipating gas into a rotating disk; the high index indicates violent assembly, in which a fluctuating potential redistributed stellar energies and produced a centrally concentrated profile with extended wings. **(c)** Because such galaxies genuinely have **two components with two histories**: a bulge assembled violently (or, as the Milky Way's case showed, by a buckled bar) and a disk built quiescently from settled gas. A single Sérsic index would average two distinct structures and describe neither.

**7.** **(a)** **Ram-pressure stripping** — motion at ~1,000 km/s through the hot intracluster medium creates a wind that strips the galaxy's own gas, observed directly as trailing gas tails. **Strangulation** — the galaxy is cut off from fresh gas accretion, so it consumes its remaining supply and reddens without any violent event. **Harassment** — repeated fast fly-by encounters, individually too rapid to merge, cumulatively heat and disturb the disk. **(b)** A merger requires two galaxies to become gravitationally bound, which needs their relative velocity to be comparable to their internal velocities. In cluster cores relative velocities reach ~1,000 km/s, far above internal dispersions, so galaxies pass through one another without capture. In **groups**, relative velocities are a few hundred km/s and capture is efficient — which is why the largest ellipticals assembled in intermediate-density environments. **(c)** **Lenticulars**: structurally disks, so they must once have been star-forming spirals, yet gas-poor and red, and strongly over-represented in clusters. That combination is the specific signature of gas removal without disk destruction.

**8.** **(a)** The faint-end slope $\alpha = -1.2$ means the number density per unit luminosity rises as luminosity falls, with no observed turnover — so counts keep increasing toward the faint end. **(b)** Total light weights each galaxy by its luminosity, and $\alpha = -1.2$ is shallower than the $-2$ needed for faint galaxies to dominate an integral of $L\,\phi(L)\,dL$; meanwhile the exponential cutoff prevents galaxies far brighter than $L^*$ from being numerous. The integral is therefore dominated near $L^*$. **(c)** By number, the typical galaxy is a **dwarf**; by stellar mass and light — equivalently, the galaxy in which a randomly chosen star resides — it is an **$L^*$ spiral** like the Milky Way. Both are correct answers to different questions, and textbook imagery almost exclusively shows the second.

**9.** **(a)** A **lenticular (S0)**. **(b)** *Flattened and rotating*: its stars formed from gas that had already settled into a disk, so it was once a star-forming disk galaxy. *Red and gas-poor*: star formation ceased, and the gas is gone or exhausted. *No spiral arms*: arms are traced by young massive stars formed in cold gas, which no longer exists there. *n = 3.5*: a substantial bulge component, so the fit is weighted toward the concentrated central region — consistent with an early-type disk galaxy rather than a pure disk. **(c)** Examine the **stellar disk's kinematics and its surroundings**. Gas stripping leaves the stellar disk dynamically cold and undisturbed, since only the gas is removed, and should leave environmental evidence — cluster membership, a trailing gas tail, or a nearby intracluster medium. A gas-poor merger heats and thickens the stellar disk, leaves tidal features, and often produces kinematic misalignments or counter-rotating components. Measuring the disk's velocity dispersion relative to its rotation, and checking for tidal debris, distinguishes the two.$egTypes_master$,
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
