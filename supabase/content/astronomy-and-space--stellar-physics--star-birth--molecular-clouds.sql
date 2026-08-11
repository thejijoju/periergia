-- Astronomy & Space · Stellar Physics — Star Birth — "Molecular Clouds".
-- Curated master for
-- astronomy-and-space/stellar-physics/star-birth/molecular-clouds
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the Star Birth block. Organised around the efficiency problem,
-- which is the field's actual central question and is usually buried:
-- the Milky Way's molecular gas, collapsing in free fall, would produce
-- ~300 Msun/yr of stars, and it produces 1-2. Everything else in the
-- chapter is an answer to that factor of two hundred - supersonic
-- turbulence at Mach 25, magnetic support and the mass-to-flux ratio,
-- and feedback that destroys clouds in 10-30 Myr. Also: why H2 is
-- invisible and the entire subject therefore rests on a CO conversion
-- factor with 30% systematic uncertainty; Jeans analysis showing GMCs
-- contain thousands of Jeans masses; Larson's relations; the 0.1 pc
-- filament width from Herschel; and the shielding condition that makes
-- gas molecular in the first place.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: Jeans mass and length from
-- M_J = (5kT/G mu m_H)^1.5 (3/4 pi rho)^0.5 with mu = 2.33, giving
-- 54 Msun and 2.1 pc at T=10 K, n=100 cm^-3, falling to 1.7 Msun and
-- 0.067 pc at n=1e5; sound speed 0.188 km/s at 10 K so sigma_v = 5
-- km/s is Mach 27; free-fall time sqrt(3 pi/32 G rho) = 3.4 Myr at
-- n=100 and 0.34 Myr at n=1e4; implied free-fall star formation rate
-- 1e9 Msun / 3.4 Myr = 297 Msun/yr against 1-2 observed, so
-- epsilon_ff = 0.005; virial parameter 5 sigma^2 R/GM = 5.8 for a
-- 1e5 Msun, 20 pc cloud at 5 km/s; Larson sigma = 1.1 (L/pc)^0.38
-- giving 3.4 km/s at 20 pc; CO(1-0) at 115.271 GHz = 2.6 mm; H2 S(0)
-- upper level at 510 K.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/star-birth/molecular-clouds',
    'research',
    'advanced',
    'read',
    $spClouds_master$> The Milky Way contains about $10^9\,M_\odot$ of molecular gas. At its typical density that gas has a free-fall time of $3.4$ million years. If it simply fell together under its own gravity, the Galaxy would form stars at

$$\frac{10^9\,M_\odot}{3.4\times10^6\ \text{yr}} \approx 300\ M_\odot\ \text{per year}.$$

**It forms one to two.** The discrepancy is a factor of about two hundred, it has been known since the 1970s, and explaining it is the central problem of star formation.

Everything in this chapter is an answer to that number. Molecular clouds are the sites where stars form, and the interesting fact about them is not that they collapse but that they mostly **do not** — or collapse so inefficiently that only a per cent of their mass is converted per free-fall time. Understanding what holds them up, and what eventually lets a small fraction through, is what the subject consists of.

There is also a methodological problem worth confronting at the outset: **the principal constituent of a molecular cloud is invisible.** Everything quantitative in this chapter is inferred through a proxy, and the conversion factor carries a systematic uncertainty of tens of per cent that propagates into every mass, every efficiency, and the factor of two hundred itself.

## 1. The invisible molecule

Molecular hydrogen is about $99\%$ of a cloud's molecular content by number and it is nearly undetectable in the conditions where it lives.

The reason is symmetry. H$_2$ is a homonuclear diatomic molecule, so it has **no permanent electric dipole moment** and therefore no dipole rotational transitions. Its lowest allowed rotational transition is the quadrupole $J = 2 \to 0$, whose upper level sits at $E/k = 510$ K. In gas at $10$ K, the fraction of molecules in that level is $e^{-51}$ — nothing. A molecular cloud is a vast reservoir of a molecule that does not radiate.

Three workarounds, each imperfect.

**Carbon monoxide.** CO is the second most abundant molecule at about $10^{-4}$ of H$_2$, and being heteronuclear it has a dipole moment. Its $J=1\to0$ transition at $115.271$ GHz ($2.6$ mm) is excited at a few kelvin, which is why CO maps are the standard picture of the molecular sky.

The catch is that CO is **optically thick** in the main line, so its brightness measures surface conditions rather than column density. That it works at all is an accident of turbulence: the line is broadened by supersonic motions, so different velocity components see different optical depths and the integrated intensity ends up correlating with total column. The relation is packaged as the conversion factor

$$X_{\rm CO} = \frac{N({\rm H_2})}{W_{\rm CO}} \approx 2\times10^{20}\ \text{cm}^{-2}\,(\text{K km s}^{-1})^{-1},$$

with an accepted uncertainty of about $30\%$ in the Milky Way and considerably worse at low metallicity, where CO photodissociates while H$_2$ survives, producing "CO-dark" molecular gas that can be a large fraction of the total.

**Dust.** Dust emits thermal continuum in the far infrared and absorbs background starlight, and both can be converted to column density given a gas-to-dust ratio and an opacity. Herschel's surveys made this the leading method for cloud structure. It carries its own systematics — the opacity depends on grain composition and growth, and the gas-to-dust ratio varies with metallicity.

**Other molecules.** Rarer species such as $^{13}$CO, C$^{18}$O, HCN and N$_2$H$^+$ are optically thin or trace higher densities, giving access to interiors that CO cannot reach — at the price of abundances that vary with chemistry and freeze-out.

**The reason this matters is not pedantic.** When a paper reports a cloud mass, a star formation efficiency, or a Galactic molecular gas budget, that number has passed through at least one conversion factor of order-thirty-per-cent accuracy. The factor of two hundred above is far larger than that uncertainty and survives it comfortably, but factors of two in the literature frequently do not.

## 2. What a molecular cloud is

Typical properties, with the caveat above attached to every mass.

| Quantity | Giant molecular cloud | Clump | Dense core |
|---|---|---|---|
| Mass | $10^4$–$10^6\,M_\odot$ | $10^2$–$10^3\,M_\odot$ | $0.5$–$5\,M_\odot$ |
| Size | $10$–$100$ pc | $\sim1$ pc | $\sim0.1$ pc |
| Density $n({\rm H_2})$ | $10^2$ cm$^{-3}$ | $10^4$ cm$^{-3}$ | $10^5$–$10^6$ cm$^{-3}$ |
| Temperature | $10$–$20$ K | $10$–$20$ K | $\sim10$ K |
| Velocity dispersion | $\sim5$ km s$^{-1}$ | $\sim1$ km s$^{-1}$ | $\sim0.3$ km s$^{-1}$ |

Two features stand out and both are important.

