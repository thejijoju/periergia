-- Astronomy & Space · The Dark Universe — Cosmic Frontiers — "The Far Future".
-- Curated master for
-- astronomy-and-space/dark-universe/cosmic-frontiers/far-future
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- First chapter of the Cosmic Frontiers block. Organised around the
-- erasure of evidence rather than around a list of eras: within ~100 Gyr
-- an observer in the Local Group sees a static island universe with no
-- CMB, no external galaxies and no redshift-distance relation, so every
-- observation supporting the Big Bang will have been destroyed by the
-- expansion it describes. That makes the present a privileged epoch for
-- cosmology and raises the question of what has already been erased from
-- our own view - which is the honest, and unsettling, content of the
-- chapter. Then the timeline itself with its assumptions labelled: the
-- stelliferous era to 1e13-1e14 yr, degenerate era and galaxy
-- evaporation at 1e17-1e20 yr, proton decay if it happens at all, black
-- hole evaporation from 1e67 to 1e103 yr, and the de Sitter thermal
-- floor at 2.2e-30 K. Alternatives (Big Rip, vacuum decay) treated as
-- live rather than dismissed, and the epistemics of extrapolating 90
-- orders of magnitude in time stated plainly.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting (Planck 2018: h=0.6766, Om=0.3111,
-- OL=0.6889): H_inf = H0 sqrt(OL) = 56.2 km/s/Mpc, e-folding time 17.4
-- Gyr, asymptotic de Sitter horizon 17.4 Gly; de Sitter temperature
-- hbar H/(2 pi k_B) = 2.21e-30 K; CMB falls below it after 1.21e12 yr;
-- Hawking evaporation t = 5120 pi G^2 M^3/(hbar c^4) giving 2.1e67 yr
-- for 1 Msun, 1.7e87 yr for Sgr A* at 4.3e6 Msun, 2.1e103 yr for 1e12
-- Msun; T_Hawking(1 Msun) = 6.2e-8 K, exceeded by the CMB until 307
-- Gyr from now; Milky Way two-body relaxation ~4e16 yr; gravitational-
-- wave decay of a 10 kpc galactic orbit ~6e32 yr; Big Rip time
-- 2/(3|1+w| H0 sqrt(OL)) giving 116 Gyr for w = -1.1; Super-K proton
-- lifetime limit > 2.4e34 yr.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/cosmic-frontiers/far-future',
    'research',
    'advanced',
    'read',
    $duFuture_master$> In roughly one hundred billion years, an astronomer in this galaxy will look out and see a single island of stars in an empty, static, unchanging void. There will be no other galaxies, no cosmic microwave background, and no redshift–distance relation. **Every piece of evidence that the universe expanded from a hot dense state will have been destroyed — by the expansion itself.**

That observer will not be ignorant or careless. They will do good science with excellent instruments and reach a confident, wrong conclusion: that they inhabit a static, eternal universe containing one galaxy.

This chapter is about the far future, and the standard way to tell it is as a sequence of eras with increasingly large exponents. That version is worth having and appears below. But the sequence is not the interesting part. **The interesting part is that cosmology has a shelf life**, that we happen to be living inside it, and that this fact has a corollary nobody has a clean answer to: if evidence is being erased, what has already gone?

## 1. What is actually predicted, and on what assumptions

Prediction about $10^{100}$ years is a different activity from prediction about next Tuesday, and the difference should be stated before the numbers start.

Four assumptions carry the whole timeline, and they are of very different quality.

**Dark energy is a cosmological constant with $w = -1$ exactly.** Measured as $w = -1.03 \pm 0.03$, consistent with $-1$; recent surveys have reported hints of evolution at the $2$–$4\sigma$ level, unresolved. If $w < -1$ the universe ends in a Big Rip within tens of billions of years; if $w$ evolves toward $0$ the acceleration could stop. **This is the least secure assumption and it changes everything.**

**The vacuum is stable.** With the measured Higgs and top masses, the Standard Model vacuum appears to be *metastable* rather than stable — a lower-energy state exists and the barrier is finite. The estimated lifetime vastly exceeds the current age of the universe, but the calculation is exquisitely sensitive to the top quark mass and to physics above the electroweak scale.

**Protons decay, or do not.** Grand unified theories generically predict proton decay with lifetimes of $10^{34}$–$10^{36}$ years. Super-Kamiokande has excluded lifetimes below $2.4\times10^{34}$ years for the favoured channel, ruling out the simplest models. **Whether the proton decays at all is an open experimental question**, and the answer bifurcates the timeline by tens of orders of magnitude.

**General relativity, quantum mechanics and thermodynamics hold indefinitely.** No known reason they should not; no test at these scales either.

Two further methodological points. **Extrapolation is over about ninety orders of magnitude in time** — a factor comparable to the ratio between a Planck time and the present age of the universe. And **the calculations are not equally robust**: the Sun becoming a red giant in five billion years is stellar physics with observational checks; black hole evaporation at $10^{67}$ years is an unmeasured prediction of a semiclassical theory nobody has tested. It is worth marking which is which as we go, and this chapter does.

## 2. The near term: while things still happen

### 2.1 Five billion years — the Sun

The Sun exhausts core hydrogen, expands to a red giant with a radius of order $1$ AU, sheds its envelope as a planetary nebula and leaves a white dwarf of about $0.54\,M_\odot$. Earth's fate at the margin depends on the competition between the Sun's mass loss (which widens the orbit) and tidal drag (which shrinks it); the surface becomes uninhabitable long before, in about $1$ billion years, when rising luminosity triggers a runaway greenhouse.

This part of the timeline rests on stellar evolution theory checked against millions of observed stars. **It is the only part of the chapter with that status.**

### 2.2 Four to ten billion years — the Local Group merges

Andromeda approaches at $110\ \text{km s}^{-1}$ and the two galaxies are gravitationally bound. The classical estimate had them merging in about $4.5$ Gyr; improved proper motions have made the transverse velocity — the number that decides whether it is a collision or a flyby — less certain rather than more, and current analyses put a merger within $10$ Gyr at roughly even odds, with a first passage likely and the final coalescence possibly delayed.

**The outcome is not in doubt even if the schedule is.** Dynamical friction removes orbital energy at every passage, so a bound pair merges eventually. The product is an elliptical galaxy, sometimes called Milkomeda. Stellar collisions are negligible — the stars are separated by tens of millions of stellar radii — but the gas clouds do collide, triggering a burst of star formation and then exhausting the fuel.

The Local Group as a whole — the Milky Way, Andromeda, M33 and roughly eighty dwarfs, totalling $\sim5\times10^{12}\,M_\odot$ — is bound and will merge into one system. **Nothing outside it will.**

### 2.3 One hundred billion years — the sky empties

Here the accelerating expansion takes over. Its future behaviour is simple: as matter dilutes, $H$ approaches a constant,

