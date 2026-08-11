-- Astronomy & Space · The Dark Universe — Dark Matter & Energy — "The Evidence".
-- Curated master for
-- astronomy-and-space/dark-universe/dark-matter-and-energy/the-evidence
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens The Dark Universe. Organised around the case for dark matter
-- being a convergence of independent measurements at different scales
-- rather than one measurement repeated - and around the fact that the
-- leading alternative succeeds exactly where dark matter is weakest and
-- fails where it is strongest, which is the honest shape of the debate.
-- Zwicky 1933 and why his factor of 400 was partly an H0 error; flat
-- rotation curves giving M(r) proportional to r; dwarf spheroidals with
-- M/L up to 3400; strong and weak lensing; the Bullet Cluster as the
-- cleanest single argument; the CMB third peak and BBN together fixing
-- baryons at 15.7% of matter; MOND's genuine success on the radial
-- acceleration relation and its failures on clusters, the Bullet
-- Cluster and the CMB.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/dark-matter-and-energy/the-evidence',
    'research',
    'advanced',
    'read',
    $duEvid_master$> The case for dark matter is not one measurement. It is **seven or eight independent measurements**, on scales from a single dwarf galaxy to the whole observable universe, using unrelated physics — orbital dynamics, gravitational lensing, hot-gas hydrostatics, photon–baryon acoustics, nuclear reaction networks — that agree on a quantity none of them was designed to measure together.

That convergence is the argument, and it is worth being precise about why. A single anomalous measurement invites the response "your method is wrong". Several anomalous measurements sharing a method invite the same response. **Measurements that share no method and no assumption cannot all be wrong in the same direction by accident**, and that is the situation here.

This chapter also does something the popular treatments usually skip: it takes the leading alternative seriously. **Modified gravity succeeds precisely where dark matter is least impressive and fails precisely where dark matter is most impressive**, and understanding that pattern tells you more than a verdict does.

## Zwicky, and what his number actually meant

Fritz Zwicky measured the velocities of galaxies in the Coma cluster in 1933 and applied the virial theorem: for a self-gravitating system in equilibrium, the kinetic and potential energies are related, so the velocity dispersion gives the mass.

The dispersion was around 1,000 km s⁻¹. The mass required to hold galaxies moving that fast was, on his numbers, **about 400 times** the mass visible as starlight. He called the missing component *dunkle Materie*.

Three things about this deserve stating carefully, because the story is usually told badly in one direction or the other.

**His factor of 400 was too large, and part of the error was not his fault.** Zwicky used a Hubble constant of 558 km s⁻¹ Mpc⁻¹, over eight times the modern value, which made the cluster far too small and hence its mass-to-light ratio far too high. The modern figure for Coma is a mass-to-light ratio around 350 in solar units, still enormous but not 400 times the stellar value.

**The discrepancy survived every correction.** Better distances, better photometry, and — much later — the discovery that most cluster baryons are in hot X-ray gas rather than in stars all reduced the discrepancy without removing it. Hot gas turns out to be several times the stellar mass in a rich cluster, which was a genuine and substantial revision, and it still leaves roughly **85% of the mass unaccounted for**.

**Nobody acted on it for forty years.** The result was published in a reputable venue and was not refuted; it was found uncomfortable and set aside. The parallel with McKellar's CN measurement is exact in structure and opposite in kind: there, a correct measurement lacked a hypothesis to bear on; here, a correct measurement had a hypothesis and was ignored anyway. **A field can decline to act on a result for a long time without ever deciding it is wrong.**

## Rotation curves

The measurement that finally moved the field came from galaxies rather than clusters, and its force is that it requires almost no theory.

For a mass distribution with all the mass inside radius $r$, a circular orbit at $r$ satisfies

$$\frac{v^2}{r} = \frac{GM(<r)}{r^2} \quad\Longrightarrow\quad v = \sqrt{\frac{GM(<r)}{r}}.$$

Outside the visible disc of a spiral galaxy, where essentially all the light is interior, $M(<r)$ should be nearly constant and $v$ should fall as $r^{-1/2}$ — the Keplerian decline the Solar System shows.

**It does not.** Vera Rubin and Kent Ford, measuring optical rotation curves through the 1970s, found them **flat** to the edge of the light. Radio observations of neutral hydrogen, which extends far beyond the stars, pushed the measurement further out and found them still flat.

Invert the relation and the implication is immediate. A flat $v$ requires

$$M(<r) \propto r, \qquad \rho(r) \propto r^{-2}.$$

**Mass keeps accumulating linearly with radius in a region containing almost no light.** For the Milky Way, with $v \approx 220$ km s⁻¹:

| Radius | $M(<r) = v^2r/G$ |
| --- | --- |
| 8 kpc (Solar circle) | $9.0\times10^{10}\ M_\odot$ |
| 20 kpc | $2.3\times10^{11}\ M_\odot$ |
| 50 kpc | $5.6\times10^{11}\ M_\odot$ |
| 100 kpc | $1.1\times10^{12}\ M_\odot$ |

The stellar mass of the Milky Way is about $5\times10^{10}\ M_\odot$, essentially all of it inside 15 kpc. **By 100 kpc the enclosed mass exceeds the stellar mass by more than twenty.**

The measurement is unusually clean. It needs only Doppler shifts and Newtonian gravity — no distance ladder, no assumption about equilibrium beyond circular orbits, no modelling of unseen gas. **That robustness is why rotation curves, rather than Zwicky's clusters, are what changed minds**, even though the cluster result came first and was larger.

