-- Astronomy & Space · Exoplanets — How Common? — "Earth Analogs".
-- Curated master for
-- astronomy-and-space/exoplanets/how-common/earth-analogs
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Closes the Exoplanets subject and the Astronomy & Space subject.
-- Organised around taking the phrase apart: "Earth analogue" bundles
-- four separate claims - Earth-sized, in the habitable zone, around a
-- Sun-like star, with an Earth-like atmosphere - of which only the
-- first two are currently measurable and the fourth has never been
-- established for any planet. Treats the habitable zone as a
-- calculable but weak criterion, since Venus and Mars both lie inside
-- the optimistic zone and neither is habitable; the M dwarf trade,
-- where every detectability advantage comes with a habitability
-- liability; biosignatures and the abiotic oxygen problem; and what a
-- genuine detection would actually require.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: habitable zone scaling as
-- sqrt(L/Lsun) giving conservative boundaries of 0.950-1.670 AU for
-- the Sun with periods of 338-788 d, 0.190-0.334 AU and 43-100 d for
-- an M0 dwarf at 0.04 Lsun, 0.067-0.118 AU and 14-33 d for an M4
-- dwarf at 0.005 Lsun, and 0.039-0.069 AU and 8-19 d for a
-- Proxima-like M5.5 at 0.0017 Lsun; optimistic boundaries 0.75-1.77
-- AU for the Sun, which place both Venus at 0.723 and Mars at 1.524
-- inside or at its edge; transit probability at the inner edge 0.49%
-- for the Sun against 1.45% for an M4 dwarf, and Earth-size transit
-- depth 84 ppm against 1902 ppm.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/how-common/earth-analogs',
    'research',
    'advanced',
    'read',
    $exEarth_master$> "An Earth-like planet has been found" is not one claim. It is four, and they are usually announced together on the strength of the first two.

**Earth-sized.** Measurable, from a transit radius, with the caveats about inherited stellar radii.

**In the habitable zone.** Calculable, from the stellar luminosity and the orbital distance — and far weaker as a criterion than it sounds, since Venus and Mars both lie within the Sun's optimistic habitable zone.

**Around a Sun-like star.** Measurable, and almost never true of the objects so described, which orbit M dwarfs for reasons of detectability.

**With an Earth-like atmosphere.** **Never established for any planet outside the Solar System.** Not once.

This chapter takes the phrase apart. It closes the Exoplanets subject, and with it the astronomy sequence, on what is genuinely the field's central question — and the honest answer is that nobody has found one, that the search is well designed, and that the decisive measurements are close.

## 1. The habitable zone

### 1.1 What it is

The range of orbital distances within which a planet with an Earth-like atmosphere could sustain liquid water on its surface. Both edges are set by atmospheric physics rather than by simple temperature.

**The inner edge** is where a **runaway greenhouse** occurs: rising insolation evaporates more water, water vapour is a greenhouse gas, so the surface warms further and evaporates more, and the feedback runs away until the oceans are gone. It is a threshold, not a gradual limit.

**The outer edge** is the **maximum greenhouse** distance: beyond it, adding carbon dioxide no longer warms the surface, because CO$_2$ begins to condense and its increasing Rayleigh scattering reflects more sunlight than its absorption retains.

Because both edges depend on the incident flux, they scale as $\sqrt{L/L_\odot}$:

| Host | $L/L_\odot$ | Conservative HZ | Orbital periods |
|---|---|---|---|
| Sun-like G2 | $1.0$ | $0.950$–$1.670$ AU | $338$–$788$ d |
| M0 dwarf | $0.04$ | $0.190$–$0.334$ AU | $43$–$100$ d |
| M4 dwarf | $0.005$ | $0.067$–$0.118$ AU | $14$–$33$ d |
| Proxima-like M5.5 | $0.0017$ | $0.039$–$0.069$ AU | $8$–$19$ d |

An **optimistic** zone, bounded by empirical arguments that Venus was habitable until recently and Mars until early in its history, extends the Sun's range to $0.75$–$1.77$ AU.

### 1.2 Why it is a weak criterion

**Venus orbits at $0.723$ AU and Mars at $1.524$ AU. Both lie inside the Sun's optimistic habitable zone. Neither is habitable.**

That single observation is the most important thing to know about the concept. The habitable zone is a statement about orbital distance and stellar luminosity, and habitability depends on far more.

**It assumes an atmosphere**, and specifically a CO$_2$–H$_2$O atmosphere with an Earth-like inventory. A planet with no atmosphere is not habitable anywhere; a planet with a hydrogen envelope has no surface in the relevant sense.

**It assumes a carbonate–silicate cycle.** The zone's width depends on the planet regulating its own CO$_2$ over geological time, which on Earth requires plate tectonics, liquid water and volcanism working together. Whether that operates on other planets is unknown, and it may require conditions — plate tectonics in particular — that are not generic.

**It says nothing about water.** A planet in the zone with no water is dry; one with too much is a global ocean with no exposed continental weathering and hence a different carbon cycle.

**It ignores history.** A planet may be in the zone now and have been sterilised earlier — which is exactly the concern for M dwarf planets.

**The right way to hold it** is as a *necessary but far from sufficient* condition, and as a target selection tool rather than a conclusion. It identifies where to look. It does not establish what is there.

## 2. The M dwarf trade

Almost every temperate Earth-sized planet known orbits an M dwarf, and this is a selection effect with a specific structure: **every detectability advantage is paid for with a habitability liability.**

