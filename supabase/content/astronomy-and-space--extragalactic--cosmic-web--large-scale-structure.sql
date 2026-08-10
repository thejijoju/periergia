-- Astronomy & Space · The Extragalactic Universe — The Cosmic Web —
-- "Large-Scale Structure". Curated master for
-- astronomy-and-space/extragalactic/cosmic-web/large-scale-structure
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Capstone of the Cosmic Web block AND of the whole Extragalactic branch.
-- The argument that the arrangement of galaxies is not a description of
-- the universe but a measurement of it. Why structure is irreducibly
-- statistical - the initial conditions were random, so only the
-- statistics were ever predicted and the particular arrangement carries
-- nothing further; the near-scale-invariant seed field with n_s = 0.965
-- measurably below 1; growth, and the P(k) turnover imprinted by an epoch
-- rather than by a place; the Zel'dovich argument explaining why the web
-- is sheets and filaments rather than blobs; baryon acoustic oscillations
-- with the sound horizon derived to 147 Mpc in two lines and matching the
-- measured value, giving a standard ruler laid down by known physics and
-- read at two epochs; redshift-space distortions converted from
-- systematic into a measurement of the growth rate and hence a test of
-- gravity; galaxy bias as the residual nuisance; and an honest current
-- scoreboard - DESI's 2.3 sigma, the S8 tension narrowed to 1.7 sigma -
-- closing the branch. ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/cosmic-web/large-scale-structure',
    'research',
    'advanced',
    'read',
    $egLss_master$> The cosmic web looks like an intricate object and is nothing of the kind. It is the outcome of a single process — gravity amplifying tiny random fluctuations in an expanding universe — and it is fully described not by a map but by a **statistic**. That is not a concession to complexity. The initial conditions were genuinely random, so only their statistical properties were ever predictable, and the particular arrangement of galaxies around us carries no information beyond them. **The map is not the message; the distribution the map was drawn from is.**

This chapter closes the branch. It began with a taxonomy of galaxy shapes and has arrived at the point where the arrangement of galaxies stops being a description of the universe and becomes a **measurement** of it — of its composition, its expansion history, and the law of gravity acting on the largest scales.

## Why structure is a statistical object

Begin with a claim that sounds like a limitation and is actually the physics.

Inflation, or whatever process set the initial conditions, produced a **random field** of density fluctuations. Random does not mean arbitrary: the field has well-defined statistical properties — an amplitude, a dependence on scale, a distribution of values. But no theory predicts that *this* filament runs *there*. Such a prediction is not merely beyond current capability; it does not exist, because the theory generates an ensemble and we observe one realisation.

The consequence is that the correct description of structure is a statistic, and the standard ones are:

**The two-point correlation function** $\xi(r)$ — the excess probability, over random, of finding two galaxies separated by $r$. If $\xi(r) = 0.5$ at 10 Mpc, then pairs at that separation are 50 per cent more common than in a uniform random distribution.

**The power spectrum** $P(k)$ — the Fourier transform of $\xi(r)$, giving the variance of density fluctuations as a function of spatial frequency $k$. Large $k$ means small scales.

These carry the same information and are used interchangeably, with $P(k)$ preferred for theory (Fourier modes evolve independently in linear theory) and $\xi(r)$ often preferred for data (the BAO feature is a localised bump in $\xi$ and an oscillation spread across $P$).

Two properties of the primordial field make this description close to complete.

**It is Gaussian.** The fluctuations follow a Gaussian distribution, so the two-point function specifies *everything* — all higher-order statistics follow. This is a strong claim and it is testable: any detected primordial non-Gaussianity would be a direct window onto the physics of inflation, and searches for it are a major programme. None has been found.

**It is nearly scale-invariant.** The primordial power spectrum follows $P(k) \propto k^{n_s}$ with $n_s = 0.965$ — close to 1, meaning fluctuations entered with nearly equal amplitude on every scale, but **measurably below 1**.

That deviation matters more than its size suggests. Exact scale invariance, $n_s = 1$, is the natural round number; inflation predicts a small **tilt** away from it, because the inflaton field is slowly rolling and conditions change slightly as different scales exit the horizon. Measuring $n_s = 0.965 \pm 0.004$ — several standard deviations from unity — is therefore a **confirmed quantitative prediction** of inflationary physics, not merely a consistency check. Round numbers are what a theory predicts when nothing is happening; the departure from one is where the content is.

```checkpoint
q: Cosmological theory predicts the statistical properties of large-scale structure but not the position of any particular filament. This is
a: a temporary limitation that better simulations and initial-condition reconstruction will eventually overcome
x: No amount of computation can help: the theory generates an ensemble of possible universes, and the specific realisation we inhabit was set by a random process rather than derived from anything.
a*: intrinsic — the initial conditions were a random field, so only statistical properties were ever predictable, and the particular arrangement carries no information beyond them
a: a sign that the theory is incomplete and a deterministic account of structure formation is still needed
x: The randomness is a feature of the physics, not a gap in it; a deterministic prediction of where filaments lie would require the initial fluctuations to have been determined, which no viable theory proposes.
a: true only on the largest scales, since smaller structures can be predicted individually
x: The randomness applies at every scale; smaller structures are equally unpredictable individually, and are additionally harder to model because their evolution is non-linear.
hint: What kind of object does the theory actually predict — a universe, or a distribution of possible universes?
why: Inflation produces a random field with definite statistical properties — amplitude, scale dependence, and a distribution of values — but no theory says this filament runs here. That is not a shortfall in computing power; the theory generates an ensemble, and we observe one draw from it. So the correct object of study is the statistic: the two-point correlation function ξ(r) or its Fourier transform P(k). And because the primordial field is Gaussian, the two-point function specifies everything, with all higher-order statistics following from it — a strong and testable claim, which is why searches for primordial non-Gaussianity are a major programme and a detection would be a direct window onto inflationary physics.
```

## Growth, and a feature made by an epoch

Fluctuations grow because gravity is unstable: a slightly overdense region attracts more matter, becomes denser, and attracts more still. In an expanding universe the growth is slowed — expansion pulls material apart faster than gravity assembles it — so instead of runaway exponential growth, the density contrast grows as a **power of the scale factor**:

$$\delta \propto a \qquad \text{(matter domination)}$$

That linear growth holds only while matter dominates the expansion, and it is bracketed on both sides.

**Before matter–radiation equality** ($z_{\rm eq} \approx 3400$), radiation dominates, the expansion is faster, and perturbations inside the horizon barely grow at all — they are suppressed.

**After dark energy takes over** ($z \approx 0.3$), the accelerating expansion overwhelms gravity again and growth freezes, as the previous chapter established.

The suppression during radiation domination leaves an observable fingerprint. A perturbation's growth is stalled from the moment it enters the horizon until equality, so **small-scale modes — which enter the horizon early — are suppressed relative to large-scale modes**, which enter later or after equality and grow unimpeded. The result is a **turnover** in the power spectrum: $P(k)$ rises with $k$ on large scales, peaks at the scale corresponding to the horizon size at matter–radiation equality (around 100 Mpc/h), and falls thereafter.

This deserves a moment's attention, because it is a strange kind of feature. **Nothing is at that scale.** The turnover is not produced by any structure of that size; it is imprinted by a *transition in time* — the moment radiation ceased to dominate — which converts into a length through the horizon size at that moment. **A feature in a spatial statistic that records an epoch rather than a place** is a recurring pattern in cosmology, and the acoustic scale of the next section is its most useful instance.

```checkpoint
q: The matter power spectrum P(k) turns over at a scale near 100 Mpc/h. What produces this feature?
a: A characteristic size of galaxy clusters or superclusters at that scale
x: No structure of that size imposes it — superclusters are far smaller in mass scale, and the feature exists in the linear power spectrum before non-linear structures form.
a*: The horizon size at matter–radiation equality: modes entering the horizon before equality had their growth suppressed during radiation domination, while larger modes entering later grew unimpeded — so the feature records an epoch converted into a length
a: The sound horizon at recombination, which also sets the baryon acoustic scale
x: The sound horizon at 147 Mpc produces the BAO wiggles, a separate and much subtler feature; the turnover is set by the equality horizon, which is a different scale and a different mechanism.
a: The transition from linear to non-linear growth, which erases structure below that scale
x: Non-linear evolution modifies P(k) on much smaller scales and adds power rather than producing a turnover at 100 Mpc/h.
hint: Growth was suppressed while radiation dominated. Which modes were inside the horizon then?
why: During radiation domination the expansion is fast enough that perturbations inside the horizon scarcely grow. A mode's fate therefore depends on when it entered the horizon: small-scale modes entered early and were suppressed for a long time, large-scale modes entered near or after equality and grew freely. The dividing line is the horizon size at matter–radiation equality, z_eq ≈ 3400, which maps to about 100 Mpc/h today — so P(k) rises, peaks there, and falls. Nothing is physically that size; the feature records a moment in time, converted into a length by the horizon. That pattern — a spatial statistic carrying the imprint of an epoch — recurs throughout cosmology, and the acoustic scale is its most useful instance.
---
q: Gravitational instability is a runaway process, yet cosmic density contrast grows only as δ ∝ a rather than exponentially. Why?
a: Because dark energy has always opposed the growth of structure
x: Dark energy became dynamically important only around z ≈ 0.3; the δ ∝ a growth law holds throughout the long matter-dominated era before that.
a*: Because the universe is expanding, so material is being pulled apart even as gravity assembles it — the competition between the two turns what would be exponential growth into a power law
a: Because the perturbations are too small for gravity to act non-linearly
x: The growth law δ ∝ a is a property of the linear regime, but linearity is not what makes it a power law; a small perturbation in a static medium would still grow exponentially.
a: Because pressure resists collapse, limiting the growth rate
x: After recombination the matter is pressureless on these scales — that is precisely why it can collapse at all. Pressure matters before recombination and on small scales, not here.
hint: Compare a perturbation in a static medium with one in a medium that is being stretched.
why: In a static medium, an overdensity grows exponentially — the classic Jeans instability. Expansion changes the character of the problem: while gravity draws material inward, the background expansion carries it outward, and the two nearly balance. The residual is a power law, δ ∝ a in matter domination. This is why structure formation takes billions of years rather than a Hubble-time instant, and it makes the growth history sensitive to the expansion history — which is exactly the sensitivity redshift-space distortions exploit to test gravity. The same competition, when expansion accelerates under dark energy, shuts growth off entirely.
```

{{image: Millennium Run | A slice through a cosmological N-body simulation, showing the characteristic web of filaments meeting at dense knots with vast near-empty voids between. Nothing in the initial conditions specified this pattern: it is what gravitational amplification of a random, nearly scale-invariant fluctuation field produces, and the agreement between such simulations and galaxy surveys is a statistical agreement rather than a match of individual features.}}

## Why a web and not a scatter of blobs

The cosmic web's characteristic morphology — sheets and filaments meeting at knots — has an explanation that is unusually satisfying, and it comes from asking what generic collapse looks like.

Consider a region destined to collapse. Its collapse is governed by the local tidal field, which can be described by three principal axes with three collapse rates. **The rates are essentially never equal.** Exact equality would require a precisely spherical perturbation, which has zero probability in a random field.

So collapse proceeds **anisotropically**, and along the fastest-collapsing axis first. Zel'dovich's insight was to follow the consequences:

**First, collapse along one axis** produces a flattened structure — a **sheet**, or "pancake". This happens first everywhere, because there is always a fastest axis.

**Then collapse along the second axis** turns the sheet into an elongated structure — a **filament**.

**Finally collapse along the third** produces a compact **knot** — a cluster.

Since regions are at different stages of this sequence at any given time, the universe simultaneously displays sheets, filaments and knots, connected because they are stages of one process operating on a continuous field. Voids are the regions that never collapsed along any axis.

**This explains the web's topology from a statistical argument about tidal fields**, with no appeal to any structure-forming mechanism beyond gravity. And it makes a testable prediction that is borne out: filaments should be **aligned** with the surrounding tidal field, and galaxy spins and shapes should correlate with filament orientation — which is observed, and is the basis of the intrinsic-alignment systematic that weak lensing surveys must model.

