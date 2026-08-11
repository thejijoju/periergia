-- Astronomy & Space · Exoplanets — Finding Worlds — "Astrometry".
-- Curated master for
-- astronomy-and-space/exoplanets/finding-worlds/astrometry
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Closes the Finding Worlds block. Organised around the method's
-- inverted history: it was the first technique attempted, it produced
-- the field's most instructive failure - van de Kamp's Barnard's Star
-- planets, which tracked plate-scale changes caused by maintenance on
-- the telescope rather than anything on the sky - and it is now, with
-- Gaia, on the point of producing more giant planet detections than any
-- other method. The physics is complementary in exactly the way that
-- matters: the signal scales as a, growing with separation, where
-- radial velocity falls as a^-1/2 and transit probability as a^-1, so
-- astrometry covers the region both others lose. It also delivers what
-- neither can: true masses free of sin i, and complete three-
-- dimensional orbits including mutual inclinations.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting from alpha = (Mp/Ms)(a/d): Jupiter
-- on the Sun seen from 10 pc gives 496 uas, from 100 pc 49.6 uas;
-- Earth on the Sun from 10 pc gives 0.30 uas. Gaia per-observation
-- precision is tens of microarcseconds for bright stars.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/finding-worlds/astrometry',
    'research',
    'advanced',
    'read',
    $exAstro_master$> Astrometry was the first method tried and the last to work. For most of the twentieth century it produced nothing but retractions — including the most instructive false detection in the field's history, a set of planets around Barnard's Star that turned out to track the maintenance schedule of the telescope that found them.

It is now on the verge of producing more giant planet detections than every other technique combined.

The reversal is not a story about persistence. It is a story about a method whose physics was always favourable and whose precision requirement — measuring a star's position to a few tens of microarcseconds, roughly the angle subtended by a human hair at a thousand kilometres — was simply out of reach until a spacecraft was built to do nothing else.

**The physics is complementary in exactly the way that matters.** The astrometric signal *grows* with orbital separation, where radial velocity weakens and transit probability collapses. Astrometry covers the region the other methods lose, and it delivers two things neither can: **true masses, free of the $\sin i$ ambiguity, and complete three-dimensional orbits.**

## 1. The signal

A star and planet orbit their common centre of mass. The star's orbit has semi-major axis $a_\star = a\,M_p/M_\star$, which at distance $d$ subtends

$$\alpha = \frac{M_p}{M_\star}\frac{a}{d}.$$

In convenient units, with $a$ in AU and $d$ in parsecs, $\alpha$ in arcseconds is $(M_p/M_\star)(a/d)$.

| System | $\alpha$ |
|---|---|
| Jupiter on the Sun, from $10$ pc | $496$ μas |
| Jupiter on the Sun, from $100$ pc | $49.6$ μas |
| Earth on the Sun, from $10$ pc | $0.30$ μas |

**Read the scalings.** $\alpha \propto M_p$, as with radial velocity. $\alpha \propto 1/d$, which no other method suffers in the same way — a transit depth is distance-independent, and a radial velocity amplitude is too. And, decisively,

$$\alpha \propto a.$$

**The signal grows with orbital separation.** Compare: radial velocity gives $K \propto a^{-1/2}$, and transit probability gives $P_{\rm tr}\propto a^{-1}$. A Jupiter at $5$ AU produces an astrometric signal five times larger than the same planet at $1$ AU, while its radial velocity amplitude is $2.2$ times smaller and its transit probability five times worse.

**This is the method's entire scientific case.** It is sensitive precisely where the others fail, which is the region containing the Solar System's own giant planets.

The offsetting constraint is that a full orbit must be sampled to fit it, so a planet at $5$ AU around a Sun-like star requires a baseline approaching its $11$-year period. Astrometry's natural domain is therefore intermediate separations — roughly $1$ to $6$ AU for a mission lasting years — bounded below by the shrinking signal and above by the observing baseline.

## 2. What astrometry uniquely delivers

**True mass.** The astrometric orbit is the projection of the star's real ellipse on the sky, and fitting it yields the inclination directly. There is no $\sin i$ residue. **This is the cleanest mass measurement available for a non-transiting planet**, and it is why astrometric orbits are valuable even for systems already characterised by radial velocity — combining the two removes the last ambiguity.

**Full three-dimensional orbits.** Astrometry gives the inclination and the longitude of the ascending node, which radial velocity cannot supply at all. For a multi-planet system this determines **mutual inclinations** — whether the orbits are coplanar or mutually tilted — which is a direct record of dynamical history. A system that formed quietly in a disc and stayed there should be coplanar; one that suffered scattering should not.

**Masses for imaged planets.** A directly imaged planet's mass is otherwise inferred from its brightness plus an evolutionary model plus an assumed initial entropy — the hot start problem, which admits factor-of-several uncertainties. Where the same companion produces a measurable astrometric signal, its mass follows dynamically and the model is bypassed. This is already the most valuable service astrometry performs for the field.

**No alignment requirement.** Like radial velocity, and unlike transits, astrometry works on any orientation — a face-on orbit, invisible to radial velocity, produces the *largest* astrometric signal, since the full orbit is projected onto the sky. The two methods' blind spots are complementary rather than shared.

