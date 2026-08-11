-- Astronomy & Space · Exoplanets — System Diversity — "Hot Jupiters".
-- Curated master for
-- astronomy-and-space/exoplanets/system-diversity/hot-jupiters
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the System Diversity block. Organised around two facts in
-- tension: hot Jupiters occur around only about one per cent of Sun-like
-- stars, yet they dominated the field's first decade because every
-- detection method finds them most easily - a selection effect strong
-- enough to have distorted theoretical expectations for years. And they
-- cannot have formed where they are: the isolation mass at 0.05 AU is
-- 0.007 Earth masses against the ~10 needed for runaway gas accretion,
-- and the equilibrium temperature of 1246 K forbids ices. So they
-- moved, and how they moved is the open question - with spin-orbit
-- misalignment, the loneliness of hot Jupiters relative to warm ones,
-- and the Kraft break in realignment efficiency all bearing on it.
-- Also treats radius inflation, the field's most conspicuous unsolved
-- problem, and tidal decay.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: equilibrium temperature
-- T_eq = T_star sqrt(R_star/2a)(1-A)^(1/4) giving 1246 K at 0.05 AU and
-- 1970 K at 0.02 AU for a solar analogue with zero albedo; orbital
-- period 4.08 d at 0.05 AU and 1.03 d at 0.02 AU; Roche limit for a
-- Jupiter-density body around the Sun at 0.0116 AU; isolation mass
-- M_iso = [2 pi b a^2 Sigma/(3 M_star)^(1/3)]^(3/2) giving 0.0071
-- Earth masses at 0.05 AU with a rock-only MMSN, 0.067 at 1 AU, and
-- 2.05 at 5.2 AU with the ice enhancement - a ratio of 289 between the
-- outer and inner values.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/system-diversity/hot-jupiters',
    'research',
    'advanced',
    'read',
    $exHJ_master$> Hot Jupiters orbit about **one per cent** of Sun-like stars. They are among the rarest classes of planet known.

For the first decade of exoplanet science they were nearly all anyone found, and the theoretical literature reorganised itself around them.

**This is the cleanest case in the field of a selection effect distorting a science.** Every detection method finds hot Jupiters most easily: their transit probability is $9\%$ against $0.47\%$ for an Earth analogue, their radial velocity amplitude is tens of metres per second against centimetres, their periods are days rather than years so many cycles accumulate in a single observing season. A population comprising one per cent of systems supplied the great majority of early detections, and the resulting picture of "typical" planetary systems was wrong in a way that took a decade to correct.

The second fact about them is that **they cannot have formed where they are**, and the argument is quantitative rather than impressionistic. Something moved them, and after thirty years the mechanism is still contested.

## 1. What they are

A hot Jupiter is a giant planet — Saturn mass or above — with an orbital period below about ten days, hence a semi-major axis under roughly $0.1$ AU. For a solar analogue:

| $a$ | Period | $T_{\rm eq}$ ($A=0$) | $T_{\rm eq}$ ($A=0.3$) |
|---|---|---|---|
| $0.02$ AU | $1.03$ d | $1970$ K | $1802$ K |
| $0.03$ AU | $1.90$ d | $1609$ K | $1471$ K |
| $0.05$ AU | $4.08$ d | $1246$ K | $1140$ K |
| $0.10$ AU | $11.5$ d | $881$ K | $806$ K |

using $T_{\rm eq} = T_\star\sqrt{R_\star/2a}\,(1-A)^{1/4}$.

Three consequences follow immediately from those temperatures and separations.

**They are tidally locked.** Tidal despinning timescales at these separations are short compared with stellar ages, so one hemisphere faces the star permanently. This makes them the only planets whose atmospheric circulation is driven by a fixed, extreme, hemispheric heating contrast — and, as the transit chapter noted, phase curves reveal the resulting superrotating equatorial jets.

**They are close to destruction.** The Roche limit for a Jupiter-density body around the Sun is $0.0116$ AU. The shortest-period hot Jupiters, at $0.02$ AU, sit within a factor of two of tidal disruption.

**They are hot enough to have no ices, and hot enough for exotic chemistry.** At $1246$ K, water is vapour, refractory species such as titanium oxide and vanadium oxide can remain gaseous, and at the extreme end above $2000$ K even rock vaporises. Their atmospheres are not versions of Jupiter's.

## 2. Why they cannot have formed in place

The classical argument is about how much material is locally available, and it is worth doing numerically because the numbers are decisive.

Core accretion requires a solid core of roughly $10\,M_\oplus$ before runaway gas accretion begins. The mass a growing core can gather from its own feeding zone — the **isolation mass** — follows from the local solid surface density and the width of the zone it can reach, of order ten Hill radii:

$$M_{\rm iso} = \left[\frac{2\pi b\,a^2\Sigma}{(3M_\star)^{1/3}}\right]^{3/2}.$$

Evaluated in the minimum-mass solar nebula, with the standard factor-of-four enhancement in solids beyond the snow line:

| Location | $M_{\rm iso}$ |
|---|---|
| $0.05$ AU (rock only) | $0.0071\,M_\oplus$ |
| $1$ AU (rock only) | $0.067\,M_\oplus$ |
| $3$ AU (with ice) | $1.35\,M_\oplus$ |
| $5.2$ AU (with ice) | $2.05\,M_\oplus$ |

**The isolation mass at $0.05$ AU is smaller than at $5.2$ AU by a factor of $289$**, and it falls short of the required core mass by more than three orders of magnitude. The reason the inner disc loses despite its far higher surface density is that the feeding zone scales with the Hill radius, which is proportional to $a$ — so the *area* a core can reach shrinks as $a^2$, faster than $\Sigma$ rises as $a^{-3/2}$.

