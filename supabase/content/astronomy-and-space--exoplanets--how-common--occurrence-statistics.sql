-- Astronomy & Space · Exoplanets — How Common? — "Occurrence Statistics".
-- Curated master for
-- astronomy-and-space/exoplanets/how-common/occurrence-statistics
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the How Common? block, and is where the selection-effect thread
-- running through every previous chapter is made into a method.
-- Organised around the structure of an occurrence rate: a ratio whose
-- numerator is a small count of marginal detections and whose
-- denominator is a construction, so the correction exceeds the
-- measurement and the answer is dominated by how the correction was
-- built. Treats completeness and reliability as separate quantities,
-- since a pipeline tuned to miss nothing admits false positives and the
-- two corrections push in opposite directions; the parent stellar
-- sample as the object that must be characterised rather than the
-- planet catalogue; the established results and their host-mass and
-- metallicity dependences; and extrapolation beyond the measured region
-- as the field's most common error.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers carried in from earlier chapters and re-checked: transit
-- probability R_star/a = 0.465% for an Earth-Sun analogue and 9.30%
-- for a hot Jupiter at 0.05 AU, so an Earth analogue detection carries
-- a geometric weight of 215; hot Jupiter occurrence ~1% of FGK stars;
-- 1-4 Earth-radius planets inside 100 days around 30-50% of Sun-like
-- stars; cold Neptunes of order one per star beyond the snow line from
-- microlensing; eta_Earth estimates spanning a few per cent to more
-- than fifty per cent from largely the same detections.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/how-common/occurrence-statistics',
    'research',
    'advanced',
    'read',
    $exOcc_master$> An occurrence rate looks like a simple thing: divide the number of planets found by the number of stars searched. **It is nothing like that.** The numerator is a handful of marginal detections, the denominator is a construction, and the weighting applied to each detection can be a factor of several hundred.

This is where every selection effect described in the preceding chapters has to be paid for. Transits see $0.47\%$ of Earth analogues. Radial velocity is limited by stellar activity below a metre per second. Microlensing detections are unrepeatable. Direct imaging reaches one per cent of the population, and an unrepresentative one per cent. **None of these is a defect to be apologised for; each is a known and calculable filter**, and an occurrence rate is the result of inverting it.

The chapter's claim is that **the interesting content of the subject is in the correction, not in the count** — and that the field's most contested number, the frequency of Earth analogues, is contested for reasons that are entirely methodological.

## 1. What an occurrence rate is

The quantity of interest is the number of planets per star in a specified region of parameter space, usually written as a density:

$$f = \frac{\partial^2 N_{\rm planets}}{\partial\log P\ \partial\log R_p}\ \text{per star}.$$

Three things are worth noticing about this definition.

**It is per star, not per system.** A rate can exceed one, and for small planets inside $100$ days it does, since multiple planets per system are common. Reporting "the fraction of stars with a planet" is a different quantity from "the number of planets per star", and the two are frequently conflated in summaries.

**It is a density in logarithmic bins**, because the underlying distributions are closer to power laws than to uniform, and because detection sensitivity varies smoothly in $\log P$ and $\log R$.

**It is defined over a specified region**, and the specification matters enormously. A rate quoted without its period and radius limits is uninterpretable, and comparisons between studies frequently founder on different bin definitions rather than on any real disagreement.

## 2. The inverse detection efficiency method

The standard estimator weights each detection by the reciprocal of the probability that it would have been detected:

$$f = \frac{1}{N_\star}\sum_{i\in\rm detections}\frac{1}{p_{{\rm geom},i}\,C_i},$$

where $p_{\rm geom}$ is the geometric transit probability and $C_i$ the detection completeness.

**The geometric factor is exact.** $p_{\rm geom} = R_\star/a$ is analytic geometry with no free parameters, and it is large: $0.465\%$ for an Earth–Sun analogue, so **each such detection stands for about $215$ systems.**

**The completeness factor is measured, not derived**, and it is where the difficulty lives.

### 2.1 Completeness by injection and recovery

$C_i$ is the probability that a transiting planet of given period and radius, around that particular star, would have been recovered by the search pipeline. It cannot be computed analytically, because it depends on the star's correlated noise, on how the detrending algorithm treats stellar variability, and on the detection threshold's behaviour in the presence of non-Gaussian systematics.

**It is therefore measured empirically.** Synthetic transits of known properties are injected into the real photometry, the actual pipeline is run blind, and the recovery fraction is recorded as a function of period, radius and host. This is the only trustworthy route, and it must be done star by star: a quiet star and an active one of the same brightness have very different completeness.

**Near the detection threshold, $C$ falls from near one to near zero across a narrow range**, and Earth analogues sit exactly there — three or four transits in a four-year mission, at amplitudes comparable to the noise. Small differences in how that transition is characterised produce large differences in the weight applied, and hence in the answer.

### 2.2 Reliability, the neglected half

Completeness asks: *of the planets that were there, how many did we find?* **Reliability asks the opposite: of the things we found, how many were real?** These are different quantities and they pull in opposite directions.