```checkpoint
q: A galaxy's rotation curve is flat far beyond its visible disc. What does that directly imply?
a: That the galaxy is rotating as a solid body, so all radii share an angular velocity
x: Solid-body rotation gives $v \propto r$, a rising line. A flat curve is a different behaviour entirely.
a*: That $M(<r)$ increases linearly with radius, so $\rho \propto r^{-2}$ — mass keeps accumulating in a region containing almost no light
a: That the visible mass has been underestimated, and correcting it would restore a Keplerian fall-off
x: No correction to the stellar mass helps: the light is essentially all interior, so any redistribution of the *visible* mass still gives a declining curve outside it.
a: That the galaxy is not in equilibrium, so the orbital relation does not apply
x: The gas discs used for these measurements are demonstrably settled and regular; disequilibrium would produce disordered kinematics, not a precisely flat curve.
hint: Set $v$ constant in $v = \sqrt{GM(<r)/r}$ and solve for $M(<r)$.
why: For a circular orbit $v = \sqrt{GM(<r)/r}$, so holding $v$ constant requires $M(<r) \propto r$ and hence $\rho \propto r^{-2}$. Since essentially all the starlight lies interior to the region where the curve stays flat, the additional mass emits no detectable light. For the Milky Way at $v = 220$ km s⁻¹ this gives $9.0\times10^{10}\,M_\odot$ within 8 kpc and $1.1\times10^{12}\,M_\odot$ within 100 kpc, against a stellar mass of about $5\times10^{10}\,M_\odot$. The result's force is its simplicity: it needs only Doppler shifts and Newtonian gravity — no distance ladder, no hydrostatic assumption, no correction for unseen gas — which is why rotation curves rather than Zwicky's earlier and larger cluster discrepancy are what changed the field's mind.
---
q: A flat rotation curve implies $\rho \propto r^{-2}$. Does that fix the shape of the dark matter halo?
a: Yes — it establishes the isothermal profile, which simulations confirm
x: Simulations produce the NFW profile, which is *not* $r^{-2}$ everywhere; the flat region merely samples where it happens to pass through that slope.
a*: No — it fixes the density slope only across the radii where the curve is measured to be flat, and cold dark matter simulations predict a profile that steepens outward and shallows inward, passing through $r^{-2}$ in between
a: Yes, since the density profile follows uniquely from the enclosed mass at every radius
x: It does follow uniquely *where measured*, but rotation curves cover a limited radial range, so nothing is fixed inside or outside it.
a: No, because rotation curves measure only the total mass, not its distribution
x: They do measure the distribution, through $M(<r)$ as a function of $r$ — the limitation is radial coverage, not the quantity measured.
hint: Ask over what range of radius a rotation curve is actually observed to be flat.
why: $M(<r) = v^2r/G$ gives $\rho \propto r^{-2}$ wherever $v$ is constant, and that is a genuine local constraint. But rotation curves are measured over a finite range — typically a few to a few tens of kiloparsecs — so they say nothing about the profile well inside or well outside it. Simulated cold dark matter halos follow roughly the NFW form, with $\rho \propto r^{-1}$ in the centre steepening to $r^{-3}$ in the outskirts, passing through $r^{-2}$ somewhere in between; a flat rotation curve is consistent with that without establishing it. The inner slope is exactly what the core–cusp debate is about, and it lies inside the radii where flatness is best measured — so the observation that made dark matter compelling is nearly silent on the question that most sharply divides simulations from data.
```

## Six more, each independent

Rotation curves alone would be suggestive. What makes the case is that entirely different measurements agree.

**Velocity dispersions of dwarf spheroidals.** The Milky Way's faintest satellites contain a few hundred to a few thousand stars, and their stellar velocity dispersions imply masses vastly exceeding the stellar mass. Mass-to-light ratios run from about 100 up to **3,400** for Segue 1. These are the most dark-matter-dominated systems known, and the measurement uses stellar spectroscopy alone.

**Strong gravitational lensing.** Massive clusters bend light from background galaxies into arcs and multiple images, and the geometry of those images fixes the projected mass. Abell 1689 and similar systems give masses consistent with the dynamical values and far above the baryonic ones. **This is a purely geometric measurement**, requiring no assumption that anything is in equilibrium.

**Weak lensing.** The same effect, statistically, from the slight coherent distortion of background galaxy shapes. It maps mass over wide fields, including regions with no visible object at all.

**Hot cluster gas.** X-ray emission gives the temperature and density profile of the intracluster medium, and hydrostatic equilibrium then gives the total mass. It agrees with the lensing masses. **It also reveals where the baryons actually are**: the hot gas outweighs the stars by several times, which was the largest legitimate correction to Zwicky's result and did not come close to closing the gap.

**The CMB third peak.** As the CMB Map chapter established, the third acoustic peak's height measures $\Omega_ch^2$ through the amount of gravitational driving before matter–radiation equality. Planck gives $\Omega_ch^2 = 0.1200 \pm 0.0012$. **This measurement involves no galaxy, no cluster and no dynamics of any kind** — it is photon–baryon acoustics at 372,000 years.

**Structure formation.** Baryon-only perturbations cannot begin growing until decoupling, and would have required a CMB anisotropy a hundred times larger than the one observed. The existence of galaxies requires matter that ignores photons.

Now combine the two cosmological measurements, which is where the argument becomes quantitative:

$$\Omega_bh^2 = 0.02237, \qquad \Omega_ch^2 = 0.1200 \quad\Longrightarrow\quad \frac{\Omega_b}{\Omega_m} = \frac{0.02237}{0.14237} = 0.157.$$

**Ordinary matter is 15.7% of all matter. The other 84.3% is not made of atoms.**

This last point deserves emphasis, because it is stronger than "there is extra mass". The baryon density is measured **twice, independently** — from primordial deuterium at 200 seconds and from the CMB's odd-to-even peak ratio at 372,000 years — and the two agree to 0.2%. So the shortfall cannot be closed by more baryons in some hard-to-see form. **Faint stars, cold gas, rocks and black holes are all made of baryons, and the baryon budget is full.** Whatever the missing mass is, it is not ordinary matter that we have failed to notice.

```checkpoint
q: Why does the agreement between the deuterium and CMB determinations of $\Omega_bh^2$ strengthen the case for *non-baryonic* dark matter specifically?
a: Because it shows the CMB measurement is reliable, which validates the third peak's dark matter determination
x: It does support the CMB analysis, but the decisive point concerns the baryon budget itself rather than the credibility of one instrument.
a*: Because it fixes the total baryon density by two independent routes, so the missing mass cannot be ordinary matter in some undetected form — faint stars, cold gas and rocks are all baryons, and the budget is already full
a: Because it rules out modified gravity, which cannot reproduce both measurements
x: The two-route agreement is about the baryon census; modified gravity's difficulties with the CMB are a separate argument.
a: Because deuterium is destroyed by dark matter, so its abundance measures the dark matter density
x: Deuterium is not affected by dark matter; it measures the baryon density through nuclear reaction rates.
hint: Ask what the missing mass would have to be made of, and whether there is room for it.
why: The obvious first hypothesis for missing mass is ordinary matter that is simply hard to see — faint stars, cold gas clouds, planets, stellar remnants. All of these are baryonic. Primordial deuterium fixes the baryon density from nuclear physics at 200 seconds, and the CMB's odd-to-even peak ratio fixes it from photon–baryon acoustics at 372,000 years; the two agree to 0.2%, using no shared assumptions. Combined with $\Omega_ch^2 = 0.1200$ from the third peak, baryons are $0.02237/0.14237 = 15.7\%$ of all matter. There is therefore no room in the budget for the missing mass to be unnoticed ordinary matter — it would have shown up as a higher $\Omega_bh^2$ in both determinations. This is a much stronger claim than "there is extra gravitating mass", and it is what rules out the MACHO-style explanations that microlensing surveys also independently excluded.
```

{{image: Galaxy rotation curve | The observed rotation curve of a spiral galaxy against the curve predicted from its visible matter alone. Beyond the disc, where essentially all the starlight lies interior, the Keplerian prediction falls as the inverse square root of radius while the measurement stays flat — implying that the enclosed mass continues to grow linearly with radius in a region that emits almost no light. The measurement requires only Doppler shifts and Newtonian gravity, which is what makes it so hard to dismiss.}}

## Dwarfs, and why the faintest are the darkest

The dwarf spheroidal satellites of the Milky Way deserve their own treatment, because they push the discrepancy furthest and because the trend they show is itself informative.

These systems are pressure-supported rather than rotating, so the mass follows from the stellar velocity dispersion. A robust estimator relates the mass within the half-light radius to the line-of-sight dispersion:

$$M_{1/2} \approx \frac{3\sigma^2 r_{1/2}}{G}.$$

Applying it across the satellite population:

| System | $\sigma$ (km s⁻¹) | $r_{1/2}$ (pc) | $M_{1/2}\ (M_\odot)$ | $M/L$ within $r_{1/2}$ |
| --- | --- | --- | --- | --- |
| Fornax | 11.7 | 710 | $6.8\times10^{7}$ | ~8 |
| Draco | 9.1 | 221 | $1.3\times10^{7}$ | ~130 |
| Segue 1 | 3.7 | 29 | $2.8\times10^{5}$ | ~1,600 |

Read down the last column. **The fainter the system, the more dark-matter-dominated it is** — spanning more than two orders of magnitude across systems that are all satellites of the same galaxy. Fornax, the brightest classical dwarf, has a mass-to-light ratio of order ten; Segue 1, with a few hundred solar luminosities in total, exceeds a thousand.

The trend has a natural reading. All these systems sit in dark-matter halos of broadly comparable mass — around $10^{7}$–$10^{9}\ M_\odot$ — but their ability to retain gas and form stars falls off sharply with halo mass, because supernova feedback and photoionisation by the ultraviolet background can expel gas from a shallow potential well. **The dark matter is roughly constant and the stars are not**, so the ratio climbs as one goes fainter.

Two features make these measurements valuable beyond their magnitude.

**The systems are small enough that the dark matter dominates everywhere**, not merely in an outer region. There is no regime in Segue 1 where baryons matter, so no uncertainty about stellar mass-to-light ratios propagates into the result — a difficulty that does complicate the innermost parts of spiral rotation curves.

**They test the alternative sharply.** Their internal accelerations are far below $a_0$, deep in MOND's modified regime, so they are precisely where a modified force law makes its strongest predictions. MOND does account for many of them, which is a point in its favour and is not always acknowledged; the systems it struggles with are those whose tidal environment is uncertain.

```checkpoint
q: Among the Milky Way's dwarf spheroidals, mass-to-light ratio rises steeply as luminosity falls — from about 8 for Fornax to over 1,000 for Segue 1. What best explains the trend?
a: That the fainter systems contain proportionally more dark matter because dark matter clusters more efficiently on small scales
x: Dark matter clustering does not work this way; small halos are not intrinsically richer in dark matter per unit mass.
a*: That the halo masses are broadly comparable while star formation is far less efficient in shallower potential wells, since supernova feedback and photoionisation expel gas — so the dark matter is roughly constant and the stars are not
a: That the fainter systems are further away, so their luminosities are systematically underestimated
x: These are all Milky Way satellites with well-determined distances; luminosity errors of two orders of magnitude are not in question.
a: That the fainter systems are not in equilibrium, so their dispersions overestimate the mass
x: Tidal disturbance is a real concern for a few systems, but it cannot generate a systematic trend spanning the whole population.
hint: Ask whether the numerator or the denominator of $M/L$ is doing the varying.
why: The dwarfs occupy halos of broadly similar mass, around $10^{7}$–$10^{9}\,M_\odot$, but their capacity to convert gas into stars collapses as the potential well shallows: supernova-driven outflows and heating by the ultraviolet background both remove gas more easily from a low-mass halo. So the denominator of $M/L$ falls by orders of magnitude while the numerator changes comparatively little, and the ratio climbs. Two things make these systems especially useful. Dark matter dominates everywhere within them, not just in an outer region, so no uncertainty in stellar mass-to-light ratios propagates into the result. And their internal accelerations lie far below $a_0$, deep in MOND's modified regime, which makes them a sharp test — one that MOND passes for many of them, a point worth acknowledging.
```

## The Bullet Cluster

One observation deserves separate treatment, because it does something none of the others can: **it separates the mass from the baryons in space.**

1E 0657-558, the Bullet Cluster, is two galaxy clusters that have passed through each other at about 4,700 km s⁻¹. In such a collision the components behave differently, and the differences are exactly what makes the system informative:

- **The galaxies** are effectively collisionless — the stellar systems are tiny compared with the distances between them — so they pass through and continue.
- **The hot gas**, which is most of the baryonic mass, is a fluid. It collides, shocks, heats, and is left behind between the two galaxy concentrations.
- **The dark matter**, if it exists and is collisionless, should track the galaxies rather than the gas.

X-ray imaging locates the gas. **Weak lensing locates the mass**, independently and geometrically. The result is that **the lensing mass peaks coincide with the galaxies, not with the gas** — offset from the X-ray peaks at about the $8\sigma$ level.

Why this is the cleanest single argument for dark matter is worth stating carefully, because it is often asserted rather than explained.

**In any theory where gravity is sourced by the visible matter, the gravitational potential must peak where the baryons are.** The gas is where most of the baryons are. The lensing shows the potential peaks somewhere else. A modification of gravity's *force law* cannot help, because the issue is not how strongly the mass attracts but **where the attracting mass is located.** You cannot move a potential well away from its source by rescaling the force.

Two honest qualifications.

**It does not exclude modified gravity outright** — only theories in which the gravitating source is exactly the visible matter. A theory with an additional gravitating field that can separate from the baryons is not excluded, but such a field is doing the job dark matter does, and the distinction becomes partly semantic.

**The collision velocity was, for some years, argued to be uncomfortably high** for $\Lambda$CDM, appearing in early estimates as an improbably rare event. Later analyses using the shock geometry rather than the naive gas velocity brought it into acceptable range. **It is worth recording as an example of an anomaly that was real, was pressed by critics, and resolved on examination** — which is what the process is supposed to do.

