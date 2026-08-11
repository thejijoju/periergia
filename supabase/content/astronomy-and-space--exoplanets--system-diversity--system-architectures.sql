-- Astronomy & Space · Exoplanets — System Diversity — "System Architectures".
-- Curated master for
-- astronomy-and-space/exoplanets/system-diversity/system-architectures
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Organised around the shift from studying planets to studying systems,
-- and around the consequence that the Solar System stops being the
-- template and becomes a data point requiring explanation. Architecture
-- - number, spacing, mass ordering, eccentricity, mutual inclination,
-- resonance - is the level at which formation theory is actually tested,
-- because a mechanism that produces the right planet in isolation still
-- has to produce the right arrangement. Quantitative throughout: spacing
-- in mutual Hill radii against the stability boundary, the resonant
-- chain of TRAPPIST-1 with its actual period ratios, and the Kepler
-- dichotomy stated as the inference problem it is rather than as a
-- discovery.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: TRAPPIST-1 adjacent period ratios
-- 1.603, 1.672, 1.506, 1.509, 1.342, 1.519, matching 8:5, 5:3, 3:2,
-- 3:2, 4:3 and 3:2; mutual Hill spacing Delta = (a2-a1)/R_H,mut giving
-- 12.1 for two 5-Earth-mass planets at 0.10 and 0.13 AU, 18.6 at 0.10
-- and 0.15 AU, 26.4 for Venus and Earth and 8.0 for Jupiter and
-- Saturn; the two-planet stability boundary 2 sqrt(3) = 3.46.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/system-diversity/system-architectures',
    'research',
    'advanced',
    'read',
    $exArch_master$> A theory of planet formation that produces the right kind of planet has done a small part of the job. **The test is whether it produces the right arrangement** — how many planets, at what spacings, with what masses in what order, on orbits how eccentric and how mutually inclined, and how often locked into resonance.

That level of test only became available recently, and it became available because of a structural property of the transit method: **once a coplanar system is aligned, every planet in it transits.** Multiplicity is measured rather than inferred, so transit surveys deliver systems where radial velocity surveys deliver planets one at a time.

The result reorganised the subject. **The Solar System is no longer the template against which others are compared; it is one data point, and an atypical one.** Our inner region is empty where most systems are full, our giants are far out where many are close in, and our planets are widely spaced where most are packed. Explaining our own architecture is now a specific problem rather than the general one.

## 1. What architecture means

Six quantities, each carrying different information about a system's history.

**Multiplicity** — how many planets. Sensitive to how much material was available and how much survived dynamical rearrangement.

**Spacing** — measured not in AU but in units of the **mutual Hill radius**, since that is the scale on which gravitational interaction operates:

$$R_{H,\rm mut} = \left(\frac{m_1+m_2}{3M_\star}\right)^{1/3}\frac{a_1+a_2}{2}, \qquad \Delta = \frac{a_2-a_1}{R_{H,\rm mut}}.$$

**Mass ordering** — whether masses rise outward, fall outward, or are uniform.

**Eccentricity** — a dynamical temperature. Discs damp eccentricity, so any excess was excited afterwards.

**Mutual inclination** — the same, in the perpendicular direction, and harder to measure.

**Resonance** — period ratios at exact commensurabilities, which require convergent migration to establish and quiet conditions to preserve.

## 2. Spacing and the stability boundary

Two planets on circular orbits are guaranteed stable indefinitely if $\Delta > 2\sqrt3 = 3.46$; below that their Hill spheres can overlap and close encounters are possible. For systems of three or more the requirement is empirical rather than analytic, and simulations indicate stability over stellar lifetimes needs roughly $\Delta \gtrsim 10$.

Where do real systems sit?

| Pair | $\Delta$ |
|---|---|
| Jupiter–Saturn | $8.0$ |
| Two $5\,M_\oplus$ planets at $0.10$ and $0.13$ AU | $12.1$ |
| Two $5\,M_\oplus$ planets at $0.10$ and $0.15$ AU | $18.6$ |
| Venus–Earth | $26.4$ |

**Observed compact multiples cluster around $\Delta \approx 10$–$30$**, which is close above the stability threshold and not far above it. This is a meaningful result rather than a coincidence: **it means systems are dynamically full.**

The interpretation is that formation produced systems packed more tightly than this, that the over-packed ones went unstable and lost planets through collisions or ejections, and that what survives is what could survive. The distribution of spacings is therefore a record of a filtering process, not of a formation preference — and it predicts that adding another planet to a typical observed system would destabilise it, which simulations confirm.

**The Solar System is not dynamically full in the same way.** Venus and Earth at $\Delta = 26$ are comfortably spaced, and there is room between the terrestrial planets for additional bodies that are not there. Jupiter and Saturn at $\Delta = 8$ are the tightest pair, which is one reason their dynamical history dominates accounts of the Solar System's rearrangement.

