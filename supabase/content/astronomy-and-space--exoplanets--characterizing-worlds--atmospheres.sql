-- Astronomy & Space · Exoplanets — Characterizing Worlds — "Atmospheres".
-- Curated master for
-- astronomy-and-space/exoplanets/characterizing-worlds/atmospheres
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The physics chapter of the Characterizing Worlds block; the following
-- chapter covers how the observations are actually made. Organised
-- around what an atmosphere does rather than around what has been
-- detected: it sets the temperature through albedo and heat
-- redistribution, and those two enter the equilibrium temperature in a
-- degenerate combination so that a measured temperature does not
-- determine either; it circulates, and on tidally locked planets that
-- circulation is measurable as an eastward hot-spot offset; it
-- condenses, and clouds are the single largest obstacle to
-- interpretation; and it escapes, with an energy-limited rate scaling
-- as R^3/M so that low-density planets are stripped preferentially -
-- which is what carves the radius valley.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: equilibrium temperature
-- T_star sqrt(R_star/2a) giving 1246 K at 0.05 AU and 279 K at 1 AU
-- for a solar analogue with zero albedo and full redistribution, and
-- 1482 K and 331 K respectively for dayside-only redistribution
-- (f = 2, a factor 2^0.25 = 1.19); Jeans escape parameter
-- lambda = GM mu m_H/(k T R) giving 7.2 for hydrogen at an Earth
-- exobase at 1000 K, 202 for molecular nitrogen under the same
-- conditions, and 5.1 for hydrogen at Mars; energy-limited escape
-- rate eps pi R_p^3 F_XUV/(G M_p), whose R^3/M scaling is the
-- chapter's key result.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/characterizing-worlds/atmospheres',
    'research',
    'advanced',
    'read',
    $exAtm_master$> An atmosphere is a thin skin. Earth's, measured by scale height, is about $7$ kilometres deep against a planetary radius of $6371$ — a tenth of a per cent. **Everything that makes a planet's surface habitable or not is decided in that skin**, and for an exoplanet it is the only part that can be observed at all.

The physics is unusually well constrained in one respect and unusually degenerate in another. **Well constrained:** the same equations govern atmospheres everywhere, and Solar System planets provide seven independent tests of them. **Degenerate:** almost every observable depends on a combination of quantities rather than on any one, so a measured temperature does not determine an albedo, a flat spectrum does not determine a composition, and an inferred abundance depends on assumptions about clouds.

This chapter is about what atmospheres do. The next is about how the doing is measured.

## 1. Scale height: the quantity that governs everything

The atmosphere's vertical extent is set by the competition between thermal energy and gravity:

$$H = \frac{kT}{\mu m_H g}.$$

**Every observable scales with $H$.** The transmission signal during transit is the extra area blocked by the annulus of atmosphere, proportional to $2R_pH/R_\star^2$. The number of scale heights probed sets the dynamic range of a spectrum. And the atmosphere's response to heating and its circulation both scale with it.

The three terms matter differently.

**Temperature** enters linearly, so hot planets have extended atmospheres.

**Mean molecular weight** enters inversely, and this is the largest lever: $\mu = 2.3$ for a hydrogen–helium envelope against $18$ for steam or $44$ for carbon dioxide. **A factor of eight in $\mu$ is a factor of eight in every atmospheric signal**, which is why the presence or absence of hydrogen dominates observability.

**Surface gravity** enters inversely, so low-density planets are easier.

The combination explains the observational hierarchy exactly: hot Jupiters, being hot, hydrogen-rich and low in gravity for their mass, have scale heights of hundreds of kilometres and are the easiest targets by a wide margin; temperate rocky planets with heavy secondary atmospheres are the hardest.

## 2. Temperature, and the degeneracy in it

The equilibrium temperature follows from balancing absorbed stellar flux against thermal emission:

$$T_{\rm eq} = T_\star\sqrt{\frac{R_\star}{2a}}\,(1-A)^{1/4}f^{1/4},$$

where $A$ is the Bond albedo and $f$ describes heat redistribution — $f = 1$ for uniform redistribution over the whole planet, $f = 2$ for a dayside that reradiates without sharing heat with the night side.

| Planet | $T_{\rm eq}$, $f=1$ | $T_{\rm eq}$, $f=2$ |
|---|---|---|
| Solar analogue at $0.03$ AU | $1609$ K | $1913$ K |
| Solar analogue at $0.05$ AU | $1246$ K | $1482$ K |
| Solar analogue at $1$ AU | $279$ K | $331$ K |

**Note the structure of the formula.** $A$ and $f$ both enter as fourth roots, and they enter as a product. A measured dayside temperature therefore constrains the combination $(1-A)f$ and neither quantity separately: **a dark planet that redistributes heat efficiently and a reflective one that does not are observationally identical** in a single temperature measurement.

Breaking it requires a second observable. **Optical secondary eclipse depth** measures reflected light and hence the geometric albedo directly. **A full phase curve** measures the day–night contrast and hence $f$. This is why phase curves are so much more valuable than eclipse depths alone, and it is a good instance of the general pattern in this subject: **an observable that depends on a product of unknowns is completed by an observable that depends on one of them.**

The formula's second lesson is that the true surface temperature is not $T_{\rm eq}$. Earth's equilibrium temperature is $255$ K with its actual albedo, against a mean surface temperature of $288$ K — a $33$ K greenhouse offset. **For exoplanets, $T_{\rm eq}$ is a calculable reference point, not a prediction of surface conditions**, and quoting it as though it were the latter is a common and serious error.

## 3. Circulation

A tidally locked planet is heated permanently on one hemisphere. What happens next is the closest thing to weather that can currently be measured on another world.

**The competition** is between radiative cooling, which tends to make each region reach equilibrium with its local heating, and advection, which carries heat away before it can be radiated. Their ratio sets the day–night contrast.

