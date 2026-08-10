-- Astronomy & Space · The Expanding Universe — The Big Bang — "The Timeline".
-- Curated master for
-- astronomy-and-space/expanding-universe/big-bang/timeline
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Capstone of The Big Bang block. Organised around the logarithmic
-- structure of cosmic history - sixty decades of time from the Planck
-- scale to now, seventy-one per cent of them before the first second -
-- and around the hole in the middle of the record. The three eras and
-- their two handovers (radiation to matter at 51 kyr, matter to Lambda
-- at 10.3 Gyr, with acceleration beginning at 7.7 Gyr); the Dark Ages
-- from 372 kyr to ~180 Myr as the longest unobserved stretch and the
-- 21 cm programme aimed at it, including the contested EDGES claim;
-- cosmic dawn and reionization, midpoint z = 7.7, complete by z = 6 at
-- 0.93 Gyr; cosmic noon at z = 2, t = 3.3 Gyr, after which star
-- formation fell by an order of magnitude; and the honest point that
-- events on a timeline are not equally well dated.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/big-bang/timeline',
    'research',
    'advanced',
    'read',
    $bbTime_master$> A timeline of the universe drawn to linear scale is nearly blank. Everything before the first galaxies occupies less than the width of the line, and the whole of the first second — nucleosynthesis, neutrino decoupling, the quark–hadron transition, whatever produced the matter — is invisible. **Cosmic history is logarithmic, and this is not a presentational convenience but a statement about the universe**, because each epoch's characteristic timescale is set by the conditions then prevailing, and those conditions changed by orders of magnitude.

This chapter assembles the block. The previous two supplied the physics of the first minutes; this one places them in the full sequence, marks where the record is good, and — more usefully — marks where it is missing.

## Sixty decades

From the Planck time at $10^{-43}$ s to the present at $4.4\times10^{17}$ s is **60.6 decades** of time. That is the natural measure, because the processes that matter each operate on their own timescale and the timescales span the whole range.

Now count where they fall. From $10^{-43}$ s to 1 s is **43 decades — 71% of cosmic history by this measure.** Everything since the first second, including all of stellar and galactic evolution, all of chemistry, and the entire history of life, occupies the remaining 29%.

This is worth sitting with, because it inverts the usual impression. In years, the first second is nothing at all. In decades, it is most of the story. **Neither measure is wrong; they answer different questions** — and which one is appropriate depends on whether you are asking how much *happened* or how much *time passed*. For the early universe the logarithmic measure is the physical one, because the rate at which conditions changed was itself falling by orders of magnitude: at $10^{-35}$ s the universe doubled in size in $10^{-35}$ s, and today it takes ten billion years.

A useful way to state the same point: **equal factors in time correspond to roughly equal amounts of physics.** The interval from $10^{-6}$ s to $10^{-5}$ s contains the quark–hadron transition; the interval from $10^{5}$ yr to $10^{6}$ yr contains nothing whatever. Events are approximately uniform in $\log t$, not in $t$, and any intuition calibrated on linear time will mislead systematically about which epochs are eventful.

```checkpoint
q: Why is the logarithmic measure of cosmic time the physically appropriate one for the early universe?
a: Because the early universe is poorly dated, so precise linear intervals would be misleading
x: The early universe is dated with unusual precision — the temperature–time relation gives it directly. Uncertainty is not the reason.
a*: Because the rate at which conditions changed was itself falling by orders of magnitude, so the natural clock is the expansion timescale, and equal factors in time correspond to roughly equal amounts of physics
a: Because logarithms compress the axis, making a chart readable
x: That is a presentational benefit, not a physical justification. The claim here is about the universe, not about charts.
a: Because temperature falls as $t^{-1/2}$, which is linear in a log–log plot
x: True and relevant, but it is a consequence of the deeper point rather than the reason — the physics is uniform per decade because the expansion timescale tracks $t$.
hint: Ask how long the universe took to double in size at $10^{-35}$ s, and how long it takes now.
why: The expansion timescale is of order $t$ itself: at $10^{-35}$ s the universe doubled in $10^{-35}$ s; today it takes about ten billion years. So a factor-of-ten interval in $t$ always corresponds to a comparable number of expansion times, and hence to a comparable amount of physical change. That is why events are roughly uniform in $\log t$ rather than in $t$, and why the 43 decades from the Planck time to one second — 71% of cosmic history by this measure — contain most of what happened. Neither measure is wrong, but they answer different questions, and intuitions calibrated on linear time systematically misjudge which epochs were eventful.
```

## Three eras and two handovers

The expansion history divides into three regimes according to which component dominates the energy density, and the two crossovers are among the most consequential dates in the timeline.

**Radiation era**, $t < 51{,}000$ yr. Relativistic species dominate. Density falls as $a^{-4}$ — one factor of $a^{-3}$ from dilution, one more from redshifting — so radiation loses ground to matter as the universe expands. Scale factor grows as $a \propto t^{1/2}$.

**Matter era**, $51{,}000$ yr to $10.3$ Gyr. Matter dominates, density falling as $a^{-3}$. Now $a \propto t^{2/3}$. **This is the era in which structure grows**, because matter perturbations can collapse under gravity once radiation pressure is out of the way.

**Dark-energy era**, after $10.3$ Gyr. The cosmological constant's density does not fall at all, so it inevitably wins in the end. Expansion becomes exponential, $a \propto e^{Ht}$.

Two dates deserve isolating, and they are commonly conflated.

**Matter–radiation equality at $z = 3402$, $t = 51{,}000$ yr.** The moment matter's density overtakes radiation's. Its importance is that perturbation growth is suppressed while radiation dominates and proceeds efficiently afterwards, so equality sets the characteristic scale of the largest structures — the turnover in the matter power spectrum, which the Large-Scale Structure chapter identified as a fossil of this date.

**Matter–$\Lambda$ equality at $z = 0.30$, $t = 10.3$ Gyr.** The moment dark energy's density overtakes matter's.