Two further obstacles compound it. At $1246$ K there are **no ices**, so the solid inventory is the refractory component only, without the factor-of-four boost that makes the outer disc productive. And the gas at these radii is the first to be lost to accretion onto the star and to photoevaporation, so the window for gathering an envelope is short.

**The conclusion is that a Jupiter cannot be assembled at $0.05$ AU by the standard route.** It therefore formed further out and arrived.

**One honest qualification.** In-situ formation has been revived by proposals in which solids drift inward and pile up, raising the local surface density far above the minimum-mass nebula value. This is a minority position, but it is not fringe, and it makes distinguishable predictions — principally that in-situ hot Jupiters should retain nearby low-mass companions, whereas dynamically delivered ones should not.

```checkpoint
q: Hot Jupiters occur around about $1\%$ of Sun-like stars, yet dominated early exoplanet catalogues. What is the correct account?
a: Early surveys targeted stars likely to host them, biasing the sample
x: Surveys targeted bright Sun-like stars without any prior expectation of hot Jupiters — nobody expected them at all.
a*: Every detection method finds them most easily — high transit probability, large radial velocity amplitude, short period — so a rare population supplied most detections and distorted the field's picture of typical systems
a: Hot Jupiters were more common in the past and their numbers have since declined
x: The population is not evolving on the timescale of the surveys; the change is in what could be detected, not in what exists.
a: The early catalogues were contaminated by false positives that were later removed
x: The early hot Jupiter detections were overwhelmingly genuine; the problem was their representativeness, not their reality.
hint: Compare a hot Jupiter's transit probability and radial velocity amplitude with those of an Earth analogue.
why: A hot Jupiter at $0.05$ AU has a transit probability of $9.3\%$ against $0.47\%$ for an Earth analogue, a radial velocity semi-amplitude of tens of metres per second against $8.9$ cm s$^{-1}$, and a period of days rather than years so many cycles accumulate in a single season. Each of those advantages is large, and they multiply. The result was that a class comprising about one per cent of systems supplied the great majority of detections for a decade, and theoretical work reorganised itself around explaining an object that is in fact unusual. **This is the field's cleanest example of a selection effect distorting a science**, and the correction took years — it required Kepler's uniform survey with a calculable completeness before the actual demographics became visible. The general lesson is that the first objects found by a new technique are the easiest ones, not the commonest, and that the gap between those two things can be two orders of magnitude. Any inference about a population drawn before the selection function is understood is an inference about the instrument.
---
q: Why can a Jupiter-mass planet not assemble at $0.05$ AU by core accretion, despite the high local solid surface density there?
a: Because the disc's gas is too hot to be captured by a core at that radius
x: Envelope capture is harder in hot gas, but the binding problem is the core: there is not enough solid material to build one.
a*: Because the feeding zone scales with the Hill radius, which is proportional to $a$, so the accessible area shrinks as $a^2$ faster than $\Sigma$ rises as $a^{-3/2}$ — the isolation mass is $0.007\,M_\oplus$ against the $\sim10$ required
a: Because the orbital period is too short for accretion to proceed
x: Short periods mean *more* orbits and hence more collisions per unit time, which if anything speeds accretion.
a: Because tidal forces from the star disrupt any object that forms there
x: The Roche limit is at $0.0116$ AU, well inside $0.05$ AU, so tidal disruption is not the obstacle.
hint: Ask how much material a growing core can reach, not how much material is present per unit area.
why: Surface density rises steeply inward as $\Sigma\\propto a^{-3/2}$, so the inner disc is materially rich per unit area. But a growing core can only accrete what lies within its feeding zone, whose width is a few Hill radii and therefore proportional to $a$. The accessible mass is $\\sim2\\pi a\\cdot(b R_H)\\cdot\\Sigma$, and since $R_H\\propto a$ this scales as $a^2\\Sigma \\propto a^{1/2}$ — **shrinking inward despite the rising density**. Evaluating the isolation mass in the minimum-mass solar nebula gives $0.0071\\,M_\\oplus$ at $0.05$ AU against $2.05\\,M_\\oplus$ at $5.2$ AU with the ice enhancement, a ratio of $289$, and both fall short of the $\\sim10\\,M_\\oplus$ needed to trigger runaway gas accretion — which is why the outer disc, where planetesimal drift and a wider feeding zone help, is where cores actually assemble. Two effects compound the inner deficit: at $1246$ K there are no ices, so the solid inventory lacks the factor-of-four boost available beyond the snow line, and the innermost gas is the first lost to stellar accretion and photoevaporation. The conclusion is that hot Jupiters formed elsewhere and arrived — although in-situ formation remains a live minority position if inward drift of solids is invoked to raise the local density far above nebula values.
```

## 3. How they arrived: three mechanisms

### 3.1 Disc migration

A planet massive enough to open a gap in the gas disc becomes locked to the disc's viscous evolution and drifts inward with it — Type II migration. The mechanism is well founded theoretically and operates on timescales comfortably shorter than disc lifetimes.

**Its signature is alignment.** The disc shares the star's angular momentum direction, so a planet that formed in the disc and migrated within it should end on a low-eccentricity orbit in the stellar equatorial plane.

**Its difficulty is stopping.** Nothing in the mechanism naturally halts migration at $0.05$ AU; a planet that starts drifting inward tends to continue until it reaches the disc's inner edge or the star. Proposed stopping mechanisms — the magnetospheric cavity truncating the disc, tidal interaction with the star, the disappearance of the gas — all work in principle and none is clearly the answer.

### 3.2 High-eccentricity migration

An alternative delivers the planet on a highly eccentric orbit whose periastron is already close to the star, after which tidal dissipation circularises it at roughly twice the periastron distance.