$$H_\infty = H_0\sqrt{\Omega_\Lambda} = 67.66\times\sqrt{0.6889} = 56.2\ \text{km s}^{-1}\,\text{Mpc}^{-1},$$

and the universe becomes de Sitter space, expanding exponentially with an $e$-folding time of

$$\tau = 1/H_\infty = 17.4\ \text{Gyr}.$$

Every $17.4$ billion years, all distances outside bound systems double $e$ times over.

The consequence is an **event horizon** at $c/H_\infty = 17.4$ billion light years, and objects crossing it are gone permanently — not merely far away, but causally disconnected, with no signal sent after that moment ever arriving. Galaxies do not fade gradually so much as redshift out of existence: as a source approaches the horizon, its redshift diverges, its apparent brightness falls faster than any power law, and its clocks appear to freeze.

Working through it, an observer at $t \approx 100$–$150$ Gyr sees:

- **No external galaxies.** Everything outside the merged Local Group has crossed the horizon or redshifted beyond detectability.
- **No cosmic microwave background.** The CMB temperature falls as $1/a$, so exponential expansion drives it exponentially down. It reaches the de Sitter temperature — the floor set by the horizon itself — after about $1.2\times10^{12}$ years, and becomes undetectable in practice long before that.
- **No expansion.** With nothing outside the bound system to observe, there is no redshift–distance relation to measure. Local Group galaxies are gravitationally bound and do not participate in the Hubble flow.
- **No light element abundances that point anywhere.** Primordial deuterium and helium will have been reprocessed by many stellar generations; the pristine signature will be gone.

```checkpoint
q: Why will a future observer in the merged Local Group be unable to detect the expansion of the universe?
a: Because the expansion will have stopped by then
x: The opposite: it will be accelerating, doubling distances exponentially with an $e$-folding time of $17.4$ Gyr.
a*: Because everything outside the bound Local Group will have crossed the event horizon, leaving nothing whose redshift could be measured — and bound systems do not expand
a: Because the light from distant galaxies will be too faint to see with any telescope
x: Faintness is part of it, but the deeper point is causal: beyond the event horizon no signal ever arrives, however large the telescope.
a: Because the redshift of distant galaxies will approach zero as expansion becomes uniform
x: Redshift diverges rather than vanishing as a source approaches the horizon; the source becomes infinitely redshifted, not unshifted.
hint: Ask what objects remain observable, and whether those objects take part in the Hubble flow.
why: Expansion is measured by comparing redshift with distance for objects taking part in the Hubble flow. Two things remove that possibility. First, the accelerating expansion creates an event horizon at $c/H_\infty = 17.4$ billion light years: a galaxy crossing it becomes permanently causally disconnected, its redshift diverging and its apparent brightness falling off faster than any power law, so within roughly $100$–$150$ Gyr everything outside the Local Group is gone from the sky — not dim, but unreachable in principle. Second, what remains is a single gravitationally bound elliptical galaxy, and bound systems do not expand: the Local Group decoupled from the Hubble flow long ago. So the future observer has no sample of receding objects and no way to detect expansion at all. The same argument removes the CMB, which redshifts below any detectable level, and the primordial abundances, which stellar processing overwrites. **Every independent line of evidence for the Big Bang is destroyed, and by the expansion the evidence attests to.**
---
q: What is the significance of the asymptotic Hubble parameter $H_\infty = H_0\sqrt{\Omega_\Lambda} = 56.2\ \mathrm{km\,s^{-1}Mpc^{-1}}$?
a: It is the value the Hubble parameter had in the distant past, before dark energy dominated
x: In the past $H$ was much *larger* — it decreases with time and asymptotes downward to this value, rather than rising to it.
a*: It is the constant value $H$ approaches as matter dilutes away and the universe becomes de Sitter, fixing both the $17.4$ Gyr $e$-folding time and the $17.4$ Gly event horizon
a: It is the escape velocity of the Local Group expressed as an expansion rate
x: The two are unrelated; $H_\infty$ follows from the cosmological constant alone and knows nothing about the Local Group's mass.
a: It is the rate at which the universe would expand if dark energy were removed
x: Removing dark energy leaves matter, whose density falls, so $H$ would tend to zero rather than to a constant.
hint: Write $H^2 = H_0^2(\Omega_m a^{-3} + \Omega_\Lambda)$ and take $a\to\infty$.
why: The Friedmann equation gives $H^2 = H_0^2(\Omega_m a^{-3} + \Omega_\Lambda)$, and as $a\to\infty$ the matter term vanishes, leaving $H \to H_0\sqrt{\Omega_\Lambda} = 56.2\ \mathrm{km\,s^{-1}Mpc^{-1}}$. A constant $H$ means exponential expansion, $a \propto e^{H_\infty t}$, with $e$-folding time $1/H_\infty = 17.4$ Gyr — this is de Sitter space, and the universe is already most of the way there. Two consequences follow directly. There is an **event horizon** at $c/H_\infty = 17.4$ billion light years, beyond which no signal ever reaches us, which is why the sky empties. And there is a **temperature floor**: de Sitter space has a horizon temperature $T = \hbar H_\infty/2\pi k_B = 2.2\times10^{-30}$ K, below which nothing can cool, which is what stops the far future from being a true zero-temperature state and is why "heat death" is a slightly misleading name.
```

## 3. The erasure of evidence

This deserves its own section, because it is the part of the chapter that changes how one thinks rather than merely what one knows.

### 3.1 The future cosmologist's predicament

Consider that observer at $t = 10^{12}$ years, with our instruments and our intelligence. Their observations are:

- One galaxy, an old elliptical, containing red and dying stars.
- No detectable radiation background.
- No other galaxies at any wavelength.
- Space that is, so far as anything measurable goes, static and Euclidean.

**They would conclude that they live in a static, eternal, single-galaxy universe** — the cosmology of 1915. They would be doing careful, honest science and they would be wrong, and there would be no observation available to them that could reveal the error.

Some traces persist in principle. The abundance of helium is far higher than stellar nucleosynthesis alone predicts, which is a clue if one knows what to compare it against. A sufficiently advanced civilisation might preserve records. But **records are not evidence in the scientific sense** — a claim that cannot in principle be checked against new observation has a different epistemic status, whatever its provenance.

### 3.2 The uncomfortable corollary

If cosmological evidence has an expiry date, the question is unavoidable: **what has already expired for us?**

This is not idle. There are concrete instances.

**Anything from before recombination is invisible in photons.** The universe was opaque; no electromagnetic observation can reach behind $z = 1100$. That barrier is why primordial gravitational waves matter so much — they are the only known signal that penetrates it — and why their non-detection so far leaves the inflationary era untested at the level we would want.

**Modes larger than the observable universe are unobservable in principle**, so the primordial power spectrum is measured over about four decades in wavenumber out of an unknown, possibly infinite, range. Claims about what inflation did on much larger scales are extrapolations.