## 3. Resonances and what they record

A **mean-motion resonance** is a period ratio at a simple integer commensurability, where repeated conjunctions occur at the same orbital phase and gravitational perturbations accumulate coherently rather than averaging out.

Resonances are not accidental. **Capture requires convergent migration**: two planets must approach each other slowly through a gas disc, and as the period ratio drifts toward a commensurability the resonant interaction can lock them together. A system that formed in place and never migrated has no mechanism for arriving at resonance.

### 3.1 The clearest example

TRAPPIST-1's seven planets form a **resonant chain**. Adjacent period ratios:

| Pair | Ratio | Nearest commensurability |
|---|---|---|
| b–c | $1.603$ | $8{:}5$ |
| c–d | $1.672$ | $5{:}3$ |
| d–e | $1.506$ | $3{:}2$ |
| e–f | $1.509$ | $3{:}2$ |
| f–g | $1.342$ | $4{:}3$ |
| g–h | $1.519$ | $3{:}2$ |

Every adjacent pair sits within a per cent or so of a first- or second-order commensurability. **The probability of that happening by chance is negligible**, so the chain is a direct record of the system's assembly: the planets migrated inward through the disc, encountered resonances in turn, and were captured into a linked configuration that has survived since.

That survival is itself informative. **Resonant chains are fragile** — a modest dynamical disturbance breaks them — so an intact chain certifies that nothing significant has happened to the system since the gas dispersed. TRAPPIST-1 has been quiet for billions of years.

### 3.2 The near-resonant population

Resonant chains are rare. The far commoner pattern, discussed in the previous chapter, is period ratios clustering **just wide** of first-order commensurabilities, with a deficit exactly at resonance.

Two readings compete, and both accept that migration happened. Either pairs were captured into resonance and subsequently drifted slightly apart — through tidal dissipation raising the inner planet's period, or through scattering of residual planetesimals — or capture is imperfect at the migration rates involved and pairs settle just outside.

**Either way the clustering is evidence of migration**, since a system that never migrated has no reason to know about commensurabilities at all.

```checkpoint
q: Observed compact multi-planet systems have spacings clustering at $\Delta \approx 10$–$30$ mutual Hill radii, close above the stability boundary. What does this indicate?
a: That formation naturally produces this spacing, which is therefore a preferred configuration
x: Nothing in the accretion process selects a spacing measured in Hill radii; the distribution is more economically read as a survival filter.
a*: That systems are dynamically full — formation produced tighter packing, the over-packed systems went unstable and lost planets, and what remains is what could survive
a: That the planets are still migrating and will eventually spread further apart
x: Migration requires gas, which dispersed long ago in these gigayear-old systems.
a: That the stability criterion is wrong, since real systems sit close to it
x: Sitting just above a threshold is what a filtered population looks like; it corroborates the criterion rather than undermining it.
hint: Ask what happens to a system formed more tightly packed than the stability limit, and what would be left to observe.
why: Two circular orbits are guaranteed stable if $\\Delta > 2\\sqrt3 = 3.46$, and simulations show that systems of three or more need roughly $\\Delta \\gtrsim 10$ to survive for stellar lifetimes. Real compact multiples sit at $10$–$30$: **above the limit, but not far above it.** A population sitting just inside an allowed region is the signature of a filter rather than a preference. The reading is that formation packed planets more tightly than this, that over-packed systems suffered close encounters leading to collisions and ejections, and that the survivors are those whose spacings happened to permit survival. The prediction — that inserting an additional planet into a typical observed system would destabilise it — is confirmed by simulation, which is what makes the interpretation more than a story. Note that **the Solar System is not full in this sense**: Venus and Earth sit at $\\Delta = 26.4$ with room between the terrestrial planets for bodies that are not there, while Jupiter and Saturn at $\\Delta = 8.0$ are the tightest pair, which is why their dynamical history dominates accounts of how our system rearranged itself.
---
q: TRAPPIST-1's seven planets have adjacent period ratios of $1.603$, $1.672$, $1.506$, $1.509$, $1.342$ and $1.519$. What does this configuration establish?
a: That the planets formed at these locations, since resonance is the natural spacing for in-situ formation
x: In-situ formation offers no mechanism for arriving at commensurabilities; resonant capture requires convergent migration through gas.
a*: That the planets migrated inward and were captured into resonance in turn, and that nothing has significantly disturbed the system since — chains are fragile
a: That the system is unstable and will rearrange itself in the near future
x: Resonant chains are dynamically protected while intact, and this one has evidently persisted for billions of years.
a: That the period measurements are correlated by an analysis systematic
x: The periods derive from many independent transits of each planet and are among the most precisely measured quantities in the field.
hint: Ask what physical process places two planets at a simple integer period ratio, and what would happen to such a configuration if the system were later disturbed.
why: Each ratio sits within about a per cent of a first- or second-order commensurability — $8{:}5$, $5{:}3$, $3{:}2$, $3{:}2$, $4{:}3$, $3{:}2$ — and the chance of six independent ratios landing there is negligible. Capture into resonance requires **convergent migration**: planets must approach one another slowly through a gas disc so that the drifting period ratio can be locked by the resonant interaction. A system assembled in place has no such mechanism. So the chain is a direct record of inward migration through the natal disc, with each pair captured in turn. Its survival carries a second message: resonant chains are **fragile**, broken by modest dynamical disturbance — a passing star, an instability among the planets, a scattering event — so an intact chain certifies that nothing significant has happened to the system since the gas dispersed. The rarity of intact chains against the commonness of *near*-resonant pairs then suggests that most systems did form chains and most subsequently broke them, which is itself a constraint on how often late instabilities occur.
```

