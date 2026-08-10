-- Astronomy & Space · The Expanding Universe — Expansion — "Cosmic Scale".
-- Curated master for
-- astronomy-and-space/expanding-universe/expansion/cosmic-scale
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Expansion block capstone. Organised around the observation that "how big
-- is the universe?" is several different questions wearing one sentence,
-- and that separating them is the whole content. Why the observable
-- universe is 46.5 Gly in radius rather than the 13.8 Gly the light-travel
-- time naively suggests, worked through as a factor of 3.37; the three
-- horizons - Hubble radius at 14.5 Gly, particle horizon at 46.5, event
-- horizon at 16.5 - which are routinely conflated and answer different
-- questions; the event horizon as a permanent limit on what can ever be
-- observed, closing the argument the Superclusters chapter opened about
-- the cosmic web being a feature of this era; why flatness measurements
-- cannot establish that the universe is infinite, since a flat universe
-- may be finite with non-trivial topology; the scale ladder across 19.5
-- orders of magnitude; and the Copernican point that every observer has
-- their own observable universe and none is central.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/expansion/cosmic-scale',
    'research',
    'advanced',
    'read',
    $expScale_master$> "How big is the universe?" is not one question. It is at least four, and they have different answers — one of which is a number, one of which is a different number, one of which is a third number, and one of which is **not known and may not be knowable**. Nearly all confusion about cosmic scale comes from answering a different one of these than the asker had in mind.

This chapter closes the Expansion block by assembling what the previous three built. Hubble's law established that separations grow; redshift gave the expansion factor since emission; the distance ladder supplied the absolute scale. Putting them together answers questions about the size and extent of things — and shows exactly where the answers run out.

## The observable universe is bigger than its own age

Start with the number that immediately looks wrong.

The universe is **13.8 billion years old**. Light travels one light-year per year. The naive conclusion is that we can see 13.8 billion light-years in any direction, and that the observable universe is 27.6 billion light-years across.

The actual figure is **46.5 billion light-years in radius** — a factor of **3.37** larger.

The resolution is the whole content of the previous two chapters. Light emitted 13.8 billion years ago has indeed been travelling for 13.8 billion years. But **the matter that emitted it has been receding the entire time.** Its present distance is far greater than the distance it was at when the light set out, and far greater than the path length the light traversed.

There are therefore three different distances to the same object, and they are all legitimate:

| Distance measure | For the CMB's emitting surface |
| --- | --- |
| Distance when the light was emitted | ~41 million light-years |
| Path length travelled by the light (light-travel distance) | 13.8 billion light-years |
| Distance to that matter **now** (comoving distance) | **45.2 billion light-years** |

The first is small because the universe was 1/1101 of its present size — the redshift identity from two chapters back, doing real work. The third is what "the size of the observable universe" conventionally means, because it answers *where is that stuff now*.

**None of these is the right answer in general; they answer different questions.** Quoting one without saying which is the source of most popular confusion about cosmic size, and it is the same multiplicity the Redshift chapter met when luminosity, angular-diameter and comoving distances diverged at high redshift.

One detail in that table repays attention, because it is quietly elided in almost every popular account. The CMB's emitting matter is now at 45.2 Gly, while the observable radius quoted above is 46.5. **These are not the same surface.** The 46.5 figure is the *particle horizon* — the comoving distance light could have covered since $t = 0$ — while the CMB comes from recombination at 380,000 years, slightly later. The intervening ~1.3 Gly of comoving distance holds matter that is inside our horizon in principle but from which no photon can reach us, because the universe was opaque before recombination.

That shell is not empty of information, only of light. Neutrinos decoupled at about one second and free-streamed from a surface far deeper than the photons'; gravitational waves, if primordial, decoupled deeper still. **The CMB is the edge of what can be seen optically, not the edge of what exists or even of what is in principle observable.** The cosmic neutrino background is a real prediction, indirectly evidenced by its gravitational effect on the CMB's own acoustic peaks, and a direct detection would push the visible boundary outward past a wall that looks final only to photons. Whenever someone says the CMB is "the edge of the observable universe", the correct amendment is: *the edge of the photon-observable universe, and a horizon of opacity rather than of extent.*

```checkpoint
q: The universe is 13.8 billion years old, yet the observable universe has a radius of 46.5 billion light-years. What resolves this?
a: Light travelled faster in the early universe, covering more ground than it would today
x: The speed of light is constant; no epoch-dependent variation is part of standard cosmology, and invoking one would disrupt a great deal that works.
a*: The matter that emitted the light has been receding throughout the journey, so its present distance greatly exceeds both the path the light travelled and the separation at emission
a: The universe is older than 13.8 billion years, and that figure refers only to the time since recombination
x: 13.8 Gyr is the time since the Big Bang; recombination followed about 380,000 years later, a negligible correction on this scale.
a: Space expanded faster than light during inflation, carrying the light further
x: Inflation did expand space superluminally, but it ended a fraction of a second after the Big Bang and is not what produces this factor — ordinary expansion over 13.8 Gyr does.
hint: Three different distances exist to the same object. Which one is being quoted?
why: Light from the CMB has travelled for 13.8 Gyr, but the matter that emitted it did not stay put — it has receded for the whole journey. So there are three distinct distances: ~41 million light-years at emission, when the universe was 1/1101 of its present size; 13.8 billion light-years of path travelled; and 45.2 billion light-years to that matter now. The last is what "the size of the observable universe" conventionally means, because it answers where the material is at present. None is the uniquely correct answer — they answer different questions, which is the same multiplicity that makes luminosity, angular-diameter and comoving distances diverge at high redshift.
---
q: A press release describes a newly found $z = 10$ galaxy as "13.3 billion light-years away". Its present comoving distance is about 31 billion light-years. Which statement is correct?
a: The press release is simply wrong; 31 Gly is the distance and 13.3 Gly is an error
x: 13.3 Gly is a real and correctly computed quantity — the light-travel distance. It is not an error, only an unlabelled choice among several distances.
a*: Both figures are correct — 13.3 Gly is the light-travel distance and 31 Gly the present distance of that matter — and the release is faulty only in not saying which it quotes
a: The two disagree because the galaxy has moved since the light was emitted, which a proper relativistic treatment would remove
x: The recession is expansion of space, not motion through it, and no treatment removes the difference; it is a genuine feature, not an artefact.
a: 31 Gly must be wrong, since it exceeds the 13.8 Gyr age of the universe expressed in light-years
x: The observable radius is 46.5 Gly, already exceeding 13.8 — an object's present distance routinely exceeds its light-travel distance for exactly the same reason.
hint: The chapter has just listed three legitimate distances to one object. How many is the press release using?
why: Light from a $z = 10$ galaxy has been in flight for about 13.3 billion years, so "13.3 billion light-years" is the light-travel distance and is correct. Meanwhile that galaxy has receded, and its present comoving distance is about 31 billion light-years — a factor of 2.4 larger — which is also correct. The fault is not arithmetic but labelling: the sentence quotes one distance without saying which, and readers reasonably assume it means "where the galaxy is". Note that the ratio grows with redshift, reaching 3.37 for the CMB, so the ambiguity is worst exactly where popular accounts most often reach for it.
```