**They are cold — about $10$ K.** This is set by a balance: cosmic rays and, in the outer layers, photoelectric heating from dust deposit energy, while CO and other molecules radiate it away efficiently in the millimetre. The dust and molecular shielding that keeps ultraviolet radiation out is what allows the temperature to fall this low, and the low temperature is what makes gravity competitive.

**They are dense relative to their surroundings but very tenuous in absolute terms.** At $100$ cm$^{-3}$, a molecular cloud is a better vacuum than any laboratory achieves. It is dense only by comparison with the $\sim1$ cm$^{-3}$ warm neutral medium around it.

### 2.1 Why the gas is molecular at all

Hydrogen does not become molecular spontaneously in the gas phase — the reaction $H + H \to H_2$ cannot conserve energy and momentum without a third body, and three-body collisions are hopeless at these densities. **H$_2$ forms on dust grains**, where an atom adsorbs, migrates across the surface, meets another, and the released binding energy ejects the molecule.

It is also destroyed easily: ultraviolet photons in the Lyman–Werner bands dissociate H$_2$, so molecular gas survives only where it is shielded. Two mechanisms shield it — dust extinction, requiring roughly $A_V > 1$ magnitude, and **self-shielding**, in which the outer layers of H$_2$ absorb the dissociating photons and protect the interior.

The consequence is a layered structure. A cloud's exterior is atomic, then a shielded layer becomes molecular in H$_2$ while carbon remains ionised, and only deeper still does CO form. **The CO-emitting region is therefore always smaller than the H$_2$ region**, which is the physical origin of CO-dark gas and the reason the conversion factor degrades at low metallicity, where there is less dust to shield.

```checkpoint
q: Why is molecular hydrogen — the dominant constituent of molecular clouds — almost never observed directly in them?
a: Because it is destroyed by ultraviolet radiation before it can be detected
x: It is shielded in cloud interiors and survives in vast quantities; the difficulty is emission, not survival.
a*: Because H$_2$ is homonuclear and has no dipole moment, so its lowest transition is a quadrupole line whose upper level lies at $510$ K — unpopulated in $10$ K gas
a: Because its emission lines fall in a wavelength range absorbed by Earth's atmosphere
x: Even from space the emission is absent, since the levels are not populated at cloud temperatures.
a: Because it is too diffuse; the column densities are too low for detection
x: Column densities are high — often above $10^{22}\ \mathrm{cm^{-2}}$. Abundance is not the problem.
hint: Ask what determines whether a molecule can emit at low temperature.
why: A homonuclear diatomic molecule has identical nuclei and therefore no permanent electric dipole moment, which forbids dipole rotational transitions. H$_2$'s lowest allowed rotational transition is the quadrupole $J=2\to0$, whose upper level sits at $E/k = 510$ K. At the $10$ K of a molecular cloud the Boltzmann factor is $e^{-51}$, so essentially no molecules occupy it and the gas is radiatively silent. This is why the field is built on proxies: CO, which is heteronuclear and radiates at $115.271$ GHz from levels excited at a few kelvin, and dust continuum. Both require conversion factors — $X_{\rm CO} \approx 2\times10^{20}\ \mathrm{cm^{-2}(K\,km\,s^{-1})^{-1}}$ with about $30\%$ systematic uncertainty in the Milky Way, worse at low metallicity where CO photodissociates while H$_2$ self-shields, leaving "CO-dark" gas. Every cloud mass and star formation efficiency in the literature has passed through such a factor, which is worth remembering whenever a claimed effect is a factor of two.
---
q: Molecular hydrogen cannot form efficiently by $H + H$ collisions in the gas phase. Why not, and where does it form?
a: The reaction is endothermic and cannot proceed at $10$ K
x: It is strongly exothermic — that is precisely the problem, since the released energy must go somewhere.
a*: A two-body collision cannot conserve both energy and momentum while forming a bound state, so H$_2$ forms on dust grain surfaces, which absorb the excess energy
a: Hydrogen atoms repel electrostatically, and at $10$ K they lack the energy to overcome the barrier
x: Neutral hydrogen atoms attract at molecular separations; there is no Coulomb barrier between them.
a: It does form in the gas phase, but ultraviolet radiation destroys it as fast as it forms
x: Photodissociation is real but is defeated by shielding; the formation bottleneck is separate and more fundamental.
hint: Consider what happens to the binding energy released when two atoms form a molecule.
why: Forming H$_2$ releases $4.5$ eV of binding energy, and in a two-body collision there is no way to dispose of it: energy and momentum conservation for two particles going to one leaves the product with exactly the energy it needs to fly apart again, and radiative de-excitation is forbidden by the same lack of a dipole moment that makes H$_2$ invisible. Three-body collisions solve the problem but are hopelessly rare at $100\ \mathrm{cm^{-3}}$. The resolution is **dust**: an atom sticks to a grain surface, migrates across it, meets another adsorbed atom, and the grain absorbs the released energy while the newly formed molecule is ejected. This makes molecular cloud formation dependent on dust abundance and therefore on metallicity, which is one reason the earliest generation of stars — forming before any dust existed — had to proceed through a different and much less efficient coolant. It also connects to the shielding requirement: dust both builds H$_2$ and protects it, since molecular gas survives only where roughly $A_V > 1$ or where H$_2$ self-shielding in the Lyman–Werner bands is effective.
```

## 3. The Jeans analysis, and why it makes things worse

The classical criterion for gravitational collapse compares self-gravity against thermal pressure. A uniform region collapses if its mass exceeds the Jeans mass,

$$M_J = \left(\frac{5kT}{G\mu m_H}\right)^{3/2}\left(\frac{3}{4\pi\rho}\right)^{1/2},$$

with $\mu = 2.33$ for molecular gas with helium. Evaluating it across cloud conditions:

| $T$ (K) | $n$ (cm$^{-3}$) | $M_J$ ($M_\odot$) | $\lambda_J$ (pc) | $t_{\rm ff}$ (yr) |
|---|---|---|---|---|
| $10$ | $10^2$ | $53.7$ | $2.12$ | $3.4\times10^6$ |
| $10$ | $10^3$ | $17.0$ | $0.67$ | $1.1\times10^6$ |
| $10$ | $10^4$ | $5.4$ | $0.21$ | $3.4\times10^5$ |
| $10$ | $10^5$ | $1.7$ | $0.067$ | $1.1\times10^5$ |
| $20$ | $10^4$ | $15.2$ | $0.30$ | $3.4\times10^5$ |

**The problem is immediate.** A giant molecular cloud of $10^5\,M_\odot$ at $n = 100$ cm$^{-3}$ contains about two thousand Jeans masses. Thermal pressure is not remotely sufficient to support it. On this analysis the cloud should be collapsing globally, on its free-fall time of $3.4$ Myr, and converting most of its mass to stars.

Two features of the table deserve notice because they shape everything downstream.