**Objects already beyond our event horizon** — anything currently at a comoving distance beyond about $16.5$ billion light years — can never be observed no matter how long we wait or how good the instruments become. We can see their past light, but nothing they do from now on will ever reach us.

So we are not in a privileged position of complete information; we are in a *better* position than the future observer, on a monotonically degrading curve. The honest formulation is that **cosmology is an observational science with a finite window, and we happen to be inside it.**

### 3.4 How much is already gone

The last point deserves a number, because the number is worse than most people expect.

Two horizons matter and they are frequently confused. The **particle horizon** is how far light has travelled since the beginning — the edge of what we can see — and it sits at a comoving distance of about $46$ billion light years. The **event horizon** is how far light emitted *now* will ever get, and integrating $c\,dt/a$ from today to infinity gives

$$D_{\rm eh} = \frac{c}{H_0}\int_1^{\infty}\frac{da}{a^2E(a)} = 5084\ \text{Mpc} = 16.6\ \text{billion light years}.$$

These are very different quantities and the ratio is the point. **The volume we can still influence, or that can still influence us, is**

$$\left(\frac{16.6}{46.2}\right)^3 = 0.046,$$

**about $4.6\%$ of the volume we can see.** More than $95\%$ of the observable universe is already causally out of reach: we see its past and will never see its future.

In redshift terms the boundary is startlingly close. Solving for the redshift at which comoving distance equals $D_{\rm eh}$ gives

$$z \approx 1.8.$$

**Every galaxy observed at redshift beyond about $1.8$ is already gone.** Not gone in the future — gone now, in the sense that no signal we emit today will ever arrive there, and nothing that happens there today will ever be seen here. The light we are collecting from them left long ago and is the last we will ever have of them; what those galaxies are doing at this moment is permanently unknowable, and the deep fields that have done so much to establish modern cosmology are almost entirely images of objects we have already lost.

The number degrades. As expansion continues, $D_{\rm eh}$ stays near $17$ billion light years while the particle horizon grows, so the reachable fraction falls monotonically toward zero. **The erasure is not a future event; it is a process, it is well advanced, and it is measurable.**

### 3.3 What this does and does not license

It does *not* license the conclusion that our cosmology is probably wrong in some analogous way. The future observer's error is diagnosable and specific — they lack access to a class of observation we have, and we can say exactly which. Symmetric humility is not the same as symmetric ignorance.

What it does license is a specific methodological habit: **when a theory depends on evidence that a process could destroy, ask whether that process has been running.** Applied here, the answer is that expansion destroys cosmological evidence and expansion has been running for $13.8$ billion years, so the question of what has been destroyed is a legitimate technical one with partly known answers — the pre-recombination photon barrier, super-horizon modes, objects past the event horizon — rather than a rhetorical flourish.

```checkpoint
q: Roughly what fraction of the currently observable universe is still causally reachable — that is, could receive a signal sent today?
a: All of it, by definition: if we can see it, light can travel between us
x: Seeing something means its *past* light reached us. Whether a signal sent *now* can reach it is a separate question with a different answer.
a*: About $5\%$, since the event horizon is at $16.6$ Gly comoving while the particle horizon is at $46$ Gly
a: About $36\%$, the ratio of the two horizon distances
x: The ratio of distances is $0.36$, but the comparison is of volumes, so it must be cubed: $0.36^3 = 0.046$.
a: None of it, since accelerating expansion has already disconnected everything outside the Local Group
x: Not yet — the disconnection is progressive. Objects within $z\approx1.8$ remain reachable today.
hint: Compare the particle horizon with the event horizon, and remember that a fraction of the sky is a fraction of a volume.
why: The particle horizon — how far light has travelled since the beginning — sits at a comoving distance of about $46$ billion light years and defines what we can see. The event horizon — how far light emitted *today* will ever get — is $D_{\rm eh} = (c/H_0)\int_1^\infty da/(a^2E) = 16.6$ billion light years. The ratio of volumes is $(16.6/46.2)^3 = 0.046$, so **more than $95\%$ of the observable universe is already causally out of reach**. In redshift terms the boundary is at $z \approx 1.8$: every galaxy observed beyond that redshift is already permanently disconnected, meaning nothing we do now can ever affect it and nothing happening there now will ever be seen here. The deep-field images that underpin much of modern cosmology are therefore almost entirely pictures of objects we have already lost. The fraction falls monotonically, because $D_{\rm eh}$ stays near $17$ Gly while the particle horizon grows — the erasure described in this chapter is not a future event but an advanced and measurable process.
---
q: A future observer at $t = 10^{12}$ years concludes they inhabit a static, eternal, single-galaxy universe. What is the correct assessment of their reasoning?
a: They have reasoned badly; the helium abundance alone should tell them otherwise
x: Anomalous helium is a genuine clue, but by then successive stellar generations have reprocessed the gas, and a clue is not the same as a measurement of expansion.
a*: Their reasoning is sound and their conclusion is false, because the observations that would correct it have been physically destroyed rather than overlooked
a: Their conclusion is actually correct for their epoch, since the universe really will be static by then
x: It will be expanding exponentially, faster than at any earlier time. What is absent is anything to measure it against, not the expansion itself.
a: The scenario is incoherent, since a civilisation would preserve records of the earlier universe
x: Records may well survive, but a claim that cannot in principle be checked against new observation has a different epistemic standing from a measurement.
hint: Distinguish between an error of inference and an absence of evidence.
why: The future observer has excellent instruments and sound method, and every observation available to them is consistent with a static, eternal, single-galaxy cosmos: no external galaxies remain within the event horizon, the CMB has redshifted below any detectable level, primordial abundances have been overwritten by stellar processing, and the one galaxy they inhabit is gravitationally bound and so does not partake in the Hubble flow. Their error is not one of reasoning but of access — **the evidence has been destroyed by the very expansion it would attest to**. This matters for us in a specific and limited way. It does not show that our own cosmology is probably wrong by analogy: we can name exactly which observations the future observer lacks, and symmetric humility is not symmetric ignorance. What it does show is that the availability of evidence is itself a physical process with a lifetime, which converts questions like "what has already been erased for us?" from rhetoric into technical questions with partial answers — the pre-recombination photon barrier, super-horizon modes, and everything beyond $z\approx1.8$.
```

{{image: Timeline of the far future | The projected sequence of eras, from the exhaustion of star formation through the degenerate era, black hole evaporation and the approach to a de Sitter thermal floor. The horizontal axis spans some ninety orders of magnitude in time — a range comparable to that between the Planck time and the present age of the universe — and the confidence attaching to different portions varies enormously: the earliest stages follow from stellar physics checked against observation, while the latest depend on unmeasured predictions such as Hawking evaporation and on whether the proton decays at all.}}

## 4. The stelliferous era ends

### 4.1 Gas runs out