## Three horizons, routinely confused

"Horizon" names at least three distinct surfaces in cosmology, and conflating them produces most of the remaining confusion.

**The Hubble radius**, $c/H_0 \approx 14.5$ billion light-years. The distance at which the recession rate equals $c$. As the Hubble's Law chapter established, this is **not** a limit on what can be seen — galaxies beyond it are observed routinely, because the Hubble radius itself grows and light that initially loses ground can later make headway.

**The particle horizon**, ~46.5 billion light-years. The boundary of the observable universe: the comoving distance to the most distant matter whose light has had time to reach us since the beginning. This is the one people usually mean.

**The event horizon**, ~16.5 billion light-years. The comoving distance beyond which light emitted *now* will **never** reach us, however long we wait. This one exists only because the expansion is accelerating; in a decelerating universe there is no cosmic event horizon at all.

Three surfaces, three sizes, three meanings. Note in particular that the event horizon is **smaller** than the particle horizon. That is not a contradiction: we can see objects whose light left long ago, from matter that has since receded beyond the distance from which anything emitted today could ever reach us. **We observe the past of regions whose present and future are permanently inaccessible.**

```checkpoint
q: The cosmic event horizon (~16 Gly) is smaller than the particle horizon (~46 Gly). How can we see things beyond a horizon?
a: We cannot — the discrepancy indicates the figures are computed under different assumptions
x: Both are standard ΛCDM quantities computed consistently; the difference is real and has a clear physical meaning.
a*: Because they concern different times: the particle horizon bounds what has *already* reached us, while the event horizon bounds what emitted *now* could ever reach us — so we see the past of regions whose present is permanently inaccessible
a: Because the event horizon applies only to massive objects, while light can cross it freely
x: The event horizon is defined by light propagation; nothing crosses it inward, massive or not.
a: Because the particle horizon is measured in comoving coordinates and the event horizon in proper distance
x: Both are quoted here as comoving distances, so the difference is not a units artefact.
hint: One horizon is about light that has already arrived; the other about light that has yet to be sent.
why: The particle horizon is the comoving distance to the furthest matter whose light has had time to reach us since the beginning — a statement about the past, and it grows as more light arrives. The event horizon is the comoving distance beyond which light emitted *now* will never reach us however long we wait — a statement about the future, and it exists only because expansion accelerates. A galaxy can therefore lie inside the particle horizon and outside the event horizon: we see the light it sent long ago while nothing it emits today will ever arrive. We are watching the past of regions whose present and future are cut off, which is a strange but entirely consistent situation.
---
q: Why is the Hubble radius not the boundary of the observable universe, despite being where recession reaches the speed of light?
a: Because the recession velocity there is not really c, being a coordinate artefact
x: The recession rate is a genuine rate of change of proper distance; the point is not that it is unreal but that it does not prevent light from arriving.
a*: Because the Hubble radius grows with time, so a photon that initially loses ground can later find itself in a more slowly receding region and make progress toward us
a: Because light emitted toward us gets a boost from the expansion behind it
x: Expansion acts between the photon and us as well; there is no following wind. The mechanism is the growth of the Hubble radius, not a push.
a: Because the Hubble radius applies only to galaxies, not to the light they emit
x: It is a property of the expansion at a given distance and applies to anything there; what matters is how it evolves.
hint: Ask whether the Hubble radius is fixed, and what that means for a photon struggling against it.
why: A photon emitted beyond the Hubble radius does initially recede from us in proper distance — the space between grows faster than the photon advances. But H(t) has been decreasing over most of cosmic history, so the Hubble radius c/H expands, and a photon that starts outside can be overtaken by it, entering a region where recession is slower than c and thereafter making genuine progress. That is why everything above z ≈ 1.5 is receding superluminally today and is nonetheless seen. The observable boundary is the particle horizon at ~46.5 Gly, not the Hubble radius at ~14.5 — and treating the latter as an edge is one of the commonest errors in the subject.
```

{{image: Observable universe | The observable universe on a logarithmic scale, with the Solar System at the centre and the cosmic microwave background at the edge. That edge is a horizon rather than a boundary — it marks how far light has had time to travel since the beginning, so it is centred on the observer and differs for every observer. Its radius, 46.5 billion light-years, exceeds the 13.8 billion years of light travel because the emitting matter has receded throughout the journey.}}

## What we will never see

The event horizon has a consequence that deserves stating plainly, because it is one of the few genuinely permanent limits in physics.

Under accelerating expansion, the comoving distance light can traverse in the remaining infinite future **converges**. It does not grow without bound. So there is a definite comoving sphere — about 16 billion light-years in radius — beyond which events happening now can never be observed by us or our descendants, however long anyone waits and whatever technology is built.

This is not a practical limit like instrument sensitivity. It is causal. Those regions are leaving our light cone permanently.

Two consequences follow, and they close arguments opened earlier in this tree.

