-- Astronomy & Space · The Extragalactic Universe — The Cosmic Web —
-- "Superclusters". Curated master for
-- astronomy-and-space/extragalactic/cosmic-web/superclusters
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The chapter where "object" stops being the right category. Superclusters
-- are the largest structures and are not bound: the binding criterion
-- M > Omega_L H0^2 R^3 / G is worked numerically and cleanly separates the
-- Local Group, which is bound, from Laniakea, which is not - by a factor
-- of nearly four. Everything follows from that. Why a supercluster can
-- only be detected through peculiar velocities and why those measurements
-- are so hard; the CMB dipole read as our own motion; Laniakea's watershed
-- definition as a definition by dynamics rather than by counting, and what
-- it buys and costs; the percolation problem making "largest structure"
-- claims threshold-dependent; voids as the complement and the cleaner
-- cosmological probe; and the end of structure formation under dark
-- energy, which fixes a largest object that will ever exist and puts us
-- close to it. ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/cosmic-web/superclusters',
    'research',
    'advanced',
    'read',
    $egSuper_master$> A supercluster is the largest structure in the universe and it is **not an object**. Nothing holds it together. Its members are receding from one another, more slowly than the general expansion but receding all the same, and under dark energy they always will. Superclusters are the scale at which the word "object" stops applying — where a structure is a **pattern in a flow** rather than a thing — and the resulting difficulty of even defining one is not a nuisance around the physics but the physics itself.

The hierarchy so far has been a ladder of bound systems: stars into star clusters, star clusters into galaxies, galaxies into groups, groups into clusters. Each rung is a genuine object — a region that decoupled from cosmic expansion, stopped growing, collapsed, and settled into equilibrium. The Groups & Clusters chapter used exactly that fact, applying the virial theorem to weigh a cluster.

**The ladder stops at clusters**, and this chapter is about what lies beyond the stopping point.

## The binding criterion

The question of whether a structure is an object has a clean quantitative answer, and it is worth doing because the numbers settle a matter that is otherwise argued verbally.

A shell of matter at radius $R$ around mass $M$ feels gravity pulling inward and, in a universe dominated by a cosmological constant, an effective repulsion pushing outward that grows with radius. The shell is bound — will eventually turn around and collapse rather than expanding forever — if gravity wins:

$$\frac{GM}{R^2} > \Omega_\Lambda H_0^2 R \qquad\Longrightarrow\qquad M > \frac{\Omega_\Lambda H_0^2 R^3}{G}$$

With $H_0 = 67.4$ km/s/Mpc and $\Omega_\Lambda = 0.685$, this critical mass evaluates as:

| Structure | Radius | Critical mass | Actual mass | Bound? |
| --- | --- | --- | --- | --- |
| Local Group | 1 Mpc | $7.2\times10^{11}\,M_\odot$ | $\sim3\times10^{12}$ | **Yes** |
| Virgo cluster region | 15 Mpc | $2.4\times10^{15}\,M_\odot$ | $\sim1.2\times10^{15}$ | **No** |
| Laniakea | 80 Mpc | $3.7\times10^{17}\,M_\odot$ | $\sim10^{17}$ | **No** |

The Local Group clears the threshold by a factor of four. Laniakea falls short by a factor of nearly four. **The transition from bound object to unbound pattern happens between the group scale and the supercluster scale**, and the calculation locates it without any appeal to intuition about what deserves to be called a structure.

Notice what the criterion implies about the *future*, which the closing section takes up: because $\Omega_\Lambda H_0^2R^3$ grows while the mass within a comoving region does not, a structure that has not already turned around never will. **The set of bound objects is closed.**

```checkpoint
q: Galaxy clusters are bound objects but superclusters are not. The decisive difference is that
a: superclusters contain less dark matter per galaxy, so their gravity is weaker
x: Dark-to-baryonic ratios are broadly similar across scales; the difference is the amount of mass relative to the volume it must bind, not its composition.
a*: the mass needed to overcome dark energy's repulsion grows as R³, and superclusters fall below that threshold while clusters exceed it — Laniakea has ~10¹⁷ M☉ where ~3.7 × 10¹⁷ would be required at 80 Mpc
a: superclusters are too young to have collapsed but will do so given enough time
x: The opposite: because the critical mass grows with cosmic time under dark energy while the enclosed mass does not, a structure that has not turned around by now never will.
a: superclusters are defined by galaxy counts rather than by dynamics, so boundedness does not apply to them
x: Laniakea is in fact defined dynamically, by a velocity-flow watershed — and the boundedness question applies regardless of how the boundary was drawn.
hint: Compare the gravitational attraction of a mass with the outward push of a cosmological constant, and note how each scales with radius.
why: Gravity from an enclosed mass falls as GM/R² while the effective repulsion from a cosmological constant grows as Ω_Λ H₀²R, so binding requires M > Ω_Λ H₀²R³/G. Evaluating: 7.2 × 10¹¹ M☉ at 1 Mpc, which the Local Group's ~3 × 10¹² clears fourfold; 3.7 × 10¹⁷ M☉ at 80 Mpc, which Laniakea's ~10¹⁷ misses by nearly the same factor. The boundary between object and pattern therefore lies between the group and supercluster scales, fixed by arithmetic rather than by taste. And since the threshold rises with time while the enclosed mass does not, the set of bound structures is now closed.
```

## Seeing something that is not there

A supercluster is a **mild** overdensity — a factor of a few above the mean, spread over tens of megaparsecs. It cannot be seen as a lump the way a cluster can, because there is no dense core, no hot gas at $10^8$ K, no sharp boundary. Galaxy counts alone show a gentle excess that depends on how the counting is done.

What a supercluster *does* do is perturb the expansion. Its gravity pulls nearby galaxies toward it, so their observed recession is slightly slower than the pure Hubble flow on the near side and slightly faster on the far side. Those departures are **peculiar velocities**, and they are the only direct evidence of the mass.

