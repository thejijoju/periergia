-- Astronomy & Space · The Expanding Universe — The Big Bang — "Big Bang Nucleosynthesis".
-- Curated master for
-- astronomy-and-space/expanding-universe/big-bang/nucleosynthesis
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Second chapter of The Big Bang block. Organised around BBN as a
-- one-parameter theory: fix eta and four abundances spanning nearly
-- nine orders of magnitude follow from laboratory nuclear physics.
-- The n/p chain worked explicitly - freeze-out at 0.8 MeV giving 1/5,
-- neutron decay over 270 s giving 1/7, Yp = 0.244 against an observed
-- 0.245; the deuterium bottleneck and why BBN waits until 0.07 MeV
-- rather than 2.2, a factor of 30 set by eta; the A=5 and A=8 mass gaps
-- that stop BBN at helium and hand carbon to stars; deuterium as a
-- baryometer and the LUNA cross-section measurement that brought the
-- BBN and CMB baryon densities into 0.2% agreement; helium as a
-- neutrino counter, predicting fewer than four species before LEP
-- measured three; and the lithium problem, a factor of three at 4 sigma
-- that remains open.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/big-bang/nucleosynthesis',
    'research',
    'advanced',
    'read',
    $bbNuc_master$> Big Bang nucleosynthesis is a **one-parameter theory**. Fix the baryon-to-photon ratio $\eta$ and everything else is determined by nuclear cross-sections measured in laboratories: the abundances of deuterium, helium-3, helium-4 and lithium-7 all follow, spanning nearly **nine orders of magnitude** from a quarter of the mass in helium down to lithium at one part in $10^{10}$. Three of the four agree with observation. One does not, and has not for thirty years.

That structure — one adjustable number, four independent predictions — is what makes BBN the most stringent test in cosmology. **A theory with one parameter and four observables can fail in three independent ways.** It very nearly does not.

The previous chapter established the machinery: the temperature–time relation, and freeze-out as the mechanism that turns equilibrium into a fossil. This chapter watches that machinery produce the first chemical elements, in an episode lasting about twenty minutes, whose products are still measurable today.

## The problem to be solved

At one second the universe is at $10^{10}$ K and contains free protons and neutrons — no bound nuclei, since any that formed would be immediately shattered by the ambient photons. By about twenty minutes, the temperature and density have fallen so far that nuclear reactions have effectively ceased. **Whatever nuclei exist at that point are what the universe starts with**, and stars will spend the next 13.8 billion years slowly modifying the inventory.

Two questions determine the outcome, and they are worth separating because they have different answers and different physics:

1. **How many neutrons are available?** Because virtually every available neutron ends up in helium-4, this question alone very nearly fixes the helium abundance.
2. **When can nuclei survive?** Because until they can, nothing happens at all — and the delay turns out to be surprisingly long.

Take them in order.

## The neutron-to-proton ratio, worked

At high temperature, weak interactions interconvert neutrons and protons freely:

$$n + \nu_e \leftrightarrow p + e^-, \qquad n + e^+ \leftrightarrow p + \bar\nu_e.$$

While these run faster than the expansion, the ratio takes its equilibrium value, set by the neutron–proton mass difference $\Delta m = 1.293$ MeV:

$$\frac{n}{p} = e^{-\Delta m / kT}.$$

At high $T$ this is close to 1 — the mass difference is negligible compared with the thermal energy, so neutrons and protons are equally abundant. As the universe cools, the exponential bites and neutrons become progressively rarer.

Then these weak reactions freeze out, by exactly the mechanism of the previous chapter. Their rate falls as $T^5$ against $H \propto T^2$, so decoupling is sharp, occurring at

$$T_f \approx 0.8\ \mathrm{MeV}, \qquad \frac{n}{p} = e^{-1.293/0.8} = 0.199 \approx \frac{1}{5}.$$

**One neutron for every five protons, fixed at about one second.**

But not quite fixed. Free neutrons are unstable, with a mean lifetime $\tau_n = 878.4$ s, and nucleosynthesis will not begin for another few hundred seconds. During that interval neutrons decay into protons, and the ratio continues to fall — now for a completely different reason, having nothing to do with equilibrium.

Nucleosynthesis proper begins at $t \approx 270$ s, for reasons the next section explains. By then a fraction $e^{-270/878.4} = 0.735$ of the neutrons survive, and each decay adds a proton:

$$\frac{n}{p} = \frac{0.735}{5.03 + 0.265} = 0.139 \approx \frac{1}{7}.$$

Now the payoff. Essentially every surviving neutron ends up in a helium-4 nucleus, because ⁴He is by far the most tightly bound light nucleus (28.3 MeV binding energy) and the reaction network drives everything toward it. Each ⁴He takes two neutrons and two protons. So if there are $n$ neutrons per $p$ protons, the helium mass fraction is

$$Y_p = \frac{2n}{n+p} = \frac{2(n/p)}{1 + (n/p)} = \frac{2(0.139)}{1.139} = \mathbf{0.244}.$$

The observed primordial helium abundance, extrapolated to zero metallicity from metal-poor extragalactic H II regions, is

$$Y_p = 0.245 \pm 0.004.$$

**A calculation using the neutron–proton mass difference, the neutron lifetime, and the freeze-out condition — with no free parameters at all — reproduces the measured helium content of the universe to within its uncertainty.** That is the single most impressive number in cosmology, and it is worth pausing over: the inputs are three laboratory measurements and a rate comparison, and the output is a quantity measured in galaxies millions of light-years away.

Note also how loosely $Y_p$ depends on $\eta$. Doubling the baryon density changes $Y_p$ by only a per cent or two, because helium production is limited by the neutron supply rather than by the reaction rates. **Helium is a poor baryometer** — which will matter shortly, because deuterium is an excellent one.