But **acceleration began earlier**, at $z = 0.63$, $t = 7.7$ Gyr — **6.1 billion years ago**. The distinction is not pedantry. Acceleration requires $\ddot a > 0$, which for a cosmological constant means $\rho_\Lambda > \rho_m/2$, not $\rho_\Lambda > \rho_m$ — because pressure gravitates in general relativity, and $\Lambda$'s pressure is $-\rho c^2$, contributing to deceleration with the opposite sign and twice the weight. So the universe began accelerating while matter still dominated by a factor of two. **These are three different dates for what is loosely called "the onset of dark energy", and quoting the wrong one is a common error.**

| Era | Spans | $\rho \propto$ | $a \propto$ |
| --- | --- | --- | --- |
| Radiation | 0 – 51,000 yr | $a^{-4}$ | $t^{1/2}$ |
| Matter | 51,000 yr – 10.3 Gyr | $a^{-3}$ | $t^{2/3}$ |
| Dark energy | 10.3 Gyr – | constant | $e^{Ht}$ |

There is a coincidence here worth naming rather than explaining away. **We happen to live close to the matter–$\Lambda$ handover** — within a factor of two in cosmic time of a transition that occupies a vanishing fraction of the logarithmic history. Since $\rho_m/\rho_\Lambda$ falls as $a^{-3}$, the two are comparable only for a brief window. This is the **cosmic coincidence problem**, and it is genuinely unexplained. Anthropic arguments have been offered — structure formation requires matter domination, and observers require structure — and they have some force, but they are not a derivation. The Dark Universe block takes the question up properly.

```checkpoint
q: Dark energy overtakes matter in density at $z = 0.30$, but the expansion has been accelerating since $z = 0.63$. Why the discrepancy?
a: Because the measurements of the two epochs use different data and have not been reconciled
x: Both follow from the same parameters; the difference is a consequence of the physics, not a disagreement between datasets.
a*: Because acceleration requires $\rho_\Lambda > \rho_m/2$, not $\rho_\Lambda > \rho_m$ — in general relativity pressure gravitates, and $\Lambda$'s negative pressure contributes to the acceleration with twice the weight of its density
a: Because acceleration is measured from supernovae and density from the CMB, and the two disagree at this level
x: They agree; supernovae and the CMB give a consistent picture, and both dates follow from the same fitted parameters.
a: Because there is a delay between dark energy dominating and its effect becoming visible
x: Gravity has no such lag; the expansion responds immediately to the total source term.
hint: In general relativity, what appears in the acceleration equation besides density?
why: The acceleration equation contains $\rho + 3p/c^2$, not $\rho$ alone, because pressure gravitates. Matter is pressureless, contributing $\rho_m$; the cosmological constant has $p = -\rho_\Lambda c^2$, contributing $\rho_\Lambda - 3\rho_\Lambda = -2\rho_\Lambda$. Acceleration therefore begins when $2\rho_\Lambda > \rho_m$, i.e. while matter still dominates by a factor of two — at $z = 0.63$, $t = 7.7$ Gyr, some 6.1 billion years ago. Density equality follows later, at $z = 0.30$, $t = 10.3$ Gyr. Three distinct dates are loosely called "the onset of dark energy", and confusing them is common; the factor of two is a direct consequence of pressure appearing in the source of gravity.
```

## The record, epoch by epoch

What follows is not a list of events but an audit: for each epoch, what survives, and how well it is dated.

| Epoch | Time | Surviving evidence | Dating quality |
| --- | --- | --- | --- |
| Planck era | $<10^{-43}$ s | none | undefined — theory inapplicable |
| Inflation | $\sim10^{-36}$–$10^{-32}$ s | possibly the primordial spectrum | model-dependent; not dated |
| Baryogenesis | unknown | $\eta = 6.1\times10^{-10}$ | epoch entirely unknown |
| Quark–hadron | $1.5\times10^{-5}$ s | none direct; lab-reproducible | ~10%, from lattice $T_c$ |
| Neutrino decoupling | ~1 s | $C\nu B$; $N_{\rm eff} = 2.99\pm0.17$ | few per cent |
| Nucleosynthesis | 1–1200 s | D, ³He, ⁴He, ⁷Li | few per cent |
| Matter–radiation equality | 51,000 yr | power spectrum turnover | ~1% |
| Recombination | 372,000 yr | the CMB itself | ~0.3% |
| Dark Ages | 0.37–~180 Myr | **none yet** | endpoint uncertain by ×2 |
| First stars | ~100–200 Myr | indirect only | factor of ~2 |
| Reionization | ~0.4–0.93 Gyr | $\tau = 0.054$; quasar spectra | ~10% |
| Cosmic noon | 3.3 Gyr | star-formation history | ~10% |
| Solar System | 9.2 Gyr | meteorites | 0.1% |
| Now | 13.8 Gyr | — | 0.5% |

Read the right-hand column. **The events on a timeline are not equally well dated, and the differences span many orders of magnitude in confidence.** Recombination is fixed to a fraction of a per cent by the CMB's acoustic structure; the first stars are uncertain by a factor of two; baryogenesis has no date at all — we know it happened between the end of inflation and the quark–hadron transition, a span of some 30 decades, and nothing narrows it. A timeline drawn with uniform tick marks conceals all of this, and the concealment matters: it invites the reader to treat "inflation at $10^{-34}$ s" as a measurement of the same kind as "recombination at 372,000 years", which it is not.

```checkpoint
q: On the audit above, baryogenesis has no date at all while recombination is fixed to 0.3%. What is the practical consequence of drawing both on a timeline with uniform tick marks?
a: None — the tick marks are only a graphical convention and readers understand this
x: Readers routinely do not, and the convention actively suggests otherwise. A chart that renders a 30-decade window and a 0.3% measurement identically is making a claim by omission.
a*: It transfers unearned confidence from the well-dated events to the badly-dated ones, inviting "inflation at $10^{-34}$ s" to be read as a measurement of the same kind as "recombination at 372,000 years"
a: It exaggerates the uncertainty on well-measured epochs, since they are shown at the same coarse resolution as the rest
x: The direction of the error is the reverse — the poorly-dated entries gain apparent precision, not the other way round.
a: It makes no difference to the physics, so the concern is purely presentational
x: It changes what a reader believes is known, which is the thing a timeline exists to communicate. That is not merely presentational.
hint: Ask which entries gain credibility from being placed beside the others.
why: Recombination is pinned to a fraction of a per cent by the CMB's acoustic peak structure. The first stars are known only to a factor of two, from indirect reionization constraints and simulations of metal-free collapse. Baryogenesis has no date whatever: it happened somewhere between the end of inflation and the quark–hadron transition, roughly 30 decades, and no measurement narrows it — the entire surviving evidence is the single number $\eta$. Rendering all three as equivalent marks lends the weakest entries the authority of the strongest. It is the same failure the Early Universe chapter's confidence boundary was drawn to prevent, appearing in graphical rather than verbal form, and it is why the audit's right-hand column matters more than its left.
```

