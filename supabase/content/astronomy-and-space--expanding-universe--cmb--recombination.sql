-- Astronomy & Space · The Expanding Universe — The CMB — "Recombination".
-- Curated master for
-- astronomy-and-space/expanding-universe/cmb/recombination
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens The CMB block. Organised around recombination being a freeze-out
-- rather than an equilibrium transition, and around the CMB coming from
-- a shell rather than a surface. Three distinct events routinely
-- conflated - recombination, decoupling and last scattering; the Saha
-- calculation giving half-ionisation at 0.32 eV, a factor of 42 below
-- 13.6, by the same photon-count argument as the deuterium bottleneck;
-- why recombination is kinetically bottlenecked, since direct capture to
-- the ground state is self-defeating and only 2s two-photon decay at
-- 8.22 /s and Lyman-alpha escape by redshift work; the residual
-- ionisation x_e ~ 2e-4 as a freeze-out, computed from H/(alpha n_H);
-- decoupling at x_e ~ 1e-2 giving z = 1090, t = 372,000 yr; and the
-- last-scattering shell at dz ~ 80, some 46,000 years thick, with the
-- smoothing that follows. Also helium recombining first and removing
-- 14% of the electrons, letting Y_p be fitted from the damping tail; the
-- gas staying thermally locked to the CMB until z ~ 170 and then cooling
-- as (1+z)^2, which is why the Dark Ages 21 cm signal is in absorption;
-- and how z_* is measured from the acoustic peaks while tau stays poorly
-- determined through its degeneracy with A_s.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/cmb/recombination',
    'research',
    'advanced',
    'read',
    $cmbRec_master$> The universe did not become transparent at 13.6 eV, where hydrogen's ionisation energy says it should have. It became transparent at **0.26 eV — a factor of fifty lower**. And when it did, the electrons did not all disappear: about **two in every ten thousand** remained free, permanently, because the recombination reaction ran out of time before it ran out of electrons.

Both facts are consequences of arguments already met. The delay is the deuterium bottleneck again, with hydrogen in place of deuterium and the same $10^{9}$ photons per baryon doing the work. The leftover electrons are a freeze-out, exactly like the neutron-to-proton ratio. **This chapter is the previous block's machinery applied to the most consequential transition in cosmic history** — the one that produced the CMB, and with it most of what we know about the universe.

## Three events, routinely conflated

Start by separating things that are usually run together, because they happen at different times and mean different things.

**Recombination** is the formation of neutral atoms: free electrons and protons binding into hydrogen. It is a statement about matter.

**Decoupling** is the moment photons stop scattering appreciably off free electrons — when the Thomson scattering rate drops below the expansion rate. It is a statement about radiation.

**Last scattering** is where a given CMB photon happened to scatter for the final time before reaching us. It is a statement about a photon's history, and because it is probabilistic it defines not a surface but a **shell of finite thickness**.

These are close in time but not identical, and the differences matter. Recombination is well under way before decoupling occurs, because Thomson scattering remains effective even when only about **one per cent** of electrons are still free. And last scattering is spread over a range of redshift, so the "surface" from which the CMB comes is about **46,000 years thick** — a point taken up at the end of this chapter, because it sets a floor on how sharp any CMB feature can be.

The name "recombination" is, incidentally, a misnomer that has stuck. The electrons and protons had never previously been combined; this was the first time. Alpher and Herman used it in the 1940s by analogy with laboratory plasma physics, and it was never dislodged.

## Why 0.26 eV and not 13.6

Hydrogen's ionisation energy is 13.6 eV. Naively, once the typical photon carries less than that, atoms should survive. That corresponds to a temperature around $1.6\times10^{5}$ K, reached at $z \approx 58{,}000$, well before matter–radiation equality.

Recombination in fact occurs at about **3,000 K**, $kT \approx 0.26$ eV, at $z \approx 1090$. **The delay is a factor of over fifty in temperature.**

The reason is exactly the deuterium bottleneck of two chapters ago. **There are $1.6\times10^{9}$ photons for every baryon.** Any photon above 13.6 eV ionises a hydrogen atom, and even when the mean photon energy is far below that, the exponential tail of the blackbody distribution still contains more than enough photons to keep the gas ionised. Neutral hydrogen survives only when the number of ionising photons *per atom* falls below one.

The quantitative statement is the **Saha equation**, which gives the equilibrium ionisation fraction $x_e$:

$$\frac{x_e^2}{1-x_e} = \frac{1}{n_H}\left(\frac{m_e kT}{2\pi\hbar^2}\right)^{3/2} e^{-B/kT},$$

with $B = 13.6$ eV. Two things fight here. The exponential drives ionisation down as the universe cools. The prefactor — the ratio of the electron's thermal phase-space volume to the hydrogen number density — is enormous, of order $10^{15}$ at these conditions, and pushes ionisation up. Recombination waits until the exponential overcomes it.

Solving numerically with $n_{H,0} = 0.19$ m⁻³ gives:

| $z$ | $T$ (K) | $kT$ (eV) | $x_e$ (Saha) |
| --- | --- | --- | --- |
| 1400 | 3,818 | 0.329 | 0.65 |
| 1370 | 3,735 | 0.322 | 0.50 |
| 1300 | 3,546 | 0.306 | 0.21 |
| 1200 | 3,273 | 0.282 | 0.039 |
| 1090 | 2,974 | 0.256 | 0.004 |

Half-ionisation at $kT = 0.32$ eV — **a factor of 42 below the binding energy** — and the transition is sharp, falling from 65% to 4% ionised over a redshift interval of 200.

Compare with deuterium. There the estimate $kT \sim B/\ln(1/\eta)$ worked well; here it gives $13.6/21.2 = 0.64$ eV, twice the correct answer. The difference is that hydrogen's Saha prefactor is much larger than deuterium's, because the electron is light and its thermal phase-space volume correspondingly huge, so the effective number of ionising agents per atom exceeds $1/\eta$. **The logarithmic argument gives the right structure and the wrong coefficient**, which is what an order-of-magnitude argument is for — and knowing which part of an estimate is trustworthy is part of using it.

```checkpoint
q: Hydrogen's ionisation energy is 13.6 eV, but recombination occurs at $kT \approx 0.3$ eV. Why the factor of over forty?
a: Because the hydrogen atoms are moving, so their kinetic energy adds to the photon energy in the collision frame
x: Thermal motion of the atoms is a small correction at these temperatures and cannot account for a factor of forty.
a*: Because there are $1.6\times10^{9}$ photons per baryon, so the exponential tail of the blackbody distribution above 13.6 eV still contains enough photons to keep the gas ionised long after the mean photon energy has fallen below threshold
a: Because recombination is slowed by the time it takes electrons to cascade down to the ground state
x: That kinetic bottleneck is real and matters for the *residual* ionisation, but the factor of forty in temperature is set by the photon count, not by cascade rates.
a: Because the universe is expanding, so atoms are pulled apart before they can bind
x: Expansion has no effect on a bound system; the binding energy vastly exceeds any expansion-related effect.
hint: Count the ionising photons per atom, not their typical energy.
why: This is the deuterium bottleneck again with hydrogen in place of deuterium. With $\eta = 6\times10^{-10}$ there are $1.6\times10^{9}$ photons per baryon, and any one above 13.6 eV ionises an atom. Even when the mean photon energy is a fiftieth of that, the Wien tail still supplies more than one ionising photon per atom, so the gas stays ionised. The Saha equation makes this quantitative: half-ionisation occurs at $kT = 0.32$ eV, a factor of 42 below the binding energy. The simple estimate $B/\ln(1/\eta) = 0.64$ eV overshoots by two, because hydrogen's Saha prefactor — the electron's thermal phase-space volume over the hydrogen density — is larger than the naive photon count. The structure of the argument is right; the coefficient needs the full equation.
```

