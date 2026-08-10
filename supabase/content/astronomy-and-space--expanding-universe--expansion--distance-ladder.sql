-- Astronomy & Space · The Expanding Universe — Expansion — "The Distance Ladder".
-- Curated master for
-- astronomy-and-space/expanding-universe/expansion/distance-ladder
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The third Expansion chapter, and the one the previous two keep deferring
-- to: Hubble's slope was right and his calibration wrong sevenfold, and
-- the modern tension lives in the same place. Organised around the
-- structural fact that the ladder is serial, so a systematic in any rung
-- propagates to the top undiminished while statistical error averages
-- down - which is why more data cannot resolve the H0 disagreement and
-- why the argument is about calibration rather than counting. Parallax as
-- the one rung that assumes nothing; the standard-candle rungs with the
-- distance modulus worked through; Type Ia supernovae and why the ladder
-- must reach past the peculiar-velocity regime; the error-propagation
-- arithmetic done explicitly for correlated and independent cases; and
-- the rung-independent routes - megamasers, lensing time delays,
-- standard sirens - that matter precisely because they break the serial
-- structure. ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/expansion/distance-ladder',
    'research',
    'advanced',
    'read',
    $expLad_master$> Every extragalactic distance rests on a chain of calibrations, each rung calibrated by the one below it. That structure has a consequence which governs the entire subject: **a systematic error in any rung propagates to the top undiminished, and no amount of additional data removes it.** Statistical error averages down; calibration error does not. This is why Hubble's slope was right while his distances were wrong by a factor of seven, and why today's disagreement over $H_0$ is argued in terms of zero points rather than sample sizes.

The two previous chapters both deferred here. Hubble's law needs distances to have a slope at all; redshift is model-independent precisely *because* it is not a distance. This chapter is about the hard half.

## Why a ladder at all

The problem is one of range. Distances of interest span from tens of parsecs to thousands of megaparsecs — eight orders of magnitude — and **no single method covers more than two or three.**

- **Geometry** works where a baseline is usable and the angles are measurable, which fails beyond a few kiloparsecs.
- **Standard candles** work where the objects are bright enough to identify individually, which fails beyond tens of megaparsecs for most of them.
- **Standard candles bright enough to see at gigaparsecs** — supernovae — are rare, transient, and cannot be calibrated locally without waiting for one nearby.

So the structure is forced: use each method where it works, and calibrate each against the one below in a **region of overlap** where both apply. The ladder is not an aesthetic choice; it is what the finite range of every technique compels.

And that is exactly where the fragility comes from. **The ladder is serial.** A rung is only as good as the rung beneath it, and an error in the bottom rung shifts everything above it by the same factor — silently, since nothing higher up can detect it.

```checkpoint
q: Why must extragalactic distances be measured by a chain of methods rather than by one method applied throughout?
a: Because different physical processes operate at different distances, so no single law of physics applies across the range
x: The physics does not change with distance; what changes is which observational technique remains usable.
a*: Because the required range spans about eight orders of magnitude while no single technique covers more than two or three — geometry fails beyond kiloparsecs, individually resolvable candles beyond tens of megaparsecs
a: Because measurement uncertainty grows with distance, so different methods are needed to keep it constant
x: Uncertainty does grow along the chain, but that is a consequence of the serial structure rather than the reason for it — a single method with growing errors would still be preferable if one existed.
a: Because the expansion of the universe invalidates geometric methods at large distances
x: Expansion complicates the *interpretation* of distance at high redshift, but geometric parallax fails long before that, for want of measurable angles.
hint: Ask over how many decades of distance each technique actually works.
why: The distances of interest run from tens of parsecs to thousands of megaparsecs — eight orders of magnitude — and every technique has a limited domain. Parallax needs a measurable angle and fails past a few kiloparsecs; standard candles need individually resolvable objects and fail past tens of megaparsecs for most; supernovae reach gigaparsecs but are rare and transient, so they cannot be calibrated locally without waiting for one nearby. The only way to cover the range is to overlap them, calibrating each against the one below where both apply. The ladder is therefore forced by the finite reach of every method, not chosen — and its serial structure is the price.
---
q: An error is discovered in the parallax zero point, shifting all Gaia distances by 1%. What happens to a previously published H₀ derived from the ladder?
a: Nothing — the error is in the base rung, and H₀ is measured at the top
x: This inverts the dependency. The top rung's calibration is inherited from below, so a base error propagates all the way up.
a*: It shifts by about 1% — the Cepheid calibration inherits the offset, the supernova calibration inherits that, and H₀ carries the product, with nothing higher up able to detect it internally
a: It shifts by 1% divided by the number of rungs, since the error is diluted at each step
x: Errors are not diluted by being passed along; a multiplicative offset propagates undiminished through each calibration.
a: It becomes more uncertain but its central value is unaffected
x: A zero-point offset moves the central value; it is a bias, not an increase in scatter.
hint: Each rung's absolute scale is inherited. What happens to an inherited quantity when its source changes?
why: In a serial ladder each rung fixes only *relative* brightnesses internally; its absolute scale comes from the rung below. So a 1% shift in parallax distances moves the inferred Cepheid absolute magnitudes by 1%, which moves the supernova calibration by 1%, which moves H₀ by 1%. Nothing in the upper rungs can reveal it, because every object there is displaced identically and internal consistency is preserved — which is precisely what makes systematic error different in kind from scatter. It is also why Gaia's improvement mattered so much, and why the published analyses re-derive the whole chain simultaneously rather than quoting rungs independently.
```