Two routes excite the eccentricity. **Planet–planet scattering**: several giants form, interact gravitationally, one is ejected or driven inward, the survivors are left eccentric. **Kozai–Lidov oscillations**: a distant companion, stellar or planetary, on an inclined orbit drives cyclic exchange between the inner planet's eccentricity and inclination, periodically driving the eccentricity very high.

**Its signature is misalignment.** Both routes tilt the orbit arbitrarily, so the final spin–orbit angle should be broadly distributed, including polar and retrograde configurations.

**Its difficulty is efficiency and timing.** The mechanism requires either a suitable companion or a dynamically unstable multi-giant system, and tidal circularisation from a highly eccentric orbit takes a long time — so the process should leave observable intermediates on eccentric, not-yet-circularised orbits, and their numbers are a test.

### 3.3 In-situ formation

Discussed above: possible if the inner disc's solid surface density is greatly enhanced over nebula values by inward drift. Predicts nearby companions and alignment.

## 4. The evidence, and what it does and does not settle

### 4.1 Spin–orbit angles

The Rossiter–McLaughlin effect measures the sky-projected angle between a planet's orbit and its star's spin. The result is that **a substantial fraction of hot Jupiters are misaligned**, including polar and retrograde cases.

Taken alone this appears to settle the question for dynamical delivery. It does not, because of a complication that is itself informative.

**The Kraft break.** Stars hotter than about $6250$ K have thin or absent convective envelopes; cooler stars have deep ones. Tidal interaction between a close planet and a star with a convective envelope is far more efficient, so a cool star can **realign** its own spin with a planet's orbit over time, erasing the evidence of a misaligned arrival.

And this is what is observed: **hot Jupiters around stars hotter than the Kraft break are frequently misaligned; those around cooler stars are usually aligned.** The natural reading is that many or most arrive misaligned, and the cool stars subsequently tidally realign.

**The honest position:** the misalignment distribution shows that high-eccentricity migration operates and is common. It does not show that disc migration never operates, because an aligned system is consistent with either a disc origin or a realigned dynamical one. The observable has a memory that erases itself in exactly the systems where it would be most diagnostic.

### 4.2 Loneliness

Hot Jupiters are conspicuously **alone**. Searches for additional transiting planets in hot Jupiter systems, and for transit timing variations indicating unseen companions, find very few — in sharp contrast to warm Jupiters at longer periods, which frequently have nearby companions.

This is a strong argument for dynamical delivery: a giant planet arriving by scattering or Kozai–Lidov migration would destabilise or eject anything in the inner system on its way, whereas smooth disc migration and in-situ formation should both leave companions in place.

**It is arguably the cleanest evidence available**, because it does not depend on a tidal erasure process the way the alignment argument does.

### 4.3 The metallicity correlation

Giant planet occurrence rises steeply with host metallicity — a relation established early and robust since. Hot Jupiters follow it.

This is evidence for **core accretion** over gravitational instability as the formation route for giants generally, since core accretion needs solids and gravitational instability does not care about metallicity. It says nothing directly about how the planet got to $0.05$ AU, but it constrains where it started.