## Helium goes first

Hydrogen is not the only species recombining, and the order matters more than it first appears.

Helium is 24.5% of the baryonic mass, which at four nucleons per atom is $n_{\rm He}/n_{\rm H} = (Y_p/4)/(1-Y_p) = 0.081$ by number. Fully ionised, it contributes two electrons each, so **helium supplies 14% of all free electrons** — $1 + 2(0.081) = 1.162$ electrons per hydrogen nucleus.

Its ionisation energies are higher than hydrogen's: 54.4 eV to remove the second electron, 24.6 eV for the first. So helium recombines **earlier**, in two distinct stages:

| Transition | Ionisation energy | Approximate redshift | $T$ |
| --- | --- | --- | --- |
| He III → He II | 54.4 eV | $z \approx 6{,}000$ | ~16,000 K |
| He II → He I | 24.6 eV | $z \approx 2{,}500$ | ~7,000 K |
| H II → H I | 13.6 eV | $z \approx 1{,}370$ | ~3,700 K |

By the time hydrogen begins to recombine, helium is already entirely neutral and has removed its 14% of the electron supply. This is not a negligible correction. **The free-electron density controls the photon mean free path, which controls Silk damping, which controls the shape of the CMB's damping tail** — so the helium abundance enters the predicted power spectrum directly.

That is worth noticing as a matter of method, because it closes a loop. The Big Bang Nucleosynthesis chapter established $Y_p = 0.245$ from a calculation at one second, checked against metal-poor H II regions. The same number now appears as an input to the CMB's damping tail at 372,000 years, where it can be **fitted independently**. CMB data alone give $Y_p = 0.24 \pm 0.02$ — less precise than the astronomical measurement, but derived from entirely different physics and in agreement. **A quantity predicted by nuclear physics at one second is measured again, by photon diffusion, four hundred thousand years later.**

Helium recombination is also where the non-equilibrium treatment was first shown to matter at the precision cosmology requires. The He II → He I transition has its own bottleneck — an intercombination line, forbidden in the same spirit as hydrogen's two-photon decay — and getting it wrong shifts the predicted damping tail by more than Planck's error bars. This is why recombination codes track helium in as much detail as hydrogen.

```checkpoint
q: Helium recombines well before hydrogen, having removed 14% of the free electrons by $z \approx 2{,}500$. Why does this matter for the CMB?
a: It does not appreciably — helium is a minor constituent and the effect is below current sensitivity
x: The effect exceeds Planck's error bars on the damping tail, which is why recombination codes model helium in full detail.
a*: Because the free-electron density sets the photon mean free path, which sets the scale of Silk damping — so the helium abundance enters the predicted shape of the damping tail directly
a: Because helium recombination releases photons that contaminate the CMB spectrum
x: Recombination lines from helium are far too weak to affect the CMB spectrum measurably; the effect is through the electron density, not through emission.
a: Because neutral helium absorbs CMB photons at the relevant wavelengths
x: Neutral helium has no transitions in the relevant band at these temperatures; it matters by what it removes from the plasma, not by what it absorbs.
hint: Ask what free electrons do to photons, and what happens when 14% of them disappear early.
why: With $Y_p = 0.245$ there are 0.081 helium nuclei per hydrogen nucleus, each contributing two electrons when fully ionised, so helium supplies $2(0.081)/1.162 = 14\%$ of the free electrons. Its higher ionisation energies — 54.4 and 24.6 eV — mean it recombines first, at $z \approx 6{,}000$ and $z \approx 2{,}500$. Removing those electrons lengthens the photon mean free path, which increases the distance photons diffuse during recombination and therefore the scale below which anisotropies are erased. The helium abundance consequently appears in the predicted damping tail, and can be fitted from the CMB alone: $Y_p = 0.24 \pm 0.02$, in agreement with the nucleosynthesis value derived from physics at one second. The same number, measured twice, four hundred thousand years and two disciplines apart.
```

## Recombination is not an equilibrium process

The Saha equation assumes equilibrium, and it fails. Understanding why is the heart of this chapter, and it is one of the more elegant arguments in cosmology.

Consider what happens when a free electron is captured directly into hydrogen's ground state. The transition releases a photon of at least 13.6 eV — **which promptly ionises a neighbouring hydrogen atom.** Net progress: zero. In a medium that is optically thick to Lyman-continuum photons, and this one overwhelmingly is, **direct recombination to the ground state accomplishes nothing at all.**

So recombination must proceed by capture into an excited state followed by a cascade downward. But the last step of any cascade is the same problem in a different guise: the $2p \to 1s$ transition emits a Lyman-α photon at 10.2 eV, which is immediately reabsorbed by another ground-state atom, re-exciting it. The medium is enormously optically thick at Lyman-α — an optical depth of order $10^{8}$.

**Recombination is therefore blocked at the last step**, and it proceeds only through two narrow channels:

**Two-photon decay from 2s.** The $2s$ state cannot decay to $1s$ by a single photon — the transition is forbidden by parity and angular momentum — but it can emit **two** photons whose energies sum to 10.2 eV, neither of which can re-excite a ground-state atom. The rate is $\Lambda_{2s \to 1s} = 8.22\ \mathrm{s}^{-1}$: fast by cosmological standards, glacial by atomic ones, where allowed transitions run at $10^{8}$–$10^{9}$ s⁻¹. **This forbidden transition, eight orders of magnitude slower than an ordinary one, is the principal route by which the universe became neutral.**

**Redshifting out of the line.** A Lyman-α photon that redshifts out of the line's narrow frequency width before being reabsorbed escapes permanently. The expansion is doing the work, and the escape rate is proportional to $H$.

Both are slow, and both make recombination **kinetically limited rather than thermodynamically limited.** The Saha prediction — an equilibrium ionisation fraction plunging exponentially toward zero — is not what happens. Recombination lags behind equilibrium, falls further behind as the universe expands, and then stops.