**The observable universe will shrink in content, not grow.** Naively, waiting longer means seeing further — the particle horizon does keep growing. But galaxies not gravitationally bound to us are receding, and their light is redshifting toward invisibility. Over hundreds of billions of years, everything outside the Local Group's merged remnant will redshift out of detectability. **The number of galaxies we can observe is now decreasing.**

**Cosmology becomes unobservable.** The Superclusters chapter noted that the cosmic web is a feature of this era. The stronger version: an observer arising in the far future, in the merged Local Group, would see a single galaxy in an empty sky. No other galaxies, no redshift–distance relation, no cosmic microwave background — redshifted beyond any conceivable detection. They would have no evidence that the universe expands, no evidence of a Big Bang, and no way to discover any of it.

**We happen to live in the interval when the evidence is visible.** That is a sobering thing to notice, and it raises a question worth taking seriously rather than as a rhetorical flourish: *what is currently unobservable to us for the same kind of reason?* Cosmology's present confidence rests partly on the accident of timing, and there is no guarantee that the epoch we occupy is one in which every important feature of the universe leaves a detectable trace.

```checkpoint
q: An observer in the far future, in the merged remnant of the Local Group, would be unable to discover that the universe expands. Why?
a: Because the expansion will have stopped by then, leaving nothing to discover
x: Under a cosmological constant the expansion accelerates indefinitely rather than stopping; it will be faster, not absent.
a*: Because all galaxies outside the bound Local Group will have receded beyond detectability and the CMB will be redshifted past any conceivable instrument — leaving a single galaxy in an empty sky and no evidence of expansion at all
a: Because the Local Group will have collapsed into a black hole, preventing observation
x: The Local Group will merge into a single large galaxy, not a black hole, and observation within it remains possible.
a: Because the laws of physics will have changed, invalidating the inference
x: Nothing in standard cosmology has the laws changing; the evidence disappears while the physics stays the same.
hint: What did we use to discover the expansion, and will any of it still be visible?
why: Every line of evidence for expansion is external: redshifts of other galaxies, the redshift–distance relation, the cosmic microwave background, the abundances of light elements in distant gas. Accelerating expansion removes them all — unbound galaxies recede and redshift out of detectability, and the CMB's temperature falls toward zero. What remains is one merged galaxy in an apparently static, empty universe, with no accessible evidence that anything else ever existed. The unsettling part is what it implies about now: our cosmological confidence depends partly on inhabiting the interval when the evidence is still visible, and there is no guarantee that everything important about the universe leaves a trace detectable from where and when we happen to be.
---
q: The particle horizon keeps growing, yet the number of galaxies we can observe is decreasing. How are both true at once?
a: They are not both true; the growing horizon means the count must rise, and the claimed decrease is a misstatement
x: Both are standard consequences of ΛCDM. The horizon does grow, and the observable galaxy count does fall — the resolution is that they are governed by different things.
a*: The horizon bounds where light *could* have come from, but unbound galaxies are receding and their light is redshifting toward undetectability, so galaxies drop out of reach faster than new comoving volume is added
a: Because galaxies are being destroyed by mergers faster than the horizon can reveal new ones
x: Mergers reduce galaxy counts locally but nowhere near fast enough, and they act on bound systems; the dominant effect is recession and redshift.
a: Because dark energy is causing the particle horizon to shrink in comoving terms
x: The particle horizon grows monotonically in comoving distance; dark energy limits how much it can ever grow, but does not reverse it.
hint: Being inside a horizon and being detectable are not the same requirement.
why: The particle horizon is a purely geometric bound — the comoving distance light could have covered since the beginning — and it does keep growing, though under accelerating expansion it converges toward a finite limit. Detectability is a separate matter. A galaxy not gravitationally bound to us recedes ever faster, so its light arrives at steadily lower flux and steadily higher redshift, and eventually falls below any instrument. That attrition already outpaces the horizon's growth, so the count of observable galaxies is now falling. The distinction is worth keeping: "inside the horizon" says light could in principle have reached us, not that anything usable actually arrives.
```

## Is the universe infinite?

The last question, and the honest answer is that **we do not know and may not be able to.**

What is measured is **curvature**. General relativity permits three geometries for a homogeneous universe: positively curved (closed, finite), flat, or negatively curved (open). The curvature parameter $\Omega_k$ is measured from the angular scale of the CMB acoustic peaks — the 147 Mpc ruler again — compared with its observed angular size, since curvature bends the light paths and changes the angle.

The result is that $\Omega_k$ is consistent with **zero** to a fraction of a per cent. The universe is flat, or extremely close to it.

Now the inference people want to draw: flat means infinite. **It does not follow**, for two separate reasons.

**First, measurement cannot establish exact flatness.** A very large but finite closed universe is indistinguishable from a flat one over the observable volume, in the same way a small patch of the Earth's surface looks flat. The constraint $|\Omega_k| \lesssim 0.001$ implies only that any curvature radius exceeds the observable universe by a substantial factor — a lower bound on size, not infinitude.

**Second, and more fundamentally: flatness does not determine topology.** General relativity fixes local geometry, not global connectivity. A flat universe can be **finite** — a three-torus, for example, where travelling far enough in one direction returns you to your starting point, with no curvature and no boundary anywhere. This is not exotic speculation; it is a legitimate solution, and it has been searched for observationally.

The search looks for **matched circles** in the CMB: if the universe were small enough to wrap, we would see the same patch of the last-scattering surface in two different directions, giving identical temperature patterns along two circles on the sky. None has been found, which sets a lower bound on the size of any such wrapping — but a bound, not a resolution. **A universe larger than the observable volume is untestable in principle by this method**, since the wrapping would simply lie beyond where we can see.

So the position is: **flat to high precision, at least as large as the observable universe by a considerable margin, and of unknown global topology and extent.** Statements that the universe is infinite are extrapolations, not measurements — usually reasonable ones, since the simplest models are infinite, but they should be labelled as what they are.

