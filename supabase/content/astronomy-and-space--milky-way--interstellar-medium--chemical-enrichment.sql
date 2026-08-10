-- Astronomy & Space · The Milky Way — Interstellar Medium —
-- "Chemical Enrichment". Curated master for
-- astronomy-and-space/milky-way/interstellar-medium/chemical-enrichment
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (Interstellar Medium block), so this
-- change is content-only: no seed edit rides with it.
--
-- Block capstone. Distinguished from the Nucleosynthesis chapter, which
-- covered where elements are manufactured: this one covers how the
-- medium acquires, mixes, transports and loses them. The closed-box
-- model derived and then broken twice - by the G-dwarf problem and by
-- its overprediction of present-day metallicity from the observed gas
-- fraction; the two return channels contrasted, fast hot buoyant
-- supernova ejecta that preferentially escapes against slow dusty AGB
-- winds that are retained, and the metal-loss problem this creates;
-- mixing as the genuinely hard part, with turbulent timescales short
-- locally and long radially, and the observed abundance scatter as
-- evidence of incomplete mixing; the radial gradient, inside-out
-- formation, and migration blurring the record; leaky-box models with
-- effective yield falling as p/(1+eta), and the galaxy mass-metallicity
-- relation as direct evidence that small galaxies lose their metals;
-- and dust as both a complication in the accounting and a tracer of it.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/interstellar-medium/chemical-enrichment',
    'research',
    'advanced',
    'read',
    $mwChemEnrich_master$> **Chemical enrichment** is the process by which the interstellar medium's composition changes over time as stars return processed material to it. It is distinct from nucleosynthesis, which concerns where elements are *manufactured*: this is the question of how those elements are **delivered** into the gas, **mixed** through it, **transported** across a galaxy, and — crucially — **lost** from it.

The Nucleosynthesis chapter established the origin of every element and closed the ledger of manufacture. That ledger says nothing about a set of questions the interstellar medium poses on its own. Metals are made inside stars; how do they get out, and does all of what gets out stay? How quickly does a supernova's ejecta blend into the surrounding gas — instantly, or over a hundred million years? Why does the outer Galaxy have less than a fifth the metal content of the inner Galaxy? And why are small galaxies systematically metal-poor, when the stars inside them manufacture metals just as efficiently as anyone else's?

The answers turn out to be governed less by nuclear physics than by **fluid mechanics and bookkeeping** — how well things mix, and what leaks out. This chapter closes the Interstellar Medium block by following the metals from the moment they leave a star to the moment they enter the next one.

## The simplest possible model, and how it fails

Begin with the model every treatment of chemical evolution starts from, because its failures are more instructive than any successful model's successes.

The **closed box** assumes: a fixed reservoir of initially pristine gas; stars forming from it; each generation returning enriched material instantly and mixing it perfectly; and nothing entering or leaving. Three quantities define it:

- the **yield** $p$ — the mass of new metals produced per unit mass of gas locked permanently into stars;
- the **return fraction** $R$ — the share of a stellar population's mass given back to the medium, about 0.3–0.4 for a standard initial mass function;
- the **gas fraction** $\mu$ — the share of the system's mass still in gas.

The model then produces a single, elegant result:

$Z = p \ln(1/\mu)$

The metallicity depends only on the yield and on how much gas has been consumed. It requires no knowledge of the star-formation history, the timescale, or the geometry — only on how far through its gas the system has worked. That is a remarkably powerful statement for such a simple set of assumptions, and it is the reason the closed box remains the standard starting point despite being wrong.

It fails in two independent ways, and each failure identifies a specific missing ingredient.

**Failure one: the G-dwarf problem.** As the Stellar Populations chapter established, a closed box passes through a metal-poor phase and leaves behind abundant metal-poor long-lived stars — roughly 35% of surviving low-mass stars below a quarter of solar metallicity, against about 2% observed. The model overpredicts metal-poor stars by a factor of ~17. The missing ingredient is **infall**: continuous accretion of relatively unenriched gas keeps the reservoir topped up and dilutes it, so metallicity stays in a narrow band instead of climbing from zero.

**Failure two: the present-day metallicity is too high.** Take the solar neighbourhood's gas fraction, roughly 0.1–0.2, and the yield inferred from stellar nucleosynthesis, and the closed box predicts a present metallicity of **1.6–2.3 times solar**. The observed value is solar. The model overpredicts how enriched the gas should be by having consumed as much of itself as it has.

Two failures in opposite directions — too many metal-poor stars, and too much metal in the gas today — are more informative than one, because they cannot both be repaired by adjusting the yield. Raising $p$ worsens the second; lowering it worsens the first. The model is wrong in **structure**, not in calibration, and the structural errors are the two things it assumes away: **gas enters, and metals leave.**

