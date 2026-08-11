-- Astronomy & Space · The Dark Universe — Inflation — "Cosmic Inflation".
-- Curated master for
-- astronomy-and-space/dark-universe/inflation/cosmic-inflation
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the Inflation block. Organised around the distinction between a
-- framework and a theory: inflation's generic predictions are confirmed
-- and its specific realisation is unknown, which is a stronger position
-- than critics allow and a weaker one than advocates imply. The three
-- problems worked quantitatively - the horizon problem at ~10^4
-- causally disconnected patches on the sky, the flatness problem at
-- |Omega-1| < 1e-60 at the Planck time, the monopole problem; how 60
-- e-folds fixes all three at once; slow roll and why the potential must
-- be flat; the five generic predictions and their status; and the
-- Steinhardt-Ijjas-Loeb critique on the measure problem taken
-- seriously rather than dismissed.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/inflation/cosmic-inflation',
    'research',
    'advanced',
    'read',
    $duInfl_master$> Inflation was invented to solve three problems that were not, strictly speaking, problems. Nothing in the Big Bang model is *inconsistent* with a flat universe, a uniform sky, or an absence of magnetic monopoles. Each simply requires the initial conditions to have been chosen with a precision that has no explanation — in the flatness case, **to better than one part in $10^{60}$**.

That is the peculiar character of the whole subject. **Inflation does not fix a contradiction; it converts a set of improbable initial conditions into a generic outcome.** Whether that counts as an explanation is a real question, and the field disagrees about it more than popular accounts suggest.

This chapter sets out the three problems quantitatively, the mechanism, what has been confirmed, and the most serious criticism — which comes from one of inflation's originators.

## Three fine-tunings

### The horizon problem

Take two patches of sky separated by more than a couple of degrees. Their light left the last-scattering surface 13.8 billion years ago, arriving from opposite directions, and their temperatures agree to one part in $10^{5}$.

Now ask whether they could have equilibrated. The comoving particle horizon at recombination — the furthest anything could have influenced since $t = 0$ — is

$$\eta_{\rm rec} = 281\ \mathrm{Mpc},$$

and the comoving distance to last scattering is 13,870 Mpc. So a causally connected patch subtends

$$\theta = \frac{281}{13870} = 0.0203\ \mathrm{rad} = 1.16°.$$

Dividing the sky into patches of that size gives

$$N = \frac{4\pi}{\pi\theta^2} \approx 9{,}800,$$

about **ten thousand causally disconnected regions**, no two of which had ever exchanged so much as a photon — and all at the same temperature to five decimal places.

**This is not a paradox; it is a fine-tuning.** One may simply posit that the universe began uniform. But "it started that way" explains a ten-thousand-fold coincidence by assertion, and the discomfort is legitimate.

### The flatness problem

The deviation from flatness evolves. Writing $\Omega - 1 = kc^2/(a^2H^2)$, and noting that $a^2H^2 = \dot a^2$ decreases whenever the expansion decelerates, it follows that

$$|\Omega - 1| \propto a^2 \ \text{(radiation era)}, \qquad \propto a \ \text{(matter era)}.$$

**Flatness is unstable.** Any deviation grows, so $\Omega = 1$ is a repeller, not an attractor — the universe runs away from flatness unless it started extraordinarily close to it.

Run the observed $|\Omega_k| < 0.002$ backwards. The scale factor has grown by roughly $T_{\rm Planck}/T_0 = 5.2\times10^{31}$ since the Planck time, so

$$|\Omega - 1|_{\rm Planck} \lesssim \frac{0.002}{(5.2\times10^{31})^2} \sim 10^{-66},$$

and allowing properly for the matter and dark-energy eras softens this to something of order $10^{-60}$. Either way: **the initial density had to equal the critical density to sixty decimal places.**

### The monopole problem

Grand unified theories predict that symmetry breaking in the early universe produces topological defects, including magnetic monopoles, at roughly one per horizon volume at the transition. Their predicted abundance exceeds observation by many orders of magnitude — the universe would be monopole-dominated. **None has ever been detected.**

This one is conditional on grand unification being correct, which is itself unestablished, so it is the weakest of the three. It is worth recording that **it was the problem Guth was actually working on** when inflation occurred to him; the horizon and flatness solutions were noticed afterwards.

```checkpoint
q: About $10^{4}$ regions of the CMB sky were never in causal contact, yet agree in temperature to one part in $10^{5}$. Why is this called a problem rather than a contradiction?
a: Because the regions were in fact in contact, through a mechanism not yet identified
x: Under standard expansion they demonstrably were not; that is the content of the horizon calculation.
a*: Because nothing forbids the universe from having begun uniform — the difficulty is that this explains a ten-thousand-fold coincidence by assertion rather than by mechanism
a: Because the temperature agreement is only to $10^{-5}$, which is loose enough that chance could account for it
x: Agreement to one part in $10^{5}$ across $10^{4}$ independent regions is not something chance produces.
a: Because the CMB measurement has systematic uncertainties that could hide real temperature differences
x: The measurement is far more precise than the agreement being discussed; systematics are not at issue.
hint: Ask what would have to be assumed, rather than derived, to leave the observation unexplained.
why: The comoving particle horizon at recombination is 281 Mpc against a distance to last scattering of 13,870 Mpc, so a causally connected patch subtends 1.16° and the sky contains about 9,800 such patches. Under standard expansion these never exchanged any signal. Nothing in the Big Bang model forbids them from having begun at identical temperature — the equations accept whatever initial conditions are supplied. What is unsatisfying is that the uniformity must then be *assumed* rather than produced, and assumed to hold across $10^{4}$ regions with no common cause. Inflation's claim is not that the alternative is inconsistent but that it converts an improbable initial condition into a generic outcome, which is a different and more debatable kind of achievement.
---
q: Inflation converts improbable initial conditions into generic outcomes, but requires a flat potential and a smooth starting patch. What is the right way to assess that?
a: As a failure — a theory that requires its own fine-tuning has explained nothing
x: The relocated tuning is smaller and less specific than the original, which is genuine progress even if incomplete.
a*: By auditing where the improbability went: it was relocated rather than destroyed, but to something smaller and less specific — a Hubble-volume patch and a potential shape rather than a whole smooth flat universe
a: As a success — the original problems are solved, and the new requirements are technical details
x: A potential flat in Planck units is not a technical detail; quantum corrections generically spoil it, and protecting it requires additional structure.
a: As irrelevant, since only the observational predictions matter and those are confirmed
x: Whether the explanation explains is the whole question here; the confirmed predictions are compatible with several frameworks.
hint: Compare the size and specificity of what must be assumed before and after.
why: Before inflation, one had to assume a universe uniform across $10^{4}$ causally disconnected regions, flat to sixty decimal places, and free of monopoles. After inflation, one must assume a patch smooth over roughly one Hubble volume with the field suitably placed, and a potential flat in Planck units that quantum corrections do not spoil. The second set is genuinely smaller and less specific than the first, which is real progress — but it is not nothing, and calling the problem solved overstates it. The general discipline is to follow the improbability rather than accept that it has vanished: ask what must now be assumed, how specific it is, and whether it is smaller than what was assumed before. Applied here the honest verdict is a substantial reduction, not an elimination, which is a more useful conclusion than either "solved" or "failed".
```