**The observable.** Phase curves of hot Jupiters show the hottest point displaced **eastward** of the substellar point, typically by ten to thirty degrees. On a static atmosphere the hot spot would sit exactly beneath the star. The offset therefore measures the wind: heat is being advected downwind before it is radiated.

**The mechanism** is an equatorial superrotating jet — a broad eastward flow at the equator, driven by momentum transported from higher latitudes by standing planetary waves that the day–night heating contrast excites. Simulations produced this before the observations confirmed it, which makes it one of the field's genuine predictions.

**The trend with irradiation is informative.** More strongly irradiated planets show *larger* day–night contrasts and *smaller* hot-spot offsets, because radiative cooling times shorten faster than wind speeds rise, so advection loses. This is a quantitative relation, it is reproduced by circulation models, and it means the population of hot Jupiters maps out a sequence in the ratio of two timescales rather than being a collection of individual weather reports.

```checkpoint
q: A planet's dayside temperature is measured from its secondary eclipse depth. What does this constrain?
a: The planet's albedo, since a darker planet is hotter
x: A darker planet is hotter at fixed redistribution, but redistribution is not fixed and enters the same expression.
a*: Only the combination $(1-A)f$ of albedo and heat redistribution — a dark planet redistributing efficiently and a reflective one that does not are indistinguishable from this measurement alone
a: The planet's atmospheric composition, since composition sets the emission spectrum
x: Composition shapes the spectrum's wavelength dependence, but the broadband temperature constrains the energy budget rather than the composition.
a: The planet's surface temperature
x: The equilibrium temperature is a reference quantity; a greenhouse offset makes the surface hotter, by $33$ K in Earth's case.
hint: Write out $T_{\rm eq}$ and identify how albedo and redistribution enter.
why: The energy balance gives $T_{\\rm eq} = T_\\star\\sqrt{R_\\star/2a}\\,(1-A)^{1/4}f^{1/4}$, in which the Bond albedo $A$ and the redistribution factor $f$ appear as a **product** under a fourth root. A single temperature therefore fixes $(1-A)f$ and nothing more: a planet absorbing everything and spreading the heat over its whole surface can match a reflective planet that reradiates only from its dayside. Separating them needs a second observable sensitive to one of the two. **Optical secondary eclipse depth** measures reflected light directly, giving the geometric albedo; **a full phase curve** measures the day-night brightness contrast and hence $f$. This is why phase curves are worth far more than eclipse depths alone, and it illustrates a pattern that recurs throughout atmospheric characterisation: an observable depending on a product of unknowns is completed by one depending on a single factor. A separate caution attaches to the same formula — $T_{\\rm eq}$ is a calculable reference, not a surface temperature, since Earth's is $255$ K against an actual mean surface value of $288$ K.
---
q: Hot Jupiter phase curves show the hottest point displaced eastward of the substellar point, and the offset shrinks as irradiation increases. What does the trend measure?
a: The strength of the planet's magnetic field, which channels the flow
x: Magnetic effects matter for the most strongly irradiated and ionised atmospheres, but the offset trend is set by a timescale ratio.
a*: The ratio of the radiative cooling time to the advective time — as irradiation rises, cooling shortens faster than winds strengthen, so advection loses and heat is radiated closer to where it is absorbed
a: The planet's rotation rate, which increases with irradiation
x: These planets are tidally locked, so rotation is fixed by the orbit and does not vary with irradiation independently.
a: The depth of the atmosphere probed, which decreases for hotter planets
x: Hotter atmospheres have larger scale heights and are probed to greater depth in pressure terms, and this does not produce the offset trend.
hint: The hot spot sits downwind of the substellar point. Ask what determines how far downwind heat travels before being radiated.
why: On a static atmosphere the hottest point would lie exactly beneath the star. An eastward offset means heat is carried downwind by an equatorial superrotating jet — driven by momentum that standing planetary waves, excited by the day-night heating contrast, transport toward the equator — before it can be radiated away. **How far downwind depends on the competition between advection and radiative cooling.** Raising the irradiation shortens the radiative time steeply, while wind speeds increase only weakly, so the balance tips toward local radiation: contrasts grow and offsets shrink. The relation is quantitative and is reproduced by circulation models, so the hot Jupiter population traces out a sequence in a timescale ratio rather than furnishing unrelated weather reports. Two things make this result unusually strong for the field. The superrotating jet was **predicted by simulations before it was observed**, and the measurement is of atmospheric dynamics on an object that has never been spatially resolved — inferred entirely from how the combined brightness of star and planet varies as different faces rotate into view.
```

## 4. Chemistry

What an atmosphere is made of depends on what it started with, what temperature it sits at, and what has happened to it since.

### 4.1 Equilibrium and its failure

At high temperature and pressure, reactions are fast and the composition settles into thermochemical equilibrium determined by temperature, pressure and elemental abundances. For a hydrogen-rich atmosphere this makes carbon appear as methane at low temperature and carbon monoxide at high, with the transition near $1000$ K, and nitrogen as ammonia or molecular nitrogen across a similar boundary.

**Equilibrium fails in three ways, and each failure is informative.**

**Quenching.** Vertical mixing carries gas upward faster than reactions can re-equilibrate, so the abundance at altitude is frozen at the value from the depth where the mixing time equalled the reaction time. Observed methane in excess of equilibrium predictions is the standard signature, and measuring the departure constrains the vertical mixing rate — a dynamical quantity extracted from a chemical measurement.

**Photochemistry.** Ultraviolet photons dissociate molecules and drive reaction networks that equilibrium cannot reach. Products include hydrocarbon hazes, sulfur species, and — for terrestrial planets — abiotic oxygen, which matters enormously for biosignature interpretation.

**Condensation.** Species with condensation temperatures above the local temperature form clouds, removing themselves from the gas phase and taking their elements with them. This is chemistry and cloud formation being the same process.