```checkpoint
q: The astrometric signal scales as $\alpha \propto a$, while radial velocity gives $K\propto a^{-1/2}$ and transit probability $P_{\rm tr}\propto a^{-1}$. What is the consequence?
a: Astrometry is the most sensitive method at all separations
x: At small separations the astrometric signal is tiny, and transits and radial velocity both perform far better there.
a*: Astrometry is sensitive where the others fail — at intermediate and wide separations, including the region containing the Solar System's giants
a: Astrometry can detect planets at arbitrarily large separations
x: The signal keeps growing, but the orbit must be sampled to be fitted, so the observing baseline imposes an upper bound of a few AU for a mission lasting years.
a: The three methods are equally sensitive once the scalings are normalised
x: They have genuinely different dependences on separation, so no normalisation makes them equivalent.
hint: Consider a Jupiter moved from $1$ AU to $5$ AU and compute what happens to each of the three signals.
why: Moving a Jupiter from $1$ to $5$ AU multiplies its astrometric signal by five, divides its radial velocity amplitude by $\\sqrt5 = 2.2$, and divides its transit probability by five. **The three methods therefore have opposite biases in separation**, and astrometry is the one that improves outward. Its natural domain is bounded on both sides: below by the signal shrinking toward the noise, and above by the requirement that a substantial fraction of the orbit be observed before it can be fitted — a $5$ AU orbit around a Sun-like star takes $11$ years. That gives a working range of roughly $1$ to $6$ AU for a mission lasting several years, which happens to be where the Solar System's own giant planets live and where transits and radial velocity are both losing sensitivity fast. The complementarity extends to orientation: a face-on orbit is invisible to radial velocity, which senses only line-of-sight motion, and produces the *largest* astrometric signal, since the entire orbit is projected onto the sky. The two methods' blind spots do not overlap.
---
q: Why is an astrometric orbit valuable for a system whose planet has already been characterised by radial velocity?
a: Because it measures the orbital period more precisely
x: Radial velocity typically constrains the period at least as well, from many sampled cycles.
a*: Because it determines the inclination, converting the radial velocity's $M_p\sin i$ into a true mass, and supplies the node so the orbit is known in three dimensions
a: Because it is less affected by stellar activity than radial velocity
x: Astrometry has its own stellar systematics — spots displace a star's photocentre — so this is not a clean advantage.
a: Because it can detect additional planets that radial velocity missed
x: It may, but the specific value for an *already characterised* planet is the geometric information, not additional detections.
hint: List what radial velocity cannot determine about an orbit, and ask which of it astrometry supplies.
why: A radial velocity orbit is three-dimensionally incomplete by construction: it gives period, eccentricity, argument of periastron and the semi-amplitude, but not the inclination or the longitude of the ascending node, so the planet's mass is known only as $M_p\\sin i$. An astrometric orbit is the projection of the star's real ellipse on the sky, so fitting it yields the inclination directly and the node with it. Combining the two therefore removes the last ambiguity, giving a **true mass** and a complete three-dimensional orbit. That matters in three places. Individual masses near the deuterium-burning boundary become unambiguous, resolving whether an object is a planet or a brown dwarf seen face-on. Multi-planet systems acquire **mutual inclinations**, which record whether the system stayed coplanar as a disc would leave it or was tilted by scattering. And directly imaged companions acquire dynamical masses, bypassing the hot-start assumption that otherwise makes their masses uncertain by a factor of several.
```

## 3. The instructive failure

Astrometry's history is worth telling properly, because it is the clearest available case study of a false detection produced by careful work.

Through the 1960s, Peter van de Kamp reported planets orbiting **Barnard's Star** — a nearby M dwarf — based on decades of photographic plates taken with the Sproul Observatory's refractor. The claimed signal was a wobble of about $0.02$ arcseconds with a period of roughly $24$ years, interpreted as one and later two Jupiter-mass companions.

The work was not casual. It rested on thousands of plates measured over decades, by an experienced astrometrist at a facility built for the purpose, and it was accepted widely enough to appear in textbooks and to shape expectations about how planets would eventually be found.

**It was wrong, and the diagnosis is the valuable part.** Independent observations with other telescopes found no such motion. More tellingly, re-examination showed that the apparent wobble in the Sproul data coincided with **changes to the telescope itself** — the objective lens had been removed and re-installed, and the plate holder adjusted, and the apparent stellar motions stepped at those dates. The signal was in the instrument, not the sky. Similar step-like artefacts appeared in *other* stars measured on the same plates, which is the observation that settled it.

Three lessons generalise, and each has analogues in the modern methods.

**A systematic affecting all targets equally is invisible in any single target.** Van de Kamp analysed Barnard's Star; the artefact was visible only when several stars measured on the same plates were compared. Modern astrometric missions handle this by solving for the instrument and the sky simultaneously across the whole survey, so that instrumental changes appear as global parameters rather than as motion of individual stars.

**A signal whose period matches an instrumental or operational timescale deserves suspicion.** This is precisely the discipline applied today to radial velocity signals near the stellar rotation period, and to transit signals near a spacecraft's momentum-dump cadence.