**The Jeans mass falls as density rises**, as $\rho^{-1/2}$. So once collapse begins, progressively smaller sub-regions become independently unstable — the cloud does not collapse as a unit but **fragments**, which is why stars form in groups and clusters rather than singly, and why the fragment scale of a few solar masses is roughly the stellar mass scale.

**The free-fall time also falls as density rises**, as $\rho^{-1/2}$. Denser sub-regions collapse faster than their surroundings, which accelerates fragmentation and means the densest parts run away first.

So thermal pressure cannot be the answer. Something else supports these clouds, and the two candidates are turbulence and magnetic fields.

## 4. Turbulence

### 4.1 The observation

Molecular line widths are far broader than thermal. At $10$ K the sound speed in molecular gas is

$$c_s = \sqrt{\frac{kT}{\mu m_H}} = 0.188\ \text{km s}^{-1},$$

while observed velocity dispersions in giant clouds are around $5$ km s$^{-1}$. The Mach number is therefore about $27$: **the internal motions are highly supersonic.**

Larson found in 1981 that these motions follow scaling relations,

$$\sigma_v \approx 1.1\left(\frac{L}{\text{pc}}\right)^{0.38}\ \text{km s}^{-1},$$

giving $3.4$ km s$^{-1}$ at $20$ pc and $1.1$ km s$^{-1}$ at $1$ pc. The exponent is close to the $1/3$ of Kolmogorov turbulence and closer still to the $1/2$ expected for supersonic, shock-dominated turbulence. **The motions are a turbulent cascade, not random noise.**

A related relation is that clouds are roughly virialised: the virial parameter

$$\alpha_{\rm vir} = \frac{5\sigma_v^2 R}{GM}$$

is of order unity to a few — $5.8$ for a $10^5\,M_\odot$ cloud of radius $20$ pc with $\sigma_v = 5$ km s$^{-1}$, and closer to $2$ for denser clumps. Clouds are not far from balance between gravity and turbulent kinetic energy.

### 4.2 What turbulence does

Turbulence plays two opposite roles simultaneously, and this dual character is the key idea.

**On large scales it supports.** Supersonic motions provide a pressure-like term far exceeding thermal pressure, raising the effective Jeans mass by roughly $\mathcal{M}^3$ and preventing global collapse.

**On small scales it compresses.** Supersonic turbulence is a network of shocks, and shocks create dense sheets and filaments. The compressed regions have locally reduced Jeans masses and can collapse even while the cloud as a whole is supported.

So turbulence both prevents the cloud from collapsing wholesale and creates the specific sites where collapse does happen. **This is the leading explanation for the low efficiency**: only the small fraction of mass compressed into locally supercritical regions collapses, which is naturally of order per cent per free-fall time.

### 4.3 The problem with turbulence

Supersonic turbulence **decays fast.** Simulations consistently show the kinetic energy dissipating in about one crossing time — for a $20$ pc cloud with $5$ km s$^{-1}$ motions, roughly $4$ Myr, comparable to the free-fall time itself. Shocks are efficient radiators and there is no mechanism for supersonic motions to persist without replenishment.

So turbulence cannot be a static support. **It must be continuously driven**, and identifying the driver is an open problem with several candidates: supernovae, which dominate the energy budget of the interstellar medium globally but may not couple well to dense gas; expanding H II regions and stellar winds from newly formed stars within the cloud; galactic-scale processes such as spiral arm passage and differential rotation; and gravitational collapse itself, which converts potential energy into motion and may be self-sustaining.

**This is unresolved.** It is also where the field's model dependence is greatest, since the driving scale and mechanism strongly affect simulated outcomes.

{{image: Molecular cloud | A dark cloud silhouetted against background starlight, its opacity due to dust rather than to the molecular hydrogen that dominates its mass. The structures visible are filamentary rather than spheroidal, a morphology that Herschel surveys showed to be universal and to have a characteristic width near a tenth of a parsec independent of the cloud's mass or the filament's own density. Dense cores form along filaments rather than at random positions within clouds, which locates star formation in a specific and reproducible geometry.}}

```checkpoint
q: A giant molecular cloud contains roughly two thousand Jeans masses. What follows?
a: It is stable, since exceeding the Jeans mass many times over means the analysis does not apply
x: Exceeding the Jeans mass is precisely the instability condition; exceeding it two thousand times makes the instability more severe, not less.
a*: Thermal pressure cannot support it, so either something else does or the cloud is collapsing — and since observed star formation is two hundred times too slow, something else must
a: It will collapse into a single star of $10^5\,M_\odot$
x: The Jeans mass falls as density rises, so the cloud fragments as it collapses rather than remaining a single unit.
a: The Jeans analysis is invalid for molecular clouds and can be discarded
x: It is valid and informative: it establishes what thermal pressure can and cannot do, which is exactly how the need for other support is identified.
hint: Ask what the Jeans criterion actually compares, and what other pressures might be present.
why: The Jeans criterion compares self-gravity with *thermal* pressure alone. At $T = 10$ K and $n = 100\ \mathrm{cm^{-3}}$, $M_J = 54\,M_\odot$, so a $10^5\,M_\odot$ cloud exceeds it by a factor of about two thousand — thermal support is nowhere near sufficient, and on this analysis the cloud should collapse globally on its free-fall time of $3.4$ Myr. Since the Milky Way's molecular gas would then form some $300\,M_\odot$ of stars per year rather than the observed $1$–$2$, additional support must exist, and the candidates are supersonic turbulence and magnetic fields. Two further consequences follow from the table's scalings. $M_J \propto \rho^{-1/2}$, so as collapse proceeds smaller sub-regions become independently unstable and the cloud **fragments** rather than collapsing as a unit — which is why stars form in groups and why the fragment scale is of order a solar mass. And $t_{\rm ff}\propto\rho^{-1/2}$ likewise, so denser regions collapse faster than their surroundings and the fragmentation runs away.
---
q: Supersonic turbulence in molecular clouds decays in roughly one crossing time. Why is this a problem, and what does it imply?
a: It implies clouds cannot exist, since without turbulent support they would collapse immediately
x: They would collapse on a free-fall time, not immediately — and clouds plainly exist, so the inference must be about driving rather than existence.
a*: It means turbulence cannot be a static, inherited support: it must be continuously driven, and identifying the driver is unresolved
a: It implies the observed line widths are not turbulence but systematic infall
x: Infall contributes in some clouds, but the observed scaling of line width with size follows a turbulent cascade law, which bulk infall does not naturally reproduce.
a: It is not a problem, since clouds are destroyed by feedback on the same timescale anyway
x: Cloud lifetimes are longer than a single crossing time, so the turbulence must be sustained during that interval regardless of eventual destruction.
hint: Compare the decay time with the free-fall time and ask what would happen over a cloud's lifetime without replenishment.
why: Supersonic motions are a network of shocks, and shocks radiate efficiently, so simulations consistently find the kinetic energy dissipating within about one crossing time — roughly $4$ Myr for a $20$ pc cloud at $5\ \mathrm{km\,s^{-1}}$, comparable to the free-fall time itself. Turbulence therefore cannot be a reservoir inherited at formation and drawn down slowly; something must keep injecting energy for as long as the cloud is supported. The candidate drivers are supernovae, which dominate the interstellar energy budget globally but may couple poorly to dense gas; H II regions and winds from stars forming within the cloud, which is an attractive self-regulating loop; galactic-scale shear and spiral arm passage; and gravitational collapse itself, which converts potential energy into motion. **None is established**, and the choice matters because the driving scale and mechanism strongly affect simulated star formation efficiencies — making this the point where the field's model dependence is largest.
```