```checkpoint
q: The universe is measured to be flat to within a fraction of a per cent. Does this establish that it is infinite?
a: Yes — flat geometry is infinite by definition, so the measurement settles it
x: Flat *geometry* is a local property. Global extent depends on topology, which the geometry does not determine — a flat three-torus is finite with no curvature anywhere.
a*: No — for two reasons: a sufficiently large finite closed universe is observationally indistinguishable from a flat one, and flatness does not fix topology, so a flat universe can be finite and unbounded
a: No, because the measurement has uncertainty, but exact flatness would imply infinitude
x: The uncertainty point is right but incomplete; even exact flatness would leave the topological question entirely open.
a: Yes, because a finite universe would have an edge, and no edge is observed
x: A finite universe need have no edge — a three-torus or a closed sphere is finite and boundaryless. Absence of an edge implies nothing about extent.
hint: Geometry is local. What determines whether space closes up on itself?
why: Curvature is measured from the angular size of the CMB acoustic scale against its known physical size, giving Ω_k consistent with zero to ~0.001. But that is a *local* statement. A very large closed universe looks flat over any observable patch, exactly as the Earth does locally, so the bound gives a minimum curvature radius rather than infinitude. More fundamentally, general relativity fixes geometry and leaves topology free: a flat three-torus is finite, has no boundary and no curvature. Searches for matched circles in the CMB — the same patch of last-scattering seen in two directions — have found none, which raises the lower bound without settling the question, and cannot settle it at all if the wrapping scale exceeds the observable volume. "The universe is infinite" is a reasonable extrapolation, not a measurement.
---
q: What would a detection of matched circles in the CMB establish?
a: That the universe is closed and positively curved
x: Matched circles arise from topological identification, which is independent of curvature — a flat torus produces them without any curvature at all.
a*: That space wraps back on itself on a scale within the observable universe, making it finite — since we would be seeing the same patch of the last-scattering surface from two different directions
a: That the CMB contains systematic errors, since identical patterns should not recur
x: The recurrence would be a genuine physical signal of non-trivial topology, not an instrumental artefact.
a: That inflation did not occur, since it would have smoothed such structure away
x: Inflation makes a wrapping scale unlikely to be observable by pushing it far beyond the horizon, but a detection would constrain inflation rather than refute it outright.
hint: If space wraps, how many routes does light have from a given patch to you?
why: In a space with non-trivial topology, light from one region can reach you along more than one path, so you see the same physical patch in two directions on the sky. Where the two lines of sight intersect the last-scattering surface, they trace circles carrying identical temperature patterns — a distinctive and searchable signature. Finding a pair would prove the universe finite and fix its wrapping scale, without saying anything about curvature, since the effect is topological. None has been found, which pushes any wrapping scale beyond the observable volume. Note the asymmetry: a detection would be decisive, while non-detection can never rule out a universe simply larger than what we can see — the hypothesis is verifiable but not falsifiable.
```