**The advantages are large.** Transit depth scales as $R_\star^{-2}$, so an Earth-size planet around an M4 dwarf gives $1902$ ppm against $84$ ppm for the Sun — a factor of $23$. Transit probability at the inner habitable zone edge is $1.45\%$ against $0.49\%$. Orbital periods are $14$–$33$ days rather than $338$–$788$, so many transits accumulate quickly. And radial velocity amplitudes are larger, since $K \propto M_\star^{-2/3}$.

**The liabilities are equally structural.**

**Tidal locking.** At $0.07$ AU, tidal despinning is rapid, so the planet almost certainly has permanent day and night sides. Whether this is fatal is genuinely uncertain: early work suggested atmospheric collapse, with volatiles freezing out permanently on the night side, while later circulation modelling showed that a modest atmosphere transports enough heat to prevent it. **The current view is that tidal locking is survivable but consequential**, producing climates unlike anything in the Solar System.

**Flares.** M dwarfs are magnetically active for billions of years, with flares that can exceed the quiescent ultraviolet output by orders of magnitude. These erode atmospheres and would sterilise an unshielded surface.

**The pre-main-sequence problem.** This is the most serious and the least intuitive. A low-mass star contracts slowly and is **far more luminous before reaching the main sequence** — for hundreds of millions of years. A planet in what will become the habitable zone therefore spends its first hundreds of millions of years well inside the runaway greenhouse limit, potentially losing its entire water inventory before the star settles. **A planet found in the habitable zone today may have been desiccated before the zone arrived.**

**The counter-arguments** are real: water can be delivered late by impacts; a sufficiently massive planet with a high mean molecular weight atmosphere resists escape; and outgassing can replenish volatiles. None is established.

**The trade is therefore genuine and unresolved**, and it matters because the field's observational programme is committed to M dwarfs by necessity rather than by preference.

```checkpoint
q: Venus and Mars both lie within the Sun's optimistic habitable zone. What does this establish about the concept?
a: That the zone's boundaries have been calculated incorrectly and should be narrowed
x: The boundaries follow from atmospheric physics for an Earth-like atmosphere and are not in error; the criterion's scope is the issue.
a*: That it is a necessary but far from sufficient condition — a statement about orbital distance and stellar luminosity, while habitability depends on atmosphere, water inventory, geological cycling and history
a: That habitability is impossible to define, so the concept should be abandoned
x: It remains valuable for target selection; the point is what it can and cannot conclude.
a: That Venus and Mars were habitable in the past, so the zone is correct but time-dependent
x: Both may have been more clement earlier, but that does not rescue the zone as a sufficient criterion for the present.
hint: Ask what the zone is computed from, and list what else habitability requires.
why: The habitable zone is derived from two numbers — stellar luminosity and orbital distance — through atmospheric physics that assumes an Earth-like CO$_2$–H$_2$O atmosphere with a working carbonate–silicate cycle. **Venus at $0.723$ AU and Mars at $1.524$ AU both fall inside the optimistic boundaries of $0.75$–$1.77$ AU, or at their edge, and neither is habitable** — Venus through a runaway greenhouse that left a surface at $737$ K, Mars through the loss of atmosphere and hence of surface pressure. Their example shows directly what the criterion omits: whether an atmosphere exists at all, its composition and inventory, whether water was delivered and retained, whether geological cycling regulates carbon dioxide over billions of years, and what the planet's irradiation history was. The correct use is as a **target selection tool** — it identifies where to look — rather than as a conclusion about what is there. Reporting a planet as habitable on the strength of its orbit alone asserts far more than the measurement supports, and the Solar System supplies two counterexamples within reach of spacecraft.
---
q: An Earth-size planet is found in the habitable zone of an M4 dwarf. Why is its detectability advantage inseparable from a habitability concern?
a: Because M dwarfs are older, so their planets have had longer to lose their atmospheres
x: M dwarf ages vary as widely as those of other stars; age is not the structural issue.
a*: Because the habitable zone is close in — $0.067$–$0.118$ AU — which is what raises transit depth, probability and radial velocity amplitude, and is also what brings tidal locking, flare exposure and the prolonged luminous pre-main-sequence phase
a: Because M dwarfs have lower metallicity, so their planets are less likely to be rocky
x: M dwarfs span a range of metallicities, and small rocky planets form readily around them.
a: Because their planets are systematically more massive, making them likely to retain hydrogen envelopes
x: Small planets around M dwarfs span the same mass range as elsewhere.
hint: Identify the single geometric fact that produces both the advantages and the liabilities.
why: The habitable zone scales as $\\sqrt{L/L_\\odot}$, so for an M4 dwarf at $0.005\\,L_\\odot$ it sits at $0.067$–$0.118$ AU with periods of $14$–$33$ days. **That proximity is the entire trade.** It raises transit depth to $1902$ ppm against $84$ for an Earth around the Sun, raises transit probability to $1.45\\%$ against $0.49\\%$, shortens periods so transits accumulate quickly, and increases the radial velocity amplitude — every one of which follows from the planet being close to a small star. The same proximity brings tidal locking, since despinning at $0.07$ AU is rapid; exposure to flares from a star that stays magnetically active for billions of years; and the **pre-main-sequence problem**, in which a slowly contracting low-mass star is far more luminous for hundreds of millions of years, placing the planet well inside the runaway greenhouse limit long before the habitable zone arrives at its orbit. The liabilities are not incidental features of M dwarfs but consequences of the same geometry that makes the planets findable, which is why the field's commitment to these targets is a necessity rather than a preference.
```

