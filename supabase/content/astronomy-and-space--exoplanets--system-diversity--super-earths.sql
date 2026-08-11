-- Astronomy & Space · Exoplanets — System Diversity — "Super-Earths".
-- Curated master for
-- astronomy-and-space/exoplanets/system-diversity/super-earths
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Organised around the fact that the commonest class of planet in the
-- Galaxy is one the Solar System does not contain, and around the
-- radius valley that splits it in two. The valley at 1.5-2.0 Earth radii
-- separates bare rocky cores from cores retaining a few per cent of
-- hydrogen and helium by mass, and the reason a few per cent of mass
-- produces a large radius change is the physical heart of the chapter.
-- Then the composition degeneracy - a given mass and radius admits both
-- a water-rich rocky planet and a drier one with a thin envelope, and
-- density alone cannot separate them - and the two competing mass-loss
-- mechanisms, photoevaporation and core-powered loss, with the
-- observations that are gradually discriminating between them.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: Earth-composition mass-radius
-- R/Re = (M/Me)^0.27 giving 1.21 Re at 2 Me, 1.54 at 5 Me and 1.86 at
-- 10 Me, with mean densities of 6.29, 7.49 and 8.54 g/cc; a 50% water
-- planet at the same mass is roughly 20% larger and about 40% less
-- dense, giving 3.73 g/cc at 2 Me and 4.44 at 5 Me; atmospheric scale
-- heights kT/(mu m_H g) of 295 km for a hydrogen-rich sub-Neptune at
-- 700 K, 15 km for a steam-atmosphere super-Earth of the same mass and
-- temperature, and 7 km for Earth.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/system-diversity/super-earths',
    'research',
    'advanced',
    'read',
    $exSE_master$> **The most common kind of planet in the Galaxy is one the Solar System does not have.** Between one and four Earth radii, on orbits inside a hundred days, planets are abundant — perhaps a third to a half of Sun-like stars host at least one — and there is nothing between Earth and Neptune here, no example to reason from, no spacecraft data, no analogue.

That absence is itself a fact requiring explanation, and it is a stronger one than it first appears: the Solar System's inner region is empty compared with a typical system, and our own architecture is the unusual case.

It gets sharper. The population is not a continuum. **It is split by a gap** — a deficit of planets between about $1.5$ and $2.0$ Earth radii — and the two groups either side are different kinds of object: bare rocky cores below, cores wrapped in a few per cent of hydrogen and helium above. **A few per cent of mass makes the difference between a rock and something with no solid surface at all**, and understanding why is most of this chapter.

## 1. The population

"Super-Earth" is used loosely, and the looseness matters because it conceals the split. Conventionally:

- **Super-Earths:** $1$–$1.75\,R_\oplus$, roughly $1$–$5\,M_\oplus$, consistent with rock and iron.
- **Sub-Neptunes:** $2$–$4\,R_\oplus$, roughly $2$–$15\,M_\oplus$, requiring a volatile envelope.

They occupy the same mass range and different radius ranges, which is the first clue that radius rather than mass is doing the classifying.

Occurrence rates, corrected for the geometric and completeness factors discussed in the transits chapter, put planets in the $1$–$4\,R_\oplus$ range inside $100$ days around a large fraction of Sun-like stars — estimates cluster around $30$–$50\%$, with more than one per system being common. **This is the dominant planetary population by number in the region where surveys can measure occurrence at all.**

## 2. Mass, radius, and what they say about composition

The only compositional handle available in bulk is the mean density, obtained by combining a transit radius with a radial velocity or TTV mass.

For a rock-and-iron planet of Earth-like composition, structure models give approximately $R \propto M^{0.27}$:

| Mass | Radius (Earth composition) | Mean density |
|---|---|---|
| $1\,M_\oplus$ | $1.00\,R_\oplus$ | $5.51$ g cm$^{-3}$ |
| $2\,M_\oplus$ | $1.21\,R_\oplus$ | $6.29$ g cm$^{-3}$ |
| $5\,M_\oplus$ | $1.54\,R_\oplus$ | $7.49$ g cm$^{-3}$ |
| $10\,M_\oplus$ | $1.86\,R_\oplus$ | $8.54$ g cm$^{-3}$ |

**The exponent is well below $1/3$**, because a more massive planet compresses its own interior: adding mass adds volume, but the added gravity also squeezes what is already there. This self-compression is why density rises with mass along a composition track, and it is what allows composition to be inferred at all — a planet's position relative to these curves is informative only because the curves are not flat.

**Above about $1.5$–$1.6\,R_\oplus$, most planets lie above the rocky curve**, meaning they are less dense than rock at their mass. Something low-density is present.

## 3. The radius valley

### 3.1 The observation

Plotting the occurrence of small planets against radius shows a **deficit between roughly $1.5$ and $2.0\,R_\oplus$**, with peaks either side. The feature is not subtle once seen, and its history is instructive: **it became visible only when Gaia's parallaxes sharpened the host stellar radii.** Since a transit measures only $R_p/R_\star$, scatter in stellar radii smears the planet radius distribution, and the valley was hidden by a measurement systematic rather than by insufficient data.