```checkpoint
q: Why is direct recombination to hydrogen's ground state ineffective in the early universe?
a: Because the cross-section for direct capture to $n=1$ is negligible compared with capture into excited states
x: Direct capture to the ground state has a perfectly respectable cross-section; the problem is what happens to the photon it emits.
a*: Because it emits a photon of at least 13.6 eV, which is immediately absorbed by a neighbouring hydrogen atom and ionises it — so the net number of neutral atoms is unchanged
a: Because the ground state is already occupied by the electrons that recombined earlier
x: There is no such exclusion — the gas contains vastly more hydrogen nuclei than can be described this way, and Pauli blocking is irrelevant at these densities.
a: Because the binding energy is released as kinetic energy rather than radiation, reheating the gas
x: The energy is released radiatively; the difficulty is the fate of that radiation, not its form.
hint: Follow the emitted photon and ask what it does next.
why: A capture straight into $n = 1$ releases a Lyman-continuum photon carrying at least the 13.6 eV binding energy. The medium is overwhelmingly optically thick to such photons, so it is absorbed almost at once by another ground-state atom, ionising it. One atom formed, one destroyed: no net progress. Recombination must therefore proceed by capture into an excited state and a cascade down — but the final step, $2p \to 1s$, emits a Lyman-α photon into a medium with an optical depth of order $10^{8}$ at that line, and it too is reabsorbed. The universe becomes neutral only through two narrow channels: forbidden two-photon decay from $2s$ at 8.22 s⁻¹, and Lyman-α photons redshifting out of the line before reabsorption. Both are slow, which is what makes recombination a kinetic rather than an equilibrium problem.
---
q: The $2s \to 1s$ two-photon decay runs at 8.22 s⁻¹, some eight orders of magnitude slower than an allowed atomic transition. Why is such a slow process the dominant recombination channel?
a: Because it is the only transition energetically permitted from $2s$ at these temperatures
x: The energy is available for other routes; what excludes them is selection rules and reabsorption, not energetics.
a*: Because the fast routes are self-defeating — their photons are reabsorbed — while the two photons from $2s$ share the 10.2 eV between them, so neither can re-excite a ground-state atom and both escape
a: Because the $2p$ state is not populated at these densities, leaving $2s$ as the only available route
x: Collisional and radiative processes keep $2s$ and $2p$ in near-equilibrium; $2p$ is populated, but its decay photons do not escape.
a: Because the expansion rate is so low that even an 8.22 s⁻¹ process is fast in comparison
x: True and important — it is why the channel works at all — but it does not explain why the *faster* channels fail, which is the actual question.
hint: Compare not the rates but the fates of the emitted photons.
why: Speed is worthless if the product is undone. The allowed $2p \to 1s$ transition is fast, but its Lyman-α photon meets an optical depth of order $10^{8}$ and is reabsorbed, re-exciting another atom. The forbidden two-photon decay from $2s$ shares the 10.2 eV between two photons, neither of which is at a resonance, so both escape and the neutral atom stays neutral. A slow irreversible channel beats a fast reversible one whenever the reverse reaction is efficient — which is a general point about kinetics, not a peculiarity of hydrogen. The other working channel is likewise irreversible for a cosmological reason: Lyman-α photons that redshift out of the line's narrow width before reabsorption cannot come back.
```

{{image: Recombination (cosmology) | The ionisation fraction of the intergalactic medium through the recombination epoch. The equilibrium Saha prediction falls exponentially toward zero, but the actual ionisation fraction lags behind it and then levels off, freezing at a residual value of a few parts in ten thousand. The departure occurs because recombination is limited by two slow channels — forbidden two-photon decay from the 2s state and Lyman-α photons redshifting out of the line — rather than by thermodynamics.}}

## The electrons that never recombined

Now the payoff, and it is a freeze-out of exactly the kind the Early Universe chapter described.

The recombination rate per unit volume is $\alpha n_e n_p = \alpha n_H x_e^2$, so the rate per electron is $\Gamma = \alpha n_H x_e$. This falls as recombination proceeds — both because $n_H$ dilutes and because $x_e$ itself is dropping. Meanwhile the expansion rate $H$ falls more slowly. **The two curves cross, and when they do, recombination stops.**

Setting $\alpha n_H x_e = H$ gives the frozen residual:

$$x_e \approx \frac{H}{\alpha n_H}.$$

At $z = 1090$: $n_H = 2.5\times10^{8}$ m⁻³, $H = 5.1\times10^{-14}$ s⁻¹, and the case-B recombination coefficient at 3,000 K is $\alpha \approx 7\times10^{-19}$ m³ s⁻¹. So

$$x_e \approx \frac{5.1\times10^{-14}}{(7\times10^{-19})(2.5\times10^{8})} = 3\times10^{-4}.$$

The full calculation, which includes the two-photon and Lyman-α escape bottlenecks properly, gives $x_e \approx 2\times10^{-4}$. **About one electron in five thousand never found a proton, and never will.**

This residue is not a curiosity. It has three consequences that shape everything the next two chapters discuss:

**Scattering never entirely stops.** A small but non-zero optical depth persists after decoupling, and it matters for the polarisation signal and for the precision modelling that turns the CMB into cosmological parameters.

**Recombination's details are a systematic in cosmology.** The predicted CMB power spectrum depends on the shape of the visibility function, which depends on the recombination history, which depends on the atomic physics of hydrogen and helium at the per-cent level. This is why codes such as RECFAST and CosmoRec exist, tracking hundreds of atomic levels — the theory has to be more accurate than the measurement, and CMB measurements are very accurate indeed.

**The residual electrons seeded later chemistry.** They catalysed the formation of molecular hydrogen, which was the only effective coolant available in metal-free gas, and therefore the enabler of the first star formation. **Two electrons in ten thousand, left over because a reaction ran out of time, are part of why there are stars.**

```checkpoint
q: Why does a residual ionisation fraction of about $2\times10^{-4}$ survive, when the Saha equation predicts ionisation falling exponentially toward zero?
a: Because a small population of atoms is continuously re-ionised by starlight
x: There are no stars for another hundred million years; nothing is re-ionising the gas at this epoch.
a*: Because the recombination rate per electron, $\alpha n_H x_e$, falls below the expansion rate $H$ — so the reaction freezes out and the remaining electrons are stranded
a: Because the Saha equation neglects helium, which retains its electrons longer
x: Helium recombines earlier than hydrogen, not later, and is not the source of the residual free electrons.
a: Because the two-photon decay channel saturates once the $2s$ population is exhausted
x: The $2s$ population is continuously replenished; saturation is not the limiting factor, and the freeze-out condition is a rate comparison.
hint: This is the same criterion that fixed the neutron-to-proton ratio.
why: Saha describes equilibrium, and equilibrium requires the reaction to be fast compared with the expansion. The recombination rate per electron is $\Gamma = \alpha n_H x_e$, which falls both because the gas dilutes and because $x_e$ itself is dropping — so it declines faster than $H$ and the two cross. Setting $\alpha n_H x_e = H$ at $z = 1090$, with $n_H = 2.5\times10^{8}$ m⁻³, $H = 5.1\times10^{-14}$ s⁻¹ and $\alpha \approx 7\times10^{-19}$ m³ s⁻¹, gives $x_e \approx 3\times10^{-4}$; the full treatment gives $2\times10^{-4}$. It is the same freeze-out criterion that fixed the neutron-to-proton ratio at one second, applied to a different reaction. The residue matters: it keeps a small optical depth after decoupling, it makes recombination's atomic physics a systematic in CMB parameter estimation, and it catalysed the molecular hydrogen that cooled the first star-forming gas.
```

## Decoupling: when the photons stop caring

Recombination and decoupling are different questions, and they have different answers because Thomson scattering is efficient.

Photons scatter off free electrons with the Thomson cross-section $\sigma_T = 6.65\times10^{-29}$ m². The scattering rate per photon is $\Gamma = n_e \sigma_T c = x_e n_H \sigma_T c$, and decoupling occurs when this falls to $H$:

$$x_e = \frac{H}{n_H \sigma_T c} = \frac{5.1\times10^{-14}}{(2.5\times10^{8})(6.65\times10^{-29})(3\times10^{8})} = 1.0\times10^{-2}.$$

