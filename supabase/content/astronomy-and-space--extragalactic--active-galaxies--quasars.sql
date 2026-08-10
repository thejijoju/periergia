-- Astronomy & Space · The Extragalactic Universe — Active Galaxies —
-- "Quasars". Curated master for
-- astronomy-and-space/extragalactic/active-galaxies/quasars
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The second Active Galaxies chapter. Deliberately not a repeat of AGN with
-- bigger numbers: its subject is how quasars stopped being objects to
-- explain and became instruments to measure with. Schmidt's 1963
-- identification and why the obstacle was expectation rather than data; the
-- quasar epoch peaking at z ~ 2-3 and its near-coincidence with the cosmic
-- star-formation peak; Soltan's argument worked through numerically, which
-- from one integral establishes that dormant local black holes are dead
-- quasars, measures the mean radiative efficiency, and shows accretion
-- rather than merging built them; the high-redshift frontier at z > 7.6
-- with 1.6e9 Msun at 670 Myr, and the seed arithmetic showing precisely
-- which assumption has to give; and then the pivot - the sightline as a
-- core sample of intergalactic gas, time-delay cosmography from
-- Q0957+561's 417-day delay giving H0 independently of the distance
-- ladder, microlensing resolving an accretion disk, and quasars as the
-- fixed points of the celestial reference frame. ~10,000 words,
-- multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/active-galaxies/quasars',
    'research',
    'advanced',
    'read',
    $egQuasar_master$> A quasar is an active nucleus so luminous that its host galaxy disappears beside it. That much is a matter of degree — a quasar is an AGN turned up. What makes quasars worth a chapter of their own is that they stopped being objects to be explained and became **instruments**: the brightest steady beacons in the universe, sitting behind everything else, and therefore the tool of choice for weighing black holes, surveying intergalactic gas, measuring the expansion rate, and fixing the coordinate system of the sky.

The previous chapter built the physics of an active nucleus from timing and photometry. This one takes that machinery as given and asks what quasars are *for* — with the historical episode first, because it is a uniquely clean case of a discovery blocked by expectation rather than by data.

## 1963: the obstacle was not the spectrum

By the early 1960s radio surveys had catalogued hundreds of sources, most without optical counterparts. A few coincided with what looked like ordinary faint blue stars. That was already peculiar — stars are not strong radio emitters — but not obviously alarming.

**3C 273** was pinned down by an elegant trick: **lunar occultation**. Radio positions were then poor, but the Moon's limb is a knife edge whose position is known exactly, so timing the instant the source vanished and reappeared as the Moon passed over it gave a position far more precise than the radio telescope's own resolution. The position landed on a 13th-magnitude starlike object with a faint jet beside it.

Its spectrum showed strong, broad emission lines at wavelengths matching **no known element**. The same was true of 3C 48. For two years these spectra were studied by capable people who could not identify them, and exotic explanations were entertained.

**Maarten Schmidt's** insight, in 1963, was not a new measurement. It was the realisation that the lines were **ordinary hydrogen Balmer lines, shifted 16 per cent to the red** — $z = 0.158$.

The reason this took two years is the interesting part. A redshift of 0.158 was, at the time, an enormous one — comparable to the most distant galaxies then measured, and those were faint smudges requiring long exposures. Here was an object that looked like a *star*, bright enough for a short exposure, and the trained response to a starlike object is to look for stellar-sized redshifts. **Nobody failed to see the pattern; they failed to consider the hypothesis that would have made the pattern obvious**, because that hypothesis implied a luminosity nobody was prepared to write down.

And the luminosity is what followed immediately. At $z = 0.158$, 3C 273 lies at a distance of roughly 750 Mpc, and its apparent brightness then implies an absolute output of order $10^{46}$ erg/s — some hundreds of times the entire Milky Way, from something that looked like a star. Every subsequent difficulty of the subject was contained in that first calculation.

The general lesson deserves stating in its own right. **The data were complete and correct for two years before the interpretation arrived.** What was missing was a willingness to consider a hypothesis whose consequence seemed absurd. That pattern — the blocking hypothesis being ruled out on grounds of implausible implications rather than on evidence — recurs, and the practical response is to ask, of any stubborn anomaly, *which explanation am I declining to take seriously, and is my reason evidential or aesthetic?*

```checkpoint
q: The spectra of 3C 273 and 3C 48 went unidentified for about two years before Schmidt recognised redshifted hydrogen. The principal obstacle was
a: that the spectra were too noisy to measure line wavelengths accurately
x: The lines were strong and well measured; that is precisely why their non-identification was so frustrating. The data were adequate throughout.
a*: that the objects looked like stars, so a large redshift was not seriously entertained — and the hypothesis was resisted because the luminosity it implied seemed absurd
a: that the Balmer series had not yet been characterised well enough for comparison
x: The Balmer series had been understood since the nineteenth century and quantitatively explained since 1913. Reference wavelengths were not in doubt.
a: that the redshift was so large that the lines had moved out of the observable window
x: The lines were observed — that was the problem. They were present and measurable, simply at unexpected wavelengths.
hint: What kind of redshift do you look for when an object looks like a star?
why: A starlike appearance sets an expectation of stellar velocities, so shifts of order 16 per cent were outside the space of hypotheses being searched. The resistance was not to the arithmetic but to its consequence: at z = 0.158 the object lies ~750 Mpc away and radiates ~10⁴⁶ erg/s, hundreds of times the Milky Way, from a point source. Schmidt's contribution was to take that consequence seriously rather than treat it as a reductio. The recurring pattern is worth naming — an anomaly persisting while the data are complete usually means a candidate explanation is being excluded on aesthetic rather than evidential grounds.
---
q: Quasar host galaxies were not detected for decades after quasars were identified. The difficulty was that
a: quasars sit in unusually small, faint galaxies that are intrinsically hard to detect
x: Luminous quasars sit preferentially in massive galaxies, often ellipticals or bulge-dominated systems — among the brighter hosts available, not the fainter.
a*: a bright unresolved nucleus outshines its host by a large factor and spreads that light across the image through the telescope's point-spread function, so the host must be recovered by subtracting a point source known to high accuracy
a: the hosts lie at redshifts where their light is shifted entirely out of the optical band
x: Host and nucleus share a redshift, and quasars are studied across a wide range of them; the host's light is shifted no further than the nucleus's, which is observed without difficulty.
a: quasars destroy their host galaxies, so many genuinely have none
x: Hosts are found for essentially all quasars once the contrast problem is solved, and no mechanism destroys a galaxy on the timescale of an accretion episode.
hint: What does a bright point source do to the faint extended light around it in a real image?
why: This is a contrast problem rather than a mystery. A nucleus outshining its host by ~100, concentrated into an unresolved point, has its light spread by the instrument's point-spread function across exactly the region where the host would appear. Recovering the host means modelling and subtracting that point source, and any error in the assumed point-spread function leaves a residual that mimics extended emission — so the measurement is limited by knowledge of the instrument rather than by depth. Once done properly, hosts appear for essentially all quasars, and their properties bear on the merger question: many show tidal features, but far from all, which is what stops the merger-driven picture from being universal.
```