## 4. The multiplicity problem

Kepler found many systems with a single transiting planet and many with several, and the ratio between them is not what a single population of coplanar systems predicts.

**The geometry.** In a perfectly coplanar system, if one planet transits, the others very likely do too — so a coplanar population produces mostly multi-transiting systems. Observed singles outnumber that prediction substantially. This excess is the **Kepler dichotomy**.

**Two readings**, and the difference matters.

*A range of mutual inclinations.* If systems have a distribution of mutual inclinations, then in a system with a few degrees of mutual tilt only some planets transit, and singles arise naturally from multi-planet systems viewed unfavourably. The observed statistics then measure the inclination distribution.

*A genuinely distinct population.* Some systems really do contain one close-in planet and nothing else, perhaps because a dynamical instability removed the rest, or because they never formed more.

**The evidence favours a mixture**, and separating them requires information beyond transit counts: transit durations constrain impact parameters and hence relative inclinations, radial velocity follow-up reveals non-transiting companions, and transit timing variations detect perturbers that do not transit.

**Why this matters more than it sounds.** The multiplicity distribution is the primary constraint on how violent planetary system evolution typically is. If singles are mostly the survivors of instabilities, then most systems undergo a phase of dynamical rearrangement; if they are mostly viewing-geometry effects, then most systems are quiet and coplanar. **These are different histories for planetary systems generally**, and the question turns on a statistical inference from incomplete counts rather than on any single observation.

## 5. The Solar System as a data point

Placing our own system in the observed distributions makes its peculiarities specific.

**No planets inside Mercury.** The commonest architecture known packs several planets inside $0.4$ AU. We have nothing inside $0.39$ AU. **This is the single most conspicuous difference**, and it needs explaining rather than assuming.

**No super-Earths at all.** The dominant planet class by number is absent here.

**Giants far out and nearly circular.** Jupiter at $5.2$ AU with $e = 0.048$ is unlike the eccentric and often close-in giants that radial velocity surveys find, though selection effects inflate that contrast.

**Wide spacing.** Terrestrial planets at $\Delta \approx 26$ are not dynamically full.

**A low-mass Mars and an empty asteroid belt**, both of which suggest the inner disc was truncated or depleted.

The leading explanations tie these together through Jupiter. In the **Grand Tack** scenario Jupiter migrated inward to about $1.5$ AU, truncating the inner disc and depriving Mars of material, before Saturn's migration reversed both planets outward. In the **Nice model** the giants underwent a later instability that rearranged their orbits and scattered small bodies throughout the system. Both are constructions designed to reproduce features we observe rather than predictions made in advance, which is a legitimate but weaker epistemic status and should be stated as such.

**A third possibility deserves mention:** that Jupiter's early formation and outward position prevented inward drift of solids that would otherwise have built super-Earths here. This would make the Solar System's emptiness a consequence of having a giant planet where it is, and it is testable in principle — systems with cold Jupiters should less often have inner super-Earths. **The observational test is under way and the current answer is unclear**, with some analyses finding the correlation and others finding the opposite.

{{image: Kepler-11 | A compact multi-planet system in which six planets orbit within a region smaller than the orbit of Venus, on nearly circular and nearly coplanar paths. Architectures of this kind are the commonest known and have no Solar System analogue, since our own inner region is empty by comparison. Their spacings, measured in mutual Hill radii, cluster just above the threshold for long-term dynamical stability, which suggests that formation packed planets more tightly still and that the systems observed today are those whose configurations happened to permit survival.}}