**Photons decouple when the gas is still 1% ionised.** By the Saha table, that happens at $z \approx 1090$ — after recombination is largely complete, but not after it is finished.

The effect is dramatic. Before decoupling, a photon's mean free path is about **2 kpc** — tiny compared with the horizon, so the universe is opaque and photons random-walk. After decoupling, the mean free path becomes effectively infinite: **CMB photons have travelled 13.8 billion years without interacting.**

The conventional figures are $z_* = 1090$, $T = 2{,}970$ K, and $t = 372{,}000$ years — a value often rounded to 380,000 in popular accounts, and this chapter will use the computed figure.

## The matter temperature parts company

One consequence of the residual electrons deserves its own section, because it determines whether the Dark Ages are observable at all.

Before decoupling, matter and radiation share a temperature: scattering is frequent enough to enforce it. Afterwards they need not, and they have different natural cooling laws. **Radiation cools as $T_\gamma \propto (1+z)$**, because redshifting stretches every wavelength alike and a blackbody stays a blackbody. **A non-relativistic gas expanding adiabatically cools as $T_{\rm gas} \propto (1+z)^2$**, because its energy is kinetic and momenta redshift as $1/a$, so energies fall as $1/a^2$.

So after decoupling the gas should cool twice as fast, in the logarithmic sense, and rapidly become colder than the radiation. It does — but not immediately.

The reason is the residual ionisation. Those $2\times10^{-4}$ leftover electrons continue to Compton-scatter off CMB photons, and each scattering exchanges energy. Because the photons vastly outnumber the electrons, the coupling drags the gas temperature along with the radiation rather than the reverse. The gas stays thermally locked to the CMB long after it has become optically thin.

The lock breaks when the Compton heating time, diluted by the small ionised fraction, exceeds the expansion time. Evaluating $t_C/x_e$ against $1/H$ with $t_C = 3m_ec/(4\sigma_T a_{\rm rad}T_\gamma^4)$ gives:

| $z$ | $t_C/x_e$ (s) | $1/H$ (s) | ratio |
| --- | --- | --- | --- |
| 500 | $4.7\times10^{12}$ | $6.8\times10^{13}$ | 0.07 |
| 200 | $1.8\times10^{14}$ | $2.8\times10^{14}$ | 0.65 |
| 150 | $5.7\times10^{14}$ | $4.3\times10^{14}$ | 1.3 |
| 100 | $2.8\times10^{15}$ | $7.9\times10^{14}$ | 3.6 |

The crossover is near **$z \approx 170$**, consistent with the standard figure of $z \approx 150$–200. Before that the gas tracks the CMB; after it, the gas cools as $(1+z)^2$ and falls steadily below the radiation temperature.

**This is exactly what makes the 21 cm signal from the Dark Ages an absorption feature.** As the Timeline chapter noted, neutral hydrogen is seen against the CMB in absorption or emission according to whether its spin temperature lies below or above the radiation temperature. The gas being colder than the CMB after $z \approx 150$ is what puts the signal in absorption, and the depth of that absorption depends on how far below the radiation temperature the gas has fallen.

Follow the chain: **a reaction that ran out of time at $z = 1090$ left $2\times10^{-4}$ of electrons stranded; those electrons kept the gas warm until $z \approx 170$; the epoch at which they stopped doing so sets the shape of a signal that radio astronomers are now trying to detect.** Very little in cosmology is as tightly linked across scales as this, and it is the kind of chain that makes an apparently obscure residue worth calculating precisely.

```checkpoint
q: Why does the gas temperature stay locked to the CMB until $z \approx 150$, long after photons decoupled at $z = 1090$?
a: Because the universe remains optically thick to photons until that redshift
x: The universe becomes optically thin at $z \approx 1090$ — that is what decoupling means. Thermal coupling and optical thickness are different conditions.
a*: Because the residual $2\times10^{-4}$ free electrons keep Compton-scattering off the vastly more numerous CMB photons, and that energy exchange drags the gas temperature along with the radiation
a: Because the gas has no way to radiate its heat away until molecular hydrogen forms
x: Radiative cooling by the gas itself is negligible here; what sets the temperature is exchange with the CMB, not the gas's own emission.
a: Because adiabatic cooling does not begin until the gas becomes fully neutral
x: The gas is essentially neutral from $z \approx 1000$; adiabatic cooling operates throughout and merely loses to Compton heating until $z \approx 150$.
hint: Decoupling is about whether photons are scattered often. Thermal coupling is about whether energy is exchanged. Which side of the exchange is outnumbered?
why: Decoupling occurs when the scattering rate *per photon* falls below $H$ — the universe becomes transparent because so few electrons remain. But the rate *per electron* is a different quantity, and it stays high, because each surviving electron still sits in a bath of $10^{9}$ photons per baryon. Energy exchange therefore continues, and since the photons hold overwhelmingly more heat capacity, the gas is dragged to the radiation temperature rather than the reverse. The lock breaks when $t_C/x_e$ exceeds $1/H$, near $z \approx 170$. Afterwards the gas cools adiabatically as $(1+z)^2$ against the radiation's $(1+z)$ and falls below it — which is precisely why the Dark Ages 21 cm signal appears in absorption against the CMB.
---
q: Why does a non-relativistic gas cool as $(1+z)^2$ while radiation cools as $(1+z)$?
a: Because the gas loses energy to the radiation field, accelerating its cooling
x: Once thermally decoupled there is no such loss; the difference persists even with no interaction at all.
a*: Because the gas's energy is kinetic and momenta redshift as $1/a$, so kinetic energies fall as $1/a^2$, whereas a photon's energy is proportional to its momentum and falls only as $1/a$
a: Because the gas is denser and expands against its own pressure, doing work
x: There is nothing external to do work against in a uniformly expanding universe; the scaling follows from momentum redshift alone.
a: Because the gas has more degrees of freedom, so equipartition distributes energy differently
x: Degrees of freedom set the heat capacity, not the temperature scaling with expansion.
hint: Write the energy in terms of momentum for each case and apply $p \propto 1/a$.
why: Expansion redshifts every particle's momentum as $p \propto 1/a$, photons and atoms alike. For a photon $E = pc$, so $E \propto 1/a$ and $T_\gamma \propto (1+z)$. For a non-relativistic atom $E = p^2/2m$, so $E \propto 1/a^2$ and $T_{\rm gas} \propto (1+z)^2$. The difference is entirely the difference between a linear and a quadratic dispersion relation, requiring no interaction and no loss of energy from one to the other. The consequence is that once thermal contact is broken at $z \approx 150$, the gas cools twice as fast in logarithmic terms and drops below the CMB — putting the 21 cm line in absorption and making the Dark Ages detectable in principle.
```

## The shell, not the surface

The last piece, and it has a consequence for what the CMB can possibly tell us.

Decoupling is not instantaneous. The probability that a photon last scattered at a given redshift is described by the **visibility function**, which peaks at $z = 1090$ with a full width of about $\Delta z \approx 80$. Photons in the CMB last scattered anywhere between $z \approx 1130$ and $z \approx 1050$ — an interval spanning

$$t(z{=}1050) - t(z{=}1130) = 396{,}000 - 350{,}000 = 46{,}000\ \mathrm{years},$$