```checkpoint
q: Zwicky's 1933 result gave a mass discrepancy of about 400, and the modern figure for Coma is far smaller. Does that undermine the result?
a: Yes — an error of that size means the original claim carried no evidential weight
x: The discrepancy shrank but never closed, and every subsequent correction left ~85% of the mass unaccounted for. The claim was right in kind if wrong in magnitude.
a*: No — the largest error was his Hubble constant of 558 km s⁻¹ Mpc⁻¹, over eight times too high, which shrank the cluster and inflated the mass-to-light ratio; correcting it, and later accounting for hot X-ray gas, reduced the discrepancy without removing it
a: No, because the virial theorem is exact, so his method could not have been in error
x: The virial theorem requires equilibrium, which is an assumption about the cluster; the theorem's validity was not what fixed the number.
a: Yes, because the modern value comes from lensing rather than dynamics, so the original method is superseded
x: Modern dynamical and lensing masses agree; the dynamical method was not superseded but corroborated.
hint: Ask which input to his calculation was a widely accepted value of the day rather than something he measured.
why: Zwicky measured a velocity dispersion of about 1,000 km s⁻¹ and applied the virial theorem correctly. What was wrong was an input: the accepted Hubble constant of the day, 558 km s⁻¹ Mpc⁻¹, more than eight times the modern value, which made the cluster's inferred distance and physical size far too small and drove the mass-to-light ratio far too high. Correcting the distance scale, improving the photometry, and later discovering that hot X-ray gas outweighs cluster stars several times over all reduced the discrepancy — the last being a genuine and substantial revision. None of it closed the gap: roughly 85% of the mass remains unaccounted for, and Coma's mass-to-light ratio is still about 350 in solar units. The episode is a good example of a result being right in kind while wrong in magnitude, and of a field declining for forty years to act on it without ever deciding it was wrong.
---
q: Why is the Bullet Cluster considered a particularly strong argument for dark matter, compared with rotation curves?
a: Because the mass discrepancy is larger there than in any other system
x: Dwarf spheroidals show far larger mass-to-light ratios; the Bullet Cluster's force is structural rather than a matter of magnitude.
a*: Because the collision separates the mass from the baryons in space — the lensing potential peaks on the galaxies while most of the baryons are in the shocked gas elsewhere, and no modification of the force law can move a potential away from its source
a: Because it is the only system where the mass is measured by lensing rather than dynamics
x: Lensing masses are measured in many clusters; what is unique here is the spatial separation.
a: Because the collision velocity is too high to be explained without dark matter
x: The collision velocity was for some years argued to be a *problem* for $\Lambda$CDM, and later analyses resolved it. It is not part of the argument for dark matter.
hint: Ask what a modified force law can and cannot change about a gravitational potential.
why: In a collision between clusters, the galaxies pass through nearly collisionlessly while the hot gas — most of the baryonic mass — shocks and is left behind in the middle. Weak lensing measures where the gravitational potential actually is, geometrically and without any equilibrium assumption. It peaks on the galaxies, offset from the X-ray gas at about $8\sigma$. Any theory in which gravity is sourced by the visible matter requires the potential to peak where the baryons are, and rescaling the strength of gravity cannot relocate a potential well away from its source. What the observation does not do is exclude every modified-gravity theory: one with an extra gravitating field able to separate from the baryons survives, though such a field is performing dark matter's role. And the collision velocity, once argued to be uncomfortably high for $\Lambda$CDM, was resolved by later shock-geometry analyses.
```

## Lensing measures mass without assuming anything

Two of the seven lines of evidence use gravitational lensing, and they deserve separating from the rest because of what they do not assume.

Every dynamical mass estimate — rotation curves, velocity dispersions, X-ray hydrostatics — requires an assumption about the *state* of the system: that orbits are circular, that the system is virialised, that the gas is in hydrostatic equilibrium. Those assumptions are usually defensible and occasionally wrong, and a critic can always attack them.

**Lensing assumes none of them.** Light deflection depends on the mass distribution and the geometry, full stop. A cluster could be violently out of equilibrium, mid-collision, rotating, or anything else, and the deflection of background light would still measure the projected mass along the line of sight.

For a mass $M$ inside the Einstein radius, with angular-diameter distances $D_L$, $D_S$ and $D_{LS}$ to lens, source and between,

$$\theta_E = \sqrt{\frac{4GM}{c^2}\frac{D_{LS}}{D_LD_S}}.$$

For a $10^{14}\ M_\odot$ cluster at $z = 0.3$ lensing a source at $z = 1$, this gives $\theta_E \approx 24$ arcseconds — comfortably resolvable, and matching the radii at which giant arcs are actually observed.

**Strong lensing** — arcs and multiple images — gives a precise projected mass within the Einstein radius, and where multiple image systems at different source redshifts are available, the mass profile as well. **Weak lensing** uses the slight coherent stretching of thousands of background galaxies to map mass over wide fields, including regions containing no visible object.

The two together do something the dynamical methods cannot: they **map where the mass is**, rather than measuring how much lies within some radius. That capability is what makes the Bullet Cluster argument possible, and it is why lensing carries disproportionate weight in the case even though it does not give the largest discrepancies.

```checkpoint
q: What does gravitational lensing provide that dynamical mass estimates cannot?
a: Greater precision, since light deflection is calculable exactly while dynamics involves approximations
x: Lensing measurements are not generally more precise; shape noise and the mass-sheet degeneracy limit them. The advantage lies elsewhere.
a*: A mass measurement that assumes nothing about the system's dynamical state — no circular orbits, no virialisation, no hydrostatic equilibrium — and that maps where the mass is rather than how much lies within a radius
a: Sensitivity to dark matter specifically, since ordinary matter does not deflect light detectably
x: All mass deflects light in proportion to its mass; lensing is not selective for dark matter.
a: The ability to measure mass at high redshift, which dynamics cannot reach
x: Dynamical measurements at high redshift are difficult but possible, and depth is not the distinguishing advantage.
hint: List what each dynamical method has to assume about the system's state, then ask what lensing has to assume.
why: Rotation curves assume circular orbits; velocity dispersions assume virial equilibrium; X-ray masses assume hydrostatic equilibrium. Each assumption is usually reasonable and occasionally wrong, and each gives a critic something to attack. Light deflection depends only on the mass distribution and the geometry, so a cluster mid-collision, rotating or wildly disturbed still lenses according to its projected mass. Beyond that, lensing *maps* the mass rather than integrating it within a radius: strong lensing fixes the projected mass inside the Einstein radius — about 24 arcseconds for a $10^{14}\,M_\odot$ cluster at $z = 0.3$ with a source at $z = 1$ — and weak lensing charts mass across wide fields including empty-looking regions. That mapping capability is exactly what makes the Bullet Cluster argument possible, and it is why lensing carries weight out of proportion to the size of the discrepancies it reports.
```

## Taking the alternative seriously

If the evidence is this strong, why does anyone propose modifying gravity? Because there is a real observation that dark matter does not naturally explain, and pretending otherwise misrepresents the field.

**MOND** — Modified Newtonian Dynamics, proposed by Mordehai Milgrom in 1983 — posits that below a characteristic acceleration

$$a_0 \approx 1.2\times10^{-10}\ \mathrm{m\ s^{-2}},$$

the effective gravitational acceleration departs from Newton's law, approaching $\sqrt{a_Na_0}$ rather than $a_N$. This one modification, with one new constant, reproduces flat rotation curves immediately.

What MOND does well is more impressive than it is usually given credit for.

**It predicts the baryonic Tully–Fisher relation.** Rotation velocity and baryonic mass are observed to satisfy $M_b \propto v^4$ with remarkably little scatter across five decades in mass. In MOND this is a theorem. In $\Lambda$CDM it must emerge from the interaction of halo assembly, star formation and feedback, and reproducing its tightness is a real challenge.

**It predicts the radial acceleration relation.** The observed acceleration in a galaxy is a tight function of the acceleration expected from the baryons alone — with scatter consistent with measurement error. **The visible matter appears to determine the total gravitational field point by point**, which is exactly what MOND asserts and is not obviously what one expects if the dominant mass is a separately assembled halo.

**Its characteristic acceleration is numerically suggestive.** $a_0 = 1.2\times10^{-10}$ m s⁻² is close to $cH_0/2\pi = 1.04\times10^{-10}$ m s⁻², within about 15%. Whether that means anything is genuinely unclear — it may hint that the modification is cosmological in origin, or it may be the kind of coincidence that arises whenever one forms a quantity of the right dimensions from the only constants available. **It should be recorded and not leaned on.**