## 3. The candidates, and what is actually known

A short inventory, because the gap between what is announced and what is measured is the point.

**Proxima b.** Minimum mass $1.07\,M_\oplus$, period $11.19$ days, in the habitable zone of the nearest star. **It does not transit**, so its radius is unknown, its true mass is a lower limit, and no atmospheric measurement is possible by transmission. Its host is a flare star of pronounced activity.

**TRAPPIST-1 e, f and g.** Earth-sized, transiting, with masses from timing variations, in or near the habitable zone of an ultracool dwarf. **The best-characterised temperate rocky planets known** — and the atmospheric measurements so far are consistent with thin atmospheres or none, with the results contested and the transit light source effect a live concern given the host's activity.

**Kepler-452b.** Announced as an Earth cousin: near-Earth-size in the habitable zone of a Sun-like star. Its radius sits near the boundary above which planets are usually not rocky, its mass is unmeasured, and the statistical validation of the detection has been questioned.

**The pattern is consistent.** Where a planet orbits a Sun-like star, its properties are poorly constrained. Where its properties are well constrained, it orbits an M dwarf. **No known object is simultaneously Earth-sized, in the habitable zone, around a Sun-like star, and atmospherically characterised.**

## 4. What would establish habitability

Distinguishing the claims that could be made from the evidence that would support them.

**Does it have an atmosphere at all?** The prior question, and the closest to being answered. A thermal phase curve settles it almost model-independently: an airless body cannot transport heat, so its day–night contrast is maximal. **This measurement is being made now for the best targets.**

**What is the surface pressure?** Required for liquid water, since below the triple point pressure water cannot be liquid at any temperature. Inferable from the shape of atmospheric features and from the thermal structure, though not straightforwardly.

**Is there water?** Detecting water vapour is within reach for favourable targets; distinguishing surface oceans from atmospheric vapour is much harder. A **glint** — specular reflection from a liquid surface, varying with orbital phase — is the cleanest signature and requires direct imaging with photometric precision not yet available.

**Is the surface temperate?** Requires the atmospheric composition and structure, since the greenhouse offset is not calculable without them. Earth's is $33$ K; Venus's is over $500$ K.

**Each of these is a separate measurement**, and only the first is close.

{{image: Habitable zone | The range of orbital distances within which a planet with an Earth-like atmosphere could hold liquid water at its surface, bounded on the inside by the runaway greenhouse threshold and on the outside by the distance beyond which added carbon dioxide condenses and scatters more light than it traps. Because both limits are set by incident flux, the zone scales with the square root of stellar luminosity, lying at roughly one astronomical unit for a Sun-like star and at a few hundredths for a low-mass red dwarf. Its weakness as a criterion is easily demonstrated within the Solar System: Venus and Mars both fall inside the optimistic boundaries, and neither is habitable.}}