The general form of the argument is worth extracting. **Asking what a process does generically — rather than in the symmetric case that is easiest to calculate — often explains a morphology that looks designed.** Spherical collapse is the textbook case and produces blobs; the universe is not made of blobs, because spherical collapse essentially never happens.

```checkpoint
q: The cosmic web consists of sheets and filaments rather than isolated spherical clumps. The reason is that
a: filaments are formed by gas flows channelled along magnetic field lines
x: Magnetic fields are dynamically negligible on these scales, and the web appears in dark-matter-only simulations with no gas or magnetic fields at all.
a*: collapse is governed by a tidal field with three unequal principal axes, so it proceeds along the fastest axis first — making a sheet, then a filament, then a knot — and exact isotropy has zero probability in a random field
a: filaments are the remnants of cosmic strings or other topological defects
x: Defect models were investigated and are excluded as the dominant source of structure by CMB observations; the web arises from ordinary gravitational instability.
a: gravitational collapse is spherical, but the resulting clumps are then stretched by cosmic expansion
x: Expansion acts isotropically and cannot stretch a spherical clump into a filament; the anisotropy is present in the collapse itself.
hint: For a randomly shaped perturbation, what is the probability that all three collapse rates are exactly equal?
why: Collapse is set by the local tidal tensor, whose three eigenvalues are essentially never equal — exact equality requires precise spherical symmetry, of measure zero in a random field. So there is always a fastest axis, and collapse along it produces a sheet; subsequent collapse along the second axis makes a filament, and along the third a knot. Regions sit at different stages simultaneously, so the universe displays all three connected as phases of one process, with voids as regions that collapsed along no axis. The argument uses nothing but gravity acting on a random field, and it predicts that filaments align with the surrounding tidal field and that galaxy spins and shapes correlate with filament orientation — observed, and the origin of the intrinsic-alignment systematic weak lensing surveys must model.
```

## The acoustic scale: a ruler laid down by known physics

Now the most useful feature in the whole subject, and one whose scale can be derived on the back of an envelope.

**The mechanism.** Before recombination, photons and baryons are tightly coupled by Thomson scattering into a single fluid with enormous radiation pressure. A small overdensity in that fluid does not simply collapse — pressure resists, and the perturbation launches a **sound wave**. The sound speed in a radiation-dominated fluid is

$$c_s \approx \frac{c}{\sqrt{3}} = 1.73\times10^{8}\ \mathrm{m/s}$$

— more than half the speed of light. A spherical shell of baryons therefore expands outward from each initial overdensity.

At recombination the photons decouple, the pressure vanishes, and **the wave stops**. The baryon shell is stranded at whatever radius it had reached, leaving a spherical overdensity of that radius around every original perturbation. Since galaxies form preferentially in overdense regions, galaxies today are **slightly more likely to be separated by that distance** than by any other.

**The scale.** The shell travelled for the age of the universe at recombination, $t_{\rm rec} \approx 380{,}000$ yr, at speed $c_s$. Because the scale factor was growing during that time as roughly $a \propto t^{1/2}$, integrating $\int c_s\,dt/a$ contributes a factor of 2 relative to the naive product. So the comoving sound horizon is approximately

$$r_d \approx 2c_s t_{\rm rec}(1+z_{\rm rec}) = 2(1.73\times10^{8})(1.2\times10^{13})(1091) = 4.5\times10^{24}\ \mathrm{m} \approx \mathbf{147\ Mpc}$$

The measured value is **147 Mpc**. A two-line estimate from the sound speed, the age at recombination and the redshift reproduces one of cosmology's most precisely measured quantities.

**Why this is so valuable.** The acoustic scale is a **standard ruler** whose length is set by physics we understand — sound propagation in a hot plasma — and computed from parameters measured elsewhere. Measuring its *apparent* size at various redshifts therefore measures distances, and hence the expansion history.

Better still, **the same ruler appears in two entirely different observations at two different epochs.** In the cosmic microwave background it produces the acoustic peaks, seen at $z \approx 1100$ as an angular scale. In the galaxy distribution it produces a bump in $\xi(r)$ at 147 Mpc, seen at redshifts from 0 to 3 as a length. One physical scale, laid down once, read out by two techniques with nothing in common observationally.

**The detection.** The feature is small — a few per cent excess in clustering — so finding it required enormous samples. In 2005 Eisenstein and collaborators detected the acoustic peak in the correlation function of **46,748 luminous red galaxies** from the Sloan Digital Sky Survey, with the 2dF survey reporting the corresponding power-spectrum signature simultaneously. It has since become the workhorse of observational cosmology, and current surveys measure it across a wide redshift range.