### 4.2 Elemental ratios as formation tracers

The most valuable chemical measurement is not the abundance of any species but a **ratio**, because ratios record where the material was gathered.

**Carbon to oxygen.** Beyond the water snow line, oxygen is sequestered into ice grains, so the remaining gas is oxygen-poor and therefore carbon-rich, while the solids are the reverse. A planet that accreted mostly gas beyond the snow line should have $\text{C/O}$ above its star's; one that accreted substantial solids should have it below. **Measuring C/O is therefore a direct test of where and how a planet assembled**, and it is the strongest scientific argument for atmospheric characterisation.

**Metallicity.** The overall enrichment in heavy elements relative to the host star constrains how much solid material was mixed into the envelope. In the Solar System this rises steeply toward lower planet mass — Jupiter is modestly enriched, Neptune far more — and whether exoplanets follow the same trend is an active question.

## 5. Clouds: the spoiler

**Clouds are the single largest obstacle to interpreting exoplanet atmospheres**, and they deserve to be stated as such rather than treated as a nuisance parameter.

**The problem.** A cloud or haze deck at high altitude blocks starlight before it reaches the molecular absorbers below, flattening the transmission spectrum. A flat spectrum is therefore consistent with a hydrogen-rich atmosphere under cloud, a heavy atmosphere with intrinsically weak features, or no atmosphere at all — a three-way degeneracy that a single flat measurement cannot resolve.

**The condensates depend on temperature**, and the sequence is well understood from brown dwarf work: silicates and iron above about $1500$ K; manganese and sodium sulfides near $1000$ K; alkali salts lower; water below about $300$ K. So a planet's cloud species is broadly predictable from its temperature, which helps.

**Hazes are worse than clouds** in one respect: they are photochemical products rather than condensates, so their presence depends on ultraviolet flux and atmospheric composition rather than on temperature alone, and they are much harder to predict.

**Three routes past the problem.** Observing at longer wavelengths, where clouds become transparent and molecular bands remain strong. Using emission rather than transmission, which probes deeper. And measuring at high spectral resolution, where individual lines can be detected above a flattened continuum. **Each works, and each costs observing time**, which is why cloudy planets consume a disproportionate share of it.

{{image: Atmospheric escape | Gas leaving a planet's gravitational grasp, either particle by particle from the high-temperature tail of the velocity distribution or as a bulk hydrodynamic outflow when heating is intense enough that the whole upper atmosphere expands and streams away. The energy-limited rate scales as the cube of the planet's radius divided by its mass, so low-density planets with weak gravity lose mass far faster than compact ones — which is why irradiation strips the envelopes of some close-in planets and not others, and why the process carves a gap in the observed radius distribution rather than removing envelopes uniformly.}}

## 6. Escape

Atmospheres are not permanent, and whether one survives is often the decisive question about a planet.

### 6.1 Jeans escape

In the high-velocity tail of the Maxwell–Boltzmann distribution, some molecules exceed escape velocity. The controlling quantity is the escape parameter,

$$\lambda = \frac{GM\mu m_H}{kTR},$$

the ratio of gravitational binding to thermal energy. Escape is efficient below $\lambda \approx 2$–$3$ and negligible above.

| Case | $\lambda$ |
|---|---|
| Hydrogen at an Earth exobase, $T = 1000$ K | $7.2$ |
| Molecular nitrogen, same conditions | $202$ |
| Hydrogen at Mars, $T = 300$ K | $5.1$ |

**The $\mu$ dependence is why atmospheres fractionate.** Earth loses hydrogen slowly and retains nitrogen absolutely; the same planet is porous to one species and sealed to another, which is why the abundance of light species is a record of escape history rather than of initial composition.

### 6.2 Hydrodynamic escape

When heating is intense — as under the extreme ultraviolet flux of a young or nearby star — the upper atmosphere is heated enough to expand and flow outward as a bulk wind, dragging heavier species along. This is not evaporation molecule by molecule but a planetary wind, and it removes mass orders of magnitude faster.

The **energy-limited rate** approximates the outflow as converting a fraction $\varepsilon$ of the incident extreme ultraviolet energy into escape:

$$\dot M \approx \frac{\varepsilon\,\pi R_p^3 F_{\rm XUV}}{G M_p}.$$

**The scaling is the important part: $\dot M \propto R_p^3/M_p$**, which is inversely proportional to mean density. **Low-density planets are stripped preferentially**, and by a steep factor.

Two consequences follow, and they connect this chapter to earlier ones.

**Hot Jupiters survive.** Their escape rates are large in absolute terms — outflows are observed, producing extended hydrogen and helium comae detectable in transit — but negligible relative to their masses. A hot Jupiter loses a small fraction of a per cent of its mass over its lifetime.

**Sub-Neptunes do not necessarily survive.** A low-mass core with a puffy hydrogen envelope has exactly the high $R^3/M$ that maximises the rate, and the extreme ultraviolet flux is orders of magnitude higher in a star's first hundred million years. This is photoevaporation, and it is one of the two candidate mechanisms for carving the radius valley — **so the gap in the radius distribution is, on this reading, a direct fossil of atmospheric escape.**

### 6.3 Whether rocky planets around M dwarfs keep anything

The question that matters most for habitability, and it is unresolved.

**The case for loss.** M dwarfs remain highly active for billions of years, with frequent flares and high extreme ultraviolet output. Their habitable zones are close in, so the fluxes are large. And they have a prolonged pre-main-sequence phase during which the star is far more luminous, subjecting a planet to an extended period of extreme irradiation before conditions settle.

**The case for retention.** A sufficiently massive planet with a high mean molecular weight secondary atmosphere — carbon dioxide or nitrogen rather than hydrogen — has a large $\lambda$ and a low $R^3/M$, and volcanic outgassing can replenish what is lost. A magnetic field may reduce stripping by the stellar wind, though the magnitude of that protection has been revised downward from earlier confident claims.