about **12% of the age of the universe at that moment.**

So the CMB does not come from a surface. It comes from a **shell some 46,000 light-years thick in radial extent**, and every direction on the sky averages over that depth.

Two consequences follow.

**Small-scale anisotropies are smoothed.** Any temperature structure smaller than the shell's thickness is averaged along the line of sight and partially washed out. Combined with **Silk damping** — the diffusion of photons out of small-scale perturbations during the finite time recombination takes, which erases structure below about 10 Mpc comoving — this sets the damping tail seen at multipoles above $\ell \approx 1000$ in the CMB power spectrum. **The damping tail is not an instrumental limitation; it is a property of the source**, and no telescope will ever recover the erased structure.

**The CMB's "edge" is not sharp, and it is not an edge.** As the Cosmic Scale chapter established, the last-scattering surface is a horizon of opacity, not of extent, and it sits about 1.3 Gly inside the particle horizon. Now it can be added that it is not even a surface. It is a fuzzy shell, and what we call the CMB sky is a projection through it.

```checkpoint
q: The CMB's last-scattering shell is about 46,000 years thick, spanning $\Delta z \approx 80$. What follows for CMB observations?
a: The CMB temperature is uncertain by about 12%, corresponding to the redshift spread
x: The temperature is measured to better than one part in $10^{4}$; the spread affects the spatial structure, not the mean temperature.
a*: Temperature structure on scales smaller than the shell's depth is averaged along the line of sight and partly erased, contributing with Silk damping to the damping tail at $\ell > 1000$
a: Photons from different parts of the shell arrive at different times, so the CMB brightens gradually
x: All CMB photons reaching us now have travelled for essentially the same time; there is no observable arrival spread.
a: The shell thickness limits the accuracy of the inferred age of the universe to about 12%
x: The age is determined to about 0.5% from CMB parameters; the shell thickness does not propagate into it that way.
hint: Every line of sight passes through the whole thickness of the shell. What does that do to small features?
why: Decoupling is spread over $\Delta z \approx 80$, from $z \approx 1130$ to $z \approx 1050$, an interval of about 46,000 years — roughly 12% of the age at that epoch. Each direction on the sky therefore averages over that radial depth, so temperature fluctuations with wavelengths shorter than the shell's thickness partly cancel. Add Silk damping — photons diffusing out of small-scale perturbations during the finite duration of recombination, erasing structure below about 10 Mpc comoving — and the result is the damping tail above $\ell \approx 1000$. The essential point is that this is a property of the source, not of any instrument: the information was destroyed at $z \approx 1090$, and no future telescope can recover it.
```

{{image: Thomson scattering | Elastic scattering of a photon by a free electron, the process that kept the pre-recombination universe opaque. With a cross-section of $6.65\times10^{-29}$ m², it gave photons a mean free path of about 2 kiloparsecs at $z = 1090$ — small enough that radiation and matter behaved as a single fluid. Decoupling occurred when the scattering rate fell below the expansion rate, at an ionisation fraction of about 1%, after which the mean free path became effectively the size of the observable universe.}}

## How the redshift of recombination is measured

A last point of method, because the figures used throughout this chapter might reasonably be suspected of being assumed rather than measured.

They are measured, by an argument worth spelling out.

Before recombination, photons and baryons behave as a **single fluid**, with radiation pressure resisting gravitational compression. Perturbations in that fluid oscillate as sound waves, and the distance a wave travels from the beginning until decoupling — **the sound horizon**, $r_* = 144.4$ Mpc comoving — is a physical length fixed by the expansion history and the sound speed.

At decoupling the pressure vanishes, the oscillations stop, and the pattern is frozen into the photon distribution. It appears in the CMB as a series of **acoustic peaks** whose angular positions are set by the ratio of the sound horizon to the distance to the last-scattering surface. Measuring those angular positions therefore measures a ratio in which $z_*$ appears, and doing so at Planck's precision gives

$$z_* = 1089.92 \pm 0.25.$$

**A quarter of one part in a thousand.** This is why the Timeline chapter's audit rated recombination the best-dated event in cosmic history apart from the Solar System — the acoustic peak positions are measured extremely well and depend sharply on the conditions at last scattering.

Two further consistency checks make the value hard to escape. The **sound horizon appears again** in galaxy surveys, as the baryon acoustic oscillation scale imprinted in the clustering of galaxies at low redshift — the same ruler, measured 13 billion years later and at completely different wavelengths. (The BAO scale is the sound horizon at the slightly later *baryon drag* epoch, $r_{\rm drag} = 147.1$ Mpc, 1.8% larger than $r_*$; the two are distinct and are routinely conflated.) And the **temperature scaling** $T \propto (1+z)$ has been checked directly: molecular absorption lines and the Sunyaev–Zel'dovich effect measured against clusters at $z \approx 1$–3 confirm the CMB was hotter in the past by the predicted factor.

There is one honest caveat. The optical depth to reionization, $\tau = 0.054 \pm 0.007$, partially degrades the measurement in a specific way: rescattering off free electrons after reionization damps the acoustic peaks by $e^{-2\tau}$, which is degenerate with the primordial fluctuation amplitude $A_s$. Only the combination $A_se^{-2\tau}$ is well determined from the peaks alone, and breaking the degeneracy requires the large-scale polarisation signal, which is measured with much greater difficulty. **This is why $\tau$ is among the least well-determined of the standard parameters despite the CMB's precision elsewhere** — a reminder that a dataset's overall quality does not distribute evenly across the quantities inferred from it.