## The Dark Ages: the hole in the record

Between recombination and the first stars lies the longest stretch of cosmic history from which **nothing has been observed**.

After recombination the universe is neutral hydrogen and helium, transparent, and dark. The CMB has been released and is redshifting away. No stars exist. There are no sources of light — none — and there will be none for something like 180 million years. The interval spans a factor of about **500 in time**, from 372,000 years to perhaps 180 million, and it is unobserved not because instruments are inadequate but because there is nothing shining.

This is not a minor gap. **It covers the epoch in which the first gravitationally bound objects formed** — when the small density perturbations imprinted in the CMB grew, by gravitational instability, into the first collapsed halos. Everything about the transition from a smooth universe to a structured one happened here, and there is no direct record of any of it.

There is, however, one signal in principle available. Neutral hydrogen has a **hyperfine transition at 21 cm** (1420.4 MHz), arising from the spin flip between parallel and antiparallel proton and electron spins. It is a forbidden transition with a spontaneous rate of once per ten million years per atom — negligible for any laboratory sample, but the Dark Ages contain a great deal of hydrogen and a great deal of time.

The signal is seen **in absorption or emission against the CMB**, depending on whether the hydrogen spin temperature is below or above the radiation temperature. Because the line has a fixed rest frequency, the observed frequency gives the redshift directly, and hence the time: the Dark Ages at $z = 30$–$200$ redshift 21 cm into the 7–46 MHz band, and cosmic dawn at $z \approx 17$ lands at 79 MHz.

**In principle this is the richest dataset in cosmology** — a three-dimensional map of neutral hydrogen through an epoch the CMB cannot reach, with far more independent modes than the CMB's two-dimensional surface offers.

In practice it is brutally difficult. Galactic synchrotron foregrounds at these frequencies are some **four to five orders of magnitude brighter** than the signal, the ionosphere distorts and absorbs below about 30 MHz, and terrestrial FM broadcasting occupies part of the band outright. The most promising site is the far side of the Moon, which is why several proposed lunar radio observatories exist.

The state of the field is instructive. In 2018 the **EDGES** experiment reported an absorption trough centred at 78 MHz — precisely where cosmic dawn was expected — but with an amplitude roughly twice the largest value standard cosmology permits, which would require either unexpectedly cold hydrogen or an additional radio background. It attracted intense interest, including proposals invoking dark-matter–baryon scattering to cool the gas.

**It has not been confirmed.** The SARAS 3 experiment, using a different instrument on a lake in India specifically to control the ground-plane systematics that had been questioned, reported in 2022 a non-detection inconsistent with the EDGES profile at about $95\%$ confidence. The most likely explanation is an unmodelled instrumental or foreground systematic in one of the two experiments.

The right posture toward this is worth stating explicitly, because it recurs. **A signal detected at the expected frequency, by one experiment, with an unexpected amplitude, and not reproduced by an independent experiment designed to check it, is not yet a discovery.** The frequency agreement is genuinely striking and is why the claim was taken seriously. But a result whose *only* independent test disagrees with it has not been established, however attractive the interpretation. The honest summary of the Dark Ages remains: **not yet observed.**

```checkpoint
q: Why has nothing been observed from the Dark Ages, between recombination and the first stars?
a: Because the CMB is too bright at those redshifts and drowns out any signal
x: The CMB is a foreground for 21 cm work but not the reason for the gap — the gap exists because nothing was emitting.
a*: Because there were no sources of light — the universe was neutral, transparent and dark, containing no stars for roughly 180 million years after recombination
a: Because the universe was opaque during this period, so no light could propagate
x: The opposite: recombination made the universe transparent. Transparency without sources is exactly the problem.
a: Because the relevant wavelengths have been redshifted beyond the reach of current instruments
x: The 21 cm signal from this epoch falls at 7–46 MHz, which is reachable in principle; the difficulty is foregrounds and the ionosphere, not redshift.
hint: Transparency is necessary for observation but not sufficient. What else is needed?
why: Recombination at 372,000 years made the universe transparent and released the CMB. What followed was neutral hydrogen and helium, expanding and cooling, with no stars, no galaxies and no quasars — nothing emitting at all until the first stars formed around 100–200 Myr. The interval spans a factor of ~500 in time and is unobserved not for want of instruments but for want of sources. This matters because it is exactly the epoch in which the first gravitationally bound structures assembled from the perturbations the CMB records. The one signal available in principle is the 21 cm hyperfine line of neutral hydrogen, seen against the CMB, redshifted to 7–46 MHz — a potentially three-dimensional map, but buried under Galactic foregrounds four to five orders of magnitude brighter.
---
q: EDGES reported a 21 cm absorption trough at 78 MHz in 2018, at the expected cosmic-dawn frequency but with roughly twice the maximum amplitude standard cosmology allows. SARAS 3 did not confirm it. What is the appropriate assessment?
a: The detection stands, since the frequency agreement is too precise to be coincidental and SARAS 3 was less sensitive
x: Frequency agreement is why the claim was taken seriously, but a single unconfirmed detection contradicted by the one independent test is not established, and SARAS 3 was designed specifically to test it.
a*: Not established — a signal seen by one experiment, with an anomalous amplitude, and contradicted by the only independent experiment built to check it, most likely reflects an unmodelled systematic in one of the two
a: Refuted, since a null result from a later and better-controlled experiment settles the matter
x: SARAS 3's non-detection is inconsistent with the EDGES profile at about 95% confidence, which weakens the claim substantially but does not settle it. Neither experiment has been shown to be at fault.
a: Confirmed as new physics, since the anomalous amplitude requires dark-matter–baryon scattering to cool the gas
x: That interpretation was proposed to accommodate the amplitude, but building new physics on an unconfirmed measurement inverts the proper order.
hint: Ask what the strongest available independent test said.
why: The EDGES trough sits at 78 MHz, exactly where 21 cm absorption from $z \approx 17$ should appear, which is a genuinely striking coincidence and why the result received serious attention. But its depth exceeds what standard cosmology permits by about a factor of two, requiring either unexpectedly cold hydrogen or an extra radio background. SARAS 3, built with a different instrument and deployed on a lake specifically to control the ground-plane systematics that had been questioned, reported a non-detection inconsistent with the EDGES profile at ~95% confidence in 2022. The most economical reading is an unmodelled systematic somewhere. The general rule: a detection at the expected place, with an unexpected size, unreproduced by the one experiment designed to check it, is a candidate — not a discovery — and proposing new physics to explain its anomalous part inverts the order of business.
```