**The observational test** is direct: measure whether temperate rocky planets around M dwarfs have atmospheres at all, via thermal phase curves — a planet with no atmosphere cannot transport heat to its night side, so the day–night contrast is maximal. **This measurement is being made now**, and it is one of the few cases in this subject where a decisive observational answer is imminent rather than distant.

```checkpoint
q: The energy-limited escape rate scales as $R_p^3/M_p$. What does this imply about which planets lose their atmospheres?
a: The most massive planets lose the most, since they intercept more radiation
x: They intercept more, but their gravity rises faster than their cross-section, so the ratio favours retention.
a*: Low-density planets are stripped preferentially, since $R^3/M$ is inversely proportional to mean density — a puffy low-mass sub-Neptune is far more vulnerable than a compact one
a: The hottest planets lose the most, regardless of density
x: Flux enters the rate too, but the density scaling is what makes escape selective among planets at similar irradiation.
a: All planets at the same orbital distance lose mass at the same rate
x: The rate depends strongly on the planet's own structure, which is what makes the process selective and able to carve a gap.
hint: Rewrite $R^3/M$ in terms of the mean density.
why: Since mean density is $\\rho \\propto M/R^3$, the combination $R_p^3/M_p$ is simply $1/\\rho$: **the energy-limited escape rate is inversely proportional to mean density.** A low-density planet presents a large cross-section to the incident radiation while binding its atmosphere weakly, so it loses mass far faster than a compact planet of the same mass at the same irradiation. Two consequences connect this to earlier chapters. **Hot Jupiters survive**: their outflows are real and observable as extended hydrogen and helium comae during transit, but they amount to a small fraction of a per cent of the planet's mass over its lifetime. **Sub-Neptunes need not**: a low-mass core with a puffy hydrogen envelope maximises $R^3/M$ exactly, and the extreme ultraviolet flux is orders of magnitude higher during a star's first hundred million years — so envelopes are removed from some planets and not others depending on core mass and irradiation history. That selectivity is what produces a **gap** rather than a uniform shrinkage, which is why the radius valley is, on the photoevaporation reading, a direct fossil of atmospheric escape.
---
q: A transmission spectrum of a temperate rocky planet is flat. What is the most useful next observation?
a: A deeper transmission spectrum at the same wavelengths, to detect weaker features
x: If a cloud deck is blocking the light, more precision at the same wavelengths does not reach the absorbers beneath it.
a*: A thermal phase curve, since a planet with no atmosphere cannot transport heat to its night side and therefore shows maximal day–night contrast
a: A radial velocity campaign to refine the planet's mass
x: A better mass helps interpret the bulk density but does not establish whether an atmosphere exists.
a: A repeat of the same measurement to confirm the flatness
x: Confirmation has value but does not break the three-way degeneracy the flat spectrum leaves.
hint: The flat spectrum leaves three possibilities. Ask which observable distinguishes them by responding to something other than transmitted light.
why: A flat transmission spectrum is consistent with three quite different situations: a hydrogen-rich atmosphere beneath a high-altitude cloud or haze deck; a heavy atmosphere whose small scale height gives intrinsically weak features; and **no atmosphere at all**. Since all three suppress transmission features, no amount of additional transmission precision at the same wavelengths separates them. A **thermal phase curve** attacks a different physical quantity: an atmosphere transports heat from the permanently illuminated hemisphere to the night side, whereas a bare rock cannot, so the day-night brightness contrast is maximal for an airless body and reduced in proportion to the efficiency of atmospheric circulation. That distinguishes "no atmosphere" from "some atmosphere" without depending on the composition at all. The other routes past a flat spectrum work differently: longer wavelengths, where clouds become transparent while molecular bands remain strong; emission rather than transmission, which probes deeper; and high spectral resolution, where individual lines are detectable above a flattened continuum. **The general move is to find an observable sensitive to something the degenerate one is not**, rather than to measure the degenerate one better.
```

## 7. Thermal structure and inversions

One further piece of physics deserves separate treatment, because it is where the atmosphere's own opacity feeds back on its temperature.

A planetary atmosphere heated from above develops a temperature that generally **decreases with altitude**, since the layers absorbing the incident flux lie beneath the ones radiating to space. That is the ordinary situation, and it produces absorption features in an emission spectrum: molecular bands are formed at higher, colder levels than the continuum, so they appear as dips.

**An inversion reverses this.** If a species that absorbs strongly at optical wavelengths is present high in the atmosphere, it deposits the stellar flux at altitude, heating the upper layers above the temperature of those beneath. The emission spectrum then shows the same molecular bands **in emission rather than absorption** — a sign flip that is unambiguous and does not require absolute calibration.

**The candidate absorbers** are titanium oxide and vanadium oxide, which are strong optical absorbers and remain gaseous only above about $1800$ K. Below that they condense and rain out, so inversions are predicted to appear only in the hottest planets.

**The observations broadly support this**, with inversions found in the hottest objects and absent in cooler ones, but the boundary is not sharp and some planets hot enough to have inversions do not show them. Proposed explanations include cold traps, where the species condenses on the night side or at depth and is removed from circulation, and destruction of the absorber by the intense ultraviolet field. **The pattern is a good example of a prediction that is broadly confirmed while its exceptions remain unexplained**, and the exceptions are where the current work is.