## 5. Magnetic fields

The second candidate support, and the more contentious one.

### 5.1 The mass-to-flux ratio

Ions are tied to magnetic field lines and neutrals are collisionally coupled to ions, so the field resists compression perpendicular to itself. Whether it can prevent collapse outright is set by the ratio of mass to magnetic flux. There is a critical value,

$$\left(\frac{M}{\Phi}\right)_{\rm crit} = \frac{1}{2\pi\sqrt{G}},$$

above which gravity wins regardless of field strength — because flux is frozen in, so compression strengthens the field but gravity grows faster.

A region with $M/\Phi$ below critical is **subcritical** and cannot collapse by gravity alone; above critical it is **supercritical** and the field only slows collapse rather than stopping it.

### 5.2 What is measured

Field strengths come from Zeeman splitting — the only direct method — supplemented by the Chandrasekhar–Fermi technique, which infers field strength from the dispersion of dust polarisation angles. Zeeman measurements are difficult and detections are relatively few.

The picture that has emerged is that **diffuse atomic gas tends to be subcritical while dense molecular cores tend to be modestly supercritical**, typically by a factor of two or three. This makes magnetic fields important but not decisive: strong enough to influence geometry and slow collapse, not strong enough to prevent it in the regions that matter.

### 5.3 Ambipolar diffusion, and how the field's role was downgraded

If cores were subcritical, the classical route to collapse would be **ambipolar diffusion**: neutrals, which feel no magnetic force directly, drift slowly through the ion–field fluid, so mass gradually concentrates while flux stays behind, raising $M/\Phi$ until the core becomes supercritical.

This was the standard model of low-mass star formation from the 1970s through the 1990s, and it predicted long core lifetimes — around ten free-fall times.

**Observations did not support it.** Statistical arguments from the ratio of starless to star-forming cores indicate core lifetimes of only a few free-fall times, not ten. Prestellar cores are also more often modestly supercritical than subcritical. The consensus shifted toward turbulence-dominated pictures in which collapse is rapid and magnetic fields shape rather than delay it.

**This is a case worth noting as a matter of method**: a well-developed, quantitatively specific theory was displaced primarily by a statistical argument about lifetimes rather than by a single decisive measurement, and the displacement took about two decades. Magnetic fields are not irrelevant — they set outflow geometry, they influence fragmentation, and they remove angular momentum by magnetic braking, which is essential for forming discs at all — but they are no longer the primary answer to the support question.

```checkpoint
q: What does it mean for a region to be magnetically supercritical?
a: That its magnetic field exceeds the strength at which the gas can remain ionised
x: Ionisation fraction is set by cosmic rays and recombination, not by field strength, and is unrelated to the criterion.
a*: That its ratio of mass to enclosed magnetic flux exceeds $1/2\pi\sqrt{G}$, so gravity must win regardless of how strong the field is
a: That the magnetic pressure exceeds the thermal pressure, so the field dominates the support
x: Magnetic pressure typically does exceed thermal pressure in these clouds, in both subcritical and supercritical regions; that comparison is not the criterion.
a: That the field is strong enough to prevent collapse indefinitely
x: That is *sub*critical. The terms are the other way round.
hint: Ask what happens to the field and to gravity as a flux-frozen region is compressed.
why: Because magnetic flux is frozen into the gas, compressing a region strengthens its field — but gravity grows faster with compression than magnetic support does. The competition therefore has a threshold that depends only on the ratio of mass to enclosed flux, $M/\Phi$, with critical value $1/2\pi\sqrt{G}$. **Above it the region is supercritical and no field strength can prevent collapse**; below it the region is subcritical and gravity alone cannot proceed. Measurements — Zeeman splitting, which is the only direct method, supplemented by the Chandrasekhar–Fermi technique using dust polarisation angle dispersion — indicate that diffuse atomic gas tends to be subcritical while dense molecular cores are typically modestly supercritical, by factors of two or three. That places magnetic fields in an intermediate role: strong enough to shape geometry, channel accretion along field lines, set outflow orientation, and remove angular momentum by magnetic braking without which discs could not form at all, but not strong enough to be the answer to the support question.
---
q: Cloud lifetimes are estimated at $10$–$30$ Myr, a few free-fall times. Why does this number matter so much?
a: Because it determines how many stars a cloud can form before its gas cools below the temperature required for collapse
x: Clouds are already near their minimum temperature of about $10$ K; further cooling is not what limits them.
a*: Because integrated efficiency is roughly the lifetime in free-fall times multiplied by the efficiency per free-fall time, so the lifetime directly sets how much of a cloud becomes stars
a: Because it sets the age spread of stars within a cluster, which is the main observable
x: Age spreads are a consequence rather than the reason the lifetime matters; the efficiency budget is the substantive issue.
a: Because clouds must survive at least one orbital period of the Galaxy to be observed
x: Galactic orbital periods are around $200$ Myr, far longer than cloud lifetimes, and observability does not require survival for an orbit.
hint: Write the integrated efficiency in terms of the per-free-fall efficiency and the number of free-fall times.
why: A cloud converting a fraction $\epsilon_{\rm ff}$ of its mass per free-fall time, and surviving $n$ free-fall times, converts roughly $n\,\epsilon_{\rm ff}$ in total. With $\epsilon_{\rm ff} \approx 0.01$, a lifetime of two free-fall times gives $2\%$ and a lifetime of ten gives $10\%$ — so the lifetime is half of the efficiency problem, and observed integrated efficiencies of a few per cent select the short-lifetime, low-per-free-fall combination. The lifetime is set by **feedback**: once massive stars form, their ionising radiation creates expanding H II regions, their winds and radiation pressure disperse the gas, and supernovae finish the job, all within $10$–$30$ Myr. The wider significance is that **star formation is self-limiting** — forming stars destroys the reservoir that forms stars — which is why the Milky Way, holding enough molecular gas to produce $300\,M_\odot$ per year, produces one or two. The number is also among the more contested in the field, since it is inferred statistically rather than observed, typically from the fraction of clouds hosting young clusters or from the spatial offsets between gas and star formation tracers in nearby galaxies.
```