A pipeline tuned to miss nothing has high completeness and admits false positives. A conservative pipeline has high reliability and misses real planets. **Correcting for completeness without correcting for reliability inflates the occurrence rate**, and the inflation is worst near the detection threshold — which is again exactly where the interesting planets are.

**Reliability is measured by inverting the injection method**: scramble or invert the light curves to remove any real transits while preserving the noise properties, run the pipeline, and count what it finds. Anything detected in data containing no planets is a false positive, and the rate as a function of period and radius gives the reliability correction.

**This was not done in the earliest occurrence analyses**, and revisions have been substantial. A long-period Earth-sized candidate sample can be contaminated at the tens of per cent level, and since those are precisely the objects entering an $\eta_\oplus$ estimate, the effect on the headline number is large. **Any occurrence rate quoted without a reliability correction should be treated as an upper limit.**

## 3. The stellar sample is the real object

An occurrence rate divides by $N_\star$, and getting that right is harder than it sounds.

**The parent sample must be defined independently of the planets.** Selecting stars because they have planets, or with a target list assembled for other reasons, produces a denominator that does not correspond to the numerator.

**Every star's properties must be characterised**, because completeness depends on the individual star: its radius sets the transit depth of a given planet, its brightness sets the photon noise, its variability sets the correlated noise, and its mass sets the relation between period and semi-major axis. **A rate is a sum over stars, not a division by a number.**

**Stellar radius errors propagate directly.** Since planet radius is $R_\star$ times a measured ratio, an error in the stellar radius moves the planet across radius bins. Gaia's parallaxes moved a substantial fraction of the Kepler sample, and occurrence rates in specific radius bins moved with them — which is one reason pre-Gaia and post-Gaia occurrence papers are not directly comparable.

**Contamination matters.** A target list that includes evolved stars misclassified as dwarfs will have inflated stellar radii, hence inflated planet radii, hence planets assigned to the wrong bins, and — because giants are larger — suppressed completeness that is not accounted for.

```checkpoint
q: Why is completeness measured by injecting synthetic transits into real data rather than calculated from the noise properties?
a: Because the noise properties are not measured accurately enough
x: Noise is well characterised; the problem is that the pipeline's response to it is not analytically predictable.
a*: Because completeness depends on how the actual pipeline responds to real correlated noise, detrending choices and a threshold whose behaviour in non-Gaussian noise cannot be derived
a: Because injection is faster than an analytic calculation
x: Injection-and-recovery is computationally expensive, requiring the full pipeline to be run many times.
a: Because the analytic calculation would require knowing the true planet population in advance
x: A completeness calculation is conditioned on assumed planet properties and does not require the true population.
hint: Ask what would have to be modelled to predict, from first principles, whether a given transit would be recovered.
why: Detection completeness is the probability that a transiting planet of a given period and radius, around a specific star, would be found by the search. Predicting it analytically would require modelling the pipeline's full behaviour — how the detrending algorithm treats that star's variability, how correlated non-Gaussian systematics interact with the matched filter, how the threshold performs when the noise is not white — and none of that is derivable from summary noise statistics. **Injecting synthetic transits of known properties into the real photometry and running the actual pipeline blind measures the answer directly**, including every effect nobody thought to model. It must be done star by star, since a quiet star and an active one of identical brightness have very different completeness. The stakes are high because near the detection threshold $C$ falls from near one to near zero across a narrow range, and Earth analogues sit exactly there — three or four transits in a four-year mission at amplitudes comparable to the noise. Each detection is weighted by $1/(p_{\\rm geom}C)$, factors of hundreds, so a modest error in characterising that transition produces a large error in the rate.
---
q: An occurrence analysis corrects for completeness but not for reliability. What is the consequence?
a: The rate is underestimated, since real planets were missed
x: Missed planets are exactly what the completeness correction addresses; the omission here works the other way.
a*: The rate is overestimated, because false positives are counted as detections and then multiplied by large completeness weights — worst near the threshold, where $\eta_\oplus$ candidates sit
a: There is no consequence, since false positives are removed by vetting before the occurrence analysis
x: Vetting removes many but not all, and the residual rate is exactly what a reliability correction quantifies.
a: The rate's uncertainty is underestimated but its central value is unaffected
x: The central value shifts upward, since spurious detections enter the sum with the same large weights as real ones.
hint: Completeness and reliability answer opposite questions. Ask what each one corrects for.
why: **Completeness** asks how many real planets were missed and corrects upward. **Reliability** asks how many detections were spurious and corrects downward. Omitting the second leaves false positives in the numerator, and since each detection is multiplied by $1/(p_{\\rm geom}C)$ — factors of hundreds for long-period small planets — **a spurious detection inflates the rate as much as a real one.** The effect is worst near the detection threshold, because that is where a pipeline tuned for completeness admits the most noise events, and it is exactly where the long-period Earth-sized candidates that dominate an $\\eta_\\oplus$ estimate live. Reliability is measured by inverting the injection method: scramble or invert the light curves so that no real transit survives while the noise properties are preserved, run the pipeline, and count what it reports — anything found is by construction spurious. Early occurrence analyses omitted this step, and subsequent revisions were substantial, with long-period small-planet candidate samples proving contaminated at the tens of per cent level. **A rate quoted without a reliability correction should be read as an upper limit.**
```