```checkpoint
q: Why does the neutron-to-proton ratio continue to fall after weak freeze-out at $T \approx 0.8$ MeV?
a: Because the equilibrium ratio $e^{-\Delta m/kT}$ keeps decreasing as the universe cools
x: That relation applies only while the weak interactions maintain equilibrium. After freeze-out the ratio no longer tracks it — that is what freeze-out means.
a*: Because free neutrons decay with a mean lifetime of 878 s, and nucleosynthesis does not begin for another few hundred seconds, so decay converts neutrons to protons throughout the interval
a: Because neutrons are preferentially captured into nuclei, depleting the free supply
x: No nuclei survive during this interval — that is precisely why there is a delay. Capture cannot deplete neutrons before it can begin.
a: Because the expansion dilutes neutrons faster than protons owing to their greater mass
x: Expansion dilutes both identically; number densities of both fall as $a^{-3}$, leaving the ratio unchanged.
hint: Freeze-out stops one process. Is there another that does not need the weak interactions to be fast?
why: At freeze-out the ratio is fixed at $e^{-1.293/0.8} = 0.199$, about 1/5, and the weak interconversion reactions become too slow to maintain equilibrium. But neutron decay is a separate process that continues regardless, with $\tau_n = 878.4$ s. Nucleosynthesis cannot start until $t \approx 270$ s, so a fraction $e^{-270/878.4} = 0.735$ of neutrons survive, and the ratio falls from 1/5 to about 1/7. The two effects have entirely different physics — one is a rate comparison, the other a decay clock — and they combine to give $Y_p = 2(1/7)/(1+1/7) = 0.244$, matching the observed $0.245 \pm 0.004$ with no free parameters.
---
q: Helium-4 comprises about a quarter of the baryonic mass. Which quantity most directly controls that figure?
a: The baryon-to-photon ratio $\eta$, since more baryons means more nuclear reactions
x: $Y_p$ depends only logarithmically on $\eta$ — doubling the baryon density shifts it by a per cent or two. Helium production is limited by neutron supply, not by reaction rates.
a*: The neutron-to-proton ratio when nucleosynthesis begins, since essentially every available neutron ends up in a ⁴He nucleus
a: The binding energy of ⁴He, which sets how much helium is energetically favoured
x: The binding energy explains why ⁴He is the endpoint of the network, but the *amount* is set by how many neutrons were available, not by how tightly they bind.
a: The temperature at which nucleosynthesis begins, which sets the reaction rates
x: That temperature matters mainly through the neutron decay clock it implies; the reaction rates themselves are fast enough to run to completion once nuclei can survive.
hint: Count the neutrons, then ask where they end up.
why: ⁴He is the most tightly bound light nucleus at 28.3 MeV, and the reaction network funnels essentially all available neutrons into it. Each ⁴He contains two neutrons and two protons, so with $n$ neutrons per $p$ protons the mass fraction is $2(n/p)/(1+n/p)$. At $n/p = 1/7$ this gives 0.244. The dependence on $\eta$ is only logarithmic, because helium formation is neutron-limited rather than rate-limited — which makes helium a poor baryometer and, as it turns out, an excellent counter of relativistic species, since those change the expansion rate and hence the freeze-out temperature.
```

## The deuterium bottleneck

Why does nucleosynthesis wait until 270 seconds? The naive answer is wrong in an instructive way.

The first step in any path to helium is deuterium formation:

$$p + n \to d + \gamma.$$

Deuterium's binding energy is 2.22 MeV, so the naive expectation is that deuterium becomes stable once $kT$ falls below 2.22 MeV — at about $t = 0.3$ s. But nucleosynthesis does not begin at 0.3 s. It begins at 270 s, when $kT \approx 0.07$ MeV — **a factor of 30 lower in temperature, and nearly a thousand times later.**

The resolution is $\eta$, and it is one of the finest illustrations anywhere of a small number having a large effect.

There are **1.6 billion photons for every baryon.** A deuteron is destroyed by any photon above 2.22 MeV. Even when the *typical* photon energy is far below that threshold, the blackbody distribution has an exponential tail, and with 1.6 billion photons per baryon a tiny fractional tail still contains vastly more photons than there are deuterons to destroy. Photodissociation therefore continues long after the mean photon energy has dropped below the binding energy.

The condition for deuterium to survive is roughly that the number of photons above threshold *per baryon* falls below one:

$$\frac{1}{\eta}e^{-B_D/kT} \sim 1 \quad\Longrightarrow\quad kT \sim \frac{B_D}{\ln(1/\eta)} = \frac{2.22}{\ln(1.6\times10^{9})} = \frac{2.22}{21.2} = 0.10\ \mathrm{MeV}.$$

The estimate lands within a factor of 1.5 of the correct answer, and the more careful treatment gives $\approx 0.07$ MeV. **The suppression factor is $\ln(1/\eta) \approx 21$** — the whole delay is the logarithm of the photon-to-baryon ratio.

The consequences are large and go in the right direction to matter:

- **Neutrons decay during the wait.** The 270-second delay is what converts $n/p$ from 1/5 to 1/7 and lowers $Y_p$ from about 0.29 to 0.244. Without the bottleneck the universe would be nearly 30% helium by mass.
- **A very similar argument governs recombination**, 380,000 years later. Hydrogen's ionisation energy is 13.6 eV, yet the universe stays ionised until $kT \approx 0.26$ eV, a factor of 50 lower — again because there are $10^{9}$ photons per baryon and the Wien tail keeps ionising. The next chapter takes this up in detail; it is worth recognising the same argument in advance.

**Whenever a species is vastly outnumbered by photons, thresholds are crossed far later than naive energetics suggests, and the delay goes as the logarithm of the ratio.** The two most important transitions in the early universe are both governed by this, with the same $\eta$ doing the work.

```checkpoint
q: Deuterium's binding energy is 2.22 MeV, yet nucleosynthesis does not begin until $kT \approx 0.07$ MeV. What causes the factor-of-30 delay?
a: Deuterium formation is slow because the $p + n \to d + \gamma$ cross-section is small
x: The cross-section is adequate; deuterons form readily throughout. The problem is that they are destroyed again as fast as they form.
a*: There are 1.6 billion photons per baryon, so even the exponential tail of the blackbody distribution above 2.22 MeV contains far more photons than there are deuterons, and photodissociation continues long after the mean photon energy drops below threshold
a: Neutrons must first decay to establish the correct $n/p$ ratio before fusion can begin
x: Neutron decay is a consequence of the delay, not its cause — it happens because nucleosynthesis is held up, not in order to permit it.
a: The universe is not dense enough for nuclear reactions until 270 s
x: Density falls with time, so waiting makes reactions less likely, not more. The delay must be explained by something other than density.
hint: Count the photons available to destroy each deuteron, not just their typical energy.
why: Deuterons form readily but are photodissociated by any photon above 2.22 MeV. With $\eta = 6\times10^{-10}$ there are $1.6\times10^{9}$ photons per baryon, so the Wien tail above threshold still vastly outnumbers the deuterons even when the mean photon energy is far below it. Survival requires roughly $\eta^{-1}e^{-B_D/kT} \sim 1$, giving $kT \sim B_D/\ln(1/\eta) = 2.22/21.2 = 0.10$ MeV — within a factor of 1.5 of the exact 0.07 MeV. The delay is essentially $\ln(1/\eta) \approx 21$. Its main consequence is that neutrons decay for 270 s first, lowering $Y_p$ from about 0.29 to 0.244. The identical argument governs recombination, where hydrogen stays ionised to 0.26 eV despite a 13.6 eV binding energy.
```