## Where the galaxy went

The name records the original confusion: **quasi-stellar radio source**, contracted to quasar. Later surveys found the radio-quiet majority, which are quasi-stellar in appearance but not radio sources at all, so the term now denotes luminosity rather than radio emission.

The disappearance of the host galaxy is a **contrast problem**, not a mystery. A quasar nucleus can outshine its host by a factor of a hundred, concentrated into an unresolved point, and the resulting glare spreads across the image through the telescope's point-spread function. Detecting the host means subtracting a bright point source and looking for a faint extended residual beneath it — which requires the point-spread function to be known to high accuracy, since any error in it leaves a residual that mimics a galaxy.

Once that was done properly, hosts were found for essentially all quasars, and their properties bear directly on the previous block's arguments. Luminous quasars sit preferentially in massive galaxies, often ellipticals or bulge-dominated systems, and a substantial fraction show tidal features — though far from all, which is exactly the observation that keeps the merger-driven picture from being universal.

## The quasar epoch

The single most important fact about the quasar population is that it is **almost extinct**.

The comoving number density of luminous quasars peaks at **$z \approx 2$–3** and falls steeply on both sides — by two to three orders of magnitude toward the present day, and also downward toward higher redshift, where the population is still assembling. There is a definite **epoch of quasars**, and we are long past it.

Put the two curves together and something suggestive appears. Cosmic star formation peaks at $z \approx 1.9$; quasar activity peaks at $z \approx 2$–3. **The universe's two great energy-releasing processes ran hot at nearly the same time and declined together.**

That near-coincidence is evidence for a shared cause rather than a shared mechanism: both are fed by cold gas reaching the centres of galaxies, and both decline because the supply declines. As the Formation & Evolution chapter established, halos grow past the shock-stability mass, cold streams are disrupted, and the remaining gas sits in hot atmospheres. **Star formation and quasar activity are two consumers of one dwindling supply**, which is why their histories track each other without either causing the other.

The slight offset — quasars peaking a little earlier and declining a little faster — is real and consistent with the same downsizing seen in stars: the most massive systems, which host the most massive black holes, did their business first.

```checkpoint
q: The cosmic star formation rate peaks at z ≈ 1.9 and quasar activity peaks at z ≈ 2–3, both declining steeply since. The best interpretation of this near-coincidence is that
a: quasar feedback quenched star formation across the universe, so the quasar peak caused the star formation decline
x: AGN feedback matters enormously within massive halos, but a global synchronisation would require quasars to affect galaxies they are nowhere near. The declines are too widespread to be driven this way.
a*: both processes consume cold gas delivered to galaxy centres, so they track a common declining supply without either causing the other
a: starbursts produce the black holes that power quasars, so the star formation peak causes the quasar peak
x: Black holes are not made by starbursts in any direct sense, and the timing is too close for one to be the cause of the other through a growth channel with its own long timescale.
a: the coincidence is a selection effect, since both are easiest to detect at those redshifts
x: Both curves are corrected for selection, and the peaks survive; moreover z ≈ 2 is observationally difficult rather than favoured, being where rest-frame optical light falls in the infrared.
hint: What does each process need in order to run?
why: Star formation needs cold gas in a galaxy; quasar accretion needs cold gas delivered to the innermost parsecs. Both draw on the same reservoir and the same delivery system, which the previous block showed shutting down: halo growth slows, halos exceed the mass at which stable virial shocks form so gas is heated rather than delivered cold, and hot atmospheres are kept hot by feedback. Two consumers of one dwindling supply will decline together without either driving the other. The residual offset — quasars peaking slightly earlier — matches the downsizing pattern, since the most massive systems and their most massive black holes finished first.
---
q: Luminous quasars are two to three orders of magnitude rarer today than at z ≈ 2. In what sense are they "extinct"?
a: The black holes that powered them have evaporated, so the objects no longer exist
x: Black holes do not evaporate on any relevant timescale — Hawking radiation from a supermassive hole is utterly negligible. The mass is still there.
a*: The black holes are still present in ordinary galaxies but are no longer being fed, so the population has gone quiet rather than disappeared — as Soltan's budget confirms by matching quasar light to the local black-hole mass density
a: They have receded beyond the observable horizon as the universe expanded
x: Objects at z ≈ 2 remain fully observable, and nothing has left our past light cone; the decline is in comoving number density, which already accounts for expansion.
a: They have merged into a smaller number of much more luminous objects
x: There is no population of vastly more luminous quasars today; the luminous end has thinned, not concentrated.
hint: What does a black hole do when the gas supply stops?
why: A quasar is a black hole being fed, so cutting the supply extinguishes the quasar while leaving the black hole untouched. The population therefore went quiet rather than away — and that is not merely a plausible reading but a measured one, since Soltan's argument shows the mass accounted for by all quasar light through cosmic time matches the mass now sitting dormant in galactic nuclei. This is why AGN activity is a phase rather than a class, why nearly every massive galaxy has a black hole while only a small percentage are active, and why the Milky Way's own Sgr A* is best understood as a quasar that has run out of fuel.
```