{{image: Shape of the universe | The three homogeneous geometries — positively curved, flat, and negatively curved — distinguished observationally by how curvature bends light and alters the angle subtended by the cosmic microwave background's acoustic scale. Measurement puts the universe at flat to within a fraction of a per cent, which bounds any curvature radius well beyond the observable volume but settles neither the global topology nor the total extent.}}

## Nineteen and a half orders of magnitude

It is worth laying out the ladder of scales the previous chapters have traversed, because the span is difficult to hold in mind and the difficulty is itself informative.

| Scale | Size (m) | Power of ten |
| --- | --- | --- |
| Earth's diameter | $1.3\times10^{7}$ | $10^{7.1}$ |
| Earth–Sun (1 AU) | $1.5\times10^{11}$ | $10^{11.2}$ |
| Solar System (to Neptune) | $4.5\times10^{12}$ | $10^{12.7}$ |
| Nearest star | $4.0\times10^{16}$ | $10^{16.6}$ |
| Milky Way diameter | $9.5\times10^{20}$ | $10^{21.0}$ |
| To Andromeda | $2.4\times10^{22}$ | $10^{22.4}$ |
| To the Virgo cluster | $5.2\times10^{23}$ | $10^{23.7}$ |
| Laniakea | $5\times10^{24}$ | $10^{24.7}$ |
| Observable universe | $4.4\times10^{26}$ | $10^{26.6}$ |

From the Earth to the observable universe is **19.5 orders of magnitude** — a factor of $3\times10^{19}$.

The instructive part is where the *gaps* are. The jump from the Solar System to the nearest star is nearly four orders of magnitude, and from a star to a galaxy another four and a half. **Matter in the universe is not distributed smoothly across scales; it clumps at a few preferred sizes with vast emptiness between**, which is precisely the structure the Cosmic Web block described and which the Zel'dovich argument explained.

There is also a lesson about intuition. Human spatial intuition is calibrated on a range of perhaps $10^{-3}$ to $10^{4}$ metres — seven orders of magnitude. **The cosmic scale ladder exceeds that by a factor of nearly $10^{12}$.** No amount of familiarity makes these distances intuitive, and the honest response is not to try but to work in logarithms and trust the arithmetic. Every intuitive failure met in this block — the observable universe exceeding its own age, superluminal recession, horizons of different sizes — comes from applying intuitions built at $10^{0}$ metres to phenomena at $10^{26}$.

```checkpoint
q: The scale ladder has large empty gaps — nearly four orders of magnitude between the Solar System and the nearest star, four and a half between a star and a galaxy. What do these gaps indicate?
a: That our survey of intermediate scales is incomplete, and objects of those sizes await discovery
x: Intermediate scales are well surveyed; the emptiness is physical, not a selection effect.
a*: That matter is not spread evenly across scales but clumps at a few preferred sizes with vast emptiness between — the same hierarchy the Cosmic Web block described
a: That gravity weakens at intermediate distances, preventing structures from forming there
x: Gravity follows an inverse-square law at every scale relevant here; nothing about it turns off between scales.
a: That the gaps are an artefact of using logarithms, and vanish on a linear scale
x: On a linear scale the gaps are far more extreme, not less. The logarithm compresses them enough to be seen at all.
hint: Ask what sets the sizes of the things that do exist, rather than what forbids the sizes that do not.
why: Structures form where a physical process has a characteristic scale: nuclear burning fixes stellar sizes, angular momentum and dissipation set galaxy sizes, gravitational instability acting on the primordial spectrum sets cluster and filament scales. Between those preferred sizes there is nothing to make anything, so the ladder is a set of rungs separated by emptiness rather than a continuum. That is precisely the picture the Cosmic Web block built and the Zel'dovich argument explained: collapse proceeds anisotropically into sheets, then filaments, then knots, concentrating matter into a small fraction of the volume and leaving most of space void. The gaps in the table are that hierarchy seen edge-on.
```

## How much is in it

Size invites a companion question — how much *stuff* — and the arithmetic is worth doing, because the answer inverts the impression the previous section leaves.

The critical density follows from $H_0$ alone: $\rho_c = 3H_0^2/8\pi G$. With $H_0 = 67.4$ km/s/Mpc this is $8.5\times10^{-27}$ kg m⁻³, about **five hydrogen atoms per cubic metre**. Matter accounts for $\Omega_m = 0.315$ of it — roughly **1.6 atoms' worth per cubic metre**, most of it dark — and ordinary baryons for $\Omega_b = 0.049$, or about **one proton per four cubic metres.**

Set that against laboratory practice. The best vacuum achievable on Earth, near $10^{-12}$ Pa, still holds some $2\times10^{8}$ molecules per cubic metre. **The mean density of the universe is about a billion times more rarefied than the emptiest volume ever produced in a laboratory**, and interstellar gas inside the Milky Way — itself a byword for emptiness — is around $10^{6}$ atoms m⁻³, six hundred thousand times the cosmic mean. The vacuum of intergalactic space is not merely a good vacuum; it is a regime with no terrestrial analogue at all, as the Intergalactic Medium chapter's difficulty in detecting it should have suggested.

Now multiply by the volume. A sphere of radius 46.5 Gly has volume $3.6\times10^{80}$ m³, so the observable universe contains about $9.6\times10^{53}$ kg of matter, or **$4.8\times10^{23}$ solar masses.** Divide by an estimated $2\times10^{11}$ large galaxies from direct deep-field counts and you get $2.4\times10^{12}\ M_\odot$ apiece — which is, satisfyingly, about the total mass of the Milky Way including its dark halo. The arithmetic closes.

That consistency is the point of the exercise, and it is worth naming the method. **A mean density derived from $H_0$, a volume derived from horizon integrals, and a galaxy count derived from deep imaging are three completely independent measurements, and their combination reproduces a fourth quantity — the mass of a typical galaxy — that is measured independently again from rotation curves.** Nothing forced them to agree. When four unrelated observational programmes intersect at one number, that number is doing more than describing; it is a consistency test that the whole framework passes.

The counting is not settled, incidentally. Extrapolating the galaxy luminosity function to faint dwarfs suggests as many as $2\times10^{12}$ galaxies, ten times the directly counted figure — which would put the mean galaxy mass at $2.4\times10^{11}\ M_\odot$, appropriate if most galaxies are dwarfs, exactly as the Dwarfs and the Local Group chapter argued. **The two counts do not conflict; they answer different questions**, one about galaxies bright enough to see and one about galaxies that exist. That is the chapter's thesis appearing again in a different quantity.

```checkpoint
q: The mean matter density of the universe is about 1.6 atoms per cubic metre. What does this imply about the emptiness of intergalactic space?
a: It is comparable to a good laboratory vacuum, which is why intergalactic gas is hard to study
x: It is about a billion times more rarefied than the best laboratory vacuum, which holds ~10⁸ molecules per cubic metre. The difference is not marginal.
a*: It is far emptier than anything achievable on Earth — roughly a billion times more rarefied than the best laboratory vacuum, and about six hundred thousand times thinner than interstellar gas inside the Milky Way
a: It implies most of the universe's matter is in a form that does not occupy volume
x: Dark matter does occupy volume and is included in the 1.6 atoms' worth per cubic metre; the density is genuinely that low.
a: It means galaxies must be far denser than average by a factor of a few
x: Galaxies exceed the mean density by many orders of magnitude, not a factor of a few — interstellar gas alone is ~10⁶ times the cosmic mean.
hint: Compare with a number from the laboratory before deciding whether 1.6 per cubic metre is small.
why: The critical density $3H_0^2/8\pi G$ works out to ~5 hydrogen atoms per cubic metre, of which matter is 31.5% — about 1.6 atoms' worth, with baryons alone at roughly one proton per four cubic metres. A state-of-the-art laboratory vacuum near $10^{-12}$ Pa still contains $2\times10^{8}$ molecules per cubic metre, so the cosmic mean is about a billion times thinner; interstellar gas at ~$10^{6}$ m⁻³ is itself six hundred thousand times denser than the cosmic mean. Intergalactic space is therefore a regime with no terrestrial analogue, which is why the warm–hot intergalactic medium had to be found in absorption against background quasars rather than by its own emission.
```

## Where we are

A final point, and it is the one Copernicus started.

Every observer has their **own** observable universe, centred on themselves, of the same radius. Ours is centred here because the horizon is defined by how far light has had time to travel *to us*. An observer in a galaxy at our own horizon has an observable universe centred on them, half of which we cannot see, and they can see regions permanently inaccessible to us.

**The observable universe is a property of an observer, not of the universe.** It is not a structure with a location; it is a relationship between the universe and a vantage point.

That the boundary looks the same in every direction is therefore no evidence of centrality — it is exactly what every observer everywhere would find, and it is the same logic the Hubble's Law chapter used to dispose of the apparent centre of expansion. The isotropy is real, informative, and evidence about the *universe's homogeneity* rather than about our position in it.

```checkpoint
q: The observable universe is the same size in every direction from us. What does this isotropy actually establish?
a: That we occupy a special or central position, since a randomly placed observer would see an asymmetric horizon
x: Every observer sees a horizon centred on themselves of the same radius, because the horizon is defined by light travel time *to that observer*. Isotropy is the generic result, not a special one.
a*: Nothing about our position — every observer everywhere finds the same thing — but combined with the Copernican assumption it is evidence that the universe is homogeneous on large scales
a: That the universe is finite, since an infinite universe would show no boundary in any direction
x: The horizon is not a boundary of the universe but a limit on what light has reached us from; it appears in finite and infinite universes alike.
a: That expansion is centred on us, which is why recession looks the same in all directions
x: This repeats the error the Hubble's Law chapter disposed of: uniform expansion looks centred on whoever measures it, from every vantage point.
hint: Ask what an observer in a galaxy at our horizon would see looking back.
why: The horizon's radius is set by how far light has had time to travel *to the observer*, so it is a sphere centred on that observer by construction — an observer in a galaxy at our own horizon has one of the same radius centred on themselves, half of which we cannot see. Our finding it isotropic is therefore guaranteed and says nothing about where we are. What it does constrain is the *contents*: the same statistics of galaxies, the same CMB temperature and the same expansion rate in every direction. Under the Copernican assumption that we are not privileged, isotropy about every point implies homogeneity — which is the observational basis of the FLRW metric the whole block rests on. The observable universe is a relationship between the universe and a vantage point, not a structure with a location.
```

## Pulling the thread

- "How big is the universe?" is **at least four questions**. The observable universe has a radius of **46.5 Gly**, not 13.8 — a factor of **3.37** — because the emitting matter has receded throughout the light's journey. Three distances to the CMB's emitting matter are all legitimate: **~41 Mly at emission**, **13.8 Gly of light travel**, **45.2 Gly now** — and the particle horizon at 46.5 Gly is a fourth surface again, since the CMB is a wall of opacity rather than the edge of extent.
- **Three horizons**, routinely confused: the **Hubble radius** (14.5 Gly, where recession reaches $c$ — *not* a visibility limit, since it grows); the **particle horizon** (46.5 Gly, the observable boundary); and the **event horizon** (16.5 Gly, beyond which anything emitted now never reaches us). The event horizon is **smaller** than the particle horizon, so **we see the past of regions whose present is permanently inaccessible.**
- The event horizon is a **causal** limit, not a technological one. The number of observable galaxies is **now decreasing**, and a far-future observer would find **no evidence of expansion at all** — which means our cosmological confidence partly depends on the accident of when we live.
- **Flatness does not imply infinitude.** $\Omega_k$ is consistent with zero to ~0.001, but a large finite closed universe looks flat locally, and **geometry does not determine topology** — a flat three-torus is finite and unbounded. **Matched-circle** searches in the CMB would prove finitude if a pair were found; none has, and non-detection can never rule out a universe merely larger than the observable one.
- The scale ladder spans **19.5 orders of magnitude**, with matter **clumped at preferred scales** and vast gaps between. Human intuition covers about seven orders, so every counterintuitive result in this block is intuition applied outside its range.
- The mean matter density is **1.6 atoms' worth per cubic metre** — about a **billion times** more rarefied than the best laboratory vacuum. Times the volume, that gives **$4.8\times10^{23}\ M_\odot$**, or $2.4\times10^{12}\ M_\odot$ per galaxy at $2\times10^{11}$ galaxies — **the Milky Way's mass, arrived at from $H_0$, a horizon integral and a deep-field count**, none of which assumed it.
- **The observable universe is a property of an observer**, not a structure. Its apparent isotropy is evidence of homogeneity, not of centrality.

The transferable idea: **when a question has a surprising answer, check whether it is one question.** "How big is the universe?" produces contradictory answers in popular accounts not because the science is unsettled but because the sentence conflates the distance light has travelled, the present distance of the emitting matter, the limit of what can ever be seen, and the total extent of everything — four quantities with four different values, one of them unknown. The pattern generalises well beyond cosmology: an apparently simple question that yields inconsistent answers from competent people is usually several questions sharing a form of words, and the productive move is not to adjudicate between the answers but to **separate the questions and notice that each answer was correct for a different one.**

## Further reading

{{book: Philip Morrison | Powers of Ten | 1982}}

{{book: Janna Levin | How the Universe Got Its Spots | 2002}}

{{book: John Barrow | The Book of Universes | 2011}}

Beyond the books: Lineweaver and Davis's papers on expansion misconceptions are the standard corrective for exactly the errors this chapter addresses, and are unusually direct about which textbook statements are wrong. The matched-circles searches are worth reading as an example of a well-posed test for something that may simply not be there. And the literature on the far-future universe — what a civilisation arising in a hundred billion years could and could not determine — is a genuinely unsettling read.

## Problems

*Useful numbers: age 13.8 Gyr; observable radius (particle horizon) 46.5 Gly; comoving distance to last scattering 45.2 Gly; Hubble radius c/H₀ ≈ 14.5 Gly; event horizon ≈ 16.5 Gly; CMB at z ≈ 1100; H₀ = 67.4 km/s/Mpc = 2.18 × 10⁻¹⁸ s⁻¹; G = 6.674 × 10⁻¹¹ SI; m_H = 1.67 × 10⁻²⁷ kg; Ω_m = 0.315, Ω_b = 0.049; 1 pc = 3.26 ly; 1 M☉ = 1.99 × 10³⁰ kg; Ω_k consistent with 0 to ~0.001; Earth diameter 1.3 × 10⁷ m; observable universe 4.4 × 10²⁶ m.*

**1.** *(Bigger than its age.)* **(a)** State the naive expectation for the observable radius and the actual value. **(b)** Compute the ratio. **(c)** Explain the resolution, naming the three distinct distances to the CMB's emitting matter.

**2.** *(Distance at emission.)* **(a)** The CMB was emitted at z ≈ 1100. Using the redshift identity, compute the factor by which the universe has expanded since. **(b)** Given a present comoving distance of 45.2 Gly to the last-scattering surface, estimate the distance at emission. **(c)** Comment on what this says about how close the early universe was, and state why the last-scattering surface lies inside the particle horizon rather than on it.

**3.** *(Three horizons.)* **(a)** Define each of the Hubble radius, particle horizon and event horizon in one sentence. **(b)** Give their approximate values. **(c)** Explain how we can see objects beyond the event horizon.

**4.** *(Not an edge.)* **(a)** Explain why the Hubble radius is not a visibility limit. **(b)** State roughly the redshift above which objects recede superluminally. **(c)** Explain why the particle horizon is centred on the observer.

**5.** *(The permanent limit.)* **(a)** Explain why the event horizon exists only in an accelerating universe. **(b)** State what happens to the number of observable galaxies over time and why. **(c)** State what a far-future observer could determine about cosmology, and what follows for us.

**6.** *(Flat but finite.)* **(a)** State how curvature is measured. **(b)** Give two independent reasons flatness does not establish infinitude. **(c)** Describe a flat, finite, boundaryless space.

**7.** *(Matched circles.)* **(a)** Explain the physical origin of the signature. **(b)** State what a detection would establish and what it would not. **(c)** Explain the asymmetry between detection and non-detection.

**8.** *(Orders of magnitude, and how much is in them.)* **(a)** Compute the ratio of the observable universe's size to Earth's diameter, as a power of ten. **(b)** Identify the two largest gaps in the scale ladder and state what they reflect. **(c)** State the range over which human spatial intuition is calibrated and what follows. **(d)** Compute the critical density from $H_0$, convert it to hydrogen atoms per cubic metre, and estimate the total matter mass within the observable radius. Divide by $2\times10^{11}$ galaxies and comment on the result.

**9.** *(One question or several?)* **(a)** List the four distinct questions hidden in "how big is the universe?" with their answers. **(b)** State which has no known answer and why. **(c)** State the general lesson and give one example from elsewhere in this tree.

## Worked answers

**1.** **(a)** Naive: light travels 1 ly per year for 13.8 Gyr, giving a radius of **13.8 Gly**. Actual: **46.5 Gly**. **(b)** $46.5/13.8 = \mathbf{3.37}$. **(c)** The light has indeed been travelling 13.8 Gyr, but **the matter that emitted it has been receding for that entire time**, so its present distance far exceeds the path the light traversed. The three distances to the CMB's emitting matter: **~41 million light-years** at the moment of emission (when the universe was 1/1101 of its present size); **13.8 billion light-years** of path travelled by the light; and **45.2 billion light-years** to that matter now. Each answers a different question. Note that the observable radius of 46.5 Gly is a *fourth* number: it is the particle horizon, reaching back to $t = 0$, while the CMB was emitted 380,000 years later — so the CMB surface lies about 1.3 Gly inside the horizon, and is a wall of opacity rather than the edge of extent.

**2.** **(a)** $1 + z = a_0/a_{\rm emit} = 1101$, so the universe has expanded by a factor of **1101** since. **(b)** Comoving distance divides by $(1+z)$ to give the proper distance at emission: $45.2\ \mathrm{Gly}/1101 = 0.0411$ Gly $= \mathbf{41\ million\ light-years}$. **(c)** The material now 45.2 billion light-years away was, when it emitted the CMB, only about **41 million light-years** from the matter that became us — well inside the present distance to the Virgo cluster. The entire observable universe was correspondingly compact. This is why the early universe was hot and dense, and why the CMB is nearly isotropic: regions now separated by tens of billions of light-years were, at emission, near neighbours. As for the last part: the **particle horizon** reaches back to $t = 0$ and stands at 46.5 Gly, whereas recombination occurred 380,000 years later, so the last-scattering surface sits about **1.3 Gly inside** it. That shell contains matter within our horizon from which no photon can ever reach us, because the universe was opaque before recombination — a limit of **opacity, not of extent**. Neutrinos decoupled at about one second and gravitational waves earlier still, so the shell is not beyond observation in principle, only beyond optical observation.

**3.** **(a)** **Hubble radius**: the distance at which the recession rate equals $c$. **Particle horizon**: the comoving distance to the most distant matter whose light has had time to reach us since the beginning. **Event horizon**: the comoving distance beyond which light emitted *now* will never reach us, however long we wait. **(b)** Approximately **14.5**, **46.5** and **16.5** billion light-years respectively. **(c)** Because the two horizons refer to **different times**. The event horizon constrains light emitted *now*; the particle horizon describes light that has *already arrived*. A galaxy can lie inside the particle horizon — we see the light it sent billions of years ago — while lying outside the event horizon, so that nothing it emits today will ever reach us. We observe the past of regions whose present and future are permanently inaccessible, which is unusual but entirely consistent.

**4.** **(a)** Because the Hubble radius **grows with time**. $H$ has decreased over most of cosmic history, so $c/H$ expands. A photon emitted beyond it initially loses ground, but can be overtaken by the growing Hubble radius, entering a region where recession is slower than $c$ and thereafter making genuine progress toward us. **(b)** Above about $\mathbf{z \approx 1.5}$, objects are receding superluminally at the present epoch — which includes essentially every galaxy in a deep field. **(c)** Because it is defined by **how far light has had time to travel to a particular observer**. That definition references a vantage point, so the horizon is a sphere centred on whoever is doing the observing. Every observer has one of the same radius centred on themselves; ours is centred here for the same reason a ship's horizon at sea is centred on the ship. It is a relationship between the universe and a vantage point, not a structure with a location.

**5.** **(a)** Because in a **decelerating** universe the comoving distance light can traverse in infinite future time **diverges** — wait long enough and light from anywhere eventually arrives. Under **accelerating** expansion that integral **converges**: there is a finite comoving distance beyond which light emitted now never arrives, however long one waits. The event horizon is therefore a direct consequence of dark energy, and would not exist without it. **(b)** It is **decreasing**. Although the particle horizon keeps growing, galaxies not gravitationally bound to us are receding ever faster and their light is redshifting toward undetectability. Over hundreds of billions of years everything outside the merged Local Group will redshift out of observability. **(c)** They would see **a single galaxy in an empty sky**: no other galaxies, hence no redshift–distance relation; no detectable CMB, its temperature having fallen toward zero. They would have **no evidence that the universe expands** and no way to discover the Big Bang. What follows for us is that our cosmological knowledge depends partly on the **accident of when we live** — and therefore that the question "what is currently unobservable for the same kind of reason?" deserves to be asked seriously rather than dismissed.

**6.** **(a)** From the **angular size of the CMB acoustic scale**. The 147 Mpc sound horizon has a known physical size, so comparing it with its observed angular size gives the geometry: positive curvature makes it appear larger, negative curvature smaller. The result is $\Omega_k$ consistent with **zero to ~0.001**. **(b)** *First*, **measurement cannot establish exact flatness**: a sufficiently large closed universe is indistinguishable from a flat one over the observable volume, exactly as a small patch of the Earth appears flat. The bound gives a **minimum curvature radius**, not infinitude. *Second*, **geometry does not determine topology**: general relativity fixes local curvature and leaves global connectivity free, so even exactly zero curvature is compatible with a finite space. **(c)** A **three-torus**: take a cube and identify opposite faces, so that leaving through one face returns you through the opposite one. It is finite in volume, has **no boundary** anywhere, and is **exactly flat** — light travels in straight lines and angles of triangles sum to 180°. Nothing local distinguishes it from infinite flat space; only the global wrapping does.

**7.** **(a)** If space wraps on a scale within the observable universe, light from a single region can reach us along **more than one path**, so the same physical patch appears in two directions on the sky. Where those two lines of sight intersect the last-scattering surface, they trace **circles carrying identical temperature patterns**. **(b)** A detection would establish that the universe is **finite** and would fix its **wrapping scale**. It would say nothing about **curvature**, since the effect is purely topological and occurs in flat space. **(c)** **A detection would be decisive; non-detection can never be.** If the wrapping scale exceeds the observable volume, no matched circles fall within our sky and the search returns nothing — but that is equally what an infinite universe produces. The hypothesis is therefore **verifiable but not falsifiable** by this method, and every null result can only raise the lower bound on the wrapping scale rather than exclude finitude.

**8.** **(a)** $4.4\times10^{26}/1.3\times10^{7} = 3.4\times10^{19}$, i.e. about $\mathbf{10^{19.5}}$ — nineteen and a half orders of magnitude. **(b)** From the **Solar System to the nearest star** (~$10^{12.7}$ to $10^{16.6}$, nearly four orders) and from a **star to a galaxy** (~$10^{16.6}$ to $10^{21.0}$, four and a half). They reflect that **matter clumps at a few preferred scales with vast emptiness between** — the structure the Cosmic Web block described and the Zel'dovich argument explained, in which collapse proceeds anisotropically into sheets, filaments and knots, leaving most of the volume void. **(c)** Human spatial intuition is calibrated over roughly $10^{-3}$ to $10^{4}$ m — about **seven orders of magnitude**, so the cosmic ladder exceeds it by a factor of nearly $10^{12}$. It follows that **no amount of familiarity makes these scales intuitive**, and the correct working practice is to reason in logarithms and trust the arithmetic. Every counterintuitive result in this block — an observable universe larger than its own age, superluminal recession, horizons of unequal size — is intuition applied far outside the range in which it was built. **(d)** $\rho_c = 3H_0^2/8\pi G$. With $H_0 = 67.4$ km/s/Mpc $= 2.18\times10^{-18}$ s⁻¹, $\rho_c = 8.5\times10^{-27}$ kg m⁻³, which at $1.67\times10^{-27}$ kg per hydrogen atom is about **5 atoms per cubic metre** — of which matter is $\Omega_m = 0.315$, so **1.6 atoms' worth per cubic metre**, and baryons $\Omega_b = 0.049$, about **one proton per four cubic metres**. A sphere of radius 46.5 Gly $= 4.4\times10^{26}$ m has volume $\tfrac{4}{3}\pi R^3 = 3.6\times10^{80}$ m³, giving a matter mass of $0.315\rho_c V = 9.6\times10^{53}$ kg $= \mathbf{4.8\times10^{23}\ M_\odot}$. Divided among $2\times10^{11}$ galaxies that is $2.4\times10^{12}\ M_\odot$ each — **about the mass of the Milky Way including its dark halo**. The agreement matters: a density from $H_0$, a volume from horizon integrals, a count from deep imaging and a galaxy mass from rotation curves are four independent measurements, and nothing forced them to intersect. That they do is a consistency test the framework passes rather than a result any one of them assumes. If instead one adopts the extrapolated count of $2\times10^{12}$ galaxies including faint dwarfs, the mean falls to $2.4\times10^{11}\ M_\odot$ — appropriate when most galaxies are dwarfs, and not in conflict, since the two counts answer different questions.

**9.** **(a)** *How far has light travelled?* — **13.8 Gly**. *How far away is the matter that emitted the oldest light we see, now?* — **45.2 Gly** for the CMB's last-scattering surface, with the particle horizon — the observable radius proper — at **46.5 Gly**. *What is the furthest we could ever see, given infinite time?* — bounded by the **event horizon**, ~16.5 Gly comoving for anything emitted now. *How big is the whole universe?* — **unknown**. **(b)** The last. Curvature measurements bound it from below — flat to ~0.001 means any curvature radius greatly exceeds the observable volume — but a large finite closed universe mimics a flat one locally, and flatness does not determine topology, so a finite flat space remains possible. Matched-circle searches can only verify finitude, never exclude it. Anything beyond the observable volume is inaccessible in principle. **(c)** **When a simple question yields inconsistent answers from competent people, suspect that it is several questions sharing a form of words**, and separate them rather than adjudicating. Elsewhere in this tree: "**how massive is this galaxy cluster?**" resolves into virial, hydrostatic, lensing and SZ masses, which differ systematically because each answers a different question about a different tracer — and the Groups & Clusters chapter's insistence on comparing methods by their assumptions rather than their error bars is the same move applied there.$expScale_master$,
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