## Rung one: parallax

The base of the ladder is the only rung that assumes nothing about astrophysics.

As the Earth orbits, a nearby star appears to shift against distant background stars. Half the annual angular shift is the **parallax** $p$, and

$$d\ \mathrm{[pc]} = \frac{1}{p\ \mathrm{[arcsec]}}$$

This is trigonometry. It requires no assumption about the star's brightness, composition, age or behaviour — only that the Earth's orbit is known, which it is to exquisite precision. **Parallax is a measurement; every rung above it is a calibration.**

The limitation is that parallaxes are small. A star at 100 pc has $p = 0.01$ arcsec; at 1 kpc, 1 milliarcsecond. **Gaia** measures parallaxes with uncertainties around 20 microarcseconds for well-observed stars, which gives:

| Precision wanted | Reach |
| --- | --- |
| 1% distances | ~500 pc |
| 10% distances | ~5,000 pc |

For comparison, Hipparcos in the 1990s managed about 200 μas — an order of magnitude worse, hence 1% distances only to ~50 pc. Gaia's improvement is the single largest advance the ladder has ever received, because it strengthens the rung that everything else stands on.

Even so: 500 pc is not merely inside the Milky Way, it is a local neighbourhood. **The base of the ladder is confined to a region a hundred thousand times smaller than the distances the ladder is built to reach.** Everything beyond rests on transferring that calibration outward.

```checkpoint
q: Parallax is described as the only rung of the distance ladder that assumes nothing. What is meant?
a: That it has no measurement uncertainty, unlike the methods above it
x: Parallax measurements certainly have uncertainties — that is what limits their reach. The claim is about assumptions, not precision.
a*: That it is pure geometry — a distance from an angle and the known size of Earth's orbit — requiring no assumption about the source's intrinsic properties, whereas every higher rung must assume something about what it is observing
a: That it works at any distance, so no extrapolation is needed
x: It is the most range-limited rung of all, reaching ~500 pc for 1% precision, which is precisely why the higher rungs exist.
a: That it was the first method historically, so later methods inherit its assumptions
x: Historical order confers no epistemic status, and later methods add assumptions rather than inheriting an absence of them.
hint: Ask what you must believe about the star itself before each method yields a distance.
why: A parallax distance follows from an angle and the diameter of Earth's orbit. Nothing about the star enters: not its luminosity, composition, age or variability. Every rung above requires such a belief — that Cepheids of a given period share a luminosity, that the tip of the red giant branch sits at a fixed magnitude, that Type Ia supernovae standardise. Those beliefs are calibrated *against* parallax, which is why an error at the base shifts everything above it. Gaia's ~20 μas gives 1% distances to only ~500 pc, so the ladder's foundation is confined to a region vastly smaller than what it is used to measure.
---
q: Gaia improved parallax precision roughly tenfold over Hipparcos. Why does this matter far more than a tenfold improvement in any higher rung would?
a: Because parallax distances are used directly for the most distant galaxies
x: Parallax reaches only a few kiloparsecs and is never used directly for galaxies; its influence is entirely through what it calibrates.
a*: Because it is the base of a serial chain — improving the foundation propagates to every rung above, while improving a higher rung leaves everything beneath it, and hence its own calibration, unchanged
a: Because parallax is the only method with systematic errors, so improving it removes them
x: Every method has systematics; the higher rungs arguably have more. The leverage comes from position in the chain, not from a monopoly on error.
a: Because Gaia measures more stars, and larger samples reduce systematic error
x: Larger samples reduce statistical error; systematic zero-point error is unaffected by sample size, which is a central point of this chapter.
hint: In a chain where each link is calibrated by the one below, which link's error affects the most?
why: The ladder is serial: Cepheids are calibrated by parallax, supernovae by Cepheids, and H₀ by supernovae. An error at the base multiplies through every subsequent step, so tightening the base tightens everything. Improving a higher rung cannot help the rungs below it and cannot correct its own zero point, which was inherited. Gaia's move from ~200 μas to ~20 μas therefore lifted 1% parallax distances from ~50 pc to ~500 pc and with them the calibration of every standard candle — which is why it is the single largest advance the ladder has received, and why the H₀ debate shifted to the rungs above once it landed.
```

## Rungs two and three: standard candles

A **standard candle** is an object whose intrinsic luminosity is known. Given that, the observed brightness yields a distance, through the **distance modulus**:

$$m - M = 5\log_{10}\left(\frac{d}{10\ \mathrm{pc}}\right)$$

with $m$ apparent magnitude and $M$ absolute magnitude. The whole game is establishing $M$.