## 4. What the measurements say

With those cautions, the established results.

**Hot Jupiters: about $1\%$** of FGK stars. Small, robust across methods, and — as the hot Jupiters chapter set out — utterly disproportionate to their share of early detections.

**Small planets are abundant.** Planets of $1$–$4\,R_\oplus$ with periods inside $100$ days occur around roughly $30$–$50\%$ of Sun-like stars, with multiple planets per system common, so the number of such planets per star approaches or exceeds unity. **This is the dominant population wherever occurrence can be measured.**

**Cold planets are abundant too.** Microlensing gives of order one bound planet per star beyond the snow line, with cold Neptunes apparently the commonest class there — a completely independent measurement of a region transits cannot reach.

**Giant planet frequency rises steeply with host metallicity.** This is the strongest known correlation in the field and is the principal evidence for core accretion, since the mechanism depends on solid content and gravitational instability does not. Notably, **the correlation is weak or absent for small planets**, which core accretion can build from a modest solid inventory.

**Occurrence depends on host mass.** Small planets are more common per star around M dwarfs than around Sun-like stars; giant planets are less common. Both trends are consistent with core accretion in discs whose mass scales with the star's: less material makes giants harder and does not prevent small planets.

**The Solar System is not typical.** It has no planet inside $0.39$ AU where the commonest architecture packs several, and no super-Earths at all.

## 5. Joining methods

Each technique measures occurrence in its own region, and the composite picture requires joining them. **The joins are where the errors are.**

| Method | Region | Measures |
|---|---|---|
| Transits | $< 1$ AU, $R_p > 0.5\,R_\oplus$ | Radius distribution |
| Radial velocity | $< 5$ AU, $M_p\sin i$ | Mass distribution |
| Microlensing | $1$–$5$ AU, any distance | Mass ratio distribution |
| Direct imaging | $> 10$ AU, young massive | Mass distribution, model-dependent |

**Three distinct difficulties arise in combining them.**

**Different observables.** Transits measure radius, radial velocity measures mass, microlensing measures mass ratio. Converting between them requires a mass–radius relation whose intrinsic scatter — established in the masses and radii chapter as physical rather than observational — means the conversion is a distribution, not a mapping.

**Different stellar samples.** Transit surveys observe a magnitude-limited sample in one Galactic direction; microlensing samples stars across the disc and bulge with unmeasured properties; imaging targets young nearby moving groups. **These are different populations**, and occurrence may genuinely differ between them.

**Gaps between regions.** No method covers $5$–$10$ AU well, and the region where transit sensitivity ends and microlensing begins is covered by neither with good statistics. **Statements about the full radial distribution of planets interpolate across gaps**, and the interpolation is rarely displayed as such.

{{image: Kepler-90 | A system of eight known planets around a Sun-like star, discovered by the transit method. Systems of this multiplicity are valuable to occurrence studies out of proportion to their number, because an aligned coplanar configuration reveals every planet at once and so measures multiplicity directly rather than inferring it. The wider point the mission established is statistical rather than anecdotal: by observing a defined sample of stars continuously with a detection threshold that could be characterised by injecting synthetic transits and measuring recovery, it made the denominator of an occurrence rate constructible for the first time.}}