**It made successful predictions in advance**, notably about low-surface-brightness galaxies, whose rotation curves were later measured and matched.

These are genuine successes and they are the reason the idea persists. But the failures are decisive at larger scales.

**Clusters.** Applying MOND to galaxy clusters still leaves a mass discrepancy of roughly a factor of two. MOND does not eliminate dark matter in clusters; it reduces how much is needed. **A theory proposed to remove dark matter that still requires dark matter has lost its main argument.**

**The Bullet Cluster**, for the reason given above.

**The CMB.** The acoustic peak heights depend on how much non-interacting matter was present before recombination. Relativistic completions of MOND — TeVeS and its successors — have not reproduced the peak pattern, and in particular the third peak's height, without adding a component that behaves like collisionless matter.

**Structure formation.** Without matter that grows perturbations before decoupling, structure cannot assemble by the present epoch from CMB-sized seeds.

The honest summary is a specific one, and more interesting than a verdict:

**Dark matter is established at cluster and cosmological scales by multiple independent measurements, and it does not naturally explain galaxy-scale regularities. MOND explains galaxy-scale regularities and fails at cluster and cosmological scales.** Each succeeds where the other is weakest — which is not what one expects if one is simply right and the other simply wrong.

The most likely resolution is that dark matter is correct and the galaxy-scale regularities emerge from baryonic physics that current simulations model imperfectly; this is the majority position and there is real work behind it. But **the radial acceleration relation is an unexplained empirical regularity in the standard picture**, not a solved problem, and a chapter that presented the evidence without saying so would be misleading.

```checkpoint
q: MOND reproduces the baryonic Tully–Fisher and radial acceleration relations with a single new constant. Why is it nonetheless not the accepted explanation?
a: Because it has no relativistic formulation, so it cannot be taken seriously as a theory
x: Relativistic formulations exist — TeVeS and successors. The problem is that they fail to reproduce the observations, not that they are absent.
a*: Because it fails at larger scales — clusters still require roughly a factor of two of unseen mass under MOND, the Bullet Cluster separates mass from baryons, and no relativistic version reproduces the CMB third peak without adding collisionless matter
a: Because the relations it explains are not actually observed with the tightness claimed
x: Both relations are observed and are genuinely tight; that is precisely what makes MOND's successes real and worth acknowledging.
a: Because dark matter explains the same galaxy-scale relations more naturally
x: It does not — reproducing the tightness of the radial acceleration relation from halo assembly plus feedback is an acknowledged difficulty for $\Lambda$CDM.
hint: Ask on which scales each picture succeeds, and whether the successes overlap.
why: MOND's galaxy-scale successes are real: the baryonic Tully–Fisher relation follows as a theorem, the radial acceleration relation is exactly its central claim, and it predicted low-surface-brightness rotation curves in advance. Its failures are at larger scales. In clusters it still leaves about a factor of two of missing mass, so it does not remove dark matter but only reduces it — which forfeits its principal motivation. The Bullet Cluster puts the lensing potential where the baryons are not, which no force-law modification can arrange. And relativistic versions have not reproduced the CMB acoustic peak heights, particularly the third, without a component behaving like collisionless matter. The honest picture is that each framework succeeds where the other is weakest: dark matter is secure cosmologically and does not naturally explain the galaxy-scale regularities, which remain an open problem rather than a solved one.
---
q: MOND's characteristic acceleration $a_0 = 1.2\times10^{-10}$ m s⁻² is close to $cH_0/2\pi = 1.04\times10^{-10}$ m s⁻². How much weight should that carry?
a: Considerable — a match this close between a galactic constant and a cosmological one cannot be coincidence
x: 15% agreement between quantities of the same dimensions, formed from the few constants available, is not by itself remarkable. The inference needs more than the number.
a*: It should be recorded but not leaned on: it may hint at a cosmological origin for the modification, or it may be what one gets from combining the only available constants into something with the right dimensions
a: None — dimensional coincidences are meaningless and should be disregarded entirely
x: Numerical coincidences have occasionally pointed at real physics, and dismissing them categorically is as unjustified as over-reading them.
a: It refutes MOND, since a fundamental constant should not depend on the epoch
x: An epoch-dependent $a_0$ would be a testable feature rather than a refutation, and would follow naturally if the effect is cosmological in origin.
hint: Ask how many ways there are to build an acceleration from $c$ and $H_0$, and how close any of them would land.
why: There are very few constants available — $c$, $G$, $H_0$ — and essentially one obvious way to make an acceleration from the first and last, so landing within 15% is not by itself strong evidence of a connection. Set against that, the coincidence is suggestive: if the modification arose from the cosmological expansion it would explain both why $a_0$ takes that value and why it is a constant at all rather than a fitted parameter, and it would predict $a_0$ to track $H(t)$, which is testable. The defensible position is to record it as a hint about where a deeper theory might come from, without treating it as evidence — the same discipline one would apply to any numerological agreement that has not yet produced an independent prediction.
```

{{image: Bullet Cluster | The colliding cluster 1E 0657-558, with the hot X-ray-emitting gas — most of the baryonic mass — shown between the two galaxy concentrations, and the mass distribution reconstructed from weak gravitational lensing peaking on the galaxies instead. The offset is significant at about eight standard deviations. Because the collision has separated the bulk of the baryons from the gravitational potential, no rescaling of the force law can account for it: a modified force can change how strongly a mass attracts, but not where the attracting mass is.}}

## Where the standard picture struggles

Symmetry requires the same treatment of $\Lambda$CDM that the previous section gave MOND. Four difficulties at galaxy scales have been pressed for decades, and their current status varies considerably.

**The core–cusp problem.** Simulations of collisionless cold dark matter produce halos with a central density **cusp**, $\rho \propto r^{-1}$ at small radius. Many observed dwarf and low-surface-brightness galaxies instead show a flat central **core**. *Status*: partly addressed. Repeated supernova-driven gas outflows can transfer energy to the dark matter and flatten a cusp, and simulations including that physics produce cores of roughly the right size — but the effect depends on how feedback is implemented, which is the least secure part of any such simulation. **Not resolved to everyone's satisfaction.**

**Missing satellites.** Simulations predicted hundreds of subhalos around a Milky Way-sized galaxy; a few dozen satellites were known. *Status*: **substantially resolved**, and from the observational side. Deep surveys — SDSS, then DES and its successors — found ultra-faint dwarfs in numbers that, corrected for survey coverage and surface-brightness limits, largely close the gap. Most predicted subhalos were expected to be dark or nearly so anyway, for the star-formation reasons discussed above. **A case where the discrepancy was in the data, not the theory.**

**Too-big-to-fail.** The most massive simulated subhalos are denser than the halos inferred for the brightest observed dwarfs — they are too big to have failed to form stars, yet no observed satellite matches them. *Status*: eased by the same feedback that produces cores, and by revised Milky Way mass estimates, but **still argued about.**

**Planes of satellites.** The Milky Way's satellites, and M31's, lie in surprisingly thin, rotating planar configurations. *Status*: **genuinely unresolved.** Simulations produce such configurations rarely; proposed explanations include accretion along filaments and group infall, and the significance of the observation itself is contested.