{{image: Hot Jupiter | A giant planet on an orbit of a few days, close enough to its star that it is tidally locked, heated to well over a thousand kelvin, and in the shortest-period cases within a factor of two of the distance at which tidal forces would disrupt it. Such planets occur around only about one per cent of Sun-like stars, but every detection method finds them more easily than anything else, so they supplied the great majority of the first decade's discoveries and shaped expectations accordingly. They cannot have formed where they are found — the mass a growing core can gather at that separation falls three orders of magnitude short of what runaway gas accretion requires — so they arrived from further out, by a mechanism still contested.}}

```checkpoint
q: Hot Jupiters around stars hotter than $6250$ K are often misaligned, while those around cooler stars are usually aligned. What is the standard interpretation?
a: Hot stars form planets by a different mechanism than cool stars
x: No formation mechanism is known to depend on stellar effective temperature in the way this pattern would require.
a*: Most arrive misaligned, and cool stars — which have deep convective envelopes and therefore efficient tides — subsequently realign their own spin with the planet's orbit, erasing the evidence
a: Hot stars rotate faster, so their spin axes are harder to measure accurately
x: Rapid rotation actually makes the Rossiter–McLaughlin signal larger and easier to measure, not harder.
a: Misalignment is caused by the star's radiation field, which is stronger for hotter stars
x: Radiation exerts no torque capable of tilting an orbit; the angle is set dynamically.
hint: The dividing temperature marks a change in stellar internal structure. Ask what that change does to tidal dissipation.
why: The $6250$ K boundary is the **Kraft break**: hotter stars have thin or absent convective envelopes, cooler ones have deep convective zones. Tidal dissipation in a convective envelope is far more efficient, so a close-in planet can torque a cool star's spin into alignment with its own orbit over the system's lifetime, whereas a hot star retains whatever orientation it started with. The observed pattern therefore reads as: **many hot Jupiters arrive misaligned, and the cool hosts erase the record.** That supports high-eccentricity migration — planet–planet scattering or Kozai–Lidov cycles followed by tidal circularisation — as a common delivery route, since disc migration should leave orbits in the stellar equatorial plane. But it does not exclude disc migration, because an aligned system is consistent with either a disc origin or a realigned dynamical one. The observable has a memory that erases itself precisely where it would be most diagnostic, which is why the loneliness of hot Jupiters — their conspicuous lack of nearby companions, unlike warm Jupiters — is arguably the cleaner argument.
---
q: Why is the absence of nearby companions to hot Jupiters stronger evidence for dynamical delivery than the misalignment distribution?
a: Because it is measured for more systems, giving better statistics
x: Both are measured for substantial samples; the difference is in the logic, not the sample size.
a*: Because no known process erases companions after arrival, whereas tidal realignment demonstrably erases misalignment in cool systems
a: Because companions are easier to detect than spin–orbit angles
x: Detecting the absence of small companions requires careful sensitivity analysis and is not obviously easier.
a: Because misalignment can be produced by processes unrelated to migration
x: Primordial disc misalignment is possible, but the decisive weakness of the alignment argument is erasure rather than alternative causes.
hint: Ask, for each observable, whether a system that once had the diagnostic property could have lost it.
why: The two arguments differ in whether the evidence survives. **Misalignment is erasable**: a cool star with a deep convective envelope tidally realigns its spin with the planet's orbit over gigayears, so an aligned cool system is consistent with a dynamical arrival as well as a disc origin — the diagnostic disappears exactly where it would matter most. **Companion absence is not erasable in the same way**: a giant delivered by scattering or Kozai–Lidov migration crosses the inner system on a highly eccentric orbit and destabilises or ejects anything there, and once ejected, companions do not return. Smooth disc migration and in-situ formation should both leave inner companions in place, and warm Jupiters at longer periods do frequently have them — which supplies the control sample. The contrast between lonely hot Jupiters and companion-rich warm Jupiters is therefore a difference that the delivery mechanism can explain and that no post-arrival process can manufacture. **When two observables bear on the same question, prefer the one that cannot be reset**, and check explicitly whether the other has a memory that decays.
```

{{image: Rossiter–McLaughlin effect | The anomalous radial velocity signal produced when a planet transits a rotating star, occulting first the approaching stellar limb and then the receding one and so removing light from one side of the rotationally broadened line profile at a time. The shape of the anomaly reveals the sky-projected angle between the planet's orbital plane and the star's spin axis, which for a planet that formed in and migrated through a disc should be near zero. A substantial fraction of hot Jupiters are found misaligned, including polar and retrograde cases, which points to a dynamical delivery route — though the diagnostic decays, since stars cooler than about six thousand two hundred and fifty kelvin have deep convective envelopes and can tidally realign their own spin over gigayears.}}

## 5. Radius inflation

The most conspicuous unsolved problem about these objects, and a good example of a discrepancy that has resisted a decade of proposals.

**The observation.** Many hot Jupiters have radii substantially larger than structure models predict for their mass, age and composition — up to $1.8$–$2.0\,R_{\rm J}$ where models give $1.0$–$1.2$. The excess correlates strongly with **incident stellar flux**, with inflation setting in above roughly $2\times10^8$ erg cm$^{-2}$ s$^{-1}$, corresponding to equilibrium temperatures above about $1000$ K.

**Why it is a problem.** A planet's radius is set by the balance between gravity and internal pressure, and pressure requires heat. An old planet should have cooled and contracted. Simply heating the *atmosphere* does not work: the outer layers reach equilibrium with the irradiation and the interior continues to cool underneath, so irradiation alone slows contraction but does not reverse it. **Energy must be deposited deep**, into the convective interior, and the required rate is of order $1\%$ of the incident stellar flux.

**Candidate mechanisms.**

*Ohmic dissipation.* The hot atmosphere is partially ionised, winds carry that plasma across the planet's magnetic field, and the resulting currents dissipate resistively at depth. This naturally reproduces the flux threshold, since ionisation becomes appreciable only above about $1000$ K — which is the strongest point in its favour. Its difficulty is the depth at which the energy is deposited, which depends on the interior's conductivity profile.

*Tidal heating.* Dissipation of orbital or rotational energy inside the planet. It works if the orbit is eccentric or the planet is not fully synchronised, but most hot Jupiters have circularised, and maintaining the eccentricity requires an unseen perturber that the loneliness result argues against.

*Enhanced opacity or downward transport.* If the deep atmosphere is more opaque than assumed, or if circulation carries heat downward, cooling slows enough to keep the planet large. Plausible but hard to make quantitative.

**A discriminating observation exists.** Planets around evolving stars whose luminosity is rising should re-inflate if the mechanism deposits energy continuously, but not if the inflation is a relic of formation. Such re-inflated planets appear to exist, which favours ongoing deposition. **The problem is not solved**, and it is worth flagging as a case where the observational signature is well characterised, several mechanisms are physically reasonable, and no decisive test has yet separated them.

## 6. What hot Jupiters taught the field

Before the fate section, it is worth recording what the class contributed beyond its own puzzles, because the answer is out of proportion to its abundance.

**They established that planetary systems need not resemble the Solar System**, which sounds obvious now and was not in 1995. Every formation model of the time produced giants beyond the snow line and left them there; none predicted an object at $0.05$ AU. The discovery forced migration into the centre of planet formation theory, where it has remained.

**They made atmospheric characterisation possible at all.** A transiting hot Jupiter has a large atmospheric scale height — being hot, low in mean molecular weight and low in surface gravity for its mass — so its transmission signal is the largest available. Every technique in the spectroscopy chapter was developed on hot Jupiters first, and the extension to smaller and cooler planets has been an exercise in pushing methods proven on the easy case.

**They provided the first measurements of exoplanet weather.** Phase curves, day–night contrasts, superrotating jets, thermal inversions and atmospheric escape were all first measured on these objects, for the same reason.

**And they demonstrated that a strong selection effect can persist for a decade in a field that knows about selection effects.** The distortion was not caused by anyone forgetting that hot Jupiters are easy to find; it was caused by the sample being the only sample, so that every question about "planets" was necessarily answered with data about hot Jupiters. **A known bias is not a corrected bias**, and correcting this one required a different survey rather than a different analysis.

```checkpoint
q: Hot Jupiters supplied the first measurements of exoplanet atmospheres. What property makes them so much easier than other planets?
a: Their large radius, which increases the transit depth
x: A larger radius does deepen the transit, but the atmospheric signal depends on the annulus of atmosphere, not on the planet's disc.
a*: A large atmospheric scale height — high temperature, low mean molecular weight and modest surface gravity — which makes the atmosphere a thick annulus during transit
a: Their proximity to the star, which illuminates the atmosphere more brightly
x: Brighter illumination helps emission measurements but does not enlarge the transmission signal, which depends on the atmosphere's geometric extent.
a: Their short orbital periods, allowing many transits to be co-added
x: This helps in practice by accumulating signal, but it does not change the per-transit signal amplitude, which is what makes the class distinctive.
hint: The transmission signal depends on how thick a ring of atmosphere the starlight passes through. What sets that thickness?
why: The atmospheric scale height is $H = kT/\mu g$, and a hot Jupiter maximises it on all three counts: temperatures above $1200$ K, a hydrogen-dominated atmosphere with low mean molecular weight, and a surface gravity that is modest for the mass because the radius is large. The transmission signal during transit scales as the additional area blocked by that annulus, roughly $2R_pH/R_\star^2$, so a large $H$ on a large planet against a Sun-sized star gives the biggest signal available anywhere. **Every technique used for exoplanet atmospheres was developed on hot Jupiters first** — transmission spectroscopy, secondary eclipses, phase curves, thermal inversions, escape — and their extension to smaller and cooler planets has been an exercise in pushing methods proven on the easy case toward signals ten to a hundred times smaller. This is worth noting because it cuts against the chapter's main theme: the same properties that made hot Jupiters unrepresentative made them the necessary training ground, and a field that had waited for representative targets would have developed no techniques at all.
---
q: The hot Jupiter selection effect persisted for a decade in a field fully aware that hot Jupiters are easy to detect. What does this indicate?
a: That the astronomers involved were insufficiently careful about statistics
x: The bias was widely acknowledged in print throughout; awareness was not the missing ingredient.
a*: That knowing about a bias does not correct it — with only one kind of sample available, every question about planets was necessarily answered with data about hot Jupiters
a: That selection effects cannot be corrected without complete samples
x: They can be corrected given a calculable selection function, which is exactly what a uniform survey later supplied.
a: That theoretical work should have ignored the observations until better data arrived
x: Theory responding to the only available data was reasonable; migration was a genuine advance forced by real observations.
hint: Ask what a correction requires beyond the knowledge that a bias exists.
why: Correcting a selection effect requires a calculable detection probability applied to a sample drawn under a known and uniform procedure. Neither existed in the first decade: detections came from heterogeneous surveys with different targets, cadences and thresholds, so the denominator could not be constructed. **Awareness of the bias was universal and useless**, because the alternative to reasoning from hot Jupiters was reasoning from nothing. What resolved it was not better analysis but a different instrument — a survey observing a defined stellar sample continuously with a threshold that could be characterised by injecting synthetic signals and measuring recovery. The general lesson is that **a known bias is not a corrected bias**, and that the remedy for a sample selected by convenience is usually a new sampling procedure rather than a cleverer treatment of the old data. The same structure recurs wherever a field's early results come from whatever was easiest to observe, which is nearly always.
```

## 7. Fate

Tidal interaction transfers angular momentum between the planet's orbit and the star's spin. For a hot Jupiter orbiting faster than its star rotates — the usual case — the transfer removes orbital angular momentum, and the orbit decays.

**The decay has been measured.** For at least one system, transit timings have drifted over a decade in a manner consistent with orbital decay on a timescale of a few million years, implying the planet will be tidally disrupted or engulfed within that time. The measurement is a direct determination of tidal dissipation efficiency inside a star, a quantity otherwise inferred only indirectly.

The implication is that **the hot Jupiter population is not static**: planets are being destroyed, and the observed occurrence rate reflects a balance between delivery and destruction. Some fraction of stars that show no hot Jupiter today may have consumed one, and there is tentative evidence for this in stellar compositions and rotation rates — a star that has swallowed a giant should be enriched in refractory elements and spun up.

```checkpoint
q: Why does intense stellar irradiation alone fail to explain inflated hot Jupiter radii?
a: Because the incident flux is too small to affect a planet of that mass
x: The flux is enormous — these planets receive thousands of times Earth's insolation — so the difficulty is where the energy goes, not how much there is.
a*: Because irradiation heats the outer layers to equilibrium while the interior continues to cool underneath, slowing contraction but not reversing it — energy must reach the convective interior
a: Because the planets reflect most of the incident radiation
x: Measured albedos for hot Jupiters are generally low, so most of the incident energy is absorbed.
a: Because the irradiation is only on the dayside, halving its effect
x: Tidally locked planets do have a permanent dayside, but circulation redistributes heat and the factor involved is of order unity, not the orders of magnitude required.
hint: Ask what sets a planet's radius, and which part of the planet has to be kept hot to keep it large.
why: A planet's radius is set by the balance between gravity and internal pressure, and pressure requires internal heat, so a planet's contraction over time is governed by how fast its **interior** cools. Irradiation heats the outer atmosphere until it reaches equilibrium, after which those layers are neither gaining nor losing net energy — but the interior below continues to radiate its heat outward through them. The effect is to slow contraction by raising the temperature at the radiative–convective boundary, not to halt or reverse it, and quantitatively it falls short of the observed inflation. What is required is energy deposited **into the convective interior**, at a rate of order one per cent of the incident stellar flux. The leading candidate is ohmic dissipation: above about $1000$ K the atmosphere becomes partially ionised, winds drag that plasma across the planet's magnetic field, and the induced currents dissipate resistively at depth — which naturally reproduces the observed onset threshold, since the ionisation fraction is what switches on. Tidal heating requires an eccentricity that most circularised hot Jupiters lack, and enhanced deep opacity is plausible but hard to quantify. Re-inflation of planets around stars whose luminosity is rising favours continuous deposition over a formation relic, but the problem is unsolved.
---
q: Transit timings for at least one hot Jupiter show orbital decay on a timescale of a few million years. What does this imply for the population?
a: That hot Jupiters are a recent phenomenon, formed within the last few million years
x: The host stars are gigayears old and the planets formed with them; only the final infall is rapid.
a*: That the population is in a steady state between delivery and destruction, so the observed occurrence rate is not simply the formation rate
a: That the decay measurement must be in error, since a few million years is implausibly short
x: The measurement is a direct drift in transit times accumulated over a decade and has been confirmed; short remaining lifetimes are expected once decay becomes rapid.
a: That tidal theory is wrong, since it predicts much slower decay
x: The measurement constrains the stellar dissipation efficiency, which was previously poorly known — it calibrates the theory rather than refuting it.
hint: If members of a population are being destroyed, what does the observed number represent?
why: Tides transfer angular momentum between the planet's orbit and the star's spin, and a planet orbiting faster than its host rotates — the usual configuration — loses orbital angular momentum and spirals in, with the decay accelerating as it approaches. A measured decay timescale of a few million years means that particular planet is near the end of its life, and that others have already ended theirs. **The observed occurrence rate of about one per cent is therefore a steady-state balance between arrival and destruction, not a cumulative formation rate**, and the true fraction of stars that have ever hosted a hot Jupiter is higher. Two testable consequences follow: a star that has swallowed a giant should be enriched in refractory elements, since the planet's rocky core is dissolved into the convective envelope, and it should be spun up by the transferred angular momentum. Tentative evidence for both exists. The measurement also has independent value: it determines the tidal dissipation efficiency inside a star, a quantity otherwise constrained only indirectly, by watching a system dissipate in real time.
```

```checkpoint
q: Giant planet occurrence rises steeply with host star metallicity. What does this establish, and what does it not?
a: That hot Jupiters migrate more efficiently around metal-rich stars
x: Migration efficiency depends on disc gas properties rather than on the solid content that metallicity tracks; the correlation bears on formation, not delivery.
a*: That giants form by core accretion rather than gravitational instability — but it says nothing about how they reached their present orbits
a: That metal-rich stars have more massive discs overall
x: Disc mass scales with stellar mass rather than metallicity, and the correlation is specifically with the solid fraction.
a: That the correlation is a selection effect, since metal-rich stars have more spectral lines and give better radial velocities
x: The effect is real and survives correction for measurement precision, and it is not present for small planets, which rules out a purely instrumental cause.
hint: Ask which formation mechanism requires solids and which does not.
why: Core accretion builds a solid core of roughly $10\,M_\oplus$ before runaway gas accretion begins, so it depends directly on how much condensable material the disc contained — which is what metallicity measures. Gravitational instability, in which a massive disc fragments directly into bound clumps, depends on gas mass and cooling rate and is largely indifferent to metallicity. **The steep rise of giant planet frequency with host metallicity is therefore evidence for core accretion as the dominant channel for giants**, and it is strengthened by the fact that the correlation is weak or absent for small planets, which core accretion can build even from a modest solid inventory. What the correlation does not address is delivery: it constrains where and how the planet was assembled, not how it arrived at $0.05$ AU. That distinction matters because the two questions are often run together — a metal-rich star is more likely to have made a giant at all, which raises the chance it has a hot Jupiter, without implying anything about migration. Keeping formation and delivery separate is necessary throughout this block, since the observational signatures of each are different and only some are erasable.
---
q: Which single observation would most decisively distinguish in-situ formation of hot Jupiters from dynamical delivery?
a: A precise measurement of the planet's spin-orbit angle
x: Informative but not decisive, since a cool host can tidally realign and erase a misaligned arrival — the diagnostic decays.
a*: A systematic search for low-mass companions in hot Jupiter systems, since in-situ formation and disc migration leave them while high-eccentricity migration ejects them
a: A measurement of the planet's bulk composition from its radius and mass
x: Composition constrains where the envelope's gas was gathered but is largely insensitive to how far the planet subsequently moved.
a: A determination of the host star's metallicity
x: Metallicity bears on whether a giant formed at all, not on where it ended up.
hint: Ask which observable differs between the mechanisms and is not erased by any later process.
why: The three delivery routes make different predictions about what survives in the inner system. **High-eccentricity migration** sends the giant repeatedly through the inner region on a highly eccentric orbit, destabilising or ejecting anything there, so the system should end up lonely. **Disc migration** and **in-situ formation** both leave the inner system intact, so nearby low-mass companions should persist. The prediction is testable by searching for additional transiting planets and for transit timing variations, and the comparison sample already exists: warm Jupiters at longer periods, which frequently do have companions. Crucially, **no process restores an ejected planet**, so unlike spin–orbit alignment this diagnostic cannot be reset — which is what makes it decisive where the alignment statistics are merely suggestive. The result so far is that hot Jupiters are conspicuously lonely while warm Jupiters are not, favouring dynamical delivery for most of the hot population, and the remaining work is quantitative: establishing how deep the non-detections go, since a null result is only as strong as the sensitivity behind it.
```

## 8. Pulling the thread

- **They are rare and dominated the field anyway.** About $1\%$ of Sun-like stars, but a $9.3\%$ transit probability, tens of m s$^{-1}$ in radial velocity and multi-day periods made them the great majority of early detections — the cleanest case of a selection effect distorting a science.
- **They cannot have formed in place.** The isolation mass at $0.05$ AU is $0.0071\,M_\oplus$ against the $\sim10$ needed for runaway accretion, because the feeding zone shrinks as $a^2$ faster than $\Sigma$ rises as $a^{-3/2}$, and there are no ices at $1246$ K.
- **Three delivery routes**, each with a signature: disc migration predicts alignment and struggles to stop; high-eccentricity migration predicts misalignment and needs a perturber; in-situ formation needs an enhanced inner disc and predicts companions.
- **Misalignment is common but erasable.** The Kraft break at $6250$ K separates stars that can tidally realign from those that cannot, and the observed pattern implies many arrive misaligned with cool hosts hiding it.
- **Loneliness is the cleaner argument**, because no process restores ejected companions — and warm Jupiters, which do have companions, supply the control.
- **Radius inflation is unsolved.** Energy of order $1\%$ of the incident flux must reach the convective interior; ohmic dissipation reproduces the $1000$ K threshold naturally but is not established.
- **The population is in steady state.** Measured orbital decay on million-year timescales means hot Jupiters are being destroyed, so occurrence is a balance rather than a total.

The transferable idea: **prefer the evidence that cannot be reset.** Two observables bear on how hot Jupiters arrived — spin–orbit angle and the presence of companions — and they point the same way, but they are not equally strong. Misalignment decays: cool stars realign, so an aligned system tells you nothing about its history, and the diagnostic vanishes exactly where the sample is largest. Companion absence does not decay, because ejected planets do not come back. **A property with a memory that erases itself is a weak witness however clean the physics**, and the discipline is to ask, of any diagnostic, whether a system possessing the property earlier could have lost it since. This question separates good evidence from merely suggestive evidence across the sciences — in phylogenetics, where rapidly evolving characters saturate; in geology, where thermal histories reset radiometric clocks; and here, where a tidal torque quietly deletes the record of a planet's arrival.

## 9. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Sara Seager | Exoplanets | 2010}}

{{book: Philip Armitage | Astrophysics of Planet Formation | 2020}}

Beyond the books: Armitage is the clearest treatment of migration mechanisms and of why stopping is harder than starting. Winn and Fabrycky's review of exoplanet system architectures is the best single account of what the spin–orbit and companion statistics establish, and is careful about the erasure problem. On radius inflation, comparing a paper advocating ohmic dissipation with one advocating a purely atmospheric explanation is more informative than either alone, since the disagreement is about where energy must be deposited rather than about the observations.

## Problems

*Useful numbers: $T_{\rm eq} = T_\star\sqrt{R_\star/2a}(1-A)^{1/4}$; for a solar analogue, $T_{\rm eq} = 1246$ K at $0.05$ AU and $1970$ K at $0.02$ AU with $A=0$; $P = 4.08$ d at $0.05$ AU; Roche limit $0.0116$ AU for Jupiter density; $M_{\rm iso} = [2\pi b a^2\Sigma/(3M_\star)^{1/3}]^{3/2}$, giving $0.0071\,M_\oplus$ at $0.05$ AU and $2.05\,M_\oplus$ at $5.2$ AU; runaway accretion needs $\sim10\,M_\oplus$; Kraft break $6250$ K; hot Jupiter occurrence $\sim1\%$; transit probability $9.3\%$ at $0.05$ AU.*

**1.** *(Selection.)* **(a)** Give the transit probability and approximate radial velocity amplitude for a hot Jupiter and for an Earth analogue. **(b)** Explain how a $1\%$ population came to dominate early catalogues. **(c)** State the general lesson about the first objects a new technique finds.

**2.** *(Temperature.)* **(a)** Compute $T_{\rm eq}$ at $0.03$ AU for a solar analogue with $A = 0.3$. **(b)** State three physical consequences of temperatures in this range. **(c)** Explain why "a Jupiter moved inward" is a poor description of the resulting object.

**3.** *(Isolation mass.)* **(a)** State why the feeding zone width scales with $a$. **(b)** Show that the accessible mass scales as $a^{1/2}$ in the minimum-mass nebula and explain why the inner disc loses despite its higher $\Sigma$. **(c)** State the two further obstacles to in-situ formation.

**4.** *(Mechanisms.)* For disc migration, high-eccentricity migration and in-situ formation: state the predicted spin–orbit alignment, the predicted presence of nearby companions, and the principal difficulty of each.

**5.** *(The Kraft break.)* **(a)** State what changes at $6250$ K. **(b)** Explain why it affects the interpretation of spin–orbit angles. **(c)** State what the observed pattern implies and what it does not exclude.

**6.** *(Loneliness.)* **(a)** State the observation and the control sample. **(b)** Explain why it favours dynamical delivery. **(c)** Explain why it is stronger evidence than misalignment.

**7.** *(Inflation.)* **(a)** State the observation and the correlation. **(b)** Explain why atmospheric heating alone fails. **(c)** State the energy requirement and the leading mechanism, with the reason it is favoured.

**8.** *(Decay.)* **(a)** Explain the direction of angular momentum transfer for a hot Jupiter orbiting faster than its host rotates. **(b)** State what a measured decay timescale of a few million years implies for the population. **(c)** Give two observable consequences for stars that have consumed a giant.

**9.** *(Method.)* **(a)** State the general principle about evidence that this chapter's comparison of alignment and companion statistics illustrates. **(b)** Apply it to one other diagnostic in exoplanet science. **(c)** Give an example from a different field.

## Worked answers

**1.** **(a)** Hot Jupiter at $0.05$ AU: $P_{\rm tr} = R_\star/a = 9.3\%$; $K$ of order $50$ m s$^{-1}$. Earth analogue: $P_{\rm tr} = 0.47\%$, $K = 8.9$ cm s$^{-1}$. **(b)** Each advantage is large — a factor of $20$ in transit probability, nearly $600$ in radial velocity amplitude, plus short periods giving many cycles per season — and they multiply, so a class comprising $1\%$ of systems supplied the great majority of detections until a survey with calculable completeness existed. **(c)** The first objects a new technique finds are the *easiest*, not the commonest, and the gap between those can be two orders of magnitude; any population inference made before the selection function is characterised is an inference about the instrument.

**2.** **(a)** $T_{\rm eq} = 1609\times(0.7)^{1/4} = 1609\times0.915 = 1471$ K. **(b)** Tidal locking, so a permanent dayside and a circulation driven by extreme hemispheric contrast; no ices and no water condensation, with refractory species such as TiO and VO potentially gaseous; and proximity to the Roche limit at $0.0116$ AU, so the shortest-period examples are within a factor of two of tidal disruption. **(c)** Because the object's atmospheric chemistry, thermal structure, circulation and radius are all determined by conditions Jupiter never experiences — it is not Jupiter relocated but a different class of object that happens to share a mass.

**3.** **(a)** Because the zone a core can gravitationally reach is a few Hill radii wide, and $R_H = a(M/3M_\star)^{1/3}\propto a$. **(b)** The accessible mass is $\sim2\pi a\,(bR_H)\Sigma \propto a^2\Sigma$, and with $\Sigma\propto a^{-3/2}$ this gives $a^{1/2}$ — increasing outward. The inner disc has more material per unit area but a core there can reach a far smaller area, and the area term wins. **(c)** No ices at $1246$ K, removing the factor-of-four solid enhancement available beyond the snow line; and the innermost gas being the first lost to stellar accretion and photoevaporation, shortening the window for envelope capture.

**4.** *Disc migration:* predicts alignment; predicts companions survive; difficulty is that nothing naturally stops the migration at $0.05$ AU. *High-eccentricity migration:* predicts a broad misalignment distribution including retrograde; predicts companions are ejected; difficulty is that it requires a suitable perturber or an unstable multi-giant system, and should leave observable partially circularised intermediates whose numbers are a test. *In-situ:* predicts alignment and surviving companions; difficulty is that it requires an inner-disc solid surface density far above nebula values, achieved by invoking inward drift and pile-up of solids.

**5.** **(a)** Stars hotter than $6250$ K have thin or absent convective envelopes; cooler stars have deep ones. **(b)** Tidal dissipation in a convective envelope is far more efficient, so cool stars can realign their own spin with a close planet's orbit over gigayears, erasing any primordial misalignment. **(c)** The observed pattern — misalignment common above the break, rare below — implies that many hot Jupiters arrive misaligned and that cool hosts subsequently hide it, supporting high-eccentricity migration as a common route. It does not exclude disc migration, since an aligned system is consistent with a disc origin or with a realigned dynamical one.

**6.** **(a)** Hot Jupiters rarely have detectable nearby companions, whether as additional transiting planets or as transit timing variations; warm Jupiters at longer periods frequently do, and serve as the control. **(b)** A giant arriving on a highly eccentric orbit crosses the inner system repeatedly and destabilises or ejects anything there, whereas smooth disc migration and in-situ formation should both leave companions in place. **(c)** Because the evidence cannot be reset: ejected planets do not return, so a lonely system stays lonely. Misalignment, by contrast, is erased by tidal realignment in cool hosts, so an aligned system carries no information — the diagnostic disappears in exactly the systems where the sample is largest.

**7.** **(a)** Many hot Jupiters have radii up to $1.8$–$2.0\,R_{\rm J}$ where models predict $1.0$–$1.2$, and the excess correlates with incident flux, setting in above equilibrium temperatures of roughly $1000$ K. **(b)** Because irradiation heats the outer layers to equilibrium while the interior continues to radiate through them, which slows contraction but does not reverse it — and quantitatively falls short. **(c)** Energy of order $1\%$ of the incident stellar flux must be deposited into the convective interior. Ohmic dissipation is favoured because it reproduces the observed onset threshold naturally: the atmosphere becomes partially ionised above about $1000$ K, winds drag that plasma across the planet's magnetic field, and the induced currents dissipate at depth — so the switch-on temperature is a prediction rather than a fit.

**8.** **(a)** The planet orbits faster than the star spins, so the tidal bulge it raises lags behind it, exerting a torque that transfers angular momentum from the orbit to the stellar spin — the orbit loses angular momentum and decays, accelerating as it shrinks. **(b)** That hot Jupiters are being destroyed, so the observed $\sim1\%$ occurrence is a steady-state balance between delivery and destruction rather than a cumulative formation rate, and more stars have hosted one than currently do. **(c)** Enrichment in refractory elements, since the swallowed planet's rocky core dissolves into the star's convective envelope; and anomalously rapid rotation, from the transferred orbital angular momentum.

**9.** **(a)** That when two observables bear on the same question, the one whose signal cannot be erased by a later process is the stronger witness — and one should ask, of any diagnostic, whether a system that once possessed the property could have lost it. **(b)** Orbital eccentricity as a record of dynamical history: tidal circularisation erases it for close-in planets, so a circular hot Jupiter tells you nothing, whereas eccentricity in a wider orbit, where circularisation is ineffective, remains informative. **(c)** In geology, radiometric ages: a thermal event can reset a mineral's clock, so a young age may record reheating rather than formation, and the reliable systems are those with closure temperatures above anything the rock has since experienced.$exHJ_master$,
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