Measuring them is genuinely difficult, and the difficulty shapes the entire field.

A galaxy's observed redshift combines the cosmological expansion with its peculiar motion:

$$cz_{\rm obs} \approx H_0 d + v_{\rm pec}$$

To extract $v_{\rm pec}$ one must know $d$ **independently of redshift** — from the Tully–Fisher relation, the fundamental plane, surface-brightness fluctuations, or Type Ia supernovae. And here is the problem: those distance indicators are good to perhaps **10–20 per cent**. At 100 Mpc, a 15 per cent distance error corresponds to an error in $H_0 d$ of about **1,000 km/s**, while the peculiar velocities being sought are a few hundred.

**The noise exceeds the signal for any individual galaxy.** Peculiar velocity work is therefore inescapably statistical, extracting a coherent flow pattern from a large sample in which every single measurement is dominated by error.

Worse, the errors are not merely large but **biased**. Because there are more galaxies at larger distances (volume grows as $d^3$) and distance errors are roughly symmetric in magnitude, more galaxies scatter inward from the crowded far side than outward from the sparse near side — so a naive analysis systematically misplaces galaxies and infers spurious flows. This is **Malmquist bias** in its homogeneous form, and correcting it requires modelling the underlying density field, which is part of what one is trying to measure.

That circularity is characteristic of the subject. **The measurement's systematic depends on the answer**, so the analysis must be iterative and its uncertainties are dominated by the modelling rather than by the observations — the same situation the Lyman-alpha forest presented in the previous chapter, arrived at from a completely different direction.

```checkpoint
q: Peculiar velocity measurements require redshift-independent distances, and typical distance indicators are accurate to 10–20%. At 100 Mpc, what does this imply?
a: That peculiar velocities cannot be measured at all beyond about 20 Mpc
x: They are measured to hundreds of megaparsecs — statistically, from large samples, which is precisely the adaptation the problem forces.
a*: That the distance error alone contributes ~1,000 km/s to the inferred peculiar velocity, exceeding the few-hundred km/s signal — so individual measurements are noise-dominated and only coherent flows from large samples are recoverable
a: That redshifts must be measured more precisely, since they are the limiting factor
x: Redshifts are measured to a few km/s from spectra and contribute negligibly; the entire error budget is in the distance.
a: That peculiar velocities at 100 Mpc are intrinsically larger, around 1,000 km/s
x: Peculiar velocities are typically a few hundred km/s regardless of distance; what grows with distance is the velocity error produced by a fixed fractional distance error.
hint: v_pec is the residual after subtracting H₀d. How big is the error in H₀d?
why: Since cz_obs ≈ H₀d + v_pec, extracting v_pec means subtracting a large number from a large number. At 100 Mpc, H₀d ≈ 6,700 km/s, so a 15 per cent distance error injects ~1,000 km/s into the residual — several times the signal. Individual galaxies therefore carry no usable peculiar velocity, and the field works statistically, recovering coherent flow patterns from samples in which every measurement is noise-dominated. The errors are also biased: with more galaxies at larger distances, symmetric distance errors scatter more objects inward than outward, producing spurious flows unless corrected using the density field one is trying to measure. The systematic depends on the answer, so the analysis is iterative and modelling-limited.
---
q: Malmquist bias makes peculiar velocity surveys infer spurious outflows even when distance errors are perfectly symmetric. The mechanism is that
a: brighter galaxies are easier to detect, so the sample is biased toward intrinsically luminous objects
x: That is the related selection form of the bias and is also real, but the effect described here arises from the volume distribution and operates even in a complete, luminosity-unbiased sample.
a*: galaxies are distributed through volume growing as d³, so symmetric distance errors scatter more objects inward from the crowded far side than outward from the sparse near side — placing them too close and inflating their inferred peculiar velocities
a: distance indicators systematically underestimate distances to more distant galaxies
x: The indicators are not distance-dependent in that way; the bias emerges from how galaxies are distributed in space, not from a flaw that grows with distance.
a: peculiar velocities genuinely are outward, since the universe is expanding
x: Expansion is already removed as H₀d; peculiar velocities are the residual and have no systematic outward preference in reality.
hint: Symmetric errors move galaxies both ways. Are there equal numbers available to move each way?
why: Even with a perfectly symmetric distance error distribution, the *number* of galaxies available to scatter is not symmetric: volume grows as d³, so far more sit just beyond a given distance than just inside it. More therefore scatter inward than outward, and the sample's inferred distances are on average too small, making H₀d too small and the residual v_pec spuriously positive — an apparent outflow. Correcting it requires knowing how galaxy density varies with distance, which is the density field the survey exists to measure, so the analysis must iterate and its uncertainty is dominated by the assumed model rather than by the data. The systematic depends on the answer.
```

## The dipole, and what is pulling us

There is one peculiar velocity known to high precision, and it is our own.

The cosmic microwave background is almost perfectly isotropic, but it carries a **dipole** — about 3.36 mK, one part in a thousand, hotter in one direction and cooler in the opposite. The interpretation is straightforward: we are moving. Motion at velocity $v$ produces a Doppler pattern of amplitude $\Delta T/T = v/c$, and the observed value gives

$$v = \frac{3.36\times10^{-3}}{2.725}\times c \approx \mathbf{370\ km/s}$$

for the Solar System. Removing the Sun's orbit around the Galaxy and the Galaxy's motion within the Local Group leaves the **Local Group moving at 627 ± 22 km/s** toward galactic coordinates $l = 276°$, $b = 30°$ — in the direction of Hydra–Centaurus.

This is an extraordinarily clean measurement of a peculiar velocity, and it poses an immediate question: **what is pulling us at 600 km/s?**