{{image: Big Bang nucleosynthesis | Predicted primordial abundances as a function of the baryon-to-photon ratio, the single free parameter of the theory. Helium-4, plotted as a mass fraction, varies only logarithmically; deuterium and helium-3 fall steeply with increasing baryon density; lithium-7 has a characteristic minimum. The vertical band marks the baryon density measured independently from the cosmic microwave background — four abundances spanning nearly nine orders of magnitude, all constrained by one number.}}

## Why it stops at helium

Nucleosynthesis produces almost nothing beyond ⁴He, and the reason is a peculiarity of nuclear structure with consequences reaching all the way to the existence of chemistry.

**There are no stable nuclei with mass number 5 or 8.** ⁵He and ⁵Li are unbound and fall apart in about $10^{-21}$ s. ⁸Be is unbound too, decaying back to two alpha particles in $8\times10^{-17}$ s. Both of the obvious routes upward from helium are therefore blocked:

$$^4\mathrm{He} + p \to\ ^5\mathrm{Li}\ (\mathrm{unbound}), \qquad ^4\mathrm{He} + ^4\mathrm{He} \to\ ^8\mathrm{Be}\ (\mathrm{unbound}).$$

Getting past the gaps requires a three-body reaction — the **triple-alpha process**, in which a third helium nucleus strikes an ⁸Be before it disintegrates. That needs densities and timescales far beyond anything available at 270 seconds in an expanding universe, where the density is falling as $a^{-3}$ and the whole episode lasts twenty minutes. Trace amounts of ⁷Li and ⁷Be form by other routes, and there it stops.

So the universe emerges from its first twenty minutes containing, by mass, about **75% hydrogen, 24.5% helium-4**, and essentially nothing else: deuterium at $2.5\times10^{-5}$ by number, ³He at about $10^{-5}$, ⁷Li at $10^{-10}$. **No carbon. No oxygen. No nitrogen. No iron.**

Every carbon atom in every living thing was made in a star, and it was made by the triple-alpha process at densities and temperatures the early universe could not supply — which is why it took a further hundred million years and a generation of massive stars before the first carbon existed anywhere. **The mass-5 and mass-8 gaps are the reason chemistry has a history.** Had ⁸Be been bound by even a little, the early universe would have burned much further up the periodic table, and the universe would have emerged from its first hour already containing carbon and oxygen — with stellar nucleosynthesis a footnote rather than the source of everything interesting.

```checkpoint
q: Why does Big Bang nucleosynthesis stop at helium rather than continuing up the periodic table?
a: Because the temperature falls below the Coulomb barrier for heavier nuclei before they can form
x: Coulomb barriers rise with charge and do contribute, but they are not the decisive obstacle — the blockage is structural and would exist at any temperature.
a*: Because no stable nuclei exist at mass 5 or mass 8, so both routes upward from ⁴He are blocked, and bridging the gap needs a three-body encounter at densities the expanding universe cannot supply
a: Because all the neutrons have been consumed by the time ⁴He forms, leaving nothing to build with
x: Neutrons are indeed exhausted, but protons remain abundant and $^4$He + p would proceed readily if $^5$Li were bound. The gap, not the neutron supply, is what stops it.
a: Because the reaction network reaches equilibrium at ⁴He and equilibrium favours it
x: Nuclear statistical equilibrium at these temperatures would favour iron, not helium. The outcome is set by kinetics blocked at the gaps, not by equilibrium.
hint: Write down the two obvious reactions that would take you above helium, and check whether their products exist.
why: The two natural next steps are $^4$He + p → $^5$Li and $^4$He + $^4$He → $^8$Be, and both products are unbound — $^5$Li and $^5$He disintegrate in ~$10^{-21}$ s, $^8$Be in $8\times10^{-17}$ s. Getting past mass 8 requires the triple-alpha process, in which a third alpha strikes a $^8$Be before it falls apart, and that is a three-body reaction whose rate depends steeply on density. Stellar cores sustain the required densities for millions of years; the universe at 270 s has a density falling as $a^{-3}$ and twenty minutes in which to work. So the network halts, and the universe emerges about 75% hydrogen and 24.5% helium with essentially nothing heavier.
---
q: What is the broadest consequence of the mass-5 and mass-8 gaps?
a: That helium is the second most abundant element, a fact otherwise unexplained
x: True but minor — helium's abundance follows from the neutron count, and would hold whether or not the network could continue past it.
a*: That no carbon, oxygen or iron emerged from the Big Bang, so every such atom was made inside a star — which is why chemistry has a history rather than being a property of the universe from the outset
a: That the universe's composition has been essentially unchanged since 270 seconds
x: The opposite: because BBN produced almost nothing heavy, stellar nucleosynthesis has been steadily changing the composition ever since.
a: That nuclear fusion is impossible above helium without a catalyst
x: Fusion above helium proceeds readily in stars via triple-alpha and the CNO cycle; it is the early universe's density and duration that fail, not the physics.
hint: List what the universe contained at twenty minutes, then ask where everything else came from.
why: BBN leaves hydrogen, helium, and traces of deuterium, $^3$He and $^7$Li — no carbon, nitrogen, oxygen or iron. Bridging mass 8 requires triple-alpha at stellar densities, so the heavy elements had to await the first generation of massive stars roughly a hundred million years later. Every carbon atom in every living thing was therefore manufactured in a stellar interior. Had $^8$Be been bound by even a little, the network would have run much further and the universe would have emerged from its first hour already containing carbon and oxygen, with stellar nucleosynthesis reduced to a footnote. The gaps are why the periodic table was assembled over billions of years rather than in twenty minutes.
```

## Deuterium: the baryometer

Deuterium is the most useful of the four abundances, for two reasons that compound.

**First, it is steeply sensitive to $\eta$.** Deuterium is an intermediate product, consumed in the reactions that build helium. A higher baryon density means faster reactions, more complete burning, and less surviving deuterium — with $\mathrm{D/H} \propto \eta^{-1.6}$. A 10% change in the baryon density produces a 16% change in deuterium, against a fraction of a per cent in helium.

**Second, deuterium is only destroyed, never made, by stars.** Any process hot enough to make deuterium is hot enough to burn it, so stellar processing is a one-way street. **Any measured deuterium abundance is therefore a firm lower bound on the primordial value**, and measurements in the most pristine environments available give something very close to it.

The best measurements come from **absorption in high-redshift damped Lyman-α systems**: clouds of near-primordial gas seen against background quasars, at low metallicity and with the isotope shift resolved. The current value is

$$\mathrm{D/H} = (2.53 \pm 0.03)\times10^{-5},$$

a per-cent-level measurement of an abundance of one part in forty thousand, in gas eleven billion light-years away.