## 6. How the numbers are actually obtained

The tables above give densities, temperatures and masses to two significant figures. It is worth knowing what those numbers rest on, because the inference chain is longer than the presentation suggests.

**Density comes from choosing a tracer with the right critical density.** A molecular transition is collisionally excited only where the density is high enough that collisions compete with spontaneous radiative decay. The threshold is the critical density $n_{\rm crit} = A_{ul}/\gamma_{ul}$, the ratio of the spontaneous emission rate to the collisional de-excitation rate, and it varies enormously between molecules — roughly $10^3\ \text{cm}^{-3}$ for CO(1–0), $10^5$ for HCN(1–0), $10^6$ for higher transitions. **Detecting a line therefore establishes a density floor**, and mapping several transitions of several molecules brackets the density from both sides. This is why the standard observing strategy uses a suite of tracers rather than a single best one.

**Temperature comes from line ratios.** The relative populations of rotational levels follow a Boltzmann distribution at the excitation temperature, so the ratio of two transitions of the same molecule gives that temperature. Where densities are high enough for local thermodynamic equilibrium, excitation temperature equals kinetic temperature; where they are not, it lies below, and the inferred temperature is a lower bound. Ammonia is the standard thermometer because its inversion transitions have convenient sensitivity.

**Mass comes from column density times area**, with column from either the CO conversion factor or dust emission, and area from an assumed distance. **Distance is often the weakest link**: a cloud's distance may be known to $10$–$20\%$ at best, and mass scales as distance squared while density scales inversely with distance, so a $20\%$ distance error is a $44\%$ mass error. Gaia parallaxes to young stars associated with nearby clouds have improved this substantially in the last decade, and several standard cloud masses moved by tens of per cent as a result.

**Velocity dispersion comes from line widths**, which is the most direct measurement in the list — but the line must be optically thin, since optical depth broadens a line independently of any motion, and a thick line will overstate the dispersion.

The point of this section is not to undermine the numbers but to place them correctly. **They are inferences with stated uncertainties of tens of per cent, not measurements with per-cent errors**, and the factor of two hundred that organises the chapter is robust precisely because it is far larger than any of these.

## 7. Structure: filaments everywhere

Herschel's far-infrared surveys, mapping dust continuum at high resolution, produced the most significant morphological result of recent decades: **molecular clouds are filamentary at every scale**, and the filaments have a characteristic width.

That width is about $0.1$ pc, and it appears to be **independent of the filament's length, mass or central density** — an unexpected universality. Proposed explanations include the sonic scale at which turbulence becomes subsonic, magnetic effects, and the balance between accretion and dissipation; none is settled.

Two consequences are firmly established.

**Dense cores form along filaments**, not at random positions, and predominantly in filaments whose line mass exceeds the critical value for a self-gravitating isothermal cylinder, $M/L_{\rm crit} = 2c_s^2/G \approx 16\,M_\odot\ \text{pc}^{-1}$ at $10$ K. Subcritical filaments are largely starless.

**The hierarchy is real and continuous**: cloud → filament → clump → core, with each level denser, smaller and shorter-lived than the last, and the Jeans mass falling throughout. Star formation is what happens at the bottom of that cascade.

## 8. Destruction, and the lifetime question

Clouds do not persist. Once massive stars form, they destroy their birthplaces through ionising radiation creating expanding H II regions, radiation pressure on dust, stellar winds, and eventually supernovae.

Estimated giant molecular cloud lifetimes are $10$–$30$ Myr, or a few free-fall times. This is one of the more actively contested numbers in the field, since it is inferred rather than observed — typically from the statistics of clouds with and without associated young clusters, or from the relative spatial offsets of gas and star formation tracers across nearby galaxies.

**The lifetime matters because it fixes the efficiency.** If a cloud lives ten free-fall times and converts $1\%$ of its mass per free-fall time, it converts about $10\%$ before being destroyed; if it lives two, it converts $2\%$. Observed integrated efficiencies of a few per cent are consistent with short lifetimes and low per-free-fall efficiency, which is the currently favoured combination.

**Feedback is therefore not a detail but a regulator.** Star formation limits itself: forming stars destroys the gas reservoir that forms stars. This is why galaxies convert gas to stars so slowly and why the Milky Way, with enough molecular gas to make $300\,M_\odot$ per year, makes one or two.

```checkpoint
q: Ambipolar diffusion was the standard model of low-mass star formation for two decades. What displaced it?
a: A direct measurement showing molecular cloud cores have no magnetic fields
x: Cores do have measurable fields, from Zeeman splitting and dust polarisation; the issue was their strength relative to critical, not their existence.
a*: Statistical evidence that core lifetimes are a few free-fall times rather than the ten or so the model requires, together with cores being found modestly supercritical rather than subcritical
a: The discovery that magnetic fields play no role in star formation
x: They demonstrably do — setting outflow geometry, influencing fragmentation, and removing angular momentum by magnetic braking, without which discs would not form.
a: Simulations showing that ambipolar diffusion cannot occur in ionised gas
x: The process is well understood physically and does occur; the dispute was about whether it is the rate-limiting step.
hint: Ask what observable the model most sharply predicted, and how it could be tested statistically.
why: Ambipolar diffusion has neutrals drifting slowly through the ion–field fluid so that mass concentrates while magnetic flux stays behind, gradually raising $M/\Phi$ until a subcritical core becomes supercritical. The model's sharp prediction is a **long core lifetime**, around ten free-fall times, since the drift is slow. That prediction is testable statistically: the ratio of starless to star-forming cores in a survey measures the relative durations of the two phases, and the observed ratios imply lifetimes of only a few free-fall times. Zeeman and polarisation measurements independently indicate that dense cores are typically modestly *supercritical*, by factors of two or three, rather than subcritical — so the process the model requires has usually already been bypassed. The field shifted to turbulence-dominated pictures with rapid collapse. Two lessons are worth taking. Magnetic fields remain important without being the answer to the support question — they shape rather than delay. And a well-developed, quantitatively specific theory was displaced by a *statistical* argument about lifetimes rather than by any single decisive measurement, a slower and less dramatic mode of theory change than the standard account of science suggests.
---
q: The Milky Way's molecular gas could form $\sim300\,M_\odot$ of stars per year in free fall but forms $1$–$2$. Which explanation is best supported?
a: Most molecular gas is not actually self-gravitating, so free-fall arguments do not apply to it
x: Virial parameters of order unity to a few show clouds are close to gravitationally bound; they are not merely transient overdensities.
a*: Supersonic turbulence supports clouds globally while creating locally collapsing regions, so only a per cent of the mass collapses per free-fall time — and feedback destroys the cloud after a few free-fall times
a: Magnetic fields hold the clouds up entirely, preventing collapse except where the field is weak
x: Dense cores are typically modestly supercritical, so fields slow and shape collapse rather than preventing it.
a: The free-fall time is much longer than calculated because clouds are hotter than assumed
x: Cloud temperatures near $10$ K are well measured, and $t_{\rm ff}$ depends on density rather than temperature in any case.
hint: Look for an explanation that accounts for both the global suppression and the fact that stars do form somewhere.
why: The factor of two hundred requires an explanation that suppresses collapse overall while still permitting it locally, and supersonic turbulence does exactly that by acting in two directions at once. On large scales it supplies a pressure-like support far exceeding thermal pressure — the sound speed at $10$ K is $0.188\ \mathrm{km\,s^{-1}}$ against observed dispersions near $5\ \mathrm{km\,s^{-1}}$, a Mach number of about $27$ — raising the effective Jeans mass and preventing global collapse. On small scales it is a network of shocks that compresses gas into sheets and filaments where the local Jeans mass drops and collapse proceeds. Only that small compressed fraction forms stars, naturally giving an efficiency of order a per cent per free-fall time. Feedback supplies the second half: once massive stars form, ionising radiation, winds and supernovae destroy the cloud within $10$–$30$ Myr, capping the integrated efficiency at a few per cent. Magnetic fields contribute by shaping and slowing rather than preventing. **Star formation is self-limiting** — forming stars destroys the reservoir that forms stars — which is why galaxies convert gas so slowly.
```

