-- Astronomy & Space · The Extragalactic Universe — The Cosmic Web —
-- "The Intergalactic Medium". Curated master for
-- astronomy-and-space/extragalactic/cosmic-web/intergalactic-medium
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node was added to seed.sql in the galaxy-types batch; no taxonomy change here.
--
-- The chapter three earlier ones deferred to: roughly 90% of ordinary
-- matter sits between galaxies rather than in them, so the IGM is the
-- baryon reservoir and everything else is the exception. The Lyman-alpha
-- forest as a core sample read through a quasar; the Gunn-Peterson test
-- worked numerically to show it saturates at x_HI ~ 10^-5, so a trough
-- announces the end of reionization without measuring its course - a
-- lesson about sensitivity and dynamic range being different virtues;
-- reionization's timing from CMB optical depth against quasar absorption;
-- the missing baryon problem and its resolution by fast radio bursts,
-- where dispersion measure counts every free electron along a sightline
-- regardless of temperature, which is exactly what defeated X-ray
-- searches for the WHIM; metal absorbers as the record of galactic winds
-- reaching the IGM; and the forest as a cosmological probe of small-scale
-- power. ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/cosmic-web/intergalactic-medium',
    'research',
    'advanced',
    'read',
    $egIgm_master$> Roughly **90 per cent of ordinary matter is not in galaxies**. It is spread through the space between them as an extremely diffuse, almost entirely ionised plasma — so tenuous that a cubic metre of the densest intergalactic gas holds fewer atoms than the best laboratory vacuum, and so vast that it outweighs every star that has ever formed. Galaxies are the exception; the intergalactic medium is the rule, and studying it requires abandoning emission almost entirely in favour of **absorption**.

Three earlier chapters deferred to this one. Formation & Evolution established that feedback expels most of a galaxy's baryons and asked where they go. Groups & Clusters found metals in the intracluster medium proving galaxies had expelled them. Quasars introduced the sightline as a one-dimensional core sample and handed the technique here. All three converge on the same object.

The organising difficulty is that **the intergalactic medium is essentially invisible in emission.** Emissivity depends on the square of density, so gas at $10^{-6}$ atoms per cubic centimetre radiates at a rate below any plausible detection threshold. A component holding most of the universe's baryons produces almost no light.

Everything in this chapter follows from the workaround: **stop looking for what the gas emits and look at what it removes.** Absorption depends on density to the *first* power, not the square, and — decisively — it depends on the brightness of the *background* source rather than on the gas itself. Put something bright behind a cloud and the cloud becomes measurable no matter how faint it is.

## The forest

Take a quasar spectrum and look blueward of its own Lyman-alpha emission line. Instead of a smooth continuum there is a dense thicket of narrow absorption lines — the **Lyman-alpha forest**.

Each line is a cloud of neutral hydrogen somewhere along the sightline, absorbing at rest wavelength 1216 Å, observed at $1216(1+z_{\rm abs})$ Å for an absorber at redshift $z_{\rm abs}$. Because every absorber sits at a lower redshift than the quasar, every line lies blueward of the quasar's own emission — hence the forest occupies exactly that region and stops abruptly at the quasar's Lyman-alpha.

The structure of this measurement deserves stating plainly, because it is unusual.

**Wavelength maps to distance.** A position in the spectrum corresponds to a redshift, hence to a distance, hence to a cosmic time. Reading the spectrum from red to blue is reading the sightline from near to far, and from late to early.

**Line strength maps to column density.** How much absorption a cloud produces measures how much hydrogen lies along that particular path.

**Line width maps to temperature and turbulence.** Thermal broadening gives the gas temperature; excess width indicates bulk motions.

So a single spectrum yields a **one-dimensional map of gas density, temperature and metallicity as a function of cosmic time** along one line of sight. Collect many sightlines and the three-dimensional structure of the intergalactic medium can be reconstructed tomographically.

And the sensitivity is extraordinary. The forest detects hydrogen column densities down to about $10^{12}$ cm⁻², corresponding to gas at densities near the cosmic mean. **No emission technique comes within many orders of magnitude of this**, and the reason is structural: absorption is measured as a *fraction* of the background source's flux, so the detection limit is set by the brightness of the quasar rather than by the faintness of the gas. Choose a brighter quasar and the same gas becomes easier to see.

The absorbers themselves are classified by column density:

| Class | $N_{\rm HI}$ (cm⁻²) | Nature |
| --- | --- | --- |
| Lyman-alpha forest | $10^{12}$–$10^{17}$ | Diffuse filaments of the cosmic web |
| Lyman limit systems | $10^{17}$–$10^{20.3}$ | Optically thick; galaxy halos |
| Damped Lyman-alpha | $> 10^{20.3}$ | Neutral gas reservoirs; galaxy disks and protogalaxies |

The **damped** systems are worth noting separately: they contain the bulk of the neutral hydrogen at high redshift and are the reservoir from which stars later formed, so they connect this chapter directly to the star-formation history.