Converting this to a baryon density has an instructive history. For years the limiting uncertainty was not astronomical at all but **nuclear**: the cross-section for $d(p,\gamma)^3\mathrm{He}$, the reaction that destroys deuterium, was known only to about 7% at the relevant energies, and that uncertainty dominated the inferred baryon density. The LUNA collaboration measured it directly in 2020, using an accelerator installed under 1,400 metres of rock in the Gran Sasso laboratory so that cosmic-ray backgrounds would not swamp the tiny reaction rate at BBN energies.

With that measurement in hand, deuterium gives

$$\Omega_b h^2 = 0.02233 \pm 0.00036,$$

against the CMB's independent determination from the acoustic peaks:

$$\Omega_b h^2 = 0.02237 \pm 0.00015.$$

**Agreement to 0.2%.** These are measurements of the same quantity from epochs separated by 380,000 years, using entirely different physics — nuclear reaction networks in one case, photon–baryon acoustics in the other — with no shared calibration. That they agree at this level is among the strongest consistency checks the standard model of cosmology has passed.

There is also a methodological point worth extracting. **The limiting uncertainty on a cosmological parameter was removed by a nuclear physics experiment in a tunnel.** Not a bigger telescope, not more survey area, not a better statistical method — a cross-section measurement. This is a recurring pattern: when a measurement is systematics-limited, the improvement usually comes from outside the field that made the measurement, because the bottleneck is a calibration input rather than the observation itself. The Distance Ladder chapter met the same pattern, where progress came from geometric parallaxes rather than from better photometry.

```checkpoint
q: Why is deuterium the best of the four light elements for measuring the baryon density?
a: Because it is the most abundant of the four after helium, so it is easiest to measure
x: Deuterium is at $2.5\times10^{-5}$ by number, far below helium; ease of measurement is not the reason.
a*: Because its abundance depends steeply on the baryon density, as $\eta^{-1.6}$, and because stars only destroy deuterium and never make it — so any measured value is a firm lower bound on the primordial one
a: Because deuterium is unaffected by stellar processing, so its abundance is unchanged since BBN
x: Deuterium is strongly affected — it is readily destroyed in stars. What helps is that the effect goes in one direction only, giving a bound rather than an unconstrained correction.
a: Because deuterium can be measured in the CMB as well as in absorption systems, allowing cross-checks
x: The CMB does not measure deuterium; it measures the baryon density independently, which is what makes the comparison a genuine test.
hint: Two properties compound: one about sensitivity, one about contamination.
why: Deuterium is an intermediate in the chain to helium, so a higher baryon density burns it more completely: $\mathrm{D/H} \propto \eta^{-1.6}$, giving a 16% response to a 10% density change, against a fraction of a per cent for helium. And because any environment hot enough to make deuterium is hot enough to destroy it, stars are a one-way sink — so a measured abundance is a lower bound on the primordial value, and measurements in near-pristine high-redshift gas come close to it. Together these make deuterium a precision baryometer: $\mathrm{D/H} = (2.53 \pm 0.03)\times10^{-5}$ gives $\Omega_b h^2 = 0.02233 \pm 0.00036$, against the CMB's 0.02237 ± 0.00015.
---
q: For years the dominant uncertainty in the BBN baryon density was the $d(p,\gamma)^3$He cross-section, resolved by the LUNA experiment under 1,400 m of rock. What does this illustrate?
a: That cosmological measurements are unreliable until confirmed by laboratory experiment
x: The astronomical measurement was sound; the limiting uncertainty was in a nuclear input to the interpretation, not in the observation.
a*: That when a measurement is systematics-limited the improvement often comes from outside the field, because the bottleneck is a calibration input rather than the observation itself
a: That underground laboratories are necessary for all precision measurements of nuclear reactions
x: Depth was needed here because BBN-energy cross-sections are tiny and cosmic-ray backgrounds would swamp them — a specific requirement, not a general one.
a: That the CMB determination of the baryon density was more reliable all along
x: Both were sound; the point is that they agree to 0.2% once the nuclear input is measured, which is a test neither could perform alone.
hint: Ask what was actually limiting the result — the telescope, or something else entirely.
why: The deuterium abundance was measured to per-cent precision in high-redshift absorption systems well before the baryon density could be inferred to matching precision, because converting D/H into $\Omega_b h^2$ requires the rate at which deuterium is destroyed, and that cross-section was known only to ~7% at BBN energies. LUNA measured it directly, using an accelerator under Gran Sasso where the rock shields cosmic rays that would otherwise bury the signal. The result brought BBN and CMB baryon densities into 0.2% agreement — from epochs 380,000 years apart, using unrelated physics and no shared calibration. The generalisable lesson: a systematics-limited measurement usually improves when someone fixes the calibration input, which is frequently a different discipline's problem, as the Distance Ladder chapter's dependence on geometric parallaxes also showed.
```

## Counting neutrinos with helium

One further use of BBN deserves attention, because it produced a correct prediction about particle physics from astronomy — an unusual direction of travel.

The helium abundance depends on the expansion rate at freeze-out. More relativistic species means a larger $g_*$, hence a faster expansion, hence an earlier weak freeze-out at a *higher* temperature, hence a higher $n/p$ ratio and more helium. The faster expansion also brings nucleosynthesis forward, allowing less neutron decay and raising $Y_p$ further.

Both effects can be estimated with the machinery already in hand. Freeze-out occurs when $\Gamma \propto T^5$ equals $H \propto \sqrt{g_*}\,T^2$, so $T_f \propto g_*^{1/6}$. Adding a fourth neutrino species raises $g_*$ from 10.75 to 12.5, so $T_f$ rises by a factor $(12.5/10.75)^{1/6} = 1.026$, from 0.800 to 0.820 MeV, and the time to reach a given temperature falls by $\sqrt{10.75/12.5} = 0.927$. Running the chain through gives $Y_p = 0.258$ instead of 0.244 — an increase of about **0.014 per extra species**, in good agreement with the full calculation's 0.013.

That is a large effect on the scale of the measurement. In the 1970s and 1980s, when the number of neutrino species was unknown, BBN was used to constrain it: the observed helium abundance implied **fewer than about four light neutrino species**. This was a genuine prediction about particle physics derived from the chemical composition of distant galaxies.

It was confirmed in 1989, when LEP measured the invisible width of the $Z$ boson and found

$$N_\nu = 2.984 \pm 0.008.$$

**Three species, as cosmology had indicated.** Two entirely independent methods — a decay width measured at CERN and the helium content of metal-poor galaxies — converging on the same integer.

The argument runs both ways now. With $N_\nu = 3$ established, BBN's helium abundance becomes a constraint on *any* additional relativistic species: sterile neutrinos, light axions, anything else contributing to $g_*$ at one second. The current BBN limit, $N_{\rm eff} < 3.4$ or so, is among the tightest constraints on light hidden-sector particles available, and it applies at an epoch no accelerator can reach.