```checkpoint
q: Kepler found more single-transiting systems than a population of coplanar multi-planet systems predicts. What does this establish?
a: That most planetary systems contain exactly one planet
x: That is one of two competing readings, and the evidence does not support it exclusively.
a*: Nothing on its own — the excess is consistent both with a distribution of mutual inclinations and with a genuinely distinct single-planet population, and the two imply different histories
a: That transit surveys systematically miss planets in multi-planet systems
x: Detection efficiency is well characterised and is not the source of the discrepancy.
a: That the coplanar assumption is wrong and systems are randomly oriented
x: Randomly oriented systems would produce far fewer multi-transiting systems than are observed; mutual inclinations are small, just not zero.
hint: Ask what would happen to the transit count in a system with a few degrees of mutual inclination.
why: In a perfectly coplanar system, an alignment that lets one planet transit generally lets the others transit too, so such a population yields mostly multi-transiting systems. Observed singles exceed that prediction — the **Kepler dichotomy** — and there are two economical explanations. If systems have a spread of mutual inclinations of a few degrees, then in many systems only a subset of planets crosses the stellar disc from our viewpoint, and singles arise from multiples viewed unfavourably; on this reading the statistics measure the inclination distribution. Alternatively some systems genuinely contain one close-in planet and nothing else, perhaps because an instability removed the others. **These imply different histories for planetary systems in general** — quiet and coplanar in one case, commonly violent in the other — so the question is not bookkeeping. Separating them needs information beyond transit counts: transit durations constrain impact parameters and hence relative inclinations, radial velocity reveals non-transiting companions, and transit timing variations detect perturbers that never transit. The evidence favours a mixture, which means the useful question is the proportion rather than which one is right.
---
q: The Grand Tack and Nice models explain several Solar System peculiarities. What is their epistemic status?
a: They are confirmed theories, since they reproduce the observed features
x: Reproducing features they were built to reproduce is weaker evidence than the phrasing suggests.
a*: They are constructions designed to account for features already known, which is legitimate but weaker than a prediction made in advance
a: They are untestable, since the events they describe happened billions of years ago
x: They make testable predictions about small-body populations, isotopic signatures and the architecture of other systems.
a: They are superseded by exoplanet observations, which show such rearrangements do not occur
x: Exoplanet observations, particularly near-resonant period ratios and eccentricity distributions, provide independent evidence that migration and instability are common.
hint: Ask whether the model was formulated before or after the features it explains were known.
why: The Grand Tack has Jupiter migrating inward to about $1.5$ AU — truncating the inner disc and starving Mars — before Saturn's migration reverses both outward; the Nice model has the giants undergoing a later instability that rearranges their orbits and scatters small bodies. Both reproduce a set of observations: Mars's low mass, the asteroid belt's depletion and mixed composition, the giants' present orbits, the Kuiper belt's structure. But **both were constructed after those observations were in hand**, with free parameters tuned to reproduce them, so their success is accommodation rather than prediction. That is a normal and useful stage of science — a model that accounts for many independent facts with few parameters has earned attention — but it is weaker than a prediction made before the fact, and the distinction should be stated rather than blurred. What upgrades their status is genuine prediction: both imply consequences for small-body populations and isotopic mixing that were not used in their construction, and exoplanet architectures provide an independent arena, since migration and instability should leave the near-resonant period ratios and eccentricity distributions that are in fact observed elsewhere.
```

## 6. Eccentricity and inclination as a dynamical thermometer

Two of the six architectural quantities are best read together, because they measure the same thing in perpendicular directions.

A gas disc damps both eccentricity and inclination efficiently, on timescales far shorter than the disc's lifetime. **A system that formed and stayed quiet should therefore end up circular and coplanar**, and any departure from that has to be excited after the gas dispersed. Eccentricity and mutual inclination are consequently a dynamical temperature: a record of how much stirring the system suffered.

The observed distributions divide sharply by planet mass.

**Compact multiples of small planets are dynamically cold.** Eccentricities are small — typically below $0.1$, often consistent with zero — and mutual inclinations are of order one to two degrees, flatter than the Solar System's terrestrial planets. These systems were assembled and then left alone.

**Giant planets are dynamically hot.** Their eccentricity distribution is broad, extending past $0.9$, and this is a real result rather than a fitting artefact, confirmed independently in transiting systems where the transit duration constrains eccentricity without reference to a velocity fit.

**The contrast is the informative part.** Whatever excites giant eccentricities either does not operate in compact small-planet systems, or destroys them when it does. Planet–planet scattering among giants is the leading candidate, and it predicts exactly this asymmetry: giants are massive enough to scatter one another to high eccentricity and survive, whereas a comparable event among low-mass planets ends in collisions and mergers, leaving a smaller number of planets on circularised orbits rather than a stirred system.

**One systematic deserves flagging.** Eccentricities derived from sparsely sampled radial velocity data are biased upward, because noise fitted with an eccentric Keplerian generally yields a non-zero eccentricity. Reported eccentricity distributions for marginally detected planets should therefore be treated as upper envelopes rather than measurements, and the effect is largest exactly where the data are poorest.