```checkpoint
q: The baryon acoustic scale is called a standard ruler. What makes it a better standard ruler than, say, the typical size of a galaxy cluster?
a: It is much larger, and larger objects are easier to measure accurately
x: Size alone confers no reliability — a large object of unknown intrinsic size is no more useful as a ruler than a small one.
a*: Its length is fixed by physics we can compute — sound propagation in the pre-recombination plasma — from parameters measured independently, so it is known a priori rather than calibrated from the data it is used to interpret
a: It does not change with redshift, whereas cluster sizes evolve
x: The comoving acoustic scale is indeed fixed while cluster properties evolve, but the decisive advantage is that the acoustic scale is *calculable*, not merely constant.
a: It can be measured in a single galaxy pair, requiring no statistical analysis
x: The opposite — it is a few per cent excess in pair counts, requiring tens of thousands of galaxies. Its first detection used 46,748.
hint: A ruler is only useful if you know its length. Where does each candidate's length come from?
why: A standard ruler must have a length known independently of the measurement it enables. The acoustic scale does: photons and baryons were coupled into a fluid with sound speed c/√3, a perturbation launched a shell that expanded until recombination froze it, and the resulting comoving scale follows from the sound speed, the age at recombination and the redshift — about 147 Mpc, reproducible in two lines and matching the measured value. Cluster sizes have no such derivation and must be calibrated empirically. Better still, the same scale is read out twice by unrelated techniques: as an angular scale in the CMB at z ≈ 1100 and as a length in galaxy clustering from z = 0 to 3, so consistency between them tests the framework rather than assuming it.
---
q: The baryon acoustic feature is only a few per cent excess in galaxy clustering, and its first detection needed 46,748 galaxies. Why is such a weak signal nonetheless among cosmology's most valuable measurements?
a: Because weak signals are less affected by systematic errors than strong ones
x: Weak signals are generally *more* vulnerable to systematics, not less; the acoustic peak's robustness comes from its sharp localisation in separation, not from its amplitude.
a*: Because its position, not its amplitude, carries the information — and a position is far more robust to the astrophysical uncertainties, like galaxy bias, that shift clustering amplitude but not the location of a feature laid down by pre-recombination physics
a: Because it is the only feature in the galaxy correlation function, so it cannot be confused with anything else
x: The correlation function has considerable structure from the shape of P(k) and from non-linear evolution; the acoustic peak sits on top of all of it.
a: Because a few per cent excess is easy to detect once enough galaxies are counted, unlike other cosmological signals
x: Detecting it required tens of thousands of galaxies precisely because it is hard; ease of detection is not the source of its value.
hint: Bias multiplies clustering amplitude. What does it do to the separation at which a bump appears?
why: Galaxy bias, non-linear evolution and survey selection all change how strongly galaxies cluster — they multiply or reshape the amplitude of ξ(r). None of them moves a feature laid down at 147 Mpc by physics that finished at recombination, and shifts from non-linear evolution are small and calculable. So the measurement that matters is *where* the bump sits, which converts directly into a distance, and it is largely immune to the astrophysical nuisance parameters that plague amplitude-based probes such as σ₈. That is why a few-per-cent bump requiring tens of thousands of galaxies became the workhorse of expansion-history measurement: robustness of a position beats strength of an amplitude.
```