## What inflation does

The mechanism is a period of accelerated expansion in the very early universe — $\ddot a > 0$, which by the previous chapter's argument requires $\rho + 3p/c^2 < 0$, hence strongly negative pressure. A scalar field whose potential energy dominates its kinetic energy supplies exactly that.

If the expansion is close to exponential, $a \propto e^{Ht}$ with $H$ nearly constant, the growth over an interval is measured in **e-folds**:

$$N = \ln\frac{a_{\rm end}}{a_{\rm start}}.$$

**Sixty e-folds suffices**, and it solves all three problems simultaneously — which is the feature that made the idea persuasive rather than merely available.

**Horizon.** Before inflation, the region that became our observable universe was small enough to be causally connected and to equilibrate. Inflation then stretched it beyond the horizon. **The uniformity is not imposed; it is inherited from a patch that was once in contact.**

**Flatness.** $|\Omega - 1| \propto 1/(aH)^2$, and during inflation $H$ is nearly constant while $a$ grows by $e^{60} \approx 10^{26}$. So $|\Omega - 1|$ is suppressed by $10^{52}$. **Any initial curvature is flattened**, exactly as any curved surface looks flat when magnified enormously. Flatness becomes an attractor rather than a repeller.

**Monopoles.** Defects produced before inflation are diluted by $e^{3N} \approx 10^{78}$ in number density — reduced to well under one in the observable universe. **The problem is solved by dilution rather than by suppression of production.**

One mechanism, three problems, no additional parameters tuned for each. **That is what a good explanation looks like**, and it is why inflation was adopted rapidly despite having no direct evidence for two decades.

The requirement for $N \gtrsim 60$ is worth understanding rather than memorising: it is set by the ratio between the size of the observable universe today and the horizon size at the end of inflation, transported back. Different inflation scales change the number somewhat — a lower energy scale needs fewer e-folds — but 50 to 60 is the standard range.

```checkpoint
q: Why does inflation solve the flatness problem, when ordinary expansion makes flatness worse?
a: Because inflation adds energy density until the total reaches critical
x: Inflation does not add density to reach a target; it drives the geometry toward flatness regardless of the starting density.
a*: Because $|\Omega - 1| \propto 1/(aH)^2$, and during inflation $H$ is nearly constant while $a$ grows by $e^{60} \approx 10^{26}$ — suppressing any initial curvature by $10^{52}$ and turning flatness from a repeller into an attractor
a: Because inflation occurs before the radiation era, when the flatness instability had not yet begun
x: The instability operates whenever expansion decelerates; inflation works by accelerating, not by preceding the problem.
a: Because the rapid expansion prevents curvature from having time to grow
x: It is not a matter of insufficient time — the mechanism is the growth of $aH$, which actively suppresses the deviation.
hint: Write $|\Omega - 1| = kc^2/(aH)^2$ and ask what happens to $aH$ during accelerated expansion.
why: The deviation from flatness is $|\Omega - 1| = kc^2/(a^2H^2) = kc^2/\dot a^2$, so it grows whenever $\dot a$ decreases — that is, during any decelerating phase, which is why $\Omega = 1$ is unstable in the standard model and requires tuning to $10^{-60}$ at the Planck time. During inflation the expansion accelerates, so $\dot a = aH$ grows, and with $H$ nearly constant $a$ increases by $e^{60} \approx 10^{26}$, suppressing $|\Omega - 1|$ by $10^{52}$. Any initial curvature is driven toward zero, exactly as any smooth surface looks flat when magnified enough. The same growth of $aH$ solves the horizon problem, by placing our whole observable region inside a formerly causally connected patch, and dilutes monopoles by $e^{3N} \approx 10^{78}$ — one mechanism, three problems, which is why inflation was adopted so quickly.
---
q: Observations constrain roughly 7.6 e-folds of an inflationary epoch lasting at least 60. What follows for how the confirmations should be weighted?
a: Nothing — the confirmed predictions are generic to inflation, so they test the whole epoch
x: They test the epoch during which the observed scales exited the horizon, which is a small window; the rest generates no observable.
a*: That the potential is measured only over the field range corresponding to that window, so many models agreeing there and differing elsewhere are indistinguishable — the framework is tested over about 13% of its duration
a: That the remaining e-folds are unconstrained but also irrelevant, since they leave no trace
x: They do leave traces at smaller scales — primordial black hole abundance and CMB spectral distortions probe them — which is precisely why those constraints matter.
a: That inflation cannot be tested at all, since most of it is unobservable
x: The observed window yields genuine tests, including the $8.4\sigma$ tilt and the super-horizon TE anticorrelation; limited coverage is not zero coverage.
hint: Ask which scales the CMB and galaxy surveys actually cover, and how that range translates into e-folds.
why: The CMB and large-scale structure together probe comoving wavenumbers from about $10^{-4}$ to $0.2$ Mpc⁻¹, a range of 3.3 decades or $\ln(2000) = 7.6$ e-folds — about 13% of a 60 e-fold epoch. Within that window the data constrain $V$, $V'$ and $V''$; outside it, nothing does. Models that agree over the observed stretch and differ elsewhere are observationally identical, so the data select a class of behaviours rather than a model, and "favoured potential" usually means "lies in the allowed region of the $n_s$–$r$ plane", which many do. Constraints from primordial black hole formation and from CMB $\mu$-distortions matter precisely because they reach smaller scales — $\mu$-distortions probe $k$ up to $10^{4}$ Mpc⁻¹, five orders beyond the CMB. None of this argues against inflation; it describes what any observation of it can achieve, and it bears directly on the predictivity debate.
---
q: $\Omega_k = 0.001 \pm 0.002$ confirms inflation's prediction of spatial flatness. How much evidential weight should that carry?
a: Substantial — it is a quantitative prediction confirmed to high precision
x: Precision is not the issue; the question is whether any competing account predicted otherwise.
a*: Little as a test, because a flat universe is entirely possible without inflation given the right initial conditions — which is the very fine-tuning at issue, so the measurement is consistency rather than discrimination
a: None, since flatness was assumed in the analysis that produced the number
x: Curvature is a free parameter in the fit and could have come out non-zero; the measurement is genuine.
a: Substantial, because no alternative framework predicts flatness
x: Ekpyrotic and cyclic models also produce flatness, so it does not discriminate between frameworks either.
hint: Ask what a universe without inflation would have looked like, and whether that was ever excluded.
why: A measurement tests a theory only to the extent that some rival predicted something different. Flatness is what inflation produces generically — but it is also what the standard Big Bang produces if the initial density happened to equal the critical density, which is exactly the fine-tuning inflation was proposed to remove. So observing $\Omega_k \approx 0$ is consistent with inflation while being equally consistent with tuned initial data, and ekpyrotic models predict it too. The measurement would have been damaging had it come out otherwise, which gives it some value, but confirming it discriminates against nothing. Contrast the super-horizon TE anticorrelation at $\ell \approx 30$–150, which no causal mechanism acting after inflation can produce — that is a test, and it is why the two confirmations should not be weighted equally despite both being described as "confirmed".
```