```checkpoint
q: The intergalactic medium holds most of the universe's baryons yet is nearly invisible in emission, while being readily detectable in absorption. The structural reason is that
a: absorption lines are intrinsically narrower than emission lines, so they stand out better against noise
x: Line widths are set by the gas's temperature and motions and are the same in either case; the advantage has nothing to do with width.
a*: emissivity scales as density squared while absorption scales as density to the first power — and absorption is measured as a fraction of a bright background source, so the detection limit depends on the quasar's brightness rather than the gas's faintness
a: the gas is too cold to emit but warm enough to absorb
x: Most of the intergalactic medium is hot and ionised, not cold, and temperature is not what separates the two techniques here.
a: emission is blocked by intervening dust while absorption is not
x: The intergalactic medium is essentially dust-free, and dust would affect a background source's light too.
hint: Write down how each signal scales with the number density of atoms, and ask what sets the noise floor in each case.
why: Emission requires two particles to meet, so emissivity goes as n², and at intergalactic densities of ~10⁻⁶ cm⁻³ that is hopeless. Absorption requires only that a photon meet one atom, so it goes as n — already an enormous advantage. The decisive point is different again: an absorption measurement is a *ratio*, the depth of a line relative to the continuum behind it, so sensitivity is set by how bright the background source is. Choosing a more luminous quasar improves the measurement without touching the gas. This is why the forest reaches column densities near the cosmic mean while no emission technique comes close.
---
q: Absorbers are classified by hydrogen column density, from the forest at 10¹²–10¹⁷ cm⁻² up to damped Lyman-alpha systems above 10²⁰·³. What makes the damped systems worth separating out?
a: They are the only absorbers whose redshifts can be measured accurately
x: Redshifts follow from line wavelengths and are measured just as well for weak forest lines; column density has no bearing on redshift precision.
a*: They hold the bulk of the universe's neutral hydrogen at high redshift, so they are the reservoir from which stars later formed — connecting the absorption census directly to the star-formation history
a: They are the only absorbers containing metals, the weaker systems being primordial
x: Metals are detected across the range, including in the diffuse forest at 10⁻³–10⁻² solar; enrichment is not confined to the densest systems.
a: They lie closest to the quasar, so they sample the quasar's own environment
x: Damped systems occur at all redshifts along a sightline and are not preferentially associated with the background quasar.
hint: Follow the hydrogen. Which absorbers hold enough of it to matter for making stars?
why: The column density distribution is steep, so the numerous weak forest lines trace diffuse filaments near the cosmic mean density while contributing little total mass, whereas the rare damped systems — optically thick and self-shielded against the ionising background, hence able to stay neutral — contain most of the neutral hydrogen at high redshift. That makes them the gas reservoir feeding star formation, so measuring their abundance and metallicity across redshift tracks how the fuel supply evolved. The classification is not bookkeeping: each column-density regime corresponds to a physically distinct structure, from cosmic-web filament to galaxy halo to protogalactic disk.
```

## The Gunn-Peterson test, and why it saturates

Before the forest was observed, Gunn and Peterson pointed out what a *uniformly neutral* intergalactic medium would do: absorb **continuously** at every wavelength blueward of the quasar's Lyman-alpha, since at every redshift along the path some hydrogen would be resonant with some wavelength. The result would be a **trough** — complete extinction — rather than discrete lines.

No such trough is seen at low redshift. The forest consists of *discrete* lines with transmitted continuum between them, which means the intergalactic medium is **highly ionised**, with only trace neutral hydrogen concentrated in overdense filaments.

Now the quantitative part, which is where the interesting lesson lives. The Gunn-Peterson optical depth scales as

$$\tau_{\rm GP} \approx 5\times10^{5}\,x_{\rm HI}\left(\frac{1+z}{7}\right)^{3/2}$$

with $x_{\rm HI}$ the neutral fraction. At $z = 6$:

| Neutral fraction | $\tau_{\rm GP}$ | Transmitted flux |
| --- | --- | --- |
| $10^{-6}$ | 0.8 | 45% |
| $10^{-5}$ | 8 | 0.03% |
| $10^{-4}$ | 80 | nil |
| 1 | $8\times10^{5}$ | nil |

**The test saturates almost immediately.** A neutral fraction of one part in $10^5$ already produces complete absorption, indistinguishable from a fully neutral universe.

The consequence is important and frequently glossed over. Observing a Gunn-Peterson trough — as Becker and collaborators did in 2001, in a quasar at $z = 6.28$ where the transmitted flux fell to $0.4$ per cent of the continuum — establishes that the neutral fraction **exceeds about $10^{-5}$**. That is a dramatic result, because it means the intergalactic medium was qualitatively different then from now. But it emphatically does **not** show the universe was substantially neutral: a neutral fraction of $10^{-4}$ and one of 1 produce identical spectra.

**Extreme sensitivity and useful dynamic range are different virtues, and often opposed.** The Gunn-Peterson test is so sensitive to neutral hydrogen that it is useless for measuring how much there is once there is any. It functions as a **threshold detector** — announcing that reionization ended somewhere near $z \approx 6$ — and other probes must supply the neutral fraction: the damping wings of quasar absorption profiles, the statistics of transmission gaps, Lyman-alpha emitter visibility, and eventually 21 cm tomography.

This is a general pattern worth carrying. **An instrument optimised for detection is usually the wrong instrument for measurement**, and the transition point — where sensitivity turns into saturation — is a property of the technique that has to be known before its results can be read.