Two points about this list.

**None of these is a cosmological-scale failure.** Every one concerns the internal structure of galaxies and their satellites, where baryonic physics is important and poorly modelled. The measurements that establish dark matter — cluster lensing, the CMB peaks, the baryon budget — are untouched.

**But that is also the pattern MOND exploits.** The small-scale problems and MOND's successes are the same observations viewed from two directions: **galaxy-scale phenomena look more regular, and more tightly tied to the baryons, than a stochastically assembled halo naturally predicts.** Whether that regularity emerges from feedback physics or points at something else is the live question, and it is not settled by pointing at the Bullet Cluster.

```checkpoint
q: The core–cusp problem, missing satellites, too-big-to-fail and planes of satellites are all cited as $\Lambda$CDM difficulties. What is the fair assessment?
a: Together they refute $\Lambda$CDM, which survives only through repeated adjustment
x: All four concern galaxy-scale internal structure and leave the cluster-scale and cosmological evidence untouched; none bears on the measurements that establish dark matter.
a*: All four concern galaxy-scale structure where baryonic physics is important and poorly modelled — missing satellites is largely resolved observationally, core–cusp and too-big-to-fail are eased by feedback but disputed, and satellite planes remain genuinely open
a: They are all resolved, and continuing to cite them reflects unfamiliarity with recent simulations
x: Missing satellites is largely settled, but core–cusp and too-big-to-fail depend on feedback implementations that are the least secure part of any simulation, and satellite planes are unexplained.
a: They are irrelevant, since dark matter is established by cluster and cosmological measurements
x: The cosmological evidence does stand independently, but dismissing the small-scale problems ignores that they are the same phenomena MOND's successes describe.
hint: Ask, for each, whether the difficulty was in the theory, in the data, or in the baryonic physics between them.
why: Missing satellites was largely a data problem: deep surveys found ultra-faint dwarfs in numbers that, corrected for coverage and surface-brightness limits, close most of the gap, and most predicted subhalos were expected to be dark anyway. Core–cusp and too-big-to-fail are eased by supernova-driven outflows transferring energy to the dark matter, but that depends on feedback prescriptions which are the least reliable ingredient in any simulation. Satellite planes remain unexplained and their significance is contested. None of these touches the cluster lensing, CMB peaks or baryon budget that establish dark matter. But they are the same phenomena from which MOND draws its successes: galaxy-scale structure looks more regular and more tightly tied to the baryons than a stochastically assembled halo naturally predicts, and whether feedback explains that is the live question.
```

## What it is not

Several candidates have been proposed and excluded, and the exclusions are informative because they narrow the field sharply.

**Not faint baryons.** Covered above: the baryon budget is fixed twice over and is full.

**Not MACHOs.** Massive compact halo objects — brown dwarfs, old white dwarfs, stellar-mass black holes — would microlens background stars as they pass in front. The MACHO and EROS surveys monitored millions of stars in the Magellanic Clouds for years and found far too few events. **MACHOs are excluded as the dominant halo component over a wide mass range**, and in any case they are baryonic, so the previous point already applies.

**Not primordial black holes, over most masses.** These are not baryonic and so evade that constraint, and the possibility is taken seriously. But microlensing excludes them from roughly $10^{-11}$ to $10\ M_\odot$, and accretion effects on the CMB constrain higher masses. A window around asteroid masses remains open, and is actively studied.

**Not standard neutrinos.** They are non-baryonic and certainly exist, but they are **hot** — relativistic when structure began forming — so they free-stream out of small perturbations and erase precisely the structure that needs to form first. A neutrino-dominated universe produces large structures first and fragments them, which is the opposite of what is observed. **The observed bottom-up hierarchy requires cold dark matter**, and this is one of the few places where an observation of galaxy clustering constrains particle physics directly.

What remains is a particle that is **non-baryonic, non-relativistic when structure formed, and interacting at most weakly** with ordinary matter. **That is a description, not an identification**, and the next chapter takes up the accounting; the Open Questions chapter takes up the searches, which have so far found nothing.