### 3.2 Why a few per cent of mass matters so much

The valley separates planets with and without a hydrogen–helium envelope, and the reason such a small mass fraction produces such a large radius change is worth stating carefully.

Hydrogen and helium are of very low density and, crucially, are **poorly compressible at the pressures involved compared with rock**. An envelope of $1\%$ of the planet's mass, at the temperatures of a close-in planet, occupies a shell whose thickness is a substantial fraction of the core's radius. Adding it therefore increases the radius by tens of per cent while increasing the mass by one part in a hundred.

The consequence is a **radius amplifier**: a smooth distribution of envelope masses maps onto a strongly non-linear distribution of radii, and the transition from "no envelope" to "some envelope" appears as a jump. The valley is the region where the mapping is steepest and few planets land.

### 3.3 The two mechanisms

The gap requires something that removes envelopes from some planets and not others, and two candidates compete.

**Photoevaporation.** Stellar X-ray and extreme ultraviolet radiation heats the upper atmosphere until it escapes hydrodynamically. The emission is strongest in the first hundred million years, when a young star is far more active, so the stripping happens early. Whether a planet survives depends on its gravity — hence its core mass — and on its irradiation history, so the mechanism naturally produces a boundary in the radius–period plane.

**Core-powered mass loss.** The planet's own core, hot from formation, radiates its energy upward into the base of the envelope and drives escape from below. No external radiation is required beyond keeping the atmosphere warm, and the timescale is the core's cooling time, of order a gigayear.

**They make similar predictions for the valley's location**, which is why they have been hard to separate, and they differ in second-order ways:

- Photoevaporation depends strongly on the *early* stellar X-ray and ultraviolet output, so it should correlate with stellar type and with age in a specific way — the valley should be established within a hundred million years.
- Core-powered loss depends on the *bolometric* flux keeping the envelope warm and on the core's own cooling, so it should operate over gigayears and depend less on the star's early activity.
- The two predict different dependences of the valley's location on stellar mass and on planet age.

**Age-resolved samples are the discriminator**, and the evidence currently favours a mixture — both mechanisms operating, with the balance depending on the system. This is a case where the answer may honestly be "both", and where the useful work is quantifying the relative contributions rather than choosing.

```checkpoint
q: Why does adding an envelope of just $1\%$ of a planet's mass increase its radius by tens of per cent?
a: Because the envelope is much hotter than the core, and hot material expands
x: Temperature contributes, but the dominant factor is the enormous density contrast between hydrogen–helium and rock.
a*: Because hydrogen and helium have very low density and are poorly compressible at these pressures compared with rock, so a small mass occupies a shell that is a large fraction of the core radius
a: Because the envelope shields the core from stellar heating, allowing it to expand
x: The core's thermal state changes its radius only marginally; the radius increase is the envelope's own extent.
a: Because the measurement is of the optically thick radius, which is inflated by clouds
x: The transit radius is set by where the atmosphere becomes opaque, but that is a modest correction, not a tens-of-per-cent effect.
hint: Compare the density of hydrogen–helium at the relevant pressures with that of silicate rock.
why: Rock is dense and highly incompressible — a rocky planet of $5\,M_\oplus$ has a mean density of $7.5$ g cm$^{-3}$, higher than Earth's because self-compression squeezes the interior. Hydrogen and helium at the pressures found in a thin envelope are lower in density by orders of magnitude, so a mass equal to one per cent of the planet occupies a shell whose thickness is a substantial fraction of the core's own radius. The result is a **radius amplifier**: a smooth underlying distribution of envelope masses maps onto a strongly non-linear distribution of observed radii, so the difference between no envelope and a small one appears as a jump rather than a gradient. This is why the radius valley exists at all — it is the region where the mapping from envelope mass to radius is steepest and few planets land — and it is also why radius alone is a coarse compositional proxy: two planets differing by one per cent in mass can differ by tens of per cent in radius, so a radius measurement is far more sensitive to the presence of an envelope than to anything about the core.
---
q: The radius valley became visible only after Gaia's parallaxes improved stellar radii. What does this illustrate?
a: That the valley is an artefact of the improved stellar parameters
x: It is a real feature, confirmed independently and reproduced by structure and mass-loss models; the improvement revealed it rather than creating it.
a*: That a real astrophysical structure can be hidden by a measurement systematic rather than by insufficient data — the transit gives $R_p/R_\star$, so stellar radius scatter smears the planet radius distribution
a: That more data would eventually have revealed the valley without Gaia
x: More transit photometry does not help, since the scatter comes from the stellar radii rather than from the transit depths.
a: That planet radii should be quoted as ratios rather than absolute values
x: Ratios are what is measured, but the physics of interest concerns absolute radii, so the conversion is necessary rather than avoidable.
hint: Ask which quantity the transit actually measures and what has to be supplied to convert it into a planet radius.
why: A transit measures $(R_p/R_\\star)^2$ and contains no absolute scale, so every planet radius is the product of a well-measured ratio and an inherited stellar radius. Before Gaia, stellar radii for the Kepler field carried scatter of tens of per cent, and that scatter propagated directly into the planet radii — **smearing a narrow gap into a shallow dip and hiding it.** Gaia's parallaxes gave luminosities, hence far better stellar radii, and the valley emerged as a resolved feature. The lesson is that the limiting factor was not the amount or quality of the transit data, which was already excellent, but a systematic in a quantity the analysis depended on from outside. Adding more photometry would not have helped. This generalises to a specific diagnostic habit: when a distribution looks smooth where theory predicts structure, check whether a multiplicative quantity supplied from elsewhere carries enough scatter to erase the structure, before concluding the structure is absent.
```