{{image: Reionization | The transition from the neutral, dark universe left by recombination to the ionised universe of the present. The first stars and galaxies carve expanding bubbles of ionised hydrogen into the neutral gas; the bubbles grow, overlap and eventually fill the volume. The process was roughly half complete at $z \approx 7.7$ and finished by $z \approx 6$, about 0.93 billion years after the beginning — leaving the intergalactic medium ionised to this day, which is what the Gunn–Peterson trough in high-redshift quasar spectra records.}}

## Cosmic dawn and reionization

The Dark Ages end when the first stars form, at $z \approx 20$–$30$, around 100–200 million years. These stars are believed to be very massive — metal-free gas cools poorly, having no metal lines and only molecular hydrogen to radiate away energy, so fragments collapse at higher masses — and correspondingly hot, short-lived and prolific producers of ionising ultraviolet.

They begin **reionization**: the conversion of the intergalactic medium from neutral back to ionised. The picture is one of bubbles. Each source carves an expanding ionised region into the neutral gas; the bubbles grow, meet, overlap, and finally fill the volume. It is **not** a uniform brightening but a patchy, inhomogeneous process, and its patchiness is one of the things 21 cm mapping would measure.

Two independent observations constrain the timing.

**The CMB's Thomson optical depth.** Free electrons after reionization scatter CMB photons, slightly damping the acoustic peaks and generating large-scale polarisation. Planck measures $\tau = 0.054 \pm 0.007$, implying a reionization midpoint near $z \approx 7.7$ — about 0.67 Gyr.

**The Gunn–Peterson trough.** Neutral hydrogen along the line of sight to a distant quasar absorbs Lyman-α completely, so a quasar seen through neutral gas shows no flux blueward of its own Lyman-α emission. Quasars at $z < 6$ show a forest of discrete absorption lines — the Lyman-α forest of the Intergalactic Medium chapter — while those above $z \approx 6$ begin to show complete absorption troughs. **The transition marks the end of reionization at $z \approx 6$**, about 0.93 Gyr.

The sensitivity here is worth appreciating: because Lyman-α absorption is so strong, a neutral fraction of only $10^{-4}$ suffices to black out the spectrum entirely. **The Gunn–Peterson test is exquisitely sensitive to the last traces of neutral gas and almost useless for anything earlier** — it saturates. That combination makes it a sharp endpoint marker and nothing else, which is exactly how it should be used.

Who did the ionising remains debated. Star-forming galaxies are the leading candidates, but the calculation requires knowing what fraction of ionising photons escape their host galaxies rather than being absorbed locally, and that escape fraction is poorly constrained and probably varies. Quasars contribute but are too rare at high redshift to dominate. **JWST has found more bright galaxies at $z > 10$ than most pre-launch models predicted**, which eases the photon budget somewhat and has prompted reassessment of early galaxy formation — though not, as some early coverage suggested, any crisis for cosmology itself. The tension is with galaxy-formation modelling, which is a different and much less constrained thing than the expansion history.

```checkpoint
q: JWST has found more bright galaxies at $z > 10$ than most pre-launch models predicted. What does this actually challenge?
a: The age of the universe, since galaxies appear too old for the time available
x: Galaxy ages are not what is anomalous; the surprise is in the abundance of bright sources, and the expansion history is constrained far more tightly by the CMB than by galaxy counts.
a*: Galaxy-formation modelling — how efficiently early halos convert gas into stars and how bright the result is — which is far less constrained than the expansion history and was always expected to be revised
a: The standard cosmological model, which cannot accommodate structure forming this early
x: This was the framing of much early coverage, but the constraints on the expansion history come from the CMB, BBN and BAO, none of which is affected by the brightness of early galaxies.
a: The reionization photon budget, which is now oversupplied by an order of magnitude
x: More early galaxies eases the photon budget, which had been strained — a resolution rather than a new problem.
hint: Ask which part of the calculation was tightly constrained beforehand and which was not.
why: The expansion history and the growth of dark-matter structure are constrained by the CMB, nucleosynthesis and baryon acoustic oscillations to per-cent precision, and none of those constraints involves how bright a young galaxy is. What connects a dark-matter halo to an observed luminosity is baryonic astrophysics — star-formation efficiency, the initial mass function, dust, feedback, and the possible contribution of accreting black holes — all of which were poorly constrained before JWST and were expected to be revised by it. So the tension is with galaxy-formation modelling, a much softer target than the cosmology. The practical effect on the timeline is to ease the reionization photon budget, which had been strained by uncertainty in the escape fraction. Distinguishing which layer of a calculation an anomaly threatens is most of the work in assessing it.
```

## Cosmic noon, and the decline

One more feature of the timeline deserves attention, because it is rarely stated plainly and is somewhat deflating.

The cosmic star-formation rate density — stellar mass formed per unit volume per unit time — rose steeply through the first few billion years, peaked at $z \approx 2$ (about **3.3 Gyr**, a period called **cosmic noon**), and has been declining ever since. **The present rate is roughly a tenth of the peak.**

Half of all the stellar mass in the universe today had already formed by $z \approx 1.3$, about 4.8 Gyr — **when the universe was a third of its present age.** Black-hole accretion, traced by quasar activity, peaked at a similar epoch, which is one of the observations the Supermassive Black Holes chapter used to argue for co-evolution.