Star formation requires cold gas. Each generation locks a fraction of its mass permanently into white dwarfs, neutron stars and black holes, and returns the rest enriched. The Milky Way currently forms stars at $1$–$2\,M_\odot$ per year from a reservoir of a few $10^9\,M_\odot$, which naively lasts a few billion years; recycling extends this greatly, and the merger with Andromeda will consume much of it in a burst.

Across the Local Group, star formation dwindles to negligible rates within $10^{12}$–$10^{14}$ years. The last stars to form will be low-mass.

### 4.2 The last stars

Stellar lifetime scales roughly as $M/L \propto M^{-2.5}$, so the smallest stars live longest. A star at the hydrogen-burning limit of $0.08\,M_\odot$ radiates about $10^{-4}\,L_\odot$ and — being fully convective, so that essentially all of its hydrogen is available rather than just a core fraction — survives for of order $10^{12}$–$10^{13}$ years.

These stars have an unusual property: **they never become red giants.** Convection keeps them mixed, so they burn nearly all their hydrogen, contract, and fade directly into helium white dwarfs. The last light in the universe will come from small, dim, blue-white stars that no one has ever observed in that state, because the universe is not yet old enough for a single one of them to have finished.

By roughly $10^{14}$ years the last stars have gone out. The universe becomes dark, in the ordinary sense of the word, for the first time since recombination.

## 5. The degenerate era

From $10^{14}$ to perhaps $10^{40}$ years, the universe consists of stellar remnants: white dwarfs cooling to black dwarfs, neutron stars, black holes, brown dwarfs and unbound planets.

### 5.1 Dynamical dissolution

Gravitational systems are not permanent. Two-body encounters gradually redistribute energy, and the statistical outcome is that some objects are ejected to infinity while others sink inward — evaporation. The timescale is the relaxation time,

$$t_{\rm relax} \sim \frac{0.1\,N}{\ln N}\,t_{\rm cross},$$

which for a galaxy of $N \sim 10^{11}$ stars and a crossing time of $\sim10^{8}$ years gives $\sim4\times10^{16}$ years. Over roughly $10^{19}$–$10^{20}$ years, galaxies dissolve: most remnants are ejected into intergalactic space, and a residue collapses into the central black hole.

Planetary systems dissolve on similar principles, both from passing-star encounters and from gravitational radiation. An Earth-like orbit decays by gravitational-wave emission in about $10^{20}$ years; a $10$ kpc galactic orbit, in about $10^{33}$ years — far longer than dynamical ejection takes, so relaxation wins.

### 5.2 If protons decay

If the proton has a finite lifetime $\tau_p \sim 10^{34}$–$10^{40}$ years, then by $\sim10^{40}$ years all ordinary matter has evaporated into positrons, neutrinos and photons. White dwarfs and neutron stars are luminous at a level of a few hundred watts, powered by their own decay. Nothing made of baryons survives.

**Only black holes are immune**, having no baryons to lose.

### 5.3 If protons do not decay

Then matter persists, and much slower processes take over. Quantum tunnelling drives nuclei toward iron on a timescale of order $10^{1500}$ years, converting stellar remnants to iron spheres. Tunnelling can then collapse those spheres into black holes on timescales like $10^{10^{76}}$ years — numbers so large that the notation itself changes, and where the distinction between "extremely long" and "never" stops being physically meaningful.

**The bifurcation here is genuine and unresolved.** It rests on an experimental question — does the proton decay — that has been pursued for forty years without an answer, and the two branches differ by more than a thousand orders of magnitude.

```checkpoint
q: Why do the lowest-mass stars, at about $0.08\,M_\odot$, live for $10^{12}$–$10^{13}$ years rather than merely somewhat longer than the Sun?
a: They have more hydrogen relative to their luminosity because they accrete gas continuously
x: They do not accrete appreciably; their longevity comes from the fuel they were born with and how slowly they consume it.
a*: Their luminosity is about $10^{-4}\,L_\odot$ and they are fully convective, so nearly all their hydrogen is available rather than only a core fraction
a: They burn helium rather than hydrogen, which is a slower reaction
x: They are below the mass required to ignite helium at all; they burn hydrogen and then fade.
a: Time dilation in their strong gravitational fields slows their evolution
x: Surface gravitational redshift for a main-sequence M dwarf is of order $10^{-6}$ — utterly negligible.
hint: Lifetime scales as fuel divided by burn rate; consider both factors separately.
why: Two effects multiply. Luminosity falls steeply with mass — roughly $L \propto M^{3.5}$ on the lower main sequence — so a $0.08\,M_\odot$ star radiates about $10^{-4}\,L_\odot$, meaning it consumes fuel about ten thousand times more slowly than the Sun despite having only about a twelfth the mass. On top of that, such stars are **fully convective**: the entire star circulates, so essentially all of its hydrogen reaches the burning region, whereas the Sun will exhaust only its inner $\sim10\%$ before leaving the main sequence. The combination gives lifetimes of order $10^{12}$–$10^{13}$ years, a thousand times the current age of the universe. A striking consequence is that **not a single such star has ever finished its life** — every one ever formed is still burning — so their end state, a slow contraction into a helium white dwarf with no red giant phase at all, is a purely theoretical prediction with no observational check available now or for a very long time.
---
q: Which of the following would survive if the proton has a finite lifetime of $\sim10^{34}$ years?
a: White dwarfs, which are supported by degeneracy pressure rather than by nuclear reactions
x: Degeneracy pressure supports the star against gravity; it does nothing to protect the constituent baryons from decaying.
a*: Black holes, which contain no baryons to lose and are therefore unaffected
a: Neutron stars, since neutrons bound in nuclear matter are stabilised
x: Bound neutrons are stabilised against ordinary beta decay, not against baryon-number-violating decay, which is the process in question.
a: Nothing at all — proton decay would end the universe
x: It removes ordinary matter, but black holes persist and continue evaporating for another $10^{60}$ years or more.
hint: Ask which objects are made of baryons and which are not.
why: Proton decay, if it occurs, removes baryon number from everything made of baryons — white dwarfs, neutron stars, planets, brown dwarfs, and any surviving gas — converting them to positrons, neutrinos and photons over roughly $10^{40}$ years. During this stage the remnants glow faintly, at a few hundred watts, powered by their own dissolution. **Black holes are the exception**: whatever fell in, a black hole is characterised only by mass, charge and angular momentum, and it contains no baryons to decay. They therefore outlast everything else, disappearing only via Hawking radiation on timescales from $10^{67}$ years for a stellar-mass hole to $10^{103}$ years for the largest. The whole question is unresolved experimentally: Super-Kamiokande has excluded proton lifetimes below $2.4\times10^{34}$ years in the favoured decay channel, which kills the simplest grand unified models but leaves both branches — decay at some longer lifetime, or exact baryon number conservation — open. The two branches differ by more than a thousand orders of magnitude in when ordinary matter disappears.
```