```checkpoint
q: An emission spectrum shows molecular bands in emission rather than absorption. What does this establish?
a: That the planet is intrinsically luminous rather than reflecting starlight
x: Emission spectra of irradiated planets record their thermal emission in any case; the sign of the features concerns the temperature profile.
a*: That the atmosphere has a thermal inversion — temperature rising with altitude — which requires a strong optical absorber deposited at high altitude
a: That the observation was taken during transit rather than at secondary eclipse
x: Transit gives transmission features, which are absorption in a different geometry; the sign flip described here is in emission at eclipse.
a: That the atmosphere is optically thin, so the whole column contributes
x: An optically thin atmosphere produces weak features, not features of reversed sign.
hint: Ask at what altitude a molecular band is formed relative to the continuum, and what determines whether that altitude is hotter or colder.
why: A molecular band is formed higher in the atmosphere than the continuum, because the band's larger opacity means the photosphere at that wavelength lies at lower pressure. In an ordinary atmosphere heated from above, temperature falls with altitude, so bands are formed in colder gas and appear as **absorption** dips. **An inversion reverses the temperature gradient**, so bands are formed in hotter gas and appear in **emission**. The diagnostic is a sign flip rather than an amplitude, which makes it robust: it does not depend on absolute flux calibration or on the assumed continuum level. Producing an inversion requires a species that absorbs strongly at optical wavelengths and survives at high altitude, with titanium oxide and vanadium oxide the leading candidates — both of which remain gaseous only above about $1800$ K and condense out below. The prediction that inversions appear only in the hottest planets is broadly borne out, though the boundary is not sharp and some sufficiently hot planets lack them, plausibly through cold-trapping of the absorber on the night side or its destruction by ultraviolet radiation.
---
q: Quenching produces methane abundances above thermochemical equilibrium predictions. Why is this useful rather than merely a complication?
a: Because it shows the equilibrium calculation was wrong and must be replaced
x: The equilibrium calculation is correct for the conditions it describes; quenching means those conditions do not obtain at the observed altitude.
a*: Because the departure measures the vertical mixing rate — a dynamical quantity extracted from a chemical measurement
a: Because methane is a biosignature, so an excess is astrobiologically significant
x: Methane in a hydrogen-rich giant atmosphere is thermochemically ordinary and carries no biological implication.
a: Because it indicates the atmosphere is cooler than the equilibrium temperature suggested
x: Quenching reflects transport outpacing chemistry, not an error in the temperature.
hint: Ask what has to be true about the transport timescale relative to the reaction timescale for an abundance to be frozen in.
why: Thermochemical equilibrium fixes composition as a function of temperature, pressure and elemental abundances, and in a hydrogen-rich atmosphere it places carbon in methane at low temperature and carbon monoxide at high, with the transition near $1000$ K. **Quenching occurs when vertical mixing carries gas upward faster than the reactions can re-equilibrate**, so the abundance observed at altitude is frozen at the value from the depth where the mixing time equalled the chemical time. Since the chemical timescales are calculable from laboratory kinetics, measuring the quenched abundance identifies that depth and therefore the mixing rate — **a dynamical property inferred from a chemical observable**, which is valuable because vertical mixing is otherwise almost inaccessible. The same logic applies to the other departures from equilibrium: photochemical products constrain the ultraviolet flux reaching a given level, and condensation depletions constrain the temperature profile where the species rained out. Treating disequilibrium as information rather than as contamination is what turns a complication into a measurement, and it is the standard approach in planetary atmospheres generally.
```

## 8. What has actually been measured

A brief inventory, because the gap between what is discussed and what is established is large.

**Securely detected**, in hot Jupiters and warm Neptunes: water, carbon monoxide, carbon dioxide, methane in some objects, sodium and potassium, and escaping hydrogen and helium. Thermal inversions in the hottest objects. Day–night contrasts, hot-spot offsets, and their trend with irradiation.

**Detected with more difficulty**, in a growing number of smaller and cooler planets: carbon dioxide and other molecules in sub-Neptunes; evidence for clouds and hazes across many objects.

**Not established:** any atmosphere on a temperate rocky planet; any biosignature; C/O ratios precise enough to settle formation locations for more than a handful of objects.

**The trajectory matters more than the inventory.** Each of these was impossible a decade before it happened, and the limiting factor throughout has been the size of the differential signal against the star — which is why the next chapter, on how the measurements are made, determines what this chapter can say.

{{image: HD 189733 b | One of the most intensively studied transiting giant planets, and the object on which much of the observational repertoire for exoplanet atmospheres was first exercised: water and carbon monoxide absorption, a scattering slope attributed to high-altitude haze, an eastward-displaced hot spot revealed by its phase curve, and an escaping upper atmosphere detected in transit. Its suitability follows from the scale height argument - hot, hydrogen-rich and low in surface gravity for its mass - which makes its atmospheric signal larger than that of almost any other known planet, and which is also why the techniques proven here have had to be pushed by orders of magnitude to reach smaller and cooler worlds.}}