## 9. From cores to stars: where the mass function may be set

One further result belongs here, because it is the strongest current claim that the *outcome* of star formation — the distribution of stellar masses — is determined at the cloud stage rather than later.

Surveys of dense cores in nearby clouds yield a **core mass function**, and its shape closely resembles the stellar initial mass function: a power law at high mass with roughly the Salpeter slope, flattening below about a solar mass, with a peak. The two differ mainly by a horizontal shift, consistent with each core converting about a third of its mass into a star and losing the rest to outflows and dispersal.

**If that correspondence is real, the initial mass function is inherited from the fragmentation of clouds**, and the physics that sets it is turbulent fragmentation plus the thermal Jeans mass — that is, entirely the physics of this chapter, with nothing added by the later collapse and accretion stages.

Three reasons the conclusion is not yet secure, and they are worth stating because the resemblance is often presented as settled.

**The mapping may not be one-to-one.** A core may fragment into a binary or a small multiple, in which case a single core mass produces several stellar masses and the transformation is not a simple shift. Multiplicity is high among massive stars and substantial among solar-type stars, so this is not a small correction.

**Cores may still be accreting.** If a core continues to gain mass from its filament while collapsing — and filamentary accretion flows are observed — then the core mass measured today is not the mass that determines the final star, and the observed function is a snapshot of a growing distribution rather than a fixed one.

**Core identification is algorithmic.** Extracting "cores" from a continuous hierarchical density field requires a choice of algorithm and threshold, and the recovered mass function depends measurably on that choice. Two groups analysing the same map with different extraction methods can obtain different slopes.

**The honest position** is that the resemblance is real and striking, that it makes cloud-scale fragmentation the leading candidate for the origin of the initial mass function, and that a demonstration would require following individual cores to their stellar outcomes — which is beyond current observational reach because the timescales are $10^5$ years and the objects are deeply embedded.

## 10. What is open

**What drives the turbulence.** Undetermined among supernovae, internal feedback, galactic shear and gravitational collapse, and the answer affects simulated efficiencies substantially.

**Why filaments have a universal $0.1$ pc width.** Several proposals, no consensus, and the universality itself is occasionally disputed on resolution grounds.

**How long clouds live.** Estimates range over a factor of three, and the number directly sets the integrated efficiency.

**How much CO-dark gas there is**, particularly at low metallicity, which propagates into extragalactic molecular masses and therefore into star formation laws measured across galaxy populations.

**Whether the initial mass function's origin lies here.** Core mass functions resemble the stellar initial mass function shifted by an efficiency factor of about a third, which suggests the stellar mass distribution is set at the core stage — but whether cores map one-to-one onto stars, and whether the resemblance survives better statistics, remains open.

{{image: Bok globule | A small, dense, isolated molecular cloud seen in silhouette. Objects of this class are among the simplest star-forming units — masses of a few to a few tens of solar masses, sizes below a parsec, temperatures near ten kelvin — and their relative simplicity makes them the closest available approximation to the idealised collapse problem. Their opacity is caused by dust grains, which also catalyse the formation of the molecular hydrogen that dominates the mass and shield it from the ultraviolet radiation that would otherwise dissociate it.}}

```checkpoint
q: The core mass function closely resembles the stellar initial mass function, shifted by about a factor of three in mass. What does this support, and how securely?
a: It proves the initial mass function is set by cloud fragmentation, since the shapes match
x: The resemblance is striking but three specific difficulties prevent it from being a proof, all concerning whether cores map cleanly onto stars.
a*: It makes cloud-scale fragmentation the leading candidate for the origin of the initial mass function, but the mapping from cores to stars is not established
a: It shows that about a third of each core becomes a star, which is a measured efficiency
x: The factor of three is *inferred* from the shift on the assumption of a one-to-one mapping; it is a consequence of the interpretation, not an independent measurement.
a: Nothing, since the two functions describe different populations and a resemblance between them is coincidental
x: A matching power-law slope and a matching turnover across the same mass range is not plausibly coincidental; it demands an explanation.
hint: Ask what would have to be true for a core mass function to translate directly into a stellar mass function.
why: The core mass function has roughly the Salpeter slope at high mass and flattens below a solar mass, mirroring the stellar initial mass function offset by about a factor of three — consistent with each core converting around a third of its mass to a star and losing the rest to outflows and dispersal. If that correspondence holds, the stellar mass distribution is inherited from turbulent fragmentation plus the thermal Jeans mass, so the physics of this chapter fixes the outcome and later accretion adds nothing. Three difficulties block the conclusion. **The mapping may not be one-to-one**: cores that fragment into binaries or multiples turn one core mass into several stellar masses, and multiplicity is substantial. **Cores may still be accreting** from their filaments, so today's core mass is not what determines the final star. And **core identification is algorithmic** — extracting discrete cores from a continuous hierarchical density field requires threshold choices, and recovered slopes depend measurably on them. Settling it would require following individual cores to their stellar outcomes over $10^5$ years while they are deeply embedded, which is beyond current reach.
---
q: Which of the open problems listed for molecular clouds would most change the quantitative picture if resolved?
a: The universal $0.1$ pc filament width, since it would explain cloud morphology
x: It would be a satisfying result about structure, but morphology alone does not move the efficiency numbers that organise the subject.
a*: What drives the turbulence, since the driving scale and mechanism strongly affect simulated star formation efficiencies and the turbulent picture is the current answer to the factor of two hundred
a: The amount of CO-dark gas, since it changes every mass estimate
x: It matters for extragalactic masses and star formation laws, but it is a tens-of-per-cent effect on quantities whose central puzzle is a factor of two hundred.
a: Whether the initial mass function originates in cores, since it would settle the outcome of star formation
x: Important, but it concerns the distribution of stellar masses rather than the rate at which stars form, which is the chapter's organising problem.
hint: Ask which unknown feeds directly into the explanation of the chapter's central factor.
why: The chapter's organising fact is that the Galaxy forms stars two hundred times more slowly than free fall allows, and the leading explanation is supersonic turbulence supporting clouds globally while compressing gas locally. But turbulence decays in about one crossing time — roughly $4$ Myr for a $20$ pc cloud, comparable to the free-fall time itself — so it must be continuously driven, and **the driver is unidentified** among supernovae, internal feedback from newly formed stars, galactic shear and spiral arm passage, and gravitational collapse itself. This is not a peripheral gap: the driving scale and mechanism materially change the efficiency that simulations produce, so the current explanation of the central number rests on an unspecified input. The other open problems matter but are narrower — CO-dark gas is a tens-of-per-cent correction to masses, the filament width concerns morphology, and the core-to-star mapping concerns the distribution of outcomes rather than the rate. When assessing which unknown to prioritise, the useful test is which one feeds directly into the quantity the field is actually trying to explain.
```