```checkpoint
q: BBN was used in the 1980s to constrain the number of light neutrino species, and LEP later measured $N_\nu = 2.984 \pm 0.008$. What is notable about this episode?
a: That cosmology anticipated a particle-physics result by making a more precise measurement
x: The cosmological bound was far less precise — "fewer than about four" against LEP's four-figure result. Precision is not what makes the episode notable.
a*: That a claim about fundamental particle content was derived from the chemical composition of distant metal-poor galaxies, and was later confirmed by an entirely unrelated laboratory measurement of a decay width
a: That the helium abundance is directly sensitive to neutrino interactions, so the measurement was effectively the same one
x: BBN is sensitive to neutrinos only through their contribution to the energy density and hence the expansion rate — not through their interactions, which is what LEP measured.
a: That it showed cosmological constraints should be preferred to collider measurements when they conflict
x: They did not conflict, and there is no general precedence rule. The value of the episode lies in the independence of the two routes.
hint: Ask what was measured in each case, and how much the two methods have in common.
why: More relativistic species raise $g_*$, speeding the expansion, so weak freeze-out occurs earlier and hotter, leaving more neutrons and more helium — about +0.013 in $Y_p$ per extra species. Measuring $Y_p$ in metal-poor extragalactic H II regions therefore bounded the species count, giving fewer than about four. LEP then measured the invisible width of the $Z$ boson at CERN, an entirely different observable with no shared assumptions, and found three. Two methods with nothing in common converging on the same integer is the strongest kind of confirmation available, and it is worth noticing the direction of travel: astronomy constrained particle physics, not the reverse. The argument now runs forward, with $Y_p$ bounding any additional light species at an epoch no accelerator reaches.
```

## The lithium problem

Three of four predictions succeed. The fourth does not, and it has resisted resolution for three decades.

BBN predicts, at the CMB-determined baryon density:

$$^7\mathrm{Li}/\mathrm{H} = (4.7 \pm 0.7)\times10^{-10}.$$

The observed abundance comes from the **Spite plateau** — the remarkable observation that metal-poor halo stars across a wide range of temperature and metallicity all show nearly the same lithium abundance, which is naturally read as the primordial value surviving in unprocessed atmospheres:

$$^7\mathrm{Li}/\mathrm{H} = (1.6 \pm 0.3)\times10^{-10}.$$

The prediction exceeds the observation by a factor of **2.9**, a discrepancy of about **$4\sigma$**. This is the **primordial lithium problem**, and it is a real one: the same theory that gets deuterium right to 0.2% and helium right to within its measurement error is wrong about lithium by a factor of three.

The candidate explanations divide into three kinds, and assessing them is a good exercise in how to think about a persistent anomaly.

**The stars destroyed it.** Lithium burns at only $2.5\times10^{6}$ K, easily reached below the convective envelopes of these stars, so gradual depletion over ten billion years is plausible in principle. The difficulty is the plateau's *flatness*: depletion mechanisms generally depend on stellar mass, temperature and metallicity, and would be expected to produce scatter. The plateau is remarkably tight. Models invoking atomic diffusion combined with turbulent mixing can produce roughly uniform depletion by a factor of two or three, but they require tuning, and the tuning is not independently motivated. **This remains the leading explanation and is not yet convincing.**

**The nuclear rates are wrong.** Most ⁷Li is produced as ⁷Be, which later captures an electron to become ⁷Li, so an unrecognised ⁷Be destruction channel would help. But BBN reaction rates have been measured repeatedly and specifically re-examined for this purpose — including at LUNA — and no such channel has appeared. **Increasingly disfavoured**, and for the right reason: the hypothesis makes a checkable prediction, and the check was run.

**New physics.** Decaying particles injecting energy during or after BBN could destroy ⁷Be selectively. The proposals work, but at a cost: they add free parameters, and having done so they must not disturb deuterium or helium, which are correct. **A model that fixes one abundance by adding parameters, while carefully not breaking the two that already work, has weak explanatory standing** — it converts a one-parameter theory with one failure into a several-parameter theory with none, which is a worse trade than it appears.

Worth stating plainly: the honest position is that **the lithium problem is unresolved**, and that the most likely resolution is astrophysical depletion in the observed stars rather than a failure of BBN. That is a judgement about where the weakest link lies — the lithium observation involves stellar atmospheres and ten billion years of stellar evolution, whereas the deuterium observation involves near-pristine gas with almost no processing. **It is not, however, established, and presenting it as settled would misrepresent the field.**

```checkpoint
q: BBN gets deuterium right to 0.2% and helium right to within measurement error, but predicts three times too much lithium-7. What is the most defensible reading of this situation?
a: BBN is refuted, since a theory that fails one of its predictions is falsified
x: A single discrepancy against three successes calls for locating the failure, not discarding the framework — particularly when the failing observable has by far the most complicated observational chain.
a*: The framework is very likely sound and the failure most likely lies in the observation, since lithium is measured in stellar atmospheres after ten billion years of stellar evolution while deuterium is measured in near-pristine gas — but this is a judgement, not an established result
a: The lithium discrepancy proves the existence of new physics during or after nucleosynthesis
x: New-physics models can fit it, but only by adding parameters while carefully not disturbing the two abundances that already work — which is weak explanatory standing, not proof.
a: The discrepancy is within the combined uncertainties once systematic errors are included
x: The gap is a factor of 2.9 at about $4\sigma$; no plausible accounting of the quoted uncertainties absorbs it.
hint: Ask which of the four observations has the longest and least controlled chain between the primordial universe and the measured number.
why: The four abundances are not equally clean. Deuterium is measured in high-redshift near-primordial gas, with stellar processing acting in a single known direction. Lithium is measured in the atmospheres of halo stars that have been evolving for over ten billion years, and lithium burns at only $2.5\times10^{6}$ K — easily reached below a convective envelope. Gradual depletion is therefore physically plausible, though the tightness of the Spite plateau makes it hard to arrange, since depletion mechanisms usually introduce scatter. Nuclear-rate explanations have been tested and largely excluded; new-physics models fit only by adding parameters while preserving the successes, which is a poor trade. The defensible position is that astrophysical depletion is the leading candidate and the problem is open — not that it is solved.
```

{{image: Triple-alpha process | The reaction by which three helium nuclei combine to form carbon, requiring an ⁸Be nucleus to survive long enough — some $10^{-16}$ seconds — to be struck by a third alpha. The densities needed are available in stellar cores but not in the expanding universe at 270 seconds, which is why Big Bang nucleosynthesis stops at helium. The absence of stable nuclei at mass 5 and mass 8 is therefore the reason every carbon atom in existence was made inside a star.}}