```checkpoint
q: The closed-box model's central result, Z = p ln(1/μ), is powerful because it predicts metallicity from
a: the age of the system and the rate at which stars have formed
x: Neither age nor star-formation rate appears in the expression — that is precisely its appeal. A system that consumed its gas quickly and one that took ten times as long reach the same metallicity at the same gas fraction.
a*: the gas fraction alone, given the yield — with no dependence on star-formation history, timescale, or geometry
a: the total mass of the system, which sets how much gas is available
x: Total mass cancels out; only the *fraction* of gas remaining enters. A dwarf galaxy and a giant one at the same gas fraction are predicted to have the same metallicity, which is itself an interesting prediction — and one that fails, as the mass–metallicity relation shows.
a: the number of supernovae that have occurred
x: Supernova count is implicitly folded into the yield and the amount of gas consumed, but it is not an independent input. The model's economy is that it needs only how far through its gas the system has worked.
hint: Look at what variables actually appear in the formula, and notice which obvious ones do not.
why: The expression contains only the yield and the gas fraction, so a system's metallicity depends solely on how far through its gas supply it has worked — independent of how fast it did so or in what order. That economy is why the closed box remains the standard starting point for chemical evolution despite being demonstrably wrong, and why its failures are so diagnostic: any discrepancy points to a violated assumption rather than to a mis-set parameter.
---
q: The closed-box model fails both by overpredicting metal-poor stars (the G-dwarf problem) and by overpredicting the present-day gas metallicity. That the two failures run in opposite directions is significant because it shows
a: the yield p has simply been measured incorrectly and needs recalibration
x: This is exactly what the two-sided failure rules out. Raising the yield worsens the present-day overprediction; lowering it worsens the G-dwarf discrepancy. No single value fixes both.
a*: the model is wrong in structure rather than in calibration — no choice of yield can repair both, so the assumptions themselves must be violated
a: the observations of metal-poor stars must be incomplete
x: Surveys for metal-poor stars are extensive and their selection functions well characterised; a factor-of-17 shortfall is far outside what incompleteness could produce. And it would not address the second failure at all.
a: metals must be destroyed by some process after they form
x: Nuclear processing inside stars can alter isotopic ratios, but metals are not destroyed in the interstellar medium. The resolution involves metals leaving the system and pristine gas entering, not disappearing.
hint: If one parameter could fix a model, both its errors would move the same way when you adjust it. What follows when they move oppositely?
why: A calibration error produces discrepancies that a single adjustment can fix; errors in opposite directions cannot be reconciled by any value of the parameter, so the failure is structural. The two assumptions being violated are exactly the two the model makes for convenience: that nothing enters (repaired by infall of unenriched gas) and that nothing leaves (repaired by metal-enriched outflows). Both are now standard ingredients in every chemical-evolution model.
```

## Two doors out of a star

Metals leave stars by two channels with sharply different properties, and the difference matters more than the total.

**The fast, hot channel: core-collapse supernovae.** Ejecta emerge at thousands of kilometres per second, shock-heated to millions of degrees. They are rich in alpha elements, they arrive within a few million years of star formation, and — critically — they are **hot and buoyant**. Supernova ejecta does not politely mix with the surrounding cold gas; it blows a bubble, sweeps up a shell, joins the hot phase described in the Gas Phases chapter, and rises. Clustered supernovae in an OB association merge their bubbles into a superbubble that can blow a chimney clear through the disk.

**The slow, cool channel: AGB winds and planetary nebulae.** As the Red Giants block described, low- and intermediate-mass stars return their envelopes gently — winds of 10–30 km/s, cool enough for dust to condense within them, delivered after gigayear delays. This material is rich in carbon, nitrogen, and s-process elements, and it is **easily retained**: too slow to escape, and it merges into the cold and warm phases rather than the hot one.

The consequence is a bias in the accounting that a naive ledger misses entirely. **The two channels have different escape probabilities.** Metals delivered hot, fast, and buoyant preferentially leave the galaxy; metals delivered cool and slow preferentially stay. Since the fast channel is the one producing alpha elements and iron-peak material, a galaxy losing gas loses **preferentially enriched** gas, and specifically loses the products of massive stars more readily than those of AGB stars.

This is why outflows are far more damaging to a galaxy's metal budget than to its mass budget. An outflow carrying one per cent of a galaxy's gas may carry ten per cent of its recently produced metals, because the outflow is launched from exactly where and when those metals are injected. Chemical evolution models therefore distinguish the **mass loading** of a wind from its **metal loading**, and the latter is generally the larger.