{{image: Inflation (cosmology) | The scale factor's history with and without an inflationary epoch. A brief interval of accelerated expansion around $10^{-34}$ seconds increases the scale factor by a factor of order $10^{26}$, which simultaneously places the whole observable universe inside a formerly causally connected patch, suppresses any initial spatial curvature by $10^{52}$, and dilutes topological defects by $10^{78}$. One mechanism addressing three separate fine-tunings, with no parameter adjusted for each, is what made the proposal persuasive well before any evidence for it existed.}}

## Slow roll, and why the potential must be flat

To sustain sixty e-folds, the field must roll slowly — its kinetic energy must stay small compared with its potential energy, so that the equation of state stays near $w = -1$ for long enough.

That requirement is expressed through two **slow-roll parameters**, which measure the steepness and curvature of the potential:

$$\epsilon = \frac{M_{\rm Pl}^2}{2}\left(\frac{V'}{V}\right)^2, \qquad \eta = M_{\rm Pl}^2\,\frac{V''}{V}.$$

Inflation requires $\epsilon \ll 1$ and $|\eta| \ll 1$ — **a potential that is very flat in Planck units.** Inflation ends when $\epsilon$ approaches 1.

Two consequences follow, and they carry most of the theory's testable content.

**The spectrum must be nearly, but not exactly, scale-invariant.** Different scales exit the horizon at different times, when the field sits at slightly different points on its potential, so the conditions differ slightly. The spectral index is

$$n_s = 1 - 6\epsilon + 2\eta,$$

which is close to 1 and generically **slightly below** it, because the field is rolling downhill. The measured $n_s = 0.9649 \pm 0.0042$ — **8.4 standard deviations below 1** — is exactly this signature, and it is the strongest quantitative success inflation has.

**Gravitational waves are produced, with an amplitude set by the energy scale.** The tensor-to-scalar ratio is $r = 16\epsilon$, so measuring $r$ would measure the inflationary energy scale directly. **This is the prize, and it has not been claimed**: the bound is $r < 0.036$, which excludes the simplest $V \propto \phi^2$ potential along with several others, while leaving many models — including the currently favoured plateau potentials, which predict $r$ well below current sensitivity — entirely untouched.

There is a difficulty behind the flatness requirement that deserves naming. **A potential flat enough for inflation is not generic.** Quantum corrections tend to spoil flatness, so the required smallness of $\epsilon$ and $\eta$ is itself a fine-tuning — of a different kind from the ones inflation solves, but a fine-tuning nonetheless. Models addressing this invoke symmetries protecting the potential's shape. **The tuning has been relocated rather than removed**, which is a fair criticism and one advocates generally acknowledge.

## Reheating: where the hot Big Bang actually starts

An epoch usually skipped deserves attention, because without it inflation would leave an empty universe.

By the end of inflation, everything that existed beforehand has been diluted by $e^{3N} \approx 10^{78}$. **The universe is cold, empty and smooth** — all the energy is in the inflaton field's potential and none of it is in particles. This is a problem: the next chapter of the story is a hot dense plasma, and there is nothing hot or dense about what inflation leaves behind.

**Reheating** is the transition. As the field reaches the bottom of its potential it oscillates about the minimum, and those oscillations decay into particles through the field's couplings to Standard Model fields. The potential energy converts into a thermal bath, and the universe is heated to a **reheating temperature** $T_{\rm reh}$.

**The hot Big Bang begins here.** Everything the Early Universe chapter described — the quark–hadron transition, neutrino decoupling, nucleosynthesis — happens after reheating, in a plasma that inflation created. Inflation does not precede the Big Bang so much as **supply it**.

Several things about reheating are worth knowing, and their varied status is instructive.

**The temperature is poorly constrained.** It must exceed a few MeV, or nucleosynthesis could not proceed — the firmest lower bound in the subject, and it comes from the light-element abundances rather than from any inflationary consideration. The upper bound is model-dependent and can approach the inflationary energy scale. **Between a few MeV and $10^{15}$ GeV is eighteen orders of magnitude of ignorance about an epoch that must have occurred.**

**The mechanism may be violent.** The simple picture of perturbative decay was superseded by **preheating**, in which parametric resonance transfers energy explosively into specific field modes before thermalisation. The distinction matters because preheating can produce gravitational waves, topological defects and non-thermal relics that perturbative reheating would not.

**It severs the connection between inflation and observation.** The number of e-folds we need — the 50 to 60 quoted above — depends on the expansion history between the end of inflation and the start of the radiation era, which depends on reheating. **So the reheating uncertainty propagates directly into the predicted $n_s$ and $r$**, at a level comparable to current measurement precision. This is an underappreciated limit on how sharply inflation can be tested.

```checkpoint
q: Why is reheating necessary, and what does its uncertainty cost?
a: It is not strictly necessary — the inflaton field itself constitutes the matter of the later universe
x: The inflaton's energy must be converted into Standard Model particles; a universe still dominated by a slowly rolling field would not produce nucleosynthesis or a CMB.
a*: Because inflation leaves a cold, empty universe with all energy in the inflaton potential, and reheating converts that into a hot plasma — but $T_{\rm reh}$ is constrained only between a few MeV and near the inflationary scale, and that uncertainty propagates into the predicted $n_s$ and $r$
a: It is needed to end inflation, and its uncertainty affects only the duration of the inflationary epoch
x: Inflation ends when the slow-roll conditions fail, independently of reheating; reheating is what happens afterwards.
a: It explains the baryon asymmetry, and its uncertainty leaves that unexplained
x: Baryogenesis must occur after reheating but is a separate problem; reheating does not by itself generate the asymmetry.
hint: Ask what the universe contains the instant inflation ends, and what has to happen before the Early Universe chapter can begin.
why: Inflation dilutes everything pre-existing by $e^{3N} \approx 10^{78}$, leaving a cold empty universe with all its energy in the inflaton's potential. Reheating converts that into particles: the field oscillates about its potential minimum and decays through its couplings, producing a thermal bath at temperature $T_{\rm reh}$. **The hot Big Bang begins here** — everything from the quark–hadron transition to nucleosynthesis happens in a plasma inflation created. The cost is that $T_{\rm reh}$ is bounded only between a few MeV, below which nucleosynthesis fails, and something near the inflationary scale: eighteen orders of magnitude. Since the required number of e-folds depends on the expansion history between inflation's end and radiation domination, that ignorance propagates into the predicted $n_s$ and $r$ at a level comparable to current measurement precision — an underappreciated limit on how sharply the theory can be tested.
```

## We observe about eight e-folds out of sixty

A quantitative point about the theory's testability that is rarely made explicit.

Inflation lasts at least 60 e-folds. Observations constrain a much smaller slice of it.

The CMB and large-scale structure together probe comoving wavenumbers from roughly $k = 10^{-4}$ to $0.2$ Mpc⁻¹ — a range of 3.3 decades, or

$$\ln\frac{0.2}{10^{-4}} = 7.6\ \text{e-folds}.$$

**We observe about 13% of the inflationary epoch, and nothing at all about the rest.**

The consequences are worth stating plainly.

**The potential is measured only over a small stretch.** The observations constrain $V$, $V'$ and $V''$ over the field range corresponding to those 7.6 e-folds. What the potential does elsewhere — whether it continues flat, has features, ends in a particular way — is unconstrained by anything.

**Model discrimination is correspondingly limited.** Many potentials agree over the observed window and differ everywhere else, so the data select a class of behaviours rather than a model. Reports that a particular potential is "favoured" generally mean it lies within the observationally allowed region of the $n_s$–$r$ plane, which many potentials do.

**Features outside the window are essentially unfalsifiable.** A model with a step or oscillation at $10^{-8}$ Mpc⁻¹ predicts nothing observable, which is why constraints on primordial black hole formation and on $\mu$-distortions matter: **they probe scales the CMB cannot**, and are among the few handles on the rest of the epoch. The Relic Radiation chapter's point about $\mu$-distortions reaching $k$ up to $10^{4}$ Mpc⁻¹ is exactly this — a factor of $10^{5}$ beyond the CMB's reach, and the main reason spectrometer proposals continue.

**This is not a criticism of inflation** so much as a description of what any observation of it can achieve. But it bears on the predictivity debate: **a framework tested over 13% of its duration is being tested less comprehensively than the confirmations suggest.**

## What has been confirmed

Five generic predictions, with honest status attached to each.

**Spatial flatness.** $\Omega_k = 0.001 \pm 0.002$. **Confirmed**, though a flat universe was always possible without inflation — this is consistency rather than a sharp test.

**Near-scale-invariance with a slight red tilt.** $n_s = 0.9649 \pm 0.0042$, differing from 1 at $8.4\sigma$, in the predicted direction and of roughly the predicted size. **Confirmed, and this is the strongest result.**

**Adiabatic initial conditions.** A single field imprints proportional perturbations on all species. Isocurvature contributions are bounded to a few per cent. **Confirmed.**

**Near-Gaussianity.** Single-field slow-roll predicts almost exactly Gaussian fluctuations; $f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$ is consistent with zero and excludes several multi-field classes. **Confirmed.**

**Super-horizon correlations.** The sharp form, as the CMB Map chapter set out, is the temperature–polarisation anticorrelation at $\ell \approx 30$–150, which requires perturbations already outside the horizon and oscillating in a particular phase. **Confirmed, and this is the prediction no post-inflationary causal mechanism can reproduce.**

**Primordial gravitational waves. Not detected**, $r < 0.036$.

The pattern is worth stating plainly: **everything inflation generically predicts about the initial conditions has been confirmed, and the one prediction that would identify the mechanism has not.** That is a real and unusual position — strong by the standards of speculative early-universe physics, weak by the standards of the six-parameter CMB fit, and easy to misreport in either direction.

```checkpoint
q: What is the status of inflation's prediction of primordial gravitational waves?
a: Detected by BICEP2 in 2014, establishing the inflationary energy scale
x: The BICEP2 signal was withdrawn when joint analysis with Planck showed it was consistent with polarised Galactic dust.
a*: Not detected, with $r < 0.036$ — which excludes the simplest $V \propto \phi^2$ potential and several others, while leaving plateau models predicting $r$ far below current sensitivity untouched
a: Excluded, since the absence of B-modes at current sensitivity rules out inflation
x: Many inflationary models predict $r$ orders of magnitude below the current bound; non-detection constrains the model space rather than the framework.
a: Untestable in principle, since primordial gravitational waves cannot be distinguished from the lensing signal
x: Lensing B-modes are separable by their angular scale and spectrum, and are themselves detected; the primordial signal is faint, not indistinguishable.
hint: Ask what $r$ measures, and what a non-detection at a given level does and does not exclude.
why: The tensor-to-scalar ratio is $r = 16\epsilon$, so it measures the inflationary energy scale directly — which is why detecting it is the field's central goal. The current bound $r < 0.036$ comes from CMB B-mode polarisation searches. It excludes the simplest chaotic-inflation potential $V \propto \phi^2$ along with several others, which is a real result. But plateau potentials such as Starobinsky's predict $r \sim 10^{-3}$, well below present sensitivity, so non-detection leaves a large and well-motivated part of the model space entirely unconstrained. The 2014 BICEP2 claim was withdrawn when joint analysis with Planck showed the signal consistent with polarised Galactic dust — a failure in a foreground input rather than in the instrument. So: everything inflation generically predicts about initial conditions is confirmed; the one prediction that would identify the mechanism is not.
---
q: A detection of $r$ would fix the energy scale of inflation through $V^{1/4} \propto r^{1/4}$. What follows from that fourth-root dependence?
a: That $r$ is an exceptionally sensitive probe of the energy scale, since small changes in $r$ imply large changes in $V$
x: The dependence runs the other way — a fourth root compresses variation rather than amplifying it.
a*: That $r$ is a weak lever on the scale: improving the bound tenfold lowers the implied energy by only a factor of 1.8, so non-detection cannot quickly push inflation to low energies
a: That the energy scale cannot be inferred from $r$ at all, since the relation is too shallow to be useful
x: It is perfectly usable — the current bound already places $V^{1/4}$ below $1.5\times10^{16}$ GeV, near the GUT scale.
a: That $r$ constrains only the shape of the potential, not its overall height
x: $r = 16\epsilon$ involves the slope, but combined with the measured scalar amplitude it fixes the height as well, which is exactly what the relation expresses.
hint: Ask by how much $V^{1/4}$ changes when $r$ falls by a factor of ten.
why: The relation $V^{1/4} \approx 1.06\times10^{16}\,\mathrm{GeV}\,(r/0.01)^{1/4}$ means a factor of ten in $r$ corresponds to $10^{1/4} = 1.8$ in energy scale. So the current bound $r < 0.036$ places inflation below $1.5\times10^{16}$ GeV — just under the GUT scale, which is suggestive — but pushing the bound to $r < 0.0036$ would only lower that to $8\times10^{15}$ GeV. Two things follow. Improved sensitivity buys less than one might expect in constraining the scale. And since low-scale models predict $r$ many orders of magnitude below any conceivable measurement, inflation may be correct while its most distinctive quantitative prediction remains permanently untestable — a situation worth naming, because a theory can be true and beyond decisive test.
```

## The energy scale, if it is ever measured

One number would transform the subject, and it is worth being clear about what it is.

The tensor-to-scalar ratio fixes the energy scale of inflation through

$$V^{1/4} \approx 1.06\times10^{16}\ \mathrm{GeV} \left(\frac{r}{0.01}\right)^{1/4}.$$

At the current bound $r < 0.036$, this gives $V^{1/4} < 1.5\times10^{16}$ GeV — **just below the grand unification scale.**

That proximity is suggestive and has been much remarked on. If inflation occurred near the GUT scale, it would connect the two great untested extrapolations of early-universe physics, and a measurement of $r$ would be the first direct probe of energies twelve orders of magnitude beyond any collider.

Two cautions belong with that.

**The fourth-root dependence makes $r$ a poor lever on the scale.** Reducing the bound on $r$ by a factor of ten lowers the implied energy scale by only 1.8. So even a substantial improvement in sensitivity moves the inferred scale modestly, and a non-detection cannot push inflation to low energies quickly.

**Nothing requires inflation to be at high energy.** Low-scale models exist and predict $r$ many orders of magnitude below any conceivable measurement. **If inflation happened at, say, $10^{10}$ GeV, we will never measure $r$**, and the framework's central quantitative prediction will remain permanently untested — not because the theory is wrong but because the signal is too small.

That possibility deserves stating because it is rarely acknowledged: **inflation may be both correct and permanently unconfirmable in its most distinctive prediction.** A theory can be true and beyond decisive test, and recognising which situation one is in is part of assessing the evidence honestly.

## The strongest criticism

Inflation is not universally accepted, and the most serious objections come from people who understand it best — including Paul Steinhardt, who helped construct the theory of new inflation and now argues against it. Dismissing this as fringe would misrepresent the field.

The critique, developed by Ijjas, Steinhardt and Loeb, has three parts.

**The initial conditions problem was not solved but moved.** Inflation requires a patch of the pre-inflationary universe that is already smooth over roughly a Hubble volume, with the field sitting in the right part of its potential and its gradient energy sufficiently small. Detailed analyses suggest such a patch is not generic. **If inflation requires special initial conditions to begin, it has not explained why the initial conditions were special.** Advocates respond that the required patch is far smaller and less special than a whole smooth universe, which is a real reduction — but a reduction, not an elimination.

**Eternal inflation makes the theory unpredictive.** In most models, quantum fluctuations keep some regions inflating forever, so inflation never entirely ends. The result is an unbounded number of pocket universes with every possible outcome. To extract a prediction one must define a probability measure over an infinite set — **the measure problem** — and no preferred measure exists. Different choices give different predictions, including for $n_s$. Steinhardt's charge is that **a theory in which anything happens somewhere, and the probabilities depend on an arbitrary choice, is not making predictions at all.**

**The successful predictions are not unique to inflation.** Flatness, scale-invariance and Gaussianity are also produced by ekpyrotic and cyclic models, in which a slow contraction rather than a rapid expansion does the smoothing. Those models predict **negligible** primordial gravitational waves, so they are consistent with the non-detection of B-modes and would be favoured by continued null results.

The counter-arguments are also serious, and both sides deserve stating.

**The measure problem may be a technical difficulty rather than a foundational one.** Many hard problems in physics have looked like matters of principle before someone found the right formalism, and inflation's phenomenological predictions within a given model are perfectly definite.

**Alternatives have their own problems.** Ekpyrotic models require a bounce through a singularity, which requires physics nobody has, and they have their own tunings.

**Confirmed predictions still count.** The TE anticorrelation at $\ell \approx 30$–150 was predicted and found. That an alternative can also produce it reduces its discriminating power but does not retract the success.

The defensible position: **inflation is the leading framework, its generic predictions are confirmed, its specific realisation is unknown, and it faces a foundational objection about predictivity that has not been answered.** A treatment presenting it as established fact, or as discredited, is misrepresenting a live disagreement.

```checkpoint
q: Critics argue that eternal inflation makes the theory unpredictive. What is the substance of that objection?
a: That inflation predicts a multiverse, which is unobservable and therefore unscientific
x: Unobservability of other regions is a separate complaint; the predictivity objection is specifically about extracting probabilities.
a*: That quantum fluctuations keep some regions inflating forever, producing an unbounded set of outcomes — so extracting a prediction requires a probability measure over an infinite set, and no preferred measure exists, with different choices yielding different answers
a: That eternal inflation contradicts the observed flatness, since regions still inflating would be curved
x: Regions that have exited inflation are flat; ongoing inflation elsewhere is not in conflict with local observations.
a: That eternal inflation requires more than 60 e-folds, which is inconsistent with the measured $n_s$
x: The number of e-folds is not what the objection concerns, and eternal inflation is compatible with the observed spectral index.
hint: Ask what you would have to do to compute the probability of observing a given $n_s$ if every outcome occurs somewhere.
why: In most inflationary models, quantum fluctuations in the field cause some regions to continue inflating indefinitely while others exit, so inflation never fully ends and generates an unbounded number of pocket universes realising every possible outcome. To predict what an observer should measure, one must weight these — and defining a probability measure over an infinite set requires a choice that the theory does not supply. Different measures give different answers, including for $n_s$, so the theory's predictions depend on an arbitrary input. Steinhardt's charge is that a framework in which every outcome occurs somewhere, weighted by a choice nobody can justify, is not predicting. Defenders reply that the measure problem may be technical rather than foundational, and that within any specific model the phenomenology is perfectly definite. Neither position has been established, and presenting inflation as settled misrepresents that.
---
q: Ekpyrotic and cyclic models reproduce flatness, near-scale-invariance and Gaussianity, and predict negligible primordial gravitational waves. What follows for how the B-mode searches should be read?
a: Nothing — the alternatives are not taken seriously enough for their predictions to matter
x: They are developed by serious researchers and make definite predictions; dismissing them is not a position the evidence supports.
a*: That a detection would strongly favour inflation and largely exclude those alternatives, while continued non-detection progressively favours them — so the searches discriminate between frameworks rather than merely testing one
a: That B-mode searches are pointless, since both frameworks accommodate any result
x: They accommodate a null result differently: inflation's model space shrinks while ekpyrotic models are unaffected, so the searches are informative either way.
a: That a non-detection would refute inflation outright, since gravitational waves are its central prediction
x: Plateau models predict $r$ far below current and near-future sensitivity, so non-detection cannot refute the framework.
hint: Ask what each framework predicts for $r$, and which outcome each would find comfortable.
why: Inflation generically produces tensor modes with $r = 16\epsilon$, so the amplitude tracks the inflationary energy scale; high-scale models predict $r$ within reach, low-scale plateau models predict $r \sim 10^{-3}$ or below. Ekpyrotic and cyclic models, in which slow contraction rather than rapid expansion does the smoothing, produce negligible tensor amplitude. So a detection would be decisive for inflation and near-fatal for the alternatives, while continued null results shrink inflation's viable model space and leave the alternatives untouched — gradually shifting the balance without ever settling it. This is why the searches matter beyond confirming a single framework: they are among the few measurements that discriminate between competing accounts of the pre-Big-Bang era, which is otherwise almost entirely inaccessible.
```

{{image: BICEP and Keck Array | The telescopes at the South Pole searching for the B-mode polarisation signature of primordial gravitational waves. The 2014 announcement of a detection was withdrawn after joint analysis with Planck showed the signal was consistent with polarised emission from Galactic dust — a failure in an assumed foreground rather than in the instrument. The current bound, $r < 0.036$, excludes the simplest chaotic-inflation potentials while leaving plateau models, which predict amplitudes orders of magnitude smaller, entirely unconstrained.}}

## Pulling the thread

- Inflation addresses **three fine-tunings, not three contradictions.** The **horizon problem**: $\eta_{\rm rec} = 281$ Mpc against 13,870 Mpc to last scattering, so a causal patch subtends 1.16° and the sky holds about **9,800 causally disconnected regions** agreeing to $10^{-5}$. The **flatness problem**: $|\Omega-1| \propto a^2$ during radiation domination makes flatness a **repeller**, requiring tuning to **$\sim10^{-60}$** at the Planck time. The **monopole problem**, conditional on grand unification, and the one Guth was actually working on.
- **Sixty e-folds solves all three at once**, with no parameter adjusted for each: the observable universe comes from a formerly causally connected patch; $|\Omega-1|$ is suppressed by $e^{2N} \approx 10^{52}$; defects are diluted by $e^{3N} \approx 10^{78}$. **That simultaneity is why it was adopted before any evidence existed.**
- **Slow roll requires a flat potential** in Planck units, $\epsilon \ll 1$ and $|\eta| \ll 1$. This gives $n_s = 1 - 6\epsilon + 2\eta$, generically **just below 1** — and $n_s = 0.9649 \pm 0.0042$ is $8.4\sigma$ below, the theory's strongest quantitative success. But **a sufficiently flat potential is not generic**, so the tuning has been relocated rather than removed.
- **Five generic predictions confirmed** — flatness, red tilt, adiabaticity, near-Gaussianity, and the super-horizon TE anticorrelation at $\ell \approx 30$–150 that no post-inflationary causal mechanism reproduces. **One not confirmed**: primordial gravitational waves, $r < 0.036$.
- **The critique is serious and comes from insiders.** Inflation needs a smooth starting patch, so the initial-conditions problem is reduced rather than eliminated; **eternal inflation plus the measure problem** means every outcome occurs somewhere with probabilities set by an arbitrary choice; and the confirmed predictions are **not unique** to inflation, since ekpyrotic and cyclic models reproduce them while predicting negligible tensors.
- **Reheating supplies the hot Big Bang.** Inflation ends with a cold empty universe; the oscillating field decays into a thermal bath, and everything from the quark–hadron transition onward happens in plasma inflation created. $T_{\rm reh}$ is bounded only between a few MeV and near the inflationary scale — **eighteen orders of magnitude** — and that ignorance propagates into the predicted $n_s$ and $r$.
- **We observe about 7.6 of ~60 e-folds** — 13% of the epoch — so the potential is measured over a small field range and many models agreeing there are indistinguishable. $\mu$-distortions and primordial black hole limits are among the few probes of the rest.
- **$V^{1/4} < 1.5\times10^{16}$ GeV**, just below the GUT scale. But the fourth-root dependence makes $r$ a weak lever, and low-scale models predict $r$ beyond any conceivable measurement — so **inflation may be correct and permanently unconfirmable in its most distinctive prediction.**
- The defensible summary: **the leading framework, generic predictions confirmed, specific realisation unknown, foundational objection unanswered.**

The transferable idea: **a theory that converts an improbable initial condition into a generic outcome has done something real, but the achievement must be audited for whether the improbability was removed or relocated.** Inflation genuinely replaces "the universe began uniform, flat and monopole-free" with "almost any starting patch produces those features" — that is progress. It then requires a potential flat in Planck units, which is itself not generic, and a smooth pre-inflationary patch, which is also not generic. **The right question about any such explanation is not whether it works but where the tuning went**, and the honest answer here is that it went somewhere smaller and less specific, which is worth something without being a solution. The same audit applies to any mechanism proposed to explain away a coincidence, in physics or elsewhere: **follow the improbability, and see whether it was destroyed or merely moved.**

## Further reading

{{book: Alan Guth | The Inflationary Universe | 1997}}

{{book: Paul Steinhardt and Neil Turok | Endless Universe | 2007}}

{{book: Andrei Linde | Particle Physics and Inflationary Cosmology | 1990}}

Beyond the books: Guth's account is the standard first-person history and is candid about how accidental the discovery was. Steinhardt and Turok present the leading alternative, and reading them against Guth is the fastest way to understand what is actually disputed. Ijjas, Steinhardt and Loeb's 2017 *Scientific American* piece and the reply signed by Guth, Linde, Nomura and thirty others are worth reading together as a rare public disagreement about foundations among people who all did the original work.

## Problems

*Useful numbers: $\eta_{\rm rec} = 281$ Mpc comoving; $D_M = 13{,}870$ Mpc; $\Omega_k = 0.001 \pm 0.002$; $T_{\rm Planck}/T_0 = 5.2\times10^{31}$; $N \gtrsim 60$ e-folds, $e^{60} = 1.1\times10^{26}$; $n_s = 0.9649 \pm 0.0042$; $r < 0.036$; $n_s = 1 - 6\epsilon + 2\eta$; $r = 16\epsilon$; $f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$.*

**1.** *(Horizon.)* **(a)** Compute the angle subtended by the particle horizon at recombination. **(b)** Compute the number of causally disconnected patches on the sky. **(c)** Explain why this is a fine-tuning rather than a contradiction.

**2.** *(Flatness.)* **(a)** Write $|\Omega - 1|$ in terms of $a$ and $H$ and give its scaling in the radiation era. **(b)** Explain why $\Omega = 1$ is a repeller. **(c)** Estimate the required tuning at the Planck time.

**3.** *(One mechanism, three problems.)* **(a)** Explain how inflation resolves each of the three. **(b)** Compute the suppression factors for curvature and for defect density at $N = 60$. **(c)** State why the simultaneity matters for the theory's credibility.

**4.** *(Slow roll.)* **(a)** Define $\epsilon$ and $\eta$ and state the inflation conditions. **(b)** Explain why the spectrum is nearly but not exactly scale-invariant, and why the tilt is generically red. **(c)** State the fine-tuning that slow roll itself requires.

**5.** *(Tensors.)* **(a)** Relate $r$ to $\epsilon$ and state what measuring $r$ would give. **(b)** State the current bound and what it excludes. **(c)** Explain why non-detection does not refute inflation.

**6.** *(Confirmed predictions.)* **(a)** List five and give the status of each. **(b)** Identify which is the sharpest test and explain why. **(c)** State which is mere consistency rather than a test, and why.

**7.** *(The critique.)* **(a)** State the three parts of the Ijjas–Steinhardt–Loeb argument. **(b)** Give the counter-argument to each. **(c)** State the defensible summary position.

**8.** *(Discriminating.)* **(a)** State what ekpyrotic models predict for $r$ and why. **(b)** Explain what a detection and a continued non-detection would each imply. **(c)** Explain why this makes B-mode searches more valuable than a single-framework test.

**9.** *(Auditing an explanation.)* **(a)** State what inflation genuinely achieves. **(b)** State where the tuning reappears. **(c)** Give the general principle and apply it outside cosmology.

## Worked answers

**1.** **(a)** $\theta = \eta_{\rm rec}/D_M = 281/13{,}870 = 0.0203$ rad $= \mathbf{1.16°}$. **(b)** A patch of angular radius $\theta$ covers solid angle $\approx \pi\theta^2 = \pi(0.0203)^2 = 1.29\times10^{-3}$ sr, and the sky is $4\pi = 12.57$ sr, giving $N = 12.57/1.29\times10^{-3} \approx \mathbf{9{,}800}$ patches. **(c)** Because **nothing in the equations forbids uniform initial conditions.** The Friedmann equations accept whatever initial data are supplied, and a universe that began at uniform temperature everywhere is perfectly consistent. What is unsatisfying is that the uniformity must then be *assumed* rather than produced, and assumed to hold across $10^{4}$ regions with no common cause — a coincidence of that size demands a mechanism, but its absence is a failure of explanation rather than of consistency.

**2.** **(a)** $\Omega - 1 = kc^2/(a^2H^2) = kc^2/\dot a^2$. In the radiation era $a \propto t^{1/2}$, so $\dot a \propto t^{-1/2} \propto a^{-1}$ and $|\Omega - 1| \propto a^2$. In the matter era it scales as $a$. **(b)** Because $|\Omega - 1|$ **grows whenever $\dot a$ decreases**, which is whenever the expansion decelerates — and the standard model decelerates throughout the radiation and matter eras. Any initial deviation from flatness is therefore amplified, so $\Omega = 1$ is an unstable equilibrium: the universe runs away from it unless started implausibly close. **(c)** The scale factor has grown by roughly $T_{\rm Planck}/T_0 = 5.2\times10^{31}$ since the Planck time. Using the radiation scaling throughout as an estimate, $|\Omega-1|_{\rm Planck} \sim 0.002/(5.2\times10^{31})^2 \sim 10^{-66}$; allowing properly for the matter and dark-energy eras softens this to of order $\mathbf{10^{-60}}$. **The initial density had to match the critical density to sixty decimal places.**

**3.** **(a)** *Horizon*: the region that became our observable universe was small enough before inflation to be causally connected and to equilibrate, and inflation then stretched it beyond the horizon — **uniformity is inherited, not imposed**. *Flatness*: $|\Omega-1| \propto 1/(aH)^2$ with $H$ nearly constant and $a$ growing enormously, so curvature is driven toward zero and flatness becomes an **attractor**. *Monopoles*: defects produced before inflation are diluted in number density by the volume expansion. **(b)** Curvature is suppressed by $e^{2N} = e^{120} = \mathbf{1.3\times10^{52}}$; defect number density by $e^{3N} = e^{180} = \mathbf{1.5\times10^{78}}$. **(c)** Because **no parameter was adjusted for each problem.** A theory that solves three unrelated fine-tunings with one mechanism and one requirement — sufficient e-folds — is doing far more than three separate fixes would. This is why inflation was adopted rapidly in the 1980s despite having no direct observational support for two decades: the explanatory economy was the argument.

**4.** **(a)** $\epsilon = \frac{M_{\rm Pl}^2}{2}(V'/V)^2$ measures the potential's steepness; $\eta = M_{\rm Pl}^2 V''/V$ its curvature. Inflation requires $\epsilon \ll 1$ and $|\eta| \ll 1$, i.e. **a potential very flat in Planck units**, and ends when $\epsilon \to 1$. **(b)** Because **different scales exit the horizon at different times**, when the field sits at slightly different points on its potential, so the conditions setting each mode's amplitude differ slightly. Exact scale-invariance would require the conditions to be identical, i.e. a perfectly flat potential and no rolling at all — which would never end. The tilt is generically **red** ($n_s < 1$) because the field rolls downhill, so $V$ and hence $H$ decrease with time, and modes exiting later do so at slightly lower energy. **(c)** That **a potential flat enough for slow roll is not generic**: quantum corrections tend to spoil flatness, so $\epsilon, \eta \ll 1$ is itself a tuning. Models invoke symmetries to protect the potential's shape. The tuning has therefore been **relocated rather than removed**, which advocates generally acknowledge.

**5.** **(a)** $r = 16\epsilon$, so $r$ measures the steepness of the potential and hence, through the Friedmann equation, the **energy scale of inflation** directly. A detection would fix the scale at which inflation occurred — the single most informative number the theory could yield. **(b)** $r < 0.036$, which **excludes the simplest chaotic-inflation potential $V \propto \phi^2$** and several others requiring high-scale inflation with steep potentials. **(c)** Because **many well-motivated models predict $r$ far below current sensitivity.** Plateau potentials such as Starobinsky's give $r \sim 10^{-3}$, an order of magnitude or more below what present experiments can reach. Non-detection therefore shrinks the viable model space — a real result — without bearing on the framework. Confusing "this model is excluded" with "inflation is excluded" is the standard error here.

**6.** **(a)** *Flatness*, $\Omega_k = 0.001 \pm 0.002$ — **confirmed**. *Red tilt*, $n_s = 0.9649 \pm 0.0042$ at $8.4\sigma$ from unity — **confirmed, strongest result**. *Adiabatic initial conditions*, isocurvature bounded to a few per cent — **confirmed**. *Near-Gaussianity*, $f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$ — **confirmed**. *Super-horizon correlations*, via the TE anticorrelation at $\ell \approx 30$–150 — **confirmed**. *Primordial gravitational waves* — **not detected**, $r < 0.036$. **(b)** The **super-horizon TE anticorrelation**, because it requires perturbations already outside the horizon and caught in a specific oscillation phase at last scattering, which **no causal mechanism operating after inflation can arrange**. The others constrain the initial conditions' character; this one constrains their causal history. **(c)** **Flatness.** A flat universe is entirely possible without inflation — it merely requires the right initial conditions, which is exactly the fine-tuning at issue. Measuring $\Omega_k \approx 0$ is therefore consistent with inflation without discriminating against the alternative of tuned initial data, so it confirms nothing that was in doubt.

**7.** **(a)** *One*: inflation itself requires a smooth starting patch with the field suitably placed, which is not generic — **the initial-conditions problem was moved, not solved**. *Two*: eternal inflation produces an unbounded set of pocket universes realising every outcome, so predictions require a probability measure over an infinite set, and **no preferred measure exists** — different choices give different answers, including for $n_s$. *Three*: the confirmed predictions are **not unique** to inflation, since ekpyrotic and cyclic models reproduce flatness, near-scale-invariance and Gaussianity. **(b)** *One*: the required patch is far smaller and less special than a smooth universe, so the improbability is genuinely reduced even if not eliminated. *Two*: the measure problem may be technical rather than foundational, and within any specific model the phenomenology is perfectly definite. *Three*: an alternative's ability to reproduce a prediction reduces its discriminating power but does not retract the success, and alternatives have their own difficulties — ekpyrotic models need a bounce through a singularity, requiring physics nobody has. **(c)** **Inflation is the leading framework; its generic predictions are confirmed; its specific realisation is unknown; and it faces a foundational objection about predictivity that has not been answered.** Presenting it as established fact or as discredited both misrepresent a live disagreement among people who built the theory.

**8.** **(a)** **Negligible** tensor amplitude, because the smoothing is accomplished by a **slow contraction** rather than a rapid expansion. Tensor modes are amplified by accelerated expansion; a contracting phase does not amplify them, so no observable primordial gravitational wave background is produced. **(b)** A **detection** would be strong evidence for inflation and near-fatal for ekpyrotic and cyclic models, since they cannot produce the signal. **Continued non-detection** progressively shrinks inflation's viable model space — pushing it toward low-scale plateau models — while leaving the alternatives entirely comfortable, gradually shifting the balance without settling it. **(c)** Because the searches **discriminate between frameworks rather than testing one**. A measurement that only confirms or fails to confirm a single theory is far less valuable than one whose two possible outcomes favour different theories. And this is one of very few observables bearing on the pre-Big-Bang era at all, which is otherwise almost wholly inaccessible — making a discriminating test there disproportionately valuable.

**9.** **(a)** It replaces "the universe began uniform, flat and free of monopoles" with "**almost any starting patch, sufficiently inflated, produces those features**" — converting three improbable initial conditions into generic outcomes of one mechanism, with no parameter adjusted for each. That is genuine explanatory progress. **(b)** In two places. The potential must be **flat in Planck units** for slow roll to sustain sixty e-folds, and such flatness is not generic under quantum corrections. And inflation must **begin**, which requires a pre-inflationary patch already smooth over roughly a Hubble volume with the field suitably placed — also not generic. **(c)** **When a mechanism is proposed to explain away a coincidence, follow the improbability and determine whether it was destroyed or relocated** — and if relocated, whether the new tuning is smaller or less specific than the old. Here it is genuinely smaller, which is worth something short of a solution. Outside cosmology: **explanations of biological complexity by appeal to a long sequence of small selected steps** face the same audit — the improbability of the end state is real, and the question is whether the proposed mechanism removes it or pushes it into the improbability of the starting conditions and the fitness landscape. In both cases the honest answer requires quantifying the relocated tuning rather than declaring the problem solved.$duInfl_master$,
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