{{image: 3C 273 | 3C 273, the first object recognised as a quasar, with the jet that helped pin its position. Its lines went unidentified for two years not because they were poorly measured but because a starlike object was not expected to carry a 16 per cent redshift — and the redshift implied a luminosity of order 10⁴⁶ erg/s, hundreds of times the Milky Way's, from a source too small to resolve.}}

## Soltan's argument

Here is the most economical piece of reasoning in the subject, and one of the best examples anywhere of extracting a great deal from a single integral.

The setup. Every photon a quasar emits was paid for by mass falling into a black hole, at efficiency $\eta$: radiating energy $E$ requires accreting $E/\eta c^2$, of which the fraction $(1-\eta)$ is retained by the hole. So the **total energy radiated by all quasars over all cosmic time**, per unit comoving volume, converts directly into the **total mass accreted by black holes** per unit volume.

That accreted mass has to be somewhere. If quasars are powered by black holes that persist after switching off, the accreted mass should equal the **mass density of black holes in galaxies today**, which can be measured entirely independently — by applying the black hole–bulge relations to the local galaxy population.

**Two quantities measured by wholly different methods, which the argument says must agree.**

The arithmetic. The integrated bolometric energy density from quasars is of order $U \approx 2\times10^{-15}$ erg cm⁻³. Then

$$\rho_{\rm acc} = \frac{U}{\eta c^2} = \frac{2\times10^{-15}}{0.1 \times (3\times10^{10})^2} = 2.2\times10^{-35}\ \mathrm{g\ cm^{-3}}$$

Converting to convenient units, with 1 Mpc $= 3.086\times10^{24}$ cm:

$$\rho_{\rm acc} \approx 3.3\times10^{5}\ M_\odot\ \mathrm{Mpc^{-3}}$$

The local black hole mass density, from bulge scaling relations, is about $4\times10^{5}\,M_\odot\ \mathrm{Mpc^{-3}}$.

**They agree, to within the uncertainties, for $\eta \approx 0.1$.** Three conclusions follow at once, and they are not small ones.

**Dormant black holes in ordinary galaxies are dead quasars.** The masses match, so the population that powered the quasar epoch is the population sitting quietly in galaxy centres now. Quasars did not vanish; they ran out of fuel. This is the strongest evidence that AGN activity is a *phase* rather than a class, and it was available long before any individual black hole was weighed dynamically.

**The mean radiative efficiency is about 10 per cent.** Since $\rho_{\rm acc} \propto 1/\eta$, requiring the two densities to match *measures* $\eta$. And 10 per cent is not an arbitrary number — it is what a thin accretion disk around a modestly spinning black hole delivers, so an argument built from population statistics recovers a quantity from relativistic accretion physics.

**Black holes grew mainly by accretion, not by merging.** Mergers of black holes redistribute mass without radiating appreciably in the electromagnetic band. Had merging dominated, the local density would greatly exceed what quasar light accounts for. That it does not means the growth was radiatively visible — which is why counting quasar photons is a valid way to weigh the black hole population.

Notice the structure of the argument, because it is reusable. **A conserved quantity — mass — is tracked through a process by measuring the by-product it necessarily emits, and the answer is checked against a direct census taken at the end.** No individual object needs to be understood. The technique works whenever a process leaves an unavoidable radiative signature with a known conversion factor, and the closure of the budget then constrains the conversion factor itself.

```checkpoint
q: Soltan's argument compares the total energy radiated by quasars over cosmic time with the mass density of black holes in galaxies today. What makes the comparison possible?
a: Quasar luminosity is proportional to black hole mass, so summing luminosities directly sums the masses
x: Luminosity depends on accretion *rate* and Eddington ratio as well as mass, and a black hole radiates nothing when not accreting. Summing luminosities does not sum masses.
a*: Every radiated photon was paid for by accreted mass at a fixed efficiency, so the integrated luminosity converts into an integrated accreted mass that must equal the mass now present
a: Both quantities are measured from the same surveys, so systematic errors cancel
x: They come from entirely different measurements — quasar luminosity functions across cosmic time versus local bulge scaling relations — which is exactly what makes their agreement meaningful rather than circular.
a: The black hole mass function has remained unchanged since the quasar epoch
x: It has grown substantially — the growth is what the argument measures. Assuming it unchanged would remove the content.
hint: Where did the energy come from, and what is left behind afterwards?
why: Radiating energy E requires accreting E/ηc², so integrated quasar light is a measurement of integrated accreted mass. That mass has to be somewhere, and if it is in the black holes sitting in today's galaxies then the two independently measured densities must agree. They do: ~3.3 × 10⁵ M☉ Mpc⁻³ from quasar light at η = 0.1, against ~4 × 10⁵ M☉ Mpc⁻³ from local scaling relations. The structure is reusable — track a conserved quantity through a process via the by-product it must emit, then check against a census at the end, and the closure constrains the conversion factor itself.
---
q: The Soltan comparison agrees for a radiative efficiency near 10 per cent. Which further conclusion does the agreement support?
a: That all black holes are maximally spinning, since only maximal spin gives 10 per cent efficiency
x: Maximal spin gives substantially higher efficiency, up to ~30 per cent or more. About 10 per cent corresponds to modest spin, so the result argues against uniformly maximal spin.
a*: That black holes grew mainly by accretion rather than by merging, since black-hole mergers add mass without radiating in the electromagnetic band and would leave the local density exceeding what quasar light accounts for
a: That quasars must still be active today, since otherwise the accreted mass would have dispersed
x: Accreted mass stays in the black hole permanently; nothing disperses when accretion stops. The argument in fact establishes that today's quiet black holes are former quasars.
a: That the local black hole mass density has been overestimated by a factor of ten
x: The two densities agree to within their uncertainties, which is the point — no large discrepancy needs explaining away.
hint: What kind of growth would leave no photons behind?
why: The budget closes: the mass accounted for by quasar light matches the mass observed locally. Any growth channel that adds mass without radiating — most importantly black-hole mergers following galaxy mergers, which radiate in gravitational waves rather than light — would push the local density above the radiatively accounted total. Since no large excess is found, accretion dominated the growth. This is also why counting photons is a legitimate way to weigh a population, and why the agreement simultaneously measures η: since ρ_acc ∝ 1/η, requiring the match fixes the mean efficiency near the ~10 per cent a thin disk around a modestly spinning hole delivers.
```

## The high-redshift frontier

Quasars are visible at enormous distances precisely because they are so luminous, which makes them the earliest individually studiable objects with measurable masses. The frontier now sits beyond **$z = 7.6$**, when the universe was under **700 million years** old, and Euclid has recently raised the number of confirmed $z > 7$ quasars from nine to twenty-three.

The best-characterised example, **J0313−1806** at $z = 7.642$, hosts a black hole of $(1.6 \pm 0.4)\times10^{9}\,M_\odot$ at a cosmic age of about **670 Myr**.

Now apply the previous chapter's arithmetic. Growth at the Eddington limit is exponential with the Salpeter time $t_S \approx 5\times10^{7}$ yr, so the required time is $t_S \ln(M/M_{\rm seed})$:

| Seed mass | e-foldings | Time required |
| --- | --- | --- |
| $100\,M_\odot$ (stellar remnant) | 16.6 | **830 Myr** |
| $10^{4}\,M_\odot$ (direct collapse) | 12.0 | **600 Myr** |
| $10^{5}\,M_\odot$ (direct collapse) | 9.7 | **485 Myr** |

Against 670 Myr available — and that assumes accretion began the moment the seed formed and never paused, which no realistic history achieves.

**A stellar-remnant seed does not fit; a direct-collapse seed does, with room to spare.** This table is why the seed problem is regarded as pointing toward heavy seeds rather than toward exotic physics — a specific, testable alternative rather than a general puzzle. The other escape routes (lower radiative efficiency retaining more mass, or episodes of super-Eddington accretion) remain live, and the Supermassive Black Holes chapter takes up the comparison.

The observational caution from the Formation & Evolution chapter applies here too. These masses come from single-epoch virial estimates — the reverberation ladder, with its calibrated factor $f$ and its extrapolated radius–luminosity relation, now extrapolated far beyond the redshift range where it was established. A systematic overestimate would soften the problem. It would not remove it: even generous downward revisions leave stellar seeds struggling.

```checkpoint
q: J0313−1806 hosts a 1.6 × 10⁹ M☉ black hole at a cosmic age of 670 Myr. Eddington-limited growth from a 100 M☉ stellar remnant needs ~830 Myr, while a 10⁴ M☉ direct-collapse seed needs ~600 Myr. What does the comparison establish?
a: That Eddington-limited growth is impossible and super-Eddington accretion must have occurred
x: Super-Eddington accretion is one live escape route, but the table shows it is not required — a heavier seed suffices, so the observation does not force it.
a*: That the seed mass is the load-bearing assumption: heavy direct-collapse seeds fit comfortably where stellar remnants do not, which is why the problem points toward a specific testable alternative rather than to exotic physics
a: That the black hole mass must have been overestimated, since no growth channel works
x: A heavy-seed channel works within the time available. Mass overestimation would soften the constraint but is not needed to make the observation consistent.
a: That the universe must be older at that redshift than standard cosmology says
x: Cosmic age at a given redshift is among the best-determined quantities in the subject; revising it to relieve an accretion constraint inverts the reliability ordering.
hint: Compare each row of the table with the 670 Myr available.
why: Exponential growth gives t = t_S ln(M/M_seed), so the seed mass enters logarithmically but decisively: 16.6 e-foldings from 100 M☉ needs 830 Myr against 670 available, while 12 e-foldings from 10⁴ M☉ needs 600 Myr and fits — with margin for the accretion not to have been perfectly continuous. That identifies the seed as the assumption to attack and makes the problem an observational programme: look for the conditions under which pristine gas collapses directly to 10⁴–10⁵ M☉ without fragmenting into stars. The masses themselves rest on single-epoch virial estimates extrapolated well beyond their calibration range, so a downward revision would ease the constraint — but not enough to rescue stellar seeds.
---
q: One proposed escape from the early-quasar timing problem is that the radiative efficiency η was lower than 0.1. Why would a *less* efficient black hole grow faster?
a: Lower efficiency means less radiation pressure, so the accretion flow is denser and delivers more mass per unit time
x: Radiation pressure does regulate the flow, but the Eddington argument caps the *luminosity*; the decisive effect of η here is on how much of the accreted mass is retained rather than on the inflow's density.
a*: Because the Salpeter time scales as η/(1−η): at fixed Eddington-limited luminosity, a lower efficiency means more mass must be swallowed to produce that luminosity, and a larger fraction of it stays in the hole
a: Because lower efficiency reduces the black hole's mass, allowing it to accrete from a smaller radius
x: Efficiency does not reduce mass, and a smaller accretion radius would not accelerate growth in the way required.
a: Because inefficient accretion avoids the Eddington limit entirely
x: The Eddington limit constrains luminosity relative to mass regardless of efficiency; a low-η flow is still bounded in luminosity, it simply converts less of its inflow into that luminosity.
hint: The Eddington limit caps the light output. If each unit of light costs more mass, what happens to the mass budget?
why: Write t_S = [η/(1−η)] Mc²/L_Edd. The Eddington limit fixes the maximum luminosity for a given mass, so producing that luminosity at lower η requires swallowing more mass per second — and since the fraction retained is (1−η), the hole grows faster. Halving η from 0.1 to 0.05 roughly halves the Salpeter time, cutting an 830 Myr growth to about 430 Myr and comfortably fitting the available 670. The catch is that this same parameter is measured, independently and at the population level, by Soltan's argument, which favours η ≈ 0.1 — so a low-efficiency escape must explain why the early population differs from the cosmic average. That interlock between two arguments is what makes the seed problem sharp rather than open-ended.
```

## The pivot: quasars as instruments

Everything so far treats quasars as objects to explain. The rest of this chapter treats them as equipment, and the shift is where most of their scientific value now lies.

The enabling properties are simple: quasars are **extremely luminous**, **effectively point-like**, **found at all redshifts out to the early universe**, and **long-lived compared with any observing campaign**. That combination makes them the ideal **background source**.

### The sightline as a core sample

Light from a distant quasar traverses billions of light-years of intergalactic space before reaching us. Every cloud of gas it passes through imprints **absorption lines** at that cloud's redshift.

A single quasar spectrum is therefore not one measurement but a **one-dimensional core sample of the universe along that line of sight**, with position along the spectrum corresponding to distance — and hence to cosmic time. The **Lyman-alpha forest** — the dense thicket of hydrogen absorption lines blueward of the quasar's own Lyman-alpha emission — is the record of every intervening filament of neutral hydrogen, and it is the primary probe of intergalactic gas and of structure on scales too diffuse to see in emission. That subject belongs to the Intergalactic Medium chapter, which this hands off to.

The point to fix here is methodological: **the quasar contributes nothing but photons.** Its own properties are irrelevant except that it is bright and behind everything. An object of intense intrinsic interest is being used purely as a light bulb, and that is its most productive role.

### Time-delay cosmography

In 1979, Walsh, Carswell and Weymann found two quasar images 5.7 arcseconds apart with essentially identical spectra at $z = 1.41$. **Q0957+561** was the first gravitational lens ever identified: a single quasar, its light split by an intervening galaxy.

The two paths have different lengths and pass through different depths of the lens's gravitational potential, so light along one arrives **later** than along the other. Since the quasar varies, the same variation appears in both images separated by that delay — measured for Q0957+561 as **417 ± 2 days**.

That delay is a length, and combined with a model of the lens's mass distribution it yields an **absolute distance** — and hence the **Hubble constant** — with no reference to the distance ladder. This matters because the ladder's rungs (Cepheids, Type Ia supernovae) each carry their own calibration systematics, and the persistent tension between locally measured and cosmologically inferred values of $H_0$ makes genuinely independent routes valuable. Lensing time delays are one of the few.

The technique's own weakness is honest and specific: the answer depends on the assumed **mass distribution of the lens**, and different plausible profiles give different $H_0$. The uncertainty is dominated by lens modelling, not by the delay measurement — which is the reverse of what one might guess, and worth knowing when reading a quoted result.

**Microlensing** adds a second use. Individual stars in the lensing galaxy drift across the light path and magnify parts of the quasar's accretion disk differentially. Because the magnification pattern varies on scales comparable to the disk itself, monitoring the fluctuations constrains the disk's **size and temperature profile** — resolving structure of order $10^{-4}$ pc at cosmological distance, which no telescope can approach. It is the same trick as reverberation mapping in spirit: use something whose scale you know to measure something you cannot resolve.

### The fixed points of the sky

Finally, an application that is almost invisible and entirely fundamental. Quasars are so distant that their **proper motions are immeasurably small** — they do not move on the sky at any detectable level. That makes them ideal **fiducial markers**, and the **International Celestial Reference Frame** is defined by the positions of several hundred compact extragalactic radio sources, most of them quasars.

Every precise astronomical position, every spacecraft navigation solution, every measurement of Earth's rotation and orientation is referred to that frame. **The most violent objects in the universe serve as the definition of "not moving"** — because at sufficient distance, even enormous velocities subtend no measurable angle.

```checkpoint
q: A quasar spectrum shows hundreds of absorption lines at many different redshifts, all below the quasar's own. What is being measured?
a: The composition and structure of the quasar's own outflowing gas at many velocities
x: Broad absorption line quasars do show intrinsic outflows, but those appear near the quasar's own redshift. A forest spanning many lower redshifts cannot be intrinsic.
a*: Every intervening cloud of gas along the line of sight, each imprinting absorption at its own redshift — so the spectrum is a one-dimensional core sample of the universe, with wavelength mapping to distance and cosmic time
a: The expansion history of the universe, read directly from the spacing of the lines
x: The lines' positions record where absorbers happen to be, not a smooth expansion signal; extracting cosmology from the forest requires statistical modelling of the absorber distribution.
a: Successive shells of gas expelled by the quasar during past outbursts
x: Ejected shells would remain near the quasar's redshift and would show high-velocity blueshifts, not a continuous distribution extending to low redshift.
hint: Absorption happens where the gas is, not where the source is. What redshift does each absorber carry?
why: Each intervening cloud absorbs at its own rest wavelength, observed shifted by its own redshift, so a single spectrum records every absorber along that sightline ordered by distance — the Lyman-alpha forest being the thicket of neutral-hydrogen absorption blueward of the quasar's own emission. The quasar contributes nothing but photons; its intrinsic properties are irrelevant beyond being bright and behind everything. This makes an object of intense interest most valuable as a light bulb, and it is the primary probe of diffuse intergalactic gas that is far too faint to see in emission.
---
q: The time delay between images of a lensed quasar yields the Hubble constant without using the distance ladder. What dominates the uncertainty in the result?
a: The precision with which the time delay can be measured
x: Delays are now measured to a per cent or better — Q0957+561's is 417 ± 2 days — so this is among the better-determined inputs.
a*: The assumed mass distribution of the lensing galaxy, since different plausible mass profiles that fit the observed image positions imply different absolute distances
a: The quasar's intrinsic variability, which must be modelled to extract the delay
x: Variability is what makes the measurement possible; irregular variation actually helps, providing distinctive features to cross-match between images.
a: Uncertainty in the quasar's redshift
x: Redshifts of bright quasars are measured to high precision from strong emission lines and contribute negligibly.
hint: The delay is a length difference. What converts a length difference into an absolute distance?
why: The delay measures the difference in light travel time between two paths, which depends both on their geometric length difference and on the gravitational potential each traverses. Converting that into an absolute distance — and so into H₀ — requires knowing the lens's mass distribution, and several profiles can reproduce the observed image positions while implying different distances. The measurement is therefore limited by lens modelling rather than by timing, which is the opposite of the naive expectation. It remains valuable because it is genuinely independent of Cepheids and supernovae, and independence is what the persistent H₀ tension most needs.
```

{{image: Twin Quasar | Q0957+561, the Twin Quasar: two images of one object, 5.7 arcseconds apart at z = 1.41, split by an intervening galaxy — the first gravitational lens ever identified, in 1979. Because the two light paths differ in length and in the potential they cross, the same variation appears in one image 417 days after the other, and that delay converts into an absolute distance and hence a Hubble constant owing nothing to the Cepheid and supernova ladder.}}

## Outflows: the quasar pushing back

One intrinsic property deserves its own mention, because it connects back to the previous block's requirement.

Roughly 10 to 20 per cent of optically selected quasars are **broad absorption line (BAL) quasars**, showing absorption troughs blueshifted from the emission lines by up to $0.1$–$0.2c$ — that is, **30,000 to 60,000 km/s**. These are outflows, driven from the nucleus by radiation pressure on spectral lines and dust, and by magnetic forces.

The observed fraction is probably not a distinct population but a covering-factor statement: the outflow occupies some fraction of the solid angle, so 10–20 per cent of sightlines intersect it. This is the same clumpy, orientation-plus-state reasoning that emerged for the torus.

The importance is energetic. **This is AGN feedback, observed directly.** The Formation & Evolution chapter required that accreting black holes deposit energy in their surroundings sufficient to unbind or keep hot a massive galaxy's gas, and here is a mass-loaded wind leaving at a tenth of the speed of light. Whether a given outflow actually couples to the host galaxy's gas — rather than punching through and escaping — is the live quantitative question, and it is the main uncertainty in the feedback prescriptions that the whole simulation programme depends on.

## Pulling the thread

- **3C 273** was identified in 1963 by recognising redshifted Balmer lines at $z = 0.158$. The two-year delay was caused not by data but by **an unexamined hypothesis** — a starlike object was not expected to carry a large redshift, because the implied $\sim10^{46}$ erg/s seemed absurd.
- The **quasar epoch** peaks at $z \approx 2$–3 and has since declined by **two to three orders of magnitude**. Its near-coincidence with the star-formation peak at $z\approx1.9$ reflects **two consumers of one dwindling cold-gas supply**, not one causing the other.
- **Soltan's argument**: integrated quasar light gives $\rho_{\rm acc} = U/\eta c^2 \approx 3.3\times10^{5}\,M_\odot\,\mathrm{Mpc^{-3}}$ at $\eta = 0.1$, against a locally measured $\approx 4\times10^{5}$. From one integral: **dormant black holes are dead quasars**, **$\eta \approx 0.1$**, and **growth was by accretion, not merging**.
- At $z = 7.642$, **J0313−1806** holds $1.6\times10^9\,M_\odot$ at a cosmic age of **670 Myr**. Eddington growth needs **830 Myr from a stellar seed** but only **600 Myr from $10^4\,M_\odot$** — so the **seed mass** is the load-bearing assumption.
- Quasars became **instruments**: absorption sightlines as **one-dimensional core samples** of intergalactic gas; **time-delay cosmography** (Q0957+561, **417 ± 2 days**) giving $H_0$ independently of the distance ladder, limited by **lens modelling** rather than timing; **microlensing** resolving accretion disks at $10^{-4}$ pc; and quasars as the **fixed points of the celestial reference frame**.
- **BAL quasars**, 10–20 per cent of the optical population, show outflows at **0.1–0.2c** — AGN feedback caught in the act, with the coupling efficiency still the key open number.

The transferable idea: **the most valuable use of a remarkable object is often as a light source for something else.** Quasars are extraordinary in their own right, and they have taught us more by being bright, distant, point-like and behind things than by being understood. The pattern generalises: a phenomenon that is exceptional in some measurable respect is a candidate instrument, and the question worth asking of anything unusual is not only "what is this?" but "**what can I now see that I could not see before this existed?**" The answer frequently has nothing to do with the object, and frequently outlasts the interest in it.

## Further reading

{{book: Peter Schneider | Extragalactic Astronomy and Cosmology | 2006}}

{{book: Donald Osterbrock | Astrophysics of Gaseous Nebulae and Active Galactic Nuclei | 2006}}

{{book: Dennis Overbye | Lonely Hearts of the Cosmos | 1991}}

Beyond the books: Schmidt's 1963 *Nature* note on 3C 273 is a single page and worth reading for how briefly a subject can be opened. Soltan's 1982 paper is similarly compact and is the model for budget arguments of its kind. And the lensing time-delay literature repays attention for its unusually candid treatment of where the error budget actually sits — a rare case of a field naming its dominant systematic in the abstract.

## Problems

*Useful numbers: c = 3.00 × 10¹⁰ cm/s; M☉ = 1.989 × 10³³ g; 1 Mpc = 3.086 × 10²⁴ cm; integrated quasar energy density U ≈ 2 × 10⁻¹⁵ erg cm⁻³; local black hole mass density ≈ 4 × 10⁵ M☉ Mpc⁻³; Salpeter time t_S ≈ 5 × 10⁷ yr at η = 0.1; growth time = t_S ln(M/M_seed); 3C 273 at z = 0.158, d ≈ 750 Mpc.*

**1.** *(The blocking hypothesis.)* **(a)** State why the spectra of 3C 273 and 3C 48 resisted identification for two years. **(b)** Explain what Schmidt contributed, given that the data were unchanged. **(c)** State the general lesson and the diagnostic question it suggests.

**2.** *(What the redshift implied.)* **(a)** Explain why an object's starlike appearance made a large redshift seem implausible. **(b)** Given z = 0.158 and d ≈ 750 Mpc, describe qualitatively how the luminosity follows from the observed flux. **(c)** State the order of magnitude of that luminosity and compare it with a galaxy.

**3.** *(Two declining curves.)* **(a)** State where each of the cosmic star-formation and quasar-activity curves peaks. **(b)** Give the best explanation of their near-coincidence, and say what it is *not*. **(c)** Explain the small offset between them.

**4.** *(Soltan, worked.)* **(a)** Explain why integrated quasar luminosity converts into an accreted mass. **(b)** Compute ρ_acc for η = 0.1 and for η = 0.2, in M☉ Mpc⁻³. **(c)** Compare with the local value and state which η is favoured and why.

**5.** *(What Soltan establishes.)* State and justify the three conclusions that follow from the budget closing: **(a)** about dormant black holes, **(b)** about radiative efficiency, **(c)** about the dominant growth channel.

**6.** *(Seeds.)* **(a)** Compute the number of e-foldings needed to reach 1.6 × 10⁹ M☉ from seeds of 100, 10⁴ and 10⁵ M☉. **(b)** Convert each to a time at t_S = 5 × 10⁷ yr. **(c)** Compare with 670 Myr and state which assumption the comparison identifies as load-bearing, and one caveat about the measured mass.

**7.** *(The core sample.)* **(a)** Explain why a single quasar spectrum records many absorbers at many redshifts. **(b)** State what wavelength position corresponds to physically. **(c)** Explain why the quasar's own properties are almost irrelevant to this use, and what that illustrates.

**8.** *(Time delays.)* **(a)** Explain why the two images of a lensed quasar have different arrival times, naming both contributions. **(b)** Explain how the delay yields H₀ and why this is valuable. **(c)** State what dominates the error budget and why that is counterintuitive.

**9.** *(Instruments from objects.)* **(a)** List four properties of quasars that make them useful as background sources. **(b)** For each of absorption spectroscopy, time-delay cosmography, and the celestial reference frame, state which property is essential. **(c)** State the general principle and apply it to one other object class in this tree.

## Worked answers

**1.** **(a)** Because their emission lines fell at wavelengths matching no known element **as observed** — and the transformation that would have made them recognisable, a redshift of ~16 per cent, was not among the hypotheses being tested, since the objects looked like stars and stars do not have such redshifts. **(b)** He contributed a **reinterpretation, not a measurement**: recognising that the pattern of line spacings was that of the hydrogen Balmer series, uniformly shifted by $z = 0.158$. The data had been complete and correct throughout. **(c)** That a persistent anomaly with adequate data usually indicates a candidate explanation is being **excluded on aesthetic rather than evidential grounds** — here, because the implied luminosity seemed absurd. The diagnostic question: *which explanation am I declining to take seriously, and is my reason evidential or merely that I dislike its consequences?*

**2.** **(a)** Because appearance was read as a class membership: a point source looks like a star, stars are nearby galactic objects, and galactic objects have velocities of at most hundreds of km/s, giving redshifts of order $10^{-3}$. A redshift of 0.158 belonged to the faintest, most distant galaxies then measurable — objects that emphatically do not look starlike. **(b)** Flux falls as $1/d^2$, so the intrinsic luminosity is $L = 4\pi d^2 F$. Once the redshift fixes $d$ at ~750 Mpc — vastly larger than any assumed stellar distance — the same measured flux implies a luminosity larger by the square of the distance ratio, an enormous factor. **(c)** Of order $\mathbf{10^{46}}$ **erg/s**, roughly $10^{12}\,L_\odot$: some **hundreds of times** the total stellar output of the Milky Way, produced by an unresolved source. Every subsequent difficulty of the subject follows from that one number.

**3.** **(a)** Cosmic star formation peaks at $z \approx 1.9$; quasar activity peaks at $z \approx 2$–3. **(b)** Both are **consumers of the same declining supply of cold gas** delivered to galaxy centres. As halos exceed the shock-stability mass, cold streams are disrupted and the remaining gas sits in hot atmospheres kept hot by feedback, so both processes are starved together. It is **not** a causal relation in either direction: quasar feedback cannot globally quench star formation in galaxies it is nowhere near, and starbursts do not manufacture the black holes on the required timescale. Common cause, not common mechanism. **(c)** Quasars peak slightly earlier and decline slightly faster, consistent with **downsizing**: the most massive systems, which host the most massive black holes, assembled and finished their business first, so the more massive-weighted quasar population turns over before the star formation of the general galaxy population does.

**4.** **(a)** Because radiating energy $E$ requires accreting $E/\eta c^2$ of mass, with $\eta$ the fixed conversion efficiency. Every photon was paid for, so summing the photons over all quasars and all cosmic time measures the total mass that fell in. **(b)** $\rho_{\rm acc} = U/(\eta c^2)$.
- $\eta = 0.1$: $2\times10^{-15}/(0.1\times9\times10^{20}) = 2.2\times10^{-35}$ g cm⁻³. Multiplying by $(3.086\times10^{24})^3 = 2.94\times10^{73}$ cm³ per Mpc³ and dividing by $M_\odot$: $\mathbf{3.3\times10^{5}\,M_\odot\ Mpc^{-3}}$.
- $\eta = 0.2$: half of that, $\mathbf{1.6\times10^{5}\,M_\odot\ Mpc^{-3}}$.

**(c)** The local value is $\approx 4\times10^{5}\,M_\odot$ Mpc⁻³. The $\eta = 0.1$ case agrees within the substantial uncertainties on both sides; $\eta = 0.2$ falls short by a factor of about 2.5, meaning quasar light would fail to account for the black holes actually present. **$\eta \approx 0.1$ is therefore favoured** — and note what has happened: a population-level photon budget has *measured* a parameter of relativistic accretion physics.

**5.** **(a)** **Dormant black holes in ordinary galaxies are dead quasars.** The mass accounted for by quasar light matches the mass now sitting in galactic nuclei, so the population that powered the quasar epoch is the same population that is quiet today — quasars ran out of fuel rather than disappearing. This established activity as a *phase* rather than a class, before any black hole had been weighed dynamically. **(b)** **The mean radiative efficiency is ≈ 10 per cent.** Since $\rho_{\rm acc} \propto 1/\eta$, requiring the two independently measured densities to agree fixes $\eta$; the answer coincides with what a thin accretion disk around a modestly spinning black hole delivers, so a statistical argument recovers a result from accretion physics. **(c)** **Growth was dominated by accretion, not merging.** Black-hole mergers add mass while radiating in gravitational waves rather than light, so a merger-dominated history would leave the local density well above what quasar photons account for. The budget closes without such an excess, which both rules out merger-dominated growth and validates photon-counting as a way to weigh the population.

**6.** **(a)** $\ln(1.6\times10^9/M_{\rm seed})$: from $100\,M_\odot$, $\ln(1.6\times10^7) = \mathbf{16.6}$; from $10^4$, $\ln(1.6\times10^5) = \mathbf{12.0}$; from $10^5$, $\ln(1.6\times10^4) = \mathbf{9.7}$. **(b)** At $5\times10^7$ yr per e-folding: $\mathbf{830}$, $\mathbf{600}$, and $\mathbf{485}$ Myr respectively. **(c)** Only **670 Myr** were available. The stellar-remnant seed **fails** even assuming continuous Eddington accretion from the instant of formation; the $10^4\,M_\odot$ seed fits with modest margin and the $10^5\,M_\odot$ seed comfortably. The **seed mass** is therefore the load-bearing assumption, which turns a general puzzle into a specific observational programme: identify the conditions under which pristine gas collapses directly to $10^4$–$10^5\,M_\odot$ without fragmenting into stars. *Caveat*: the quoted mass is a **single-epoch virial estimate**, resting on the calibrated factor $f$ and on a radius–luminosity relation extrapolated far beyond the redshift range where it was established — so a systematic overestimate would ease the constraint, though not by enough to rescue stellar seeds.

**7.** **(a)** Because absorption occurs **where the gas is**, not where the source is. Each intervening cloud absorbs at its own rest wavelength, which we observe shifted by **that cloud's** redshift — so a sightline crossing many clouds at many distances produces many absorption systems at many redshifts, all below the quasar's own. **(b)** Position along the spectrum corresponds to the **distance of the absorber**, and hence to the **cosmic time** at which the light passed through it: the spectrum is a one-dimensional core sample ordered by depth. **(c)** Because the quasar supplies **only photons**. Nothing about its black hole mass, accretion rate, orientation or variability affects the absorption imprinted by foreground gas; it needs only to be bright, point-like, and behind the material of interest. This illustrates that an object of intense intrinsic interest can be **most productive as an instrument**, and that the question "what can I now see that I could not see before?" is often more valuable than "what is this thing?"

**8.** **(a)** Two contributions. **Geometric**: the two paths have different lengths, so light takes different times to traverse them. **Gravitational (Shapiro) delay**: the paths pass through different depths of the lensing galaxy's potential, and clocks along a deeper path run slow relative to a shallower one, adding further delay. The total is what is measured — 417 ± 2 days for Q0957+561. **(b)** The delay is a **physical length difference** in a system whose angular scale is observed, so combining it with a mass model of the lens converts an angle into an absolute distance, and an absolute distance to a known redshift gives $H_0$. It is valuable because it is **wholly independent of the distance ladder** — no Cepheids, no Type Ia supernovae, none of their calibration systematics — and the persistent tension between local and cosmological determinations of $H_0$ most needs independence rather than precision. **(c)** The **lens mass model** dominates, not the timing: several plausible mass profiles can reproduce the observed image positions and separations while implying different absolute distances, and the resulting spread exceeds the sub-per-cent uncertainty on the delay itself. This is counterintuitive because the delay looks like the hard measurement — a year-long lag on a variable source — while the lens looks like bookkeeping; in fact the measurement is easy and the bookkeeping is the science.

**9.** **(a)** **Extreme luminosity** (detectable through intervening material and at great distance); **point-like appearance** (a clean, unresolved probe, so absorption and lensing signals are not smeared over an extended source); **presence at all redshifts to the early universe** (long sightlines and early epochs); and **longevity** compared with any observing campaign (a stable beacon over decades of monitoring). **(b)** *Absorption spectroscopy* — **distance/redshift reach**, since the value lies in the length of the sightline. *Time-delay cosmography* — **variability plus point-like appearance**, since the delay is measured by matching features between two unresolved images. *Celestial reference frame* — **extreme distance**, which makes proper motion immeasurably small so the sources define "not moving". **(c)** The principle: **an object exceptional in some measurable respect is a candidate instrument, and its instrumental value may exceed and outlast its intrinsic interest.** Elsewhere in this tree: **Cepheid variables**, intrinsically ordinary pulsating stars, became the rung of the distance ladder that established the scale of the universe; **Type Ia supernovae**, interesting as stellar explosions, matter far more as standardisable candles that revealed cosmic acceleration; and **pulsars**, remarkable in themselves, are used as clocks precise enough to detect gravitational waves.$egQuasar_master$,
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