## 6. The black hole era

### 6.1 Hawking evaporation

A black hole radiates thermally at

$$T_H = \frac{\hbar c^3}{8\pi G M k_B},$$

which for one solar mass is $6.2\times10^{-8}$ K — far colder than the present CMB, which is why astrophysical black holes today *absorb* far more than they emit and grow rather than shrink. That balance flips when the CMB drops below the hole's Hawking temperature, which for a solar-mass hole happens about $3\times10^{11}$ years from now.

Because the temperature rises as the hole shrinks, evaporation accelerates and ends in a burst. The lifetime is

$$t_{\rm evap} = \frac{5120\,\pi\,G^2M^3}{\hbar c^4},$$

cubic in mass, which spreads the era across an enormous span:

| Black hole | Mass | Evaporation time |
|---|---|---|
| Stellar | $1\,M_\odot$ | $2.1\times10^{67}$ yr |
| Stellar | $10\,M_\odot$ | $2.1\times10^{70}$ yr |
| Sgr A* | $4.3\times10^{6}\,M_\odot$ | $1.7\times10^{87}$ yr |
| M87* | $6.5\times10^{9}\,M_\odot$ | $5.8\times10^{96}$ yr |
| Largest merged | $10^{12}\,M_\odot$ | $2.1\times10^{103}$ yr |

By roughly $10^{100}$ years the last black holes have evaporated.

### 6.2 The status of this prediction

Hawking radiation is a prediction of quantum field theory in curved spacetime — a semiclassical framework in which the gravitational field is classical and the matter fields quantum. It is widely accepted and the derivation has been reproduced by several independent routes.

**It has never been observed.** A stellar-mass black hole radiates at $10^{-8}$ K against a $2.7$ K background, so the effect is unobservable by many orders of magnitude, and primordial black holes light enough to be evaporating now have not been found. Laboratory analogues — sonic horizons in Bose–Einstein condensates, optical analogues — have produced results consistent with the analogous effect, which supports the underlying kinematics without testing gravity.

**The information paradox remains unresolved**, and its resolution could alter the late stages. The chapter's timeline for this era should therefore be read as the best current theoretical expectation, not as an established fact.

{{image: Hawking radiation | The mechanism by which a black hole loses mass, conventionally pictured as pair creation near the horizon with one member escaping and the other carrying negative energy inward. The temperature is inversely proportional to mass, so evaporation accelerates as the hole shrinks and ends in a burst, and the total lifetime scales as the cube of the mass — from about ten to the sixty-seven years for a solar-mass hole to ten to the hundred and third for the largest. For every astrophysical black hole today the process is entirely swamped: a solar-mass hole radiates at sixty-two billionths of a kelvin against a background of nearly three kelvin, so it absorbs far more than it emits and grows. The effect has never been observed.}}

```checkpoint
q: Why do astrophysical black holes today grow rather than evaporate?
a: Because Hawking radiation only begins once a black hole stops accreting matter
x: The radiation is continuous and depends only on the hole's mass; accretion is a separate, additive process.
a*: Because a solar-mass hole has a Hawking temperature of $6\times10^{-8}$ K, far below the $2.7$ K CMB, so it absorbs vastly more than it emits
a: Because Hawking radiation has been shown not to occur for large black holes
x: The derivation applies at all masses; it is the *rate* that becomes negligible, not the effect that vanishes.
a: Because the expansion of the universe supplies energy to the horizon
x: Expansion cools the CMB and therefore *helps* evaporation eventually; it does not feed the hole.
hint: Compare the black hole's Hawking temperature with the temperature of its surroundings.
why: The Hawking temperature $T_H = \hbar c^3/8\pi GMk_B$ is inversely proportional to mass, so a solar-mass black hole sits at $6.2\times10^{-8}$ K — some eight orders of magnitude colder than the $2.7255$ K cosmic microwave background bathing it. A cold object in a warmer bath absorbs more than it radiates, so the hole gains mass, which lowers its temperature further. Net evaporation only begins once the CMB has cooled below $T_H$, which for a solar-mass hole requires the background to fall by a factor of $4.4\times10^7$ — about $17.6$ $e$-folds of exponential expansion, or roughly $310$ billion years from now. Only then does the $10^{67}$-year evaporation clock effectively start. The inverse mass dependence also explains the ordering of the black hole era: bigger holes are colder, evaporate later, and last longest, with lifetimes scaling as $M^3$ across the range from $10^{67}$ to $10^{103}$ years.
---
q: What does the de Sitter horizon temperature $T_{\rm dS} = 2.2\times10^{-30}$ K imply about the phrase "heat death"?
a: Nothing; it is far too small to matter physically
x: It matters precisely because it is non-zero: it is a floor, and a floor changes the character of the final state.
a*: That the universe approaches thermal equilibrium at a small but non-zero temperature rather than absolute zero, so "heat death" means the exhaustion of free energy gradients, not of heat
a: That the universe will eventually reheat and begin a new cycle
x: A constant temperature bath is not a reheating; there is no mechanism here for starting a new expansion phase.
a: That absolute zero is reached after about $1.2\times10^{12}$ years
x: That is when the CMB falls *to* the de Sitter floor, not to zero — and nothing cools below the floor thereafter.
hint: Ask what happens to a system placed in a bath at a fixed temperature it cannot cool below.
why: De Sitter space has a horizon, and horizons radiate: the associated temperature is $T = \hbar H_\infty/2\pi k_B = 2.2\times10^{-30}$ K, exactly analogous to Hawking radiation from a black hole horizon. It is a genuine thermal bath and it is a **floor** — nothing in the universe can cool below it. The CMB falls to that level after about $1.2\times10^{12}$ years and thereafter the universe sits at a fixed, tiny, non-zero temperature. So the final state is not absolute zero but **thermal equilibrium**, and what has died is not heat but the gradients that make heat usable: with everything at a single temperature there is no free energy, no work can be extracted, and no process that requires a temperature difference can run. "Equilibrium death" is the accurate description. The distinction is not merely semantic, because a finite-temperature equilibrium fluctuates, which is what makes Poincaré recurrence and the Boltzmann brain problem arise at all — a true zero-temperature state would have neither.
```

## 7. The dark era, and what "heat death" actually means

After the last black holes evaporate, the universe contains photons, neutrinos, electrons and positrons at extraordinarily low density, expanding exponentially.

### 7.1 The de Sitter floor

The phrase "heat death" suggests a march to absolute zero. That is not the prediction. De Sitter space has a horizon with a temperature

$$T_{\rm dS} = \frac{\hbar H_\infty}{2\pi k_B} = \frac{(1.055\times10^{-34})(1.82\times10^{-18})}{2\pi(1.381\times10^{-23})} = 2.2\times10^{-30}\ \text{K}.$$