{{image: Cosmic microwave background | The cosmic microwave background's temperature fluctuations — the same primordial density field, seen at z ≈ 1100 before gravity had amplified it. The acoustic peaks in its angular power spectrum and the 147 Mpc bump in the galaxy correlation function are one physical scale, laid down once in the photon-baryon plasma and read out by two techniques with nothing observationally in common.}}

## Turning a systematic into a measurement

Galaxy surveys measure redshifts, and redshift is not distance: it combines the cosmological expansion with the galaxy's peculiar velocity. Maps built by treating redshift as distance are therefore distorted along the line of sight — the same difficulty the previous chapter met, now appearing as a defect in every galaxy map.

The distortions take two recognisable forms.

**Fingers of God.** Inside a virialised cluster, galaxies move at ~1,000 km/s in random directions. Converting those velocities into distances smears the cluster into an elongated structure pointing at the observer. Every rich cluster in a redshift survey appears as a radial spike — an artefact so distinctive it is unmistakable, and so named because the spikes all point at us.

**The Kaiser effect.** On large scales, galaxies are still infalling toward overdensities. Those on the near side move away from us relative to the Hubble flow, those on the far side toward us, so structures appear **compressed** along the line of sight. This is a coherent, mild distortion, opposite in sense to the fingers.

The obvious response is to correct for these. The productive response is to **measure** them, because their amplitude carries physical information.

The Kaiser compression depends on how fast galaxies are falling in, which depends on the **growth rate of structure** $f = d\ln\delta/d\ln a$. Measuring the anisotropy of clustering — comparing correlations along and across the line of sight — therefore measures $f\sigma_8$, the growth rate times the fluctuation amplitude.

**And the growth rate is a test of gravity.** General relativity predicts a definite relation between the expansion history and the growth rate: given how fast the universe is expanding, gravity determines how fast structure assembles. Modified gravity theories, constructed to mimic dark energy's effect on expansion, generically predict a **different growth rate** for the same expansion history. So measuring expansion (via BAO) and growth (via redshift-space distortions) in the *same* survey tests whether one theory accounts for both.

This is the sharpest available large-scale test of general relativity, and it exists because someone declined to treat a distortion as noise. **A systematic that depends on physics you care about is a measurement in disguise** — the question to ask of any nuisance effect is not only how to remove it but what its amplitude would tell you if you measured it instead.

```checkpoint
q: Redshift-space distortions corrupt galaxy maps, yet they are treated as a valuable signal. Why?
a: Because they can be removed exactly once the cluster masses are known, leaving a clean map
x: They cannot be removed exactly — peculiar velocities are not known galaxy by galaxy — and treating removal as the goal misses what the distortion carries.
a*: Because the amplitude of the large-scale compression depends on the growth rate of structure, so measuring the anisotropy of clustering measures fσ₈ — and comparing growth with expansion tests general relativity
a: Because the fingers of God identify galaxy clusters more efficiently than other methods
x: They do make clusters conspicuous in redshift space, but that is a convenience rather than the reason the distortions are scientifically valuable.
a: Because the distortions cancel when averaged over enough galaxies, so no correction is needed
x: They do not cancel — they are coherent and systematic, which is precisely what makes them measurable rather than noise.
hint: The compression is caused by infall. What sets how fast galaxies fall in?
why: On large scales, galaxies infalling toward overdensities make structures appear squashed along the line of sight, and the amount of squashing depends on the infall speed — which is set by the growth rate f = dlnδ/dlna. Comparing clustering along and across the line of sight therefore measures fσ₈. The payoff is a test of gravity: general relativity fixes a definite relation between expansion history and growth rate, while modified gravity theories built to mimic dark energy's effect on expansion generically predict different growth. Measuring both in one survey — BAO for expansion, distortions for growth — checks whether a single theory accounts for both. A systematic that depends on physics you care about is a measurement in disguise.
```

## Bias: galaxies are not matter

One complication stands between the observation and the theory, and it is the field's principal nuisance.

Theory predicts the clustering of **matter**. Surveys measure the clustering of **galaxies**. These differ, because galaxies do not form uniformly wherever matter is — they form in the **peaks** of the density field, where collapse happens first.

Peaks of a random field are more strongly clustered than the field itself. The reason is worth seeing: a large-scale overdensity raises the local mean, so more of the small-scale fluctuations riding on it cross the threshold for collapse. Regions that are slightly overdense on large scales therefore contain disproportionately many peaks, and the peaks trace an amplified version of the underlying pattern.

The relation is written

$$\delta_{\rm galaxies} = b\,\delta_{\rm matter}$$

with $b$ the **bias**, greater than 1 for massive galaxies and rarer objects. Luminous red galaxies and quasars are strongly biased; faint blue galaxies less so.

The difficulty is that $b$ depends on galaxy type, mass, and redshift, is not constant with scale, and is not calculable from first principles. It must be measured or marginalised over — and it is **degenerate with $\sigma_8$**, since a more strongly clustered galaxy sample looks the same as a more strongly clustered universe.

Several routes break the degeneracy: **redshift-space distortions** measure $f\sigma_8$ with a different bias dependence; **weak gravitational lensing** measures the matter field directly, since light is deflected by all mass regardless of whether it shines; and **higher-order clustering statistics** depend on bias differently from the two-point function.

The structural point is one this branch has met repeatedly. **The observable is not the quantity of interest**, and the gap between them is bridged by a parameter that must be constrained by combining measurements with different dependencies on it. The same shape appeared with the virial factor $f$ in reverberation mapping, the mass-loading factor $\eta$ in the regulator model, and hydrostatic bias in cluster masses. **A mature field is largely a set of techniques for constraining the parameters that stand between what is measured and what is meant.**

```checkpoint
q: Galaxies cluster more strongly than the underlying matter. The reason is that
a: galaxies attract one another gravitationally, enhancing their clustering over time
x: Galaxies are test particles in the overall matter field; their mutual attraction is negligible compared with the large-scale field, and bias is present from formation rather than accumulating.
a*: galaxies form in the peaks of the density field, and a large-scale overdensity raises the local mean so that more small-scale fluctuations cross the collapse threshold — so peaks trace an amplified version of the underlying pattern
a: dark matter is smoothly distributed while galaxies are discrete, and discreteness increases measured clustering
x: Discreteness contributes shot noise, which is subtracted in the analysis, and it does not produce the coherent large-scale amplification that bias describes.
a: galaxies are observed only where they are bright enough to detect, and bright galaxies happen to cluster
x: Selection effects are real and must be modelled, but bias is a physical property of where galaxies form, present even in a complete sample.
hint: Galaxies form where the density crosses a threshold. What does a large-scale overdensity do to how often that threshold is crossed?
why: Collapse requires the local density to exceed a threshold, and small-scale fluctuations ride on top of large-scale ones. Where the large-scale field is high, the effective threshold for the small-scale fluctuations is easier to reach, so a disproportionate number of peaks form there. Galaxy counts therefore vary more sharply than the matter density: δ_gal = b δ_m with b > 1, more so for rarer and more massive objects. The trouble is that b depends on type, mass, scale and redshift, is not calculable from first principles, and is degenerate with σ₈ — a more clustered sample looks like a more clustered universe. Breaking it requires observables with different bias dependence: redshift-space distortions, weak lensing, which sees all mass directly, and higher-order statistics.
```

## The scoreboard

What has all this measured? An honest summary, distinguishing the settled from the contested.

**Settled.** The composition of the universe — roughly 5 per cent baryons, 27 per cent dark matter, 68 per cent dark energy — measured consistently by the CMB, by BAO, by cluster abundance, and by lensing. The near-scale-invariant, Gaussian, adiabatic character of the primordial fluctuations. The growth of structure by gravitational instability from those fluctuations, verified in detail by the agreement between simulations and surveys across many statistics. The acoustic scale as a standard ruler, consistent between the CMB at $z\approx1100$ and galaxies at $z<3$.

**Contested, and interesting.** Two tensions are live, and both concern whether a single model fits everything.

The **$S_8$ tension**: weak lensing surveys have found the amplitude of matter clustering somewhat lower than the CMB predicts — Planck giving $S_8 = 0.830 \pm 0.013$ against weak lensing values near 0.76–0.78. This has narrowed with improved analyses, and a recent joint KiDS/DES treatment puts the discrepancy at about **1.7σ** — no longer compelling, but not clearly gone.

**Dark energy's constancy**: DESI's baryon acoustic oscillation measurements, particularly when combined with supernovae and CMB priors, prefer a dark energy equation of state that **evolves** rather than staying constant, with the BAO-preferred parameters in roughly **2.3σ** tension with those from the CMB under $\Lambda$CDM. The preference has persisted from the first data release into the second rather than fading. It is not yet a discovery — 2 to 3σ results have a poor historical record — but it is the most interesting thing in the field, because a genuinely evolving dark energy would exclude a cosmological constant and demand new physics.

The right posture is the one this branch has recommended throughout: **hold the framework firmly and the parameters loosely**, note which claims rest on calibrations rather than on measurements, and watch the tensions that survive independent analysis rather than the ones that appear in single datasets.

```checkpoint
q: DESI's baryon acoustic oscillation results prefer evolving dark energy over a cosmological constant at roughly 2.3σ. How should this be read?
a: As a discovery — 2.3σ corresponds to about 98% confidence, which is conventionally sufficient
x: Significance thresholds in cosmology are deliberately far stricter, because results at this level have a poor historical record and because the quoted significance depends on modelling choices not captured in the number.
a*: As the field's most interesting live result but not a discovery — results at 2–3σ frequently evaporate, though the fact that the preference persisted from the first data release into the second rather than fading is what makes it worth watching
a: As a systematic error, since a cosmological constant is theoretically required
x: Nothing requires dark energy to be constant; a cosmological constant is the simplest option, not a mandated one, and evolving dark energy is a legitimate alternative.
a: As irrelevant, since BAO measures expansion and dark energy affects only growth
x: Dark energy dominates the expansion history, which is exactly what BAO measures as a standard ruler — so BAO is a direct probe of it.
hint: Ask what usually happens to 2–3σ results, and what distinguishes this one from the usual case.
why: Two-to-three-sigma results in cosmology have historically resolved toward the null more often than not, as unmodelled systematics or analysis choices are found — so the appropriate posture is interest rather than belief. What distinguishes this case is persistence: the preference did not weaken when DR2 added statistical power and wider redshift coverage, which is not what a statistical fluctuation typically does. It also matters because the stakes are unusually clean: a genuinely evolving equation of state would exclude a cosmological constant outright and demand new physics, rather than merely shifting a parameter. Hold the framework firmly and the parameters loosely, and watch which tensions survive independent analysis.
---
q: The S8 tension has narrowed from a widely discussed discrepancy to about 1.7σ in recent joint analyses. What does this trajectory illustrate?
a: That the original measurements were fraudulent or incompetent
x: Nothing of the sort — the earlier analyses were careful and their treatment of systematics was appropriate to what was then understood; the improvement came from better modelling and larger samples.
a*: That apparent tensions frequently shrink as systematics are better modelled and datasets are combined — so the informative question about any tension is whether it survives improved analysis, not how large it looked initially
a: That weak lensing is unreliable and should be discounted relative to CMB measurements
x: Weak lensing measures the matter field directly and is one of the few probes free of galaxy bias; the convergence came from improvements on both sides, not from one being discarded.
a: That the tension has been fully resolved and no discrepancy remains
x: 1.7σ is not compelling but is not zero either, and the matter is not formally closed — describing it as resolved overstates the situation.
hint: Compare how the S8 tension evolved with how the DESI result evolved, and ask what the difference tells you.
why: A tension's initial size says little; what matters is its behaviour under scrutiny. S8 narrowed as intrinsic alignments, baryonic feedback on small scales, photometric redshift calibration and shear measurement were better modelled, and as surveys were combined — the ordinary course of a discrepancy driven by imperfectly understood systematics. The contrast with DESI is the point: there, adding data and redshift coverage did *not* dilute the preference. Two tensions of comparable nominal significance can therefore warrant quite different levels of interest, and the discriminating evidence is how each responds to better analysis rather than its headline sigma.
```

## Pulling the thread

- Structure is **irreducibly statistical**: the initial conditions were a random field, so only $\xi(r)$ and $P(k)$ were ever predictable, and the field's **Gaussianity** makes the two-point function complete. The primordial tilt $n_s = 0.965$, measurably below 1, is a **confirmed quantitative prediction** of inflation.
- Growth is $\delta \propto a$ in matter domination, suppressed during radiation domination and frozen under $\Lambda$. The **turnover in $P(k)$** near 100 Mpc/h records the horizon at matter–radiation equality — **a feature made by an epoch, not by a place**.
- **Zel'dovich**: collapse is generically anisotropic because three tidal eigenvalues are never equal, so sheets form first, then filaments, then knots. **The web's topology follows from gravity acting on a random field**, and predicts the filament alignments that weak lensing must model as a systematic.
- The **acoustic scale** is derivable in two lines — $r_d \approx 2c_st_{\rm rec}(1+z_{\rm rec}) \approx 147$ Mpc, matching the measured value — giving a **standard ruler whose length is computed rather than calibrated**, and read out by two unrelated techniques at $z\approx1100$ and $z<3$. Detected in 2005 in **46,748** luminous red galaxies.
- **Redshift-space distortions** were converted from systematic to signal: the Kaiser compression measures $f\sigma_8$, and comparing **growth against expansion tests general relativity** — the sharpest large-scale test available.
- **Bias** stands between observation and theory, is degenerate with $\sigma_8$, and is broken by combining probes with different bias dependence — the same structural problem as the virial factor, the mass-loading factor, and hydrostatic bias.
- **Settled**: composition, Gaussian near-scale-invariant initial conditions, gravitational growth, the acoustic ruler. **Live**: $S_8$ at ~1.7σ and narrowing; DESI's preference for evolving dark energy at ~2.3σ and persisting.

The transferable idea, and the one this whole branch has been assembling: **the largest structures are the least complicated, and that is why they measure the most.** A galaxy requires star formation, feedback, mergers, black holes and gas physics — every one of them modelled with calibrated parameters. The distribution of galaxies on scales of a hundred megaparsecs requires gravity and an initial condition. That is why cosmological parameters are known to per-cent precision while the star formation efficiency of a dwarf galaxy is not, and it inverts the intuition that bigger things are harder. **Complexity does not scale with size; it peaks where the most physical processes compete on comparable timescales** — which in this branch was the galaxy, sitting awkwardly between the clean physics of stars below and the clean physics of cosmology above. When choosing where to measure something, the productive question is not where the effect is largest but **where the fewest processes are acting**, because that is where an observation converts into a number with the least in between.

## Further reading

{{book: James Peebles | The Large-Scale Structure of the Universe | 1980}}

{{book: Scott Dodelson | Modern Cosmology | 2020}}

{{book: Malcolm Longair | The Cosmic Century | 2006}}

Beyond the books: Zel'dovich's 1970 paper on the approximation that bears his name is short and shows how much follows from taking anisotropy seriously. Eisenstein and collaborators' 2005 acoustic peak detection is worth reading for the care taken to establish that a few-per-cent bump is real. And the DESI data release papers are a good current example of a field reporting a tantalising result with appropriate restraint about its significance.

## Problems

*Useful numbers: c = 2.998 × 10⁸ m/s; c_s = c/√3 for the photon-baryon fluid; t_rec ≈ 380,000 yr = 1.2 × 10¹³ s; z_rec ≈ 1090; 1 Mpc = 3.086 × 10²² m; measured r_d ≈ 147 Mpc; n_s = 0.965 ± 0.004; z_eq ≈ 3400; δ ∝ a in matter domination; δ_gal = b δ_m; Planck S₈ = 0.830 ± 0.013.*

**1.** *(Why statistics.)* **(a)** Explain why no theory predicts the position of a particular filament. **(b)** State the two standard statistical descriptions and why each is preferred in different contexts. **(c)** Explain why the field's Gaussianity makes the two-point function complete, and what a detection of non-Gaussianity would mean.

**2.** *(The tilt.)* **(a)** State the primordial power spectrum's form and the measured n_s. **(b)** Explain why n_s = 1 would be the "uninteresting" value. **(c)** Explain why the measured deviation is a confirmed prediction rather than a consistency check.

**3.** *(A feature made by an epoch.)* **(a)** Explain why perturbations barely grow during radiation domination. **(b)** Explain how this produces a turnover in P(k) and state the scale. **(c)** Explain in what sense nothing is physically that size.

**4.** *(Zel'dovich.)* **(a)** Explain why collapse is essentially never spherical. **(b)** Give the resulting sequence of morphologies. **(c)** State one observational prediction of this picture and name the survey systematic it corresponds to.

**5.** *(Deriving the ruler.)* **(a)** Compute c_s for the photon-baryon fluid. **(b)** Estimate the comoving sound horizon using r_d ≈ 2c_s t_rec (1 + z_rec) and compare with the measured value. **(c)** Explain where the factor of 2 comes from.

**6.** *(Why the ruler is good.)* **(a)** State what makes a standard ruler useful. **(b)** Explain why the acoustic scale qualifies where cluster sizes do not. **(c)** Explain the significance of the same scale appearing in the CMB and in galaxy clustering.

**7.** *(Distortions as signal.)* **(a)** Describe the two forms of redshift-space distortion and their causes. **(b)** Explain what the Kaiser effect's amplitude measures. **(c)** Explain how combining this with BAO tests general relativity.

**8.** *(Bias.)* **(a)** Explain physically why galaxies cluster more strongly than matter. **(b)** State why bias is problematic and what it is degenerate with. **(c)** Name three ways the degeneracy is broken and state what each contributes.

**9.** *(Closing the branch.)* **(a)** List three settled results and two live tensions with their current significances. **(b)** Explain why cosmological parameters are better determined than a dwarf galaxy's star formation efficiency. **(c)** State the general principle about where complexity peaks, and how it should guide the choice of what to measure.

## Worked answers

**1.** **(a)** Because the initial conditions were a **random field**. Inflation, or whatever set them, predicts an *ensemble* of possible universes with definite statistical properties — amplitude, scale dependence, distribution — but nothing selects the particular realisation we inhabit. A prediction of where a filament lies does not exist to be improved upon; it is not the kind of thing the theory produces. **(b)** The **two-point correlation function** $\xi(r)$, the excess probability over random of finding a pair separated by $r$; and the **power spectrum** $P(k)$, its Fourier transform. $P(k)$ is preferred for theory because Fourier modes evolve independently in linear perturbation theory, so each scale can be treated separately; $\xi(r)$ is often preferred for data because a localised feature such as the acoustic peak appears as a compact bump in $\xi$ while being spread across many modes in $P$. **(c)** For a **Gaussian** random field, all statistical information is contained in the two-point function — every higher-order correlation either vanishes or is determined by it. So measuring $\xi(r)$ or $P(k)$ exhausts the field's content. A detection of **primordial non-Gaussianity** would therefore be a direct window onto the physics generating the fluctuations, since different inflationary mechanisms predict different non-Gaussian signatures; none has been found, which itself constrains the space of models.

**2.** **(a)** $P(k) \propto k^{n_s}$ with $n_s = 0.965 \pm 0.004$. **(b)** Because $n_s = 1$ — exact scale invariance — is what you get when nothing distinguishes one scale from another: fluctuations enter with identical amplitude on every scale, the "no preferred scale" default. It is the round number a theory yields when no dynamics is operating. **(c)** Because inflation predicts a **small departure** from 1, and predicts its sign and rough magnitude: the inflaton field is slowly rolling, so conditions differ slightly as different scales exit the horizon, tilting the spectrum. Measuring $n_s$ several standard deviations below unity therefore confirms a quantitative expectation of the mechanism rather than merely failing to contradict it. Had $n_s$ come out at exactly 1, the observation would have been consistent with inflation but would have carried no information about the dynamics; the deviation is where the content is.

**3.** **(a)** Because during radiation domination the expansion rate is set by the radiation, which is not clustering, and that expansion is fast enough to pull material apart roughly as quickly as gravity can assemble it. A perturbation inside the horizon therefore has its growth nearly stalled — it neither grows appreciably nor decays — until matter comes to dominate. **(b)** A mode's growth history depends on when it **entered the horizon**. Small-scale modes entered early and spent a long interval suppressed; large-scale modes entered near or after matter–radiation equality and grew unimpeded as $\delta\propto a$. The dividing line is the horizon size at equality ($z_{\rm eq}\approx3400$), so $P(k)$ rises with $k$ on large scales, **peaks near 100 Mpc/h**, and falls at smaller scales. **(c)** Because no structure of that size imposes it. The feature is set by a **moment in time** — the transition from radiation to matter domination — which acquires a length only because the horizon had a particular size then. The spatial statistic is carrying the imprint of an epoch, and the same pattern produces the acoustic scale, set by the moment of recombination rather than by anything located 147 Mpc away.

**4.** **(a)** Because collapse is governed by the local **tidal tensor**, whose three eigenvalues set three collapse rates, and exact equality of all three requires precise spherical symmetry — an event of measure zero in a random field. There is essentially always a fastest axis. **(b)** Collapse along the fastest axis first produces a **sheet** (pancake); subsequent collapse along the second axis turns the sheet into a **filament**; collapse along the third produces a **knot**, i.e. a cluster. Regions occupy different stages simultaneously, so all three coexist, connected because they are phases of one process acting on a continuous field, with **voids** as the regions that collapsed along no axis. **(c)** The picture predicts that filaments are **aligned with the surrounding tidal field**, and hence that galaxy shapes and spin axes correlate with the orientation of the filament they inhabit. This is observed, and corresponds to the **intrinsic alignment** systematic in weak lensing surveys — a coherent correlation of galaxy shapes that mimics the lensing shear signal and must be modelled and removed.

**5.** **(a)** $c_s = c/\sqrt3 = 2.998\times10^8/1.732 = \mathbf{1.73\times10^{8}\ m/s}$, about 58 per cent of the speed of light. **(b)** $r_d \approx 2(1.73\times10^{8})(1.2\times10^{13})(1091) = 2 \times 1.73\times10^8 \times 1.31\times10^{16} = 4.53\times10^{24}$ m. Dividing by $3.086\times10^{22}$ m/Mpc gives $\mathbf{147\ Mpc}$ — agreeing with the measured $r_d \approx 147$ Mpc. **(c)** From the integral. The comoving sound horizon is $\int_0^{t_{\rm rec}} c_s\,dt/a(t)$, not simply $c_s t_{\rm rec}/a(t_{\rm rec})$, because the scale factor was smaller at earlier times and so divides the earlier contributions by less. With $a \propto t^{1/2}$, $\int_0^{t}dt'/a(t') = 2t/a(t)$ — the early contributions, made when $a$ was small, effectively double the answer relative to evaluating everything at the final scale factor.

**6.** **(a)** That its **length is known independently** of the measurement it enables. A ruler of unknown length measures nothing; the apparent angular size of an object of known physical size is what converts into a distance. **(b)** The acoustic scale's length is **computed from first principles**: the photon-baryon fluid's sound speed is $c/\sqrt3$ by the physics of a relativistic fluid, the duration is the age at recombination, and the redshift is measured — so 147 Mpc follows without being calibrated against any distance measurement. Cluster sizes have no such derivation: they must be calibrated empirically against distances determined some other way, which makes them a relative rather than absolute ruler, and they evolve with redshift besides. **(c)** It means one physical scale, **laid down once** in the pre-recombination plasma, is read out by two techniques with nothing observationally in common — as an **angular scale** in the CMB acoustic peaks at $z\approx1100$, and as a **length** in the galaxy correlation function at $z < 3$. Their consistency therefore tests the framework rather than assuming it, and because the two measurements sit at opposite ends of cosmic history, the comparison constrains everything that happened in between — which is precisely how BAO measures the expansion history.

**7.** **(a)** **Fingers of God**: inside a virialised cluster, galaxies move randomly at ~1,000 km/s; treating those velocities as distances smears the cluster into a radial spike pointing at the observer. **The Kaiser effect**: on large scales galaxies are still infalling toward overdensities, so near-side galaxies appear to recede faster and far-side galaxies slower than the Hubble flow, **compressing** structures along the line of sight. The first is small-scale and non-linear; the second is large-scale, coherent and opposite in sense. **(b)** The **growth rate of structure**, $f = d\ln\delta/d\ln a$ — since the compression amplitude depends on how fast material is falling in, and that is set by how fast perturbations are growing. What is actually measured is the combination $f\sigma_8$, from the anisotropy of clustering along versus across the line of sight. **(c)** Because general relativity fixes a **definite relation between expansion history and growth rate**: given how fast the universe expands, GR determines how quickly structure assembles. Modified gravity theories are typically constructed to reproduce the observed expansion — that is what makes them viable alternatives to dark energy — but they generically predict a **different growth rate** for that same expansion. Measuring expansion via BAO and growth via redshift-space distortions **in the same survey**, with shared systematics largely cancelling, therefore tests whether one theory accounts for both. It is the sharpest large-scale test of general relativity available.

**8.** **(a)** Galaxies form where the density crosses a threshold for collapse, and small-scale fluctuations ride on top of large-scale ones. In a region with a large-scale overdensity, the local mean is raised, so a **disproportionately large fraction** of the small-scale fluctuations exceed the threshold. Peaks are therefore concentrated where the large-scale field is high, and their distribution is an **amplified** version of the underlying matter pattern. **(b)** Because $b$ depends on galaxy type, mass and redshift, varies with scale, and is **not calculable from first principles**, so it must be measured or marginalised over. Crucially it is **degenerate with $\sigma_8$**: a more strongly biased galaxy sample produces the same observed clustering as a universe with larger fluctuation amplitude, so the two cannot be separated from the galaxy two-point function alone. **(c)** **Redshift-space distortions** measure $f\sigma_8$ with a different dependence on bias, breaking the degeneracy from within the same survey. **Weak gravitational lensing** measures the **matter** field directly, since light is deflected by all mass regardless of whether it emits, providing a bias-free amplitude. **Higher-order clustering statistics** — the bispectrum and beyond — depend on bias through additional parameters in a different combination, so combining them with the two-point function separates bias from amplitude.

**9.** **(a)** *Settled*: the **composition** — ~5% baryons, ~27% dark matter, ~68% dark energy — agreed across CMB, BAO, cluster abundance and lensing; the **Gaussian, nearly scale-invariant, adiabatic** character of the primordial fluctuations; and **gravitational growth** of structure from those fluctuations, verified by detailed agreement between simulations and surveys, with the **acoustic ruler** consistent between $z\approx1100$ and $z<3$. *Live*: the **$S_8$ tension**, with Planck's $0.830\pm0.013$ against weak-lensing values near 0.76–0.78, narrowed to about **1.7σ** in recent joint analyses; and **DESI's preference for evolving dark energy**, with BAO-preferred parameters about **2.3σ** from the CMB under $\Lambda$CDM, persisting from the first data release into the second. **(b)** Because a dwarf galaxy's star formation efficiency depends on star formation, supernova feedback, radiation, mergers, gas cooling and accretion — every one represented by a calibrated sub-grid parameter — while the distribution of galaxies on hundred-megaparsec scales depends on **gravity and an initial condition**, both of which are computable exactly. Fewer processes stand between the observation and the number. **(c)** **Complexity does not scale with size; it peaks where the most processes compete on comparable timescales.** In this branch that was the *galaxy* — sitting between the clean physics of stars below and the clean physics of cosmology above — which is why galaxy formation remains the least predictive part of the subject while cosmology achieves per-cent precision. The guidance follows: when choosing where to measure a quantity, ask not where the effect is largest but **where the fewest processes are acting**, because that is where an observation converts into a number with the least modelling in between.$egLss_master$,
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