The reasons are understood in outline. Gas is consumed by star formation and locked into stars and remnants; the remaining gas is heated by feedback from supernovae and active nuclei; merger rates decline as the expansion accelerates and dilutes; and the cold gas supply available to any given halo falls. The universe is running out of the raw material for stars.

**We live well after the peak, in a universe forming stars at a tenth of its former rate, and the rate is still falling.** This is the same conclusion the Superclusters and Cosmic Scale chapters reached from other directions — the cosmic web is a feature of this era, and the observable galaxy count is declining. The timeline confirms it from a third direction: **by the measure of how much is happening, the universe's most productive period is roughly ten billion years behind us.**

```checkpoint
q: The cosmic star-formation rate peaked at $z \approx 2$ and is now about a tenth of that value. What best explains the decline?
a: Star formation is inhibited by the accelerating expansion, which stretches molecular clouds apart
x: Expansion has no effect within gravitationally bound systems; molecular clouds are utterly unaffected by it.
a*: Gas is progressively consumed and locked into stars and remnants, heated by supernova and AGN feedback, and less readily supplied as merger rates fall — so the raw material for star formation is running out
a: The initial mass function has shifted toward lower-mass stars, which are harder to detect
x: Star-formation rates are measured with tracers calibrated for this; a shifted mass function is not the explanation and is not observed at the required level.
a: Metal enrichment has raised gas cooling efficiency, causing gas to collapse into black holes rather than stars
x: Metals raise cooling efficiency and if anything assist star formation; they do not divert gas into black holes.
hint: Ask what star formation consumes, and whether the supply is being replenished.
why: Star formation converts cold gas into stars, and much of that mass stays locked up in long-lived stars and remnants. What remains is heated and often expelled by supernova and AGN feedback, and the accretion of fresh cold gas declines as merger rates fall with the accelerating expansion. The result is a peak at $z \approx 2$ (3.3 Gyr) followed by a steady decline to about a tenth of the peak today, with half of all present-day stellar mass already formed by $z \approx 1.3$ — a third of the way through cosmic history. The conclusion agrees with what the Superclusters and Cosmic Scale chapters reached independently: the era of maximum cosmic activity is roughly ten billion years behind us.
---
q: The Gunn–Peterson trough marks the end of reionization at $z \approx 6$. Why is it a sharp endpoint marker but nearly useless for probing earlier epochs?
a: Because quasars bright enough to use are rare above $z = 6$, so the sample runs out
x: High-redshift quasars are rare but are found well beyond $z = 7$; sample size is not what limits the method.
a*: Because Lyman-α absorption is so strong that a neutral fraction of only $\sim10^{-4}$ blacks out the spectrum completely, so the test saturates and cannot distinguish 1% neutral from 100% neutral
a: Because the intergalactic medium's temperature changes the line strength unpredictably at higher redshift
x: Temperature affects line widths but not the saturation, which is what limits the method.
a: Because the Lyman-α forest replaces the trough at higher redshift, obscuring the signal
x: The forest appears at *lower* redshift, once the gas is mostly ionised; at higher redshift the absorption becomes more complete, not less.
hint: Ask how much neutral hydrogen it takes to absorb Lyman-α completely.
why: Lyman-α is a resonance transition with an enormous cross-section, so even a trace of neutral hydrogen along a long path absorbs completely. A neutral fraction of about $10^{-4}$ suffices to remove all flux blueward of the quasar's Lyman-α emission. That makes the appearance of complete troughs a very sharp indicator of the *last* traces of neutral gas — hence a clean endpoint at $z \approx 6$, 0.93 Gyr — but it means the test is fully saturated at any earlier epoch and cannot distinguish a universe 1% neutral from one entirely neutral. Constraining the midpoint requires something else, which is why the CMB's Thomson optical depth, $\tau = 0.054 \pm 0.007$ giving $z \approx 7.7$, does that job instead. Knowing what a probe saturates on is as important as knowing what it measures.
```

{{image: Hubble Ultra-Deep Field | A long exposure of a region of sky containing almost no foreground stars, reaching galaxies at redshifts beyond 7 — seen as they were within the first billion years. Images like this sample the timeline directly: the faint red objects are being observed during or shortly after reionization, while the larger spirals nearer the front are from cosmic noon and later. Depth in an image is depth in time, which is why a single exposure can span most of the epochs in the table above.}}

## Where we are

The present moment sits at 13.8 Gyr, in the dark-energy era, 6.1 billion years after acceleration began, roughly ten billion years after the peak of cosmic star formation, and 9.2 Gyr after the beginning for the Solar System's formation.

One asymmetry is worth naming, because it is easy to miss and it reframes everything above. **The past is bounded and the future is not.** Cosmic history so far is 13.8 Gyr; the future under a cosmological constant is unbounded. On a logarithmic axis — the one this chapter has argued is the physical one — **we are extraordinarily early.** Stars will continue forming, at a declining rate, for perhaps a hundred trillion years; the era of stellar burning has barely begun.

That cuts against the reading the previous section invites. By the measure of *rate* — how much is happening per unit time — the universe's peak is long past. By the measure of *elapsed decades*, essentially all of the future lies ahead. **Both are true, and the apparent conflict comes from asking one question with two different clocks**, which is precisely the confusion this chapter opened with.