```checkpoint
q: Why is Earth's atmosphere porous to hydrogen but effectively sealed to nitrogen, and what does that imply for interpreting a planet's light-element abundances?
a: Hydrogen is chemically reactive and is destroyed rather than lost
x: Hydrogen does react, but the relevant loss here is physical escape from the top of the atmosphere.
a*: Because the escape parameter $\lambda \propto \mu$ — about $7$ for hydrogen and $200$ for nitrogen at an Earth exobase — so present-day light-element abundances record escape history rather than initial inventory
a: Because nitrogen is heavier and therefore sinks to lower altitudes where escape cannot occur
x: The atmosphere is well mixed below the homopause; the difference is in the escape probability at the exobase, not in vertical segregation.
a: Because hydrogen is continuously supplied by outgassing while nitrogen is not
x: Supply affects the steady-state abundance but not why one species escapes and the other does not.
hint: Write out the escape parameter and identify how it depends on molecular mass.
why: The Jeans escape parameter $\lambda = GM\mu m_H/kTR$ compares gravitational binding with thermal energy, and it is **linear in the molecular mass**. At an Earth exobase at $1000$ K, hydrogen has $\lambda = 7.2$ while molecular nitrogen has $202$; since escape is efficient only below $\lambda\approx2$–$3$ and falls off extremely steeply above, Earth leaks hydrogen slowly and retains nitrogen absolutely. **The same planet is therefore porous to one species and sealed to another**, which means a measured light-element abundance is the residue of a loss process, not a record of what the planet started with. The interpretive consequence is substantial: inferring a planet's initial volatile inventory from its present hydrogen or helium content requires modelling the entire escape history, including the star's early high-energy output, and the model dependence is large. It also explains isotopic fractionation as a diagnostic — deuterium escapes more slowly than hydrogen, so an elevated D/H ratio is a fossil of how much hydrogen has been lost, which is how Venus's history of water loss was established.
---
q: What is the general methodological pattern this chapter identifies, and why does improving measurement precision often fail to help?
a: That exoplanet atmospheres are too faint to study, so only statistical results are possible
x: Individual atmospheres are studied successfully; the difficulty is interpretive rather than one of raw detectability.
a*: That many observables depend on products of unknowns, so precision narrows the constraint on the product while leaving each factor as free as before — the fix is an observable sensitive to one factor
a: That systematic errors dominate over statistical ones in every measurement
x: Systematics matter, but the pattern described is about degeneracy in what the observable depends on, not about error budgets.
a: That models are insufficiently developed to interpret the data
x: The relevant physics is well understood; the problem is that the data constrain combinations rather than individual quantities.
hint: Recall the temperature measurement, the flat spectrum and the bulk density, and ask what they have in common.
why: The pattern appears three times in this material. A dayside temperature constrains $(1-A)f$, so albedo and heat redistribution are individually unconstrained however precisely the temperature is measured — and the fix is an optical eclipse depth, sensitive to albedo alone, or a phase curve, sensitive to redistribution alone. A flat transmission spectrum admits cloud, a heavy atmosphere or no atmosphere, and no additional transmission precision separates them — the fix is a thermal phase curve, which responds to heat transport rather than to transmitted light. A bulk density admits several compositions, and the fix is a scale height measurement responding to mean molecular weight. **In each case the degenerate observable depends on a combination, and better precision tightens the combination without splitting it.** The recurring error is to treat a degeneracy as a precision problem, which absorbs effort and returns a narrower constraint on a quantity nobody wanted to know. The productive question is which quantity the ambiguity is *insensitive* to, and what observable responds to that — and asking it early tends to redirect an observing programme rather than merely refine one.
```

```checkpoint
q: Why does the condensation sequence in exoplanet atmospheres borrow directly from brown dwarf research?
a: Because brown dwarfs and planets form by the same mechanism
x: Their formation routes differ, and the borrowing has nothing to do with origin.
a*: Because condensation depends on temperature and pressure rather than on how the object formed, and brown dwarfs span the same temperature range with far brighter, better-studied atmospheres
a: Because brown dwarfs have no host star, so their spectra are uncontaminated
x: Freedom from a host is a practical advantage in obtaining spectra, but the transferability rests on the physics being the same.
a: Because the same instruments observe both
x: Instrumentation overlaps, but that would not justify transferring a chemical sequence between object classes.
hint: Ask what determines which species condenses, and whether that quantity knows anything about the object's history.
why: Whether a species condenses is set by whether the local temperature falls below its condensation curve at the local pressure — a question of thermochemistry, entirely indifferent to whether the object assembled by core accretion, by disc fragmentation or by collapse of a molecular cloud core. **Brown dwarfs span the same effective temperatures as hot and warm giant planets**, are far brighter, and are observable without a host star's light to subtract, so their atmospheres were characterised in detail well before any exoplanet's. The resulting condensation sequence — silicates and iron above about $1500$ K, manganese and sodium sulfides near $1000$ K, alkali salts lower, water below about $300$ K — transfers directly, which is why a planet's likely cloud species is broadly predictable from its temperature alone. The transfer has limits worth noting: irradiated planets have externally imposed temperature profiles and strong day-night contrasts that brown dwarfs lack, so cold-trapping and horizontal transport of condensates operate differently, and **photochemical hazes do not transfer at all**, since they depend on an ultraviolet flux that isolated brown dwarfs do not receive.
---
q: What single measurement would most advance the study of temperate rocky exoplanet atmospheres?
a: A transmission spectrum at higher precision than currently achievable
x: If such planets have heavy secondary atmospheres or high clouds, transmission features are weak regardless of precision.
a*: A thermal phase curve establishing whether an atmosphere exists at all, since an airless body cannot transport heat and shows maximal day–night contrast
a: A more precise mass, to determine the bulk density and hence the composition
x: Bulk density is degenerate among compositions and says little about whether a thin secondary atmosphere is present.
a: A direct image, resolving the planet from its star
x: Reflected-light imaging of such planets requires a contrast of about $10^{-10}$, beyond any current or near-term capability.
hint: The prior question is not what the atmosphere is made of, but whether there is one.
why: For temperate rocky planets around M dwarfs, the field's first-order question is **existence, not composition** — whether such planets retain any atmosphere given their hosts' prolonged high activity, close-in habitable zones, and luminous pre-main-sequence phase. Transmission spectroscopy answers that question badly: a heavy secondary atmosphere has a scale height of order $10$ km against $300$ for a hydrogen envelope, so its features are weak, and a flat spectrum is equally consistent with no atmosphere at all. A **thermal phase curve** answers it directly and almost model-independently: an atmosphere transports heat from the permanently illuminated hemisphere to the night side, while a bare rock cannot, so the day-night brightness contrast is maximal for an airless body and reduced in proportion to circulation efficiency. The measurement is demanding but achievable now, and the targets are already identified. That combination — a clean physical discriminant, existing targets, and current instrumental capability — is unusual in this field, where important questions more often resolve slowly or not at all.
```

## 9. Pulling the thread