## Why BBN matters

A closing point about the place of this episode in the evidence.

**Nucleosynthesis is the deepest probe of the universe with surviving, checkable evidence.** The CMB comes from 380,000 years. BBN comes from one second to twenty minutes — five orders of magnitude earlier — and it works, to per-cent precision, using nuclear physics measured in laboratories and applied at temperatures no experiment can sustain.

That is what secures the temperature–time relation of the previous chapter as more than a formal exercise. If the expansion rate at one second had been appreciably different, the helium abundance would be wrong. If there had been four neutrino species, $Y_p$ would be 0.258 rather than 0.244 and the discrepancy would be obvious. If the baryon density had been different by 10%, deuterium would be off by 16%. **BBN is a test of general relativity, of the Standard Model's particle content, and of the thermal history, all at an epoch otherwise inaccessible — and it passes three of these four ways.**

```checkpoint
q: In what sense is nucleosynthesis a deeper probe of the universe than the cosmic microwave background?
a: Because it is more precise, matching observation better than any CMB prediction
x: The CMB's acoustic-peak measurements are considerably more precise; depth in time, not precision, is the point.
a*: Because it tests the thermal history at one second to twenty minutes — five orders of magnitude earlier than the CMB's 380,000 years — and does so with surviving, checkable relics
a: Because it does not depend on general relativity, whereas the CMB does
x: BBN depends on general relativity through the expansion rate at freeze-out; that dependence is precisely what makes it a test of GR at one second.
a: Because the CMB only probes recombination, which is a later and less fundamental process
x: Recombination is neither less fundamental nor less informative; the CMB constrains a great deal the light elements cannot. The distinction is epoch, not importance.
hint: Compare the times at which each relic was laid down.
why: The CMB was released at 380,000 years and carries superbly precise information about that epoch. BBN operated between about one second and twenty minutes — roughly $10^{5}$ times earlier — and its products are still measurable, so it constrains the expansion rate, the relativistic particle content and the baryon density at an epoch nothing else reaches. A different expansion rate at one second would give the wrong helium; a fourth neutrino species would give $Y_p = 0.258$ rather than 0.244; a 10% shift in baryon density would move deuterium by 16%. BBN is therefore simultaneously a test of general relativity, of the Standard Model's particle content and of the thermal history, and it passes in three of its four available ways.
```

## Pulling the thread

- BBN is a **one-parameter theory**: fix $\eta$ and four abundances follow from laboratory nuclear physics, spanning nearly **nine orders of magnitude**. **One parameter, four predictions — three independent ways to fail.**
- The **helium abundance is a neutron count**. Weak freeze-out at $T = 0.8$ MeV gives $n/p = 1/5$; neutron decay over 270 s gives $1/7$; every neutron ends in ⁴He, so $Y_p = 2(1/7)/(1+1/7) = \mathbf{0.244}$, against an observed $0.245 \pm 0.004$ — **with no free parameters**.
- The **deuterium bottleneck** delays everything to 0.07 MeV rather than 2.2, because $1.6\times10^{9}$ photons per baryon keep photodissociating deuterons via the Wien tail. The delay factor is $\ln(1/\eta) \approx 21$, and **the same argument governs recombination** 380,000 years later.
- BBN **stops at helium** because no stable nuclei exist at $A = 5$ or $A = 8$. The triple-alpha process needs stellar densities. **The mass gaps are why carbon had to wait for stars — and why chemistry has a history.**
- **Deuterium is the baryometer**: $\mathrm{D/H} \propto \eta^{-1.6}$, and stars only destroy it. With LUNA's cross-section measurement, BBN gives $\Omega_b h^2 = 0.02233 \pm 0.00036$ against the CMB's $0.02237 \pm 0.00015$ — **agreement to 0.2% across 380,000 years and two unrelated pieces of physics.**
- **Helium counts neutrinos.** Each extra species raises $Y_p$ by ~0.013, so BBN required fewer than four species — **confirmed by LEP in 1989 at $N_\nu = 2.984 \pm 0.008$.** The argument now constrains any light hidden-sector particle at an epoch no accelerator reaches.
- The **lithium problem** stands: predicted $4.7\times10^{-10}$ against an observed $1.6\times10^{-10}$, a factor of 2.9 at $4\sigma$. Nuclear-rate explanations are largely excluded; new-physics fixes add parameters to preserve what already works; **astrophysical depletion in the observed stars is the leading candidate and is not established.**

The transferable idea: **count parameters against observables, and treat the ratio as the measure of a theory's exposure.** BBN has one adjustable number and four independent predictions, which means it could have failed in three ways and did not fail in three of them. Compare a model with four parameters fitted to four observations: it cannot fail at all, and its agreement with data carries no information. This is why the lithium discrepancy is taken seriously rather than absorbed — **in a one-parameter theory there is nowhere to hide a factor of three**, and any fix that works by adding parameters has purchased agreement at the cost of the very exposure that made the earlier successes meaningful. The habit generalises far beyond cosmology: before being impressed that a model fits, count how many ways it was free to fail.

## Further reading

{{book: George Gamow | The Creation of the Universe | 1952}}

{{book: Bernard Pagel | Nucleosynthesis and Chemical Evolution of Galaxies | 1997}}

{{book: Ralph Alpher and Robert Herman | Genesis of the Big Bang | 2001}}

Beyond the books: the 1948 Alpher–Bethe–Gamow paper is a page and a half and is worth reading for how much of the modern picture is already visible in it, including its wrong parts. Gary Steigman's review articles are the standard entry point to the quantitative literature. And the LUNA collaboration's 2020 *Nature* paper on $d(p,\gamma)^3$He is an unusually clear example of a small laboratory measurement resolving a cosmological uncertainty.

## Problems

*Useful numbers: $\Delta m = m_n - m_p = 1.293$ MeV; $\tau_n = 878.4$ s; weak freeze-out at $T_f \approx 0.8$ MeV; BBN begins at $t \approx 270$ s, $kT \approx 0.07$ MeV; $B_D = 2.22$ MeV; $\eta = 6.1\times10^{-10}$; $Y_p$ observed $0.245 \pm 0.004$; D/H observed $(2.53 \pm 0.03)\times10^{-5}$; ⁷Li/H predicted $(4.7\pm0.7)\times10^{-10}$, observed $(1.6\pm0.3)\times10^{-10}$; $g_* = 10.75$ (3 species), 12.5 (4 species); $\Omega_bh^2$ from BBN $0.02233 \pm 0.00036$, from CMB $0.02237 \pm 0.00015$.*