```checkpoint
q: "The universe's most productive era is ten billion years behind us" and "on a logarithmic axis we are extraordinarily early" appear to conflict. How should this be resolved?
a: The first is correct and the second is speculation about an unobservable future
x: The future under a cosmological constant is a straightforward consequence of measured parameters; nothing speculative is required to say the stelliferous era has barely begun.
a*: Both are correct and use different clocks — one measures activity per unit time, the other elapsed logarithmic duration — so they answer different questions and neither refutes the other
a: The second is correct and the first mistakes a local decline for a global one
x: The decline in star formation is measured globally, over the whole observable volume, and is not a local effect.
a: They conflict genuinely, and the discrepancy reflects an unresolved tension in the star-formation history
x: There is no measurement tension here. The apparent conflict is entirely a matter of which measure is applied.
hint: Ask what is being counted in each statement, and per what.
why: Star formation, black-hole accretion and merger rates all peaked at $z \approx 2$ and have declined by about an order of magnitude since — a statement about activity per unit time, and correct. Meanwhile the past is 13.8 Gyr and bounded while the future under a cosmological constant is unbounded, with star formation continuing at a declining rate for perhaps a hundred trillion years — so measured in elapsed decades, essentially all of cosmic history lies ahead, and that is correct too. The apparent conflict comes entirely from asking one question with two clocks, which is the same confusion this chapter opened with when a linear timeline rendered the first second invisible. Wherever a quantity spans many orders of magnitude, the choice of measure is part of the claim.
---
q: We live within a factor of two in cosmic time of the matter–$\Lambda$ handover, a window that occupies a vanishing fraction of logarithmic history. How should the anthropic response to this coincidence be assessed?
a: It resolves the problem, since observers can only exist near the handover and so must find themselves there
x: It explains why the observed epoch is not randomly drawn, which is real progress, but it does not predict the value of $\Omega_\Lambda$ and so does not resolve the problem.
a*: It has genuine force as a selection argument — structure formation requires matter domination and observers require structure — but it is not a derivation, since it predicts no value for $\Omega_\Lambda$ and presupposes an ensemble over which $\Lambda$ varies
a: It should be rejected, since anthropic reasoning is unfalsifiable and therefore outside physics
x: Selection effects are ordinary and legitimate physics — they are why flux-limited surveys are corrected for Malmquist bias. The objection here is specific, not categorical.
a: It is unnecessary, because the coincidence is an artefact of using cosmic time rather than redshift
x: The coincidence persists in any measure: $\rho_m/\rho_\Lambda$ falls as $a^{-3}$, so the two are comparable only briefly however the axis is drawn.
hint: Ask what the argument would have to produce to count as an explanation rather than a consistency check.
why: Because $\rho_m/\rho_\Lambda \propto a^{-3}$, the two densities are comparable only during a brief logarithmic window, and we occupy it. The anthropic response notes that observers require structure, structure requires matter domination, and a much larger $\Lambda$ would have prevented structure from forming at all — so observers are necessarily found near the handover, and the epoch is not a random draw. That is a legitimate selection argument and it does dissolve the "why now?" version of the puzzle. What it does not do is predict $\Omega_\Lambda = 0.685$, or any value; and it requires an ensemble in which $\Lambda$ actually varies, which is assumed rather than established. Selection arguments explain why we see what we see given a distribution; they are not substitutes for the distribution.
```

## Pulling the thread

- Cosmic history spans **60.6 decades** from the Planck time to now, of which **43 — 71% — lie before the first second**. Events are roughly uniform in $\log t$, not in $t$, because the expansion timescale is of order $t$ itself. **A linear timeline is nearly blank; the logarithmic one is the physical one.**
- Three eras, two handovers: **radiation to matter at 51,000 yr** ($z = 3402$), setting the power-spectrum turnover; **matter to $\Lambda$ at 10.3 Gyr** ($z = 0.30$). But **acceleration began earlier**, at $z = 0.63$, $t = 7.7$ Gyr — **6.1 Gyr ago** — because pressure gravitates and acceleration needs only $\rho_\Lambda > \rho_m/2$.
- **Events on a timeline are not equally well dated.** Recombination is fixed to 0.3%; the first stars to a factor of 2; **baryogenesis has no date at all**. Uniform tick marks conceal differences spanning orders of magnitude in confidence.
- The **Dark Ages**, 372,000 yr to ~180 Myr, are the longest unobserved stretch — dark not from opacity but from **the absence of sources**. The **21 cm** line is the way in, buried under foregrounds four to five orders of magnitude brighter. **EDGES's 2018 claim is unconfirmed and contradicted by SARAS 3**; the honest summary is that the Dark Ages remain unobserved.
- **Reionization** is bracketed by two independent probes: $\tau = 0.054 \pm 0.007$ giving a midpoint at $z \approx 7.7$, and the **Gunn–Peterson trough** giving an endpoint at $z \approx 6$ (0.93 Gyr). Gunn–Peterson **saturates at a neutral fraction of $10^{-4}$**, making it a sharp endpoint marker and nothing else.
- **Cosmic noon** was $z \approx 2$, $t = 3.3$ Gyr. Star formation is now at **a tenth of the peak**, half of all stellar mass was in place by $z \approx 1.3$, and the decline continues. **The universe's most productive era is ten billion years behind us** — yet on a logarithmic axis nearly all of the future lies ahead.

The transferable idea: **before comparing intervals, establish which clock the question is asked in.** "Most of cosmic history" means the first second on a logarithmic axis and the last ten billion years on a linear one, and both statements are correct. The same ambiguity produces the apparent conflict between "the universe's peak is past" and "the universe has barely begun" — one is a statement about rates, the other about elapsed decades, and neither refutes the other. Wherever a quantity spans many orders of magnitude, **the choice of measure is part of the claim**, and an argument that seems to contradict another is often just a different clock. Ask which one before deciding who is wrong.

## Further reading

{{book: Simon Singh | Big Bang | 2004}}

{{book: Fred Adams and Greg Laughlin | The Five Ages of the Universe | 1999}}

{{book: Sean Carroll | From Eternity to Here | 2010}}

Beyond the books: Madau and Dickinson's 2014 review of the cosmic star-formation history is the standard reference for cosmic noon and is unusually readable for a review. On the Dark Ages, Furlanetto, Oh and Briggs give the canonical account of the 21 cm signal and are candid about the foreground problem. The EDGES and SARAS 3 papers are worth reading side by side as a case study in how a contested measurement is actually adjudicated.

## Problems

*Useful numbers: Planck time $10^{-43}$ s; age 13.79 Gyr $= 4.35\times10^{17}$ s; matter–radiation equality $z = 3402$, $t = 51{,}000$ yr; recombination $z = 1090$, $t = 372{,}000$ yr; matter–$\Lambda$ equality $z = 0.30$, $t = 10.3$ Gyr; acceleration onset $z = 0.63$, $t = 7.7$ Gyr; cosmic noon $z = 2$, $t = 3.3$ Gyr; reionization midpoint $z = 7.7$, end $z = 6$ at 0.93 Gyr; $\tau = 0.054 \pm 0.007$; 21 cm rest frequency 1420.4 MHz; $\Omega_m = 0.315$, $\Omega_\Lambda = 0.685$.*