```checkpoint
q: Compact multi-planet systems of small planets are nearly circular and coplanar, while giant planets have a broad eccentricity distribution. What does the contrast indicate?
a: That small planets form later, after the disc has finished damping
x: The disc damps whatever is present while it is present; formation order does not produce this split.
a*: That whatever excites giant eccentricities — most plausibly scattering among giants — either does not operate among low-mass planets or destroys such systems when it does
a: That eccentricity measurements for small planets are less reliable
x: The bias in sparsely sampled data runs the other way, inflating rather than suppressing measured eccentricities.
a: That small planets are tidally circularised while giants are not
x: Tidal circularisation acts on the closest orbits regardless of mass, and it cannot explain the pattern across the full period range.
hint: Ask what happens when two low-mass planets scatter each other, compared with two giants.
why: A gas disc damps eccentricity and inclination on timescales far shorter than its lifetime, so a system left undisturbed ends circular and coplanar and any departure must have been excited after the gas dispersed. **Compact multiples are dynamically cold** — eccentricities typically below $0.1$ and mutual inclinations of a degree or two, flatter than the Solar System's terrestrial planets — while **giants are dynamically hot**, with eccentricities extending past $0.9$. Planet–planet scattering explains the asymmetry rather than merely accommodating it: giants are massive enough to deflect one another onto highly eccentric orbits and survive the encounter, whereas low-mass planets undergoing the same interaction have escape velocities below their orbital velocities and therefore collide and merge instead of scattering. The outcome of an instability among small planets is a system with fewer planets on re-circularised orbits, not a stirred one — which is consistent with the Kepler dichotomy's excess of singles arising partly from instabilities. Note one systematic: eccentricities fitted to sparse radial velocity data are biased upward, since noise absorbed into an eccentric Keplerian yields non-zero $e$, so marginal detections' eccentricity distributions are upper envelopes.
---
q: Why is the transit method structurally better suited to studying architectures than radial velocity, despite radial velocity reaching wider orbits?
a: Because transits measure planet masses, which are needed for dynamical analysis
x: Transits measure radii, not masses; masses come from radial velocity or timing variations.
a*: Because a coplanar aligned system transits in full, so multiplicity, relative spacing and near-coplanarity are measured directly rather than built up planet by planet
a: Because transit surveys observe more stars than radial velocity surveys
x: True, but the structural advantage is what a single detection delivers, not how many stars are watched.
a: Because transit timing gives orbital periods more precisely than radial velocity
x: Period precision is excellent from transits but is not what makes architecture accessible.
hint: Ask what a single successful observation yields in each method.
why: A radial velocity campaign detects planets sequentially: each requires enough sampling to establish its own period and amplitude, and additional planets emerge only as residuals are examined, so a well-characterised multi-planet system represents years of accumulated effort per star. **A transiting coplanar system reveals all its planets at once**, because the alignment permitting one to cross the stellar disc permits the others to do so as well — so multiplicity, relative spacing, period ratios and the fact of near-coplanarity all fall out of a single dataset. That is why architecture became a subject when transit surveys arrived rather than earlier, and why the statistics of multiplicity, near-resonance and intra-system uniformity are transit results. The complement holds too: radial velocity reaches the wide orbits transits cannot, so the outer architecture of systems — whether a compact inner multiple also hosts a cold giant — requires combining the two, which is exactly why that particular question remains unresolved. **Each method's structural advantage determines which questions it can answer, independently of its sensitivity.**
```

## 7. Giants and the inner system

Whether an outer giant helps or hinders inner planets is one of the few architecture questions with a direct bearing on our own situation, and it is unresolved.

**Arguments that a cold giant hinders.** It can block inward drift of pebbles that would otherwise supply material for inner planet formation; it can excite eccentricities in inner bodies, raising collision velocities and causing erosion rather than growth; and if it becomes dynamically unstable it can clear the inner system entirely.

**Arguments that a cold giant helps.** It can shepherd material inward through resonances; it may shield the inner system from cometary bombardment, though the magnitude of this effect has been substantially revised downward from earlier claims; and its presence indicates a solid-rich disc that should also favour inner planet formation.

**The observational test** is whether systems with cold Jupiters more or less often contain inner super-Earths. The measurement is hard: cold Jupiters require long radial velocity baselines and inner super-Earths require transit or high-precision Doppler surveys, so the joint sample is small and inhomogeneous. Published analyses have reported a positive correlation, no correlation, and a negative correlation, using overlapping data.

**The honest position** is that the question is well posed, the measurement is being attempted, and the answer is currently unknown. It matters because the Solar System has a cold Jupiter and no super-Earths, and whether that is causal or coincidental bears on how unusual we are.

{{image: TRAPPIST-1 | A system of seven planets orbiting a very low-mass star, all within a region far smaller than Mercury's orbit, and arranged in a chain in which every adjacent pair sits within about a per cent of a simple integer period ratio. Capture into such a configuration requires convergent migration through a gas disc, since a system that formed in place has no mechanism for arriving at commensurabilities. The chain's survival is a second piece of information: configurations of this kind are broken by modest dynamical disturbance, so an intact chain certifies that nothing significant has happened to the system since its gas dispersed.}}