## 11. Pulling the thread

- **The central fact is a factor of two hundred.** The Milky Way's $10^9\,M_\odot$ of molecular gas would form $300\,M_\odot\,\text{yr}^{-1}$ in free fall and forms $1$–$2$. Everything else in the subject is an answer to that.
- **The dominant molecule is invisible.** H$_2$ is homonuclear, its lowest transition needs $510$ K, and every quoted cloud mass has passed through a CO or dust conversion factor good to about $30\%$.
- **Thermal pressure is hopeless.** $M_J = 54\,M_\odot$ at cloud conditions, so a GMC holds two thousand Jeans masses. And because $M_J \propto \rho^{-1/2}$, collapse fragments rather than proceeding as a unit — which is why stars form in groups.
- **Turbulence supports and compresses at once.** Mach $\sim27$ motions raise the effective Jeans mass globally while shocking gas into locally collapsing filaments. This dual role is the leading explanation of the low efficiency.
- **But turbulence decays in a crossing time**, so it must be driven, and the driver is unidentified.
- **Magnetic fields shape rather than prevent.** Cores are modestly supercritical; ambipolar diffusion was displaced as the standard model by statistical lifetime arguments, not by a decisive measurement.
- **Filaments are universal, with a $0.1$ pc width nobody has explained**, and cores form along supercritical filaments rather than at random.
- **Feedback regulates.** Clouds live $10$–$30$ Myr before their own massive stars destroy them, capping integrated efficiency at a few per cent.

The transferable idea: **when a system's observed rate falls far below its natural rate, the interesting physics is in the brake, not the engine.** The gravitational instability of molecular clouds is not in doubt and never was; what took fifty years to understand is what prevents it from running at full speed. The same inversion applies widely — the puzzle of the interstellar medium is not why gas cools but why it stays hot, the puzzle of galaxy formation is not why gas falls in but why so few baryons became stars, and the puzzle of the Sun is not why it fuses but why it fuses so slowly. **When a natural process is observed running two orders of magnitude below its unimpeded rate, the rate-limiting step is the subject**, and it is usually somewhere less obvious than the driving force.

## 12. Further reading

{{book: Bruce T. Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Steven W. Stahler and Francesco Palla | The Formation of Stars | 2004}}

{{book: Mark R. Krumholz | Star Formation | 2017}}

Beyond the books: Draine is the standard reference for the microphysics — H$_2$ formation on grains, shielding, and cooling — and is unusually careful about what is measured versus modelled. Larson's 1981 paper establishing the scaling relations is short and worth reading in the original for how the relations were extracted from heterogeneous data. On the shift away from ambipolar diffusion, the exchange over core lifetimes in the early 2000s is instructive as a case study in how a well-developed theory is displaced statistically. Herschel's Gould Belt survey papers are the source for the filament universality result.

## Problems

*Useful numbers: $M_J = (5kT/G\mu m_H)^{3/2}(3/4\pi\rho)^{1/2}$ with $\mu = 2.33$; at $T=10$ K, $n=10^2$ cm$^{-3}$: $M_J = 54\,M_\odot$, $\lambda_J = 2.1$ pc, $t_{\rm ff} = 3.4$ Myr; $c_s = 0.188$ km s$^{-1}$ at $10$ K; $t_{\rm ff} = \sqrt{3\pi/32G\rho}$; $\alpha_{\rm vir} = 5\sigma_v^2R/GM$; Larson $\sigma_v = 1.1(L/\mathrm{pc})^{0.38}$ km s$^{-1}$; $X_{\rm CO} = 2\times10^{20}$ cm$^{-2}$(K km s$^{-1}$)$^{-1}$; CO(1–0) at $115.271$ GHz; H$_2$ $S(0)$ upper level $510$ K; filament critical line mass $2c_s^2/G = 16\,M_\odot$ pc$^{-1}$; Galactic H$_2$ mass $10^9\,M_\odot$, observed SFR $1$–$2\,M_\odot$ yr$^{-1}$.*

**1.** *(The central number.)* **(a)** Compute the star formation rate the Galaxy would have if its molecular gas collapsed in free fall at $n = 100$ cm$^{-3}$. **(b)** Compare with observation and give the efficiency per free-fall time. **(c)** State what any successful theory of star formation must therefore explain.

**2.** *(The invisible molecule.)* **(a)** Explain why H$_2$ has no dipole rotational transitions. **(b)** Compute the Boltzmann factor for its lowest transition's upper level at $10$ K. **(c)** State the principal systematic introduced by using CO instead, and where it is worst.

**3.** *(Jeans.)* **(a)** How many Jeans masses does a $10^5\,M_\odot$ cloud at $10$ K and $n = 100$ cm$^{-3}$ contain? **(b)** Given $M_J \propto \rho^{-1/2}$, state what happens as collapse proceeds and what observable consequence follows. **(c)** State why $t_{\rm ff}\propto\rho^{-1/2}$ reinforces this.

**4.** *(Turbulence.)* **(a)** Compute the Mach number for $\sigma_v = 5$ km s$^{-1}$ at $10$ K. **(b)** Explain the dual role of turbulence in one sentence each. **(c)** State the principal difficulty with turbulent support and what it implies.