```checkpoint
q: How is $z_* = 1089.92 \pm 0.25$ actually determined, rather than assumed?
a: By measuring the CMB temperature and dividing by the recombination temperature from the Saha equation
x: That would give a rough value, but it relies on a theoretical recombination temperature and is far less precise than the quoted result. It is not how the measurement is made.
a*: From the angular positions of the CMB acoustic peaks, which are set by the ratio of the sound horizon at decoupling to the distance to the last-scattering surface — a ratio in which $z_*$ appears and which is measured very precisely
a: By observing the highest-redshift objects and extrapolating the ionisation history forward
x: The most distant known objects are at $z \approx 14$, a hundredfold short, and no extrapolation of that kind would reach a quarter-per-mille precision.
a: From the thickness of the last-scattering shell, which fixes the central redshift
x: The shell thickness is itself derived from the recombination history; it constrains the width of the visibility function, not the peak's location, to this precision.
hint: Before decoupling the plasma rings. What does the ringing leave behind, and what sets its angular scale?
why: Photons and baryons form a single fluid before decoupling, in which perturbations propagate as sound waves. The comoving distance such a wave travels before decoupling is the sound horizon, $r_* = 144.4$ Mpc, a physical length fixed by the expansion history. When pressure support vanishes the pattern freezes into the photon distribution and appears as acoustic peaks whose angular positions are $r_s$ divided by the distance to last scattering — a ratio that depends sharply on $z_*$. Measuring the peak positions therefore measures $z_*$, giving $1089.92 \pm 0.25$. Two independent checks support it: the same sound horizon reappears as the baryon acoustic oscillation scale in low-redshift galaxy surveys, and the predicted $T \propto (1+z)$ scaling is confirmed directly by molecular absorption and Sunyaev–Zel'dovich measurements against clusters at $z \approx 1$–3.
---
q: The optical depth to reionization, $\tau = 0.054 \pm 0.007$, is among the least well-determined standard parameters despite the CMB's precision elsewhere. Why?
a: Because reionization occurred at low redshift, where the CMB carries little information
x: The CMB does carry information about reionization; the difficulty is that the cleanest channel for it is the hardest to measure.
a*: Because rescattering after reionization damps the acoustic peaks by $e^{-2\tau}$, which is degenerate with the primordial amplitude $A_s$ — only the product $A_se^{-2\tau}$ is well constrained by the peaks, and breaking the degeneracy needs large-scale polarisation, which is far harder to measure
a: Because the reionization history is patchy, so no single optical depth describes it
x: Patchiness is real but a small effect on the integrated optical depth; the limitation is the degeneracy, not the inhomogeneity.
a: Because $\tau$ is inferred from quasar spectra rather than the CMB, and those samples are small
x: Quasar spectra constrain the endpoint of reionization, not $\tau$; $\tau$ comes from the CMB.
hint: Ask what else in the power spectrum has the same effect as damping every peak by a constant factor.
why: Free electrons produced by reionization rescatter CMB photons, suppressing the acoustic peaks uniformly by $e^{-2\tau}$. But raising the primordial fluctuation amplitude $A_s$ raises every peak by a constant factor too, so the temperature power spectrum constrains only the combination $A_se^{-2\tau}$ and cannot separate them. The degeneracy is broken by large-scale $E$-mode polarisation, which reionization generates at low multipoles by a mechanism amplitude alone cannot mimic — but that signal is faint, sits at the largest angular scales where foregrounds and systematics are worst, and requires all-sky coverage. Hence $\tau$ carries a 13% uncertainty while the peak positions are known to a fraction of a per cent. A dataset's quality does not distribute evenly across the quantities inferred from it, and knowing which parameters a measurement constrains poorly is part of using it responsibly.
```

## Pulling the thread

- **Three events, not one.** *Recombination* is atoms forming; *decoupling* is photons ceasing to scatter, at $x_e \approx 1\%$; *last scattering* is where an individual photon happened to scatter last, which defines a **shell, not a surface**.
- Recombination waits until $kT \approx 0.32$ eV, **a factor of 42 below the 13.6 eV binding energy**, because $1.6\times10^{9}$ photons per baryon keep the Wien tail supplied with ionising photons. **The same argument as the deuterium bottleneck**, though the simple $B/\ln(1/\eta)$ estimate overshoots by two here, because hydrogen's Saha prefactor exceeds the naive photon count.
- **Recombination is kinetically limited, not thermodynamically.** Direct capture to the ground state is self-defeating; Lyman-α is reabsorbed at optical depth $10^{8}$. The universe became neutral through a **forbidden two-photon decay at 8.22 s⁻¹** and through Lyman-α photons redshifting out of the line. **A slow irreversible channel beats a fast reversible one.**
- **About $2\times10^{-4}$ of electrons never recombined**, frozen out when $\alpha n_H x_e$ fell below $H$ — the same criterion that fixed $n/p$ at one second. The residue keeps a small optical depth, makes recombination's atomic physics a systematic in CMB parameter estimation, and **catalysed the molecular hydrogen that cooled the first star-forming gas.**
- **Helium recombines first**, at $z \approx 6{,}000$ and $z \approx 2{,}500$, removing **14% of the free electrons** before hydrogen begins. That shifts the photon mean free path and hence the damping tail, so $Y_p$ can be **fitted from the CMB alone** at $0.24 \pm 0.02$ — the nucleosynthesis prediction from one second, remeasured by photon diffusion at 372,000 years.
- Decoupling at $z_* = 1090$, $T = 2{,}970$ K, $t = 372{,}000$ yr. The photon mean free path goes from **2 kpc to effectively infinite**, and CMB photons have since travelled 13.8 Gyr untouched.
- The shell is $\Delta z \approx 80$, **46,000 years thick — 12% of the age at that epoch.** With Silk damping this produces the **damping tail above $\ell \approx 1000$**, and it is a property of the source: **the information was destroyed at $z = 1090$ and no instrument can recover it.**

- The residual electrons keep the **gas thermally locked to the CMB until $z \approx 170$**, long after optical decoupling, because each stranded electron still sits in a bath of $10^{9}$ photons. Afterwards $T_{\rm gas} \propto (1+z)^2$ against $T_\gamma \propto (1+z)$, so the gas falls below the radiation — **which is why the Dark Ages 21 cm signal is an absorption feature.**
- $z_* = 1089.92 \pm 0.25$ is **measured, not assumed**, from the acoustic peak positions, which fix $r_* = 144.4$ Mpc against the distance to last scattering. But $\tau = 0.054 \pm 0.007$ is poorly determined, because $e^{-2\tau}$ is **degenerate with the primordial amplitude $A_s$** — a dataset's precision does not distribute evenly across what is inferred from it.

The transferable idea: **when a transition is described by equilibrium thermodynamics, ask whether the reaction can actually keep up — and then look at what gets left behind.** Saha gives a clean exponential collapse of the ionisation fraction, and it is wrong in the only regime that matters, because the reaction was blocked at its last step and ran out of time. The interesting physics was not in the equilibrium calculation but in the two narrow kinetic channels that circumvented the blockage, and the observable consequence was the residue the equilibrium calculation predicted should not exist. **Equilibrium descriptions tell you where a system is heading; kinetics tells you whether it gets there, and the gap between the two is usually where the measurable quantity lives.** The pattern is the same in atmospheric chemistry, in metallurgical quenching, and in every isotopic system used for dating — and it is the reason the previous block's freeze-out idea keeps recurring.

## Further reading

{{book: P. J. E. Peebles | Principles of Physical Cosmology | 1993}}

{{book: Scott Dodelson | Modern Cosmology | 2003}}

{{book: Barbara Ryden | Introduction to Cosmology | 2003}}

Beyond the books: Peebles's 1968 paper and Zel'dovich, Kurt and Sunyaev's independent treatment of the same year are where the non-equilibrium calculation was first done, and both are readable. Seager, Sasselov and Scott's RECFAST paper is the standard modern reference and shows how much atomic detail precision cosmology now demands. Ryden's textbook treatment of the Saha equation is the clearest at an introductory level.

## Problems

*Useful numbers: $B = 13.6$ eV; $T_0 = 2.7255$ K; $n_{H,0} = 0.19$ m⁻³; $z_* = 1090$, $T_* = 2{,}970$ K, $t_* = 372{,}000$ yr; $\sigma_T = 6.65\times10^{-29}$ m²; $\alpha \approx 7\times10^{-19}$ m³ s⁻¹ at 3,000 K; $H(z{=}1090) = 5.1\times10^{-14}$ s⁻¹; $\Lambda_{2s\to1s} = 8.22$ s⁻¹; $\eta = 6.1\times10^{-10}$; visibility FWHM $\Delta z \approx 80$; $t(z{=}1130) = 350{,}000$ yr, $t(z{=}1050) = 396{,}000$ yr.*

**1.** *(Three events.)* **(a)** Define recombination, decoupling and last scattering in one sentence each. **(b)** State the ionisation fraction at decoupling and explain why it is not close to zero. **(c)** Explain why last scattering defines a shell rather than a surface. **(d)** Explain how $z_*$ is measured rather than assumed, and why $\tau$ is nevertheless poorly determined.