## 8. Beyond single stars

Most stars are in multiple systems, so planetary architectures in binaries are not a special case.

**Circumbinary planets** orbit both stars. They exist, and their inner edges sit near the dynamical stability limit at roughly two to four times the binary separation — consistent with formation further out and migration inward until the binary's perturbations halted them. The pile-up near the stability boundary is a genuine architectural result, and it mirrors the compact-multiple finding: **populations accumulate against dynamical boundaries.**

**Circumstellar planets in wide binaries** orbit one component. They are common, and the companion truncates the disc, suppressing planet formation when the binary is close — an occurrence deficit for binaries closer than a few tens of AU is well established.

The general point is that the disc's outer boundary is set by whatever is outside it, and stellar companions are the most common such thing.

```checkpoint
q: Why is the absence of any planet inside Mercury's orbit a fact requiring explanation rather than a neutral feature of our system?
a: Because planets should form at all radii where material is present
x: Formation is not uniform with radius, and the argument is empirical rather than deduced from formation theory.
a*: Because the commonest known architecture packs several planets inside $0.4$ AU, so our emptiness is the unusual case measured against the observed distribution
a: Because Mercury's orbit is unusually eccentric, suggesting a lost inner planet
x: Mercury's eccentricity is modest and is explained by secular dynamics without requiring a lost body.
a: Because the region is dynamically stable and should therefore be occupied
x: Stability permits occupation but does not require it; the argument comes from what other systems actually contain.
hint: Ask what the reference population is, and whether our system sits at its centre or its edge.
why: Before the transit surveys there was no reference population, so the Solar System's inner emptiness was simply what a planetary system looked like. That changed once occurrence rates were measured: a large fraction of Sun-like stars — estimates cluster at $30$–$50\%$ — host one or more planets of one to four Earth radii inside a hundred days, usually several, packed within a region smaller than Mercury's orbit. **Against that distribution our system is an outlier**, and outliers require explanation. The leading accounts all route through Jupiter: that its early formation and outward position blocked inward drift of solids that would otherwise have built inner planets, or that its migration truncated the inner disc, or that a later instability cleared the region. Each is testable in principle through the correlation between cold giants and inner super-Earths, and that test is currently returning inconsistent answers. The methodological point is general: **whether a feature needs explaining depends on the reference population, and acquiring one can convert a background assumption into an anomaly overnight** — which is exactly what happened here.
---
q: A model reproduces several known features of a system using parameters tuned to reproduce them. What is its standing, and what would improve it?
a: It is confirmed, since agreement with multiple independent observations is the standard of success
x: The observations were used in the construction, so agreement with them is accommodation rather than a test.
a*: It is a legitimate accommodation whose standing improves if it predicts something not used in its construction and that prediction is then checked
a: It is worthless, since a model with free parameters can fit anything
x: Too strong: a model accounting for many independent facts with few parameters has earned attention, and parameter counting matters.
a: Its standing depends on whether the parameters have physical interpretations
x: Physically motivated parameters help, but the decisive issue is whether the model was tested against data it did not use.
hint: Ask whether the observations in question were available before or after the model was built.
why: The Grand Tack and Nice models each reproduce a cluster of Solar System facts — Mars's low mass, the asteroid belt's depletion and compositional mixing, the giants' present orbits, the structure of the Kuiper belt — using a small number of tuned parameters. Accounting for many independent facts with few free parameters is a genuine achievement and not to be dismissed. But **the facts were known when the models were built**, so the agreement is accommodation, and accommodation is weaker evidence than prediction because the model's flexibility was exercised against exactly those data. What raises the standing is a consequence the model implies but that played no part in its construction, checked afterwards: for these models, detailed predictions about small-body population structure and isotopic mixing, and independent evidence from exoplanet architectures that migration and instability are common — which the near-resonant period ratios and the broad giant eccentricity distribution supply. **The distinction between accommodation and prediction should be stated rather than blurred**, since both are routinely described as "the model explains", and the word conceals a large difference in evidential weight.
```

## 9. Pulling the thread

- **Architecture is where formation theory is tested**, because producing the right planet is not the same as producing the right arrangement — and transits deliver whole systems, since an aligned coplanar system transits in full.
- **Spacings cluster at $\Delta \approx 10$–$30$ mutual Hill radii**, just above the stability threshold. Systems are dynamically full, and that distribution records a filter rather than a preference.
- **Resonance requires migration.** A system that never migrated cannot know about commensurabilities, so both intact chains and the near-resonant clustering are evidence that convergent migration happened.
- **TRAPPIST-1's six adjacent ratios all sit within a per cent of commensurabilities**, and the chain's survival certifies that nothing has disturbed the system since the gas dispersed.
- **The Kepler dichotomy is an inference problem, not a discovery.** The excess of singles is consistent with a spread of mutual inclinations or with a distinct single-planet population, and the two imply quiet or violent histories for systems generally.
- **The Solar System is atypical in specific, listable ways** — nothing inside Mercury, no super-Earths, wide spacing, distant circular giants — and the models explaining them were built after the fact, which is legitimate but weaker than prediction.
- **Whether cold giants help or hinder inner planets is unresolved**, with published analyses finding correlations of both signs from overlapping data.
- **Populations pile up against dynamical boundaries**, in compact multiples and in circumbinary planets alike.