The candidate is the **Great Attractor**, a mass concentration in the Hydra–Centaurus direction — which is unfortunately located behind the plane of the Milky Way, in the **Zone of Avoidance** where our own galaxy's dust and stars obscure everything behind. Studying the thing that dominates our motion means observing through the worst possible foreground, which is why the region has been mapped chiefly in the infrared and in the 21 cm line, both of which penetrate dust.

The deeper question is **convergence**. If we sum the gravitational pull of all the mass we can map, do we recover the observed 627 km/s, and at what distance does the sum stop growing? If it converges by 50 Mpc, the Great Attractor explains our motion. If contributions keep accruing out to 150 Mpc and beyond, then more distant structures — the **Shapley Supercluster** at about 200 Mpc, the largest concentration in the local universe — are also pulling.

The current picture is that **less than half** the dipole is generated within the volume enclosing Hydra–Centaurus–Norma at around 60 Mpc, so more distant mass contributes substantially. The Great Attractor is not the whole answer; it is the nearest term in a series.

This matters beyond local curiosity, because whether the dipole converges is a test of the standard cosmology. **Structure formation predicts how much bulk flow should exist on a given scale**, and a flow that failed to converge — persisting coherently to very large distances — would conflict with it. Claims of such "dark flows" have been made and have not survived scrutiny, but the test remains among the sharper available ones on the largest scales.

```checkpoint
q: The CMB dipole is by far the best-measured peculiar velocity, giving the Local Group 627 km/s toward Hydra–Centaurus. Why is it so much more precise than any galaxy's peculiar velocity?
a: Because the CMB is much closer to us than any galaxy, reducing distance uncertainty
x: The CMB originates at the surface of last scattering, far beyond every galaxy. Its usefulness has nothing to do with proximity.
a*: Because it requires no distance at all — the dipole amplitude gives v/c directly, so the measurement bypasses the distance indicator that dominates every other peculiar velocity error
a: Because the CMB temperature is known to higher precision than galaxy redshifts
x: Galaxy redshifts are already measured to a few km/s and are not the limiting factor; the limitation elsewhere is the distance, which the dipole does not need.
a: Because the dipole averages over the whole sky, cancelling random errors
x: All-sky coverage helps separate the dipole from other multipoles, but the fundamental advantage is that no distance enters the inference.
hint: What quantity must be known to convert a redshift into a peculiar velocity, and does the dipole need it?
why: Every galaxy-based peculiar velocity is a residual, cz_obs − H₀d, so it inherits the distance indicator's 10–20 per cent error — about 1,000 km/s at 100 Mpc. The CMB dipole is not a residual: our motion Doppler-shifts the whole microwave sky by ΔT/T = v/c, so the amplitude *is* the velocity, with no distance required. That gives 370 km/s for the Solar System and, after removing galactic and Local Group motions, 627 ± 22 km/s for the Local Group. The remaining question is what produces it — and since less than half the dipole is generated within ~60 Mpc, the Great Attractor is the nearest term rather than the whole answer.
```

{{image: Laniakea Supercluster | The Laniakea Supercluster, defined not by counting galaxies but by mapping where the local velocity field flows. Within the drawn boundary, peculiar motions converge toward a common basin of attraction; outside it, they flow elsewhere. The definition is a watershed, which makes the boundary precise — and also makes clear that what is being bounded is a pattern in a flow rather than a bound object.}}

## Laniakea: defining a structure by its flow

The definitional problem for superclusters is real. Galaxy counts give no natural boundary, since the overdensity falls off gradually and any contour is a choice. Tully and collaborators proposed a better approach in 2014, and it is worth appreciating as a piece of method.

**Define a supercluster as a basin of attraction.** Map the peculiar velocity field over a large volume. At each point, ask which way the flow is heading. Regions whose flow lines converge on a common attractor belong to the same structure; the boundary lies where flow lines diverge — a **watershed**, exactly as a river basin is bounded by the ridge beyond which water runs to a different sea.

Applied to the local universe, this defines **Laniakea**: about 160 Mpc across, some $10^{17}\,M_\odot$, containing roughly 100,000 galaxies including the Milky Way, the Local Group, the Virgo cluster, and the Great Attractor region toward which everything within it is flowing.

Three things recommend this definition.

**It is dynamical rather than descriptive.** The boundary is set by how matter is moving, not by where someone drew a contour on a galaxy count. Two analysts with the same velocity data get the same boundary.

**It reflects a real physical relationship.** Everything within Laniakea shares a common gravitational destiny in the sense of being pulled the same way, which is a genuine fact about the system even though it is not a bound object.

**It is honest about what it is defining.** A watershed is explicitly a feature of a *flow*, not a boundary of a *thing*. The definition does not smuggle in objecthood.

That third point is the important one. Laniakea's boundary is not a wall, nothing is enclosed, and — as the binding criterion showed — the structure will disperse. What has been defined is the region currently flowing toward a common attractor, and since the flow pattern itself evolves, **the boundary is a snapshot**. Laniakea is not a thing that will persist; it is the present shape of a motion.

```checkpoint
q: Laniakea is defined as the region within which galaxy velocity flows converge on a common attractor. What is the main advantage of defining a supercluster this way rather than by galaxy overdensity?
a: It produces a larger structure, capturing more galaxies than density contours would
x: Size is not the point, and the resulting boundary may be larger or smaller than a chosen density contour. The advantage concerns objectivity, not extent.
a*: The boundary is fixed by the dynamics rather than by an arbitrary density threshold, so two analysts with the same velocity data obtain the same boundary — and it makes explicit that what is bounded is a flow pattern
a: It identifies which galaxies are gravitationally bound to the structure
x: It does not — Laniakea is unbound, as the mass criterion shows. Sharing a flow direction is not the same as being bound together.
a: It removes the need for redshift-independent distances, since only velocities are used
x: Peculiar velocities are exactly what require redshift-independent distances; the method depends on them heavily and inherits their difficulties.
hint: What has to be chosen arbitrarily in a density-threshold definition, and does the watershed method require that choice?
why: A density-contour definition requires picking a threshold, and superclusters have no natural edge — the overdensity falls off gradually, so any contour is a decision, and lowering it eventually merges everything into one structure. A watershed needs no threshold: the boundary sits where flow lines diverge, which is determined by the velocity field itself. That makes it reproducible and physically meaningful, since everything inside is being pulled the same way. Crucially it is also honest — a watershed is a feature of a flow, not the wall of a container. Nothing is enclosed, the structure is unbound and will disperse, and because the flow pattern evolves the boundary is a snapshot rather than a permanent feature.
```