**2.** *(The delay.)* **(a)** State the naive and actual recombination temperatures and the ratio. **(b)** Explain the cause, and identify the earlier chapter where the same argument appeared. **(c)** Evaluate $B/\ln(1/\eta)$, compare with the Saha result, and explain the discrepancy.

**3.** *(Saha.)* **(a)** Write the Saha equation and identify the two competing factors. **(b)** From the table, state the redshift interval over which $x_e$ falls from 0.65 to 0.04. **(c)** State the assumption Saha makes that fails, and why. **(d)** Compute the helium-to-hydrogen number ratio from $Y_p = 0.245$, the fraction of free electrons helium supplies, and state why this affects the CMB.

**4.** *(The blocked channel.)* **(a)** Explain why direct capture to $n=1$ makes no net progress. **(b)** Explain why the $2p \to 1s$ route also fails. **(c)** Describe the two channels that do work and state why each is irreversible.

**5.** *(Freeze-out.)* **(a)** Write the freeze-out condition for recombination. **(b)** Evaluate $x_e$ at $z = 1090$ using the numbers given. **(c)** State three consequences of the residual ionisation. **(d)** Explain why the gas stays thermally locked to the CMB until $z \approx 150$ and what happens afterwards, deriving the two temperature scalings.

**6.** *(Decoupling.)* **(a)** Compute the ionisation fraction at which photons decouple. **(b)** Compute the photon mean free path just before decoupling, in kpc, taking $x_e = 1$. **(c)** Explain why decoupling occurs after recombination is largely complete.

**7.** *(The shell.)* **(a)** Compute the shell's thickness in years and as a fraction of the age at that epoch. **(b)** Explain the consequence for small-scale anisotropies. **(c)** Explain why the damping tail cannot be recovered by a better instrument.

**8.** *(Two bottlenecks.)* **(a)** State the deuterium bottleneck and the recombination delay in parallel form. **(b)** Identify what is the same and what differs. **(c)** State the general principle covering both.

**9.** *(Equilibrium and kinetics.)* **(a)** State what Saha predicts for $x_e$ at $z = 900$ and what actually obtains. **(b)** Explain the source of the discrepancy. **(c)** State the transferable principle and give one example from outside cosmology.

## Worked answers

**1.** **(a)** **Recombination**: free electrons and protons binding into neutral hydrogen — a statement about matter. **Decoupling**: photons ceasing to scatter appreciably, when the Thomson rate falls below $H$ — a statement about radiation. **Last scattering**: where an individual photon happened to scatter for the final time — a statement about one photon's history. **(b)** About $x_e = 1\%$. It is not close to zero because Thomson scattering is efficient: with $\sigma_T = 6.65\times10^{-29}$ m² and $n_H = 2.5\times10^{8}$ m⁻³, a photon still scatters faster than the universe expands even when 99% of the gas is neutral. **(c)** Because last scattering is **probabilistic**. The visibility function — the probability that a photon last scattered at a given redshift — has a finite width, $\Delta z \approx 80$, so photons in the CMB come from a range of redshifts spanning some 46,000 years of cosmic time. Every line of sight therefore integrates through a shell of that radial depth. **(d)** $z_*$ is measured from the **angular positions of the CMB acoustic peaks**. Before decoupling, photons and baryons form one fluid in which perturbations propagate as sound waves; the comoving distance such a wave covers before decoupling is the sound horizon, $r_* = 144.4$ Mpc, a physical length fixed by the expansion history. The peaks appear at $r_*$ divided by the distance to last scattering, a ratio depending sharply on $z_*$, giving $z_* = 1089.92 \pm 0.25$. It is cross-checked by the same sound horizon reappearing as the BAO scale in low-redshift galaxy surveys and by direct confirmation of $T \propto (1+z)$ from molecular absorption and Sunyaev–Zel'dovich measurements at $z \approx 1$–3. **$\tau$ is poorly determined despite this** because rescattering after reionization damps all peaks by $e^{-2\tau}$, which a change in the primordial amplitude $A_s$ mimics exactly — only $A_se^{-2\tau}$ is constrained by the peaks. Separating them requires large-scale $E$-mode polarisation, which is faint, sits where foregrounds are worst, and needs all-sky coverage.

**2.** **(a)** Naive: $kT \sim 13.6$ eV, i.e. $T \sim 1.6\times10^{5}$ K at $z \approx 58{,}000$. Actual: half-ionisation at $kT = 0.32$ eV, $T = 3{,}735$ K, $z = 1370$ — **a factor of 42** in temperature. **(b)** Because there are $1.6\times10^{9}$ photons per baryon, so the exponential tail of the blackbody distribution above 13.6 eV still supplies more than one ionising photon per atom long after the mean photon energy has fallen below threshold. The **same argument appeared in the Big Bang Nucleosynthesis chapter** as the deuterium bottleneck, with $B_D = 2.22$ MeV in place of 13.6 eV. **(c)** $B/\ln(1/\eta) = 13.6/21.2 = \mathbf{0.64\ eV}$, against the Saha value of 0.32 eV — an **overshoot by a factor of two**. The estimate assumes the number of ionising agents per atom is just $1/\eta$, but the Saha prefactor $(m_ekT/2\pi\hbar^2)^{3/2}/n_H$ is larger than that, because the electron is light and its thermal phase-space volume correspondingly huge. The logarithmic argument captures the structure — a delay going as the log of a large ratio — and gets the coefficient wrong, which is exactly what an order-of-magnitude argument should be trusted for and no further.

**3.** **(a)** $x_e^2/(1-x_e) = n_H^{-1}(m_ekT/2\pi\hbar^2)^{3/2}e^{-B/kT}$. The **exponential** drives ionisation down as the universe cools; the **prefactor**, of order $10^{15}$ here, is the ratio of the electron's thermal phase-space volume to the hydrogen number density and pushes ionisation up. Recombination waits until the exponential overcomes it. **(b)** From $z = 1400$ to $z = 1200$ — a **redshift interval of 200**, over which $x_e$ falls from 0.65 to 0.039. The transition is sharp. **(c)** Saha assumes **thermal and chemical equilibrium**, i.e. that recombination and ionisation both proceed fast compared with the expansion. This fails because recombination is blocked at its final step: direct capture to $n = 1$ is undone by the emitted photon, and $2p \to 1s$ Lyman-α photons are reabsorbed at an optical depth of order $10^{8}$. The reaction cannot keep up, so the actual ionisation lags behind equilibrium and then freezes. **(d)** $n_{\rm He}/n_H = (Y_p/4)/(1-Y_p) = (0.245/4)/0.755 = \mathbf{0.081}$. Fully ionised helium gives two electrons each, so there are $1 + 2(0.081) = 1.162$ electrons per hydrogen nucleus and helium supplies $2(0.081)/1.162 = \mathbf{14\%}$ of them. Because its ionisation energies are higher — 54.4 and 24.6 eV — helium recombines first, at $z \approx 6{,}000$ and $z \approx 2{,}500$, removing that 14% before hydrogen starts. **The free-electron density sets the photon mean free path**, which sets how far photons diffuse during recombination and therefore the scale below which anisotropies are erased. $Y_p$ consequently enters the predicted damping tail and can be fitted from the CMB alone at $0.24 \pm 0.02$ — agreeing with the nucleosynthesis value derived from physics at one second, by entirely different means.