The transferable idea: **when a population sits just inside an allowed region, the boundary is doing the explaining.** Compact multiples cluster just above the stability threshold; circumbinary planets pile up just outside the binary's clearing radius; and in neither case does formation have a reason to prefer that particular configuration. What the distributions record is not what was produced but what survived — the boundary acted as a filter on a broader original population, and the observed clustering is the shadow of everything removed. **The diagnostic question is whether a distribution's edge coincides with a physical limit**, and if it does, the right model is a filter applied to a wider distribution rather than a mechanism that aims at the edge. The same reasoning applies to stellar binaries piling up at contact separations, to asteroid families bounded by resonances, and to any population whose observed range terminates exactly where survival does.

## 10. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Philip Armitage | Astrophysics of Planet Formation | 2020}}

{{book: Carl Murray and Stanley Dermott | Solar System Dynamics | 1999}}

Beyond the books: Murray and Dermott is the standard treatment of resonances and Hill stability and repays reading directly, since the architecture literature assumes its content throughout. Winn and Fabrycky's review of exoplanet system architectures is the best synthesis of the transit-era statistics and is careful about which conclusions the multiplicity data can and cannot support. On the Solar System's peculiarities, reading a Grand Tack paper alongside a critique is more useful than either alone, since the disagreements are about how much freedom the model has rather than about the observations.

## Problems

*Useful numbers: $R_{H,\rm mut} = [(m_1+m_2)/3M_\star]^{1/3}(a_1+a_2)/2$, $\Delta = (a_2-a_1)/R_{H,\rm mut}$; two-planet stability requires $\Delta > 2\sqrt3 = 3.46$, multiples require $\Delta\gtrsim10$; observed compact multiples $\Delta \approx 10$–$30$; Jupiter–Saturn $\Delta = 8.0$, Venus–Earth $\Delta = 26.4$; TRAPPIST-1 adjacent ratios $1.603$, $1.672$, $1.506$, $1.509$, $1.342$, $1.519$; $M_\oplus/M_\odot = 3.00\times10^{-6}$.*

**1.** *(Architecture.)* List the six quantities that define a system's architecture and state what each records about its history.

**2.** *(Spacing.)* **(a)** Compute $\Delta$ for two $5\,M_\oplus$ planets at $0.10$ and $0.14$ AU around a solar-mass star. **(b)** Compare with the stability requirement. **(c)** State what the observed distribution of $\Delta$ implies and why it is a filter rather than a preference.

**3.** *(Resonance.)* **(a)** Explain why resonant capture requires convergent migration. **(b)** State what an intact resonant chain certifies about a system's subsequent history. **(c)** Explain why near-resonant clustering is also evidence for migration.

**4.** *(TRAPPIST-1.)* **(a)** Identify the nearest commensurability for the ratios $1.506$ and $1.342$. **(b)** State why six such coincidences cannot be chance. **(c)** State what the rarity of intact chains, against the commonness of near-resonant pairs, implies.

**5.** *(Multiplicity.)* **(a)** Explain why a coplanar population produces mostly multi-transiting systems. **(b)** State the two readings of the observed excess of singles. **(c)** State three observations that help separate them.

**6.** *(Our system.)* **(a)** List four ways the Solar System differs from the commonest observed architecture. **(b)** State what the Grand Tack and Nice models explain. **(c)** State their epistemic status and what would upgrade it.

**7.** *(Giants.)* **(a)** Give two arguments that a cold giant hinders inner planet formation and two that it helps. **(b)** State the observational test. **(c)** State the current status and why the measurement is hard.

**8.** *(Binaries.)* **(a)** State where circumbinary planets' inner edges lie and what that suggests. **(b)** State the effect of a close stellar companion on planet occurrence. **(c)** State what both have in common with the compact-multiple spacing result.

**9.** *(Method.)* **(a)** State the general principle about populations sitting just inside an allowed region. **(b)** Apply it to two results in this chapter. **(c)** Give an example from outside exoplanet science.

## Worked answers

**1.** *Multiplicity* — how much material was available and how much survived rearrangement. *Spacing*, in mutual Hill radii — the dynamical packing, hence whether the system has been filtered by instability. *Mass ordering* — how accretion distributed material with radius. *Eccentricity* — a dynamical temperature; discs damp it, so any excess was excited after the gas dispersed. *Mutual inclination* — the same in the perpendicular direction, recording out-of-plane excitation. *Resonance* — requires convergent migration to establish and quiet conditions to preserve.