**Cepheid variables.** Henrietta Leavitt's 1912 discovery: a Cepheid's pulsation **period** predicts its **luminosity**. Period is a clock reading, immune to distance and to dust, so measuring it gives $M$ directly. Cepheids are luminous supergiants, visible in galaxies out to tens of megaparsecs with Hubble and JWST.

A worked case: a Cepheid with a 30-day period has $M_V \approx -5.7$. Observed at $m_V = 25$:

$$m - M = 30.7 \quad\Longrightarrow\quad d = 10^{(30.7/5)+1} = 10^{7.14}\ \mathrm{pc} = \mathbf{13.8\ Mpc}$$

**The tip of the red giant branch (TRGB).** Low-mass stars ascending the red giant branch ignite helium in a degenerate core at a nearly fixed luminosity, producing a sharp cutoff at the top of the observed red giant luminosity function. That cutoff is a standard candle, and it has virtues Cepheids lack: it appears in the *halos* of galaxies, where crowding and dust are minimal, and in the $I$ band it depends only weakly on metallicity and age.

**Type Ia supernovae.** The top rung. A white dwarf detonating near the Chandrasekhar mass produces a remarkably repeatable explosion — and, after standardisation using the empirical correlation between peak brightness and light-curve decline rate, the scatter drops to a few per cent. They reach beyond a gigaparsec, which is what makes them the only rung able to sample the Hubble flow directly.

### Why the top rung must reach so far

That last point deserves emphasis, and it connects back to the Superclusters chapter.

Reading $H_0$ from $v = H_0d$ requires the recession velocity to be dominated by expansion rather than by local gravity. But peculiar velocities run to several hundred km/s — the Local Group alone moves at 627 km/s — while at 10 Mpc the Hubble term is only ~700 km/s. **Nearby, the peculiar velocity is comparable to the signal.**

To reduce that contamination below a per cent one needs $H_0d \gg v_{\rm pec}$, which means distances of hundreds of megaparsecs. Cepheids do not reach there; supernovae do. So the ladder's structure is not merely convenient — the top rung exists specifically because the measurement is impossible closer in.

```checkpoint
q: Why must the distance ladder reach several hundred megaparsecs before H₀ can be read off, rather than stopping at the nearest galaxies where distances are best measured?
a: Because Hubble's law only becomes valid at large distances, breaking down nearby
x: The law describes the smooth cosmological flow at all scales; what changes is the size of the contaminating peculiar motions relative to it.
a*: Because peculiar velocities of several hundred km/s are comparable to the Hubble term nearby — at 10 Mpc, H₀d is only ~700 km/s — so the expansion signal is only cleanly separated once H₀d greatly exceeds them
a: Because nearby galaxies are gravitationally bound to us and therefore not receding at all
x: Only a handful of Local Group members are bound; most nearby galaxies do recede, just with a large peculiar component superposed.
a: Because distance measurements are more accurate at greater distances, where more methods overlap
x: Accuracy degrades with distance as more rungs accumulate; the far measurements are worse, and are used despite that because the velocity signal is cleaner.
hint: Compare the Hubble term at 10 Mpc with the peculiar velocities from the Superclusters chapter.
why: Observed velocity is the Hubble term plus a peculiar term. At 10 Mpc, H₀d ≈ 700 km/s while peculiar velocities driven by local structure reach several hundred — the Local Group itself moves at 627 km/s — so a nearby measurement is contaminated at the tens-of-per-cent level. Pushing to several hundred Mpc raises H₀d into the tens of thousands of km/s, rendering the peculiar term a sub-per-cent perturbation. This is why the ladder cannot stop where distances are best determined, and why Type Ia supernovae — the only candles reaching that far — are indispensable rather than merely convenient.
---
q: The tip of the red giant branch is often preferred over Cepheids as a second rung. What is its principal advantage?
a: It is intrinsically brighter, so it reaches greater distances
x: The TRGB is fainter than the brightest Cepheids and reaches somewhat less far; its advantages lie elsewhere.
a*: It appears in galaxy halos, where crowding and dust are minimal, and in the I band it depends only weakly on metallicity and age — so several of the systematics that afflict Cepheid photometry are largely absent
a: It requires no calibration, being set by fundamental physics
x: The luminosity of the helium flash is set by physics, but its observed magnitude still needs empirical calibration against geometric distances.
a: It can be measured from a single observation, whereas Cepheids require monitoring
x: True and genuinely convenient — no time series is needed — but not the reason it is preferred for accuracy.
hint: Ask where in a galaxy each candle is found, and what lives there.
why: Cepheids are young, massive stars, so they sit in crowded, dusty star-forming disks — exactly where blending with neighbours and extinction corrections do the most damage, and the crowding worry is what JWST was used to test. The TRGB marks the helium flash in old, low-mass stars, abundant in the sparse, dust-poor halo, and in the I band its magnitude is nearly independent of metallicity and age. So it trades one set of systematics for a smaller set. That matters beyond convenience: TRGB-calibrated ladders return slightly lower H₀ values than Cepheid-calibrated ones, and whether that gap is real is among the live questions in the tension.
```