**1.** *(The neutron count.)* **(a)** Compute $n/p$ at freeze-out. **(b)** Compute it at $t = 270$ s, accounting for neutron decay. **(c)** Compute $Y_p$ and compare with observation, stating what inputs the calculation required.

**2.** *(Two mechanisms.)* **(a)** Explain why $n/p$ stops tracking $e^{-\Delta m/kT}$ at freeze-out. **(b)** Explain why it nevertheless keeps falling. **(c)** State what would happen to $Y_p$ if the neutron lifetime were 400 s instead of 878 s, and why.

**3.** *(The bottleneck.)* **(a)** State the naive temperature at which deuterium should become stable, and the actual one. **(b)** Derive the estimate $kT \sim B_D/\ln(1/\eta)$ and evaluate it. **(c)** State the consequence for $Y_p$ and identify where the same argument recurs.

**4.** *(The mass gaps.)* **(a)** Name the two mass numbers with no stable nuclei and give the relevant lifetimes. **(b)** Explain why the triple-alpha process cannot operate at 270 s. **(c)** State the consequence for the universe's composition and for the history of chemistry.

**5.** *(The baryometer.)* **(a)** Given $\mathrm{D/H} \propto \eta^{-1.6}$, compute the fractional change in D/H for a 10% increase in baryon density, and compare with helium's response. **(b)** Explain why stellar processing gives a bound rather than an unconstrained correction. **(c)** State the two independent determinations of $\Omega_bh^2$ and assess their agreement.

**6.** *(LUNA.)* **(a)** State what was limiting the BBN baryon density before 2020. **(b)** Explain why the measurement had to be made underground. **(c)** State the methodological lesson and give one parallel from elsewhere in this tree.

**7.** *(Counting neutrinos.)* **(a)** Show that $T_f \propto g_*^{1/6}$ and evaluate the change in $T_f$ for a fourth neutrino species. **(b)** Estimate the resulting change in $Y_p$, including the effect on the timing of nucleosynthesis. **(c)** State what BBN predicted, what LEP measured, and what the argument is used for now.

**8.** *(Lithium.)* **(a)** State the predicted and observed abundances and the significance of the discrepancy. **(b)** Assess the three classes of explanation. **(c)** State the defensible position and justify it by comparing the observational chains for lithium and deuterium.

**9.** *(Exposure.)* **(a)** Count BBN's parameters and independent observables. **(b)** Explain why this makes the lithium discrepancy significant rather than absorbable. **(c)** State the general principle and apply it to a hypothetical four-parameter model fitted to four measurements.

## Worked answers

**1.** **(a)** $n/p = e^{-\Delta m/kT_f} = e^{-1.293/0.8} = e^{-1.616} = \mathbf{0.199}$, i.e. about **1/5**. **(b)** Over 270 s a fraction $e^{-270/878.4} = 0.735$ of neutrons survive, and each decay produces a proton. Starting from 1 neutron per 5.03 protons: $n = 0.735$, $p = 5.03 + 0.265 = 5.295$, so $n/p = \mathbf{0.139}$, about **1/7**. **(c)** $Y_p = 2(n/p)/(1+n/p) = 2(0.139)/1.139 = \mathbf{0.244}$, against an observed $0.245 \pm 0.004$ — agreement well within the measurement error. The inputs were the neutron–proton mass difference, the neutron lifetime, the freeze-out condition $\Gamma = H$, and the time at which nucleosynthesis begins. **All are laboratory measurements or consequences of the expansion law; not one is a free parameter fitted to the data.** That is what makes this the most impressive single number in cosmology.

**2.** **(a)** Because the equilibrium relation holds only while the weak interconversion reactions run faster than the expansion. Their rate falls as $T^5$ against $H \propto T^2$, so at $T_f \approx 0.8$ MeV the reactions can no longer keep up and the ratio stops tracking its equilibrium value — the definition of freeze-out. **(b)** Because **free neutron decay is a separate process**, requiring no partner and unaffected by the reaction rates that just froze out. With $\tau_n = 878.4$ s and a 270 s wait before nucleosynthesis, roughly a quarter of the neutrons decay, driving $n/p$ from 1/5 to 1/7. **(c)** $Y_p$ would be substantially **lower**. With $\tau_n = 400$ s the survival fraction over 270 s is $e^{-270/400} = 0.509$ rather than 0.735, giving $n = 0.509$, $p = 5.03 + 0.491 = 5.521$, $n/p = 0.0922$ and $Y_p = 2(0.0922)/1.0922 = \mathbf{0.169}$. A universe with a shorter-lived neutron would be markedly helium-poor — which is why the neutron lifetime is a cosmological parameter as much as a nuclear one, and why the long-standing discrepancy between beam and bottle measurements of $\tau_n$ was of interest to cosmologists.

**3.** **(a)** Naive: deuterium should survive once $kT < B_D = 2.22$ MeV, at about $t = 0.3$ s. Actual: $kT \approx 0.07$ MeV at $t \approx 270$ s — a factor of **30 in temperature** and nearly **1,000 in time**. **(b)** A deuteron is destroyed by any photon above $B_D$. The fraction of photons above threshold is $\sim e^{-B_D/kT}$, and there are $1/\eta$ photons per baryon, so the number of dissociating photons per baryon is $\sim \eta^{-1}e^{-B_D/kT}$. Deuterium survives once this falls below unity: $kT \sim B_D/\ln(1/\eta) = 2.22/\ln(1.6\times10^{9}) = 2.22/21.2 = \mathbf{0.10\ MeV}$, within a factor of 1.5 of the exact answer. **(c)** The delay allows **270 s of neutron decay**, lowering $n/p$ from 1/5 to 1/7 and $Y_p$ from about 0.29 to 0.244. Without it the universe would be nearly 30% helium. The same argument recurs at **recombination**: hydrogen's ionisation energy is 13.6 eV, yet the universe stays ionised until $kT \approx 0.26$ eV, a factor of 50, for exactly the same reason — $10^{9}$ photons per baryon and an exponential tail. Whenever a species is vastly outnumbered by photons, thresholds are crossed late, by a factor of order $\ln(1/\eta)$.

**4.** **(a)** **$A = 5$**: ⁵He and ⁵Li are unbound, disintegrating in $\sim10^{-21}$ s. **$A = 8$**: ⁸Be is unbound, decaying to two alphas in $8\times10^{-17}$ s. **(b)** Because bridging the $A = 8$ gap requires a **three-body encounter** — a third alpha must strike the ⁸Be within its $10^{-16}$ s lifetime. The probability depends on density, and at 270 s the density is falling as $a^{-3}$ and the whole episode lasts twenty minutes. Stellar cores sustain the necessary densities for millions of years; the expanding universe cannot for even a moment. **(c)** The universe emerges with about **75% hydrogen and 24.5% ⁴He by mass**, plus D at $2.5\times10^{-5}$, ³He at $\sim10^{-5}$ and ⁷Li at $\sim10^{-10}$ — and **no carbon, oxygen, nitrogen or iron**. Everything heavier had to await the first generation of stars, roughly a hundred million years later. **The mass gaps are therefore the reason chemistry has a history**: had ⁸Be been bound, BBN would have burned much further up the periodic table and the universe would have emerged from its first hour already containing carbon and oxygen.