{{image: Supernova remnant | A supernova remnant: the fast, hot channel by which massive stars return their manufactured elements. Ejecta emerge at thousands of kilometres per second and are shock-heated to millions of degrees, joining the buoyant hot phase rather than mixing into cold gas — which is why this channel's products escape a galaxy far more readily than the slow, cool, dusty winds of AGB stars.}}

```checkpoint
q: Supernova ejecta and AGB winds both return metals to the interstellar medium, but a galaxy losing gas loses supernova products preferentially. The reason is that supernova ejecta is
a: produced in much larger quantities, so more of it is available to escape
x: Quantity is not the issue — the argument concerns what fraction of each channel's output escapes, not how much each produces. Even if both channels returned equal masses, the supernova share would escape more readily.
a*: fast, shock-heated to millions of degrees, and buoyant — so it joins the hot phase and rises out of the disk rather than mixing into cold gas
a: composed of heavier elements, which are more easily swept up by winds
x: Outflows entrain gas by momentum and buoyancy, not by sorting elements by atomic weight. The distinction between the channels is thermodynamic and kinematic, not chemical.
a: released closer to the disk's surface, where escape is easier
x: Massive stars form in the same midplane molecular clouds as everything else — in fact more tightly concentrated toward the plane than average, since they are young. Their ejecta escapes because of its state, not its starting altitude.
hint: What phase does each channel's material join, and which phase leaves the disk?
why: Supernova ejecta emerges at thousands of km/s and millions of kelvin, joining the buoyant hot phase that vents through chimneys and superbubbles; AGB winds emerge at 10–30 km/s, cool enough for dust to condense, and merge into the cold and warm phases that stay. Because outflows are launched from exactly where and when supernova metals are injected, a wind carries a larger share of a galaxy's metals than of its mass — so metal loading exceeds mass loading, and the escaping gas is alpha-enhanced relative to what remains.
---
q: A galaxy's outflow carries 1% of its gas but 10% of its recently produced metals. The most direct consequence for chemical-evolution modelling is that
a: the outflow can be neglected, since it removes so little mass
x: This is precisely the error the distinction warns against. An outflow negligible in the mass budget can be decisive in the metal budget, and metallicity is what such models predict.
a*: mass loading and metal loading must be treated as separate parameters, since assuming the wind has the galaxy's average composition would badly underestimate metal loss
a: the galaxy's total gas mass must have been mismeasured
x: There is no inconsistency requiring a measurement error. A wind can be enriched relative to its host simply because it is launched from the sites of recent enrichment.
a: metals must be produced ten times faster than the standard yield implies
x: Production is unchanged; the point concerns the composition of what leaves. Inflating the yield to compensate would break the model's agreement with stellar nucleosynthesis.
hint: If the wind were a fair sample of the galaxy's gas, the two loadings would be equal. What does it mean that they are not?
why: Treating a wind as a representative sample of the interstellar medium implicitly sets metal loading equal to mass loading, which understates metal loss by the enrichment factor of the outflow. Since metallicity is exactly what chemical-evolution models predict, that error propagates directly into their central output — which is why modern models carry the two loadings as distinct parameters and why measuring the composition of outflowing gas, not merely its mass, is an observational priority.
```

## Mixing is the hard part

A model that assumes instantaneous perfect mixing hides what is arguably the subject's central difficulty. Metals are injected at points — individual stars — into a medium the size of a galaxy. Whether the resulting composition is smooth or lumpy depends entirely on how mixing competes with injection, and the timescales are not comfortably separated.

**Local mixing is fast.** Turbulent motions at ~10 km/s cross 100 parsecs in about **10 million years**, so a supernova's ejecta blend into their immediate neighbourhood within roughly the lifetime of the association that produced them. Over a kiloparsec the same estimate gives **~100 Myr**.

**Radial mixing is slow.** Transporting metals across the disk — from 4 kpc to 12 kpc, say — requires either turbulent diffusion over eight kiloparsecs, which takes gigayears, or bulk transport by the fountain and by radial flows. This is why the disk retains a **radial abundance gradient** at all: if mixing were efficient on galactic scales, the gradient would have been erased long ago.

The observational tests of mixing efficiency are informative in both directions:

- **Open clusters are chemically homogeneous.** Stars within a cluster share abundances to high precision, which shows the gas from which they formed was well mixed on the scale of a single cloud before collapse.
- **The field shows real scatter.** Stars of the same age and present radius differ in metallicity by ~0.1–0.2 dex more than measurement error allows. Part of this is radial migration bringing stars from different birth radii, as the Disk chapter described. Part appears to be genuine **inhomogeneity** — the medium is not perfectly mixed even locally, and a cloud can form stars before a nearby supernova's products have been fully blended in.
- **Very metal-poor stars show large scatter in abundance ratios.** Early in the Galaxy's history, before many supernovae had contributed, each cloud's composition reflected a handful of individual events rather than a well-mixed average. The scatter in [element/Fe] among the most metal-poor stars is therefore not noise but signal — it is the fossil record of individual explosions, and it is what makes stellar archaeology of the first stars possible at all.

That last point is worth dwelling on. **Imperfect mixing is what makes early chemical history readable.** If the early medium had blended every supernova's output instantly, all metal-poor stars would show the same average abundance pattern and nothing could be inferred about individual events. The scatter is the information.

```checkpoint
q: Turbulent mixing blends metals across 100 pc in ~10 Myr but requires gigayears to mix across the disk radially. The most direct observable consequence is that
a: the interstellar medium is chemically identical everywhere in the Galaxy
x: This is what efficient large-scale mixing would produce, and it is contradicted by the observed radial gradient of about −0.06 dex/kpc, which amounts to a factor of five between the inner and outer disk.
a: metals are confined permanently to the clouds in which they were produced
x: Local mixing on ~10 Myr timescales is fast enough to blend ejecta into their surroundings well within a cloud's lifetime. Confinement to the birth cloud is ruled out by that alone.
a*: the disk retains a radial abundance gradient — efficient large-scale mixing would have erased it long ago
a: abundance ratios vary randomly from star to star with no spatial pattern
x: A clear spatial pattern exists in the form of the radial gradient. Star-to-star scatter is real and informative, but it sits on top of an ordered trend rather than replacing it.
hint: What would happen to any large-scale compositional difference if mixing across the disk were fast?
why: A gradient can only persist if metals are not transported radially faster than they are produced locally. Fast local mixing homogenises each region, while slow radial transport keeps the regions distinct — producing exactly the observed structure of a smooth trend with modest local scatter. If radial mixing were efficient the gradient would flatten within a gigayear, so its survival is itself a measurement of transport efficiency.
---
q: Among the most metal-poor halo stars, abundance ratios such as [Mg/Fe] show large star-to-star scatter. This scatter is
a: measurement noise, since such faint stars have poor-quality spectra
x: The scatter substantially exceeds measurement uncertainties in high-resolution studies of bright metal-poor stars, and it correlates with metallicity in the way an incomplete-mixing origin predicts.
a*: real signal — each star's birth gas was enriched by only a handful of supernovae, so its composition reflects individual events rather than a well-mixed average
a: evidence that these stars formed with unusual internal nucleosynthesis
x: Surface abundances of unevolved metal-poor stars reflect their birth gas, not their own nucleosynthesis, which is why they are used as archaeological samples in the first place.
a: caused by accretion of interstellar material onto the stars' surfaces over billions of years
x: Accretion onto stellar surfaces is negligible for these purposes, and would tend to homogenise compositions toward the interstellar mean rather than scatter them.
hint: If a cloud has been enriched by three supernovae rather than three thousand, how closely will its composition match the average yield?
why: With few contributors, a cloud's composition is a small sample of a distribution rather than its mean, so different clouds differ substantially. That makes the scatter a fossil record of individual explosions and their varying masses and yields — the basis of stellar archaeology of the first stars. Perfect early mixing would have averaged every supernova's output together and destroyed exactly the information that makes the first stellar generation reconstructable.
```

## The gradient, and what it records

The Milky Way's disk shows a **radial metallicity gradient** of about **−0.06 dex per kiloparsec**: over the span from 4 to 16 kpc, that is a change of −0.72 dex, or a **factor of five** in metal content between inner and outer disk. Similar gradients are found in most spiral galaxies.

Its origin is **inside-out formation**. The inner disk assembled earlier and has processed a larger fraction of its gas into stars, so it is further along the enrichment sequence; the outer disk formed later, has a higher gas fraction, and remains less enriched. In the closed-box language, the gradient is a gradient in $\mu$ — different radii sit at different points along the same $Z = p\ln(1/\mu)$ curve. Star-formation efficiency and gas surface density both decline outward, reinforcing the trend.

Three complications matter, and each has been established in an earlier chapter of this branch:

**Radial migration blurs it.** As the Disk chapter established, churning at spiral corotation resonances relocates stars by kiloparsecs without heating them. The gradient traced by *stars* is therefore flatter than the gradient the gas actually had when those stars formed — the stellar record is a migration-smeared version of the gas history. The gradient measured in gas (from H II regions and Cepheids) is the cleaner quantity.

**It flattens in the outer disk.** Beyond roughly 12–14 kpc the gradient becomes shallower, plausibly because radial gas flows redistribute material where surface densities are low, or because the outer disk was built partly from accreted material of relatively uniform composition.

**It evolves.** Chemical evolution models generally predict the gradient should steepen or flatten over time depending on how star formation and infall are distributed, and observations of gradients in galaxies at higher redshift are now beginning to test this directly.

```checkpoint
q: The Milky Way's radial abundance gradient of −0.06 dex/kpc is best explained in closed-box terms as a gradient in
a: the yield, since different regions form stars of different masses
x: Yields depend on stellar physics and the initial mass function, neither of which is known to vary systematically with galactocentric radius. Invoking a varying yield would be a much stronger claim than the data require.
a*: gas fraction — the inner disk formed earlier and has processed more of its gas into stars, so it sits further along the same enrichment curve
a: the age of the stars, since the inner disk contains older stars
x: The inner disk does contain older populations, but age alone does not set metallicity in the closed box; the controlling variable is how much of the gas has been consumed. Age matters only through its effect on that.
a: the strength of the gravitational field, which concentrates metals inward
x: Gravity does not sort gas by composition — metals are not concentrated inward by settling. The gradient reflects differing enrichment histories, not differential sedimentation.
hint: Only two variables appear in Z = p ln(1/μ). If the yield is the same everywhere, which one must vary with radius?
why: With a universal yield, the only remaining variable is the gas fraction, so radii differ in metallicity because they sit at different points along one enrichment curve. The inner disk assembled earlier and converted more of its gas, reaching low μ and high Z; the outer disk formed later and retains more gas. This is the signature of inside-out formation, reinforced by star-formation efficiency and gas surface density both declining outward.
---
q: The radial gradient measured from stars is systematically flatter than the gradient measured from gas tracers such as H II regions and Cepheids. The reason is that
a: stellar abundances are measured less accurately than nebular ones
x: Stellar abundances from high-resolution spectroscopy are typically more precise than nebular ones, which carry their own systematics from temperature and ionisation corrections. Precision is not the issue.
a*: radial migration relocates stars by kiloparsecs after they form, so the stellar record is a smeared version of the gradient the gas actually had
a: stars lose metals from their atmospheres over time through diffusion
x: Atomic diffusion produces small effects in stellar surface abundances, well below the level needed to flatten a gradient of this size, and it would not correlate with radius in the required way.
a: the gas gradient has steepened recently, so the two sample different epochs
x: Gradient evolution is real and under study, but the dominant cause of the difference is spatial rather than temporal — stars are no longer where they formed, whereas gas tracers report present conditions at their present location.
hint: Gas is where it is now. Are stars?
why: Gas tracers report the composition at the radius where they currently sit, but a star's composition reports its *birth* radius while its position reports where churning has since taken it. Since migration moves stars by kiloparsecs without heating them — the Disk chapter's mechanism — the stellar gradient is the birth gradient convolved with a spatial blurring kernel, hence flatter. This makes gas tracers the cleaner probe of the present gradient and makes stellar gradients useful only when migration is modelled explicitly.
```

## Leaky boxes, and why small galaxies are poor

The single most convincing evidence that metals escape galaxies comes from comparing galaxies of different masses, and the argument uses the closed box as a measuring instrument rather than as a model to be believed.

Modify the closed box to allow an outflow proportional to the star-formation rate, with **mass loading** $\eta$ — the ratio of outflow rate to star-formation rate. The result is that the system behaves exactly like a closed box, but with a reduced **effective yield**:

$p_{\text{eff}} = \dfrac{p}{1 + \eta}$

| Mass loading $\eta$ | $p_{\text{eff}}/p$ |
| --- | --- |
| 0 | 1.00 |
| 1 | 0.50 |
| 5 | 0.17 |
| 10 | 0.09 |

So measuring a galaxy's metallicity and gas fraction, and inverting the closed-box relation, returns not the true nucleosynthetic yield but the **effective** yield — and the shortfall measures how much has been lost.

Do this across galaxies and a clear pattern emerges: **effective yield falls systematically with decreasing galaxy mass.** Dwarf galaxies behave as though their stars manufactured far fewer metals than stellar physics says they must have. Since nucleosynthesis is not mass-dependent — a 20 $M_\odot$ star produces the same yield in a dwarf as in a giant — the deficit must be loss.

The underlying physics is the one the previous chapter established. Feedback momentum per unit stellar mass is roughly universal, but the **depth of the gravitational potential well is not**. A dwarf galaxy with an escape velocity of tens of km/s cannot retain gas that a Milky Way-mass galaxy at 300 km/s holds comfortably. Mass loading therefore rises steeply as galaxy mass falls, and metals — injected hot and fast, precisely into the outflow — are lost preferentially.

This explains the **mass–metallicity relation**: across four orders of magnitude in stellar mass, galaxy metallicity rises with mass, flattening at the high end where potential wells are deep enough to retain nearly everything. It is one of the tightest scaling relations in extragalactic astronomy, and it is fundamentally a statement about **retention rather than production**. Small galaxies are not bad at making metals. They are bad at keeping them.

The metals do not vanish. They are deposited into the circumgalactic and intergalactic medium, and observations of absorption lines toward background quasars find that the gas around galaxies contains a **comparable mass of metals to the galaxies themselves**. Roughly half the metals ever produced are outside the galaxies that made them.

```checkpoint
q: A dwarf galaxy's effective yield, inferred by inverting the closed-box relation from its measured metallicity and gas fraction, is far below the yield expected from stellar nucleosynthesis. The standard interpretation is that
a: massive stars in dwarf galaxies produce fewer metals because of their low metallicity
x: Yields do depend somewhat on metallicity, but nowhere near enough to explain the observed deficits, and the effect runs in complicated directions. A 20 M☉ star's alpha-element yield is broadly similar regardless of its birth composition.
a*: metals have been lost in outflows — the shortfall measures mass loading, since p_eff = p/(1+η)
a: dwarf galaxies formed their stars too recently for enrichment to have occurred
x: Many dwarfs have ancient stellar populations and have been forming stars for gigayears, so insufficient time cannot explain the deficit. The metals were made; they are not there.
a: the initial mass function in dwarfs contains fewer massive stars
x: A varying IMF has been proposed but is not established, and invoking it is unnecessary here since a mechanism with independent evidence — outflows, observed directly in absorption and emission — accounts for the effect.
hint: Nucleosynthesis does not know what galaxy it is in. If production is normal but the metals are absent, where did they go?
why: Since stellar yields cannot depend strongly on host galaxy mass, a low effective yield means metals produced but not retained, and the leaky-box relation converts the shortfall directly into a mass loading. Dwarf galaxies have shallow potential wells and low escape velocities, so the same feedback momentum per unit stellar mass ejects far more of their gas — and preferentially the hot, fast, metal-rich ejecta. Absorption-line studies confirm the destination: the gas around galaxies holds a comparable mass of metals to the galaxies themselves.
---
q: The galaxy mass–metallicity relation — metallicity rising with stellar mass across four decades — is best described as a statement about
a: how efficiently galaxies of different masses manufacture heavy elements
x: Manufacture is set by stellar nucleosynthesis and the initial mass function, neither of which varies with galaxy mass in a way that could produce the observed trend. Production is not the variable.
a*: retention rather than production — massive galaxies keep the metals they make, while shallow potential wells let small galaxies lose theirs
a: the ages of galaxies, since more massive galaxies formed earlier
x: Formation epoch does correlate with mass, but the relation persists among galaxies matched in age and in gas fraction, and the effective-yield analysis isolates loss specifically.
a: differences in the initial mass function between galaxies of different sizes
x: A systematically varying IMF would be a profound result and is not established; invoking it is unnecessary when outflows are directly observed and quantitatively sufficient.
hint: Ask which of the two — making metals or holding on to them — could plausibly depend on a galaxy's mass.
why: Nucleosynthetic yields are properties of stars, not of their hosts, so the mass dependence must enter through retention. Escape velocity scales with galaxy mass while feedback momentum per unit stellar mass does not, so mass loading rises steeply toward low masses and the hot metal-rich ejecta escape preferentially. The relation is therefore a gravitational statement dressed in chemical units — which is why its scatter correlates with star-formation rate, another quantity that governs how hard the outflows are driven.
```

## Dust complicates the ledger

One further complication runs through everything above, and it connects this chapter to the block's second.

A substantial share of the interstellar medium's metals is not in the gas at all but **locked into dust grains**. As the Dust chapter established, iron is depleted from the gas phase by factors up to a thousand, silicon and magnesium by tens to hundreds. Any measurement of interstellar abundances from gas-phase absorption lines is therefore measuring only part of the inventory, and the missing part varies with environment — heaviest depletion in dense clouds, lightest in hot shocked gas.

This cuts three ways.

**It is a systematic to be corrected.** Gas-phase abundances must be corrected for depletion before being compared with stellar abundances or with model predictions, and the correction is large for refractory elements and uncertain in dense regions.

**It changes what escapes.** Metals in grains behave differently from metals in gas: grains are coupled to the gas by collisions but can drift relative to it, and they are destroyed in the same shocks that drive outflows. Whether a galaxy's outflow carries metals as gas or as dust affects both what is observable and what survives the journey.

**It is a tracer.** Because the dust-to-metals ratio is roughly constant, far-infrared dust emission measures the total metal content of a system — including the fraction hidden from gas-phase spectroscopy. Dust maps of galaxies are, in effect, metal maps.

{{image: Cat's Eye Nebula | A planetary nebula: the slow, cool channel by which low- and intermediate-mass stars return their processed envelopes. This material leaves at 10–30 km/s, cool enough for dust to condense within it, and rich in carbon, nitrogen and s-process elements — and unlike supernova ejecta it is easily retained, merging into the cold and warm phases rather than the buoyant hot one that vents out of the disk.}}

```checkpoint
q: Gas-phase absorption measurements find interstellar iron at 1% of its cosmic abundance. Comparing this figure directly with a star's measured [Fe/H] would be a mistake because
a: stellar abundances are measured on a different scale that cannot be converted
x: Both are expressed relative to solar abundances and are directly comparable in principle. The difficulty is not one of units or scales but of what each measurement physically includes.
a*: the star's value reflects the total iron of its birth gas, including what was in grains, whereas the gas-phase measurement sees only the 1% that remains uncondensed
a: iron in stars is destroyed by nuclear burning over the star's lifetime
x: Surface iron in an unevolved star is unchanged from birth — which is exactly what makes stellar abundances useful as archaeological records. Burning affects the core, not the observable surface.
a: interstellar iron is in a different isotopic form from stellar iron
x: Isotopic composition is not what these measurements report; both give elemental abundances. Depletion into solids, not isotopy, is the discrepancy's source.
hint: When a cloud collapses into a star, do the dust grains stay behind?
why: Grains are incorporated along with the gas and vaporised, so a star's composition records the total inventory of its birth cloud; gas-phase spectroscopy of the interstellar medium sees only the fraction that has not condensed. For a refractory element such as iron that is 1% of the total, so the comparison would understate interstellar iron by two orders of magnitude — and the size of the correction varies with environment, being largest in dense clouds. Far-infrared dust emission recovers the hidden fraction, on the assumption of a roughly constant dust-to-metals ratio.
---
q: Far-infrared dust emission can be used as a measure of a galaxy's total metal content because
a: dust grains are made only of the heaviest elements, which dominate the metal budget
x: Grains are built largely from carbon, oxygen, silicon, magnesium and iron — abundant intermediate-mass elements, not the heaviest ones. Their value as a tracer comes from constancy of proportion, not from composition.
a*: the dust-to-metals ratio is roughly constant, so the emitting dust mass scales with the total metal inventory including the part hidden from gas-phase spectroscopy
a: dust emission is unaffected by the grains' temperature, making it a clean mass measurement
x: The emission depends steeply on temperature — roughly as T to the fourth power or higher — which is in fact the method's principal systematic, as the Dust chapter noted. Its usefulness survives that limitation rather than avoiding it.
a: dust is the only place metals can be found in a galaxy
x: Metals reside both in grains and in the gas phase, in proportions that vary strongly with environment. It is precisely because the split varies that a tracer of the total is valuable.
hint: Gas-phase spectroscopy misses whatever is condensed. What would let you measure the condensed part directly, and what proportionality would you need to assume?
why: Because grains form from metals in a roughly fixed proportion, the dust mass inferred from far-infrared emission scales with the total metal content — including the refractory fraction invisible to gas-phase absorption. Dust maps of galaxies therefore function as metal maps. The assumption weakens at low metallicity, where grain growth is less efficient and the dust-to-metals ratio falls, so the method requires care in exactly the metal-poor systems where the mass–metallicity relation is most interesting.
```

## Pulling the thread

- Chemical enrichment is distinct from nucleosynthesis: not where elements are made, but how they are **delivered, mixed, transported, and lost**. The governing physics is fluid mechanics and bookkeeping rather than nuclear reactions.
- The **closed box** gives $Z = p\ln(1/\mu)$ — metallicity from gas fraction alone, independent of history. It fails in **two opposite directions** (too many metal-poor stars; too much present-day metal), which proves the error is **structural**: gas enters, and metals leave.
- Metals exit stars by **two channels with different escape probabilities**: fast, hot, buoyant supernova ejecta that joins the hot phase and preferentially escapes, and slow, cool, dusty AGB winds that are retained. Outflows are therefore **metal-loaded** beyond their mass loading.
- **Mixing is the hard part**: ~10 Myr across 100 pc, but gigayears radially — which is why the disk **retains a gradient** at all. Open clusters are homogeneous; the field shows genuine scatter; and among very metal-poor stars, **imperfect mixing is what makes early history readable**, since the scatter is the fossil record of individual supernovae.
- The **radial gradient** (−0.06 dex/kpc, a factor of five across the disk) records **inside-out formation** — different radii at different points on the same enrichment curve — blurred in the stellar record by **radial migration**.
- **Leaky boxes** give $p_{\text{eff}} = p/(1+\eta)$, so measuring effective yield measures loss. Effective yield **falls with galaxy mass**, and the **mass–metallicity relation** is consequently a statement about **retention, not production**: small galaxies make metals normally and cannot hold them. Roughly half of all metals ever made now sit **outside** the galaxies that made them.
- **Dust holds much of the metal inventory**, which is simultaneously a systematic to correct, a factor in what escapes, and — via the roughly constant dust-to-metals ratio — a tracer of total metal content.

The transferable idea: **a system's composition records its boundary conditions more than its internal processes.** The metallicity of a galaxy is set far less by how well its stars manufacture elements — which is nearly universal — than by what flows in and what flows out. Two galaxies with identical stellar physics can differ tenfold in metallicity purely through their gravitational ability to retain what they made. The general lesson is that when a quantity varies across systems whose internal machinery is known to be the same, the explanation must lie at the boundary rather than inside — which is why the mass–metallicity relation is really a plot of escape velocity, why soil chemistry reflects drainage more than parent rock, and why a company's cash position says more about its flows than its margins. Look at the doors before examining the machinery.

## Further reading

{{book: Bernard Pagel | Nucleosynthesis and Chemical Evolution of Galaxies | 2009}}

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Francesca Matteucci | The Chemical Evolution of the Galaxy | 2001}}

Beyond the books: Searle and Sargent's 1972 paper introducing the effective-yield argument is a compact demonstration of using a model one disbelieves as a measuring instrument; Tremonti et al.'s 2004 establishment of the mass–metallicity relation from tens of thousands of galaxy spectra is worth examining for the tightness of the trend; and quasar-absorption studies of the circumgalactic medium document where the missing half of the universe's metals actually resides.

## Problems

*Useful numbers: closed box Z = p ln(1/μ); leaky box p_eff = p/(1+η); Z☉ ≈ 0.014; return fraction R ≈ 0.35; typical disk gradient −0.06 dex/kpc; turbulent velocity ~10 km/s; 1 pc = 3.086 × 10¹⁶ m; 1 yr = 3.156 × 10⁷ s.*

**1.** *(The closed box, evaluated.)* Take p = 0.014. Compute the predicted metallicity, in solar units, for gas fractions of **(a)** 0.9, **(b)** 0.5, **(c)** 0.2, **(d)** 0.1. **(e)** The solar neighbourhood's gas fraction is ~0.1–0.2 and its metallicity is solar. Comment.

**2.** *(Two failures, one conclusion.)* **(a)** State the G-dwarf problem's direction of failure. **(b)** State the direction of the present-day metallicity failure. **(c)** Explain why adjusting p cannot fix both, and name the two structural assumptions that must be abandoned.

**3.** *(The gradient.)* With a gradient of −0.06 dex/kpc: **(a)** compute the total change in [Fe/H] between 4 and 16 kpc. **(b)** Convert to a ratio of metal content. **(c)** Explain in closed-box terms what physical difference between inner and outer disk produces this.

**4.** *(Mixing timescales.)* At a turbulent velocity of 10 km/s: **(a)** compute the mixing time across 100 pc and across 1 kpc. **(b)** Estimate the time to mix radially across 8 kpc by the same process. **(c)** Use your answers to explain why a radial gradient survives while individual clouds are chemically homogeneous.

**5.** *(Effective yield as a measurement.)* A dwarf galaxy has μ = 0.5 and Z = 0.1 Z☉. **(a)** Compute its effective yield. **(b)** Taking the true yield as 0.014, compute the implied mass loading η. **(c)** Comment on what escape velocity this suggests relative to the Milky Way's.

**6.** *(Which metals escape.)* **(a)** Contrast the supernova and AGB return channels in terms of velocity, temperature, and buoyancy. **(b)** Explain why this makes outflow metal loading exceed mass loading. **(c)** Predict how the [α/Fe] ratio of outflowing gas should compare with that of the galaxy's interstellar medium, and why.

**7.** *(Scatter as signal.)* **(a)** Explain why very metal-poor stars show large scatter in [Mg/Fe] while solar-metallicity stars do not. **(b)** Explain why this scatter is essential to stellar archaeology. **(c)** State what perfect early mixing would have destroyed.

**8.** *(Dust in the ledger.)* A sightline shows gas-phase iron at 1% of the cosmic value. **(a)** What fraction of the iron is in grains? **(b)** Explain why comparing this gas-phase abundance directly with a stellar [Fe/H] would be a mistake. **(c)** State how far-infrared dust emission helps, and what assumption it relies on.

**9.** *(Assembling the argument.)* Two galaxies have identical stellar masses, ages, and gas fractions, but one has half the metallicity of the other. **(a)** Rule out two explanations and justify. **(b)** State the most likely explanation and the quantity that differs. **(c)** Name two independent observations that would test it.

## Worked answers

**1.** $Z = 0.014\ln(1/\mu)$, expressed in solar units by dividing by 0.014 — so $Z/Z_\odot = \ln(1/\mu)$ directly. **(a)** $\ln(1.11) = \mathbf{0.11\ Z_\odot}$. **(b)** $\ln 2 = \mathbf{0.69\ Z_\odot}$. **(c)** $\ln 5 = \mathbf{1.61\ Z_\odot}$. **(d)** $\ln 10 = \mathbf{2.30\ Z_\odot}$. **(e)** At the observed gas fraction the closed box predicts **1.6–2.3 times solar**, against the observed solar value — an overprediction of roughly a factor of two. The system has consumed enough of its gas that a closed box would by now be substantially metal-rich, so something must be diluting the reservoir or removing metals from it.

**2.** **(a)** The closed box predicts **too many** metal-poor stars — ~35% below a quarter solar against ~2% observed. **(b)** It predicts **too much** metal in the present-day gas, by about a factor of two. **(c)** Raising $p$ makes stars enrich faster and so *reduces* the metal-poor fraction (helping the first) while raising present-day metallicity further (worsening the second); lowering $p$ does the reverse. No single value satisfies both, so the model is structurally wrong. The assumptions to abandon are that **nothing enters** — repaired by infall of relatively unenriched gas, which dilutes the reservoir and suppresses the metal-poor tail — and that **nothing leaves** — repaired by metal-enriched outflows, which lower present-day metallicity.

**3.** **(a)** $-0.06 \times 12 = \mathbf{-0.72\ dex}$. **(b)** $10^{-0.72} = 0.19$, so the outer disk has about **a fifth** the metal content of the inner disk. **(c)** In closed-box terms the two radii sit at different points on the same curve because they have different **gas fractions**: the inner disk formed earlier and has processed more of its gas into stars, reaching a low $\mu$ and hence high $Z$, while the outer disk formed later, retains a higher gas fraction, and remains less enriched. Declining star-formation efficiency and gas surface density outward reinforce the same trend — the signature of **inside-out** disk formation.

**4.** **(a)** $t = L/v$: across 100 pc, $3.086\times10^{18}/10^{4} = 3.1\times10^{14}$ s $= \mathbf{9.8\ Myr}$; across 1 kpc, **98 Myr**. **(b)** Turbulent transport is diffusive rather than ballistic, so crossing 8 kpc takes far longer than eight times the 1 kpc figure — of order gigayears for realistic diffusion coefficients. **(c)** Fast local mixing homogenises a molecular cloud well within its lifetime, so the stars forming from it share a composition — hence chemically homogeneous open clusters. Slow radial transport means metals produced at 4 kpc do not reach 12 kpc before being incorporated into stars there, so large-scale differences persist and the gradient survives. The gradient's very existence is thus a measurement that radial mixing is inefficient.

**5.** **(a)** $p_{\text{eff}} = Z/\ln(1/\mu) = 0.1 \times 0.014/\ln 2 = 0.0014/0.693 = \mathbf{0.0020}$. **(b)** $1 + \eta = p/p_{\text{eff}} = 0.014/0.0020 = 7.0$, so $\eta = \mathbf{6}$ — the galaxy expels about six times as much gas as it turns into stars. **(c)** Mass loading that high requires an escape velocity low enough that feedback-driven material is not retained; for the Milky Way, with $v_{\text{esc}} \approx 300$ km/s at the Sun's radius, $\eta$ is of order unity or less. The dwarf's potential well must be shallower by roughly an order of magnitude in escape velocity, consistent with a stellar mass some three to four orders of magnitude below the Milky Way's.

**6.** **(a)** Supernova ejecta emerge at **thousands of km/s**, shock-heated to **millions of kelvin**, and are strongly **buoyant**, joining the hot phase and rising out of the disk; AGB winds emerge at **10–30 km/s**, cool enough for **dust to condense**, and merge into the cold and warm phases without escaping. **(b)** Outflows are launched from precisely the sites and epochs where supernova metals are injected, so the escaping gas is enriched relative to the galaxy's average — the wind carries a larger share of the metals than of the mass. **(c)** Outflowing gas should be **alpha-enhanced** relative to the interstellar medium, because the fast channel is the core-collapse channel that produces alpha elements promptly, while AGB products (carbon, nitrogen, s-process) are delivered slowly into gas that stays behind.

**7.** **(a)** A very metal-poor star's birth gas was enriched by a **handful** of supernovae, so its composition is a small sample of the yield distribution rather than its mean, and different clouds sampled different explosions; by solar metallicity, thousands of events have contributed and the composition is the well-mixed average. **(b)** The scatter carries the information: each metal-poor star's abundance pattern approximates the yield of one or a few individual early supernovae, allowing their masses and explosion energies to be inferred. **(c)** Perfect early mixing would have averaged every event's output together, so all metal-poor stars would show the same pattern and nothing could be recovered about individual explosions. The **imperfection of mixing is the archive**, and without it the first stellar generation would be unreconstructable.

**8.** **(a)** **99%** of the iron is condensed into grains. **(b)** A stellar [Fe/H] measures the **total** iron of the gas the star formed from, since the grains were incorporated along with the gas and vaporised; a gas-phase absorption measurement sees only the 1% that remains uncondensed. Comparing them directly would understate the interstellar iron abundance by two orders of magnitude, and the size of the error varies with environment, being largest in dense clouds. **(c)** Far-infrared emission traces the **dust mass** and therefore the metals hidden from gas-phase spectroscopy, allowing a total inventory. It relies on the assumption that the **dust-to-metals ratio is roughly constant**, which holds reasonably well at moderate metallicities but degrades at low metallicity, where grain growth is less efficient.

**9.** **(a)** **Different nucleosynthetic yields** can be ruled out, since yields are properties of stars and both galaxies have the same stellar masses and ages, hence comparable stellar populations. **Different ages or evolutionary stages** can be ruled out by construction, since ages and gas fractions are matched — which fixes their positions on the closed-box curve. **(b)** The most likely explanation is **differential metal loss**: the metal-poorer galaxy has a higher mass loading, so its effective yield is lower. The quantity that differs is the depth of the gravitational potential well — most directly, the **escape velocity**, which need not track stellar mass exactly since it depends on the dark-matter halo and the concentration of the mass distribution. **(c)** First, **direct outflow detection**: blueshifted interstellar absorption against the galaxy's own continuum measures outflow velocity and column, yielding the mass loading. Second, **circumgalactic absorption** toward background quasars, which should show a larger metal reservoir surrounding the metal-poorer galaxy if its metals were expelled rather than never made. A third check would be comparing dynamical masses, since a shallower potential at fixed stellar mass would show up directly in rotation or dispersion measurements.$mwChemEnrich_master$,
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