{{image: TRAPPIST-1e | An Earth-sized planet in or near the habitable zone of an ultracool dwarf, and among the best-characterised temperate rocky worlds known: it transits, so its radius is measured, and mutual perturbations among its six siblings supply its mass without spectroscopy. What is not known is whether it has an atmosphere. The measurements attempted so far are consistent with a thin atmosphere or with none, and they are complicated by the host's magnetic activity, since unocculted starspots imprint stellar features - including water bands - on a transmission spectrum. That gap between a well-measured planet and an unmeasured atmosphere is the current state of the search in a single object.}}

```checkpoint
q: A planet is announced as "the most Earth-like yet found" on the basis of its radius and orbital distance. What has actually been established?
a: That it is a rocky planet capable of holding liquid water
x: Rockiness is inferred from radius alone, which is degenerate near the valley, and water requires an atmosphere that has not been measured.
a*: That its radius is consistent with a rocky composition, and that its orbit places it where an Earth-like atmosphere could sustain surface water — both of which leave the atmosphere, and hence habitability, entirely unaddressed
a: That it receives approximately the same stellar flux as Earth, which is the definition of Earth-like
x: Comparable flux is one component, but the phrase implies far more, which is the point of separating the claims.
a: Nothing, since radius and orbital distance carry no information
x: Too dismissive: both are real measurements and both are necessary conditions, just not sufficient ones.
hint: List what the two quoted quantities establish, and what the phrase implies beyond them.
why: Radius is measured, subject to the stellar radius it is inherited from, and it constrains composition loosely — near the valley at $1.5$–$2.0\,R_\oplus$ a planet may be a bare rock or a core with a per-cent-level hydrogen envelope, and density alone cannot separate them. Orbital distance combined with stellar luminosity places the planet in the habitable zone, which is **calculated from a model assuming an Earth-like CO$_2$–H$_2$O atmosphere with a working carbonate–silicate cycle** — an assumption, not an observation, and one the Solar System refutes as sufficient, since Venus and Mars both lie inside the Sun's optimistic zone. What remains unaddressed is whether the planet has an atmosphere at all, what its surface pressure is, whether water is present, and what its greenhouse offset would be — Earth's is $33$ K and Venus's exceeds $500$ K, so the same orbit admits both. **Two of the four components of the claim have been measured, and they are the two that are easy**, which is the structural feature of compound announcements: the rhetorical force comes from the best-supported conjunct while the truth depends on the worst.
---
q: Why is chemical disequilibrium a stronger biosignature criterion than the abundance of any single gas?
a: Because disequilibrium gases are easier to detect than single species
x: They are harder, since both must be detected simultaneously at sufficient precision.
a*: Because two gases that react rapidly with each other cannot coexist at detectable levels unless something continuously replenishes them, which is far harder to achieve abiotically than producing either alone
a: Because disequilibrium cannot be produced by any abiotic process
x: Abiotic disequilibrium is possible — volcanic outgassing produces some — so the argument is about difficulty rather than impossibility.
a: Because it does not require knowing the planet's atmospheric composition
x: It requires knowing the composition rather well, since two species must be identified and quantified.
hint: Ask what happens over time to two mutually reactive gases in a closed atmosphere with no source.
why: A single gas can accumulate from a variety of abiotic routes — oxygen from water photodissociation with hydrogen escape, from carbon dioxide photodissociation, or as the residue of an ocean lost during a star's luminous pre-main-sequence phase — and the first of these is most efficient around M dwarfs, so **the strongest false positive is concentrated exactly where the observable targets are.** Two mutually reactive gases are a different proposition: oxygen and methane react on timescales far shorter than a planet's age, so their simultaneous presence at detectable levels requires **continuous production of both**, and no single abiotic mechanism supplies them together at the required rates. On Earth both are biological. The criterion is not a proof — volcanic and photochemical sources produce some disequilibrium — but it converts the question from "could this gas arise abiotically?", which is nearly always yes, to "could this *pair* be sustained abiotically at these levels?", which is much more demanding. The cost is observational: two species must be detected and quantified in the same atmosphere, which is substantially harder than detecting one.
```

## 5. Biosignatures, and the oxygen problem

If an atmosphere is characterised, the next question is whether anything living produced it.

**Oxygen is the canonical biosignature**, because on Earth it is overwhelmingly biological — photosynthesis produces it, and without continuous replenishment it would be consumed by weathering and volcanic gases within millions of years. A planet with $20\%$ oxygen and no biosphere would be very strange.

**But oxygen has abiotic sources**, and this has been the field's most important negative result of the last decade. Several mechanisms produce oxygen without life:

**Photodissociation of water followed by hydrogen escape.** Ultraviolet light splits H$_2$O, the hydrogen escapes preferentially because escape is far more efficient at low molecular weight, and the oxygen is left behind. This is thought to have happened on Venus, and it is efficient precisely around M dwarfs, whose extreme ultraviolet output is high — **so the false positive is strongest exactly where the observable targets are.**

**Photodissociation of carbon dioxide** in a CO$_2$-rich atmosphere with slow recombination.

**A planet that lost its ocean during a pre-main-sequence luminous phase** can retain a massive abiotic oxygen atmosphere as the residue.

**The response is context rather than a single detection.** An oxygen detection accompanied by evidence against these mechanisms — an absence of the ocean-loss signature, the presence of nitrogen indicating an atmosphere that has not been through runaway escape, a surface pressure inconsistent with a desiccated residue — is a far stronger claim than oxygen alone.

**The stronger idea is chemical disequilibrium.** A pair of gases that react rapidly with each other cannot coexist unless something replenishes them. Oxygen and methane together are the standard example: on Earth they coexist only because both are continuously produced biologically, and their simultaneous presence at detectable levels is much harder to produce abiotically than either alone.

**A candid statement.** No biosignature has been detected. The field's most valuable recent work on the subject has been in **identifying false positives**, which has made the criteria stricter rather than looser — the correct direction, and one that reduces the chance of a premature claim that would take a decade to withdraw.

```checkpoint
q: Oxygen was long regarded as a reliable biosignature. What changed?
a: Oxygen turned out to be rarer in planetary atmospheres than expected
x: Its expected frequency is not what changed; the interpretation of a detection did.
a*: Several abiotic mechanisms were identified that produce oxygen without life — most importantly water photodissociation with hydrogen escape, which is most efficient around M dwarfs, exactly where the observable targets are
a: Instruments proved unable to detect oxygen at the required precision
x: Detection is difficult but the obstacle is interpretive rather than instrumental.
a: Oxygen was found on planets known to be lifeless, falsifying the biosignature
x: No such detection has been made; the abiotic mechanisms were established theoretically and by Solar System analogy.
hint: Ask what happens to a water molecule split by ultraviolet light when the hydrogen can escape and the oxygen cannot.
why: The original argument was sound: on Earth oxygen is overwhelmingly biological, and without continuous replenishment weathering and volcanic gases would remove it within millions of years. What changed is the identification of **abiotic production routes**. Ultraviolet light splits water; hydrogen escapes far more readily than oxygen because escape efficiency depends steeply on molecular mass; and the oxygen accumulates — a process thought to have operated on Venus and one that is most efficient around **M dwarfs**, whose extreme ultraviolet output is high. That places the strongest false positive exactly where the observationally accessible targets are. Carbon dioxide photodissociation and the residue of an ocean lost during a star's luminous pre-main-sequence phase supply further routes. The response has been to require **context** rather than a single detection — evidence against ocean loss, nitrogen indicating an atmosphere that has not undergone runaway escape, a surface pressure inconsistent with a desiccated residue — and to prefer **chemical disequilibrium pairs** such as oxygen with methane, which react rapidly and so cannot coexist unless both are replenished. The work identifying false positives has made the criteria stricter, which is the right direction and reduces the risk of a claim that would take a decade to retract.
---
q: What is the prior question that must be answered before any habitability assessment of a temperate rocky planet?
a: Whether the planet's mass places it below the radius valley, confirming it is rocky
x: Useful, but a rocky planet with no atmosphere is not habitable, so this does not come first.
a*: Whether it has an atmosphere at all — answerable almost model-independently by a thermal phase curve, since an airless body cannot transport heat and shows maximal day–night contrast
a: Whether its host star is quiet enough for life to survive on the surface
x: Stellar activity matters, but assessing its effect presupposes knowing whether an atmosphere exists to shield the surface.
a: Whether water vapour is present in its spectrum
x: Water detection is a later step, and it presupposes an atmosphere to detect it in.
hint: Ask what every subsequent habitability question assumes.
why: Surface temperature, surface pressure, water retention, greenhouse offset and biosignatures all presuppose an atmosphere. **For temperate rocky planets around M dwarfs, whether one exists is genuinely uncertain**, since such hosts remain magnetically active for billions of years, their habitable zones are close in, and their prolonged luminous pre-main-sequence phase can strip a planet before conditions settle. Transmission spectroscopy answers the question badly: a heavy secondary atmosphere has a scale height of order $10$ km against $300$ for a hydrogen envelope, so its features are weak and a flat spectrum is equally consistent with no atmosphere. **A thermal phase curve answers it directly**: an atmosphere carries heat from the permanently illuminated hemisphere to the night side, while a bare rock cannot, so day–night contrast is maximal for an airless body and reduced in proportion to circulation efficiency — a discriminant that depends on heat transport rather than on composition. The measurement is demanding but achievable now on identified targets, which makes it one of very few questions in this field with a decisive answer close at hand.
```

## 6. Where this leaves the search

**What is established.** Small planets are abundant. Many lie in habitable zones, most of them around M dwarfs. Rocky compositions are common below about $1.5\,R_\oplus$. The techniques to characterise atmospheres exist and work on larger planets.

**What is not established.** That any temperate rocky planet has an atmosphere. That any has water. That any is habitable. That any hosts life. And — importantly — the frequency of Earth analogues around Sun-like stars, which the occurrence chapter showed to be methodologically rather than statistically uncertain.

**What is coming.** Thermal phase curves settling atmospheric existence for the best M dwarf targets. Longer-baseline transit surveys reaching genuine one-year periods around Sun-like stars. Extremely large ground-based telescopes applying high-resolution cross-correlation to nearby temperate planets. And, further out, space-based direct imaging designed for reflected-light spectroscopy of Earth analogues, which is the only route to the full four-part claim and requires a contrast of $10^{-10}$ that has been demonstrated in the laboratory but never on sky.

**A closing assessment.** The search is well designed and honestly conducted. Its central number is uncertain by an order of magnitude for reasons that are understood. Its most cited criterion, the habitable zone, is a target selector rather than a conclusion. Its canonical biosignature has known false positives concentrated exactly where the accessible targets are. **None of that is discouraging** — it is what a field looks like when it has moved from asking whether other worlds exist to asking what they are like, and has become rigorous enough to know what it does not know.

```checkpoint
q: Tidal locking was once thought to make M dwarf planets uninhabitable through atmospheric collapse. What changed?
a: Observations showed that such planets are not in fact tidally locked
x: Tidal despinning at these separations is rapid and is not in doubt; the planets are expected to be locked.
a*: Circulation modelling showed that a modest atmosphere transports enough heat to prevent volatiles freezing out permanently on the night side, so locking is consequential rather than fatal
a: The habitable zones of M dwarfs were recalculated and found to lie further out, beyond the locking radius
x: The zone's location follows from luminosity and is well established at a few hundredths of an AU for these stars.
a: Tidal heating was found to keep the night side warm
x: Tidal heating matters for eccentric or resonant orbits but is not the mechanism that resolved the collapse concern.
hint: Ask what a planet with an atmosphere does with heat deposited on only one hemisphere.
why: The original concern was **atmospheric collapse**: with one hemisphere permanently dark, volatiles would migrate there, freeze out, and never return, leaving the planet airless. That reasoning treats the atmosphere as static. Circulation modelling showed it is not — a permanently heated dayside drives strong flow toward the night side, and even a modest atmospheric mass transports enough heat to keep the night side above the condensation temperature of the major volatiles. The threshold depends on atmospheric mass and composition, so collapse remains possible for very thin atmospheres, but it is not the generic outcome. **The revised position is that tidal locking is survivable and consequential rather than fatal**, producing climates with no Solar System analogue: a permanent substellar region, a permanent terminator ring, and circulation patterns organised by a fixed heating asymmetry rather than by rotation. The episode is a good illustration of how a qualitative argument — volatiles migrate to the cold side — can be overturned by a quantitative treatment of a process it neglected, and it should be held alongside the remaining M dwarf concerns, flares and the pre-main-sequence phase, which have not been similarly dissolved.
---
q: Why does the chapter describe the search for Earth analogues as well designed despite reporting no successes?
a: Because the absence of detections is itself evidence that such planets are rare
x: The absence reflects the difficulty of the measurements rather than the rarity of the planets, and occurrence estimates are large enough to expect targets.
a*: Because the limitations are understood and quantified — the selection effects are calculable, the criteria have been tightened rather than loosened, and the decisive measurements have been identified and are being attempted
a: Because the instruments are the best that current technology allows
x: True but not the argument; a well-designed search is one whose limitations are known, not merely one using good instruments.
a: Because the field has correctly prioritised M dwarfs, where detection is easiest
x: That priority is a necessity rather than a choice, and it brings the habitability liabilities the chapter sets out.
hint: Ask what distinguishes a field that does not yet have an answer from one that does not know what it is missing.
why: The chapter's case rests on three things. **The selection effects are calculable rather than merely acknowledged** — a transit probability of $0.47\%$ for an Earth analogue is exact geometry, completeness is measured by injection and recovery, and reliability by inverting the light curves, so the corrections that dominate an occurrence rate are constructed rather than assumed. **The criteria have been tightened** — the identification of abiotic oxygen routes made the biosignature standard stricter, which is the harder direction and reduces the chance of a claim requiring later retraction. And **the decisive measurements are identified**: a thermal phase curve settles atmospheric existence almost model-independently, and it is being attempted now on the best targets. What would indicate a poorly designed search is the opposite pattern — announcements outrunning measurements, criteria loosening to admit more candidates, and no articulated next observation. The honest summary is that the field knows what it does not know, which is a stronger position than having an answer nobody can check, and it is what makes the eventual result trustworthy rather than merely awaited.
```

```checkpoint
q: Why is a specular glint the cleanest signature of surface liquid water, and what does detecting it require?
a: Because water vapour absorption bands are ambiguous between surface and atmospheric water
x: The ambiguity is real, but a glint's strength is that it is a geometric signature rather than a spectroscopic one.
a*: Because a smooth liquid surface reflects specularly, producing a brightness that rises sharply at crescent phases — a geometric signature no atmospheric water can mimic — and detecting it requires direct imaging with phase-resolved photometry not yet available
a: Because glint occurs only at the substellar point, giving a precise surface location
x: Specular reflection is strongest at crescent phases rather than at the substellar point, which is where the diagnostic power lies.
a: Because it can be detected during transit, when the planet is between us and the star
x: A glint is reflected light from the dayside and is invisible during transit, when only the night side faces the observer.
hint: Ask how the reflected brightness of a rough surface varies with phase, and how a mirror-like surface differs.
why: A rough surface scatters diffusely, so its reflected brightness declines steadily as the illuminated fraction shrinks toward crescent phase. **A smooth liquid surface reflects specularly**, and the geometry of specular reflection concentrates light back toward the observer precisely at crescent phases — so an ocean produces a characteristic *rise* in reflected brightness where a dry planet produces a fall. The signature is geometric rather than spectroscopic, which is why it is so much cleaner than a water vapour band: atmospheric water can mimic an absorption feature but cannot reproduce a phase-dependent brightening that follows from surface smoothness. Earth's oceans produce exactly this and it has been observed from spacecraft looking back. The obstacle is that it requires **direct imaging with phase-resolved photometry** — the planet must be spatially separated from its star and its brightness tracked around the orbit, which for a reflected-light Earth analogue means a contrast of $10^{-10}$ at $0.1$ arcseconds, demonstrated in laboratory vacuum testbeds but never on sky. It therefore belongs to the same future mission that would deliver the full four-part claim.
---
q: What single development would most advance the search for Earth analogues around Sun-like stars specifically?
a: Higher-precision radial velocity instruments, to reach the $8.9$ cm s$^{-1}$ Earth signal
x: Spectrographs have already demonstrated $0.25$ m s$^{-1}$; the obstacle is stellar activity at $1$–$10$ m s$^{-1}$, which better instruments do not remove.
a*: A transit survey with a baseline long enough to accumulate several one-year transits around Sun-like stars, since that is where current $\eta_\oplus$ estimates extrapolate rather than measure
a: More sensitive infrared spectroscopy, to characterise the atmospheres of known candidates
x: Valuable, but the known temperate candidates orbit M dwarfs, so it does not address the Sun-like case.
a: Larger ground-based telescopes for high-resolution cross-correlation
x: These will transform work on nearby temperate planets but remain limited to bright, mostly low-mass hosts.
hint: Ask which part of the current $\eta_\oplus$ estimate is measurement and which is assumption.
why: The frequency of Earth analogues around Sun-like stars is uncertain by an order of magnitude, and the occurrence chapter established that the uncertainty is **methodological rather than statistical** — dominated by definitional choices, by completeness where recovery probability falls fastest, by reliability corrections for the most contaminated candidate class, and above all by **extrapolation**, since a four-year baseline yields few genuine one-year transits around Sun-like stars and most estimates extend a fitted form into that region. More short-period detections do not constrain the extrapolated territory, so more of the same data cannot settle it. What can is a survey observing a defined sample of Sun-like stars long enough to accumulate several transits at periods near a year, converting the extrapolation into a measurement. Radial velocity cannot substitute, because the Earth's $8.9$ cm s$^{-1}$ signal sits beneath stellar activity of $1$–$10$ m s$^{-1}$ — an astrophysical wall rather than an instrumental one. **The design driver for the relevant missions is therefore baseline rather than sensitivity**, which is an unusual requirement and one that follows directly from where the current uncertainty lives.
```

## 7. Pulling the thread

- **"Earth analogue" bundles four claims**, of which two are measurable, one is usually false of the objects so described, and one — an Earth-like atmosphere — has never been established for any planet.
- **The habitable zone is calculable and weak.** It scales as $\sqrt{L}$, giving $0.95$–$1.67$ AU for the Sun and $0.067$–$0.118$ AU for an M4 dwarf. **Venus and Mars both lie inside the optimistic zone and neither is habitable.**
- **The M dwarf trade is structural.** The proximity that gives a $23\times$ deeper transit and triple the geometric probability also brings tidal locking, sustained flare activity, and a pre-main-sequence phase that may desiccate the planet before the zone arrives.
- **The candidates split cleanly:** well-characterised planets orbit M dwarfs; planets around Sun-like stars are poorly characterised. No object satisfies all four claims.
- **Atmospheric existence is the prior question**, and a thermal phase curve answers it almost model-independently — the one decisive measurement close at hand.
- **Oxygen has abiotic sources**, strongest around M dwarfs, so the false positive is concentrated where the targets are. Context and disequilibrium pairs are the response.
- **The field's best recent work on biosignatures has been to find false positives**, making the criteria stricter — which is the correct direction.

The transferable idea: **a compound claim is only as strong as its weakest conjunct, and compound claims are announced on their strongest.** "Earth-like planet found" is asserted when two of four components are measured, and the two that are measured are the two that are easy. The discipline this chapter recommends is mechanical and applies far beyond astronomy: **when a phrase bundles several claims, separate them, and ask of each what was measured, what was calculated from a model, and what was assumed.** Applied here it produces an immediate and useful result — the size was measured, the zone was calculated, the host type is usually contrary to the implication, and the atmosphere was assumed. Applied elsewhere it does the same work, because the rhetorical force of a compound claim comes from the conjunct that is best supported while its truth depends on the one that is worst.

## 8. Further reading

{{book: Raymond Pierrehumbert | Principles of Planetary Climate | 2010}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Charles Cockell | Astrobiology: Understanding Life in the Universe | 2020}}

Beyond the books: Kasting, Whitmire and Reynolds' 1993 paper defining the habitable zone is worth reading in the original, since it states the assumptions more carefully than most subsequent citations of it do. On abiotic oxygen, the papers identifying the water-photodissociation and ocean-loss routes are short and their arguments are simple enough to follow completely, which makes them a good demonstration of how a biosignature criterion is tightened. Cockell is the best single treatment of habitability as a concept rather than as an orbital criterion.

## Problems

*Useful numbers: HZ scales as $\sqrt{L/L_\odot}$; conservative boundaries $0.950$–$1.670$ AU for the Sun ($338$–$788$ d), $0.190$–$0.334$ AU for an M0 dwarf at $0.04\,L_\odot$ ($43$–$100$ d), $0.067$–$0.118$ AU for an M4 dwarf at $0.005\,L_\odot$ ($14$–$33$ d); optimistic Sun boundaries $0.75$–$1.77$ AU; Venus at $0.723$ AU, Mars at $1.524$ AU; transit probability at the inner edge $0.49\%$ (Sun) against $1.45\%$ (M4); Earth-size transit depth $84$ ppm (Sun) against $1902$ ppm (M4); Earth's greenhouse offset $33$ K, Venus's over $500$ K.*

**1.** *(The four claims.)* State the four components of "Earth analogue", and for each say whether it is measured, calculated, or assumed in typical announcements.

**2.** *(Zone boundaries.)* **(a)** State the physical mechanism setting each edge. **(b)** Compute the conservative zone for a star of $0.1\,L_\odot$. **(c)** State why both edges scale as $\sqrt{L}$.

**3.** *(The weakness.)* **(a)** Give the orbital distances of Venus and Mars against the Sun's optimistic zone. **(b)** State four things habitability requires that the zone does not address. **(c)** State how the concept should properly be used.

**4.** *(The trade.)* **(a)** Compute the ratio of Earth-size transit depths for an M4 dwarf and the Sun, and check it against $R_\star^{-2}$. **(b)** Give three habitability liabilities of M dwarf hosts. **(c)** Explain why the advantages and liabilities share a single cause.

**5.** *(Pre-main-sequence.)* **(a)** Explain why a low-mass star is more luminous before the main sequence. **(b)** State the consequence for a planet in its eventual habitable zone. **(c)** Give two counter-arguments and assess them.

**6.** *(Candidates.)* For Proxima b, TRAPPIST-1 e and Kepler-452b: state what is measured and what is not, and identify the pattern across the three.

**7.** *(Establishing habitability.)* Name four separate measurements that would be required, state what each establishes, and identify which is closest to being made.

**8.** *(Oxygen.)* **(a)** Give the original argument for oxygen as a biosignature. **(b)** Name three abiotic production routes. **(c)** Explain why the strongest false positive is concentrated where the targets are, and state the two responses.

**9.** *(Method.)* **(a)** State the general principle about compound claims. **(b)** Apply it to "Earth-like planet found". **(c)** Give an example from outside astronomy.

## Worked answers

**1.** *Earth-sized* — measured, from a transit radius, subject to the inherited stellar radius. *In the habitable zone* — calculated, from stellar luminosity and orbital distance through a model assuming an Earth-like atmosphere. *Around a Sun-like star* — measured, and usually false: most such planets orbit M dwarfs. *With an Earth-like atmosphere* — assumed, and never established for any planet outside the Solar System.

**2.** **(a)** *Inner:* the runaway greenhouse, in which rising insolation evaporates water, water vapour warms the surface further, and the feedback proceeds until the oceans are lost — a threshold rather than a gradual limit. *Outer:* the maximum greenhouse, beyond which added carbon dioxide condenses and its Rayleigh scattering reflects more light than its absorption retains, so further CO$_2$ no longer warms. **(b)** $0.950\sqrt{0.1} = 0.300$ AU to $1.670\sqrt{0.1} = 0.528$ AU. **(c)** Because both are set by the incident flux, which falls as $L/a^2$; holding the flux fixed gives $a\propto\sqrt L$.

**3.** **(a)** Venus at $0.723$ AU and Mars at $1.524$ AU, against optimistic boundaries of $0.75$–$1.77$ AU — Mars comfortably inside, Venus at the edge. **(b)** Whether an atmosphere exists and of what composition; whether water was delivered and retained; whether a carbonate–silicate cycle regulates carbon dioxide over geological time, which requires plate tectonics, liquid water and volcanism together; and the planet's irradiation history, since it may have been sterilised earlier. **(c)** As a necessary but far from sufficient condition, and as a target selection tool identifying where to look — not as a conclusion about what is there.

**4.** **(a)** $1902/84 = 22.6$; check: $(1/0.21)^2 = 22.7$. ✓ **(b)** Tidal locking at these separations, giving permanent day and night sides; sustained flare activity over billions of years, eroding atmospheres and irradiating surfaces; and a prolonged luminous pre-main-sequence phase that can strip water before the habitable zone reaches the planet's orbit. **(c)** Because the habitable zone scales as $\sqrt L$ and lies at $0.067$–$0.118$ AU for an M4 dwarf, proximity is what raises transit depth, geometric probability and radial velocity amplitude — and proximity to an active low-mass star is equally what produces tidal locking, flare exposure and the pre-main-sequence irradiation.

**5.** **(a)** A pre-main-sequence star is still contracting and derives its luminosity from gravitational energy release; it is larger than its eventual main-sequence radius, so its surface area and luminosity are greater, and for a low-mass star the contraction takes hundreds of millions of years. **(b)** A planet at what will become the habitable zone spends that entire period well inside the runaway greenhouse limit, so it may lose its full water inventory before the star settles — **a planet in the habitable zone today may have been desiccated before the zone arrived.** **(c)** *Late delivery of water by impacts* — plausible, and Earth's own inventory may be partly late-delivered, but the required quantity and timing are unconstrained. *A massive planet with a high mean molecular weight atmosphere resisting escape* — physically sound, since $\lambda\propto\mu$ and the energy-limited rate goes as $1/\rho$, but it requires the heavy atmosphere to exist at the outset. Neither is established, so the concern stands.

**6.** *Proxima b:* minimum mass $1.07\,M_\oplus$ and period $11.19$ d are measured; radius, true mass and atmosphere are not, since it does not transit. *TRAPPIST-1 e:* radius, mass from timing variations and irradiation are measured; atmospheric composition is contested and consistent with a thin atmosphere or none, with the transit light source effect a live concern. *Kepler-452b:* radius and period are measured, though the radius sits near the boundary above which planets are usually not rocky; the mass is unmeasured and the validation has been questioned. *Pattern:* well-characterised planets orbit M dwarfs, and planets around Sun-like stars are poorly characterised — no object satisfies all four claims.

**7.** *Does it have an atmosphere?* Establishes whether any further question is meaningful; answered by a thermal phase curve, since an airless body cannot transport heat and shows maximal day–night contrast. **Closest to being made.** *What is the surface pressure?* Establishes whether liquid water is possible at all, since below the triple point pressure it is not; inferable from atmospheric feature shapes and thermal structure. *Is there water?* Vapour detection is within reach for favourable targets; distinguishing surface oceans requires a specular glint varying with phase, needing direct imaging precision not yet available. *Is the surface temperate?* Requires composition and structure, since the greenhouse offset — $33$ K for Earth, over $500$ K for Venus — is not calculable without them.

**8.** **(a)** On Earth oxygen is overwhelmingly biological, and without continuous replenishment weathering and volcanic gases would remove it within millions of years, so a substantial oxygen atmosphere implies ongoing production. **(b)** Water photodissociation followed by preferential hydrogen escape; carbon dioxide photodissociation with slow recombination; and retention of oxygen as the residue of an ocean lost during a luminous pre-main-sequence phase. **(c)** Because water photodissociation with hydrogen escape is most efficient under high extreme ultraviolet flux, which is characteristic of M dwarfs — the very hosts around which temperate rocky planets are detectable. *Responses:* require **context**, such as evidence against ocean loss, nitrogen indicating an atmosphere that has not undergone runaway escape, or a surface pressure inconsistent with a desiccated residue; and prefer **chemical disequilibrium pairs** such as oxygen with methane, which react rapidly and cannot coexist at detectable levels unless both are continuously replenished.

**9.** **(a)** A compound claim is only as strong as its weakest conjunct, but it is announced on its strongest — so when a phrase bundles several claims, separate them and ask of each what was measured, what was calculated from a model, and what was assumed. **(b)** Size measured; habitable zone calculated from a model with substantial assumptions; Sun-like host usually contrary to fact; Earth-like atmosphere assumed and never established. The claim's rhetorical force comes from the first, its truth from the last. **(c)** A medical result reported as "treatment reduces risk of disease" may bundle a measured reduction in a surrogate marker, an assumed link between marker and disease, an extrapolation from a trial population to a general one, and an unstated time horizon — with the announcement resting on the measured marker while the useful claim depends on the assumed link.$exEarth_master$,
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