## 4. The composition degeneracy

Mass and radius give a mean density, and **mean density does not determine composition.** This is the central interpretive limitation and it is worse than usually acknowledged.

Consider a planet of $2\,M_\oplus$ and $1.4\,R_\oplus$, hence a mean density of about $4$ g cm$^{-3}$ — clearly less dense than rock. Two very different interpretations fit:

**A water world.** Roughly half water by mass over a rocky core, with no hydrogen. Water's density at these pressures is intermediate between rock and hydrogen, so a substantial water fraction lowers the mean density into the observed range.

**A rocky planet with a thin envelope.** A predominantly rock-and-iron interior retaining perhaps $0.1$–$1\%$ hydrogen and helium, whose low density inflates the radius by the required amount.

**These are different worlds** — one is a deep ocean or high-pressure ice mantle, the other a rock with an atmosphere — and the density is the same. Adding a third component makes it worse: mass and radius are two numbers, and a three-component model of iron, rock and volatiles has three unknowns.

**What breaks the degeneracy** is not more precise density but a different kind of measurement. **Atmospheric spectroscopy** distinguishes a low-mean-molecular-weight hydrogen envelope, whose large scale height gives strong spectral features, from a high-mean-molecular-weight steam atmosphere, whose features are far weaker. The relevant numbers make the point:

| Atmosphere | $T$ | $\mu$ | Scale height |
|---|---|---|---|
| Sub-Neptune, H/He | $700$ K | $2.3$ | $295$ km |
| Super-Earth, steam | $700$ K | $18$ | $15$ km |
| Earth | $255$ K | $29$ | $7$ km |

**A factor of twenty in scale height for the same planet mass and temperature**, purely from mean molecular weight — which is why transmission spectroscopy is the tool that resolves what density cannot.

**Population-level constraints also help.** The two interpretations predict different distributions: photoevaporation acting on rocky cores with hydrogen envelopes produces a valley at a particular location that depends on core mass and irradiation, whereas a population of water worlds formed beyond the snow line and migrated inward would produce a different pattern in radius and in the dependence on stellar type. Both signatures are being pursued, and neither is decisive yet.

## 5. The systems they live in

Super-Earths are rarely alone, and the architecture of the systems containing them is as distinctive as the planets themselves.

**They come in compact multiples.** A large fraction of systems containing one planet in this size range contain several, typically three to seven, all inside the orbit of Mercury, with nearly circular and nearly coplanar orbits. Mutual inclinations inferred from the statistics of how many planets transit are of order a degree or two — flatter than the Solar System.

**Period ratios avoid exact resonance.** Adjacent pairs cluster at ratios slightly *wider* than $3{:}2$, $2{:}1$ and other first-order commensurabilities, with a deficit exactly at resonance. Two readings compete: that pairs migrated into resonance in the gas disc and then drifted slightly apart through tidal dissipation or planetesimal scattering after the gas cleared; or that the pattern arises from the way resonant capture fails at high migration rates. Either way, **the near-resonance is evidence that migration happened**, since resonant capture requires convergent migration and does not occur in a static disc.

**Planets within a system resemble one another.** Sizes and orbital spacings within a system are more uniform than random draws from the overall population — the "peas in a pod" pattern. This is a strong constraint: it means the outcome of planet formation is set substantially by local disc conditions rather than by stochastic assembly, and population synthesis models have found it difficult to reproduce.

**The intra-system uniformity extends to density**, though with larger uncertainties, which bears directly on the composition question: if planets in a system share a formation history, their compositions should be related, and measuring several planets in one system constrains the composition track more tightly than measuring one planet each in many systems.