{{image: Cosmic distance ladder | The chain of overlapping methods that carries distance measurement from parsecs to gigaparsecs. No technique spans more than two or three decades, so each is calibrated against the one below in a region where both apply — which is what makes the structure serial, and why a zero-point error at the base propagates to the top undiminished by any amount of additional data.}}

## How the errors actually behave

This is the section that explains the shape of the modern debate, and it turns on a distinction that is easy to state and easy to forget.

**Statistical error** comes from finite samples and random measurement noise. It averages down as $1/\sqrt{N}$. Observe more Cepheids and it shrinks.

**Systematic error** comes from a calibration being offset. It does **not** average down. Observing a million Cepheids calibrated against a zero point that is 2 per cent too bright yields a very precise answer that is 2 per cent wrong.

In a serial ladder, systematic errors **propagate multiplicatively**. If the parallax zero point is off by a factor $(1+\epsilon_1)$, the Cepheid calibration inherits it; the supernova calibration inherits that; and $H_0$ carries the product. For three rungs with 2 per cent systematics each:

| Assumption | Total systematic |
| --- | --- |
| Errors independent (add in quadrature) | **3.5%** |
| Errors correlated (add linearly) | **6.0%** |

For context: SH0ES quotes $73.04 \pm 1.04$, a **1.4%** total uncertainty. Achieving that requires every rung's systematic to be controlled at roughly the per-cent level and their correlations understood — which is why the published analyses are dominated by discussion of calibration rather than of measurement.

**And this is precisely why the Hubble tension cannot be resolved by collecting more data.** The disagreement is 5.6 km/s/Mpc, about 8 per cent. If it were statistical, more supernovae would settle it. It is not: both sides have long since reached the regime where their error budgets are systematic-dominated. The argument is therefore about zero points, and it is settled — if at all — by finding a specific miscalibration or by measuring $H_0$ along a route that does not use the ladder at all.

**A precise measurement and an accurate one are different achievements**, and the ladder makes the difference unusually visible: precision is bought with sample size, accuracy with calibration, and no quantity of the first substitutes for the second.

```checkpoint
q: Why can the Hubble tension not be resolved by simply observing more Type Ia supernovae?
a: Because supernovae are too rare for samples ever to become large enough
x: Thousands are catalogued and surveys find them routinely; sample size is not the limiting factor.
a*: Because both determinations are already systematic-dominated — the uncertainty comes from calibration zero points, which do not average down with more objects
a: Because supernovae are not truly standard candles, so their scatter cannot be reduced
x: After light-curve standardisation their scatter is a few per cent, and that residual scatter is statistical and does average down. The obstacle is the zero point rather than the scatter.
a: Because the discrepancy is with the CMB, and supernovae cannot measure CMB properties
x: The two measure the same quantity, H₀, by different routes; no cross-measurement is needed for the comparison to be meaningful.
hint: Which kind of error shrinks with N, and which does not?
why: Statistical error falls as 1/√N; systematic error does not fall at all. A million supernovae calibrated against a zero point that is 2 per cent off give a very precise answer that is 2 per cent wrong. Both the SH0ES and Planck error budgets are now dominated by systematics — for SH0ES the ladder's calibration chain, for Planck the modelling assumptions of ΛCDM — so the 8 per cent disagreement cannot be reduced by counting. It is settled only by locating a specific miscalibration or by measuring H₀ along a route that avoids the ladder. Precision is bought with sample size and accuracy with calibration, and no amount of the first substitutes for the second.
---
q: Three ladder rungs each carry a 2% systematic. Why does it matter whether those errors are independent or correlated?
a: It does not — 2% errors are small enough that the difference is negligible
x: The totals are 3.5% against 6.0%, which straddles the size of the Hubble tension itself. The difference is decisive.
a*: Because independent errors add in quadrature to 3.5% while correlated ones add linearly to 6.0% — and since the tension is about 8%, the assumed correlation structure materially changes whether the ladder can accommodate it
a: Because correlated errors can be removed by subtraction, while independent ones cannot
x: Correlated systematics are harder to remove, not easier — being shared, they leave no internal inconsistency to reveal them.
a: Because only independent errors are real; correlated ones indicate a mistake in the analysis
x: Correlation is an ordinary feature of shared calibrations — the same photometric system or metallicity scale entering several rungs — and is not itself an error.
hint: Add the errors both ways and compare the totals with the size of the disagreement being argued about.
why: Independent errors combine as √(3 × 2²) = 3.5%; fully correlated ones as 3 × 2% = 6.0%. The Hubble tension is about 8%, so the difference between those totals is a substantial fraction of the thing under dispute — it changes whether the ladder's own uncertainty could plausibly absorb the discrepancy. Correlations arise naturally, because rungs share photometric systems, metallicity scales and dust laws, so treating them as independent is optimistic and treating them as fully correlated is pessimistic. Establishing which is closer to the truth is a large part of what modern ladder analyses actually do, and it is why their papers read as arguments about covariance rather than about measurement.
```