## Great walls, and why "largest structure" is a slippery claim

The named large structures form a catalogue that should be read with care.

The **Local (Virgo) Supercluster**, about 33 Mpc across, centred on the Virgo cluster, is the structure our Local Group belongs to — and is now understood as one lobe of Laniakea rather than a separate entity.

The **Shapley Supercluster**, at roughly 200 Mpc, is the most massive concentration in the nearby universe and a significant contributor to our motion.

The **CfA2 Great Wall**, found by Geller and Huchra in 1989, was the first structure recognised to be enormous — a sheet of galaxies stretching over 200 Mpc — and its discovery was a genuine surprise, since prevailing expectations had structure becoming smooth on much smaller scales.

The **Sloan Great Wall**, roughly 1.4 billion light-years long, is routinely described as the largest known structure.

That last description needs qualifying, and the qualification is methodologically substantial.

**Structure identification depends on a threshold, and thresholds percolate.** To identify a structure one must decide how overdense a region has to be to count, and typically link neighbouring galaxies within some separation. Raise the density threshold and large structures fragment into many small ones. Lower it and structures merge — and below a critical threshold, the whole survey volume connects into a single object, because the cosmic web is *connected*. This is **percolation**, and it means the answer to "what is the largest structure?" is a function of the threshold, not a fact about the universe.

So claims about record-breaking structures should be read as claims about a particular algorithm applied at a particular threshold to a particular survey. Different reasonable choices give different answers, and structures identified this way frequently have no dynamical coherence at all — the Sloan Great Wall is not bound, is not collapsing as a unit, and its parts will never assemble.

There is a further and subtler trap. Even in a perfectly uniform random field, the **largest** apparent structure grows as the survey volume grows, simply because extreme fluctuations become more likely in larger samples. Judging whether a found structure is anomalous therefore requires comparing against the distribution of largest structures in random realisations of the *same survey geometry* — and several published "too large for cosmology" claims have not survived that comparison.

**The general caution: any superlative about the largest observed X requires a null distribution for the largest X you would expect to observe by chance.** Without it, the superlative describes the search rather than the universe.

```checkpoint
q: The Sloan Great Wall is often called the largest known structure. Why should this claim be treated cautiously?
a: Because its distance is poorly determined, so its physical size is uncertain
x: Redshifts across the wall are well measured and its extent is reliably determined; the difficulty is conceptual rather than metric.
a*: Because identifying a structure requires choosing a density or linking threshold, and lowering it merges structures until the whole survey percolates into one — so "largest structure" is a function of the algorithm rather than a fact about the universe
a: Because it may be a chance alignment of unrelated galaxies at different distances
x: Its members are genuinely at similar redshifts and form a real overdensity; the issue is whether calling that overdensity a single structure is meaningful, not whether it exists.
a: Because larger structures have since been found, superseding the claim
x: Later claims exist but face exactly the same methodological problem, so they do not settle the matter either.
hint: Ask what decision has to be made before any structure can be identified at all, and what happens as you vary it.
why: Structure finding requires a threshold — how overdense a region must be, or how close galaxies must lie to be linked. Raising it fragments large structures; lowering it merges them, until below a critical value the entire survey connects into one object, because the cosmic web genuinely is connected. That is percolation, and it makes "largest structure" a property of the chosen threshold. There is a second trap: even in a uniform random field the largest apparent structure grows with survey volume, since extremes become likelier in bigger samples — so judging whether a structure is anomalous requires a null distribution from random realisations of the same survey geometry. Several "too large for cosmology" claims have failed that test.
---
q: A survey reports a structure larger than the standard cosmological model is said to allow. Before accepting the claim, what is the single most important check?
a: Whether the structure's galaxies are gravitationally bound to one another
x: Almost no structure at this scale is bound, including uncontroversial ones — so requiring boundedness would reject the entire category rather than test this claim.
a*: Whether structures that large arise in random realisations with the same survey geometry, selection function and sample size — since the largest apparent structure grows with search volume even in a uniform field
a: Whether the redshifts have been corrected for peculiar velocities
x: Peculiar velocities distort radial positions by a few hundred km/s, small compared with structures spanning hundreds of megaparsecs, so this is a minor correction rather than the decisive check.
a: Whether the structure has been confirmed by a second telescope
x: Independent confirmation guards against instrumental error, but the problem here is statistical and would reproduce identically in any survey with the same geometry.
hint: "Largest found" is a statistic of a search. What does that statistic do as the search gets bigger?
why: The maximum of a sample grows with sample size, so in any survey the largest apparent structure is larger than in a smaller one even when the underlying field is uniform. Comparing an observed maximum against a theoretical expectation computed for a different volume, or against intuition, therefore tests nothing. The valid comparison is with the distribution of largest structures recovered by running the *same* identification algorithm at the *same* threshold on random realisations matching the survey's geometry, selection and size. Several published "too large for the standard model" claims have not survived that test — and the general rule follows: any superlative about the largest observed X needs a null distribution for the largest X expected by chance, or it describes the search rather than the universe.
```