**4.** **(a)** Capture into $n = 1$ emits a photon of at least 13.6 eV, which the optically thick medium reabsorbs almost immediately, ionising another atom. **One atom created, one destroyed — net zero.** **(b)** Because the last step of any downward cascade, $2p \to 1s$, emits a **Lyman-α photon at 10.2 eV** into a medium whose optical depth at that line is of order $10^{8}$. It is reabsorbed and re-excites another ground-state atom, so again nothing is achieved. **(c)** **Two-photon decay from $2s$**, at $\Lambda = 8.22$ s⁻¹: the $2s \to 1s$ single-photon transition is forbidden, but two photons sharing the 10.2 eV can be emitted, and **neither is at a resonance**, so neither can re-excite a ground-state atom. **Lyman-α escape by redshift**: a Lyman-α photon that redshifts out of the line's narrow frequency width before being reabsorbed is permanently lost to the line, and the expansion guarantees a steady leak. Both are irreversible because the emitted radiation cannot undo the transition — in one case for spectroscopic reasons, in the other for cosmological ones.

**5.** **(a)** Recombination freezes out when the rate per electron falls below the expansion rate: $\alpha n_H x_e = H$, so $x_e \approx H/(\alpha n_H)$. **(b)** $x_e = 5.1\times10^{-14}/[(7\times10^{-19})(2.5\times10^{8})] = 5.1\times10^{-14}/1.75\times10^{-10} = \mathbf{2.9\times10^{-4}}$, consistent with the full calculation's $2\times10^{-4}$. **(c)** *One*: **Thomson scattering never entirely stops**, leaving a small residual optical depth that matters for CMB polarisation and for precision parameter estimation. *Two*: **recombination's atomic physics becomes a cosmological systematic** — the visibility function's shape enters the predicted power spectrum, requiring codes like RECFAST and CosmoRec that track hundreds of levels, because the theory must be more accurate than the measurement. *Three*: the residual electrons **catalysed molecular hydrogen formation**, the only effective coolant in metal-free gas, and therefore enabled the first stars. **(d)** Decoupling is defined by the scattering rate *per photon* falling below $H$; the rate *per electron* is a different quantity and stays high, because each surviving electron sits in a bath of $10^{9}$ photons per baryon. Compton energy exchange therefore continues, and since the radiation holds overwhelmingly more heat capacity, the gas is dragged to $T_\gamma$ rather than the reverse. The lock breaks when $t_C/x_e$ exceeds $1/H$, with $t_C = 3m_ec/(4\sigma_Ta_{\rm rad}T_\gamma^4)$; evaluating gives a crossover near $\mathbf{z \approx 170}$. Afterwards the two scalings diverge. Expansion redshifts momenta as $p \propto 1/a$ for everything. For a photon $E = pc$, so $T_\gamma \propto (1+z)$. For a non-relativistic atom $E = p^2/2m$, so $T_{\rm gas} \propto (1+z)^2$ — twice as fast in logarithmic terms, purely from the difference between a linear and a quadratic dispersion relation. The gas therefore falls below the radiation temperature, **which is why the Dark Ages 21 cm line appears in absorption against the CMB** rather than in emission.

**6.** **(a)** $x_e = H/(n_H\sigma_Tc) = 5.1\times10^{-14}/[(2.5\times10^{8})(6.65\times10^{-29})(3\times10^{8})] = 5.1\times10^{-14}/4.99\times10^{-12} = \mathbf{1.0\times10^{-2}}$. **(b)** $\lambda = 1/(n_H\sigma_T) = 1/[(2.5\times10^{8})(6.65\times10^{-29})] = 6.0\times10^{19}$ m $= \mathbf{2.0\ kpc}$ — utterly negligible compared with the horizon, so the universe is opaque and radiation and matter behave as a single fluid. After decoupling the mean free path becomes effectively the size of the observable universe. **(c)** Because **Thomson scattering is efficient enough to matter even at 1% ionisation.** The photon does not care that 99% of the electrons have been captured; it cares only whether the remaining free ones are dense enough to scatter it within an expansion time. That condition holds until $x_e$ falls to $10^{-2}$, well after recombination has done most of its work — which is exactly why the three events must be kept distinct.

**7.** **(a)** $396{,}000 - 350{,}000 = \mathbf{46{,}000\ years}$, against an age of 372,000 years at the peak — about **12%**. **(b)** Every direction on the sky integrates through the full radial depth of the shell, so temperature fluctuations with wavelengths shorter than that depth **partly cancel along the line of sight** and are suppressed in the observed map. **(c)** Because the suppression happened **at the source, at $z = 1090$**, not in the instrument. Combined with Silk damping — photons diffusing out of small-scale perturbations during the finite duration of recombination, erasing structure below about 10 Mpc comoving — it produces the damping tail above $\ell \approx 1000$. The information is not obscured; it was destroyed 13.8 billion years ago. No aperture, no sensitivity and no observing time recovers it, which is why the damping tail is modelled rather than deconvolved.

**8.** **(a)** *Deuterium*: binding energy 2.22 MeV, but deuterium survives only below $kT \approx 0.07$ MeV — a factor of 30 — because $1.6\times10^{9}$ photons per baryon keep photodissociating it through the Wien tail. *Hydrogen*: binding energy 13.6 eV, but atoms survive only below $kT \approx 0.32$ eV — a factor of 42 — for exactly the same reason. **(b)** **Same**: the mechanism, the role of $\eta$, and the logarithmic form of the delay. **Different**: the magnitude of the Saha prefactor. Deuterium's is modest and the estimate $B/\ln(1/\eta)$ works well; hydrogen's involves the electron's thermal phase-space volume, is much larger, and makes the same estimate overshoot by two. Also different is what the delay causes — 270 s of neutron decay in one case, a shift in the CMB's redshift in the other. **(c)** **Whenever a bound species is vastly outnumbered by photons, its threshold is crossed far later than naive energetics suggests, by a factor of order the logarithm of the ratio.** The two most consequential transitions in cosmic history are both governed by this, with the same $\eta$ setting both delays.

**9.** **(a)** Saha at $z = 900$ gives $x_e \approx 4\times10^{-5}$ and falling exponentially toward zero; what actually obtains is $x_e \approx 2\times10^{-4}$, **frozen and constant thereafter**. **(b)** Recombination was blocked at its final step and could proceed only through two slow channels — forbidden two-photon decay at 8.22 s⁻¹ and Lyman-α escape by redshift. As the gas dilutes, the rate per electron $\alpha n_H x_e$ falls faster than $H$, the two cross, and the reaction stops with electrons left over. **The system never reached the equilibrium Saha describes.** **(c)** **Equilibrium descriptions tell you where a system is heading; kinetics tells you whether it arrives, and the gap between them is usually where the measurable quantity lives.** Outside cosmology: **quenching in metallurgy**, where a steel cooled rapidly retains a high-temperature phase — martensite — that the equilibrium phase diagram says should not exist at room temperature, and the retained phase is precisely what makes the material useful. The equilibrium calculation would predict its absence; the kinetics predicts its abundance, and the abundance is the property one actually measures and exploits.$cmbRec_master$,
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