**1.** *(Sixty decades.)* **(a)** Compute the number of decades from the Planck time to the present. **(b)** Compute the fraction lying before the first second. **(c)** Explain why the logarithmic measure is physically appropriate rather than merely convenient.

**2.** *(The two handovers.)* **(a)** State the redshift and time of each. **(b)** Show that matter–$\Lambda$ equality occurs at $z = (\Omega_\Lambda/\Omega_m)^{1/3} - 1$ and evaluate it. **(c)** Explain why acceleration begins earlier, deriving the condition.

**3.** *(Growth of structure.)* **(a)** Give the scale-factor law in each of the three eras. **(b)** Explain why matter–radiation equality sets a characteristic scale in the matter power spectrum. **(c)** State what the coincidence problem is and assess the anthropic response.

**4.** *(Dating quality.)* **(a)** Rank recombination, the first stars and baryogenesis by dating precision. **(b)** For each, state what fixes the date or why nothing does. **(c)** Explain what a uniformly ticked timeline conceals and why it matters.

**5.** *(The Dark Ages.)* **(a)** State the interval and the factor in time it spans. **(b)** Explain why nothing is observed, distinguishing this from opacity. **(c)** Compute the observed frequency of the 21 cm line at $z = 30$ and at $z = 17$, and state the two main observational obstacles.

**6.** *(EDGES.)* **(a)** State what was claimed and why it was taken seriously. **(b)** State what was anomalous about it and what SARAS 3 found. **(c)** State the general rule for assessing such a result, and what is wrong with proposing new physics to explain its anomalous part.

**7.** *(Reionization.)* **(a)** Describe the geometry of the process. **(b)** State the two independent timing constraints and what each fixes. **(c)** Explain why the Gunn–Peterson test saturates, and what follows for its use.

**8.** *(Cosmic noon.)* **(a)** State when star formation peaked and the present rate relative to it. **(b)** Give three reasons for the decline. **(c)** State the redshift by which half of present stellar mass had formed and what it implies about our position in cosmic history.

**9.** *(Two clocks.)* **(a)** State the sense in which the universe's most productive era is past. **(b)** State the sense in which nearly all of the future lies ahead. **(c)** Resolve the apparent conflict and state the general principle, with an example from elsewhere.

## Worked answers

**1.** **(a)** From $10^{-43}$ s to $4.35\times10^{17}$ s is $\log_{10}(4.35\times10^{17}/10^{-43}) = \log_{10}(4.35\times10^{60}) = \mathbf{60.6\ decades}$. **(b)** From $10^{-43}$ s to $10^{0}$ s is **43 decades**, so $43/60.6 = \mathbf{71\%}$ of cosmic history by this measure precedes the first second. **(c)** Because **the expansion timescale is of order $t$ itself**: at $10^{-35}$ s the universe doubled in size in $10^{-35}$ s; today doubling takes about ten billion years. A factor-of-ten interval in $t$ therefore always spans a comparable number of expansion times, and hence a comparable amount of physical change. Events are consequently distributed roughly uniformly in $\log t$ — the interval $10^{-6}$ to $10^{-5}$ s contains the quark–hadron transition, while $10^{5}$ to $10^{6}$ yr contains nothing at all. Linear intuition systematically misjudges which epochs were eventful.

**2.** **(a)** Matter–radiation equality: $z = 3402$, $t = 51{,}000$ yr. Matter–$\Lambda$ equality: $z = 0.30$, $t = 10.3$ Gyr. **(b)** Matter density scales as $\rho_m = \rho_{m,0}(1+z)^3$ and $\rho_\Lambda$ is constant, so equality requires $\Omega_m(1+z)^3 = \Omega_\Lambda$, giving $z = (\Omega_\Lambda/\Omega_m)^{1/3} - 1 = (0.685/0.315)^{1/3} - 1 = 1.296 - 1 = \mathbf{0.296}$. **(c)** Because the source of gravitational acceleration is $\rho + 3p/c^2$, not $\rho$. Matter is pressureless and contributes $\rho_m$; the cosmological constant has $p = -\rho_\Lambda c^2$ and contributes $\rho_\Lambda - 3\rho_\Lambda = -2\rho_\Lambda$. Setting the total to zero gives $\rho_m = 2\rho_\Lambda$, i.e. $(1+z)^3 = 2\Omega_\Lambda/\Omega_m = 4.35$, so $z = \mathbf{0.63}$ at $t = 7.7$ Gyr — **6.1 Gyr ago**, while matter still dominated by a factor of two. Three distinct dates are loosely called "the onset of dark energy"; confusing them is common.

**3.** **(a)** Radiation era: $\rho \propto a^{-4}$, $a \propto t^{1/2}$. Matter era: $\rho \propto a^{-3}$, $a \propto t^{2/3}$. Dark-energy era: $\rho$ constant, $a \propto e^{Ht}$. **(b)** Because perturbation growth is **suppressed while radiation dominates** — radiation pressure resists collapse and the rapid expansion outpaces gravitational infall — but proceeds efficiently once matter dominates. Modes that entered the horizon before equality therefore had their growth stalled, while those entering afterwards did not. Equality thus imprints a **turnover** in the matter power spectrum at the horizon scale at that moment, which is a direct fossil of $t = 51{,}000$ yr and is measured in galaxy surveys. **(c)** The **coincidence problem**: $\rho_m/\rho_\Lambda$ falls as $a^{-3}$, so the two are comparable only during a brief logarithmic window, and we happen to live within a factor of two in cosmic time of it. The anthropic response — that structure formation requires matter domination and observers require structure, so observers necessarily arise near the handover — has real force, since it explains why the observed epoch is not random. But it is a **selection argument, not a derivation**: it does not predict $\Omega_\Lambda$, and it works only given a mechanism for $\Lambda$ to vary across some ensemble, which is itself unestablished.