{{image: Virgo Supercluster | The Local or Virgo Supercluster, about 33 Mpc across and centred on the Virgo cluster — the structure our Local Group sits in, and now understood as one lobe of the larger Laniakea flow rather than a separate entity. Its reclassification illustrates the chapter's difficulty: at this scale, what counts as one structure depends on where the boundary is drawn and on what the drawing is meant to capture.}}

## Voids

The complement of the filaments and walls is mostly empty, and the emptiness is not a mere absence.

**Voids** occupy the majority of cosmic volume — regions tens of megaparsecs across containing far fewer galaxies than average. The **Boötes void**, about 100 Mpc across, is the classic example.

Three points make voids scientifically valuable rather than merely leftover.

**They expand faster than average.** An underdense region has less gravity resisting expansion, so it grows relative to its surroundings — matter effectively flows out of voids into the surrounding walls, which is why voids become emptier and walls sharper as time passes. The cosmic web gets more contrasty.

**They are the cleanest cosmological laboratory.** Overdense regions collapse and become strongly non-linear, so relating their present state to the initial conditions requires modelling complicated gravitational and baryonic physics. Voids stay close to linear, so their statistics — abundance, size distribution, shapes — connect far more directly to the primordial fluctuations and to the expansion history. **The place where least has happened is the place where the initial conditions are best preserved**, which inverts the usual instinct to study the most dramatic regions.

**Void galaxies are different.** Galaxies in voids are on average bluer, more gas-rich, later-type and lower-mass than galaxies elsewhere — the morphology–density relation of the Galaxy Types chapter extended to its low-density extreme, and a useful control sample for isolating which galaxy properties are environmental.

```checkpoint
q: Voids are argued to be a cleaner cosmological probe than clusters, despite containing far less mass. The reason is that
a: voids are closer to us on average, so they are measured more precisely
x: Voids and clusters are found throughout the surveyed volume at comparable distances; proximity is not the distinction.
a*: voids never collapse, so they stay close to linear — their statistics connect far more directly to the primordial fluctuations than a cluster's, whose present state is filtered through non-linear collapse and baryonic physics
a: voids contain no baryons, so gas physics can be ignored entirely
x: Voids contain gas and galaxies, just at low density; the advantage is that the dynamics stay near-linear, not that baryons are absent.
a: void boundaries are sharper than cluster boundaries, making them easier to identify
x: Void boundaries are gradual and their identification is itself threshold-dependent, exactly as for structures — this is a difficulty rather than an advantage.
hint: To connect an observation to initial conditions, what has to be undone? Which regions require the least undoing?
why: Relating a present-day structure to the primordial density field means inverting everything that happened in between. A cluster has undergone shell crossing, virialisation, shock heating, star formation and feedback, so the inversion requires modelling processes that are themselves uncertain. A void has essentially only expanded — its evolution stays in the near-linear regime where the mapping back to initial conditions is analytic and robust. Its abundance, size distribution and shapes therefore constrain the primordial fluctuations and the expansion history with far less theoretical baggage. The instinct to study the most dramatic regions is exactly wrong here: the place where least has happened is the place where the initial conditions are best preserved.
---
q: Voids become emptier over time while walls and filaments become sharper. What drives this?
a: Dark energy acts preferentially inside voids, accelerating their expansion
x: Dark energy is uniform — it does not concentrate in underdense regions. The differential growth is gravitational and operates regardless of dark energy.
a*: An underdense region has less gravity resisting expansion than average, so it expands faster than the background — matter effectively drains from voids into the surrounding structures, increasing the contrast
a: Galaxies in voids are destroyed by the lower density, reducing their number over time
x: Low density does not destroy galaxies; void galaxies survive and in fact remain gas-rich and star-forming longer than galaxies elsewhere.
a: Voids are swept clean by shock waves propagating from cluster formation
x: Shocks form where matter converges, at filaments and cluster accretion boundaries, and do not clear voids; the emptying is a gravitational flow rather than a sweeping.
hint: Gravity decelerates expansion in proportion to the mass present. What happens where there is less mass than average?
why: Expansion is decelerated by the gravity of the matter within a region, so a region with less matter than average decelerates less and therefore expands faster relative to the mean. In comoving terms, matter flows outward from voids into the surrounding walls and filaments — the void grows emptier, the walls grow denser, and the contrast of the cosmic web increases with time. This is the same gravitational instability that builds structure, seen from the underdense side: overdensities grow by accreting, underdensities grow by draining. The two are the same process viewed from opposite signs of the perturbation.
```

## The end of structure formation

The chapter closes with the consequence of the binding criterion, which is more striking than it first appears.

In a matter-dominated universe, structure formation continues indefinitely: ever larger regions turn around and collapse, so superclusters would eventually become bound objects and the hierarchy would keep building.

**Dark energy stops this.** Once $\Lambda$ dominates the expansion — which happened at $z \approx 0.3$, a few billion years ago — the expansion accelerates and the growth of structure is progressively frozen. The critical mass $\Omega_\Lambda H_0^2R^3/G$ that a region must exceed to be bound rises with time, while the mass within any comoving region does not. **A structure that has not turned around by now never will.**

The consequences are concrete.

**The Local Group is bound and will survive.** Its members will merge into a single galaxy over the next tens of billions of years, as the Dwarfs chapter discussed.

**The Virgo cluster will not capture us.** The Local Group is falling toward Virgo at a couple of hundred km/s, but the infall will not complete: accelerating expansion will win, and Virgo will recede.

**Laniakea will disperse.** Its parts are already unbound, and the flow that defines it will progressively be overwhelmed by expansion. The supercluster we belong to is a temporary pattern.

So there is a **largest object that will ever exist**, and it is roughly the scale of a rich galaxy cluster — the largest thing that managed to turn around before dark energy took over. We are living close to the moment when the cosmic hierarchy stopped growing.

Far into the future, an observer in the merged remnant of the Local Group would see a single galaxy surrounded by an empty, accelerating sky, with all other structures having receded beyond the horizon. **The cosmic web is a feature of this era**, not a permanent aspect of the universe — and had observers arisen much later, the evidence from which cosmology was reconstructed would not have been available to them.

```checkpoint
q: Under dark energy, a structure that has not turned around by now never will. Why does this follow?
a: Because dark energy removes mass from structures over time, weakening their gravity
x: Dark energy does not remove mass; the matter content of a comoving region is unchanged. What changes is the outward push it must overcome.
a*: Because the critical mass for binding, Ω_Λ H₀²R³/G, grows as the expansion accelerates while the mass within a comoving region stays fixed — so a region failing the test now fails it more decisively later
a: Because all structures have already collapsed, leaving nothing left to turn around
x: Most of the mass in the universe is in unbound structures — filaments, walls, superclusters — that have not collapsed and now never will.
a: Because the universe will end before further collapse can occur
x: The universe has no anticipated end on these timescales; it simply expands ever faster, which is what freezes structure growth.
hint: The criterion compares a fixed mass with a threshold. Which side of the comparison changes with time?
why: Binding requires M > Ω_Λ H₀²R³/G. The enclosed mass of a comoving region is essentially fixed, while accelerating expansion drives the threshold up, so any region currently failing the criterion moves further from satisfying it. The set of bound objects is therefore closed, and its largest members are rich clusters — the biggest things that turned around before dark energy took over around z ≈ 0.3. Concretely: the Local Group survives and merges, the Local Group's infall toward Virgo never completes, and Laniakea disperses. The cosmic web is a feature of this cosmic era rather than a permanent structure, and observers arising much later would lack the evidence from which our cosmology was built.
```

## Pulling the thread

- A supercluster is **not an object**. The criterion $M > \Omega_\Lambda H_0^2R^3/G$ gives $7.2\times10^{11}\,M_\odot$ at 1 Mpc — cleared fourfold by the Local Group — and $3.7\times10^{17}\,M_\odot$ at 80 Mpc, which **Laniakea's $10^{17}$ misses by nearly four**. The bound/unbound transition sits between the group and supercluster scales.
- Superclusters are mild overdensities detectable only through **peculiar velocities**, and at 100 Mpc a 15% distance error injects **~1,000 km/s** into a few-hundred km/s signal. The work is irreducibly statistical, and **Malmquist bias** makes the systematic depend on the answer.
- The **CMB dipole** is the exception: no distance is needed, since $\Delta T/T = v/c$ gives **370 km/s** for the Sun and **627 ± 22 km/s** for the Local Group toward Hydra–Centaurus. **Less than half** originates within ~60 Mpc, so the **Great Attractor is the nearest term, not the answer**.
- **Laniakea** is defined as a **watershed** in the velocity field — 160 Mpc, $10^{17}\,M_\odot$, ~100,000 galaxies. The definition is reproducible, dynamical, and **honest that it bounds a flow rather than a thing**.
- **"Largest structure" is threshold-dependent**: raise the threshold and structures fragment, lower it and the survey **percolates** into one object. And the largest apparent structure grows with survey volume even in a random field, so any superlative needs a **null distribution from the same survey geometry**.
- **Voids** expand faster, stay closer to **linear** — so the region where least has happened preserves the initial conditions best — and host systematically bluer, gas-richer galaxies.
- **Dark energy closed the set of bound objects.** The largest thing that will ever exist is about a rich cluster; Virgo will never capture us; **Laniakea will disperse**. The cosmic web is a feature of this era.

The transferable idea: **when a category stops applying, the definitional trouble is the finding.** Superclusters are difficult to define because they are genuinely not objects, and the succession of attempted definitions — density contours, linking lengths, velocity watersheds — is a record of a field discovering that it was reaching for a kind of thing that does not exist at that scale. The productive response was not to argue about which definition is correct but to ask what each one is *for*: a watershed answers "what is flowing together now," a linking length answers "what is connected at this contrast," and neither answers "what is a thing," because nothing does. **A definition that resists being pinned down is usually reporting something about its subject rather than about the people arguing over it**, and the useful move is to replace the question "what is the right definition?" with "what question is each candidate definition the right answer to?"

## Further reading

{{book: Peter Coles | Cosmology: The Origin and Evolution of Cosmic Structure | 2002}}

{{book: R. Brent Tully | Nearby Galaxies Atlas | 1987}}

{{book: Michael Rowan-Robinson | The Cosmological Distance Ladder | 1985}}

Beyond the books: Geller and Huchra's 1989 Great Wall paper is worth reading for the moment a field discovered that structure kept going past the scale it expected; the figure is more eloquent than the text. Tully and collaborators' 2014 Laniakea paper is a good example of a definitional advance being a scientific one. And the literature on Malmquist bias in peculiar velocity surveys is unusually instructive about what to do when a measurement's systematic depends on the quantity being measured.

## Problems

*Useful numbers: binding criterion M > Ω_Λ H₀²R³/G; H₀ = 67.4 km/s/Mpc = 2.184 × 10⁻¹⁸ s⁻¹; Ω_Λ = 0.685; G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 Mpc = 3.086 × 10²² m; CMB dipole 3.36 mK on T = 2.725 K; ΔT/T = v/c; cz_obs ≈ H₀d + v_pec; Laniakea ~160 Mpc across, ~10¹⁷ M☉.*

**1.** *(Bound or not.)* **(a)** Derive the binding criterion by balancing gravity against the cosmological constant's repulsion. **(b)** Evaluate the critical mass at R = 1 Mpc and R = 80 Mpc. **(c)** Compare with the Local Group (~3 × 10¹² M☉) and Laniakea (~10¹⁷ M☉) and state the conclusion.

**2.** *(Why the ladder stops.)* **(a)** State what makes each rung below clusters a genuine object. **(b)** Explain why the virial theorem may be applied to a cluster but not to a supercluster. **(c)** State where the transition occurs and why it is not a matter of convention.

**3.** *(The signal-to-noise problem.)* At d = 100 Mpc: **(a)** compute H₀d. **(b)** Compute the velocity error from a 15% distance error. **(c)** Compare with typical peculiar velocities and state what follows for how the field must operate.

**4.** *(A bias that depends on the answer.)* **(a)** Explain the origin of Malmquist bias in peculiar velocity surveys. **(b)** Explain why correcting it is circular. **(c)** Name one other place in this tree where a measurement's systematic depends on the quantity being measured.

**5.** *(The dipole.)* **(a)** Compute the Solar System's velocity from the 3.36 mK dipole. **(b)** State the Local Group's velocity and direction. **(c)** Explain why this measurement is far more precise than any galaxy's peculiar velocity, and what remains unresolved about its origin.

**6.** *(Watersheds.)* **(a)** State the Laniakea definition. **(b)** Give two advantages over a density-threshold definition. **(c)** State what the definition explicitly does *not* claim, and why that honesty matters.

**7.** *(Percolation.)* **(a)** Explain how varying a linking threshold changes the inventory of structures. **(b)** Explain the additional bias that arises from survey volume even in a uniform random field. **(c)** State what a claim of a record-breaking structure must include to be meaningful.

**8.** *(Voids.)* **(a)** Explain why voids expand faster than average. **(b)** Explain why they are a cleaner cosmological probe than clusters. **(c)** State one property of void galaxies and connect it to an earlier chapter.

**9.** *(The closed set.)* **(a)** Explain why dark energy freezes structure formation, referring to both sides of the binding criterion. **(b)** State the fate of the Local Group, of our infall toward Virgo, and of Laniakea. **(c)** State what this implies about the cosmic web's permanence and about observers in the far future.

## Worked answers

**1.** **(a)** A test mass on a shell of radius $R$ enclosing mass $M$ experiences inward gravitational acceleration $GM/R^2$ and, in a $\Lambda$-dominated universe, an outward acceleration $\tfrac{1}{3}\Lambda c^2R = \Omega_\Lambda H_0^2 R$. The shell decelerates and eventually turns around only if gravity exceeds repulsion: $GM/R^2 > \Omega_\Lambda H_0^2R$, i.e. $M > \Omega_\Lambda H_0^2R^3/G$. **(b)** At $R = 1$ Mpc $= 3.086\times10^{22}$ m: $M_{\rm crit} = 0.685(2.184\times10^{-18})^2(2.94\times10^{67})/6.674\times10^{-11} = 1.44\times10^{42}$ kg $= \mathbf{7.2\times10^{11}\,M_\odot}$. At $R = 80$ Mpc, the mass scales as $R^3$, so $\times 80^3 = 5.12\times10^5$: $\mathbf{3.7\times10^{17}\,M_\odot}$. **(c)** The Local Group's $\sim3\times10^{12}\,M_\odot$ exceeds $7.2\times10^{11}$ by about **four**, so it is **bound**. Laniakea's $\sim10^{17}\,M_\odot$ falls short of $3.7\times10^{17}$ by nearly the same factor, so it is **not bound** and will disperse. The bound/unbound boundary therefore lies between the group and supercluster scales, fixed by arithmetic rather than by taste.

**2.** **(a)** Each has **decoupled from cosmic expansion, turned around, collapsed, and relaxed into equilibrium** — so it has a definite membership, a definite size that is no longer growing with the universe, and internal motions set by its own gravity rather than by the expansion. **(b)** The virial theorem, $2\langle T\rangle + \langle U\rangle = 0$, holds only for a **relaxed, bound** system: the members must have completed many crossings so that their kinetic and potential energies have reached the equilibrium relation. A cluster, with a crossing time of ~1 Gyr, satisfies this. A supercluster is expanding, has never turned around, and has a crossing time exceeding the age of the universe, so its galaxies' velocities reflect the Hubble flow plus perturbations rather than virial equilibrium — applying the theorem would yield a meaningless number. **(c)** Between the **group and supercluster scales**, at the radius where the enclosed mass falls below $\Omega_\Lambda H_0^2R^3/G$. It is not conventional because the criterion is a physical statement about whether the region will ever collapse, with a definite yes-or-no answer for any given mass and radius, independent of what anyone chooses to call a structure.

**3.** **(a)** $H_0d = 67.4 \times 100 = \mathbf{6{,}740\ km/s}$. **(b)** A 15 per cent distance error gives $0.15 \times 6{,}740 = \mathbf{1{,}010\ km/s}$ of error in the inferred $H_0d$, and hence in the residual $v_{\rm pec} = cz_{\rm obs} - H_0d$. **(c)** Typical peculiar velocities are a **few hundred km/s**, so the error exceeds the signal by a factor of several. No individual galaxy at this distance yields a usable peculiar velocity. The field must therefore work **statistically**: measure many galaxies and extract the **coherent** component of the flow, which adds constructively across the sample while the distance errors, being uncorrelated between galaxies, average down. This is why peculiar-velocity results are always statements about flow fields rather than about individual objects, and why sample size and sky coverage matter more than the precision of any one distance.

**4.** **(a)** Galaxies are distributed through volume, which grows as $d^3$, so there are far more galaxies just beyond a given distance than just inside it. Distance errors are roughly symmetric in magnitude, so **more galaxies scatter inward from the crowded far side than outward from the sparse near side**. The result is that objects are on average placed too close, their inferred $H_0d$ is too small, and their inferred peculiar velocities are systematically too positive — a spurious outflow. **(b)** Because the size of the bias depends on **how galaxy density varies with distance** — the very density field the survey is trying to measure. One cannot correct the data without a model of the underlying distribution, and one cannot obtain that distribution without corrected data. The analysis must therefore iterate, and its uncertainty is dominated by the assumed density model rather than by the measurements. **(c)** The **Lyman-alpha forest** as a cosmological probe: converting absorption statistics into the matter power spectrum requires modelling the ionising background, gas temperature and feedback, so the quoted uncertainties on neutrino mass and warm dark matter constraints are dominated by that modelling. **Cluster mass calibration** is another: the hydrostatic bias must be estimated from simulations whose feedback prescriptions are themselves calibrated on cluster observations.

**5.** **(a)** $v = c\,\Delta T/T = (2.998\times10^5)(3.36\times10^{-3}/2.725) = 2.998\times10^5 \times 1.233\times10^{-3} = \mathbf{370\ km/s}$. **(b)** After removing the Sun's orbital motion in the Galaxy and the Galaxy's motion within the Local Group, the Local Group moves at $\mathbf{627 \pm 22}$ km/s toward galactic coordinates $l = 276°$, $b = 30°$ — the Hydra–Centaurus direction. **(c)** Because it **requires no distance**. Every galaxy-based peculiar velocity is the residual $cz_{\rm obs} - H_0d$ and inherits the distance indicator's 10–20 per cent error, worth ~1,000 km/s at 100 Mpc. The dipole is not a residual: our motion Doppler-shifts the entire microwave sky by $\Delta T/T = v/c$, so the measured amplitude *is* the velocity. What remains unresolved is **what produces it**: less than half the dipole is generated within the ~60 Mpc volume containing Hydra–Centaurus–Norma, so the **Great Attractor is the nearest contributor rather than the whole cause**, with more distant mass — the Shapley Supercluster at ~200 Mpc among it — contributing substantially. Whether the sum converges, and at what scale, is a test of structure formation on the largest scales.

**6.** **(a)** A supercluster is the region within which peculiar velocity **flow lines converge on a common attractor** — a basin of attraction, bounded by the watershed beyond which flows head elsewhere. **(b)** *First*, it is **reproducible**: no arbitrary density threshold is chosen, so two analysts with the same velocity field obtain the same boundary, whereas a density contour is a decision. *Second*, it is **dynamical**: the boundary reflects how matter is actually moving and thus a real physical relationship among the members, rather than a level set of a counting statistic that may not correspond to anything. **(c)** It does **not** claim the structure is **bound**, and this honesty matters because the natural reading of "structure" is "object", and here that reading is false. A watershed is explicitly a feature of a flow; nothing is enclosed, no boundary resists anything, and the binding criterion shows Laniakea will disperse. Because the flow pattern itself evolves, the boundary is a **snapshot** rather than a persistent feature — Laniakea is the present shape of a motion, not a thing that will endure.

**7.** **(a)** Structures are identified by linking galaxies separated by less than some length, or by contouring above some density. **Raising** the threshold breaks large structures into many small ones; **lowering** it merges them. Below a critical value the entire survey volume connects into a **single** structure, because the cosmic web is genuinely connected — so the inventory of structures, including which is largest, is a function of the threshold rather than a fact about the universe. **(b)** In a uniform random field, the **largest** fluctuation found grows with the volume searched, simply because extreme values become more likely in larger samples. A record-breaking structure in a bigger survey may therefore be exactly what chance predicts, and comparing it with expectations derived from a smaller survey is invalid. **(c)** It must include a **null distribution**: the distribution of "largest structure" sizes found by applying the *same* identification algorithm at the *same* threshold to random realisations with the *same* survey geometry, selection function and sample size. Only against that baseline does "largest" or "too large for the standard model" carry information about the universe rather than about the search — and several published claims of anomalously large structures have failed precisely this test.

**8.** **(a)** Because an **underdense** region has less mass than average pulling it together, so gravity decelerates its expansion less than it decelerates the universe as a whole. Relative to the mean, the void therefore expands — matter effectively drains outward into the surrounding walls and filaments. Voids grow emptier and walls sharper with time, so the cosmic web becomes more contrasty. **(b)** Because they remain close to **linear**. Overdense regions collapse, become strongly non-linear, and their present state is related to the initial conditions only through complicated gravitational and baryonic physics — shell crossing, virialisation, feedback. Voids never collapse, so their abundance, size distribution and shapes map far more directly onto the primordial fluctuations and the expansion history. **The place where least has happened preserves the initial conditions best**, which inverts the instinct to study the most dramatic regions. **(c)** Void galaxies are on average **bluer, more gas-rich, later-type and lower-mass** than galaxies elsewhere. This is the **morphology–density relation** of the Galaxy Types chapter extended to its low-density extreme — the same trend that produces gas-poor spheroids in cluster cores, running the other way — and voids therefore serve as a control sample for isolating which galaxy properties are environmentally imposed rather than intrinsic.

**9.** **(a)** The criterion is $M > \Omega_\Lambda H_0^2R^3/G$. The **left side is fixed**: the mass within a comoving region does not change as the universe expands. The **right side grows**, because accelerating expansion means the repulsive term dominates increasingly with time. A region failing the test now therefore fails it by a larger margin later, so **structure formation is frozen** and the set of bound objects is closed. Dark energy came to dominate around $z \approx 0.3$, a few billion years ago, so the freezing is essentially complete. **(b)** The **Local Group is bound** and will survive, its members merging into a single galaxy over tens of billions of years. Our **infall toward Virgo will never complete** — the Local Group is falling at a couple of hundred km/s, but accelerating expansion wins and Virgo will recede. **Laniakea will disperse**, being already unbound; the flow defining it will be overwhelmed by expansion. **(c)** The **cosmic web is a feature of this cosmic era**, not a permanent aspect of the universe: there is a largest object that will ever exist, roughly the scale of a rich cluster, being the largest thing that turned around before dark energy took over. Far in the future, an observer in the merged Local Group remnant would see a single galaxy in an empty accelerating sky, every other structure having receded beyond the horizon. **The evidence from which we reconstructed cosmology — other galaxies, their redshifts, the web itself — would not be available to them**, which is a sobering statement about the contingency of what any epoch's observers can know.$egSuper_master$,
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