**5.** **(a)** $\mathrm{D/H} \propto \eta^{-1.6}$, so a 10% increase in $\eta$ gives $\Delta(\mathrm{D/H})/(\mathrm{D/H}) = -1.6\times0.10 = \mathbf{-16\%}$. Helium responds only logarithmically, changing by a fraction of a per cent for the same shift — **an order of magnitude less sensitive**. **(b)** Because any environment hot enough to produce deuterium is hotter still than its destruction threshold, so stars are a pure **sink**. Stellar processing can only lower the deuterium abundance, never raise it, so any measured value is a **firm lower bound** on the primordial one. Measurements in metal-poor high-redshift gas, where processing has barely begun, approach that bound closely. **(c)** BBN with the observed D/H gives $\Omega_bh^2 = 0.02233 \pm 0.00036$; the CMB acoustic peaks give $0.02237 \pm 0.00015$. These **agree to 0.2%**, well within either uncertainty. The significance is that they come from epochs 380,000 years apart, use unrelated physics — nuclear reaction networks versus photon–baryon acoustics — and share no calibration. It is among the strongest consistency checks the standard cosmological model has passed.

**6.** **(a)** The **$d(p,\gamma)^3$He cross-section**, which controls the rate at which deuterium is destroyed. It was known only to about 7% at BBN energies, and that uncertainty dominated the inferred baryon density — the astronomical D/H measurement was already at the per-cent level. **(b)** Because the cross-section at BBN energies is extremely small, so the reaction rate in the laboratory is correspondingly tiny and would be swamped by cosmic-ray-induced background. Installing the accelerator beneath **1,400 m of rock at Gran Sasso** reduces the muon flux by about six orders of magnitude, making the signal visible. **(c)** **When a measurement is systematics-limited, the improvement usually comes from outside the field that made it**, because the bottleneck is a calibration input rather than the observation. Parallel from this tree: the **distance ladder**, where progress came not from better photometry of Cepheids but from *Gaia*'s geometric parallaxes — an external calibration replacing the limiting assumption. In both cases, more of the same observation would not have helped.

**7.** **(a)** Freeze-out occurs when $\Gamma \propto T^5$ equals $H \propto \sqrt{g_*}T^2$, so $T_f^3 \propto \sqrt{g_*}$ and $T_f \propto g_*^{1/6}$. A fourth species raises $g_*$ from 10.75 to 12.5, so $T_f$ rises by $(12.5/10.75)^{1/6} = 1.026$, from 0.800 to $\mathbf{0.820}$ MeV. **(b)** The higher $T_f$ gives $n/p = e^{-1.293/0.820} = 0.204$ at freeze-out. The faster expansion also shortens the time to reach the BBN temperature by $\sqrt{10.75/12.5} = 0.927$, i.e. to 250 s, so less neutron decay occurs: survival $e^{-250/878.4} = 0.752$, giving $n/p = 0.146$ and $Y_p = \mathbf{0.258}$ — an increase of about **0.014**, in good agreement with the full calculation's 0.013. **(c)** BBN predicted **fewer than about four light neutrino species** from the observed helium abundance, a claim about particle physics derived from the composition of metal-poor galaxies. LEP measured the invisible $Z$ width in 1989 and found $N_\nu = 2.984 \pm 0.008$ — **three species**, as cosmology had indicated. The argument now runs the other way: with $N_\nu = 3$ fixed, $Y_p$ constrains **any** additional light species contributing to $g_*$ at one second, including sterile neutrinos and axions, at an epoch no accelerator can reach.

**8.** **(a)** Predicted $(4.7 \pm 0.7)\times10^{-10}$; observed $(1.6 \pm 0.3)\times10^{-10}$ from the Spite plateau in metal-poor halo stars. The ratio is **2.9**, and the significance is $(4.7-1.6)/\sqrt{0.7^2+0.3^2} = \mathbf{4.1\sigma}$. **(b)** *Stellar depletion*: physically plausible, since lithium burns at only $2.5\times10^{6}$ K, but the **flatness of the Spite plateau** is the obstacle — depletion mechanisms generally depend on mass, temperature and metallicity and should introduce scatter. Diffusion-plus-turbulence models achieve roughly uniform depletion but require tuning that is not independently motivated. **Leading, not convincing.** *Nuclear rates*: most ⁷Li arrives as ⁷Be, so an unrecognised ⁷Be destruction channel would help, but the rates have been re-measured specifically to look for one and none has appeared — **largely excluded, and for the right reason: the hypothesis was checkable and was checked.** *New physics*: decaying particles injecting energy can destroy ⁷Be selectively, but the models add free parameters and must be arranged not to disturb deuterium or helium. **Weak explanatory standing.** **(c)** The defensible position is that **BBN is very likely sound and the failure most likely lies in the lithium observation**, but that this is a judgement rather than a result. The justification is a comparison of observational chains: deuterium is measured in near-pristine high-redshift gas where processing acts in one known direction, whereas lithium is measured in stellar atmospheres after more than ten billion years of stellar evolution, in stars whose convective envelopes reach temperatures at which lithium burns. **The weakest link is the one with the longest chain**, and here that is unambiguously lithium.

**9.** **(a)** **One parameter** — the baryon-to-photon ratio $\eta$, equivalently $\Omega_bh^2$ — and **four independent observables**: D/H, ³He/H, $Y_p$ and ⁷Li/H, spanning nearly nine orders of magnitude in abundance. **(b)** Because with one parameter fixed by any single abundance, the other three are **predictions with nowhere to hide**. There is no freedom to accommodate a factor of three: adjusting $\eta$ to fit lithium would immediately destroy the deuterium agreement, which is good to 0.2%. In a many-parameter theory the discrepancy would be absorbed without comment; here it cannot be, which is exactly why it is taken seriously. **(c)** **Count parameters against observables, and treat the difference as the theory's exposure.** A four-parameter model fitted to four measurements has zero exposure: it cannot fail, so its agreement with the data carries no information whatever about whether it is true. Fit quality is only evidence to the extent that misfit was possible. **This also explains why the new-physics fixes to lithium are unattractive** — they purchase agreement by adding parameters, converting a theory with three exposed predictions and one failure into a theory with no exposure and no failures, which is a worse epistemic position despite looking better on a plot.$bbNuc_master$,
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