**5.** *(Virial state.)* **(a)** Compute $\alpha_{\rm vir}$ for a $10^5\,M_\odot$ cloud of radius $20$ pc with $\sigma_v = 5$ km s$^{-1}$. **(b)** Interpret the value. **(c)** State what $\alpha_{\rm vir}\gg1$ and $\alpha_{\rm vir}\ll1$ would each mean.

**6.** *(Magnetic support.)* **(a)** Define the mass-to-flux ratio and state what critical means. **(b)** Summarise what measurements show for diffuse gas and for dense cores. **(c)** Explain what ambipolar diffusion predicted and how that prediction was tested.

**7.** *(Filaments.)* **(a)** State the characteristic width and what makes it surprising. **(b)** Compute the critical line mass at $10$ K and state its role. **(c)** State one firmly established consequence of the filamentary geometry.

**8.** *(Lifetimes and efficiency.)* **(a)** Given a lifetime of $n$ free-fall times and an efficiency of $\epsilon_{\rm ff}$ per free-fall time, write the integrated efficiency. **(b)** Evaluate for $n = 2$ and $n = 10$ with $\epsilon_{\rm ff} = 0.01$. **(c)** State which combination matches observed efficiencies of a few per cent.

**9.** *(Method.)* Star formation research has repeatedly revised its central model — from thermal support, to magnetic support, to turbulent support. **(a)** State what displaced magnetic support. **(b)** State what would displace turbulent support. **(c)** Comment on what this sequence suggests about how confidently the current picture should be held.

## Worked answers

**1.** **(a)** $10^9\,M_\odot/3.4\times10^6\ \text{yr} = 294 \approx 300\,M_\odot\ \text{yr}^{-1}$. **(b)** Observed is $1$–$2\,M_\odot\ \text{yr}^{-1}$, a factor of about $200$ lower, so $\epsilon_{\rm ff} = 1.5/294 = 0.005$, i.e. half a per cent of the mass per free-fall time. **(c)** It must explain what prevents global collapse while still allowing collapse somewhere — a mechanism that suppresses the overall rate by two orders of magnitude without stopping star formation entirely.

**2.** **(a)** Identical nuclei give no permanent electric dipole moment, so dipole rotational transitions are forbidden and the lowest allowed line is the quadrupole $J = 2\to0$. **(b)** $e^{-510/10} = e^{-51} \approx 7\times10^{-23}$ — no population whatsoever. **(c)** The CO line is optically thick, so brightness reflects surface conditions and total column is inferred through $X_{\rm CO}$, good to about $30\%$ in the Milky Way. It is worst at low metallicity, where reduced dust lets CO photodissociate while H$_2$ self-shields, producing CO-dark molecular gas that can be a large fraction of the total.

**3.** **(a)** $10^5/54 = 1850$, roughly two thousand. **(b)** As density rises the Jeans mass falls, so progressively smaller sub-regions become independently unstable: the cloud **fragments** rather than collapsing as a unit, which is why stars form in groups and clusters and why the fragment mass scale is of order a solar mass. **(c)** $t_{\rm ff}$ also falls as $\rho^{-1/2}$, so denser sub-regions collapse faster than their surroundings, accelerating the fragmentation into a runaway rather than a uniform process.

**4.** **(a)** $\mathcal{M} = 5/0.188 = 27$. **(b)** *Support:* supersonic motions supply a pressure-like term far exceeding thermal pressure, raising the effective Jeans mass and preventing global collapse. *Compression:* being a network of shocks, the same turbulence creates dense sheets and filaments whose local Jeans mass is small enough to collapse. **(c)** It decays in about one crossing time — roughly $4$ Myr for a $20$ pc cloud — so it cannot be an inherited reservoir and must be continuously driven; the driver is not identified, which is where the field's model dependence is greatest.

**5.** **(a)** $\alpha_{\rm vir} = 5(5000)^2(20\times3.086\times10^{16})/[6.674\times10^{-11}\times10^5\times1.989\times10^{30}] = 5.8$. **(b)** Of order unity to a few: the cloud is roughly virialised, with turbulent kinetic energy comparable to gravitational binding energy, perhaps modestly unbound. **(c)** $\alpha_{\rm vir}\gg1$ means kinetic energy dominates and the cloud is unbound and dispersing; $\alpha_{\rm vir}\ll1$ means gravity dominates strongly and the cloud should be in rapid global collapse.

**6.** **(a)** $M/\Phi$ compares mass with enclosed magnetic flux; the critical value $1/2\pi\sqrt{G}$ separates configurations where gravity must win from those where the field can hold. Since flux is frozen in, compression strengthens the field but gravity grows faster, so above critical no field strength suffices. **(b)** Diffuse atomic gas tends to be subcritical; dense molecular cores tend to be modestly supercritical, by factors of two or three. **(c)** It predicted long core lifetimes, around ten free-fall times, because neutral drift is slow. The test was statistical: the ratio of starless to star-forming cores measures the relative durations of the phases, and observed ratios imply only a few free-fall times.

**7.** **(a)** About $0.1$ pc, surprising because it appears independent of the filament's length, mass and central density, which no obvious mechanism requires. **(b)** $2c_s^2/G = 2(188)^2/(6.674\times10^{-11}) = 1.06\times10^{15}\ \text{kg m}^{-1}$, which is $16\,M_\odot\ \text{pc}^{-1}$; filaments above it are gravitationally unstable along their length and fragment into cores, filaments below it are largely starless. **(c)** Dense cores form **along filaments** rather than at random positions within clouds, so star formation occurs in a specific reproducible geometry rather than wherever density happens to be high.

**8.** **(a)** Integrated efficiency $\approx n\,\epsilon_{\rm ff}$ for small values. **(b)** $n=2$: $2\%$. $n=10$: $10\%$. **(c)** Observed integrated efficiencies of a few per cent match the short-lifetime, low-per-free-fall-efficiency combination — a cloud living a few free-fall times and converting around a per cent per free-fall time — which is the currently favoured picture and is consistent with feedback destroying clouds within $10$–$30$ Myr.

**9.** **(a)** Statistical evidence on core lifetimes, indicating a few free-fall times rather than the ten ambipolar diffusion requires, together with measurements showing dense cores to be modestly supercritical rather than subcritical. **(b)** Identifying that the turbulence cannot in fact be driven at the required rate; or simulations showing that turbulent fragmentation fails to reproduce the observed efficiency or the initial mass function once the driving is treated self-consistently; or a measurement of core lifetimes or filament properties inconsistent with the turbulent prediction. **(c)** That the current picture rests on a mechanism whose driver is unidentified and whose decay time is comparable to the timescale it must bridge, which is a weaker foundation than the confident textbook presentation implies. Each previous model was well supported in its era and was displaced not by refutation of its physics but by accumulating quantitative mismatch — a pattern that suggests holding the turbulent picture as the best current account rather than as settled, and paying particular attention to the driving problem, since that is where the analogous weakness lies.$spClouds_master$,
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