```checkpoint
q: Adjacent super-Earth pairs cluster at period ratios slightly wider than $3{:}2$ and $2{:}1$, with a deficit exactly at resonance. What does this establish?
a: That resonances are dynamically unstable and destroy the systems that enter them
x: Resonant configurations can be stable for long times, and resonant chains do survive in some systems.
a*: That migration occurred, since capture into resonance requires convergent migration in a gas disc and cannot happen in a static system
a: That the planets formed in place at these particular spacings
x: In-situ formation offers no reason for spacings to cluster near commensurabilities at all, let alone just outside them.
a: That the period measurements carry a systematic error near commensurate ratios
x: Periods are among the best-measured quantities in the field, determined from many transits over years.
hint: Ask what physical process places two planets near a period commensurability in the first place.
why: A pair of planets ends up near a mean-motion resonance because one migrated toward the other through the gas disc and was captured — **convergent migration is required, and it cannot happen without a disc to drive it.** So the mere clustering near commensurabilities is evidence that these compact systems were assembled with migration rather than purely in place. The displacement to ratios slightly *wider* than exact resonance then needs its own explanation, and two compete: that pairs were captured into resonance and subsequently drifted apart, through tidal dissipation raising the inner planet's period or through scattering of leftover planetesimals; or that capture is imperfect at the migration rates involved, leaving pairs just outside. Both are consistent with migration and neither restores in-situ formation. The finding sits alongside the "peas in a pod" regularity, which points the other way toward locally determined outcomes, and the tension between them is real — which is part of why the current expectation is that both processes contribute and that the population is a mixture.
---
q: Planets within a single system resemble each other in size and spacing more than random draws from the overall population. Why is this a strong constraint on formation models?
a: Because it shows that planets in a system must have formed simultaneously
x: Near-simultaneous formation is expected in any model; the constraint is about the *outcome* being uniform, not about timing.
a*: Because it implies the outcome is set largely by local disc conditions rather than by stochastic assembly, which population synthesis models reproduce poorly
a: Because it proves the planets share a common composition
x: Compositional uniformity is suggested and partly supported, but the pattern is measured in size and spacing, and composition is a further inference.
a: Because it rules out migration, which would randomise the spacings
x: Migration does not randomise spacings — convergent migration produces the near-resonant clustering also observed.
hint: Ask what a formation process dominated by chance collisions would produce, and compare it with what is seen.
why: If final planet masses were set by the stochastic history of collisions and accretion — which body happened to grow first, which mergers happened to occur — one would expect substantial scatter within a system, comparable to the scatter across the population. **The observation is the opposite**: sizes and spacings within a system are notably more uniform than random draws, so something about the local disc, presumably its surface density profile and the supply of solids, largely determines the outcome and leaves less to chance than models assume. This is difficult for population synthesis, which typically generates diversity from stochastic elements and therefore over-predicts intra-system scatter. It also has a practical consequence for the composition problem: if planets in a system share a formation history, their compositions should lie on a related track, so measuring masses and radii for several planets in one system constrains that track far better than measuring one planet each in many systems — which is why well-characterised multi-planet systems are disproportionately valuable targets even though they are not individually remarkable.
```

## 6. Where they came from

Two families of formation scenario, differing in where the material came from.

**Formation in place.** Solid material accumulates in the inner disc — plausibly assisted by inward drift of pebbles from further out — and cores assemble locally, capturing modest envelopes from the surrounding gas before it disperses. This naturally produces the observed compact, coplanar, closely spaced systems, and it predicts rocky cores with thin hydrogen envelopes, matching the photoevaporation picture.

**Migration from beyond the snow line.** Cores form where ices are available, so they are water-rich, and migrate inward through the disc. This naturally explains how such large cores assembled — the isolation mass argument that forbids in-situ giant formation applies with less force but the same direction to super-Earth cores — and it predicts water worlds.

**The compositional signature is the test**, and it is exactly what the density degeneracy prevents from being read directly. So the origin question and the composition question are the same question, approached from opposite ends.

Two observations bear on it. The compact multi-planet systems show planets within a system resembling one another in size and spacing more than random draws would — the "peas in a pod" regularity — which suggests a locally determined outcome and favours in-situ assembly, or at least a migration process that delivers similar cores to similar places. And the period ratios of adjacent planets cluster just wide of first-order resonances, which is a signature of migration into resonance followed by slight divergence, favouring migration.

**The honest position** is that both processes probably operate and that the population may be a mixture of both kinds of object — which would explain why single-mechanism models struggle to reproduce the full distribution.