**Long baselines cut both ways.** Decades of data give sensitivity to long-period planets and also accumulate decades of instrumental change. The value of a long time series depends entirely on whether the instrument's behaviour over that span is characterised — which is why modern missions treat calibration as the primary scientific product and the catalogue as derived from it.

**The claimed planets were also physically plausible.** Nothing about a Jupiter at a few AU around an M dwarf is odd, then or now. **Plausibility offered no protection**, which is worth remembering whenever a result is defended on the grounds that it is unsurprising.

{{image: Astrometry | Measurement of stellar positions and their changes over time. A star with an unseen companion traces a small ellipse about the system's centre of mass, superimposed on its parallactic wobble and its proper motion across the sky, and separating those three components is the whole of the measurement. The technique's difficulty is that the planetary ellipse is minute — about half a milliarcsecond for a Jupiter analogue seen from ten parsecs, and a third of a microarcsecond for an Earth — so any instrumental change that shifts the plate scale or the reference frame can masquerade as motion, which is what produced the field's most instructive false detection.}}

## 4. Why it is hard

The signal must be separated from three larger motions, and the difficulty is one of decomposition rather than of raw precision.

**Proper motion.** A nearby star crosses the sky at tens to hundreds of milliarcseconds per year — thousands of times the planetary signal. It is linear in time and therefore separable, provided the baseline is long enough that a curved planetary orbit cannot be absorbed into a straight line.

**Parallax.** The Earth's orbit makes every star trace an annual ellipse of semi-major axis $1/d$ arcseconds — $100{,}000$ μas at $10$ pc, some two hundred times a Jupiter analogue's signal. It has exactly one year's period and a known phase, so it is separable in principle, but **a planet with a period near one year is degenerate with it**, and the degeneracy is worst for exactly the orbits an Earth analogue would occupy.

**The reference frame.** A position is measured relative to something. Nearby reference stars have their own proper motions and parallaxes and their own possible companions. The modern solution is a **global astrometric solution**: measure all stars against each other simultaneously, tie the frame to distant quasars whose motions are negligible, and solve for the instrument at the same time.

**Photocentre motion.** A star's measured position is the centroid of its light, not its centre of mass. A large starspot on one hemisphere displaces the photocentre, and for a spotted star this can rival a planetary signal. This is the astrometric counterpart of radial velocity's activity problem, and like it, it is not reduced by better optics.

```checkpoint
q: Van de Kamp's Barnard's Star planets were an artefact of changes to the telescope. What feature of the analysis allowed the error to persist for years?
a: The photographic plates were of poor quality and the measurements imprecise
x: The measurements were careful and the plates numerous; imprecision was not the failure.
a*: The analysis examined one star at a time, so an instrumental effect shifting every star on the plates could not be distinguished from motion of the target
a: The claimed planets were physically implausible and should have been rejected on those grounds
x: They were entirely plausible — a Jupiter at a few AU around an M dwarf — which is exactly why plausibility offered no protection.
a: No other observatory had a telescope capable of checking the result
x: Independent observations were made and found no such motion, which is part of how the error was identified.
hint: Ask what an instrumental change does to every star on a plate, and what comparing several stars would reveal.
why: An adjustment to the objective lens or the plate holder alters the plate scale or the reference frame, displacing **every** star measured on those plates. Analysed one star at a time, that displacement appears as motion of the target; analysed across many stars, it appears as a common step at a specific date, which is what the re-examination found — the apparent wobble coincided with dates of telescope maintenance, and similar steps appeared in other stars on the same plates. Modern astrometric missions are built around this: the **global astrometric solution** fits all stars and the instrument simultaneously, tying the frame to distant quasars, so instrumental change enters as a global parameter rather than as motion of individual objects. Two further lessons carry over. A signal whose period matches an operational timescale warrants suspicion — the same discipline now applied to radial velocity signals near the stellar rotation period. And a long baseline accumulates instrumental change as well as sensitivity, so its value depends entirely on whether the instrument's behaviour across that span has been characterised.
---
q: Which of the three larger motions that must be removed is most dangerous for detecting an Earth analogue astrometrically?
a: Proper motion, since it is the largest in amplitude
x: It is large — tens to hundreds of milliarcseconds per year — but it is linear in time and therefore cleanly separable given a long baseline.
a*: Parallax, because it has a period of exactly one year and is degenerate with the orbital period an Earth analogue would have
a: The reference frame drift, since distant stars also move
x: This is handled by a global solution tied to quasars, and it does not preferentially affect one-year periods.
a: Photocentre motion from starspots, since it is unpredictable
x: A real and underappreciated systematic, but it operates at the stellar rotation period rather than specifically at one year.
hint: Ask which contaminant shares a period with the planet being sought.
why: All three contaminants exceed the planetary signal by large factors — proper motion by thousands, parallax by about two hundred for a Jupiter analogue at $10$ pc — but amplitude is not what determines danger. **Proper motion is linear in time**, so it is separable given a baseline long enough that a curved orbit cannot be absorbed into a straight line. **The reference frame** is handled by solving globally against distant quasars. **Parallax traces an annual ellipse with exactly one year's period and a phase fixed by the Earth's orbit**, and an Earth analogue by definition has a period near one year — so the two signals are nearly degenerate, and the degeneracy is worst for precisely the planets one most wants to find. The saving grace is that the phase relationship differs, since the parallactic ellipse's orientation is fixed by the ecliptic while the planetary orbit's is not, so a sufficiently long baseline and precise phase measurement can separate them. But the required precision is $0.30$ μas, roughly a hundred times better than currently achieved, so this is a problem for a future mission rather than a present one.
```

## 5. Gaia

The mission that changes the picture measures positions, parallaxes and proper motions for nearly two billion stars, repeatedly over years, with per-observation precision of tens of microarcseconds for bright targets and end-of-mission accuracy better still.

**Its design embodies the lesson of the Barnard's Star failure.** Two lines of sight separated by a large fixed angle are imaged onto one focal plane, so positions are measured as *differences* across the sky rather than against a local reference; the spacecraft scans continuously so every star is observed many times at many orientations; and the astrometric solution is global, fitting the whole sky and the instrument together, with the frame tied to quasars.

**The expected planetary yield is thousands of giant planets** at separations of roughly $1$–$5$ AU — a population that transits cannot reach and that radial velocity samples only slowly, since each detection requires years of monitoring per star. Because astrometry gives true masses and full orbits, the resulting catalogue will be qualitatively different from existing ones: not minimum masses and projected quantities but complete dynamical descriptions.

**Two products are already in hand.** Gaia's parallaxes revised the stellar radii of transit hosts, moving every planet radius derived from them and sharpening the radius valley into visibility. And the **proper motion anomaly** technique compares Gaia's proper motions with those measured by Hipparcos a quarter of a century earlier: a difference between the two indicates acceleration, hence an unseen companion, and the long baseline gives sensitivity to orbits far longer than either mission alone can sample. This has supplied dynamical masses for a number of directly imaged planets, which is exactly the measurement that constrains the hot start problem.

{{image: Gaia (spacecraft) | An astrometric observatory designed to measure the positions, parallaxes and proper motions of nearly two billion stars repeatedly over years. Its architecture is the lesson of a century of failed astrometric planet searches turned into hardware: two lines of sight separated by a large fixed angle are imaged onto a single focal plane, so positions are measured differentially across the whole sky rather than against local reference stars; the spacecraft scans continuously so every target is observed many times at many orientations; and the astrometric solution fits all stars and the instrument together, tied to distant quasars whose own motions are negligible. Instrumental change therefore appears as a global parameter rather than as apparent motion of an individual star.}}

```checkpoint
q: The Hipparcos–Gaia proper motion anomaly compares proper motions measured a quarter of a century apart. What does a discrepancy indicate, and why is the long baseline valuable?
a: That one of the two missions has a calibration error
x: The frames are carefully tied together, and a genuine astrophysical signal is the expected interpretation once that is done.
a*: That the star has accelerated, indicating an unseen companion — and the long baseline gives sensitivity to orbits far longer than either mission alone could sample
a: That the star's parallax has changed, implying a distance measurement error
x: A star's distance does not change measurably over decades; parallax differences of that kind would be a systematic, not a signal.
a: That the star is a member of a moving group whose bulk motion was mismeasured
x: Group membership affects the mean motion, not a difference between two epochs for the same star.
hint: A proper motion measured over a few years is a short-term average. What does comparing two such averages, separated by decades, reveal?
why: Each mission measures a proper motion averaged over its own operational span of a few years. If a star is orbiting an unseen companion, its instantaneous velocity changes over the orbit, so two short-term averages taken twenty-five years apart differ — and the difference measures the **acceleration**, hence the companion's mass and separation. The long baseline matters because astrometric detection normally requires sampling a substantial fraction of an orbit, which limits a single mission to periods comparable to its lifetime; comparing two missions extends the accessible period range to decades without either having observed a full orbit. The technique's most valuable application so far is supplying **dynamical masses for directly imaged planets**, which are otherwise inferred from brightness plus an evolutionary model plus an assumed initial entropy — the hot start problem, with factor-of-several uncertainties. A mass obtained from an acceleration bypasses the model entirely, which is why these comparisons have begun to constrain which formation entropy assumptions are tenable.
---
q: Gaia's parallaxes changed every exoplanet radius derived from Kepler photometry. By what route?
a: By revising the transit depths, which depend on the distance to the system
x: Transit depth is a flux ratio and is independent of distance; that is one of the method's structural advantages.
a*: By improving stellar radii — better distances give better luminosities, hence better stellar radii, and a transit measures only $R_p/R_\star$
a: By identifying background stars that had diluted the transit signals
x: Gaia's angular resolution did help identify some blended companions, but the wholesale revision of radii came through the distance scale.
a: By correcting the orbital periods, which had been affected by the spacecraft's motion
x: Periods are measured from transit timing and were not in question.
hint: Ask what a transit actually measures, and what has to be supplied from elsewhere to turn it into a planet radius.
why: A transit measures the ratio $(R_p/R_\star)^2$ and contains no absolute scale, so the planet's radius is inherited entirely from the star's. Stellar radii come from spectroscopy combined with evolutionary models, and those models are far better constrained when the star's luminosity is known — which requires a distance. Gaia supplied parallaxes of a quality previously unavailable for the Kepler field, many stars proved larger than had been assumed, and **every planet radius scaled up with its host**. The consequence was not merely a bookkeeping revision: the sharpening of stellar radii is what made the radius valley between $1.5$ and $2.0\,R_\oplus$ emerge as a resolved feature rather than a smeared one, so a real compositional boundary had been hidden by a measurement systematic rather than by insufficient data. The general point is that **exoplanet parameters are inherited quantities** — radius from stellar radius, mass from stellar mass, insolation from stellar luminosity — so a systematic in stellar characterisation propagates wholesale into the planet population rather than averaging out.
```

## 6. What is out of reach

**Earth analogues.** At $0.30$ μas from $10$ pc, an Earth analogue's signal is about two orders of magnitude below current capability, and it sits at the one-year period where the parallax degeneracy is worst. **No planned mission detects it astrometrically.**

**Distant systems.** Since $\alpha\propto1/d$, astrometry is confined to the solar neighbourhood — a Jupiter analogue drops to $50$ μas at $100$ pc and below $10$ μas at $500$ pc. This is the opposite of microlensing, which surveys the whole Galaxy and cares little about distance.

**Short-period planets.** The signal shrinks with $a$, so hot Jupiters — the easiest targets for transits and radial velocity — are among the hardest for astrometry. Each method's easiest case is another's hardest.

## 7. How the methods fit together

It is worth assembling the four detection techniques explicitly, because the field's results only make sense as a composite.

| Method | Best at | Measures | Blind to |
|---|---|---|---|
| Transits | $< 0.5$ AU | Radius, period, inclination | Non-aligned systems; long periods |
| Radial velocity | $< 5$ AU | $M\sin i$, eccentricity | Inclination; face-on orbits |
| Astrometry | $1$–$6$ AU | True mass, full 3D orbit | Short periods; distant stars |
| Microlensing | $1$–$5$ AU, any distance | Mass ratio, projected separation | Everything about the host; repeat observation |
| Direct imaging | $> 10$ AU | Spectrum, position | Mature and low-mass planets |

**No method surveys planetary systems.** Each samples a region of parameter space, and the composite picture is assembled from overlapping partial views with different selection functions. Every general statement about "how planetary systems are built" is therefore a synthesis across methods, and its reliability depends on how well the joins are understood — which is the subject of the occurrence statistics chapter and the reason that chapter is harder than it looks.

```checkpoint
q: Gaia's astrometric solution fits all stars and the instrument simultaneously, tied to distant quasars. Why is this architecture, rather than higher precision alone, what makes the method work?
a: Because it increases the effective precision by averaging over many stars
x: Averaging over stars does not improve the precision on any individual star's orbit, which is what a planet detection requires.
a*: Because the historical failures came from instrumental changes that displaced all stars together, and only a global solution can separate such an effect from the motion of a single target
a: Because quasars provide a brighter reference than nearby stars
x: Quasars are faint; their value is that their proper motions are negligible, fixing an inertial frame.
a: Because measuring many stars allows the mission to detect more planets
x: Yield is a consequence of surveying widely, not the reason the architecture is designed this way.
hint: Recall what went wrong with the Barnard's Star measurements and ask what would have caught it.
why: The Sproul measurements failed not through insufficient precision but through an instrumental change — the objective lens removed and replaced, the plate holder adjusted — that shifted the plate scale and hence every star on the plates. Analysed target by target, that appears as motion of the target; it was identified only when several stars measured on the same plates showed the same steps at the same dates. **Precision alone would not have prevented it**, and might have made it worse by lending the artefact greater apparent significance. A global solution fits the sky and the instrument together across the whole survey, so any effect common to many stars is absorbed into instrument parameters rather than attributed to one object, and tying the frame to quasars — whose proper motions are negligible — supplies an inertial reference that does not drift. The two fields of view separated by a large fixed angle, imaged onto one focal plane, make positions differential across the sky rather than local. **The architecture is the lesson of the failure, built into hardware**, which is why the modern method succeeds where decades of careful photographic work did not.
---
q: The five detection methods have almost non-overlapping domains. What follows for statements about how planetary systems are built?
a: That such statements cannot be made until a single method covers all separations
x: Composite inference across methods is legitimate; it simply requires that the joins be understood.
a*: That every such statement is a synthesis across methods with different selection functions, and its reliability depends on how well the joins between them are characterised
a: That the methods should be ranked and the most reliable one used exclusively
x: Each is the only method with sensitivity in its own domain, so discarding any leaves that region unsurveyed rather than better surveyed.
a: That the true population is unknowable, since no method sees it directly
x: Overly pessimistic: each selection function is calculable, and correcting for a known bias is standard practice.
hint: Ask which single method could, by itself, detect all the planets in our own Solar System from ten parsecs.
why: Consider surveying the Solar System from $10$ pc. Transits would require an alignment probability of $0.47\\%$ for Earth and $0.089\\%$ for Jupiter, and would need a baseline of decades for the outer planets. Radial velocity would detect Jupiter at $12.5$ m s$^{-1}$ and Saturn at $2.8$, but Earth's $8.9$ cm s$^{-1}$ sits beneath the Sun's own activity. Astrometry would detect Jupiter comfortably at $496$ μas and Saturn at $273$, but not Earth at $0.30$. Direct imaging would reach the giants in reflected light only with contrast around $10^{-9}$. **No single method recovers the system**, and the composite requires stitching together samples with entirely different biases in separation, mass, host type and distance. That is legitimate — each selection function is calculable, and inverting a known bias is routine — but it means general claims about planetary architecture are statements about a reconstruction, and their reliability is set by the weakest join rather than by the best-measured region. It also explains why the field's most contested numbers, such as the frequency of Earth analogues, lie exactly where two methods' domains fail to meet.
```

```checkpoint
q: A star's measured astrometric position is the centroid of its light. What follows?
a: Nothing important, since a star's light is symmetric about its centre of mass
x: It is not: spots, plage and limb effects break the symmetry, and the star is unresolved so the asymmetry appears purely as a shift in position.
a*: A large starspot displaces the photocentre, producing a spurious positional signal at the stellar rotation period — the astrometric counterpart of radial velocity jitter
a: The measurement is systematically offset toward the star's brighter hemisphere, which cancels over an orbit
x: The displacement rotates with the star rather than staying fixed relative to the orbit, so it does not cancel over an orbital period.
a: Photocentre motion affects only very close binaries, where two sources blend
x: Blended binaries do displace a photocentre, but a single spotted star does so as well and is far more common.
hint: Ask what happens to the centre of light when part of the visible hemisphere is darker than the rest.
why: An unresolved star's position is measured as the flux-weighted centroid of its image, which coincides with its centre of mass only if the visible hemisphere is uniformly bright. A dark spot removes flux from one side, pulling the centroid toward the other, and as the star rotates the displacement traces out a periodic signal at the **rotation period** and its harmonics. This is the exact analogue of radial velocity jitter, and it shares the important property: it is astrophysical rather than instrumental, so it is not reduced by better optics, longer integrations or a more stable spacecraft. It also shares the diagnostics — a signal at the rotation period is suspect, and photometric or chromospheric monitoring can establish whether the star is active enough for the amplitude required. For a Jupiter analogue at $496$ μas the effect is usually negligible; for the microarcsecond precision an Earth analogue would demand, it becomes a limiting term, which means that even a mission achieving the required instrumental precision would meet the same kind of astrophysical wall that radial velocity has already met.
---
q: Astrometry's most valuable current contribution is arguably not detecting new planets. What is it?
a: Measuring parallaxes, which improve distance estimates for all exoplanet hosts
x: Enormously valuable and genuinely transformative, but a service to other methods rather than an astrometric planet measurement.
a*: Supplying dynamical masses for directly imaged planets, which otherwise depend on an evolutionary model and an unobservable initial entropy
a: Confirming radial velocity detections independently
x: Confirmation is useful but adds little where a radial velocity orbit is already secure; the new information is geometric.
a: Ruling out planets around stars where none are detected
x: Non-detections do constrain occurrence, but they are not the contribution that changes another measurement's reliability.
hint: Ask which existing exoplanet measurement carries a factor-of-several systematic that astrometry can remove outright.
why: A directly imaged planet's mass is not measured. What is measured is its brightness, converted to a mass by an evolutionary model that requires the planet's **initial entropy** — how hot it was when accretion finished — which is unobservable. Hot start and cold start assumptions can differ by a factor of several in the inferred mass at the young ages where imaged planets are found, so quoted masses carry a systematic larger than any of their stated uncertainties, and it propagates into the planet–brown dwarf boundary and into comparisons between imaged and radial velocity populations. **An astrometric mass is dynamical**: it follows from the companion's gravitational effect on the star and involves no model of the planet's interior or history. The Hipparcos–Gaia proper motion anomaly, comparing proper motions averaged twenty-five years apart to detect acceleration, has begun supplying exactly this for the brightest imaged systems. Removing a factor-of-several systematic from an existing measurement is arguably worth more than adding detections to a catalogue, and it is a good illustration of why methods should be valued for what they contribute to a joint analysis rather than only for what they find alone.
```

## 8. Pulling the thread

- **The signal grows with separation**, $\alpha\propto a$, opposite to radial velocity's $a^{-1/2}$ and transits' $a^{-1}$. Astrometry covers the region both others lose, including where the Solar System's giants live.
- **It delivers true masses and full three-dimensional orbits** — the inclination and node that radial velocity cannot supply, hence mutual inclinations for multi-planet systems and dynamical masses for imaged companions.
- **The signals are minute:** $496$ μas for a Jupiter analogue at $10$ pc, $0.30$ μas for an Earth. Two orders of magnitude separate the second from any planned capability.
- **Barnard's Star is the field's most instructive failure.** Careful decades-long work produced planets that tracked telescope maintenance, and the artefact was detectable only by comparing several stars on the same plates.
- **Plausibility offered no protection.** The claimed planets were entirely ordinary, which is why "this result is unsurprising" is not evidence.
- **Parallax is the dangerous contaminant** — a one-year period, degenerate with exactly the orbit an Earth analogue would have.
- **Gaia's architecture is the lesson made into hardware:** two widely separated fields on one focal plane, continuous scanning, a global solution fitting sky and instrument together, tied to quasars.
- **No method surveys planetary systems.** Each samples a region, and every general claim is a synthesis whose reliability is set by its weakest join.

The transferable idea: **a measurement that fails for decades and then succeeds has usually not been improved so much as restructured.** Astrometry's precision did improve enormously, but precision was never the whole problem — van de Kamp's failure would not have been prevented by better plates, and might have been made worse by them, since a sharper artefact is a more convincing one. What changed was the *architecture of the measurement*: from measuring one star against local references to measuring the whole sky against itself and against quasars, with the instrument solved for simultaneously. **The error was moved from the data into the model, where it could be fitted and removed.** This pattern recurs wherever a systematic afflicts all measurements alike — in radial velocity's simultaneous reference spectra, in transit photometry's use of ensembles of comparison stars, in microlensing's blanket survey coverage. When a measurement is limited by something common to every observation, the answer is rarely a better observation; it is an arrangement in which the common part becomes visible as a parameter rather than invisible as a bias.

## 9. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Michael Perryman | The Making of History's Greatest Star Map | 2010}}

{{book: Sara Seager | Exoplanets | 2010}}

Beyond the books: van de Kamp's own papers on Barnard's Star are worth reading directly, not as an object of derision but because the reasoning is careful and the error is not visible from within the analysis — which is the point. Gatewood and Eichhorn's 1973 paper reporting the independent non-detection, and the later analyses identifying the correlation with telescope maintenance, together form the clearest published account of how such a claim is dismantled. Perryman's history of Hipparcos is unusually good on why a global astrometric solution is the architecture that works.

## Problems

*Useful numbers: $\alpha = (M_p/M_\star)(a/d)$, with $\alpha$ in arcseconds for $a$ in AU and $d$ in pc; $M_{\rm J}/M_\odot = 9.55\times10^{-4}$, $M_\oplus/M_\odot = 3.00\times10^{-6}$; Jupiter on the Sun from $10$ pc gives $496$ μas, Earth $0.30$ μas; parallax $= 1/d$ arcseconds; proper motions of nearby stars are tens to hundreds of mas yr$^{-1}$.*

**1.** *(The signal.)* **(a)** Compute the astrometric signal of Saturn on the Sun seen from $10$ pc. **(b)** Compute Jupiter's from $50$ pc. **(c)** State the three scalings in the formula and give an observational consequence of each.

**2.** *(Complementarity.)* For a Jupiter moved from $1$ AU to $5$ AU, compute the change in **(a)** astrometric signal, **(b)** radial velocity amplitude, **(c)** transit probability. State what this implies about the division of labour.

**3.** *(Unique products.)* **(a)** State what astrometry supplies that radial velocity cannot. **(b)** Explain why this matters for multi-planet systems. **(c)** Explain why it matters for directly imaged planets specifically.

**4.** *(The failure.)* **(a)** Describe the Barnard's Star claim. **(b)** State the actual cause and the observation that identified it. **(c)** Give the three general lessons and name a modern analogue of each.

**5.** *(Contaminants.)* **(a)** Give the approximate size of proper motion and parallax relative to a Jupiter analogue's signal at $10$ pc. **(b)** State why proper motion is nevertheless the easiest to remove. **(c)** State why parallax is the most dangerous for an Earth analogue.

**6.** *(Photocentre.)* **(a)** Explain how a starspot produces a spurious astrometric signal. **(b)** State the period at which it appears. **(c)** Name the radial velocity phenomenon it is analogous to and state what the two have in common.

**7.** *(Architecture.)* **(a)** Describe the three design features of a global astrometric solution. **(b)** Explain how each addresses a specific failure mode. **(c)** State why precision alone would not have sufficed.

**8.** *(Limits.)* **(a)** State why Earth analogues are out of reach and give both reasons. **(b)** State how the distance dependence differs from microlensing's. **(c)** State which planets are hardest for astrometry and easiest for transits, and why.

**9.** *(Synthesis.)* Consider observing the Solar System from $10$ pc. **(a)** State which planets each of the five methods would detect. **(b)** State what this shows about single-method surveys. **(c)** State where the field's most contested numbers should be expected to lie, and why.

## Worked answers

**1.** **(a)** Saturn: $M_p/M_\star = 2.86\times10^{-4}$, $a = 9.58$ AU, $d = 10$ pc: $\alpha = 2.86\times10^{-4}\times9.58/10 = 2.74\times10^{-4}$ arcsec $= 274$ μas. **(b)** Jupiter from $50$ pc: $496\times(10/50) = 99$ μas. **(c)** $\alpha\propto M_p$ — massive planets are easier, as with radial velocity. $\alpha\propto a$ — the signal grows with separation, which is the method's distinctive advantage. $\alpha\propto1/d$ — the method is confined to the solar neighbourhood, unlike transits and radial velocity, whose signals are distance-independent.

**2.** **(a)** Astrometric signal $\times5$. **(b)** $K\propto a^{-1/2}$, so $\times1/\sqrt5 = 0.447$, a reduction of $2.24$. **(c)** $P_{\rm tr}\propto a^{-1}$, so $\times1/5$. *Implication:* the methods have opposite biases in separation, so they should be deployed on different regions rather than competitively on the same one — transits and radial velocity inward, astrometry and imaging outward, with radial velocity spanning the middle.

**3.** **(a)** The inclination and the longitude of the ascending node, hence a true mass rather than $M_p\sin i$, and the orbit's orientation in three dimensions. **(b)** Because it yields **mutual inclinations** between planets, which record dynamical history: a system that formed in a disc and was left undisturbed should be coplanar, while one that suffered scattering should not — and radial velocity cannot address this at all. **(c)** Because an imaged planet's mass otherwise comes from its brightness plus an evolutionary model plus an assumed initial entropy, and hot versus cold start assumptions differ by a factor of several. An astrometric mass is dynamical and bypasses the model entirely.

**4.** **(a)** Van de Kamp reported one and later two Jupiter-mass planets orbiting Barnard's Star with a period near $24$ years, from a wobble of about $0.02$ arcseconds measured on thousands of photographic plates over decades. **(b)** Instrumental: the objective lens had been removed and re-installed and the plate holder adjusted, changing the plate scale, and the apparent stellar motion stepped at those dates. The identifying observation was that similar steps appeared in *other* stars measured on the same plates. **(c)** *A systematic common to all targets is invisible in any single target* — modern analogue: global astrometric solutions fitting instrument and sky together. *A signal at an instrumental or operational period deserves suspicion* — analogue: radial velocity signals near the stellar rotation period. *Long baselines accumulate instrumental change as well as sensitivity* — analogue: transit surveys treating spacecraft momentum dumps and detector ageing as first-class systematics.

**5.** **(a)** Proper motion is tens to hundreds of mas yr$^{-1}$, thousands of times the $496$ μas signal; parallax is $100{,}000$ μas at $10$ pc, about two hundred times it. **(b)** Because it is linear in time, so a sufficiently long baseline separates it from a curved periodic orbit without ambiguity. **(c)** Because it has a period of exactly one year, which is by definition an Earth analogue's period, so the two signals are nearly degenerate; only the difference in phase and orientation — the parallactic ellipse being fixed by the ecliptic — separates them, and doing so requires precision far beyond current capability.

**6.** **(a)** The measured position is the centroid of the star's light, not its centre of mass; a large spot on one hemisphere removes flux from that side and displaces the photocentre. **(b)** The stellar rotation period and its harmonics, as the spot rotates across the visible disc. **(c)** Radial velocity jitter from the same spots. Both arise because the star's surface is not uniform, both operate at the rotation period, and neither is reduced by better instrumentation — they are astrophysical rather than instrumental limits.

**7.** **(a)** Two lines of sight separated by a large fixed angle imaged onto a single focal plane; continuous scanning so every star is observed many times at many orientations; and a global solution fitting all stars and the instrument together, with the frame tied to quasars. **(b)** The two fields make positions differential across the sky rather than against local references, so no small patch of sky is trusted as a frame. Continuous multi-orientation scanning breaks degeneracies between the instrument's geometry and the sky's. The global solution absorbs instrumental change into fitted parameters rather than attributing it to individual stars, and the quasar tie supplies an inertial frame that does not drift. **(c)** Because the historical failure was not caused by imprecision — a sharper measurement of a plate-scale artefact is a more convincing artefact, not a less convincing one. The error had to be made visible as a parameter, which requires architecture rather than precision.

**8.** **(a)** The signal is $0.30$ μas from $10$ pc, roughly two orders of magnitude below current capability; and its one-year period is degenerate with parallax, which is the largest contaminant. **(b)** Astrometry's signal falls as $1/d$, confining it to the solar neighbourhood, whereas microlensing works at kiloparsec distances and is essentially indifferent to the lens's remoteness — the two have opposite distance dependences. **(c)** Short-period planets: hot Jupiters give the largest transit and radial velocity signals and among the smallest astrometric ones, since $\alpha\propto a$. Each method's easiest case tends to be another's hardest.

**9.** **(a)** *Transits:* nothing, unless the system happens to be aligned — $0.47\%$ probability for Earth, $0.089\%$ for Jupiter. *Radial velocity:* Jupiter ($12.5$ m s$^{-1}$) and Saturn ($2.8$ m s$^{-1}$) comfortably, Earth's $8.9$ cm s$^{-1}$ buried beneath solar activity. *Astrometry:* Jupiter ($496$ μas) and Saturn ($274$ μas) comfortably, Earth ($0.30$ μas) not at all. *Microlensing:* nothing, since the geometry would have to be arranged from elsewhere. *Direct imaging:* the giants in reflected light only at contrasts near $10^{-9}$, beyond current capability. **(b)** That no single method recovers even a well-populated system, so the composite picture is stitched from samples with entirely different biases in separation, mass, host type and distance. **(c)** Where two methods' domains fail to meet — most acutely at Earth-mass planets in year-long orbits around Sun-like stars, which transits reach only marginally at the edge of their baseline, radial velocity cannot separate from stellar activity, and astrometry cannot reach at all. That is exactly where the frequency of Earth analogues sits, and why it is the field's most contested number.$exAstro_master$,
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