This is a genuine thermal bath from the horizon, analogous to Hawking radiation, and it is a **floor**: nothing can cool below it. The CMB falls to this level after about $1.2\times10^{12}$ years, and the universe thereafter sits at a fixed, tiny, non-zero temperature.

The correct statement is therefore not that everything reaches absolute zero but that **the universe approaches thermal equilibrium at $2.2\times10^{-30}$ K**, with no free energy gradients left to do work. That is what heat death is: not cold, but *equilibrium*.

### 7.2 Recurrence, and where the argument breaks

A finite system at finite temperature fluctuates. Given long enough, arbitrarily improbable configurations recur — Poincaré recurrence — on timescales estimated at $10^{10^{10^{10^{10^{1.1}}}}}$ years for the observable patch. At these scales the notation is doing all the work and the physics is doing none.

The known failure of this reasoning is worth stating, because it is one of the few places where a far-future argument has actually produced a usable constraint. If the universe sits in thermal equilibrium for an unbounded time, fluctuations should produce far more *isolated observers with false memories* — Boltzmann brains — than ordinary observers embedded in low-entropy histories, simply because the former are enormously cheaper in entropy. **We are evidently not such fluctuations**, since our observations are coherent and our records mutually consistent.

That is an argument, not a proof, and its logic is delicate. But it is taken seriously enough that Boltzmann-brain domination is used as a criterion to *reject* cosmological models, and models that predict eternal de Sitter equilibrium with a finite entropy are disfavoured on exactly these grounds. It is the one place in this chapter where a claim about $10^{10^{50}}$ years feeds back into a judgement about theories we can otherwise test.

## 8. The alternatives

The timeline above assumes $w = -1$ exactly and a stable vacuum. Neither is established.

### 8.1 Big Rip

If $w < -1$ — phantom dark energy — the dark energy density *increases* with expansion, and the scale factor reaches infinity in finite time. The moment is

$$t_{\rm rip} = \frac{2}{3|1+w|\,H_0\sqrt{\Omega_\Lambda}}.$$

For $w = -1.1$ this gives $116$ Gyr from now; for $w = -1.2$, $58$ Gyr. As the moment approaches, the horizon shrinks below successively smaller scales and each bound structure is torn apart in turn: clusters, then galaxies, then planetary systems, then planets, then atoms, then nuclei — the last few milliseconds doing the last few steps.

Current constraints put $w$ within a few per cent of $-1$, so a rip within tens of billions of years is disfavoured but not excluded. Recent surveys have reported hints that $w$ may be *evolving*, in the direction of $w > -1$ now with $w < -1$ earlier — which would remove the Big Rip but also mean the timeline above is wrong in a different way.

### 8.2 Vacuum decay

If the electroweak vacuum is metastable, a bubble of true vacuum can nucleate by tunnelling and expand at nearly the speed of light, with the interior having different physical constants and no possibility of ordinary structure. There is no warning: the bubble wall arrives at essentially light speed.

Standard Model calculations with the measured Higgs and top masses put the vacuum in a metastable region of parameter space, with an estimated lifetime enormously exceeding the present age of the universe. **The calculation is sensitive to the top quark mass at the level of its current uncertainty** and to unknown physics at high scales, so this is a live theoretical question rather than a settled one — though not, on any reading, a practical concern.

### 8.3 The general lesson

The far future is not one prediction but a branching tree whose branch points are set by measurements we have not yet made: the equation of state of dark energy, the stability of the vacuum, the lifetime of the proton. **All three are experimentally addressable**, and each would collapse a large part of the tree. That is a more useful way to hold this material than as a fixed narrative.

```checkpoint
q: Why does phantom dark energy with $w < -1$ produce a Big Rip in finite time, whereas $w = -1$ does not?
a: Because $w<-1$ means the dark energy density is negative, and negative energy repels more strongly
x: The density stays positive; it is the *pressure* that is more negative than the density, which is what $w<-1$ means.
a*: Because for $w<-1$ the dark energy density increases as the universe expands, so $H$ grows rather than approaching a constant, and the feedback drives $a\to\infty$ in finite time
a: Because $w<-1$ violates causality, and the singularity is the mathematical signature of that violation
x: Phantom models do violate energy conditions and are theoretically unattractive, but the finite-time singularity follows from the density's growth, not from a causality argument.
a: Because $w = -1$ produces no expansion at all, so there is nothing to rip
x: $w=-1$ gives exponential expansion — the fastest sustained expansion in the standard model — but at a constant rate, which is precisely why it never diverges.
hint: Work out how $\rho \propto a^{-3(1+w)}$ behaves for $w = -1$ and for $w < -1$.
why: Dark energy density scales as $\rho \propto a^{-3(1+w)}$. For $w = -1$ the exponent is zero, so the density is constant, $H$ tends to the constant $H_0\sqrt{\Omega_\Lambda}$, and the expansion is exponential — $a\to\infty$ only as $t\to\infty$. For $w<-1$ the exponent is positive: **density grows with expansion**, which increases $H$, which accelerates expansion, which increases density further. That runaway reaches infinite scale factor at the finite time $t_{\rm rip} = 2/[3|1+w|H_0\sqrt{\Omega_\Lambda}]$ — about $116$ Gyr for $w = -1.1$ and $58$ Gyr for $w = -1.2$. As the moment approaches, the event horizon shrinks past successively smaller scales and each bound system is torn apart in order: clusters, galaxies, planetary systems, planets, atoms, nuclei, with the last several steps occupying the final fraction of a second. Current data put $w$ within a few per cent of $-1$, so a near-term rip is disfavoured but not excluded, and recent hints of an *evolving* $w$ point in a different direction again.
---
q: Which of the three branch points in the far-future timeline — the dark energy equation of state, vacuum stability, and proton lifetime — most drastically changes the length of the timeline?
a: The dark energy equation of state, since $w<-1$ ends the universe within $\sim100$ Gyr
x: A Big Rip is dramatic and does truncate everything, but the proton branch alters the timeline by a far larger factor.
a*: The proton lifetime, since decay removes all baryonic matter by $\sim10^{40}$ years while stability extends the matter era to $\sim10^{1500}$ years and beyond
a: Vacuum stability, since vacuum decay would destroy everything instantly
x: Vacuum decay is the most abrupt but its estimated timescale is so remote and so poorly constrained that it does not reorganise the timeline's structure.
a: They are comparable, each changing the timeline by a few orders of magnitude
x: The proton branch spans more than a thousand orders of magnitude — nothing else in the chapter comes close.
hint: Compare the numerical span each branch introduces, not how dramatic each sounds.
why: Ranking by the *magnitude* of the change rather than the drama: a Big Rip with $w = -1.1$ truncates everything at $116$ Gyr, which cuts short a timeline extending to $10^{100}$ years but is a single, decisive cut. Vacuum decay is abrupt but its timescale is remote and its estimate depends on the top quark mass at the level of current uncertainty. The **proton lifetime** does something larger: if the proton decays at $\sim10^{34-40}$ years, all baryonic matter has evaporated by roughly $10^{40}$ years and only black holes and radiation remain; if baryon number is exactly conserved, stellar remnants persist essentially intact and are converted to iron only by quantum tunnelling on timescales of order $10^{1500}$ years, with collapse to black holes at $10^{10^{76}}$ years. The two branches differ by more than a thousand orders of magnitude in when ordinary matter ceases to exist. It is also the branch most likely to be settled: proton decay is an active experimental programme with a current limit of $2.4\times10^{34}$ years and detectors under construction that will push it substantially further.
```