## Routes that avoid the ladder

Because the serial structure is the vulnerability, the most valuable cross-checks are those that **bypass it entirely** — measuring a distance geometrically at cosmological range, with no calibration chain beneath.

**Megamasers.** Water masers orbiting a supermassive black hole in a thin Keplerian disk give a geometric distance directly: combining their proper motions with their radial accelerations yields a distance with no rungs below it. **NGC 4258** is the archetype and, as the Supermassive Black Holes chapter noted, it anchors the ladder — and can also be used to skip it.

**Gravitational lensing time delays.** The Quasars chapter set this out: the delay between images of a lensed quasar is a physical length, and combined with a lens mass model it yields an absolute distance and hence $H_0$, owing nothing to Cepheids or supernovae. Its own limitation is lens modelling rather than calibration — a different systematic, which is exactly what makes it useful.

**Gravitational-wave standard sirens.** A compact-binary merger's waveform encodes its luminosity distance directly: the amplitude depends on distance and on parameters the waveform itself determines. No calibration whatsoever. Pair the distance with a redshift from an electromagnetic counterpart or a host galaxy, and $H_0$ follows. GW170817 provided the first such measurement. The uncertainties are still large, but they are **independent in kind**, and they will shrink as detections accumulate — this being one of the few places in the subject where more data genuinely helps.

The reasoning behind valuing these is the one the Groups & Clusters chapter set out for cluster masses: **independent methods are the only way to bound systematic error**, because a systematic is invisible to the method carrying it. A fourth ladder-based measurement adds little; one measurement that shares no assumptions adds a great deal.

## Where the ladder stands

The current position, stated with the confidence each part deserves.

**Cepheid crowding is not the answer.** JWST re-observed SH0ES's Cepheids at higher resolution, and the values held: $H_0 = 73.49 \pm 0.93$, with crowding rejected at 7–8σ.

**But the second rung is genuinely contested.** Ladders calibrated on the **TRGB** rather than Cepheids have returned somewhat lower values — nearer 70 than 73 — and whether that difference reflects a real systematic in one of the two candles, or the different galaxy samples they can be applied to, is an active argument. This is the most consequential open question in the ladder, because it is internal: two second rungs, calibrated on the same base, disagreeing.

**The ladder-free routes are not yet decisive.** Lensing time delays and standard sirens both sit between the two camps with uncertainties too large to adjudicate. They are the most likely source of a resolution, and the reason is structural rather than technological: they are the only measurements whose errors are uncorrelated with everyone else's.

```checkpoint
q: Gravitational-wave standard sirens are described as needing no calibration. What does the waveform supply directly?
a: The redshift of the source, read from the frequency shift of the signal
x: The waveform does not give redshift independently — mass and redshift are degenerate in the signal, which is why an electromagnetic counterpart or host identification is needed.
a*: The luminosity distance — the signal's amplitude depends on distance and on parameters the waveform itself determines, so no standard candle needs calibrating
a: Both distance and redshift, making it a complete measurement of H₀ on its own
x: Distance yes, redshift no. Without a counterpart or host galaxy the redshift must be handled statistically, which is why "dark siren" methods are much less constraining.
a: The absolute luminosity of the merger, which is fixed by general relativity
x: There is no single absolute luminosity — it depends on the component masses and orientation — but those are extractable from the waveform, which is what makes the distance recoverable.
hint: A standard candle needs a known intrinsic brightness. What does a siren know about itself?
why: For a compact-binary inspiral, general relativity relates the signal's amplitude, frequency and rate of frequency change to the masses, orientation and luminosity distance — so fitting the waveform yields the distance without reference to any externally calibrated object. That breaks the serial chain entirely: no parallax, no Cepheids, no supernovae. What it does not supply is redshift, since mass and redshift enter degenerately, so a counterpart or host galaxy is required. GW170817 gave the first such H₀, with uncertainties still too large to adjudicate the tension — but independent in kind, and shrinking with each detection, which is one of the few places in this subject where collecting more data genuinely helps.
---
q: Cepheid-calibrated and TRGB-calibrated ladders return H₀ values differing by roughly 3 km/s/Mpc. Why is this internal disagreement so important?
a: Because it shows one of the two teams has made an arithmetic error
x: Both analyses are careful and reproducible; the difference stems from candle systematics and sample selection rather than from mistakes.
a*: Because both share the same geometric base, so the discrepancy isolates the second rung — and until it is resolved, the local value carries an unresolved systematic comparable to a substantial fraction of the tension itself
a: Because TRGB is known to be more reliable, so the Cepheid result should be discarded
x: TRGB avoids some systematics and introduces others; neither is established as correct, which is what makes the disagreement live.
a: Because it proves the distance ladder cannot measure H₀ at all
x: Far too strong — the two agree to within a few per cent, and both sit well above the Planck value; the ladder retains substantial constraining power.
hint: Both ladders stand on the same parallax base. So where must the difference come from?
why: Sharing a geometric foundation means the disagreement cannot originate below the second rung — it isolates the candles themselves, or the galaxy samples each can be applied to. Cepheids live in crowded dusty disks and carry metallicity dependence; the TRGB lives in sparse halos and is nearly metallicity-independent in the I band but demands careful treatment of the luminosity-function edge. Until it is settled, the local determination carries an unresolved systematic of order the gap, which is a sizeable fraction of the 8 per cent tension being argued about. This is why the H₀ debate has moved inside the ladder rather than remaining a contest between local and CMB measurements.
```