**4.** **(a)** Recombination (~0.3%) $\gg$ first stars (factor of ~2) $\gg$ baryogenesis (no date at all). **(b)** **Recombination** is fixed by the CMB's acoustic peak structure, which depends sharply on the conditions at last scattering; the sound horizon and the peak positions pin it to a fraction of a per cent. **First stars** are constrained only indirectly — by reionization's timing, by the absence of any direct detection, and by simulations of metal-free collapse whose inputs are uncertain — leaving a factor of two. **Baryogenesis** has **no observational date**: we know only that it followed inflation and preceded the quark–hadron transition, a span of roughly 30 decades, and no measurement narrows it, since the surviving evidence is the single number $\eta$. **(c)** A uniformly ticked timeline presents all entries as measurements of the same kind, inviting the reader to treat "inflation at $10^{-34}$ s" as comparable to "recombination at 372,000 years". They differ by orders of magnitude in evidential standing — one is a model-dependent placeholder, the other among the best-measured quantities in cosmology. **The concealment matters because it transfers unearned confidence from the well-dated events to the badly-dated ones**, which is precisely the error the Early Universe chapter's confidence boundary was drawn to prevent.

**5.** **(a)** From recombination at 372,000 yr to the first stars at roughly 180 Myr — a factor of about $180/0.372 = \mathbf{480}$ in time. **(b)** Because there were **no sources**. Recombination made the universe transparent, so opacity is not the issue; what is missing is anything emitting. Neutral hydrogen and helium expanded and cooled in darkness until gravitational collapse produced the first stars. Transparency is necessary for observation but not sufficient. **(c)** $\nu_{\rm obs} = 1420.4/(1+z)$ MHz: at $z = 30$, $\mathbf{45.8\ MHz}$; at $z = 17$, $\mathbf{78.9\ MHz}$. The obstacles are **Galactic synchrotron foregrounds**, four to five orders of magnitude brighter than the signal and requiring subtraction at the $10^{-5}$ level, and the **ionosphere**, which distorts and absorbs below about 30 MHz — with terrestrial FM broadcasting occupying part of the band as well. These together are why lunar far-side observatories are seriously proposed.

**6.** **(a)** An absorption trough centred at **78 MHz**, exactly where 21 cm absorption from cosmic dawn at $z \approx 17$ is expected. The frequency agreement is why it was taken seriously — it is a genuinely specific prediction to have hit. **(b)** Its **amplitude was about twice the maximum standard cosmology permits**, requiring either unexpectedly cold hydrogen or an additional radio background. **SARAS 3** — a different instrument, deployed on a lake specifically to control the ground-plane systematics that had been questioned — reported in 2022 a **non-detection inconsistent with the EDGES profile at ~95% confidence**. **(c)** The rule: **a signal seen by one experiment, at the right place but with the wrong size, and unreproduced by the one independent experiment built to check it, is a candidate rather than a discovery.** What is wrong with proposing new physics for the anomalous part is that it **inverts the order of business** — the amplitude is the part of the measurement in doubt, so building dark-matter–baryon scattering models on it means constructing theory on precisely the least secure element of an unconfirmed result. The correct next step is to find the systematic, not to explain the anomaly.

**7.** **(a)** **Bubbles.** Each ionising source carves an expanding H II region into the surrounding neutral gas; the bubbles grow, meet, overlap, and finally fill the volume. The process is **patchy and inhomogeneous**, not a uniform brightening — which is one of the things 21 cm tomography would map. **(b)** The **CMB Thomson optical depth** $\tau = 0.054 \pm 0.007$, arising from scattering off free electrons after reionization, which fixes the **midpoint** at $z \approx 7.7$ (0.67 Gyr). The **Gunn–Peterson trough** in quasar spectra, which fixes the **endpoint** at $z \approx 6$ (0.93 Gyr). **(c)** Lyman-α has an enormous resonant cross-section, so a neutral fraction of only $\sim10^{-4}$ removes all flux blueward of the quasar's Lyman-α emission. The test therefore **saturates**: it cannot distinguish a universe 1% neutral from one entirely neutral. What follows is that it is a **sharp marker of the last traces of neutral gas and useless for anything earlier**, so the midpoint must come from a different probe. Knowing what a measurement saturates on is as important as knowing what it measures — using Gunn–Peterson to constrain the midpoint would produce a confident and meaningless answer.

**8.** **(a)** Star formation peaked at $z \approx 2$, about **3.3 Gyr**, an epoch called cosmic noon. The present rate is roughly **a tenth** of the peak, and still falling. **(b)** Gas is **consumed** and locked into long-lived stars and remnants; remaining gas is **heated and expelled** by supernova and AGN feedback; and the **supply of fresh cold gas declines** as merger and accretion rates fall with the accelerating expansion. **(c)** Half of all present-day stellar mass had formed by $z \approx 1.3$, about **4.8 Gyr** — when the universe was roughly a third of its present age. We therefore live long after the era of maximum cosmic activity, a conclusion that agrees with the Superclusters chapter's finding that the cosmic web is a feature of this era and the Cosmic Scale chapter's that the observable galaxy count is now falling. **Three independent lines converge on the same conclusion**, which is what makes it worth stating rather than a rhetorical flourish.

**9.** **(a)** By the measure of **rate** — star formation, black-hole accretion, merger frequency, all per unit volume per unit time — the peak was at $z \approx 2$, some ten billion years ago, and everything has been declining since. **(b)** By the measure of **elapsed decades**, the past is 13.8 Gyr and bounded while the future under a cosmological constant is unbounded; stars will continue forming, at a declining rate, for perhaps a hundred trillion years. On a logarithmic axis we are **extraordinarily early**. **(c)** There is no conflict: the two statements use **different clocks**, one measuring activity per unit time and the other elapsed logarithmic duration. Both are correct, and neither refutes the other. The general principle is that **wherever a quantity spans many orders of magnitude, the choice of measure is part of the claim** — so before deciding that two claims conflict, establish which clock each is asked in. Elsewhere: "**most mutations are neutral**" and "**most evolutionary change is adaptive**" appear to conflict but are counted per mutation and per fixed difference respectively; the same structure, and the same resolution.$bbTime_master$,
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