```checkpoint
q: A quasar at z = 6.28 shows a complete Gunn-Peterson trough, with transmitted flux at 0.4% of the continuum. What does this establish about the neutral hydrogen fraction?
a: That the intergalactic medium was essentially fully neutral at that redshift
x: Far too strong. Neutral fractions of 10⁻⁴ and of 1 produce identical, completely absorbed spectra — the observation cannot distinguish them.
a*: Only that it exceeded roughly 10⁻⁵ — the optical depth saturates at that level, so any larger neutral fraction gives the same complete absorption
a: That it was approximately 0.4%, read directly from the transmitted flux
x: Transmitted flux relates to optical depth exponentially, not linearly, and at these optical depths the residual flux is dominated by noise and by rare transparent patches rather than by the mean neutral fraction.
a: That reionization had not yet begun at z = 6.28
x: Reionization was well advanced by then; the trough marks its final stages, and the same trough would appear whether the process was 99% or 0% complete.
hint: Compute the optical depth for a neutral fraction of 10⁻⁴ and ask what flux gets through.
why: With τ_GP ≈ 5 × 10⁵ x_HI [(1+z)/7]^(3/2), a neutral fraction of just 10⁻⁵ gives τ ≈ 8 and transmission of 0.03 per cent — already complete absorption for practical purposes. Everything above that produces the same spectrum, so the test is a threshold detector rather than a measurement. It establishes that the intergalactic medium at z ≈ 6 was qualitatively unlike today's and that reionization was ending near then, but the neutral fraction itself must come from other probes: damping wings, transmission-gap statistics, Lyman-alpha emitter visibility, and eventually 21 cm tomography. Extreme sensitivity and useful dynamic range are different virtues, and here they are opposed.
---
q: At low redshift the forest consists of discrete absorption lines with transmitted continuum between them, rather than a continuous trough. What does that establish?
a: That intergalactic gas exists only in isolated clouds, with genuinely empty space between them
x: The gas is continuous; what is discrete is the *neutral* hydrogen, concentrated where density is high enough for recombination to compete with ionisation. The space between absorbers is not empty.
a*: That the intergalactic medium is highly ionised, with only trace neutral hydrogen surviving in the overdense filaments — since a uniformly neutral medium would absorb at every wavelength blueward of the quasar's Lyman-alpha
a: That the quasar's own radiation has ionised the gas along our particular sightline
x: A quasar does ionise its immediate surroundings — the proximity effect — but that is local to the quasar, while the transmitted continuum extends across the whole forest region.
a: That the absorbing clouds are moving too fast for their lines to overlap
x: Line positions are set by the absorbers' redshifts, which map to distance; velocities broaden individual lines slightly but do not create the gaps between them.
hint: Ask what a uniform neutral medium would do at every wavelength, and compare with what is seen.
why: In a uniformly neutral medium, some hydrogen at some redshift along the path would be resonant with every wavelength blueward of the quasar's Lyman-alpha, producing continuous absorption — the Gunn-Peterson trough. Seeing transmitted continuum between discrete lines therefore requires the neutral fraction to be far below unity almost everywhere, with residual neutral hydrogen surviving only where the density is high enough that recombination competes with the ionising background: the filaments of the cosmic web. The gas itself is continuous; its neutral component is not. This is the observation that established the intergalactic medium is ionised, and it is why the forest maps the density field rather than merely detecting gas.
```