## 9. Pulling the thread

- **Cosmology has a shelf life.** Within $100$–$150$ Gyr, an observer here sees one galaxy in a static void: no external galaxies, no CMB, no redshift–distance relation. **The expansion destroys the evidence for the expansion**, and the resulting picture — static, eternal, single-galaxy — would be reached honestly and would be wrong.
- **The corollary is uncomfortable and legitimate.** Evidence has already been erased for us: the pre-recombination photon barrier, super-horizon modes, everything beyond our $16.5$ Gly event horizon. We are on a degrading curve, further along than the future observer only by degree.
- **The engine is de Sitter space.** $H \to H_0\sqrt{\Omega_\Lambda} = 56.2\ \text{km s}^{-1}\text{Mpc}^{-1}$, $e$-folding time $17.4$ Gyr, event horizon $17.4$ Gly, temperature floor $2.2\times10^{-30}$ K.
- **Heat death means equilibrium, not zero.** The de Sitter horizon supplies a genuine thermal bath below which nothing cools.
- **The timeline is a branching tree, not a narrative.** Its shape depends on three measurable unknowns — $w$, vacuum stability, proton lifetime — and the proton branch alone spans a thousand orders of magnitude.
- **Confidence is wildly uneven across the timeline** and should be tracked: the Sun's red giant phase is checked stellar physics; galaxy evaporation is standard dynamics; Hawking evaporation is an unmeasured semiclassical prediction; Poincaré recurrence is notation.
- **One far-future argument does real work.** Boltzmann-brain domination is used to reject cosmological models, making it the rare case where reasoning about $10^{10^{50}}$ years constrains theories we can otherwise test.

The transferable idea: **an observation is not a permanent possession, and the conditions that make evidence available are themselves physical processes with lifetimes.** We are used to treating the accessibility of data as fixed and our theories as provisional. The far future inverts that: the theory may be right and the evidence may be gone. This changes what to do about it — not to distrust current cosmology, but to notice that *the value of an observation depends on when it is possible to make it*, and that some observations have deadlines. Detecting primordial gravitational waves, cataloguing objects near our event horizon, measuring the dark energy equation of state precisely enough to know which branch we are on: these are not merely interesting, they are **time-limited**, and in a field where the window is measured in billions of years it is easy to forget that a window is what it is.

## 10. Further reading

{{book: Fred Adams and Greg Laughlin | The Five Ages of the Universe | 1999}}

{{book: Katie Mack | The End of Everything (Astrophysically Speaking) | 2020}}

{{book: Brian Greene | Until the End of Time | 2020}}

Beyond the books: Adams and Laughlin's 1997 review in *Reviews of Modern Physics* is the technical source for the whole era sequence and is more careful about assumptions than any popular retelling. Krauss and Scherrer's 2007 paper "The Return of a Static Universe and the End of Cosmology" is the original statement of the erasure argument and is short, clear and worth reading directly. Mack is the best accessible treatment of the alternatives, particularly vacuum decay, and is unusually honest about which scenarios are speculative.

## Problems

*Useful numbers: $H_0 = 67.66\ \mathrm{km\,s^{-1}Mpc^{-1}}$, $\Omega_m = 0.3111$, $\Omega_\Lambda = 0.6889$; $H_\infty = 56.2\ \mathrm{km\,s^{-1}Mpc^{-1}}$, $1/H_\infty = 17.4$ Gyr; $T_{\rm dS} = 2.2\times10^{-30}$ K; $T_H = \hbar c^3/8\pi GMk_B$, $T_H(1\,M_\odot) = 6.2\times10^{-8}$ K; $t_{\rm evap} = 5120\pi G^2M^3/\hbar c^4$, $t_{\rm evap}(1\,M_\odot) = 2.1\times10^{67}$ yr; $t_{\rm rip} = 2/[3|1+w|H_0\sqrt{\Omega_\Lambda}]$; $T_{\rm CMB} = 2.7255$ K; proton lifetime $> 2.4\times10^{34}$ yr; $t_{\rm relax}\sim0.1N t_{\rm cross}/\ln N$.*

**1.** *(The asymptotic state.)* **(a)** Derive $H_\infty = H_0\sqrt{\Omega_\Lambda}$ from the Friedmann equation. **(b)** Compute the $e$-folding time and the event horizon distance. **(c)** State what happens to a galaxy that crosses that horizon, and why "it becomes too faint to see" is an inadequate description.

**2.** *(Erasure.)* List the four independent observational pillars of the hot Big Bang and state, for each, the mechanism by which it becomes unavailable to a future observer and the approximate timescale.

**3.** *(Black hole scaling.)* **(a)** Given $t_{\rm evap} \propto M^3$ and $t_{\rm evap}(1\,M_\odot) = 2.1\times10^{67}$ yr, compute the evaporation time for a $10^{9}\,M_\odot$ black hole. **(b)** Explain why black holes today grow rather than evaporate. **(c)** Estimate when a solar-mass black hole begins net evaporation, given that the CMB cools as $1/a$ with $a \propto e^{t/17.4\,\mathrm{Gyr}}$.

**4.** *(Temperature floor.)* **(a)** Compute $T_{\rm dS} = \hbar H_\infty/2\pi k_B$. **(b)** Compute how long until the CMB falls to that value, given exponential expansion with a $17.4$ Gyr $e$-folding time. **(c)** Explain why "heat death" is a misleading name and give a better one.

**5.** *(Dynamical dissolution.)* **(a)** Estimate the relaxation time for a galaxy with $N = 10^{11}$ and $t_{\rm cross} = 10^8$ yr. **(b)** State the two possible fates of a star during relaxation. **(c)** Explain why gravitational radiation is not the dominant channel for removing stars from galaxies, given that it decays a $10$ kpc orbit in $\sim10^{33}$ yr.

**6.** *(The proton branch.)* **(a)** State the current experimental limit. **(b)** Describe the universe at $10^{50}$ years under each branch. **(c)** Explain why black holes are unaffected either way.

**7.** *(Big Rip.)* **(a)** Compute $t_{\rm rip}$ for $w = -1.05$ and $w = -1.2$. **(b)** Explain physically why $w < -1$ produces a finite-time singularity whereas $w = -1$ does not. **(c)** State the observational status of $w$ and what it would take to settle the question.