{{image: Red dwarf | The most numerous class of star in the Galaxy, and one around which planet occurrence differs from the Sun-like case in opposite directions depending on planet size: small planets are more common per star, giant planets less so. Both trends follow naturally from core accretion in discs whose mass scales with the host's — less solid material makes giants harder to assemble while leaving small planets unaffected. Because such stars are small and their habitable zones close in, they also dominate the detected sample of small temperate planets for reasons of detectability alone, which is a selection effect that must be undone before any statement about planets in general can be made from that sample.}}

```checkpoint
q: Small planets are more common per star around M dwarfs while giant planets are less common. What explains both trends together?
a: M dwarfs are older on average, so their giant planets have had time to be ejected
x: There is no mechanism that preferentially removes giants over gigayears while leaving compact small-planet systems intact.
a*: Core accretion in discs whose mass scales with the host's — less solid material makes giant cores hard to assemble before the gas disperses, while small planets need far less and are unaffected
a: M dwarf discs are truncated by the star's magnetic field, removing the outer region where giants form
x: Magnetic truncation affects the innermost disc, not the giant-forming region at several AU.
a: The two trends have unrelated causes and no single explanation covers them
x: A single mechanism accounts for both, which is part of why the pattern is taken as evidence for it.
hint: Ask what each planet class requires in the way of solid material, and how the available amount scales with stellar mass.
why: Disc mass scales roughly with stellar mass, so a low-mass star's disc contains less solid material. **A giant requires a core of about ten Earth masses before runaway gas accretion begins, and it must be assembled before the gas disperses in about three million years** — a demanding requirement that becomes harder as the solid budget falls, so giants are rarer around M dwarfs. A small planet requires far less material and comfortably fits the budget, so its formation is not similarly suppressed; and with the disc's inner regions correspondingly closer in, compact multiples remain easy to build. **One mechanism therefore produces trends of opposite sign for the two classes**, which is a stronger argument for it than either trend alone would be, since an ad hoc explanation would have to account for each separately. The same reasoning underlies the metallicity correlation: giant frequency rises steeply with host metallicity while small planet frequency does not, because the solid inventory is what limits giants and not what limits small planets.
---
q: Why is it misleading to describe an occurrence rate as "the fraction of stars with a planet"?
a: Because occurrence rates are always quoted as upper limits
x: They are point estimates with uncertainties, not limits, once completeness and reliability are handled.
a*: Because the rate counts planets per star, which exceeds one where multiplicity is common — so it is a different quantity from the fraction of stars hosting at least one
a: Because some detected planets turn out to be false positives
x: Reliability is a separate correction, and it affects both quantities equally.
a: Because the rate is defined per logarithmic interval, so it has different units
x: True and worth noting, but the confusion described here persists even for a rate integrated over a bin.
hint: Ask what value each quantity can take, and where they must diverge.
why: The fraction of stars hosting at least one planet cannot exceed unity. **The number of planets per star can**, and for planets of one to four Earth radii inside a hundred days it approaches or exceeds one, because systems containing several such planets are common. The two quantities therefore diverge exactly in the regime that dominates the known population, and conflating them either understates multiplicity or overstates the fraction of hosts — both of which appear regularly in summaries. Converting between them requires knowing the multiplicity distribution, which is itself uncertain because of the Kepler dichotomy: the excess of single-transiting systems is consistent both with a spread of mutual inclinations, in which case multiplicity is high and singles are viewing effects, and with a genuine population of single-planet systems left by instabilities. **So the conversion depends on an unresolved question**, which is a further reason to quote whichever quantity was actually measured rather than the one that sounds more intuitive.
```

## 6. $\eta_\oplus$, and why it will not settle

The frequency of roughly Earth-sized planets in roughly Earth-like orbits around roughly Sun-like stars. Published estimates span **from a few per cent to more than fifty per cent**, using largely the same detections.

**The disagreement is not about the data.** It arises from four choices, each defensible and each consequential.

**Definition.** What counts as Earth-sized — $0.8$–$1.25\,R_\oplus$, or $0.5$–$1.5$? What counts as the habitable zone — a conservative or an optimistic boundary? What counts as Sun-like? **These choices alone move the answer by a factor of several**, and comparisons between studies frequently compare different quantities.

**Completeness near threshold.** Earth analogues sit where recovery probability changes fastest, so the weight applied to each detection is most uncertain exactly where it is largest.

**Reliability.** The long-period small-planet candidates are the most contaminated, and treatments differ.

**Extrapolation.** Kepler's four-year baseline gives few genuine one-year detections around Sun-like stars, so most estimates extrapolate from shorter periods or smaller radii using an assumed functional form. **The extrapolation frequently dominates the result**, and different reasonable forms give different answers.

**A candid assessment.** The honest statement is that $\eta_\oplus$ is somewhere between a few per cent and a few tens of per cent, that the uncertainty is methodological rather than statistical, and that more of the same data will not resolve it. **What would resolve it is a survey with a longer baseline around Sun-like stars**, which is why that is the design driver for the missions intended to settle the question.

It is worth saying plainly that this is not a scandal. A quantity requiring extrapolation beyond the measured region, with corrections larger than the measurement, is expected to be uncertain by a large factor. **The error is not in the estimates but in quoting any of them without their definition and their extrapolation.**

```checkpoint
q: Published values of $\eta_\oplus$ span from a few per cent to over fifty per cent using largely the same detections. What follows?
a: That most of the published analyses contain errors
x: The analyses are defensible; they differ in choices rather than in correctness.
a*: That the uncertainty is methodological — arising from definitions, completeness near threshold, reliability treatment and extrapolation — so more of the same data will not resolve it
a: That Earth analogues are so rare that the measurement is essentially an upper limit
x: The spread includes values large enough that rarity is not the issue; the spread itself is the issue.
a: That the transit method is unsuitable for measuring this quantity
x: It is the only method with any sensitivity there; the difficulty is the extrapolation, not the technique.
hint: Ask whether collecting more of the same observations would narrow the range.
why: Four choices drive the spread, and each is defensible. **Definition:** whether Earth-sized means $0.8$–$1.25\\,R_\\oplus$ or $0.5$–$1.5$, whether the habitable zone is conservative or optimistic, and what counts as Sun-like — these alone move the answer by a factor of several, so studies frequently compare different quantities while appearing to disagree. **Completeness:** Earth analogues sit where recovery probability falls fastest, so the largest weights carry the least certain corrections. **Reliability:** long-period small-planet candidates are the most contaminated, and treatments differ. **Extrapolation:** a four-year baseline yields few genuine one-year detections around Sun-like stars, so most estimates extrapolate from shorter periods or smaller radii under an assumed functional form, and that assumption often dominates the result. Since none of these is a statistical limitation, **more of the same data does not help** — what helps is a longer baseline around Sun-like stars, which is the design driver for the missions intended to settle it. The correct posture is not to distrust the estimates but to refuse to quote any of them without its definition and its extrapolation attached.
---
q: Combining occurrence measurements from transits and microlensing into a single radial distribution requires care. What is the most serious difficulty?
a: The two methods have different sensitivities, so the combined distribution is uneven
x: Uneven sensitivity is handled by the completeness corrections within each method's own domain.
a*: They measure different observables on different stellar populations with a gap between their regions — so the combination requires a mass–radius conversion with intrinsic scatter, and interpolation across territory neither covers
a: Microlensing detections are unrepeatable, so they cannot be included in statistical analyses
x: Unrepeatability affects individual claims; population results from survey-only microlensing are statistically sound.
a: The two methods disagree about the planets they both detect
x: Their domains barely overlap, so direct comparison on common objects is rarely possible.
hint: List what each measures, about which stars, and over what range of separation.
why: Three difficulties compound. **Different observables:** transits give radius, microlensing gives a mass ratio, so joining them requires a mass–radius relation whose scatter is physical rather than observational — the conversion is a distribution, not a mapping, and treating it as the latter understates the uncertainty. **Different stellar populations:** transit surveys observe a magnitude-limited sample in one Galactic direction with well-characterised hosts, while microlensing samples stars across the disc and bulge whose masses and metallicities are usually unmeasured, so occurrence may genuinely differ between them rather than the difference being an artefact. **A gap:** no method covers $5$–$10$ AU with good statistics, so a full radial distribution interpolates across territory neither has surveyed. Each is manageable and each is routinely under-displayed: composite distributions are often plotted as continuous curves without marking where the data end and the interpolation begins. **The join is where the error is**, and a composite result's reliability is set by its weakest join rather than by its best-measured region.
```

## 7. What extrapolation does

The most common error in using occurrence rates is extending them beyond the region where they were measured.

**The measured region is small.** Transit occurrence is measured for periods below roughly a year and radii above roughly Earth-size, around stars of specific types, in one Galactic direction. That is a modest volume of parameter space.

**Power-law extrapolation is seductive and unreliable.** Occurrence distributions are approximately power laws over the measured range, so extending them is arithmetically easy. But the radius valley demonstrates that real structure exists on scales smaller than typical bins, and a smooth extrapolation across an unmeasured region can miss a feature entirely — the valley itself was invisible until stellar radii improved.

**Extrapolating in host type is worse.** Occurrence around M dwarfs differs from occurrence around Sun-like stars in both directions depending on planet size, so extending a measurement from one host class to another is not conservative in either direction.

**A useful discipline:** when quoting an occurrence rate, state the region measured and the region to which it is being applied, and if these differ, say by how much and under what assumed form. **This is rarely done, and its absence is the single most common defect in the popular and semi-technical presentation of these results.**

```checkpoint
q: A composite figure shows planet occurrence as a continuous function of orbital separation from $0.01$ to $100$ AU. What should a reader check first?
a: Whether the vertical axis is a density or a cumulative count
x: Worth checking, but it does not bear on the figure's most serious potential defect.
a*: Where each method's measured region ends and where the curve is interpolated or extrapolated — particularly the $5$–$10$ AU gap that no method covers with good statistics
a: Whether the same stellar sample was used throughout
x: A genuine issue, since the populations differ, but the gap is the more fundamental problem because no data exist there at all.
a: Whether the error bars include systematic as well as statistical uncertainty
x: Important, but error bars cannot be drawn at all in a region where nothing was measured.
hint: List which separations each method actually reaches, and ask what lies between them.
why: Transits measure occurrence inside about $1$ AU; radial velocity reaches to a few AU with decade-long baselines; microlensing peaks at $1$–$5$ AU; direct imaging begins beyond about $10$ AU and only for young massive planets. **The interval from roughly $5$ to $10$ AU is covered by none of them with useful statistics**, so any curve drawn across it is interpolation rather than measurement — and composite figures routinely render it as a continuous line indistinguishable from the measured portions. Two further joins deserve the same scrutiny. The methods measure **different observables** — radius, minimum mass, mass ratio — so combining them requires a mass–radius conversion whose scatter is physical rather than observational, making it a distribution rather than a mapping. And they observe **different stellar populations**: a magnitude-limited transit sample in one Galactic direction, microlensing sources across the disc and bulge with unmeasured properties, imaging targets in young nearby moving groups. **A composite result's reliability is set by its weakest join**, and a figure that does not mark where measurement ends has concealed exactly the information needed to judge it.
---
q: What does the chapter mean by saying that "when a correction is larger than the measurement, the correction is the experiment"?
a: That the raw detections are unreliable and should be discarded in favour of modelled quantities
x: The detections are real and essential; the point concerns where the intellectual work and the uncertainty reside.
a*: That the injection-and-recovery completeness, the reliability testing and the characterised parent sample determine the result more than the detections do — so characterising the search is where the science actually happens
a: That occurrence rates are model-dependent and therefore not measurements
x: They are measurements, conditioned on a characterised selection function; the claim is about where the effort belongs, not about their status.
a: That larger surveys are needed before occurrence rates can be trusted
x: The point is the opposite — the limiting work is on the selection function rather than on collecting more detections.
hint: Ask which parts of an occurrence analysis involve observing a planet, and which do not.
why: Each Earth-analogue detection is multiplied by a geometric weight of $215$ and by a completeness correction that can be several more, so **the number reported depends far more on how those factors were determined than on the handful of detections themselves.** And none of the work determining them involves observing another planet: injecting synthetic transits into real photometry and running the pipeline blind, inverting light curves to measure the false positive rate, characterising every star in the parent sample so that per-star completeness can be computed. That is where an occurrence rate comes from. The field's transition from a catalogue of curiosities into a quantitative science happened when effort moved from finding planets to characterising the search — which inverts the usual intuition that data collection is the science and analysis is bookkeeping. **The generalisation is that in any measurement dominated by selection, the design and characterisation of the selection function is the experiment**, and a study reporting its detections carefully but its selection function vaguely has published the less important half.
```

```checkpoint
q: Two occurrence studies report different rates for "small planets in the habitable zone". Before concluding they disagree, what should be checked?
a: Which used the larger stellar sample, since the larger one is more reliable
x: Sample size affects precision but not the definitional mismatch that most often produces apparent disagreements.
a*: Whether they defined the radius range, the habitable zone boundaries and the host spectral types identically — different bin definitions produce different numbers for the same population
a: Whether both corrected for completeness
x: Necessary, and worth checking, but even two fully corrected analyses will differ if they measured different regions.
a: Whether they used the same detection pipeline
x: Pipelines differ legitimately, and completeness is characterised per pipeline; this is not the leading cause of divergence.
hint: An occurrence rate is a density over a specified region. Ask what happens if two studies specify different regions.
why: An occurrence rate is defined as a density over a stated region of period and radius around a stated class of host, so **two studies adopting different bins are measuring different quantities and are entitled to report different numbers.** The choices that matter here are large: whether Earth-sized means $0.8$–$1.25\,R_\oplus$ or $0.5$–$1.5$, whether the habitable zone uses conservative or optimistic boundaries, and whether "Sun-like" admits early K and late F stars — each of which moves the answer by a substantial factor, and together by several. A great many apparent disagreements in the literature dissolve on inspecting the definitions, and the remaining genuine ones concern completeness near threshold, reliability treatment and extrapolation. The practical discipline is to read the bin definitions before the abstract's number, and when quoting a rate, to carry its definition with it. **A number without its region is uninterpretable rather than merely imprecise**, which is why comparisons between studies are so often comparisons between different measurements wearing the same name.
---
q: Why does the frequency of giant planets correlate steeply with host metallicity while the frequency of small planets does not?
a: Because metal-rich stars are more massive, and massive stars form giants more readily
x: Metallicity and stellar mass are separable in the samples, and the correlation persists at fixed mass.
a*: Because a giant needs a solid core of about ten Earth masses assembled before the gas disperses, which depends on the disc's solid inventory, while a small planet needs far less and is not similarly limited
a: Because metal-rich discs are more opaque, so they cool faster and fragment gravitationally
x: That is the gravitational instability route, which the metallicity correlation actually argues against, since it is insensitive to solid content.
a: Because giant planets are easier to detect around metal-rich stars, whose spectra have more lines
x: The effect survives correction for measurement precision, and its absence for small planets rules out a purely instrumental cause.
hint: Ask which formation step is rate-limiting for each class, and what supplies the material for it.
why: Core accretion requires a solid core of roughly ten Earth masses before runaway gas accretion can begin, and that assembly must complete within the disc's lifetime of about three million years. **The rate-limiting resource is condensable material, which is what metallicity measures**, so raising the metallicity makes giants substantially more likely and lowering it makes them rare. A small planet requires an order of magnitude less solid material and is comfortably built even from a modest inventory, so its formation is not limited by the same resource and shows little or no metallicity dependence. The differential is what makes the argument strong: **a single mechanism predicts a steep correlation for one class and a flat one for the other**, whereas an instrumental explanation would affect both and gravitational instability — which depends on gas mass and cooling rather than on solids — predicts no metallicity dependence for giants at all. This is why the correlation is treated as the principal evidence for core accretion as the dominant channel, and it pairs with the host-mass trends, which the same mechanism explains in opposite directions for the two classes.
```

## 8. Pulling the thread

- **An occurrence rate is a construction, not a count.** Each Earth analogue detection carries a geometric weight of $215$ before completeness, so the correction dominates the measurement.
- **Completeness must be measured, not derived**, by injecting synthetic transits into real data and running the real pipeline — star by star, because a quiet and an active star of equal brightness differ greatly.
- **Reliability is the neglected half.** It corrects downward where completeness corrects upward, it is measured by running the pipeline on light curves with the planets removed, and omitting it inflates rates most where the interesting planets are.
- **The denominator is a sum over characterised stars**, not a number — and stellar radius errors move planets between bins, which is why pre- and post-Gaia occurrence papers are not comparable.
- **The results are robust where measured:** hot Jupiters at $1\%$, small planets around $30$–$50\%$ of Sun-like stars, cold Neptunes common beyond the snow line, giants correlating steeply with metallicity, occurrence varying with host mass in opposite directions for small and large planets.
- **The joins between methods are the weak points** — different observables, different populations, and a gap at $5$–$10$ AU that composite plots rarely mark.
- **$\eta_\oplus$ is methodologically rather than statistically uncertain**, so more of the same data will not settle it; a longer baseline around Sun-like stars will.

The transferable idea: **when a correction is larger than the measurement, the correction is the experiment.** Everything that makes an occurrence rate believable — the injection-and-recovery completeness, the inverted-light-curve reliability, the characterised parent sample, the per-star weighting — is work on the denominator, and none of it involves observing another planet. The field's advance from a catalogue of curiosities to a quantitative science happened when the effort moved from finding planets to characterising the search. **This inverts the usual intuition that data collection is the science and analysis is bookkeeping**, and the inversion is general: in any measurement dominated by selection, the design and characterisation of the selection function is where the result actually comes from, and a study that reports its detections carefully but its selection function vaguely has published the less important half.

## 9. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Sara Seager | Exoplanets | 2010}}

{{book: Eric Feigelson and Jogesh Babu | Modern Statistical Methods for Astronomy | 2012}}

Beyond the books: Feigelson and Babu is the best treatment of the statistical machinery — truncated and censored data, selection functions, and hierarchical models — and is written for astronomers rather than statisticians. On occurrence specifically, the most instructive reading is two studies of the same dataset that reach different $\eta_\oplus$ values, compared for their definitional choices and extrapolation assumptions rather than their results; the disagreements are the content. The Kepler team's papers on catalogue reliability, describing the inverted-light-curve method, are worth reading directly because the technique is simple and its consequences were large.

## Problems

*Useful numbers: $f = (1/N_\star)\sum 1/(p_{\rm geom}C)$; $p_{\rm geom} = R_\star/a = 0.465\%$ for an Earth–Sun analogue and $9.30\%$ at $0.05$ AU; hot Jupiter occurrence $\sim1\%$ of FGK stars; $1$–$4\,R_\oplus$ planets inside $100$ d around $30$–$50\%$ of Sun-like stars; microlensing gives of order one planet per star beyond the snow line; $\eta_\oplus$ estimates span a few per cent to more than $50\%$.*

**1.** *(Definition.)* **(a)** Write the occurrence rate as a density and state its units. **(b)** Explain the difference between planets per star and fraction of stars with a planet, and state when they diverge. **(c)** State why a rate quoted without its period and radius limits is uninterpretable.

**2.** *(The estimator.)* **(a)** Write the inverse detection efficiency estimator. **(b)** State which factor is exact and which is measured. **(c)** Compute the geometric weight for an Earth–Sun analogue and for a hot Jupiter.

**3.** *(Completeness.)* **(a)** State what $C$ represents. **(b)** Explain why it cannot be derived analytically. **(c)** Describe the injection-and-recovery procedure and state why it must be done per star.

**4.** *(Reliability.)* **(a)** State the question reliability answers and its direction of correction. **(b)** Describe how it is measured. **(c)** State what an occurrence rate lacking it should be treated as, and where the effect is worst.

**5.** *(The denominator.)* **(a)** Explain why the parent stellar sample must be defined independently of the planets. **(b)** State three stellar properties that affect completeness and how. **(c)** Explain why pre-Gaia and post-Gaia occurrence rates are not directly comparable.

**6.** *(Results.)* State the established occurrence results for hot Jupiters, small close-in planets, and cold planets beyond the snow line, and give the two correlations with host properties.

**7.** *(Joining.)* **(a)** Give the four methods' domains and observables. **(b)** Name the three difficulties in combining them. **(c)** State which is most often under-displayed in composite figures.

**8.** *($\eta_\oplus$.)* **(a)** Give the range of published values. **(b)** Name the four choices producing the spread and state which usually dominates. **(c)** State what would resolve it and why more data of the same kind will not.

**9.** *(Extrapolation.)* **(a)** State the size of the measured region for transit occurrence. **(b)** Give two reasons power-law extrapolation is unreliable. **(c)** State the discipline the chapter recommends and why its absence matters.

## Worked answers

**1.** **(a)** $f = \partial^2N_{\rm planets}/\partial\log P\,\partial\log R_p$ per star — planets per star per logarithmic interval of period and radius. **(b)** Planets per star counts every planet, so it exceeds one where multiplicity is common; fraction of stars with at least one planet cannot exceed one. They diverge exactly where systems commonly host several planets, which is the regime of small close-in planets — so summaries that conflate them understate multiplicity or overstate the fraction of hosts. **(c)** Because the rate is a density over a specified region, and the answer depends entirely on the region: different studies adopting different bins report different numbers for the same underlying population, and most apparent disagreements in the literature are of this kind.

**2.** **(a)** $f = (1/N_\star)\sum_{i}1/(p_{{\rm geom},i}C_i)$, summed over detections. **(b)** $p_{\rm geom} = R_\star/a$ is exact analytic geometry; $C$ is measured empirically. **(c)** Earth–Sun: $1/0.00465 = 215$. Hot Jupiter at $0.05$ AU: $1/0.0930 = 10.8$. The Earth analogue's weight is twenty times larger, so its detections carry correspondingly more leverage and more risk.

**3.** **(a)** The probability that a transiting planet of given period and radius, around that specific star, would have been recovered by the search pipeline. **(b)** Because it depends on the pipeline's response to real correlated non-Gaussian noise, on how detrending treats that star's variability, and on threshold behaviour that is not derivable from summary noise statistics. **(c)** Synthetic transits of known properties are injected into the real photometry, the actual pipeline is run blind, and the recovery fraction is recorded as a function of period and radius. It must be per star because completeness depends on the individual star's noise properties — a quiet and an active star of identical brightness differ greatly.

**4.** **(a)** Of the things detected, how many were real; it corrects the rate downward, where completeness corrects upward. **(b)** By scrambling or inverting the light curves so that no real transit survives while the noise properties are preserved, running the pipeline, and counting detections — all of which are spurious by construction. **(c)** As an upper limit. The effect is worst near the detection threshold, where a completeness-tuned pipeline admits the most noise events, and therefore worst for the long-period small planets that dominate $\eta_\oplus$ estimates.

**5.** **(a)** Because selecting stars on the basis of hosting planets, or from a list assembled for unrelated reasons, produces a denominator that does not correspond to the numerator — the rate would then be conditioned on the selection rather than measuring the population. **(b)** Stellar radius sets the transit depth of a given planet and hence detectability; brightness sets the photon noise; variability sets the correlated noise that dominates near threshold. *(Stellar mass also sets the period–semi-major-axis relation and hence the geometric probability.)* **(c)** Because planet radius is the stellar radius times a measured ratio, so Gaia's revision of stellar radii moved planets between radius bins, changing the rates assigned to each bin without any change in the photometry.

**6.** *Hot Jupiters:* about $1\%$ of FGK stars. *Small close-in planets:* $1$–$4\,R_\oplus$ inside $100$ days around roughly $30$–$50\%$ of Sun-like stars, with multiplicity common so that planets per star approaches or exceeds unity. *Cold planets:* of order one bound planet per star beyond the snow line from microlensing, with cold Neptunes apparently commonest. *Correlations:* giant planet frequency rises steeply with host metallicity, which is the principal evidence for core accretion and is weak or absent for small planets; and occurrence depends on host mass, with small planets more common and giants less common around M dwarfs than around Sun-like stars.

**7.** **(a)** Transits, inside $1$ AU, measuring radius. Radial velocity, inside $5$ AU, measuring $M_p\sin i$. Microlensing, $1$–$5$ AU at any distance, measuring mass ratio. Direct imaging, beyond $10$ AU for young massive planets, measuring a model-dependent mass. **(b)** Different observables, requiring a mass–radius conversion whose intrinsic scatter makes it a distribution rather than a mapping; different stellar populations, so occurrence may genuinely differ; and a gap at $5$–$10$ AU covered by no method with good statistics. **(c)** The gap. Composite radial distributions are frequently drawn as continuous curves without marking where measurement ends and interpolation begins.

**8.** **(a)** From a few per cent to more than $50\%$. **(b)** Definition of Earth-sized, of the habitable zone and of Sun-like; completeness near threshold; reliability treatment; and extrapolation beyond the measured period range. The extrapolation usually dominates, since a four-year baseline yields few genuine one-year detections around Sun-like stars. **(c)** A survey with a longer baseline around Sun-like stars, which would supply real detections where estimates currently extrapolate. More of the same data does not help because the uncertainty is methodological rather than statistical — additional short-period detections do not constrain the extrapolated region.

**9.** **(a)** Periods below roughly a year, radii above roughly Earth-size, around stars of specific spectral types, in one Galactic direction — a modest volume of parameter space. **(b)** Because real structure exists on scales finer than typical bins, as the radius valley demonstrates — and that valley was itself invisible until stellar radii improved, so a smooth extrapolation can erase a genuine feature; and because occurrence varies with host type in opposite directions for small and large planets, so extending across host classes is not conservative in either direction. **(c)** State the region measured and the region of application, and if they differ, state by how much and under what assumed functional form. Its absence matters because an extrapolated rate presented as a measured one transfers the assumed form's authority to the data, and readers cannot see which part of the number is observation and which is assumption.$exOcc_master$,
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