{{image: Lyman-alpha forest | A quasar spectrum blueward of its own Lyman-alpha emission: a dense thicket of absorption lines, each one a cloud of hydrogen somewhere along the sightline. Wavelength maps to the absorber's redshift and hence to distance and cosmic time, line strength to column density, and line width to temperature — so a single spectrum is a one-dimensional core sample of intergalactic gas ordered by depth.}}

## Reionization

The forest and the Gunn-Peterson trough together frame the universe's last global phase transition.

After recombination at $z \approx 1100$, the universe was neutral and dark. The first stars and galaxies then produced ultraviolet photons that ionised the surrounding hydrogen, carving expanding ionised bubbles that eventually overlapped until the entire intergalactic medium was ionised — the state it remains in today. That is **reionization**.

Two independent measurements bracket it.

**The cosmic microwave background** constrains the *integrated* optical depth to Thomson scattering, since free electrons produced by reionization scatter CMB photons and partially erase small-scale anisotropies while generating large-scale polarisation. Planck measures $\tau = 0.054 \pm 0.007$, corresponding to a **midpoint near $z \approx 8$** — modelling-dependent values sit between about 7.7 and 8.1. This is an integral constraint: it fixes the total column of free electrons but says little about the shape of the history.

**Quasar absorption** constrains the *end*. Gunn-Peterson troughs appear in quasars at $z \gtrsim 6$ and not below, so reionization completed near $z \approx 6$.

Together: reionization was **midway around $z \approx 8$ and complete by $z \approx 6$** — a few hundred million years, ending when the universe was roughly a billion years old.

Two consequences already met in this branch fall out of this.

**Reionization quenched the smallest galaxies.** The Dwarfs chapter established that ultra-faint dwarfs formed 80 per cent of their stars by $z \approx 6$ and stopped — because heating the intergalactic medium to $\sim10^4$ K gave it a sound speed comparable to the escape velocity of the smallest halos, so they could neither retain nor accrete gas. **The same event that made the intergalactic medium transparent made the smallest galaxies sterile.**

**Who did the ionising remains contested.** Star-forming galaxies are the leading candidate, but the accounting requires knowing both how many ionising photons they produced and what fraction **escaped** their host galaxies rather than being absorbed locally — and that escape fraction is measured with difficulty and disputed. Quasars contribute, but their number density falls steeply above $z \approx 3$, so they are generally judged insufficient. This is the same structure as the black hole seed problem: the observation is secure, and the accounting has a poorly measured factor in it.

```checkpoint
q: Planck's measurement of τ = 0.054 constrains reionization, but differently from quasar absorption. The distinction is that
a: the CMB measures reionization directly while quasar absorption is an indirect inference
x: Both are indirect. The CMB measures scattering by free electrons; quasar spectra measure absorption by residual neutral hydrogen. Neither observes the process itself.
a*: the CMB fixes the integrated column of free electrons along the whole path, so it constrains the total but says little about the shape of the history, while quasar troughs pin down when the process ended
a: the CMB constrains the beginning of reionization while quasars constrain the middle
x: The optical depth is an integral over the whole reionization history and does not isolate its beginning; quasar troughs mark the end rather than the middle.
a: the two disagree, and the discrepancy is a live problem in cosmology
x: They are complementary rather than conflicting — a midpoint near z ≈ 8 and completion near z ≈ 6 are consistent with one another.
hint: Thomson optical depth is an integral along the line of sight. What can an integral not tell you?
why: Free electrons scatter CMB photons, so τ counts the total column of them accumulated along the path from last scattering to us. Any reionization history producing that column gives the same τ — an early gradual process and a late abrupt one are degenerate — so the CMB fixes a total, not a shape, giving a midpoint near z ≈ 8 under specific modelling assumptions. Quasar Gunn-Peterson troughs are local in redshift: they appear above z ≈ 6 and not below, marking completion. Combining an integral constraint with an endpoint constraint brackets the history in a way neither does alone, which is the standard way such problems are attacked.
---
q: Star-forming galaxies are the leading candidate for reionizing the universe, but the accounting is not yet closed. The poorly measured factor is
a: the total number of galaxies at z ≈ 8, which deep surveys cannot yet count
x: Deep surveys now reach faint galaxies at these redshifts and the luminosity function is reasonably constrained; extrapolation to the faintest systems adds uncertainty but is not the dominant unknown.
a*: the escape fraction — what proportion of ionising photons produced by young stars actually leaves the host galaxy rather than being absorbed by gas within it
a: the initial mass function, which sets how many ionising photons each galaxy produces
x: The IMF does affect the photon production rate and carries real uncertainty, but it is better constrained than the escape fraction and is not what leaves the budget open.
a: the recombination rate of intergalactic hydrogen, which is unknown at these densities
x: Recombination coefficients are laboratory-known atomic physics; the intergalactic density and clumping carry some uncertainty, but not the dominant one here.
hint: A photon has to get out of the galaxy before it can ionise anything outside it.
why: Producing ionising photons is not enough — they must escape the neutral gas of their own galaxy, and most are absorbed close to where they were made. The escape fraction is therefore the factor converting a well-measured star formation rate into an ionising budget, and it is hard to measure: at the redshifts that matter the escaping photons are themselves absorbed by the intergalactic medium, so it must be inferred from lower-redshift analogues or from indirect indicators. Quasars help but their number density falls steeply above z ≈ 3, leaving them insufficient on their own. The structure mirrors the black-hole seed problem: the observation is secure and the accounting hangs on one badly measured factor, which is what makes it a tractable research programme rather than a mystery.
```

## The missing baryons, and how they were found

Now the chapter's central episode, and one of the more satisfying recent resolutions in astrophysics.

**The problem.** Big Bang nucleosynthesis and the CMB both fix the cosmic baryon density precisely and in agreement. At high redshift, the Lyman-alpha forest accounts for essentially all of it — the forest is dense, the gas is cool enough to retain neutral traces, and the census closes.

At **low** redshift it does not. Adding up stars (~7 per cent of the baryons), interstellar gas (~2 per cent), intracluster gas (~4 per cent), and the detectable intergalactic medium recovered only **60 to 70 per cent** of the known total. Roughly a third of ordinary matter was unaccounted for — not exotic dark matter, but ordinary protons and electrons whose total is known and whose location was not.

**The suspected hiding place.** Simulations predicted that as structure grows, intergalactic gas is shock-heated as it falls into filaments, reaching $10^5$–$10^7$ K — the **warm-hot intergalactic medium**, or WHIM. At those temperatures hydrogen is almost fully ionised, so it produces almost no Lyman-alpha absorption, while being far too diffuse to emit detectably in X-rays. **The gas was predicted to be in a state specifically invisible to both existing techniques.**

That is an uncomfortable position — a theory explaining a missing quantity by placing it where it cannot be seen — and it was properly regarded with suspicion for two decades. Attempts to detect the WHIM through highly ionised metal absorption (O VI, O VII) yielded contested results at the margins of detectability.

**The resolution came from a completely unrelated field.** Fast radio bursts are millisecond radio flashes from cosmological distances. As a burst travels, its radio waves are dispersed by free electrons along the path: lower frequencies arrive later, by an amount proportional to the **dispersion measure**

$$\mathrm{DM} = \int n_e\,dl$$

the total column of free electrons. Measuring the frequency-dependent delay measures that column directly.

**And here is why this defeats the problem.** Dispersion measure counts **every free electron regardless of its temperature, density or ionisation state**. The WHIM was invisible to absorption because it is too ionised and to X-rays because it is too diffuse — but neither objection touches dispersion. The very property that hid the gas from other methods, being fully ionised, is what makes it maximally visible to this one.

Macquart and collaborators, using a small sample of FRBs with identified host galaxies and hence known redshifts, showed that dispersion measure rises with redshift as expected and that the implied baryon density **matches the CMB and nucleosynthesis values**. With of order five to seven well-localised bursts, the missing baryon problem was closed.

Two lessons, both about method.

**The gas was never missing; the instrument was.** Nothing about the universe changed. A quantity known to exist was undetectable because every available technique was blind to the state it was in, and it became detectable when a technique arrived whose sensitivity depended on a different property.

**A "missing" quantity is a claim about instruments, not about nature**, whenever the total is independently known. The productive question was never "where could the baryons have gone?" — they cannot go anywhere — but "**what state would make them invisible to everything we have, and what would see that state?**" Asking it that way makes dispersion measure an obvious answer rather than a lucky one.

```checkpoint
q: The warm-hot intergalactic medium evaded detection for two decades but was found readily by fast radio burst dispersion. Why does dispersion measure succeed where Lyman-alpha absorption and X-ray emission both fail?
a: Because radio waves penetrate the intergalactic medium while ultraviolet and X-rays are absorbed by it
x: The intergalactic medium is transparent to X-rays, and the ultraviolet absorption technique depends on absorption occurring — that is the signal, not an obstacle.
a*: Because dispersion counts every free electron regardless of temperature, density or ionisation state — while Lyman-alpha needs residual *neutral* hydrogen and X-ray emission needs high density, and the WHIM has neither
a: Because fast radio bursts are brighter than quasars, improving the signal-to-noise
x: Brightness helps detect the burst but does not change which gas the measurement is sensitive to; a brighter quasar would not have revealed the WHIM.
a: Because dispersion measure is sensitive only to hot gas, isolating the WHIM from cooler components
x: It is sensitive to all ionised gas at any temperature, which is why it gives a total census rather than isolating one phase — a strength for this problem, but not selectivity.
hint: List what each technique physically requires the gas to have. What does the WHIM lack?
why: Lyman-alpha absorption requires *neutral* hydrogen, and at 10⁵–10⁷ K hydrogen is essentially fully ionised, so the WHIM leaves almost no imprint. X-ray emission requires density, since emissivity goes as n², and the WHIM is far too diffuse. Dispersion requires only free electrons, of which a fully ionised medium has the maximum possible number — so the very property that hid the gas from the other techniques is what makes it maximally visible here. The general lesson: when a total is independently known, a "missing" quantity is a statement about instruments rather than about nature, and the productive question is what state would be invisible to everything available, and what would see that state.
---
q: The missing baryon problem was never a dark matter problem. Why not?
a: Because dark matter had already been fully accounted for by cluster and rotation-curve measurements
x: Dark matter's abundance is well measured, but that is not the reason — the point concerns which component was missing, not how well the other is known.
a*: Because Big Bang nucleosynthesis and the CMB fix the *baryon* density specifically and in agreement, so the missing material was known to be ordinary protons and electrons in a known amount, with only its location unknown
a: Because dark matter cannot be detected at all, so it could not have been counted as missing
x: Dark matter is detected constantly through its gravity; its abundance is measured to a few per cent. It simply was not the component under discussion.
a: Because the missing fraction was too small to be dark matter, which outweighs baryons five to one
x: The relative sizes are true but irrelevant: the two are separately measured components, and a shortfall in one is not a statement about the other.
hint: What exactly do nucleosynthesis and the CMB acoustic peaks measure?
why: Primordial deuterium abundance and the CMB acoustic peak structure both constrain the density of *baryons* — protons and neutrons — and they agree. That fixes the number of ordinary particles that must exist, independently of anything about dark matter, whose abundance is separately measured. So the shortfall concerned particles known to exist in a known quantity, and since baryons are conserved and cannot leave the observable universe, they had to be somewhere detectable in principle. That is what makes the problem an instrumental one and distinguishes it sharply from the dark matter case, where the particle itself is unknown and auditing detectors has not sufficed.
```

{{image: Chronology of the universe | The universe's history from recombination onward. After recombination the gas was neutral and dark; the first stars and galaxies then ionised it during reionization, midway near z ≈ 8 and complete by z ≈ 6, leaving the intergalactic medium in the ionised state it holds today. That transition made the intergalactic medium transparent and, by heating it to ~10⁴ K, simultaneously sterilised the smallest dark-matter halos.}}

## Metals between the galaxies

The forest is not pure hydrogen. Absorption lines of carbon, silicon, oxygen and magnesium appear at the same redshifts as hydrogen absorbers, showing that intergalactic gas is **enriched** — typically to $10^{-3}$ to $10^{-2}$ of solar metallicity in the diffuse forest, higher near galaxies.

That is a substantial fact, because metals are made only in stars, and the diffuse intergalactic medium has never contained a star. **Every metal atom in the forest was manufactured inside a galaxy and then ejected out of it.**

This closes a loop the branch has been building for several chapters. Formation & Evolution required mass loading factors of ten or more in dwarfs to explain why galaxy formation is so inefficient — implying most baryons and their metals leave. Groups & Clusters found the intracluster medium at a third of solar metallicity, proving the metals left cluster galaxies. The forest shows the same process operating in the general field, and further out: enriched gas is detected at distances of hundreds of kiloparsecs from galaxies, well beyond any halo.

The **circumgalactic medium** — the gas within a few hundred kiloparsecs of a galaxy — is the intermediate zone where this is studied best, since a sightline passing near a known galaxy samples material that is demonstrably associated with it. Such measurements find the circumgalactic medium contains **as much or more baryonic mass than the galaxy itself**, in a multiphase mixture of cool clouds embedded in hot gas.

The picture that results is of a galaxy not as a closed object but as a node in a circulation: gas flows in from filaments, forms stars, is expelled by feedback, and a substantial fraction returns later to form more stars. **The "baryon cycle" moves material across a galaxy's boundary many times**, which is why a galaxy's present gas content says so little about its history and why the regulator model of the Formation & Evolution chapter works as well as it does.

## The forest as a cosmological instrument

A final use, which is the reason the forest attracts effort out of proportion to interest in intergalactic gas itself.

The forest traces the **density field** — absorbers are the overdense filaments of the cosmic web — so the statistics of forest absorption measure how matter is clustered, at redshifts of 2 to 4 and on scales far smaller than galaxy surveys reach.

That combination is valuable for a specific reason. Small-scale power is where several physical effects leave their signatures, and where they are otherwise hard to isolate:

- **Massive neutrinos** free-stream out of small-scale perturbations, suppressing power below a scale set by their mass. The forest is among the strongest constraints on the sum of neutrino masses.
- **Warm dark matter** would suppress small-scale structure entirely below a cutoff, so the forest's small-scale power sets a lower bound on the dark matter particle mass — a laboratory-relevant particle physics constraint obtained from hydrogen absorption in quasar spectra.
- **The thermal history** of the intergalactic medium is imprinted in the line widths, since thermal broadening sets a minimum width, providing a record of when and how the gas was heated.

The methodological caution is real, though. Extracting cosmology from the forest requires modelling how the observed absorption relates to the underlying density field, which depends on the ionising background, the gas temperature, and feedback from galaxies — all uncertain. **The measurement is exquisite and its interpretation is model-dependent**, which is a common situation and one worth naming rather than papering over: the error bars quoted on forest-derived parameters are dominated by the modelling, not by the spectra.

```checkpoint
q: The Lyman-alpha forest gives strong constraints on the sum of neutrino masses. The reason it is well suited to this is that
a: neutrinos are absorbed by intergalactic hydrogen, imprinting lines in the spectrum
x: Neutrinos interact far too weakly to be absorbed detectably by any astrophysical gas; their effect is gravitational and statistical.
a*: massive neutrinos free-stream out of small-scale density perturbations and suppress power below a mass-dependent scale, and the forest measures clustering on smaller scales at higher redshift than galaxy surveys reach
a: neutrinos heat the intergalactic medium, broadening the absorption lines measurably
x: Neutrinos deposit no appreciable energy in the gas; the thermal history is set by photoionisation heating from stars and quasars.
a: the forest measures the total baryon density, which is related to neutrino mass by nucleosynthesis
x: Nucleosynthesis relates the baryon density to the number of light neutrino species, not to their masses, and the forest constraint works through structure suppression instead.
hint: Neutrinos are light and fast. What can a fast-moving particle not do to a small perturbation?
why: A massive but light neutrino moves fast enough to stream out of small over-densities before they can grow, so it fails to cluster below a free-streaming scale set by its mass — suppressing the matter power spectrum there while leaving large scales untouched. Detecting that suppression needs a probe of small-scale clustering, and the forest supplies one at z ≈ 2–4, on scales below what galaxy surveys resolve and at epochs when the structure is more linear and easier to model. The same sensitivity bounds warm dark matter, since a warm particle would cut off small-scale power entirely. The caution is that converting absorption statistics into a density field requires modelling the ionising background, gas temperature and feedback, so the quoted uncertainties are dominated by that modelling rather than by the spectra.
---
q: Forest-derived cosmological constraints have uncertainties dominated by modelling rather than by the spectra. Why does knowing this change how the results should be read?
a: It means the results are unreliable and should be given less weight than galaxy survey constraints
x: Too strong. Model-dominated uncertainties are still quantified and the constraints remain among the best available on small-scale power; the point is how they behave, not that they are worthless.
a*: Because a model-dominated error will not shrink with more data, and because separate forest constraints share the same assumptions and so are correlated rather than independent
a: Because it means the quoted error bars are underestimates that should be inflated by a fixed factor
x: Careful analyses already propagate modelling uncertainty into the quoted intervals; the issue is the error's behaviour and correlation structure, not a missing multiplier.
a: Because modelling uncertainty affects only the central value, not the width of the interval
x: It affects both, and in forest analyses it is the dominant contributor to the width — which is precisely the point.
hint: Ask what happens to each kind of uncertainty when you double the number of spectra.
why: A statistical error falls as more spectra are collected; a systematic rooted in how absorption is converted into a density field does not, because every spectrum is processed through the same assumptions about the ionising background, the gas thermal history and galactic feedback. So a reader expecting more data to sharpen the constraint will be disappointed, and — more importantly — two forest results are not independent measurements to be combined as though they were, since they share the modelling. This is the same structure as the cluster mass calibration limiting cluster counts: in both cases the informative next step is improving the model or finding an independent cross-check, not accumulating more of the same observation.
```

## Pulling the thread

- **~90 per cent of baryons are between galaxies**, in gas so diffuse it is effectively invisible in emission — because emissivity goes as $n^2$. **Absorption** goes as $n$ and is measured as a *fraction of a bright background*, so its sensitivity is set by the quasar rather than by the gas.
- The **Lyman-alpha forest** turns one spectrum into a **one-dimensional core sample**: wavelength → redshift → distance and time; line strength → column density; line width → temperature. It reaches $N_{\rm HI} \sim 10^{12}$ cm⁻², near the cosmic mean density.
- The **Gunn-Peterson** optical depth, $\tau \approx 5\times10^5\,x_{\rm HI}[(1+z)/7]^{3/2}$, **saturates at $x_{\rm HI}\sim10^{-5}$** — so a trough shows only that the neutral fraction exceeds one part in $10^5$. **Extreme sensitivity and useful dynamic range are opposed virtues**, and the technique is a threshold detector, not a measurement.
- **Reionization** was midway near $z\approx8$ (Planck $\tau = 0.054$, an *integral* constraint) and complete by $z\approx6$ (quasar troughs, an *endpoint* constraint). It also **sterilised the smallest halos** — the same event, two consequences.
- The **missing baryon problem** — only 60–70 per cent recoverable at low $z$ — was closed by **fast radio burst dispersion**, which counts free electrons irrespective of temperature or density. **The property that hid the WHIM from absorption and X-rays is what makes it maximally visible to dispersion.**
- Forest **metals** at $10^{-3}$–$10^{-2}$ solar prove galaxies ejected their products into gas that never held a star, and the **circumgalactic medium** holds as much baryonic mass as the galaxy inside it — a **baryon cycle**, not a one-way loss.
- The forest constrains **small-scale power**, bounding **neutrino masses** and **warm dark matter** — with uncertainties dominated by modelling rather than by the spectra.

The transferable idea: **when a total is known and the parts cannot be found, the problem is the instrument.** The baryons could not have gone anywhere — nucleosynthesis and the CMB fixed their number, and protons do not vanish — so "missing baryons" was never a statement about the universe. It was a statement about the joint blind spot of every available technique, and the productive move was to characterise that blind spot precisely: what state is simultaneously too ionised for absorption and too diffuse for emission? Once posed that way, the answer names its own detector, because *fully ionised* is exactly the condition that maximises a dispersion signal. The pattern recurs wherever a conserved quantity fails to balance: audit the detectors before revising the physics, and describe the hiding place in terms of the properties that would make it invisible, since that description usually specifies the instrument that would find it.

## Further reading

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Abraham Loeb | The First Galaxies in the Universe | 2013}}

{{book: James Peebles | Principles of Physical Cosmology | 1993}}

Beyond the books: Gunn and Peterson's 1965 paper is barely two pages and predicted a trough that took thirty-six years to observe — worth reading for how cleanly a null result can be turned into a constraint. Becker and collaborators' 2001 detection is the other half of that story. And the Macquart 2020 fast radio burst result is unusually satisfying to read alongside the two decades of WHIM searches it superseded, as a case of a problem dissolving when a new observable arrives rather than when a new idea does.

## Problems

*Useful numbers: τ_GP ≈ 5 × 10⁵ x_HI [(1+z)/7]^(3/2); transmitted flux = e^(−τ); Lyman-alpha rest wavelength 1216 Å; DM = ∫ n_e dl, with DM_IGM ≈ 855 z pc cm⁻³ at low z; Planck τ_Thomson = 0.054 ± 0.007; low-z baryon census before FRBs: stars ~7%, ISM ~2%, ICM ~4%, detected IGM ~30%; forest metallicity 10⁻³–10⁻² Z☉; ICM metallicity ~⅓ Z☉.*

**1.** *(Why absorption.)* **(a)** State how emissivity and absorption each scale with gas density. **(b)** Explain why absorption's sensitivity depends on the background source rather than the gas. **(c)** State the consequence for what column densities the forest can reach.

**2.** *(Reading a forest.)* An absorption line appears at 4864 Å in a quasar spectrum. **(a)** Compute the absorber's redshift, assuming Lyman-alpha. **(b)** State what the line's depth and width each measure. **(c)** Explain why every forest line lies blueward of the quasar's own Lyman-alpha emission.

**3.** *(Saturation.)* **(a)** Compute τ_GP at z = 6 for x_HI = 10⁻⁶, 10⁻⁵ and 10⁻⁴. **(b)** Compute the transmitted flux fraction in each case. **(c)** State what a Gunn-Peterson trough does and does not establish, and name two probes that supply what it cannot.

**4.** *(Bracketing reionization.)* **(a)** State what Planck's τ measures and why it constrains a total rather than a history. **(b)** State what quasar troughs constrain. **(c)** Give the resulting bracket and one consequence for galaxies established elsewhere in this tree.

**5.** *(The census.)* **(a)** Sum the low-redshift baryon components listed above and state the shortfall. **(b)** State why this was not a dark matter problem. **(c)** State the predicted hiding place and why it was properly regarded with suspicion.

**6.** *(Dispersion.)* **(a)** State what dispersion measure counts and how it is measured. **(b)** Explain why the WHIM's temperature defeats Lyman-alpha absorption but not dispersion. **(c)** Explain why its density defeats X-ray emission but not dispersion.

**7.** *(Metals outside galaxies.)* **(a)** State the forest's typical metallicity. **(b)** Explain what its mere presence establishes, given where metals are made. **(c)** Connect this to two earlier results in this tree and state what the circumgalactic medium adds.

**8.** *(The forest as a probe.)* **(a)** Explain how massive neutrinos suppress small-scale power. **(b)** Explain why the forest is well suited to detecting that suppression. **(c)** State the dominant source of uncertainty in forest-derived cosmological parameters, and why naming it matters.

**9.** *(Auditing the instrument.)* **(a)** Explain why "missing baryons" was necessarily a statement about instruments rather than about nature. **(b)** Restate the problem as a question about states rather than locations, and show that this specifies the detector. **(c)** Give one other place in this tree where the same move applies.

## Worked answers

**1.** **(a)** **Emissivity scales as $n^2$**, since radiation requires two particles to interact — an electron and an ion for bremsstrahlung, or collisional excitation followed by emission. **Absorption scales as $n$**, since a photon need meet only a single atom. **(b)** Because an absorption measurement is a **ratio**: the depth of a line relative to the continuum behind it. The observable is the fraction of the background source's flux removed, so the achievable signal-to-noise is set by how many photons the *background* delivers. Choosing a brighter quasar improves the measurement without any change in the gas. Emission has no such lever — the gas is the source, and if it is faint there is nothing to do about it. **(c)** The forest reaches hydrogen column densities of about $\mathbf{10^{12}\ cm^{-2}}$, corresponding to gas near the **cosmic mean density** — many orders of magnitude fainter than any emission technique can reach, which is why the intergalactic medium is studied almost entirely in absorption.

**2.** **(a)** $1 + z = \lambda_{\rm obs}/\lambda_{\rm rest} = 4864/1216 = 4.0$, so $z = \mathbf{3.0}$. **(b)** **Depth** (more precisely, equivalent width) measures the **column density** of neutral hydrogen along that sightline through the absorber. **Width** measures **temperature and bulk motion**: thermal broadening sets a minimum width from the gas's temperature, and any excess indicates turbulence or bulk flows. **(c)** Because an absorber must lie **between us and the quasar**, so its redshift is lower than the quasar's, so its observed Lyman-alpha wavelength $1216(1+z_{\rm abs})$ is **shorter** than the quasar's own $1216(1+z_{\rm QSO})$. Every absorber therefore contributes a line blueward of the quasar's emission line, and the forest terminates abruptly at that wavelength — which is why the forest's red edge identifies the quasar's redshift.

**3.** **(a)** At $z = 6$, $[(1+z)/7]^{3/2} = 1^{3/2} = 1$, so $\tau_{\rm GP} \approx 5\times10^5 x_{\rm HI}$: for $10^{-6}$, $\tau = \mathbf{0.5}$; for $10^{-5}$, $\tau = \mathbf{5}$; for $10^{-4}$, $\tau = \mathbf{50}$. **(b)** Transmitted fraction $e^{-\tau}$: $e^{-0.5} = \mathbf{61\%}$; $e^{-5} = \mathbf{0.67\%}$; $e^{-50} = \mathbf{2\times10^{-22}}$, i.e. nothing. **(c)** A trough establishes that the neutral fraction **exceeds roughly $10^{-5}$**, meaning the intergalactic medium at that epoch was qualitatively unlike the present one and that reionization was ending nearby in redshift. It does **not** establish that the universe was substantially neutral, because every neutral fraction above $\sim10^{-4}$ produces an identical, completely black spectrum. Probes that supply what it cannot: the **damping wings** of the Lyman-alpha absorption profile against high-redshift quasars, which remain sensitive at high neutral fractions; the **statistics of transmission gaps and spikes**, which measure the patchiness of the remaining neutral regions; the **visibility of Lyman-alpha emitting galaxies**, which is suppressed by neutral gas; and eventually **21 cm tomography**, which measures neutral hydrogen directly.

**4.** **(a)** Planck measures the **Thomson optical depth to the last scattering surface** — the integrated column of free electrons produced by reionization, which scatter CMB photons, damping small-scale anisotropies and generating large-scale polarisation. It constrains a total rather than a history because any reionization history yielding the same electron column gives the same $\tau$: an early gradual process and a late abrupt one are degenerate. **(b)** Quasar Gunn-Peterson troughs constrain the **endpoint**: they appear above $z\approx6$ and not below, so reionization completed near then. **(c)** Reionization was **midway near $z\approx8$ and complete by $z\approx6$** — a few hundred million years, ending when the universe was roughly a billion years old. *Consequence*: the same heating that ionised the intergalactic medium raised its temperature to $\sim10^4$ K, giving it a sound speed comparable to the escape velocity of the smallest dark-matter halos, which could then neither retain nor accrete gas. That is why **ultra-faint dwarfs formed ~80 per cent of their stars by $z\approx6$ and then stopped**, as the Dwarfs chapter established — one event with two consequences.

**5.** **(a)** Stars 7% + ISM 2% + ICM 4% + detected IGM ~30% $\approx$ **43%** by that accounting, and even the most generous low-redshift censuses recovered only **60–70%** of the known baryon density — a shortfall of roughly **one third**. **(b)** Because the **total was independently and precisely known** from two agreeing measurements — Big Bang nucleosynthesis, via the primordial deuterium abundance, and the CMB acoustic peaks — and both refer specifically to **baryons**, not to total matter. The missing material was therefore ordinary protons and electrons whose number was certain and whose location was not; dark matter is a separate component, separately accounted for, and its abundance was never in question here. **(c)** The **warm-hot intergalactic medium**: gas shock-heated to $10^5$–$10^7$ K as it fell into growing filaments. The suspicion was warranted because the proposal explained a missing quantity by placing it in **precisely the state that is invisible to every available technique** — too ionised to absorb in Lyman-alpha, too diffuse to emit detectably in X-rays. A hypothesis that locates something where it cannot be checked is unfalsifiable until an instrument appears that can check it, and marginal detections through highly ionised metal lines did not settle matters.

**6.** **(a)** Dispersion measure is the **integrated column of free electrons**, $\mathrm{DM} = \int n_e\,dl$. It is measured from the **frequency-dependent arrival delay** of a broadband radio pulse: lower frequencies are retarded relative to higher ones by an amount proportional to DM, so timing the sweep of a millisecond burst across a receiver band measures the electron column along its path. **(b)** Lyman-alpha absorption requires **neutral** hydrogen, and at $10^5$–$10^7$ K hydrogen is essentially fully ionised, so the WHIM produces almost no Lyman-alpha signal. Dispersion requires **free electrons**, and full ionisation maximises their number — so the same temperature that erases the absorption signal maximises the dispersion signal. **(c)** X-ray emission scales as $n^2$, so gas at intergalactic densities emits far below detection thresholds regardless of temperature. Dispersion scales as $n$ to the first power and is an **integral along a very long path**, so a low density is compensated by an enormous path length. Neither of the two properties that hid the gas — high ionisation and low density — impairs the dispersion measurement, and one of them actively helps it.

**7.** **(a)** Roughly $10^{-3}$ to $10^{-2}$ of solar metallicity in the diffuse forest, rising nearer galaxies. **(b)** Metals are synthesised **only in stars**, and the diffuse intergalactic medium has never contained one. Every metal atom detected in the forest was therefore **manufactured inside a galaxy and subsequently ejected from it** — direct evidence that galactic outflows reach far beyond their hosts, since enriched gas is found hundreds of kiloparsecs from any galaxy. **(c)** It closes a loop with the **Formation & Evolution** chapter, which required mass loading factors of ten or more in dwarfs to explain the inefficiency of galaxy formation and thus predicted that most baryons and their metals leave; and with the **Groups & Clusters** chapter, where the intracluster medium at a third solar metallicity showed the same process in cluster environments. The **circumgalactic medium** adds the intermediate zone and a quantitative surprise: it contains **as much or more baryonic mass than the galaxy inside it**, in a multiphase mixture — showing that expelled gas largely remains bound and returns, so the baryon budget describes a **cycle** rather than a one-way loss. That is why a galaxy's current gas content reveals so little about its history, and why the regulator model works.

**8.** **(a)** Neutrinos have small masses and correspondingly high thermal velocities, so they **free-stream** out of density perturbations smaller than a characteristic scale before those perturbations can grow. Below that free-streaming scale — which depends on the neutrino mass — they do not cluster, so they contribute their mass to the mean density while contributing nothing to the fluctuations, suppressing the matter power spectrum there while leaving larger scales unaffected. **(b)** Because detecting the suppression requires measuring clustering on **small scales**, and the forest probes scales well below what galaxy redshift surveys resolve. It also works at $z \approx 2$–4, where the density field is closer to linear and therefore easier to model than at low redshift, and where the forest is dense enough to sample many independent modes along each sightline. **(c)** The dominant uncertainty is **modelling**: converting observed absorption statistics into the underlying density field requires assumptions about the ionising background, the gas temperature and its history, and feedback from galaxies. Naming it matters because a reader who assumes the quoted error bar is statistical will misjudge how the result should respond to new spectra — more data will not shrink it — and will also misjudge how strongly correlated forest-derived constraints are with one another, since they share the same modelling assumptions rather than being independent.

**9.** **(a)** Because the **total was fixed independently** by Big Bang nucleosynthesis and the CMB, and baryons are **conserved** — protons do not decay on relevant timescales and cannot leave the observable universe. A quantity that certainly exists in a known amount cannot be missing from nature; it can only be missing from the census. The failure was therefore necessarily in the detection, not in the physics. **(b)** Restated: *what physical state would make baryons simultaneously invisible to Lyman-alpha absorption and to X-ray emission?* Absorption needs neutral atoms, so the state must be **highly ionised**; X-ray emission needs $n^2$, so it must be **very diffuse**. That description immediately specifies the detector, because "highly ionised" means a **maximum density of free electrons**, and any observable proportional to the free-electron column will see this gas better than any other — which is exactly what a dispersion measure is. Posing the question in terms of states rather than locations turns the answer from a lucky accident into a derivation. **(c)** The **dark matter** case, with the opposite outcome: there too a quantity is inferred from a total that must balance, and the productive question is what state would make it invisible to every electromagnetic probe. The difference is that for baryons the total was known *and* the particles were known, so only the instrument was missing; for dark matter the particle itself is unknown, which is why auditing detectors has not sufficed. Comparing the two shows precisely when "audit the instrument before revising the physics" applies and when it does not.$egIgm_master$,
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