**8.** *(Assessing confidence.)* Rank these five predictions by how well established they are, and justify the ranking: the Sun becoming a red giant; the Local Group merging; galaxies evaporating dynamically; black holes evaporating by Hawking radiation; Poincaré recurrence.

**9.** *(The epistemics.)* **(a)** State the erasure argument in three sentences. **(b)** Give one thing it does *not* license concluding. **(c)** Give a concrete example of cosmological evidence that has already been destroyed or placed permanently out of reach, and say by what mechanism.

## Worked answers

**1.** **(a)** $H^2 = H_0^2(\Omega_m a^{-3} + \Omega_\Lambda)$; as $a\to\infty$ the matter term vanishes, leaving $H_\infty = H_0\sqrt{\Omega_\Lambda} = 67.66\sqrt{0.6889} = 56.2\ \mathrm{km\,s^{-1}Mpc^{-1}}$. **(b)** $1/H_\infty = 17.4$ Gyr; horizon $c/H_\infty = 17.4$ Gly. **(c)** It becomes **causally disconnected**: no signal emitted after the crossing ever reaches us, at any wavelength, however long we wait. "Too faint" implies a sensitivity problem soluble with a bigger telescope; this is a statement about the causal structure of spacetime and no instrument can address it.

**2.** *Hubble expansion* — external galaxies cross the event horizon, removing the sample entirely; $\sim100$–$150$ Gyr. *CMB* — redshifts as $1/a$ under exponential expansion until it falls below the de Sitter floor; undetectable in practice long before $1.2\times10^{12}$ yr. *Primordial abundances* — successive stellar generations reprocess the gas, overwriting the primordial deuterium and helium signature; $\sim10^{12}$–$10^{14}$ yr. *Large-scale structure* — there is nothing outside the bound Local Group left to survey; same timescale as the first.

**3.** **(a)** $(10^9)^3 = 10^{27}$, so $2.1\times10^{67}\times10^{27} = 2.1\times10^{94}$ yr. **(b)** $T_H(1\,M_\odot) = 6.2\times10^{-8}$ K is far below the CMB's $2.7$ K, so the hole absorbs vastly more than it radiates and grows. **(c)** Net evaporation starts when $T_{\rm CMB} = T_H$, requiring the CMB to fall by a factor $2.7255/6.2\times10^{-8} = 4.4\times10^{7}$; with $T\propto1/a$ and $a\propto e^{t/17.4\,\rm Gyr}$ this needs $\ln(4.4\times10^{7}) = 17.6$ $e$-folds, i.e. $\approx 307$ Gyr.

**4.** **(a)** $T = (1.055\times10^{-34})(1.82\times10^{-18})/[2\pi(1.381\times10^{-23})] = 2.2\times10^{-30}$ K. **(b)** Need a factor $2.7255/2.2\times10^{-30} = 1.2\times10^{30}$, i.e. $\ln(1.2\times10^{30}) = 69.4$ $e$-folds $\times\,17.4$ Gyr $= 1.2\times10^{12}$ yr. **(c)** "Heat death" implies a march to absolute zero, but the de Sitter horizon maintains a genuine thermal bath at $2.2\times10^{-30}$ K that nothing can cool below. The physical content is the disappearance of free energy gradients, not of temperature — "thermal equilibrium" or "equilibrium death" is the accurate description.

**5.** **(a)** $t_{\rm relax} = 0.1(10^{11})(10^{8})/\ln(10^{11}) = 10^{18}/25.3 = 4\times10^{16}$ yr. **(b)** Ejection to infinity if the encounter leaves it above escape velocity, or inward migration toward the centre if below — statistically both occur, so the system evaporates while a residue sinks into the central black hole. **(c)** Because $10^{33}$ yr for gravitational-wave decay is some sixteen orders of magnitude longer than the $\sim10^{17}$–$10^{20}$ yr on which relaxation ejects the star. The slower process never gets the chance; the star is gone first.

**6.** **(a)** Super-Kamiokande excludes $\tau_p < 2.4\times10^{34}$ yr in the favoured $p\to e^+\pi^0$ channel. **(b)** *Decay branch:* all baryonic matter has evaporated into positrons, neutrinos and photons; only black holes and radiation remain. *No-decay branch:* stellar remnants persist essentially intact, tunnelling only very slowly toward iron over $\sim10^{1500}$ yr. **(c)** A black hole is characterised by mass, charge and angular momentum only, with no baryons to lose; baryon number is not a property it carries, so a baryon-number-violating process has nothing to act on.

**7.** **(a)** $w = -1.05$: $t_{\rm rip} = 2/[3(0.05)(H_0\sqrt{0.6889})] = 232$ Gyr. $w = -1.2$: $2/[3(0.2)(\cdot)] = 58$ Gyr. **(b)** For $w = -1$ the dark energy density is constant, so $H$ tends to a constant and expansion is exponential — infinite scale factor in infinite time. For $w<-1$ the density *grows* with expansion, so $H$ grows, and the feedback drives $a\to\infty$ in finite time. **(c)** $w$ is measured within a few per cent of $-1$, disfavouring but not excluding a rip; recent hints of evolution point the other way. Settling it needs percent-level measurements of $w(z)$ over a range of redshift, which is the design goal of current and next-generation surveys.

**8.** Most to least secure: **(1)** *Sun becomes a red giant* — stellar evolution theory checked against millions of observed stars in every relevant phase. **(2)** *Local Group merges* — Newtonian dynamics of a measured bound system; the timing is uncertain but the outcome is not. **(3)** *Galaxies evaporate dynamically* — standard stellar dynamics with observationally verified relaxation physics, extrapolated by many orders of magnitude in time. **(4)** *Hawking evaporation* — a well-motivated theoretical prediction from quantum field theory in curved spacetime, derived by several routes, never observed, and with the information paradox unresolved. **(5)** *Poincaré recurrence* — assumes eternal equilibrium in a finite-entropy system, and at $10^{10^{10^{10^{10}}}}$ years the notation carries the argument rather than the physics.

**9.** **(a)** Accelerating expansion pushes all external galaxies beyond the event horizon and redshifts the CMB below detectability, while stellar processing overwrites primordial abundances. Within $\sim10^{12}$ years the only observations available in the Local Group are consistent with a static, eternal, single-galaxy universe. So the evidence for cosmology is destroyed by the process cosmology describes. **(b)** It does not license concluding that our own cosmology is probably wrong in some analogous way. The future observer's error is specific and diagnosable — we can name exactly which observations they lack — and symmetric humility is not symmetric ignorance. **(c)** Any electromagnetic signal from before recombination: the universe was opaque to photons until $z = 1100$, so no light from earlier can ever be received. Primordial gravitational waves are the only known signal that penetrates that barrier, which is why their detection matters so much and why their absence so far leaves the inflationary era genuinely untested.$duFuture_master$,
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