- **Scale height governs every observable**, and mean molecular weight is the largest lever within it: $\mu = 2.3$ against $18$ is a factor of eight in every signal, which is why hydrogen's presence dominates observability.
- **Temperature measurements are degenerate.** $A$ and $f$ enter $T_{\rm eq}$ as a product under a fourth root, so a dark well-mixed planet and a reflective poorly-mixed one are identical — and a phase curve or an optical eclipse is what separates them.
- **$T_{\rm eq}$ is not a surface temperature.** Earth's is $255$ K against $288$ K observed.
- **Circulation is measurable on unresolved objects.** The eastward hot-spot offset measures a superrotating jet predicted by simulations beforehand, and its trend with irradiation traces the ratio of radiative to advective timescales.
- **Departures from equilibrium chemistry are informative rather than inconvenient** — quenching measures vertical mixing, photochemistry produces hazes and abiotic oxygen, condensation is cloud formation.
- **C/O is the formation tracer**, because oxygen is sequestered in ice beyond the snow line, so the ratio records where the material was gathered.
- **Clouds are the largest interpretive obstacle**, producing a three-way degeneracy that no additional transmission precision resolves.
- **Escape scales as $1/\rho$**, so low-density planets are stripped preferentially — which is why the radius valley is a gap rather than a uniform shrinkage, and is on one reading a direct fossil of escape.

The transferable idea: **when an observable depends on a product of unknowns, the fix is an observable that depends on one of them, not a better measurement of the product.** This chapter contains the pattern three times. A dayside temperature fixes $(1-A)f$, and an optical eclipse depth or a phase curve isolates one factor. A flat transmission spectrum admits cloud, heavy atmosphere or no atmosphere, and a thermal phase curve — sensitive to heat transport rather than to transmitted light — separates the last from the others. A bulk density admits several compositions, and a scale height measurement responding to $\mu$ resolves what density cannot. **The recurring error is to respond to a degeneracy by improving precision**, which narrows the constraint on the product while leaving the factors as free as before. The productive question is always which quantity the ambiguity is insensitive to, and what responds to that.

## 10. Further reading

{{book: Sara Seager | Exoplanet Atmospheres | 2010}}

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Raymond Pierrehumbert | Principles of Planetary Climate | 2010}}

Beyond the books: Pierrehumbert is the best treatment of the radiative and thermodynamic physics, and it is written to apply to any planet rather than to Earth with generalisations bolted on — the chapters on radiative transfer and on the greenhouse effect are worth working through in full. Seager's book is the standard exoplanet-specific reference. On circulation, Showman and Guillot's early papers predicting equatorial superrotation are worth reading before the observational papers that confirmed it, since the order in which they were written is the point.

## Problems

*Useful numbers: $H = kT/\mu m_H g$; $\mu = 2.3$ (H/He), $18$ (steam), $44$ (CO$_2$); $T_{\rm eq} = T_\star\sqrt{R_\star/2a}(1-A)^{1/4}f^{1/4}$, giving $1246$ K at $0.05$ AU and $279$ K at $1$ AU for a solar analogue with $A=0$, $f=1$, and $1482$ K and $331$ K for $f=2$; Earth $T_{\rm eq} = 255$ K against $288$ K surface; $\lambda = GM\mu m_H/kTR$, giving $7.2$ for hydrogen at an Earth exobase at $1000$ K, $202$ for N$_2$, $5.1$ for hydrogen at Mars; escape efficient for $\lambda\lesssim2$–$3$; $\dot M \approx \varepsilon\pi R_p^3F_{\rm XUV}/GM_p$.*

**1.** *(Scale height.)* **(a)** Compute the ratio of scale heights for a hydrogen atmosphere and a carbon dioxide atmosphere at fixed $T$ and $g$. **(b)** State how the transmission signal depends on $H$. **(c)** Explain the observational hierarchy from hot Jupiters to temperate rocky planets in terms of the three factors.

**2.** *(Temperature.)* **(a)** Compute $T_{\rm eq}$ for a solar analogue at $0.1$ AU with $A = 0.3$ and $f = 1$. **(b)** State what a single dayside temperature constrains. **(c)** Name two observations that break the degeneracy and state which factor each isolates.

**3.** *(Greenhouse.)* **(a)** State Earth's equilibrium and mean surface temperatures. **(b)** State what the difference is called and what causes it. **(c)** State the error that follows from treating $T_{\rm eq}$ as a surface temperature.

**4.** *(Circulation.)* **(a)** State the observation that reveals winds on an unresolved planet. **(b)** Explain the mechanism producing the jet. **(c)** State the trend with irradiation and explain it in terms of two timescales.

**5.** *(Chemistry.)* **(a)** Name the three ways equilibrium chemistry fails and state what each reveals. **(b)** Explain why C/O is a formation tracer. **(c)** State what a planet with C/O above its host's would indicate.

**6.** *(Clouds.)* **(a)** State the three-way degeneracy a flat transmission spectrum leaves. **(b)** Name three observational routes past it and state what each exploits. **(c)** Explain why hazes are harder to predict than condensate clouds.

**7.** *(Jeans escape.)* **(a)** Compute $\lambda$ for atomic oxygen at an Earth exobase at $1000$ K. **(b)** State the threshold for efficient escape. **(c)** Explain why atmospheres fractionate and what that implies about interpreting light-element abundances.

**8.** *(Hydrodynamic escape.)* **(a)** Rewrite the energy-limited rate's dependence on $R^3/M$ in terms of density. **(b)** Explain why hot Jupiters survive while sub-Neptunes may not. **(c)** State the connection to the radius valley.

**9.** *(M dwarf planets.)* **(a)** Give two arguments that such planets lose their atmospheres and two that they retain them. **(b)** State the decisive observational test and the physical principle behind it. **(c)** State why this is unusual in the field.

## Worked answers