**2.** **(a)** $R_{H,\rm mut} = [(10\times3.00\times10^{-6})/3]^{1/3}\times0.12 = (10^{-5})^{1/3}\times0.12 = 0.0215\times0.12 = 2.58\times10^{-3}$ AU; $\Delta = 0.04/2.58\times10^{-3} = 15.5$. **(b)** Comfortably above the two-planet requirement of $3.46$ and above the empirical multi-planet requirement of about $10$. **(c)** Observed compact multiples cluster at $\Delta\approx10$–$30$, just above the threshold, which is the signature of a filter: formation packed systems more tightly, over-packed configurations went unstable and lost planets, and the survivors are those that could survive. The confirming prediction is that inserting an extra planet into a typical observed system destabilises it, which simulations bear out.

**3.** **(a)** Because two planets must approach one another slowly so that the drifting period ratio can be locked by the resonant interaction as it crosses a commensurability; a static system's period ratio never drifts, so there is nothing to capture. **(b)** That nothing significant has disturbed it since the gas dispersed, since chains are fragile and broken by modest perturbation — a passing star, an internal instability, a scattering event. **(c)** Because a system that never migrated has no reason to have period ratios near commensurabilities at all; the clustering just wide of resonance is naturally read as capture followed by slight divergence, or as imperfect capture, both of which require migration.

**4.** **(a)** $1.506 \approx 3{:}2$ ($1.500$); $1.342\approx4{:}3$ ($1.333$). **(b)** Because each ratio independently lands within about a per cent of a low-order commensurability, and the commensurabilities occupy a small fraction of the available range of ratios — six such coincidences have negligible joint probability. **(c)** That most systems probably formed chains and most subsequently broke them, so late dynamical instabilities are common — which makes the surviving chains rare certificates of quiet histories rather than typical outcomes.

**5.** **(a)** Because in a coplanar system the orbital planes coincide, so an orientation permitting one planet to cross the stellar disc generally permits the others to cross as well. **(b)** That systems have a spread of mutual inclinations of a few degrees, so singles are multiples viewed unfavourably; or that a distinct population genuinely contains one close-in planet and nothing else, perhaps after an instability. **(c)** Transit durations, which constrain impact parameters and hence relative inclinations; radial velocity follow-up, revealing non-transiting companions; and transit timing variations, which detect perturbers that never transit.

**6.** **(a)** Nothing inside $0.39$ AU where most systems pack several planets; no super-Earths, the dominant class by number; wide spacing, with terrestrial pairs at $\Delta\approx26$ rather than $10$–$30$; and distant, nearly circular giants. *(Also: a low-mass Mars and a depleted asteroid belt.)* **(b)** Grand Tack: Jupiter's inward migration to $\sim1.5$ AU truncating the inner disc, starving Mars and depleting the belt, before Saturn reverses both outward. Nice: a later giant-planet instability rearranging their orbits and scattering small bodies. **(c)** Both were constructed after the features they explain were known, with parameters tuned accordingly, so their success is accommodation rather than prediction. What would upgrade it is confirmation of consequences not used in their construction — small-body population structure, isotopic mixing signatures, and independent evidence from exoplanet architectures that migration and instability are common.

**7.** **(a)** *Hinders:* it blocks inward pebble drift that would supply inner planet formation; it excites eccentricities, raising collision velocities so that impacts erode rather than build. *Helps:* it can shepherd material inward through resonances; and its presence indicates a solid-rich disc that should also favour inner planet formation. **(b)** Whether systems with cold Jupiters more or less often contain inner super-Earths. **(c)** Unresolved — published analyses using overlapping data have reported positive, null and negative correlations. It is hard because cold Jupiters require decade-long radial velocity baselines while inner super-Earths require transit or high-precision Doppler surveys, so the joint sample is small and inhomogeneous.

**8.** **(a)** Near the dynamical stability limit, at roughly two to four times the binary separation, which suggests formation further out followed by inward migration halted by the binary's perturbations. **(b)** A close companion truncates the disc and suppresses planet formation, producing a well-established occurrence deficit for binaries closer than a few tens of AU. **(c)** Both are populations accumulating against a dynamical boundary: planets migrate or are filtered until they reach a limit set by stability, and the observed pile-up marks that limit rather than a formation preference.

**9.** **(a)** That when a population's distribution terminates at a physical limit, the boundary is doing the explaining — the right model is a filter applied to a broader original distribution, not a mechanism aiming at the edge. **(b)** Compact multiples cluster just above the Hill stability threshold, and circumbinary planets pile up just outside the binary's clearing radius; in neither case does formation prefer that configuration. **(c)** Stellar binaries piling up at contact separations, where the observed period distribution terminates because closer systems merge; the population's edge marks destruction rather than a preferred formation period. *(Asteroid families bounded by resonances are a further case.)*$exArch_master$,
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