```checkpoint
q: Standard neutrinos are non-baryonic, certainly exist, and have mass. Why can they not be the dark matter?
a: Because their total mass density is too small, though the mechanism would otherwise work
x: The density is indeed too small, but even at the right density they would fail — the decisive objection is about the kind of structure they produce.
a*: Because they are hot — relativistic when structure formation began — so they free-stream out of small perturbations and erase them, producing a top-down hierarchy in which large structures form first and fragment, the opposite of what is observed
a: Because they interact only weakly, so they cannot cluster gravitationally at all
x: Weakly interacting particles cluster gravitationally perfectly well; that is precisely what cold dark matter is assumed to do.
a: Because they are fermions, and the Pauli exclusion principle prevents the required densities in galaxy halos
x: Phase-space packing does constrain light fermions in dwarf galaxies, but the primary and much more general objection is free-streaming.
hint: Ask what a fast-moving particle does to a small density perturbation it passes through.
why: A relativistic particle streams freely across perturbations smaller than the distance it travels, carrying its energy out of them and smoothing them away. Neutrinos were relativistic through the era when the smallest structures needed to begin growing, so a neutrino-dominated universe erases small-scale power and forms the largest structures first, which then fragment — a top-down hierarchy. The observed hierarchy is bottom-up: small systems assemble first and merge into larger ones, as galaxy surveys and the observed abundance of high-redshift galaxies both show. This is one of the few places where the clustering of galaxies constrains particle physics directly, and it is why the required particle must be *cold* — non-relativistic when structure formation began — rather than merely non-baryonic and weakly interacting.

## Pulling the thread

- The case is **a convergence of independent measurements**, not one measurement repeated: rotation curves, dwarf-spheroidal dispersions, strong lensing, weak lensing, X-ray hydrostatics, the CMB third peak, and structure formation. **Methods that share no assumptions cannot all err in the same direction by accident.**
- **Zwicky's 1933 factor of 400 was too large** — largely because his $H_0$ was eight times too high — but the discrepancy survived every correction, including the discovery that hot gas outweighs stars in clusters. **The field declined to act on a correct result for forty years without ever deciding it was wrong.**
- **Flat rotation curves** give $M(<r) \propto r$, so $\rho \propto r^{-2}$. The Milky Way encloses $1.1\times10^{12}\ M_\odot$ within 100 kpc against a stellar mass of $5\times10^{10}$. The measurement needs only Doppler shifts and Newtonian gravity, **which is why it, and not Zwicky's larger earlier result, changed minds.**
- **Baryons are 15.7% of matter**, from $\Omega_bh^2 = 0.02237$ against $\Omega_mh^2 = 0.14237$. Because the baryon density is fixed **twice independently** — deuterium and the CMB peak ratio, agreeing to 0.2% — **the missing mass cannot be unnoticed ordinary matter.**
- The **Bullet Cluster** separates mass from baryons in space: lensing peaks on the galaxies, X-ray gas sits between, offset at $8\sigma$. **A modified force law can change how strongly mass attracts but not where the attracting mass is.**
- **MOND deserves to be taken seriously.** It predicts the baryonic Tully–Fisher and radial acceleration relations from one constant $a_0 = 1.2\times10^{-10}$ m s⁻², and predicted low-surface-brightness rotation curves in advance. It fails on clusters (still needing a factor of two), on the Bullet Cluster, and on the CMB third peak. **Each framework succeeds where the other is weakest**, and the radial acceleration relation remains unexplained in the standard picture.
- Excluded: **faint baryons** (budget full), **MACHOs** (microlensing), **primordial black holes** over most masses, and **standard neutrinos** (too hot — they erase small-scale structure, and the observed hierarchy is bottom-up).

The transferable idea: **when weighing evidence, count independent methods rather than independent measurements.** Fifty rotation curves are close to one piece of evidence, because a systematic in the method would affect all of them; one rotation curve plus one lensing map plus one CMB peak is three, because no error mechanism is shared. This is why the dark matter case is strong despite no detection, and it is also why the honest treatment must credit MOND's galaxy-scale successes rather than burying them — **a framework that is failing on one class of observation while succeeding on another is telling you where its physics is incomplete**, and the useful response is to locate the boundary rather than to declare a winner.

## Further reading

{{book: Robert Sanders | The Dark Matter Problem: A Historical Perspective | 2010}}

{{book: Dan Hooper | Dark Cosmos | 2006}}

{{book: Richard Panek | The 4 Percent Universe | 2011}}

Beyond the books: Sanders is the essential source because he is a MOND sympathiser writing a careful history, so the alternative gets a fair hearing from someone who understands it. Rubin's original rotation-curve papers are short and readable and show how unforced the conclusion was. On the other side, McGaugh, Lelli and Schombert's paper on the radial acceleration relation is the sharpest statement of what $\Lambda$CDM has not yet explained, and is worth reading alongside the simulation papers that respond to it.

## Problems

*Useful numbers: $G = 6.674\times10^{-11}$ SI; 1 kpc $= 3.086\times10^{19}$ m; $M_\odot = 1.989\times10^{30}$ kg; Milky Way $v_{\rm flat} = 220$ km s⁻¹, stellar mass $5\times10^{10}\ M_\odot$; $\Omega_bh^2 = 0.02237$, $\Omega_ch^2 = 0.1200$, $h = 0.674$; Coma dispersion ~1,000 km s⁻¹; Zwicky's $H_0 = 558$ km s⁻¹ Mpc⁻¹; $a_0 = 1.2\times10^{-10}$ m s⁻²; Bullet Cluster offset $8\sigma$, collision speed 4,700 km s⁻¹; Segue 1 $M/L \approx 3400$.*

**1.** *(Rotation curves.)* **(a)** Derive $M(<r)$ from a flat rotation curve and give $\rho(r)$. **(b)** Compute $M(<r)$ for the Milky Way at 8, 20 and 100 kpc. **(c)** Compare with the stellar mass and state why this measurement is unusually robust.

**2.** *(Zwicky.)* **(a)** State his result and the method. **(b)** Identify the largest source of error and its direction. **(c)** State what survived correction, and what the forty-year delay illustrates.

**3.** *(Independence.)* **(a)** List six independent lines of evidence. **(b)** For each, state what physics it uses. **(c)** Explain why counting independent *methods* matters more than counting measurements.

**4.** *(The baryon budget.)* **(a)** Compute $\Omega_b/\Omega_m$. **(b)** State the two independent determinations of $\Omega_bh^2$ and their agreement. **(c)** Explain why this rules out unnoticed ordinary matter, and name two specific candidates it excludes.

**5.** *(The Bullet Cluster.)* **(a)** Describe the three components and how each behaves in the collision. **(b)** State the observation and its significance. **(c)** Explain precisely why a modified force law cannot account for it, and state two honest qualifications.

**6.** *(MOND's successes.)* **(a)** State the modification and the new constant. **(b)** Name three things it gets right and say why each is impressive. **(c)** Explain why the radial acceleration relation is awkward for $\Lambda$CDM.

**7.** *(MOND's failures.)* **(a)** State the cluster problem and why it is damaging to MOND's motivation. **(b)** State the CMB problem. **(c)** Give the honest summary of the debate's shape.

**8.** *(Exclusions.)* **(a)** Explain why MACHOs are excluded, by two independent arguments. **(b)** Explain why standard neutrinos cannot be the dark matter. **(c)** State what properties remain, and why that is a description rather than an identification.

**9.** *(Counting evidence.)* **(a)** Explain why fifty rotation curves are close to one piece of evidence. **(b)** Explain why one rotation curve plus one lensing map plus one CMB peak is three. **(c)** State the general principle and apply it to a case outside astronomy.

## Worked answers

**1.** **(a)** A circular orbit satisfies $v^2/r = GM(<r)/r^2$, so $M(<r) = v^2r/G$. Holding $v$ constant gives $M(<r) \propto r$, and differentiating, $\rho(r) = \frac{1}{4\pi r^2}\frac{dM}{dr} \propto r^{-2}$. **(b)** With $v = 2.2\times10^{5}$ m s⁻¹: at 8 kpc, $M = (2.2\times10^{5})^2(2.47\times10^{20})/6.674\times10^{-11} = \mathbf{9.0\times10^{10}\ M_\odot}$; at 20 kpc, $\mathbf{2.3\times10^{11}\ M_\odot}$; at 100 kpc, $\mathbf{1.1\times10^{12}\ M_\odot}$. **(c)** The stellar mass is about $5\times10^{10}\ M_\odot$, essentially all within 15 kpc, so by 100 kpc the enclosed mass exceeds it by more than **twenty**. The measurement is robust because it uses only **Doppler shifts and Newtonian gravity** — no distance ladder (velocities are measured spectroscopically and radii from angular size with only a modest distance dependence), no hydrostatic assumption, no modelling of unseen components. There is very little in the chain that can be wrong, which is why it, rather than Zwicky's earlier and larger cluster discrepancy, is what moved the field.

**2.** **(a)** Applying the **virial theorem** to the Coma cluster's ~1,000 km s⁻¹ velocity dispersion, Zwicky found the dynamical mass exceeded the mass in starlight by about **400**, and named the missing component *dunkle Materie*. **(b)** His **Hubble constant of 558 km s⁻¹ Mpc⁻¹**, more than eight times the modern value. That made the cluster's inferred distance and hence its physical size far too small, driving the mass-to-light ratio far too high. The error was in a widely accepted value of the day, not in his analysis. **(c)** The **discrepancy itself survived**: better distances, better photometry and the later discovery that hot X-ray gas outweighs cluster stars by several times all reduced it without removing it, leaving roughly **85% of the mass unaccounted for**. The forty-year delay illustrates that **a field can decline to act on a correct result for a long time without ever deciding it is wrong** — the result was published, unrefuted, and simply found uncomfortable.

**3.** **(a)** Galaxy **rotation curves**; **dwarf spheroidal velocity dispersions**; **strong lensing**; **weak lensing**; **X-ray hydrostatics** of cluster gas; and the **CMB third peak**. Structure formation is a seventh. **(b)** Rotation curves: Newtonian orbital dynamics. Dispersions: stellar spectroscopy plus the virial theorem. Strong lensing: general-relativistic light deflection, purely geometric. Weak lensing: the same, statistically. X-ray: thermal bremsstrahlung plus hydrostatic equilibrium. CMB: photon–baryon acoustics at 372,000 years, with no dynamics at all. **(c)** Because **a systematic error lives in a method, not in a datum.** Fifty rotation curves share every assumption of the rotation-curve method, so a flaw in that method corrupts all fifty together — they are close to one piece of evidence. Measurements with no shared assumptions cannot fail in the same direction by accident, so their agreement is what carries evidential weight. Counting independent methods, this case has six or seven.

**4.** **(a)** $\Omega_mh^2 = 0.02237 + 0.1200 = 0.14237$, so $\Omega_b/\Omega_m = 0.02237/0.14237 = \mathbf{0.157}$ — ordinary matter is **15.7%** of all matter and dark matter is **84.3%**. **(b)** **Primordial deuterium**, through $\mathrm{D/H} \propto \eta^{-1.6}$ and nuclear reaction rates at 200 seconds, giving $\Omega_bh^2 = 0.02233 \pm 0.00036$; and the **CMB's odd-to-even acoustic peak ratio**, through baryon inertia in the photon–baryon fluid at 372,000 years, giving $0.02237 \pm 0.00015$. They agree to **0.2%** with no shared assumptions. **(c)** Because every candidate form of "ordinary matter we failed to see" — faint stars, cold gas, planets, rocks, stellar-mass black holes — is **baryonic**, and would therefore have raised $\Omega_bh^2$ in both determinations. The budget is measured twice and is full. Specifically excluded: **MACHOs** (also excluded independently by microlensing) and **cold molecular gas clouds** in halos.

**5.** **(a)** **Galaxies**: effectively collisionless, since stellar systems are tiny compared with their separations, so they pass through and continue. **Hot gas**: a fluid holding most of the baryonic mass, which collides, shocks, heats and is left behind between the clusters. **Dark matter**: if collisionless, it should track the galaxies. **(b)** Weak lensing puts the **mass peaks on the galaxies**, offset from the X-ray gas peaks at about **$8\sigma$**. **(c)** Because in any theory where gravity is sourced by the visible matter, the potential must peak **where the baryons are**, and most baryons are in the gas. A modified force law changes **how strongly** a given mass attracts, not **where the attracting mass sits** — you cannot relocate a potential well away from its source by rescaling the force. *Qualifications*: it does not exclude modified-gravity theories containing an **additional gravitating field** able to separate from the baryons, though such a field is doing dark matter's job; and the **collision velocity** was for some years argued to be improbably high for $\Lambda$CDM, an objection resolved by later analyses using shock geometry rather than the naive gas velocity.

**6.** **(a)** Below a characteristic acceleration $a_0 \approx 1.2\times10^{-10}$ m s⁻², the effective acceleration departs from Newton's, approaching $\sqrt{a_Na_0}$. One modification, **one new constant**. **(b)** *Baryonic Tully–Fisher*: $M_b \propto v^4$ with very little scatter over five decades in mass, which in MOND is a **theorem** and in $\Lambda$CDM must emerge from halo assembly, star formation and feedback. *Radial acceleration relation*: the observed acceleration is a tight function of the acceleration expected from baryons alone, with scatter consistent with measurement error. *Low-surface-brightness galaxies*: MOND predicted their rotation curves **in advance** of measurement. **(c)** Because it says **the visible matter determines the total gravitational field point by point**, with essentially no scatter. In $\Lambda$CDM the dominant mass is a halo assembled by a partly stochastic merger history, coupled to the baryons only through feedback; producing a relation that tight is not what one would naively expect, and reproducing it in simulations is an acknowledged challenge rather than a solved problem.

**7.** **(a)** Applying MOND to galaxy clusters still leaves a mass discrepancy of about a **factor of two**. This is damaging because MOND's principal motivation is the elimination of dark matter: **a theory that still requires dark matter has forfeited its main argument**, and is then competing on parsimony grounds it no longer wins. **(b)** The CMB acoustic **peak heights** — particularly the third — depend on how much non-interacting matter was present before recombination, and relativistic completions such as TeVeS have not reproduced the pattern without adding a component that behaves like collisionless matter. Structure formation compounds this: without matter growing perturbations before decoupling, present-day structure cannot assemble from CMB-sized seeds. **(c)** **Dark matter is established at cluster and cosmological scales by multiple independent methods, and does not naturally explain galaxy-scale regularities. MOND explains the galaxy-scale regularities and fails at cluster and cosmological scales.** Each succeeds where the other is weakest — not the pattern one expects if one is simply right. The majority position, that dark matter is correct and the galaxy-scale relations emerge from baryonic physics, is well motivated, but the radial acceleration relation remains an **unexplained empirical regularity** in the standard picture.

**8.** **(a)** *First*, **microlensing**: a compact halo object passing in front of a background star briefly magnifies it, and the MACHO and EROS surveys monitored millions of stars in the Magellanic Clouds for years, finding far too few events for MACHOs to dominate the halo over a wide mass range. *Second*, **MACHOs are baryonic** — brown dwarfs, white dwarfs, stellar remnants — so the baryon budget argument already excludes them regardless of microlensing. Two independent exclusions. **(b)** Because neutrinos are **hot**: relativistic when structure formation began, so they free-stream out of small perturbations and erase them. A neutrino-dominated universe forms the largest structures first and fragments them downward, whereas the observed hierarchy is **bottom-up** — small systems first, assembling into larger. This is one of the few cases where galaxy clustering constrains particle physics directly. **(c)** What remains is a particle that is **non-baryonic**, **non-relativistic when structure formed** (cold), and **at most weakly interacting** with ordinary matter. This is a **description of required behaviour, not an identification of a particle**: it specifies constraints any candidate must satisfy without naming one, and every direct search so far has returned null.

**9.** **(a)** Because they share the **method**, and therefore every assumption in it: that the gas discs are in circular orbits, that inclination corrections are right, that non-circular motions are negligible, that Newtonian gravity applies. A flaw in any of these corrupts all fifty in the same direction. Statistical scatter falls as $1/\sqrt{N}$; **systematic error does not fall at all**. **(b)** Because the three share **no error mechanism**. An inclination error cannot affect a lensing map; a lensing shear systematic cannot affect the CMB's peak heights; a foreground error in the CMB cannot affect stellar spectroscopy. For all three to agree by accident, three unrelated errors would have to conspire in the same direction and magnitude. **(c)** **Count independent methods, not independent measurements** — evidential weight comes from the absence of a shared failure mode. Outside astronomy: in **clinical evidence**, ten observational cohorts sharing a confounder are worth less than one cohort plus one randomised trial plus one Mendelian-randomisation study, because the latter three fail differently. The instinct to be reassured by a large $N$ is exactly wrong when the error is systematic, and the useful question is always: **what would have to be wrong for all of these to be wrong together?**$duEvid_master$,
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