**1.** **(a)** $H\propto1/\mu$, so $44/2.3 = 19$ — a hydrogen atmosphere is about nineteen times more extended. **(b)** The transmission signal is the extra area blocked by the atmospheric annulus, $\approx 2R_pH/R_\star^2$, so it is linear in $H$. **(c)** A hot Jupiter maximises all three factors — high $T$, low $\mu$ from hydrogen, and low $g$ for its mass because the radius is large — giving scale heights of hundreds of kilometres. A temperate rocky planet minimises all three: low $T$, high $\mu$ from a secondary atmosphere, and higher $g$ for its size. The signal difference spans orders of magnitude, which is why the observational programme proceeded in that order.

**2.** **(a)** $T_\star\sqrt{R_\star/2a} = 5778\sqrt{6.957\times10^8/(2\times1.496\times10^{10})} = 5778\times0.1525 = 881$ K; times $(0.7)^{1/4} = 0.915$ gives $806$ K. **(b)** Only the combination $(1-A)f$, since both enter as a product under a fourth root — so a dark planet redistributing efficiently is indistinguishable from a reflective one that does not. **(c)** An optical secondary eclipse measures reflected light and isolates the geometric albedo; a full phase curve measures the day–night contrast and isolates $f$.

**3.** **(a)** $255$ K equilibrium, $288$ K mean surface. **(b)** The greenhouse effect: infrared-absorbing gases make the atmosphere optically thick in the thermal infrared, so the level radiating to space is higher and colder than the surface, and the surface must be warmer to drive the required flux through. **(c)** It understates surface temperature by an unknown amount that depends on atmospheric composition and pressure, so a planet whose $T_{\rm eq}$ places it in the habitable zone may have a surface far too hot — Venus being the extreme case, with $T_{\rm eq}$ near $230$ K and a surface at $737$ K.

**4.** **(a)** A phase curve showing the hottest point displaced eastward of the substellar point by ten to thirty degrees, where a static atmosphere would place it exactly beneath the star. **(b)** The day–night heating contrast excites standing planetary waves that transport momentum toward the equator, driving a broad eastward superrotating equatorial jet. **(c)** More strongly irradiated planets show larger day–night contrasts and smaller offsets, because the radiative cooling time shortens steeply with temperature while wind speeds rise only weakly — so advection loses and heat is radiated closer to where it is absorbed.

**5.** **(a)** *Quenching* — vertical mixing outpaces re-equilibration, freezing abundances at the level where the two timescales matched, which measures the vertical mixing rate. *Photochemistry* — ultraviolet photons drive networks equilibrium cannot reach, producing hazes, sulfur species and abiotic oxygen. *Condensation* — species below their condensation temperature form clouds and leave the gas phase, taking their elements with them. **(b)** Beyond the water snow line oxygen is locked into ice grains, so the residual gas is oxygen-poor and carbon-rich while the solids are the reverse; the ratio therefore records the mix of gas and solids accreted and where that happened. **(c)** That it gathered its envelope predominantly from gas beyond the snow line, with comparatively little oxygen-rich solid accretion.

**6.** **(a)** A hydrogen-rich atmosphere beneath a high-altitude cloud or haze; a heavy atmosphere with intrinsically weak features; or no atmosphere at all. **(b)** *Longer wavelengths*, where clouds become transparent while molecular bands remain strong. *Emission rather than transmission*, which probes deeper layers. *High spectral resolution*, where individual lines are detectable above a flattened continuum. **(c)** Because condensate clouds form where the temperature falls below a species' condensation point, so the sequence — silicates and iron above $1500$ K, sulfides near $1000$ K, salts lower, water below $300$ K — is broadly predictable from temperature; hazes are photochemical products whose formation depends on ultraviolet flux and on the full composition, which is far harder to predict.

**7.** **(a)** $\lambda_{\rm H} = 7.2$ for $\mu = 1$, so for $\mu = 16$, $\lambda = 7.2\times16 = 115$. **(b)** Efficient below $\lambda\approx2$–$3$; negligible above. **(c)** Because $\lambda\propto\mu$, a given planet is porous to light species and sealed to heavy ones — Earth loses hydrogen slowly and retains nitrogen absolutely. The implication is that the abundance of a light species records the planet's escape history rather than its initial composition, so inferring initial inventories from present-day light-element abundances requires modelling the loss.

**8.** **(a)** Mean density is $\rho\propto M/R^3$, so $R^3/M \propto 1/\rho$: the rate is inversely proportional to mean density. **(b)** A hot Jupiter is dense enough, and massive enough, that even a large absolute outflow — observable as an extended hydrogen and helium coma — removes a small fraction of a per cent of its mass over its lifetime. A sub-Neptune with a low-mass core and a puffy hydrogen envelope maximises $R^3/M$, and the extreme ultraviolet flux is orders of magnitude higher in the star's first hundred million years, so its envelope can be removed entirely. **(c)** Because the loss is selective — depending on core mass and irradiation history — it removes envelopes from some planets and not others, producing a **gap** in the radius distribution rather than a uniform shrinkage. On the photoevaporation reading, the radius valley is therefore a direct fossil of atmospheric escape.

**9.** **(a)** *Loss:* M dwarfs remain highly active for billions of years with frequent flares and high extreme ultraviolet output, and their habitable zones are close in so the fluxes are large; and they have a prolonged, far more luminous pre-main-sequence phase that irradiates a planet heavily before conditions settle. *Retention:* a sufficiently massive planet with a high-$\mu$ secondary atmosphere of carbon dioxide or nitrogen has a large $\lambda$ and a low $R^3/M$; and volcanic outgassing can replenish losses. **(b)** A thermal phase curve: an atmosphere transports heat to the night side while a bare rock cannot, so an airless planet shows maximal day–night contrast, and the measurement is insensitive to composition. **(c)** Because the field's important questions usually resolve slowly or not at all, whereas this one has a clean physical discriminant, targets already identified, and instruments capable of the measurement now — so a decisive answer is imminent rather than distant.$exAtm_master$,
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