{{image: Super-Earth | An artist's rendering of a planet in the size range between Earth and Neptune, the commonest class known and one with no Solar System representative. Objects in this range divide into two populations separated by a deficit at one and a half to two Earth radii: bare rocky cores below, and cores retaining a hydrogen and helium envelope of a few per cent by mass above. Because hydrogen and helium are of very low density, that small mass fraction inflates the radius by tens of per cent, so a smooth distribution of envelope masses maps onto a sharply structured distribution of observed radii.}}

```checkpoint
q: A planet has $2\,M_\oplus$ and $1.4\,R_\oplus$, giving a mean density of about $4$ g cm$^{-3}$. What can be concluded about its composition?
a: It is a water world, since the density is intermediate between rock and ice
x: A water world fits, but so does a rocky planet with a thin hydrogen envelope, and density alone cannot distinguish them.
a*: Only that it is less dense than rock — the density admits both a water-rich interior and a rocky one with a per-cent-level hydrogen envelope, which are very different worlds
a: It is a rocky planet with an atmosphere, since water would make it larger
x: Water's density at these pressures is intermediate; a substantial water fraction produces exactly this density range.
a: Its composition can be determined once the mass is measured more precisely
x: The degeneracy is structural rather than statistical — better precision on two numbers does not resolve three compositional unknowns.
hint: Count the observables and the compositional unknowns.
why: Mass and radius are two numbers. A realistic composition has at least three components — iron, silicate rock, and volatiles, the last of which may be water or hydrogen and helium with quite different densities — so the inverse problem is underdetermined regardless of precision. **A mean density of $4$ g cm$^{-3}$ is consistent both with roughly half water by mass over a rocky core and with a predominantly rocky planet retaining a few tenths of a per cent of hydrogen and helium**, and those are entirely different objects: a deep ocean or high-pressure ice mantle in one case, a rock with an atmosphere in the other. What resolves it is a different kind of measurement rather than a better one. Transmission spectroscopy is sensitive to the atmospheric scale height $kT/\\mu m_H g$, which differs by a factor of twenty between a hydrogen-dominated envelope at $\\mu = 2.3$ and a steam atmosphere at $\\mu = 18$ for the same planet and temperature — $295$ km against $15$ km — so the spectral features are strong in one case and nearly absent in the other. **When two observables cannot separate three unknowns, the answer is a new kind of observable, not a more precise old one.**
---
q: Which observation would best distinguish photoevaporation from core-powered mass loss as the origin of the radius valley?
a: A more precise measurement of the valley's location in radius
x: Both mechanisms predict a valley at a similar location, which is why they have been hard to separate.
a*: An age-resolved sample, since photoevaporation is driven by early stellar X-ray and ultraviolet output and completes within about a hundred million years, whereas core-powered loss operates over gigayears
a: A larger sample of planets in the valley itself
x: The valley is defined by its emptiness; adding statistics there sharpens the feature without discriminating mechanisms.
a: A measurement of the planets' atmospheric compositions
x: Both mechanisms strip hydrogen and helium, so the composition of what remains is similar under either.
hint: The mechanisms differ in what powers the escape and therefore in when it happens. Ask what observable is sensitive to timing.
why: Photoevaporation is driven by stellar X-ray and extreme ultraviolet emission, which is orders of magnitude stronger in a star's first hundred million years and declines steeply thereafter, so the stripping is essentially complete early and the valley should be in place in young systems. Core-powered mass loss is driven by the planet's own core cooling through the base of the envelope, requiring only that the bolometric flux keep the atmosphere warm, and it proceeds on the core's cooling timescale of order a gigayear — so the valley should deepen with age. **An age-resolved sample therefore discriminates**, and so, more subtly, do the predicted dependences of the valley's location on stellar mass, since the two mechanisms scale differently with the host's high-energy output versus its bolometric luminosity. Current evidence favours a mixture rather than a clean winner, which is a legitimate outcome: the useful work becomes quantifying relative contributions rather than choosing, and single-mechanism models' difficulty in reproducing the full distribution is itself evidence for that reading.
```

{{image: Kepler-452b | An artist's impression of a planet somewhat larger than Earth in the temperate zone of a Sun-like star. Objects of this size sit close to the radius valley, which makes their character genuinely uncertain: a planet near one and a half Earth radii may be a bare rock with a thin secondary atmosphere or a core retaining a hydrogen envelope of a fraction of a per cent, and the two differ in whether a surface exists at all. Bulk density does not separate them, since two observables cannot determine three compositional components, and the discrimination requires atmospheric spectroscopy sensitive to mean molecular weight.}}

## 7. Habitability, briefly and carefully

Super-Earths in habitable zones attract attention, and several considerations complicate the enthusiasm without settling anything.

**Above about $1.6\,R_\oplus$, a planet probably has a thick envelope**, so its surface — if it has one — lies beneath pressures and temperatures that rule out surface liquid water in the ordinary sense. The valley therefore doubles as a rough boundary of surface habitability, which is a striking secondary use of a feature discovered for other reasons.

**Higher gravity has ambiguous consequences.** It retains atmospheres better against escape, which helps; it also flattens topography and may suppress plate tectonics or alter it substantially, which affects the carbonate–silicate cycle that regulates Earth's climate over geological time. Both directions are argued in the literature and neither is settled.

**Most known temperate super-Earths orbit M dwarfs**, for the detection reasons set out in the transits chapter, and M dwarf habitability carries its own difficulties: tidal locking, extreme flare activity, and a long pre-main-sequence phase during which the star is far more luminous and can strip or desiccate a planet before the main sequence begins.

**The defensible summary** is that the class contains the best accessible candidates for detailed study and that essentially nothing about their surfaces is currently known. That is not pessimism; it is the accurate description of a field whose observational access to these objects is only now beginning.

```checkpoint
q: A transmission spectrum of a $1.5\,R_\oplus$ planet is flat and featureless. What does this establish?
a: That the planet has no atmosphere
x: A high-mean-molecular-weight atmosphere produces features so weak they may be undetectable, and clouds flatten spectra too — absence of features is not absence of atmosphere.
a*: Only that the transmission signal is small, which is consistent with a high-mean-molecular-weight atmosphere, with a high-altitude cloud or haze deck, or with no atmosphere at all
a: That the atmosphere is hydrogen-dominated but obscured by clouds
x: Clouds do flatten a hydrogen spectrum, but this is one of several possibilities rather than the established one.
a: That the observation lacked sufficient signal-to-noise
x: Possible, but a flat spectrum with well-characterised uncertainties is a measurement rather than a failure, and it does exclude a clear hydrogen atmosphere.
hint: List everything that could reduce the amplitude of a transmission signal.
why: The transmission signal scales with the atmospheric scale height $H = kT/\mu m_H g$, so it is large for a hydrogen-dominated envelope at $\mu = 2.3$ — around $295$ km on a warm sub-Neptune — and about twenty times smaller for a steam atmosphere at $\mu = 18$. A flat spectrum therefore **excludes a clear hydrogen-dominated atmosphere**, which is a real and useful result, but it does not distinguish among the remaining possibilities: a heavy atmosphere with intrinsically weak features, a hydrogen atmosphere hidden beneath high-altitude cloud or photochemical haze, or a bare rock. Separating those requires either wavelength coverage extending to where clouds become transparent, or a different observable entirely — thermal emission at secondary eclipse constrains the heat redistribution and hence whether any atmosphere exists, since a bare rock with no atmosphere has no way to transport heat to its night side. This is the general shape of the problem for small planets: **the informative measurements are the ones sensitive to something other than what has already been measured**, and stacking more transmission spectra of the same kind on an ambiguous target adds little.
---
q: Why are well-characterised multi-planet systems disproportionately valuable for the composition question, even when no individual planet is remarkable?
a: Because more planets give more transits, improving the photometric precision
x: More transits help each planet individually but do not address the compositional degeneracy, which is structural.
a*: Because planets in one system share a formation history, so their masses and radii constrain a common composition track far more tightly than the same number of planets measured one per system
a: Because multi-planet systems are more likely to contain habitable worlds
x: Multiplicity is not known to correlate with habitability, and this is not the reason such systems are prioritised.
a: Because transit timing variations give masses for free
x: TTVs are a genuine practical advantage in such systems, but the deeper value is the shared formation history rather than the measurement convenience.
hint: The degeneracy comes from having fewer observables than unknowns. Ask what a shared history adds.
why: The composition problem is underdetermined for a single planet: mass and radius are two numbers, and iron, rock and volatiles are at least three unknowns, with the volatile component itself ambiguous between water and hydrogen–helium. A shared formation history adds a **prior linking the planets** — if they formed from the same disc material at similar times, their iron-to-rock ratios and volatile inventories should lie on a related track rather than varying independently. Fitting several planets simultaneously under that assumption reduces the number of free parameters relative to the number of observables, which is exactly what an underdetermined problem needs. The empirical support is the observed intra-system uniformity in size and spacing, the "peas in a pod" pattern, which extends tentatively to density. There is a practical bonus: in compact multiples the planets perturb one another, so transit timing variations give masses photometrically without spectroscopy, which for faint hosts is the only route to a mass at all. **Adding a constraint that links measurements can be worth more than adding measurements**, which is why a single well-studied system often outperforms many isolated ones.
```

## 8. Pulling the thread

- **The commonest planet class has no Solar System representative**, and our own empty inner region is the unusual case rather than the template.
- **Radius does the classifying, not mass.** Super-Earths and sub-Neptunes overlap in mass and separate in radius, because a per-cent-level envelope is a radius amplifier.
- **The valley at $1.5$–$2.0\,R_\oplus$ separates bare cores from enveloped ones**, and it appeared only when Gaia sharpened stellar radii — a real structure hidden by an inherited systematic, not by lack of data.
- **Density does not determine composition.** Two observables cannot resolve three components, and a $4$ g cm$^{-3}$ planet is equally a water world or a rock with a thin envelope.
- **Scale height breaks the degeneracy**: $295$ km for a hydrogen envelope against $15$ km for steam at the same mass and temperature, a factor of twenty that spectroscopy can see and density cannot.
- **Two mass-loss mechanisms remain in play**, distinguished mainly by timing — photoevaporation early and driven by stellar high-energy output, core-powered loss over gigayears and driven from below — with the evidence favouring a mixture.
- **Origin and composition are the same question.** In-situ assembly predicts rocky cores with thin envelopes; migration from beyond the snow line predicts water worlds; and the density degeneracy is precisely what blocks reading the answer off.

The transferable idea: **when a measurement cannot separate the hypotheses, the productive response is to change the kind of observable, not to improve the precision of the existing one.** Mass and radius give one number — density — and no amount of refinement lets one number resolve three compositional components; the degeneracy is structural, so better instruments applied to the same quantity buy nothing. What broke it was moving to a quantity with a different functional dependence: atmospheric scale height goes as $1/\mu$, so it distinguishes hydrogen from steam by a factor of twenty where density distinguishes them not at all. **Before investing in precision, check whether the quantity being measured can in principle separate the alternatives** — and if it cannot, the effort belongs in finding an observable that responds to the difference rather than in measuring the insensitive one better.

## 9. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Sara Seager | Exoplanet Atmospheres | 2010}}

{{book: Philip Armitage | Astrophysics of Planet Formation | 2020}}

Beyond the books: the papers reporting the radius valley are worth reading alongside those that established the improved stellar radii, since the sequence shows the feature emerging as the systematic was removed. On mass loss, reading one photoevaporation paper and one core-powered paper side by side is more useful than either alone, because their predictions overlap so closely that the differences only become visible in comparison. Zeng and Sasselov's mass–radius curves are the standard reference for the composition tracks used throughout this chapter, and their published uncertainties make the degeneracy explicit in a way summaries usually do not.

## Problems

*Useful numbers: $R/R_\oplus = (M/M_\oplus)^{0.27}$ for Earth-like composition; densities $5.51$, $6.29$, $7.49$, $8.54$ g cm$^{-3}$ at $1$, $2$, $5$, $10\,M_\oplus$; radius valley $1.5$–$2.0\,R_\oplus$; scale height $H = kT/\mu m_H g$, giving $295$ km for $\mu = 2.3$ at $700$ K on a $5\,M_\oplus$, $2.4\,R_\oplus$ planet, $15$ km for $\mu = 18$ on a $5\,M_\oplus$, $1.5\,R_\oplus$ planet, and $7$ km for Earth; occurrence of $1$–$4\,R_\oplus$ planets inside $100$ d, $30$–$50\%$ of Sun-like stars.*

**1.** *(The population.)* **(a)** State the two sub-classes, their radius ranges and their compositional implications. **(b)** State why radius rather than mass does the classifying. **(c)** State what the Solar System's lack of such planets implies about our own system.

**2.** *(Self-compression.)* **(a)** Compute the radius and mean density of a $3\,M_\oplus$ Earth-composition planet. **(b)** Explain why the exponent in $R\propto M^{0.27}$ is below $1/3$. **(c)** Explain why this makes composition inference possible.

**3.** *(The amplifier.)* **(a)** Explain why a $1\%$ hydrogen envelope changes the radius by tens of per cent. **(b)** State what this does to the mapping from envelope mass to radius. **(c)** State the consequence for the observed radius distribution.

**4.** *(The valley's visibility.)* **(a)** State what a transit measures. **(b)** Explain why stellar radius scatter smears the planet radius distribution. **(c)** State the general diagnostic habit this suggests.

**5.** *(Degeneracy.)* **(a)** Count the observables and the compositional unknowns. **(b)** Give two distinct interpretations of a $2\,M_\oplus$, $1.4\,R_\oplus$ planet. **(c)** State why better mass precision does not help.

**6.** *(Scale height.)* **(a)** Compute the ratio of scale heights for $\mu = 2.3$ and $\mu = 18$ at fixed $T$ and $g$. **(b)** State why this makes spectroscopy diagnostic where density is not. **(c)** State what a flat transmission spectrum would and would not establish.

**7.** *(Mass loss.)* **(a)** Describe photoevaporation and core-powered mass loss. **(b)** State the key difference in timing. **(c)** State the observation that discriminates and the current status.

**8.** *(Origins.)* **(a)** State the two formation scenarios and what each predicts compositionally. **(b)** State why the origin question and the composition question are the same question. **(c)** Give two observations bearing on it and say which way each points.

**9.** *(Habitability.)* **(a)** State why the radius valley doubles as a habitability boundary. **(b)** Give one argument each way for higher surface gravity. **(c)** State why most known temperate super-Earths orbit M dwarfs and one complication that follows.

## Worked answers

**1.** **(a)** Super-Earths, $1$–$1.75\,R_\oplus$, consistent with rock and iron; sub-Neptunes, $2$–$4\,R_\oplus$, requiring a volatile envelope. **(b)** Because they overlap in mass — both span roughly $2$–$10\,M_\oplus$ — while separating cleanly in radius, since a small envelope mass produces a large radius change and almost no mass change. **(c)** That the Solar System's inner region is empty compared with a typical system, so our architecture is unusual and cannot serve as a template — the absence of super-Earths here is a fact requiring explanation rather than a baseline.

**2.** **(a)** $R = 3^{0.27} = 1.35\,R_\oplus$; $\rho = 3/1.35^3\times5.51 = 6.79$ g cm$^{-3}$. **(b)** Because adding mass increases the gravity that compresses the existing material, so the volume grows more slowly than the mass; a constant-density planet would give exactly $1/3$. **(c)** Because the composition tracks are not flat: density rises along each track in a calculable way, so a planet's position relative to the tracks carries information. If density were independent of mass, all compositions would overlap and nothing could be inferred.

**3.** **(a)** Because hydrogen and helium are of very low density and poorly compressible at the relevant pressures compared with rock, so a mass equal to $1\%$ of the planet occupies a shell whose thickness is a substantial fraction of the core radius. **(b)** It makes the mapping strongly non-linear — a small change in envelope mass produces a large change in radius, particularly near zero envelope mass. **(c)** A smooth underlying distribution of envelope masses is transformed into a sharply structured radius distribution, with a deficit where the mapping is steepest — which is the radius valley.

**4.** **(a)** The ratio $(R_p/R_\star)^2$, containing no absolute scale. **(b)** Because the planet radius is that ratio multiplied by the stellar radius, so fractional scatter in the stellar radius propagates directly into fractional scatter in the planet radius, broadening every feature of the distribution. **(c)** When a distribution appears smooth where structure is expected, check whether a multiplicative quantity supplied from outside the measurement carries enough scatter to erase the structure, before concluding the structure is absent.

**5.** **(a)** Two observables — mass and radius, equivalently one density — against at least three unknowns: iron fraction, rock fraction, and volatile fraction, with the volatile component itself ambiguous between water and hydrogen–helium of very different densities. **(b)** Roughly half water by mass over a rocky core with no hydrogen; or a predominantly rock-and-iron planet retaining $0.1$–$1\%$ hydrogen and helium. **(c)** Because the degeneracy is structural rather than statistical: two numbers cannot determine three unknowns however precisely they are measured, so precision reduces the error bars on a quantity that does not separate the hypotheses.

**6.** **(a)** $H\propto1/\mu$, so the ratio is $18/2.3 = 7.8$ at fixed $T$ and $g$; including the different radii and gravities of the two example planets gives $295/15 \approx 20$. **(b)** Because transmission signal amplitude scales with $H$, so a hydrogen-dominated atmosphere produces spectral features an order of magnitude or more stronger than a steam atmosphere on an otherwise similar planet — a difference density cannot register at all. **(c)** A flat spectrum would establish that the transmission signal is small, consistent with a high-mean-molecular-weight atmosphere; it would *not* establish that, because a high-altitude cloud or haze deck also flattens the spectrum of a hydrogen-rich atmosphere. Distinguishing those requires wavelength coverage extending to where clouds become transparent.

**7.** **(a)** *Photoevaporation:* stellar X-ray and extreme ultraviolet radiation heats the upper atmosphere until it escapes hydrodynamically, with survival set by the planet's gravity and irradiation history. *Core-powered:* the planet's own hot core radiates energy into the base of the envelope and drives escape from below, requiring only that the bolometric flux keep the atmosphere warm. **(b)** Photoevaporation is driven by high-energy emission that is orders of magnitude stronger in the first hundred million years, so it completes early; core-powered loss proceeds on the core's cooling timescale of order a gigayear. **(c)** An age-resolved sample, since the valley should be established early under one mechanism and deepen with age under the other. Current evidence favours a mixture, and the useful work is quantifying relative contributions rather than choosing.

**8.** **(a)** *In situ:* cores assemble in the inner disc, possibly aided by inward pebble drift, and capture modest hydrogen envelopes — predicting rocky cores with thin envelopes. *Migration:* cores form beyond the snow line where ices are available and migrate inward — predicting water-rich compositions. **(b)** Because the compositional signature is precisely what would distinguish the origins, and the density degeneracy is precisely what prevents that signature being read from bulk properties. **(c)** The "peas in a pod" regularity, with planets in a system resembling each other in size and spacing more than random draws, suggesting a locally determined outcome and favouring in-situ assembly or a very regular delivery; and period ratios clustering just wide of first-order resonances, which is the signature of migration into resonance followed by slight divergence, favouring migration. Both probably operate.

**9.** **(a)** Because above about $1.6\,R_\oplus$ a planet probably retains a thick hydrogen envelope, so any surface lies beneath pressures and temperatures incompatible with surface liquid water — making the valley a rough upper boundary for surface habitability, a secondary use of a feature found for unrelated reasons. **(b)** *For:* higher gravity retains atmospheres better against escape. *Against:* it flattens topography and may suppress or substantially alter plate tectonics, which drives the carbonate–silicate cycle regulating climate over geological time. **(c)** Because transit depth scales as $R_\star^{-2}$ and habitable-zone orbits around low-mass stars are short, so both the signal and the geometric probability favour M dwarf hosts. The complication is that M dwarfs subject their planets to tidal locking, extreme flare activity, and a prolonged pre-main-sequence phase of much higher luminosity that can strip or desiccate a planet before the star settles.$exSE_master$,
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