{{image: Cepheid variable | A Cepheid variable, whose pulsation period predicts its intrinsic luminosity — Leavitt's 1912 discovery, and the rung that carried the ladder out of the Milky Way. Period is a clock reading, immune to distance and dust, which is what makes it usable. But Cepheids are young massive stars living in crowded, dusty disks, and it is exactly those conditions that JWST was used to test.}}

## Pulling the thread

- The ladder exists because **no method spans more than two or three decades** of the eight needed, so each is calibrated against the one below in a region of overlap. The structure is therefore **serial**, and that is the source of its fragility.
- **Parallax** is the only rung that assumes nothing about the source — pure geometry, $d = 1/p$. Gaia's ~20 μas gives **1% distances to ~500 pc**, a tenfold gain on Hipparcos; because it is the base, that improvement propagates to every rung above.
- **Standard candles** convert brightness to distance via $m - M = 5\log_{10}(d/10\,\mathrm{pc})$. **Cepheids** use Leavitt's period–luminosity relation; **TRGB** uses the helium flash in old halo stars, trading Cepheid crowding and metallicity systematics for a smaller set; **Type Ia supernovae** reach past a gigaparsec.
- The top rung must reach **hundreds of megaparsecs**, because peculiar velocities of several hundred km/s are comparable to $H_0d$ nearby — at 10 Mpc the Hubble term is only ~700 km/s.
- **Statistical error averages down; systematic error does not.** Three rungs at 2% give **3.5% in quadrature or 6.0% correlated**, against SH0ES's quoted **1.4%** total — which is why published analyses argue about covariance rather than measurement.
- **The tension cannot be resolved by more data.** Both sides are systematic-dominated, so the 8% gap is a question about zero points, settled only by finding a miscalibration or by a ladder-free route.
- **Ladder-free routes** — megamasers, lensing time delays, standard sirens — matter because they **break the serial structure**, and independent methods are the only way to bound systematic error.
- Live: **Cepheid crowding is excluded at 7–8σ**, but **Cepheid- and TRGB-calibrated ladders still differ by ~3 km/s/Mpc**, isolating the second rung as the open problem.

The transferable idea: **precision and accuracy are bought with different currencies, and only one of them is for sale.** Sample size buys precision, and it is always available — observe more, measure longer, and the error bars shrink on schedule. Accuracy is bought with calibration, and calibration cannot be improved by repetition, because a systematic offset is invisible to the measurement carrying it. This is why a field can converge confidently on a wrong answer, as the ladder did for decades after Hubble, and why the useful question about any precise result is not *how many measurements went into it?* but **what would have to be true for all of them to be wrong in the same direction, and has anyone checked that independently?**

## Further reading

{{book: Michael Rowan-Robinson | The Cosmological Distance Ladder | 1985}}

{{book: Stephen Webb | Measuring the Universe: The Cosmological Distance Ladder | 1999}}

{{book: Robert Kirshner | The Extravagant Universe | 2002}}

Beyond the books: the SH0ES and CCHP papers are worth reading against each other, since they use the same base and reach different answers — an unusually clean case of a disagreement isolated to one rung. Freedman's Key Project papers are a good record of what it took to get the ladder from a factor-of-two argument to a per-cent one. And the GW170817 standard-siren measurement is worth seeing for how much can be extracted from a single event when the method carries no calibration.

## Problems

*Useful numbers: d[pc] = 1/p[arcsec]; m − M = 5log₁₀(d/10 pc); Gaia σ_p ≈ 20 μas, Hipparcos ≈ 200 μas; Cepheid P = 30 d has M_V ≈ −5.7; peculiar velocities ~300–600 km/s; H₀ = 70 km/s/Mpc; SH0ES 73.04 ± 1.04, Planck 67.4 ± 0.5; statistical error ∝ 1/√N.*

**1.** *(The base.)* **(a)** Compute the parallax of a star at 100 pc and at 1 kpc, in arcsec and mas. **(b)** For σ_p = 20 μas, compute the distance out to which 1% precision is achieved. **(c)** State why parallax is called assumption-free and what every higher rung must assume instead.

**2.** *(Leverage.)* **(a)** Explain why improving the base rung matters more than improving a higher one. **(b)** State what Gaia's tenfold gain over Hipparcos did to the reach for 1% distances. **(c)** Explain why improving a higher rung cannot fix its own zero point.

**3.** *(Distance modulus.)* **(a)** A Cepheid with P = 30 d (M_V = −5.7) is observed at m_V = 25. Compute its distance. **(b)** Compute the distance modulus of a galaxy at 20 Mpc. **(c)** State what must be known before the formula can be used at all.

**4.** *(Choosing a candle.)* **(a)** State two advantages of TRGB over Cepheids. **(b)** State one advantage of Cepheids. **(c)** Explain why the choice is not merely a matter of convenience.

**5.** *(Why reach matters.)* **(a)** Compute H₀d at 10 Mpc and at 400 Mpc. **(b)** Compare each with typical peculiar velocities and state the fractional contamination. **(c)** Explain what this implies about which rung is indispensable.

**6.** *(Error propagation.)* Three rungs each carry a 2% systematic. **(a)** Compute the total assuming independence. **(b)** Compute it assuming full correlation. **(c)** Compare both with SH0ES's quoted total uncertainty and state what follows about how the analysis must be done.

**7.** *(Statistics versus systematics.)* **(a)** State how each behaves as sample size grows. **(b)** Explain why the Hubble tension cannot be resolved by more supernovae. **(c)** State the two things that could resolve it.

**8.** *(Breaking the chain.)* **(a)** Name three ladder-free routes to H₀ and state what each measures directly. **(b)** Explain why standard sirens need an electromagnetic counterpart. **(c)** State why independent methods are valued out of proportion to their precision.

**9.** *(Reading a precise result.)* **(a)** State the current status of the Cepheid-crowding hypothesis and its significance. **(b)** State the remaining internal disagreement in the ladder and why it matters. **(c)** State the general question one should ask of any very precise measurement.

## Worked answers

**1.** **(a)** $p = 1/d$: at 100 pc, $p = 0.01$ arcsec $= \mathbf{10\ mas}$; at 1,000 pc, $p = 0.001$ arcsec $= \mathbf{1\ mas}$. **(b)** 1% precision requires $\sigma_p/p = 0.01$, so $p = 100\sigma_p = 100 \times 20\ \mu\mathrm{as} = 2$ mas $= 0.002$ arcsec, giving $d = 1/0.002 = \mathbf{500\ pc}$. **(c)** Because a parallax distance follows from an **angle and the diameter of Earth's orbit** — nothing about the star's luminosity, composition, age or behaviour enters. Every higher rung must assume something intrinsic about what it observes: that Cepheids of a given period share a luminosity, that the red giant tip sits at a fixed magnitude, that Type Ia supernovae standardise to a common peak brightness. Those assumptions are **calibrated against parallax**, which is why the ladder is serial and why an error at the base shifts everything above it.

**2.** **(a)** Because the ladder is **serial**: each rung is calibrated by the one below, so an improvement at the base propagates upward through every subsequent calibration. An improvement at a higher rung benefits only that rung and those above it — and leaves untouched the calibration it inherited. **(b)** From $\sigma_p \approx 200\ \mu$as to $\approx 20\ \mu$as, so the radius for 1% distances rose from $1/(100\times200\times10^{-6}) = 50$ pc to $\mathbf{500\ pc}$ — a tenfold gain in reach, and roughly a thousandfold in surveyed volume, hence vastly more calibrating stars. **(c)** Because a rung's zero point is **inherited from below**, not determined internally. Measuring a thousand more Cepheids in a galaxy pins down their relative brightnesses beautifully while saying nothing about whether the absolute scale — set by parallax-calibrated Cepheids in the Milky Way — is right. No internal consistency check can reveal an offset shared by every object in the rung.

**3.** **(a)** $m - M = 25 - (-5.7) = 30.7$. Then $d = 10^{(m-M)/5 + 1} = 10^{6.14 + 1} = 10^{7.14}\ \mathrm{pc} = 1.38\times10^7$ pc $= \mathbf{13.8\ Mpc}$. **(b)** $d = 2\times10^7$ pc, so $m - M = 5\log_{10}(2\times10^6) = 5 \times 6.301 = \mathbf{31.5}$. **(c)** The **absolute magnitude $M$** — the object's intrinsic luminosity. That is the entire content of a standard candle, and establishing it is what the rung below is for. Without $M$ the formula relates two unknowns, and an apparent magnitude alone carries no distance information whatever.

**4.** **(a)** *First*, the TRGB is found in galaxy **halos**, which are sparse and dust-poor, so crowding and extinction — the dominant Cepheid systematics — are largely absent. *Second*, in the $I$ band its magnitude is **nearly independent of metallicity and age**, whereas the Cepheid period–luminosity relation carries a metallicity dependence that must be measured and corrected. **(b)** Cepheids are **brighter** and are identified unambiguously by their periodic variability, so they can be found and confirmed in more distant and more crowded galaxies — including, crucially, more of the galaxies that have hosted Type Ia supernovae, which is what sets how many objects can calibrate the top rung. **(c)** Because the two choices give **different answers**: TRGB-calibrated ladders return $H_0$ nearer 70, Cepheid-calibrated ones nearer 73. Since both stand on the same geometric base, the difference isolates the second rung, and it is a substantial fraction of the tension under dispute. The choice of candle is therefore not a matter of convenience but an unresolved systematic.

**5.** **(a)** At 10 Mpc, $H_0d = 70\times10 = \mathbf{700\ km/s}$. At 400 Mpc, $70\times400 = \mathbf{28{,}000\ km/s}$. **(b)** With peculiar velocities of ~300–600 km/s: at 10 Mpc the contamination is of order $500/700 \approx \mathbf{70\%}$ — the peculiar term is comparable to the signal. At 400 Mpc it is $500/28{,}000 \approx \mathbf{1.8\%}$, and averaging over many directions reduces the residual further since peculiar velocities are largely random. **(c)** That the **top rung is indispensable**, not merely convenient. The measurement is impossible at distances where the best-determined distances live: nearby, where Cepheids and TRGB work well, the velocity is dominated by local gravity. Only Type Ia supernovae reach far enough for the Hubble term to dominate, so the ladder must be extended to them however much accuracy is lost along the way — a trade of distance accuracy for velocity cleanliness.

**6.** **(a)** Independent: $\sqrt{3\times(0.02)^2} = 0.02\sqrt{3} = \mathbf{3.5\%}$. **(b)** Correlated: $3 \times 2\% = \mathbf{6.0\%}$. **(c)** SH0ES quotes $73.04\pm1.04$, i.e. $\mathbf{1.4\%}$ — below both figures. Achieving that requires each rung's systematic to be held well under 2% *and* the correlations between them to be understood, since assuming independence when errors are shared would understate the total by nearly a factor of two. Consequently the analysis cannot be a series of separate measurements multiplied together; it must be a **simultaneous fit with a full covariance matrix**, in which the same Cepheids are used in anchor galaxies, in supernova hosts, and in the Hubble flow so that shared systematics partly cancel. That is why modern ladder papers read as arguments about covariance rather than about measurement.

**7.** **(a)** **Statistical** error falls as $1/\sqrt{N}$ — doubling the sample reduces it by 30%. **Systematic** error is **unchanged** by $N$: a million objects calibrated against a zero point 2% too bright give a 2% wrong answer with a very small error bar. **(b)** Because both determinations are already **systematic-dominated**. SH0ES's budget is dominated by the ladder's calibration chain; Planck's by the modelling assumptions of $\Lambda$CDM. The 8% gap therefore does not shrink as data accumulate — and indeed the significance has *risen* over time as both sides reduced their statistical components, sharpening rather than resolving the disagreement. **(c)** *First*, **finding a specific miscalibration** — an unrecognised systematic in one rung, or in the early-universe modelling. *Second*, **a ladder-free measurement** precise enough to adjudicate: megamaser, lensing time-delay, or standard-siren determinations, whose errors are uncorrelated with either camp's.

**8.** **(a)** **Megamasers**: water masers in a Keplerian disk around a supermassive black hole, whose proper motions combined with radial accelerations give a **geometric distance** directly, with no rungs beneath. **Lensing time delays**: the delay between images of a lensed quasar is a **physical length**, converting with a lens mass model into an absolute distance. **Standard sirens**: a compact-binary waveform encodes its **luminosity distance**, since amplitude depends on distance and on parameters the waveform itself determines. **(b)** Because the waveform gives distance but **not redshift** — mass and redshift enter the signal degenerately, so a merger of higher mass at higher redshift can mimic a lower-mass one nearby. An electromagnetic counterpart or an identified host galaxy supplies the redshift independently. Without one, "dark siren" methods must marginalise over all candidate hosts, which is far less constraining. **(c)** Because a **systematic is invisible to the method carrying it**, so no amount of refinement within one method can bound it. Only a measurement sharing no assumptions can. A fourth ladder-based determination largely inherits the ladder's systematics and adds little; a single independent measurement of modest precision constrains the systematic in a way the precise ones cannot constrain themselves — the same argument the Groups & Clusters chapter made for cluster masses.

**9.** **(a)** **Excluded.** JWST re-observed the same Cepheids at higher angular resolution, largely removing blending with unresolved neighbours, and recovered $H_0 = 73.49\pm0.93$ — consistent with the earlier value, with the crowding explanation rejected at **7–8σ**. The most plausible mundane resolution is therefore closed. **(b)** **Cepheid- and TRGB-calibrated ladders differ by roughly 3 km/s/Mpc**, ~70 against ~73. It matters because both stand on the **same geometric base**, so the disagreement isolates the second rung — either the candles themselves or the galaxy samples each can be applied to. Until resolved, the local value carries an unresolved systematic of order a substantial fraction of the tension being argued about, which is why the debate has moved *inside* the ladder rather than remaining a contest between local and CMB measurements. **(c)** Not "how many measurements went into it?" but **"what would have to be true for all of them to be wrong in the same direction, and has that been checked by a method that does not share the assumption?"** Precision is bought with sample size and is always available; accuracy is bought with calibration and cannot be improved by repetition. A field can therefore converge confidently on a wrong answer — as this one did for decades after Hubble — and the only defence is a measurement whose errors are uncorrelated with the rest.$expLad_master$,
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
