-- Astronomy & Space · The Solar System — Origins —
-- "Migration and the Nice Model: The Planets Moved" (from ASTRO-201, Block 1
-- Lecture 6 -- UNIT I CLOSES). Curated, human-reviewed master for
-- astronomy-and-space/solar-system/origins/migration-and-the-nice-model @
-- research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Original, house-styled rework: abandoning the assumption that planets stay where
-- they form. The suspicious clustered ages of the Apollo Moon rocks (the LHB); the
-- physics of migration (spiral wakes and unbalanced torques; Type I fast enough to
-- lose terrestrial planets; Type II carrying gap-opening giants inward -> hot
-- Jupiters, rescuing not refuting the snow line); MEAN-MOTION RESONANCE (small-integer
-- period ratios make tugs repeat in phase and accumulate -- the swing analogy) and why
-- migration guarantees resonance crossings; THE NICE MODEL (compact giants beyond a 35
-- Earth-mass disk drift apart until Jupiter and Saturn cross the 2:1 resonance,
-- flinging Uranus and Neptune outward, swapping them, and scattering the disk into the
-- Kuiper Belt/Oort Cloud/inward -- one event, six explanations); THE GRAND TACK
-- (Jupiter tacking in to 1.5 AU and back out, solving the Mars problem and implanting
-- C-types in the belt); and the honest case study -- the LHB is now doubtful (Imbrium
-- ejecta biasing six nearside Apollo sites), yet the model survives on five
-- independent lines of evidence with its timing revised. Closes with the whole Unit I
-- synthesis: the solar system as a causal history of NECESSITY and CONTINGENCY.
--
-- VISUALS (engagement pass): embeds a ```resonance explorer (a histogram of where
-- successive conjunctions fall as you tune the period ratio -- piling up at a simple
-- ratio, scattering off-resonance; Resonance.tsx) and a ```nicemodel explorer (scrub
-- the giants' semi-major axes through the 2:1 instability to today, with the U/N swap;
-- NiceModel.tsx). Three interactive ```example practice boxes (migration-speed,
-- resonance-orbit, period-ratio; WorkedExample.tsx), and {image: ...} markers
-- resolving to real imagery (Apollo 17 sampling, Pluto, Mare Imbrium). Light inline
-- KaTeX (paired '$'; even count asserted); the dollar-quote tag is checked for
-- collisions.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/origins/migration-and-the-nice-model',
    'research',
    'advanced',
    'read',
    $astroMig_master$> Twice now, our account of the solar system's origin has failed in the same way. First we met hot Jupiters — giant planets orbiting other stars at a twentieth of Mercury's distance, in regions far too hot and too sparse to have built them. Then we met the Mars problem — simulations of terrestrial formation that overpredict Mars's mass by five to ten times, implying its zone was stripped of material by something. Both failures trace to a single assumption, so natural that we have been making it without stating it: **that planets remain where they form.** This chapter abandons that assumption, and in doing so transforms the solar system from a static arrangement into something with a violent and contingent history. We will first establish the physics: a planet embedded in a gas disk **exchanges angular momentum with it**, and the exchange is generally not balanced — so planets *migrate*, sometimes rapidly. Small bodies undergo **Type I migration**, which is so fast (of order $10^4$–$10^5$ years for an Earth-mass planet) that its main puzzle is why anything survives at all. Gap-opening giants undergo **Type II migration**, locked to the disk's own viscous evolution — and this is how hot Jupiters reach their absurd orbits. We will then introduce the concept that makes migration *dramatic* rather than merely gradual: **mean-motion resonance**, in which two planets' orbital periods form a simple integer ratio, so that their mutual tugs repeat in phase and accumulate rather than averaging away. And then we come to the centrepiece: the **Nice model**, in which the giant planets began in a far more compact configuration, slowly drifted apart as they scattered a massive disk of planetesimals, and — after several hundred million years — Jupiter and Saturn crossed the **2:1 resonance**, triggering a system-wide instability that flung Uranus and Neptune outward (possibly swapping their positions), hurled planetesimals across the solar system to form the Kuiper Belt and Oort Cloud, captured the Jupiter Trojans and the irregular satellites, depleted the asteroid belt, and rained impactors onto the inner planets. **Our solar system is not where it was built.** Finally we will meet the **Grand Tack** — an earlier episode in which Jupiter migrated inward to roughly Mars's orbit before reversing outward, truncating the inner disk and starving Mars — which resolves the problem the accretion story left open. But this chapter carries an unusually interesting complication, worth flagging at the outset: **the Late Heavy Bombardment, the lunar impact spike that the Nice model was originally built to explain, is itself now seriously questioned.** The Apollo samples that established it may be biased by a single enormous impact. So the origins story closes with a genuine case study in scientific reasoning: what happens to a successful, explanatory model when the phenomenon that motivated it starts to dissolve? The answer — that the model survives on the strength of everything *else* it explains, while its timing is revised — is a more instructive lesson than any tidy conclusion could be.

## Two kinds of explanation: a note on contingency

The story of the solar system's origin has been, until now, a story of *necessity*. The disk had to be flat, because angular momentum is conserved. The snow line had to exist, because water is abundant and freezes at 170 K. Giants had to form outside it and rocky worlds inside, because of the race against the disk's dispersal. These are robust physical consequences: run the formation of a solar system again, around a similar star, and you would expect the same broad architecture.

But this chapter introduces something different — **contingency.** Whether Jupiter and Saturn happened to cross a particular resonance, at what time, with what planetesimal disk remaining, and therefore what the outer solar system looks like today — these depend on details that could easily have gone otherwise. We have already met contingency once, in the stochastic giant-impact phase that set the specific masses of the inner planets. **A complete account of any planetary system therefore requires both kinds of explanation: the necessary consequences of physics, and the accidents of a particular history.** Learning to tell them apart is one of the more valuable skills the origins story can give you, and it will matter enormously later, when we ask why our system looks unlike most of the others we have found.

## The suspicious ages of the Moon rocks

Between 1969 and 1972, twelve human beings walked on the Moon, and they brought home **382 kilograms of rock.** Alongside samples returned robotically by the Soviet Luna missions, this remains one of the greatest scientific hauls in history — the only material we possess from another world collected by hand, from known locations, with geological context recorded.

Much of that material consists of **impact melt rocks**: rock that was melted by the energy of a large impact and then resolidified. These are valuable because melting resets the radiometric clock. Date such a rock, and you learn *when the impact happened.*

So researchers dated them, expecting to map out the history of lunar bombardment across four and a half billion years. What they found instead was strange.

**The ages clustered.** Rather than spreading evenly across lunar history, a striking proportion of the impact melt ages fell in a narrow window around **3.8 to 4.0 billion years ago.** Sample after sample, from different landing sites, pointed to the same era.

The natural interpretation was dramatic: the Moon — and by extension the entire inner solar system — experienced a **spike** of intense bombardment around 3.9 billion years ago. It was named the **Late Heavy Bombardment**, sometimes the "lunar cataclysm," and it left a genuine puzzle.

{{image: Apollo 17 | An astronaut collecting samples on the Moon during Apollo 17, the last crewed lunar landing. The 382 kilograms of rock returned by Apollo remain the only geologically-documented material we have from another world — and dating the impact-melt rocks among them revealed something strange: their ages cluster around 3.8–4.0 billion years, suggesting a sudden spike of bombardment more than half a billion years after the solar system formed. Explaining that spike drove one of the boldest ideas in planetary science — and, as it turns out, the samples themselves may be misleading us.}}

Here is why it is puzzling. The solar system formed **4.568 billion years ago.** So the bombardment spike occurred roughly **670 million years later** — more than half a billion years after formation. And that is very difficult to explain with the picture we have built so far. The leftover debris of accretion should have been swept up *early*: the planets clear their orbital neighbourhoods quickly, and the impact rate should decline smoothly and steeply from the beginning, like a fire burning down. A sudden *surge* of impacts, hundreds of millions of years after the system had settled, requires that a large population of small bodies was **stored somewhere stable and then suddenly destabilized.**

What could possibly reach into a quiet, mature solar system half a billion years after its formation and hurl a swarm of debris at the inner planets?

The answer proposed in 2005 — and it is the subject of this chapter — is that **the giant planets moved.** Not gently and not gradually, but in a sudden system-wide instability, triggered when Jupiter and Saturn drifted into a particular resonance, that rearranged the outer solar system and scattered a massive belt of planetesimals in every direction, including inward.

There is one further twist, developed honestly at the end of this chapter. **The Late Heavy Bombardment — the very phenomenon that motivated all this — is now itself under serious challenge.** The Apollo samples may be biased: most were collected from sites plausibly contaminated by ejecta from a single colossal impact, which could make one event masquerade as a global spike. If the cataclysm was not real, or was much weaker than believed, what becomes of the model built to explain it?

That question turns out to have an interesting answer, and it makes this the right place to close the origins story. But first: how does a planet move at all?

## How planets move: the physics of migration

A planet orbiting alone around a star stays put forever — that is Kepler's and Newton's result, and it is exact for a two-body system. But a young planet is not alone. It is **embedded in a massive disk of gas**, and that changes everything.

### The basic mechanism: torques from the disk

A planet's gravity perturbs the disk around it, raising **spiral density waves** — regions of enhanced density trailing and leading the planet, rather like a wake. Those overdense regions have mass, and they pull back on the planet gravitationally.

The key point is that the wakes on either side pull in **opposite directions**:

- The material **interior** to the planet's orbit orbits *faster* (Kepler), so it runs ahead; its gravity pulls the planet **forward**, adding angular momentum and pushing it **outward**.
- The material **exterior** orbits *slower*, so it trails behind; its gravity pulls the planet **backward**, removing angular momentum and dragging it **inward**.

If these balanced exactly, nothing would happen. They do not balance. The torques depend on the disk's density and temperature profiles, and in most disk models the **outer torque wins**, producing a net loss of angular momentum and hence **inward migration.**

This is the central idea: **a planet embedded in a gas disk exchanges angular momentum with it, and the exchange is generally not balanced, so the planet migrates.**

### Type I migration: fast, and a problem

For planets below roughly 10–20 Earth masses — not massive enough to significantly disturb the disk's structure — this process is called **Type I migration**, and its most striking feature is its *speed*.

Estimates give inward migration timescales of order **$10^4$ to $10^5$ years** for an Earth-mass planet at 1 AU. Compare that to the disk lifetime of 3–10 million years, and a difficulty appears immediately: **Type I migration is fast enough to sweep growing planetary embryos into the star many times over before the disk disperses.** Try the numbers for yourself:

```example
migration-speed
```

This is a genuine problem in the field, and it is worth naming as such. Taken at face value, Type I migration predicts that the inner regions of planetary systems should be swept clean — that terrestrial planets should not survive. Proposed mitigations include: **disk structure** (at pressure bumps and transitions, the torque can reverse, creating "planet traps" where migration stalls — note the connection to the dust traps of the accretion story), **thermal torques** from the planet's own accretion luminosity, and the possibility that embryos grow mostly after the gas has gone. **The rate and even the direction of Type I migration remain actively debated.** Add it to the list alongside the metre-size barrier: another place where the standard picture, taken literally, destroys the planets it is meant to build.

### Type II migration: how hot Jupiters happen

Once a planet exceeds roughly a Jupiter mass, something different occurs. Its gravity is strong enough to **clear an annular gap** in the disk around its orbit — the process we met at the end of core accretion, and the likely origin of at least some of the rings ALMA images in young disks.

With a gap opened, the planet is no longer subject to unbalanced local torques in the same way. Instead it becomes **locked into the disk's own evolution**: the disk is slowly draining inward through viscous accretion, and the planet is carried along with it, like a log in a slow river. This is **Type II migration**, and it proceeds on the disk's viscous timescale — of order **$10^5$ to $10^6$ years.**

**This is the accepted explanation for hot Jupiters.** A giant planet forms beyond the snow line, where the formation story says it must; it opens a gap; and then it is carried inward with the accreting disk, potentially travelling from 5 AU to 0.05 AU. The theory of *where* giants form was never wrong — 51 Pegasi b did form beyond its star's snow line. It simply did not stay there.

(Other mechanisms can also produce hot Jupiters — notably high-eccentricity migration, in which gravitational interactions with another planet or star throw a giant onto a highly elliptical orbit that is then circularized by tides. Which mechanism dominates is another open question, and the two make different predictions about orbital alignment that are being tested observationally.)

### The general lesson

**Migration is not exotic. It is the expected behaviour of a planet embedded in a massive gas disk, and it operates on timescales far shorter than the disk's lifetime.** The question is therefore not whether planets migrated, but *how much*, in which direction, and when. Our own system's giants formed in a gas disk for several million years; the presumption must be that they moved.

The remaining question is what makes migration produce a *catastrophe* rather than a gentle drift. For that we need one more concept.

## Resonance: how small tugs become large effects

Gravitational interactions between planets are usually negligible — that was the point of the Sun's mass dominance, and why Kepler's laws work so well. Jupiter tugs on Saturn, but by a tiny amount compared with the Sun's grip, and over one orbit the tug is mostly in one direction, then mostly in another, and the effects largely **cancel out.**

**Unless the tugs repeat in phase.**

### What a resonance is

Two bodies are in a **mean-motion resonance** when their orbital periods form a simple ratio of small integers. A **2:1 resonance** means the inner body completes exactly two orbits for every one of the outer body's; a **3:2 resonance** means three for two.

When this happens, the geometry of their encounters **repeats.** The two planets return to the same relative configuration, at the same points in their orbits, over and over. So the gravitational tug each gives the other is applied *in the same direction at the same orbital phase, again and again.*

**Instead of averaging out, the perturbations accumulate.** A tiny force, applied coherently over thousands of orbits, can produce enormous cumulative effects on orbital eccentricity and inclination. This is the same principle as pushing a child on a swing: individually feeble pushes, applied at the right moment each cycle, build a large amplitude. Watch where successive conjunctions fall as you tune the period ratio:

```resonance
```

### Resonances in the solar system today

Resonances are everywhere once you look, and we will meet them repeatedly:

- **The Kirkwood gaps** in the asteroid belt — regions swept nearly empty at distances where an asteroid's period would be a simple fraction of Jupiter's.
- **Pluto and the plutinos**, locked in a 3:2 resonance with Neptune, which is what protects Pluto from close encounters despite its orbit crossing Neptune's.
- **The Galilean moons** Io, Europa, and Ganymede, in a 4:2:1 resonance that maintains their orbital eccentricities and thereby powers Io's volcanism and Europa's ocean through tidal heating.
- **Gaps in Saturn's rings**, sculpted by resonances with moons.

**Resonances are the mechanism by which weak gravitational interactions become structurally decisive.** They are why the solar system's architecture contains sharp features — gaps, clusters, locked configurations — rather than being smooth.

```example
resonance-orbit
```

### Why resonance plus migration is dangerous

Now combine the two ideas of this chapter. If planets migrate, their orbital periods change. And if their periods change, the *ratio* between them changes — which means **migrating planets will inevitably sweep across resonances.**

Ordinarily two planets sit at some non-resonant period ratio and their interactions average away harmlessly. But a migrating pair passes *through* resonance, and while they are in it, their mutual perturbations add up coherently. Eccentricities can be pumped dramatically in a short time.

**Migration guarantees resonance crossings, and resonance crossings can destabilize an entire planetary system.** That is the mechanism at the heart of the Nice model, to which we now turn.

## The Nice model: a solar system rearranged

In 2005, a group of researchers working in Nice, France published a set of papers proposing that the outer solar system we observe today is **not the one that formed** — that the giant planets began in a substantially different configuration and were violently rearranged. The scenario is called the **Nice model**, and it has become the standard framework for the outer solar system's history. Scrub through it as you read:

```nicemodel
```

### The initial state

The model begins with the giants in a **compact configuration** — much closer together than they are now, and all within about 15 AU:

| Planet | Nice-model initial | Today |
|---|---|---|
| Jupiter | ~5.45 AU | 5.20 AU |
| Saturn | ~8.2 AU | 9.58 AU |
| Uranus / Neptune | ~11–14 AU | 19.19 / 30.07 AU |

Beyond them lay a **massive disk of leftover planetesimals** — of order **35 Earth masses** of icy debris, extending out to roughly 35 AU. This is the residue of formation that never made it into a planet: the material of the accretion process, left over beyond the giants where growth was too slow to finish.

Note that this initial state is not arbitrary. A compact configuration is what formation models tend to produce (giants form where solids are richest, relatively close in), and a massive outer planetesimal disk is exactly what you expect from the slow pace of outer-system accretion.

### The slow phase: planetesimal-driven migration

Now a slow process begins. The giants gravitationally scatter planetesimals from the disk, and every scattering exchanges angular momentum. **Neptune, Uranus, and Saturn tend to scatter objects inward**, gaining angular momentum and drifting slowly **outward**. Jupiter, being massive enough to eject objects from the solar system entirely, tends to lose angular momentum and drift slightly **inward**.

This is **divergent migration** — the planets slowly spreading apart — and it proceeds over hundreds of millions of years. It is gentle. Nothing dramatic happens.

But it changes the period ratios. And as Jupiter creeps inward and Saturn outward, the ratio of their periods steadily increases — heading toward a value of 2.

### The trigger: crossing the 2:1 resonance

Eventually, after (in the original formulation) something like **500 to 700 million years**, Jupiter and Saturn reach the **2:1 mean-motion resonance** — Saturn's orbital period exactly twice Jupiter's. The geometry checks out: with Jupiter at 5.20 AU (period 11.86 years), the 2:1 resonance would place Saturn at about **8.3 AU**, comfortably inside its present 9.58 AU.

And at that moment, exactly as the resonance physics dictates, the two most massive planets in the solar system begin exchanging coherent, accumulating gravitational tugs. Their **orbital eccentricities are pumped up** rapidly.

### The instability

What follows is a system-wide catastrophe:

**Jupiter and Saturn**, now on eccentric orbits, gravitationally disrupt everything else. Their perturbations destabilize the ice giants.

**Uranus and Neptune are flung outward** onto wildly eccentric orbits, plunging into the massive planetesimal disk beyond. (In many versions of the model, they **swap places** — Neptune may have formed *inside* Uranus and been thrown past it.)

**The planetesimal disk is destroyed.** Neptune ploughing through 35 Earth masses of icy debris scatters it comprehensively. Objects are thrown in every direction: some outward into what becomes the **Kuiper Belt**; some to enormous distances, forming the **Oort Cloud**; many ejected from the solar system entirely; and **some inward, into the inner solar system.**

**The inner planets are bombarded.** That inward-scattered flux, striking the Moon and terrestrial planets, was the original explanation for the **Late Heavy Bombardment.**

**The system settles.** As the planetesimal disk is consumed, the remaining interactions damp the giants' eccentricities, and they settle into approximately their present orbits — Uranus and Neptune now far out at 19 and 30 AU, having been thrown there.

{{image: Pluto | Pluto, imaged by New Horizons in 2015. Pluto is locked in a 3:2 mean-motion resonance with Neptune — orbiting the Sun exactly twice for every three Neptune orbits — which is what protects it, guaranteeing the two are never close even though Pluto's orbit crosses Neptune's. Such resonant populations are a direct fingerprint of the Nice model: as Neptune migrated outward, its resonances swept through the debris disk and captured objects into them. Pluto did not form where it orbits; it was shepherded there by a migrating Neptune.}}

### What the Nice model explains

The model's appeal lies in the sheer breadth of what falls out of a single event. It accounts for:

1. **The Late Heavy Bombardment's timing** — a bombardment spike hundreds of millions of years after formation, which was otherwise inexplicable. (This was the original motivation; we return to it below.)
2. **The giant planets' present orbits** — including their modest but non-zero eccentricities and inclinations, which are hard to produce if they formed in place in a quiescent disk.
3. **The structure of the Kuiper Belt** — in particular the **resonant populations**, most famously the **plutinos** (including Pluto) locked in 3:2 resonance with Neptune. As Neptune migrated outward, its resonances swept through the disk and **captured** objects into them. That is a specific, checkable prediction, and the populations are there.
4. **The Jupiter Trojans** — the two swarms of asteroids sharing Jupiter's orbit, captured during the chaotic phase.
5. **The irregular satellites** of the giant planets — small moons on distant, inclined, often retrograde orbits, best explained as *captured* objects rather than ones formed in place.
6. **The depleted asteroid belt** — the belt today contains less than 5% of the Moon's mass, far less than a smooth disk would leave.

**One event, six independent explanations.** That breadth is why the Nice model was adopted so rapidly, and why — as we will see — it survives even as its original motivation weakens.

```example
period-ratio
```

## The Grand Tack: solving the Mars problem

The Nice model addresses the *outer* solar system, hundreds of millions of years after formation. But the accretion story left us with a problem in the *inner* system, and it requires an entirely different and much earlier episode.

### The Mars problem, restated

Simulations of terrestrial planet formation from a smooth disk of planetesimals consistently produce a planet at Mars's location that is **five to ten times too massive**. Mars is only **0.107 Earth masses.** Its small size implies the region around 1.5 AU was strongly **depleted** — the disk must have been truncated somewhere around 1 AU, leaving Mars to form from scraps in a starved zone.

What could truncate the inner disk?

### The scenario

The **Grand Tack** (proposed in 2011) says: Jupiter did — by paying the inner solar system a visit.

The sequence, occurring *early*, while the gas disk was still present (within the first few million years):

**1.** Jupiter forms first, at around 3.5 AU, and — being a gap-opening giant — begins **Type II migration inward**, carried with the accreting disk. It travels in as far as roughly **1.5 AU**, ploughing through and scattering the inner disk material, truncating it.

**2.** Saturn forms later, further out, and migrates inward *faster* (its lower mass and the disk conditions allow more rapid migration). It catches up to Jupiter and the two become locked in a **3:2 resonance.**

**3.** Now the crucial reversal. With both planets sharing a common gap in the disk, the balance of torques changes: the combined configuration experiences a **net outward torque**. The pair reverses direction and migrates **outward together**, until the gas disk dissipates and leaves them near their post-formation positions (Jupiter around 5.4 AU).

The name comes from sailing: a ship **tacking** — running in one direction, then sharply reversing course.

### What it explains

**The Mars problem, directly.** Jupiter's inward excursion scatters and removes material from the region beyond about 1 AU. When the terrestrial planets subsequently assemble by giant impacts, Earth and Venus form from a well-stocked inner region, while Mars forms at the *edge* of a truncated disk, with little material available — and therefore ends up small. Simulations incorporating the Grand Tack reproduce Mars's actual mass, which the standard models could not.

**The asteroid belt's low mass and mixed composition.** Jupiter's passage sweeps most of the belt's original material away, explaining why it holds so little today. And on the way in and out, Jupiter scatters bodies from *beyond* the snow line into the belt region — which explains a standing puzzle: the belt contains both dry S-types *and* wet C-types. In the Grand Tack picture, the C-types are **implanted** from the outer system rather than having formed where we find them. (This refines rather than contradicts the snow-line story: the compositional gradient is real, but the outer belt population may be immigrants.)

**Possibly, water delivery to Earth.** The same scattering may have delivered water-rich bodies to the inner solar system — one candidate mechanism for how Earth acquired its oceans, a question taken up in the chapters on Earth.

### Status

The Grand Tack is **elegant and influential, but contested.** It requires a specific sequence of migration rates and a particular resonance capture, and alternative explanations for Mars's small mass exist — including the possibility that the disk was simply depleted beyond 1 AU from the start, or that different initial conditions can produce a small Mars without Jupiter's excursion. **It is a leading hypothesis rather than an established fact**, and you should hold it more loosely than, say, the snow line.

## Is the Late Heavy Bombardment real? A case study in scientific reasoning

We now return to the puzzle that opened this chapter, and confront a genuinely interesting development. **The Late Heavy Bombardment — the impact spike that the Nice model was originally constructed to explain — has come under serious challenge over the past fifteen years.** This section is the honest reckoning, and it is the most instructive part of the chapter.

### The case for the LHB

The original argument: Apollo impact-melt samples cluster in age around 3.8–4.0 billion years. If impacts had simply declined smoothly from the beginning, we would expect ages spread across lunar history, with the *oldest* surfaces most heavily cratered and a broad range of melt ages. A tight cluster at 3.9 Gyr suggests a discrete episode.

### The case against

Several difficulties have accumulated.

**The sampling problem — this is the serious one.** All six Apollo landing sites lie on the lunar nearside, and most are within reach of ejecta from the **Imbrium basin**, one of the largest impact structures on the Moon. If a substantial fraction of the "impact melt" samples are actually Imbrium ejecta, then they all date **one event** — and a single colossal impact would masquerade as a solar-system-wide bombardment spike. The apparent cluster could be a **selection artefact** produced by where the astronauts happened to land.

{{image: Mare Imbrium | Mare Imbrium, the vast dark basin filling much of the Moon's northwest — the scar of one of the largest impacts in lunar history. Most Apollo landing sites lie close enough to be blanketed by its ejecta, which raises an unsettling possibility: many of the "impact melt" rocks that seemed to record a solar-system-wide bombardment 3.9 billion years ago may in fact all date this single event. A dataset can be perfectly accurate and still profoundly misleading if it is not representative.}}

**Alternative interpretations of the crater record.** Some analyses of lunar and terrestrial crater populations are consistent with a **smoothly declining** bombardment — an "accretion tail" that simply took longer to fade than assumed — rather than a spike. The distinction is genuinely difficult to make from crater counts alone, because dating surfaces relies on models calibrated against the very samples in question.

**Mixed evidence from other sources.** Studies of ancient zircons from Earth, lunar meteorites (which sample the Moon more randomly than Apollo did), and asteroid samples have given results that do not cleanly confirm a sharp cataclysm.

**The current position is genuinely unsettled.** Some researchers maintain a real (if perhaps less extreme) spike; others favour a monotonic decline. Most would agree the *evidence for a sharp cataclysm is considerably weaker than it appeared in 2005.*

### So what happens to the Nice model?

Here is the question worth thinking about carefully, because the answer illustrates something important about how theories are supported. **If the LHB dissolves, does the Nice model fall with it?**

**No — and the reason is instructive.** The Nice model was *motivated* by the LHB, but it is not *supported* only by it. Recall the list above: the model also explains the giant planets' present orbits and eccentricities, the resonant structure of the Kuiper Belt (the plutinos), the Jupiter Trojans, the irregular satellites, and the depleted asteroid belt. **Those lines of evidence are independent of the lunar cratering record**, and they remain in force whatever the Moon rocks turn out to mean.

What *has* changed is the **timing.** The original model needed the instability to occur late — 500 to 700 million years after formation — precisely in order to match a 3.9 Gyr bombardment. Without that constraint, modellers are free to place the instability wherever the other evidence prefers. And the current tendency is toward an **early instability**, within the first ~100 million years, which several lines of evidence (including the survival of certain small-body populations and the terrestrial planets' orbital properties) now favour.

**So the Nice model has been decoupled from the Late Heavy Bombardment.** The instability is retained because it explains six other things; its date has been revised because the evidence that fixed it late has weakened.

### The lesson

This is a clean case study in something students rarely see stated: **the relationship between a theory and the observation that inspired it is not permanent.** A model may be invented to explain phenomenon X, then turn out to explain phenomena A through F as well — and if X later dissolves, the model can survive on the strength of A through F, suitably modified.

It also illustrates a subtler point about evidence. The Apollo samples looked like strong, direct, physical evidence — actual rocks, radiometrically dated. But **evidence is only as good as its sampling**, and six landing sites clustered on one hemisphere, possibly dominated by ejecta from one basin, may not represent the Moon. **A dataset can be entirely accurate and still profoundly misleading** if it is not representative. That is worth remembering well beyond planetary science.

And it should calibrate how you hold the contents of this chapter. Migration is **certain** — the physics is unavoidable and hot Jupiters demonstrate it. The Nice-style instability is **very likely**, given how much it explains. Its precise timing is **actively revised**. The Grand Tack is **plausible and contested**. The LHB as a sharp cataclysm is **doubtful**. Those are five different confidence levels, and a good scientific education means keeping them distinct rather than flattening them into "what the textbook says."

## Coda: the solar system as a history

Gather this chapter first, and then the whole origins story.

**We began with suspicious Moon rocks** — Apollo impact melts clustering at 3.8–4.0 Gyr, suggesting a bombardment spike some 670 million years after the solar system formed, which the smooth decline of accretion leftovers cannot produce. Something must have stored a population of small bodies and then suddenly released them.

**We established that planets migrate.** A planet embedded in a gas disk raises spiral wakes and exchanges angular momentum with it; the torques do not balance, so it moves. **Type I** migration (low-mass planets) is so fast — $10^4$–$10^5$ years — that its central puzzle is why terrestrial planets survive at all, with planet traps and thermal torques as proposed rescues. **Type II** migration (gap-opening giants, locked to the disk's viscous drainage, $10^5$–$10^6$ years) explains hot Jupiters: 51 Pegasi b formed beyond its snow line exactly as the formation story requires, and then was carried inward. **Migration is not exotic; it is the default behaviour of a planet in a gas disk.**

**We met the concept that makes migration violent.** In a **mean-motion resonance**, two planets' periods form a simple integer ratio, so their mutual tugs repeat in phase and **accumulate** rather than cancelling — the swing-pushing principle. Resonances produce the sharp features of the solar system: Kirkwood gaps, the plutinos, the Galilean moons' 4:2:1 lock, structure in Saturn's rings. And crucially, **migrating planets must sweep across resonances**, which is how gradual drift becomes sudden catastrophe.

**The Nice model applies this to our own system.** The giants began compact (Jupiter ~5.45, Saturn ~8.2, ice giants ~11–14 AU) beyond a ~35 Earth-mass planetesimal disk. Scattering planetesimals drove slow divergent migration until Jupiter and Saturn crossed the **2:1 resonance**, pumping their eccentricities and destabilizing everything. **Uranus and Neptune were flung outward** (possibly swapping places), Neptune ploughed through the planetesimal disk and scattered it into the Kuiper Belt, the Oort Cloud, interstellar space, and inward toward the terrestrial planets. **One event explains six things:** the LHB's timing, the giants' present orbits and eccentricities, the Kuiper Belt's resonant populations, the Jupiter Trojans, the irregular satellites, and the depleted asteroid belt.

**The Grand Tack closes the Mars problem.** Earlier, while gas remained, Jupiter migrated inward to ~1.5 AU, then — after Saturn caught it in 3:2 resonance and reversed the net torque — the pair **tacked back outward.** The inward excursion truncated the inner disk, starving Mars, and simulations including it reproduce Mars's actual 0.107 Earth masses. It also explains the belt's low mass and may account for the C-type asteroids there being **implanted** from beyond the snow line. Elegant, influential, and genuinely contested.

**And we confronted the twist.** The **LHB itself is now doubtful** — the Apollo samples come from six nearside sites, most plausibly dominated by **Imbrium ejecta**, so a single vast impact could masquerade as a global cataclysm. **A dataset can be perfectly accurate and still profoundly misleading if it is not representative.** But the Nice model survives, because it was *motivated* by the LHB while being *supported* by six independent lines of evidence. What has changed is the **timing**: modern versions favour an early instability. **A theory can outlive the observation that inspired it.**

With that, the origins story is complete, and its chapters form a single argument. First came the yardstick — the AU, hunted across three centuries from Le Gentil's ruined decade to radar ranging — and the thesis: *distance is destiny*. Then the Sun: 99.87% of the mass, organizing the system gravitationally, and imposing an inverse-square flux gradient that runs from 668% of Earth's illumination at Mercury to 0.11% at Neptune. Then the origin: a cold molecular cloud collapsing, and — because angular momentum is conserved — necessarily flattening into a rotating disk, which explains the solar system's flatness, its common orbital direction, and its near-circular orbits all at once. Then the boundary: the disk's temperature gradient put water's condensation point at ~2.7 AU, and because water is the most abundant condensable substance in the universe, crossing that line multiplied available solids by 2–4× — with the fossils still visible in planetary densities, the asteroid belt's composition, and the Galilean moons. Then the building of the worlds: dust to pebbles securely, then the unresolved metre-size barrier, then gravity-dominated runaway and oligarchic growth, giant impacts for the terrestrials, and core accretion plus runaway gas capture for the giants — the race that the snow line decided. This chapter set them moving.

**Here is the central claim, now fully assembled.** The solar system is **one family, born from one cloud, sorted by one variable** — and then **rearranged by its own dynamics.** Its architecture reflects two different kinds of explanation, and telling them apart is the skill the origins story exists to teach. Some features are **necessary**: the flatness (angular momentum), the rocky/giant division (the snow line and the race against disk dispersal), the compositional gradient. Run the experiment again and you would get them again. Other features are **contingent**: the particular masses of the inner planets (stochastic giant impacts), the exact positions of Uranus and Neptune (which resonance was crossed, and when), whether Mars is small (whether Jupiter tacked). Run it again and these would differ. **A complete account of a planetary system needs both — physics and history.**

Where the story goes next is comparative planetology. We now know how the worlds were made; the next chapters examine what they became — and they begin not with a planet but with a *framework*. Before looking at Mercury, Venus, Earth, the Moon, and Mars individually, we need the analytical toolkit that makes them comparable: differentiation and interior structure; heat sources and why small worlds cool fast; volcanism and tectonics; impact cratering as a *clock* for dating surfaces; how atmospheres are acquired, retained, and lost; the greenhouse effect; and magnetic fields and the dynamo. **That framework is what turns five worlds from a catalogue into five controlled experiments in the same physics** — and it is what will let us answer why Venus roasts, why Mars died, and why Earth alone remained habitable.

## Further reading

- Any modern planetary-science treatment of planetary migration, mean-motion resonances, the Nice model, and the Grand Tack will cover the material of this chapter. Note that this is one of the fastest-moving areas in the field — the Nice model dates to 2005, the Grand Tack to 2011, and the challenges to the Late Heavy Bombardment are more recent still — so older textbooks present a picture that has since shifted considerably; prefer recent editions and review articles.
- The original Nice-model papers (published as a trio in *Nature* in 2005) and the Grand Tack paper (2011) are readable entry points into the primary literature, and the ongoing debate over the lunar cataclysm is well covered in review articles on lunar chronology.

## Problems

*The migration set. Problem 2 (resonance) is the enabling concept; problem 4 (the Nice model's explanatory scope) is the core; problem 6 (the Grand Tack) closes the Mars problem; problem 8 (the status of the LHB) is the most interesting problem in the set and asks for genuine scientific judgement; problem 9 synthesizes the entire origins story. Full worked answers follow.*

**1 — Migration mechanisms.**
**(a)** Explain how a planet embedded in a gas disk exchanges angular momentum with it. Why do the inner and outer wakes push in opposite directions, and which usually wins?
**(b)** Distinguish Type I from Type II migration: which planets, what mechanism, what timescale.
**(c)** Why is Type I migration considered a *problem* rather than merely a phenomenon? Name two proposed mitigations.
**(d)** How does Type II migration explain hot Jupiters, and why does this *rescue* rather than refute the snow-line theory?

**2 — Resonance. (Enabling concept.)**
**(a)** Define a mean-motion resonance.
**(b)** Explain why resonant perturbations *accumulate* while non-resonant ones average out. Use an everyday analogy.
**(c)** Give three examples of resonances operating in the solar system today.
**(d)** Explain why migration makes resonance crossings *inevitable*, and why this converts gradual drift into potential catastrophe.

**3 — Jupiter and Saturn's resonance. (Quantitative.)** Jupiter's orbital period is 11.86 years.
**(a)** What period would Saturn need for a 2:1 resonance with Jupiter?
**(b)** Using Kepler's third law, at what semi-major axis would Saturn then orbit?
**(c)** Saturn is actually at 9.58 AU with a period of 29.46 years. Compute the current period ratio and state which resonance it is near.
**(d)** What does the comparison of (b) and (c) tell you about Saturn's history?

**4 — The Nice model. (Core.)**
**(a)** Describe the initial configuration: where were the giants, and what lay beyond them?
**(b)** Explain the slow phase — why do Neptune, Uranus, and Saturn migrate outward while Jupiter migrates inward?
**(c)** Describe what happens when Jupiter and Saturn cross the 2:1 resonance.
**(d)** List the six phenomena the model explains, and identify which of them are *independent* of the lunar cratering record.

**5 — Kuiper Belt resonances as a test.** The Nice model predicts that objects were *captured* into resonances as Neptune migrated outward.
**(a)** What is a plutino, and what resonance is it in?
**(b)** Explain how outward migration of Neptune captures objects into resonance.
**(c)** Why does the existence of these populations constitute a genuine test rather than a restatement of the model?

**6 — The Grand Tack and the Mars problem. (Closes the Mars problem.)**
**(a)** Restate the Mars problem quantitatively.
**(b)** Describe the Grand Tack sequence, explaining what causes the reversal.
**(c)** How does it solve the Mars problem?
**(d)** How does it modify the snow-line interpretation of the asteroid belt's composition? Does this contradict that account or refine it?

**7 — Necessity versus contingency.** The origins story contains two kinds of explanation.
**(a)** Give three features of the solar system that are *necessary* consequences of physics, with the physics in each case.
**(b)** Give three features that are *contingent* — accidents of a particular history.
**(c)** Why does a complete account of a planetary system require both kinds of explanation?

**8 — Is the LHB real? (Requires judgement.)**
**(a)** State the original evidence for the Late Heavy Bombardment.
**(b)** Explain the sampling problem with the Apollo data. Why is this a serious objection?
**(c)** If the LHB is not real, does the Nice model fall? Justify your answer carefully.
**(d)** What general lesson does this episode teach about (i) the relationship between a theory and its motivating observation, and (ii) the reliability of accurate-but-unrepresentative data?

**9 — Synthesis (the origins story entire).** In four or five paragraphs, synthesize the whole origins story: the establishment of scale and the thesis that distance is destiny; the Sun's gravitational dominance and flux gradient; the collapse of a cloud into a rotating disk and why flatness is inevitable; the temperature gradient and the snow line, with its fossil evidence; accretion from dust to worlds, including the metre-size barrier and the race that decided planet types; and migration, resonance, and the rearrangement of the system. Conclude by articulating the central claim about necessity and contingency, and explain what it means to treat a planetary system as a *causal history* rather than a catalogue. This is the capstone essay for the origins story.

## Worked answers

### 1 — Migration mechanisms

**(a)** The planet's gravity perturbs the disk, raising **spiral density waves** (wakes) both interior and exterior to its orbit. These overdense regions have mass and pull gravitationally back on the planet. Material **interior** to the orbit moves faster (Kepler) and runs ahead, pulling the planet **forward** — adding angular momentum, pushing it outward. Material **exterior** moves slower and trails, pulling the planet **backward** — removing angular momentum, dragging it inward. The torques do not balance; in most disk models the **outer torque wins**, giving net **inward** migration.

**(b)** **Type I:** low-mass planets (below ~10–20 $M_\oplus$) that do not significantly disturb the disk; migration driven by the unbalanced wake torques described above; timescale **$10^4$–$10^5$ years** for an Earth-mass planet at 1 AU. **Type II:** massive (roughly Jupiter-mass) planets that **open a gap** in the disk; the planet becomes locked to the disk's own **viscous evolution** and is carried inward with the draining gas; timescale **$10^5$–$10^6$ years**.

**(c)** Because it is *too fast*. At $10^4$–$10^5$ years against a disk lifetime of 3–10 Myr, Type I migration would sweep growing embryos into the star many times over — predicting that inner planetary systems should be swept clean and terrestrial planets should not exist. Two mitigations: (1) **planet traps** — at pressure bumps and disk transitions the net torque can reverse, stalling migration at particular radii (note the link to the dust traps of the accretion story); (2) **thermal torques** arising from the planet's own accretion luminosity heating nearby gas, which can oppose inward migration. (Also acceptable: embryos assembling mostly after gas dispersal.)

**(d)** A giant forms beyond the snow line where the formation story requires, opens a gap, and is then carried inward with the viscously accreting disk — potentially from ~5 AU to ~0.05 AU. This **rescues** the snow-line theory because that theory concerns *where giants form*, and it was never wrong: 51 Pegasi b did form beyond its star's snow line. What was wrong was the unstated extra assumption that planets **remain** where they form. Removing that assumption preserves the formation theory intact.

### 2 — Resonance

**(a)** Two bodies are in a **mean-motion resonance** when their orbital periods form a ratio of small integers (2:1, 3:2, etc.), so that one completes exactly $n$ orbits while the other completes $m$.

**(b)** In a non-resonant configuration, the relative geometry of two planets shifts continuously, so the direction of their mutual tug varies over successive encounters and the perturbations largely **cancel**. In resonance, the geometry **repeats**: they return to the same relative positions at the same orbital phases, so each tug is applied in the same direction at the same point, over and over, and the effects **add coherently**. Analogy: **pushing a child on a swing** — individually feeble pushes, applied at the right moment each cycle, accumulate into a large amplitude; the same pushes at random moments accomplish nothing.

**(c)** Any three of: the **Kirkwood gaps** in the asteroid belt (Jupiter resonances); **Pluto and the plutinos** in 3:2 with Neptune; the **Galilean moons** Io–Europa–Ganymede in a 4:2:1 Laplace resonance (which maintains eccentricities and powers tidal heating); **gaps in Saturn's rings** sculpted by moon resonances.

**(d)** Migration changes orbital periods, and therefore changes the *ratio* of periods between planets. Since resonances occur at specific ratios, a migrating pair must **sweep through** them. While in resonance, mutual perturbations accumulate coherently and can pump eccentricities dramatically over a short time. So migration guarantees resonance encounters, and resonance encounters can destabilize an entire system — converting slow drift into sudden catastrophe.

### 3 — Jupiter and Saturn's resonance

**(a)** 2:1 means Saturn's period is twice Jupiter's: $T_S = 2 \times 11.86 = \mathbf{23.7\ years}$.

**(b)** By Kepler's third law ($a = T^{2/3}$ with $T$ in years, $a$ in AU): $a = 23.7^{2/3} = \mathbf{8.26\ AU}$.

**(c)** Current ratio: $29.46 / 11.86 = \mathbf{2.483}$ — very close to **5:2** (= 2.5), the "great inequality" of Jupiter and Saturn, not 2:1.

**(d)** Saturn currently orbits at **9.58 AU**, well *outside* the 8.26 AU that would place it in 2:1 resonance with Jupiter. Since the Nice model has the pair *diverging* (Jupiter drifting slightly inward, Saturn outward), Saturn must have been **closer in previously** and **crossed** the 2:1 resonance on its way out — exactly the trigger the model requires. Saturn's present position is therefore evidence that it moved outward past the resonance.

### 4 — The Nice model

**(a)** The giants began in a **compact configuration**: Jupiter ~5.45 AU, Saturn ~8.2 AU, Uranus and Neptune ~11–14 AU (versus today's 5.20, 9.58, 19.19, 30.07). Beyond them lay a **massive planetesimal disk** of roughly **35 Earth masses** of icy debris extending to ~35 AU — the leftover material of the slow outer-system accretion.

**(b)** The giants scatter planetesimals, and each scattering exchanges angular momentum. **Neptune, Uranus, and Saturn** predominantly scatter objects *inward* (they are not massive enough to eject most bodies), so they **gain** angular momentum and drift **outward**. **Jupiter**, being massive enough to **eject** objects from the solar system entirely, **loses** angular momentum and drifts slightly **inward**. The net effect is slow **divergent migration** over hundreds of millions of years.

**(c)** Their period ratio reaches 2:1, and their mutual perturbations begin accumulating coherently. Their **eccentricities are pumped up** rapidly. The now-eccentric Jupiter and Saturn destabilize the ice giants: **Uranus and Neptune are flung outward** onto eccentric orbits (possibly swapping places) and plunge into the planetesimal disk. Neptune ploughing through ~35 $M_\oplus$ of debris scatters it comprehensively — outward into the Kuiper Belt, to great distances forming the Oort Cloud, out of the system entirely, and **inward** toward the terrestrial planets. As the disk is consumed, interactions damp the giants' eccentricities and they settle near their present orbits.

**(d)** The six: (1) LHB timing; (2) the giants' present orbits, eccentricities, and inclinations; (3) Kuiper Belt resonant populations (plutinos); (4) Jupiter Trojans; (5) irregular satellites of the giants; (6) the depleted asteroid belt. **Independent of lunar cratering: (2), (3), (4), (5), and (6)** — five of the six. Only (1) depends on the Moon rocks. This is precisely why the model survives challenges to the LHB.

### 5 — Kuiper Belt resonances as a test

**(a)** A **plutino** is a Kuiper Belt object locked in a **3:2 mean-motion resonance with Neptune** — completing two orbits for Neptune's three. **Pluto** is the largest and namesake member.

**(b)** As Neptune migrates outward, its resonance locations (which are at fixed period ratios, hence fixed distance ratios from Neptune) **sweep outward with it**, moving through the planetesimal disk. When a resonance sweeps across an object, the object can be **captured** into it and thereafter carried along, remaining in resonance as Neptune continues to migrate. This "resonance sweeping and capture" concentrates objects into resonant populations.

**(c)** Because it is a **prediction about a population that need not have existed.** If the planets had formed in place, there would be no mechanism to preferentially populate resonances — objects would be distributed smoothly, with resonant locations if anything *depleted* (as in the Kirkwood gaps, where Jupiter's resonances *clear* the belt). Finding a substantial population *concentrated into* the 3:2 resonance, along with other resonant groups, is a distinctive signature of **outward migration** specifically. The model was not built to explain the plutinos; it explains them as a consequence, which makes them a genuine test rather than a restatement.

### 6 — The Grand Tack and the Mars problem

**(a)** Mars is **0.107 Earth masses**, but standard simulations of terrestrial planet formation from a smooth disk produce a planet at ~1.5 AU that is **five to ten times more massive** (often near Earth's mass). Mars's small size implies the disk was strongly **depleted or truncated** near 1 AU.

**(b)** **(1)** Jupiter forms around 3.5 AU and, as a gap-opening giant, undergoes **Type II migration inward**, reaching about **1.5 AU** and scattering inner-disk material as it goes. **(2)** Saturn forms later and migrates inward *faster*, catching Jupiter and becoming locked in a **3:2 resonance**. **(3)** With both planets now sharing a common gap, the torque balance changes and the pair experiences a **net outward torque**, so they **reverse and migrate outward together** ("tacking," as a sailing ship reverses course), until the gas disperses, leaving Jupiter near 5.4 AU.

**(c)** Jupiter's inward excursion **scatters away material beyond about 1 AU**, truncating the inner disk. When the terrestrial planets subsequently assemble by giant impacts, Earth and Venus form from a well-supplied inner region while Mars forms at the **edge** of the truncated disk with little material available — and therefore remains small. Simulations including the Grand Tack reproduce Mars's actual mass, which standard models could not.

**(d)** The snow-line account established a compositional gradient across the belt (dry S-types inner, wet C-types outer) and attributed it to where wet and dry bodies condensed. The Grand Tack proposes that Jupiter, on its excursion, **scattered bodies from beyond the snow line inward and implanted them in the belt** — so the C-types may be **immigrants** rather than natives. This **refines rather than contradicts** the earlier account: the snow line is still real and still explains where wet and dry bodies *formed*; what changes is the assumption that the belt's objects formed at their present locations. It is the same lesson as hot Jupiters — formation location need not equal final location — applied to small bodies.

### 7 — Necessity versus contingency

**(a)** Any three: **(i) The solar system is flat** — because a rotating cloud collapses freely along its rotation axis but is halted by rotation in its equatorial plane (conservation of angular momentum). **(ii) The rocky/giant division** — because the disk's temperature gradient placed water's condensation point at ~2.7 AU, and the resulting jump in solid surface density determined which bodies could build a critical core before the gas dispersed. **(iii) All planets orbit in the same direction and near-circularly** — inherited from the disk's rotation and damped by collisions. (Also acceptable: the compositional gradient in the asteroid belt and Galilean moons; the Sun's dominance following from central concentration during collapse.)

**(b)** Any three: **(i) The specific masses and number of terrestrial planets** — outcomes of the chaotic, stochastic giant-impact phase. **(ii) The present positions of Uranus and Neptune** — determined by which resonance was crossed, when, and with how much planetesimal disk remaining, and possibly involving a swap. **(iii) Mars's small mass** — depending on whether Jupiter made a Grand Tack excursion. (Also: the existence and size of Earth's Moon; the capture of particular Trojans and irregular satellites.)

**(c)** Because the two answer different questions. Necessity explains the **robust architecture** — the features you would expect to recur in any similar system, and which therefore let us generalize to exoplanets. Contingency explains the **particulars** — the specific configuration of *this* system, which could have been otherwise and which cannot be derived from physics alone. A purely necessitarian account would wrongly predict that all planetary systems resemble ours (they do not, as the exoplanet statistics showed); a purely contingent account would make our system a bare accident and forfeit any explanatory power. **A complete account states which features are law-governed and which are historical, and the boundary between them is itself a scientific result.**

### 8 — Is the LHB real?

**(a)** Radiometric dating of **impact melt rocks** from the Apollo (and Luna) samples showed ages **clustering tightly around 3.8–4.0 Gyr**, rather than spreading across lunar history. Since the solar system formed 4.568 Gyr ago, this implied a **spike** of intense bombardment roughly 600–700 Myr later — far too late to be explained by the smoothly declining sweep-up of accretion leftovers.

**(b)** All Apollo landing sites are on the lunar **nearside**, and most lie within reach of ejecta from the **Imbrium basin**, one of the largest lunar impact structures. If a substantial fraction of the dated "impact melts" are actually Imbrium ejecta, they all record **a single event** — and one enormous impact would masquerade as a solar-system-wide bombardment spike. This is serious because it means the apparent cluster may be a **selection artefact of where humans happened to land**, not a property of the Moon. The samples themselves may be perfectly accurate; the inference from them to a global cataclysm is what fails.

**(c)** **No.** The Nice model was *motivated* by the LHB but is *supported* by six lines of evidence, five of which are entirely independent of lunar cratering: the giants' present orbits and eccentricities, the Kuiper Belt's resonant populations, the Jupiter Trojans, the irregular satellites, and the depleted asteroid belt. Those remain in force whatever the Moon rocks mean. What **does** change is the **timing**: the original model placed the instability late (500–700 Myr) *specifically* to match a 3.9 Gyr bombardment. Remove that constraint and the instability can be placed wherever other evidence prefers — and modern versions increasingly favour an **early** instability (within ~100 Myr). So the model is **retained but decoupled** from the LHB and re-dated.

**(d)** **(i)** The relationship between a theory and its motivating observation is **not permanent**. A model invented to explain phenomenon X may turn out to explain A–F as well; if X later dissolves, the model can survive on A–F, suitably modified. Explanatory *scope* acquired after the fact provides support independent of the original motivation. **(ii)** **Accurate data can be profoundly misleading if unrepresentative.** The Apollo ages are correct measurements of real rocks; the problem is that six nearside sites, possibly dominated by one basin's ejecta, may not represent the Moon. Sample quality and sample *representativeness* are separate virtues, and the second is easier to overlook — a lesson that generalizes far beyond planetary science.

### 9 — Synthesis (model essay: the origins story entire)

**The origins story set out to explain the architecture of the solar system rather than catalogue it, and it did so by tracing a single causal chain from a cold cloud of gas to the arrangement of worlds we observe.** It began with scale, because scale is the independent variable. The astronomical unit was recovered — hunted across three centuries, from the eighteenth-century transit expeditions that cost Guillaume Le Gentil eleven years and everything he owned, to the radar echo off Venus in 1961 that settled it to parts per million — and it established the thesis: *distance is destiny*. Then came the body that imposes that destiny. The Sun holds **99.87%** of the system's mass, which is why the planets' orbits are nearly independent two-body problems and why Kepler's laws work at all; and it imposes an inverse-square flux gradient running from 668% of Earth's illumination at Mercury to **0.11%** at Neptune. That gradient is the master variable of the entire story.

**Next came the origin and the boundary.** A giant molecular cloud — 10–20 K, tens of light-years across, and so tenuous it is a thousand trillion times thinner than air — collapses when gravity overcomes thermal pressure. Because every cloud rotates a little and angular momentum is conserved, collapse proceeds **freely along the rotation axis** but is **halted in the equatorial plane**, so a sphere necessarily becomes a disk. That single consequence explains simultaneously why the solar system is flat, why all planets orbit in one direction, why the Sun rotates the same way, and why the orbits are near-circular — Kant's four regularities, deduced in 1755 and photographed by ALMA in 2014. Then the boundary that mattered most. The disk's temperature fell with distance, and materials condense in a fixed sequence; water ice condenses below ~170 K, which a two-line calculation places at **2.71 AU**. Because water is the most abundant condensable substance in the universe — outweighing all rock and metal combined — crossing that line **multiplied the available solids by a factor of 2 to 4**. The fossils are still visible: the clean density division among the planets, the wet/dry compositional gradient across the asteroid belt, and the Galilean moons reproducing the whole pattern in miniature around Jupiter.

**Then the worlds were built, with honesty about where the building fails.** Growth from micron dust to planets spans forty orders of magnitude in mass. The first stage is secure — grains stick by van der Waals forces, and we hold the products as chondrules dated to 4.567 Gyr. The last stages are secure — above a kilometre, gravitational focusing gives large bodies effective cross-sections thousands of times their geometric ones, driving runaway growth, then oligarchy, then a chaotic giant-impact phase that finished the terrestrial planets over 30–100 Myr in a gas-free environment (which is exactly why they hold no primordial envelopes). But in the middle lies the **metre-size barrier**: bodies of that size bounce rather than stick, and worse, feel a headwind from sub-Keplerian gas that spirals them into the Sun in a few hundred years — ten thousand times faster than the disk survives. The leading resolution, the streaming instability, turns the problem into its own solution by having drifting pebbles concentrate and collapse directly into 100 km planetesimals, skipping the dangerous scale. Meanwhile the giants won the race the snow line had set up: cores of ~10 Earth masses triggering runaway gas accretion, with Uranus and Neptune as the planets that almost won.

**Finally, this chapter removed the assumption everything had quietly rested on: that planets stay put.** Embedded in a gas disk, a planet exchanges angular momentum with it and migrates — fast. Type II migration carries gap-opening giants inward with the draining disk, which is how hot Jupiters reach 0.05 AU, rescuing rather than refuting the snow-line theory. And because migration changes period ratios, migrating planets inevitably sweep through **resonances**, where mutual tugs repeat in phase and accumulate like pushes on a swing. The Nice model applies this to our own system: giants beginning compact beyond a 35 Earth-mass planetesimal disk, drifting apart until Jupiter and Saturn crossed the 2:1 resonance, whereupon eccentricities were pumped, Uranus and Neptune were flung outward, and the planetesimal disk was scattered into the Kuiper Belt, the Oort Cloud, and the inner solar system. One event explains six phenomena. The Grand Tack, earlier, has Jupiter migrating in to 1.5 AU and back out, truncating the inner disk and finally accounting for Mars's stunted mass. And in a lesson worth as much as the content, the **Late Heavy Bombardment that motivated the whole model is now doubtful** — the Apollo ages may be an artefact of six nearside landing sites sampling one basin's ejecta — yet the model survives on its five independent lines of support, with only its timing revised.

**The central claim is that a planetary system requires two kinds of explanation, and that distinguishing them is the real intellectual work.** Some features are **necessary**: the flatness follows from conservation of angular momentum; the rocky/giant division follows from the abundance of water and the finite lifetime of the gas disk. Run the experiment again and these recur — which is why they generalize to the thousands of exoplanet systems now known. Other features are **contingent**: the specific masses of the inner planets emerged from a chaotic impact phase; the positions of Uranus and Neptune depended on which resonance was crossed and when; Mars is small perhaps only because Jupiter happened to tack. Run the experiment again and these would differ. To treat a planetary system as a **causal history** rather than a catalogue is precisely to sort its features into these two categories — to ask of every fact whether it had to be so or merely happened to be so. That is what the origins story has been for, and it is the equipment we carry forward, as five rocky worlds that formed under the same physics are shown to have diverged into radically different fates.$astroMig_master$,
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

with q as (
  select $astroMig_quiz$[{"id": "q1", "type": "mcq", "prompt": "Why does a planet embedded in a gas disk migrate, rather than staying on a fixed orbit?", "options": ["The disk's gas drag simply slows the planet like air resistance", "The planet's gravity raises spiral density wakes in the disk on both sides of its orbit; the inner wake (faster-orbiting material running ahead) pulls it forward and outward, the outer wake (slower material trailing) pulls it backward and inward, and these torques do not balance \u2014 in most disks the outer torque wins, so the planet loses angular momentum and migrates inward", "The Sun's radiation pressure pushes the planet outward over time", "Collisions with planetesimals randomly kick the planet around"], "answerIndex": 1, "explanation": "A planet alone around a star stays put \u2014 that is exact for two bodies. But a young planet sits in a massive gas disk, and its gravity perturbs that disk, raising overdense spiral wakes interior and exterior to its orbit. Those wakes have mass and pull back gravitationally. Material interior to the orbit moves faster (Kepler) and runs ahead, pulling the planet forward and adding angular momentum (pushing it out); material exterior moves slower and trails, pulling it back and removing angular momentum (dragging it in). If these balanced, nothing would happen \u2014 but they don't, and in most disk models the outer torque dominates, giving net inward migration. So migration is not exotic drag; it is the unavoidable, generally unbalanced angular-momentum exchange between a planet and the disk it is born in."}, {"id": "q2", "type": "mcq", "prompt": "How does Type II migration explain hot Jupiters, and why does this rescue rather than refute the snow-line theory?", "options": ["Hot Jupiters formed close to their stars from unusually hot disks", "A giant forms beyond the snow line (as required), opens a gap in the disk, and then \u2014 locked to the disk's own inward viscous drainage \u2014 is carried inward with it, potentially from 5 AU to 0.05 AU. The snow-line theory concerns WHERE giants form and was never wrong (51 Peg b did form beyond its snow line); the false assumption was that planets STAY where they form", "Hot Jupiters are a different kind of object that never migrated", "The star's tides pulled the giant inward after the disk dispersed"], "answerIndex": 1, "explanation": "Once a planet exceeds ~a Jupiter mass it clears an annular gap in the disk, so it is no longer subject to unbalanced local torques; instead it is locked to the disk's slow viscous accretion inward and carried along like a log in a river \u2014 Type II migration, on a 10^5\u201310^6-year timescale. A giant that formed beyond the snow line, as core accretion requires, can thus be delivered to 0.05 AU. This rescues the snow-line theory because that theory only ever claimed to say where giants form, and it was right: 51 Pegasi b did form beyond its star's snow line. The tacit extra assumption \u2014 that a planet remains at its birthplace \u2014 is what had to be discarded. Where a planet forms and where it ends up are two different questions."}, {"id": "q3", "type": "mcq", "prompt": "Why do gravitational tugs between two planets in a mean-motion resonance accumulate, while ordinary planetary tugs cancel out?", "options": ["Resonant planets are physically closer, so their gravity is stronger", "In resonance the orbital periods form a simple integer ratio, so the planets keep meeting at the same relative geometry \u2014 the tug is applied in the same direction at the same orbital phase over and over, and the effects add coherently instead of averaging away. It is the swing-pushing principle: feeble pushes timed to each cycle build a large amplitude", "Resonance increases the mass of the planets involved", "Resonant orbits are unstable, so any tug grows exponentially by itself"], "answerIndex": 1, "explanation": "Normally two planets' relative geometry drifts continuously, so the direction of their mutual tug varies over successive encounters and the perturbations largely cancel \u2014 which, given the Sun's dominance, is why planets usually ignore one another. In a mean-motion resonance the periods form a ratio of small integers (2:1, 3:2), so the encounters repeat: the planets return to the same relative positions at the same orbital phases again and again, and each tug lands in the same place. Applied coherently over thousands of orbits, a tiny force produces enormous cumulative effects on eccentricity and inclination \u2014 exactly like pushing a child on a swing, where individually feeble pushes at the right moment each cycle build a large swing, while the same pushes at random moments accomplish nothing. Resonance is how weak gravitational interactions become structurally decisive."}, {"id": "q4", "type": "mcq", "prompt": "In the Nice model, what triggers the system-wide instability, and what are its main consequences?", "options": ["A passing star pulls the giants onto new orbits", "Slow planetesimal-driven divergent migration carries Jupiter and Saturn until their period ratio reaches 2:1; crossing that resonance pumps their eccentricities, which destabilizes the ice giants \u2014 Uranus and Neptune are flung outward (Neptune possibly past Uranus, swapping), Neptune ploughs through the 35-Earth-mass debris disk and scatters it into the Kuiper Belt, the Oort Cloud, and inward at the planets, before the system damps and settles", "Jupiter's core collapses, releasing energy that reshapes the system", "The Sun's mass loss loosens the giants' orbits all at once"], "answerIndex": 1, "explanation": "The giants begin compact (all within ~15 AU) beyond a massive planetesimal disk. Scattering that debris drives slow divergent migration \u2014 Saturn and the ice giants drift out, Jupiter creeps in \u2014 over hundreds of millions of years, steadily raising Jupiter and Saturn's period ratio. When it reaches 2:1, their coherent resonant tugs pump their eccentricities, and the now-eccentric giants destabilize the outer system. Uranus and Neptune are thrown outward onto wild orbits (Neptune, perhaps formed inside Uranus, likely hurled past it \u2014 a swap), plunging into the debris disk. Neptune scatters those 35 Earth masses everywhere: outward into the Kuiper Belt, to great distances as the Oort Cloud, out of the system, and inward toward the terrestrial planets (the original explanation for the Late Heavy Bombardment). As the disk is consumed, the eccentricities damp and the planets settle near their present orbits. One event rearranged the outer solar system."}, {"id": "q5", "type": "mcq", "prompt": "The Late Heavy Bombardment, which the Nice model was built to explain, is now doubtful. Why does the Nice model survive anyway?", "options": ["Because new Moon rocks have confirmed the bombardment after all", "Because the model was MOTIVATED by the LHB but is SUPPORTED by six lines of evidence, five of which \u2014 the giants' orbits and eccentricities, the Kuiper Belt's resonant plutinos, the Jupiter Trojans, the irregular satellites, and the depleted asteroid belt \u2014 are entirely independent of the lunar record. Those remain in force whatever the Moon rocks mean; only the instability's TIMING is revised (now favouring an early instability)", "Because the Nice model does not actually predict any bombardment", "Because the LHB challenge has been fully refuted"], "answerIndex": 1, "explanation": "The LHB may be a sampling artefact: all six Apollo sites are on the nearside, most within reach of Imbrium-basin ejecta, so one colossal impact could masquerade as a global spike \u2014 a dataset that is perfectly accurate yet unrepresentative. But the Nice model does not depend on it. Beyond the bombardment timing, the same single instability explains the giants' present orbits and eccentricities, the resonant Kuiper Belt populations (the plutinos captured as Neptune migrated), the Jupiter Trojans, the giants' irregular satellites, and the depleted asteroid belt \u2014 five things with nothing to do with lunar cratering. So the model is decoupled from the LHB and retained for its independent explanatory scope; what changes is the timing, with modern versions favouring an early instability (within ~100 Myr). The lesson: a theory can outlive the observation that inspired it, surviving on explanatory power acquired after the fact."}, {"id": "q6", "type": "open", "prompt": "Explain the two-step logic that turns gentle planetary migration into a system-wide catastrophe: first the physics of migration (Type I vs Type II), then mean-motion resonance and why migration makes resonance crossings inevitable. Then apply it to the Nice model, listing the six phenomena one instability explains and noting which depend on the lunar record.", "rubric": "MIGRATION PHYSICS: a planet in a gas disk raises spiral density wakes; the inner wake pulls it outward, the outer wake inward, and the unbalanced torque (outer usually wins) makes it migrate \u2014 generally inward. TYPE I (low-mass planets, below ~10\u201320 Earth masses): driven by the unbalanced wake torques; VERY FAST, 10^4\u201310^5 yr for an Earth-mass planet \u2014 so fast it should sweep embryos into the star before the disk clears (a genuine problem, mitigated by planet traps / thermal torques / late assembly). TYPE II (gap-opening giants, ~Jupiter mass): the planet clears a gap and locks to the disk's own viscous inward drainage, carried along at 10^5\u201310^6 yr \u2014 this is how hot Jupiters reach 0.05 AU (rescuing, not refuting, the snow-line theory: they formed beyond the snow line and then moved). RESONANCE: two planets are in a mean-motion resonance when their periods form a small-integer ratio (2:1, 3:2); then their encounters REPEAT at the same geometry, so mutual tugs are applied in phase and ACCUMULATE (the swing-pushing analogy) rather than averaging away. WHY MIGRATION \u2192 RESONANCE CROSSINGS: migration changes orbital periods, hence the ratio between planets, so a migrating pair must sweep THROUGH resonances; while inside, perturbations add coherently and can pump eccentricities dramatically \u2014 converting slow drift into sudden catastrophe. THE NICE MODEL: giants begin compact beyond a ~35 Earth-mass planetesimal disk; scattering drives slow divergent migration until Jupiter and Saturn cross the 2:1 resonance; eccentricities spike, Uranus and Neptune are flung outward (Neptune possibly past Uranus, a swap), the disk is scattered into the Kuiper Belt, Oort Cloud, out of the system, and inward. THE SIX PHENOMENA: (1) the LHB timing; (2) the giants' present orbits/eccentricities/inclinations; (3) the Kuiper Belt's resonant populations (plutinos); (4) the Jupiter Trojans; (5) the giants' irregular satellites; (6) the depleted asteroid belt. Only (1) depends on the lunar cratering record; (2)\u2013(6) are independent \u2014 which is why the model survives challenges to the LHB. A strong answer connects the whole chain and notes the model's timing is now revised while its instability is retained."}, {"id": "q7", "type": "open", "prompt": "Unit I distinguishes two kinds of explanation for a planetary system: NECESSITY and CONTINGENCY. Define each, give at least three examples of each drawn from across Unit I (with the responsible physics or history), and explain why a complete account of a planetary system \u2014 and of why ours differs from most exoplanet systems \u2014 requires both.", "rubric": "THE DISTINCTION: NECESSARY features are robust consequences of physics that would recur if you re-ran the formation of a similar system; CONTINGENT features are accidents of a particular history that could easily have gone otherwise. NECESSARY (any three, with physics): (a) the solar system is FLAT \u2014 a rotating cloud collapses freely along its spin axis but is halted by rotation in the equatorial plane (conservation of angular momentum, L3); (b) all planets orbit the same direction on near-circular orbits \u2014 inherited from the disk's rotation and damped by collisions (L3); (c) the ROCKY/GIANT DIVISION \u2014 the temperature gradient placed water's condensation at ~2.7 AU, and because water is abundant the resulting jump in solids decided which bodies could build a critical core before the gas dispersed (L4, L5); (d) the compositional gradient in the asteroid belt / Galilean moons (the snow line, L4); (e) the Sun holding ~all the mass (central concentration during collapse, L2/L3). CONTINGENT (any three, with history): (a) the specific masses and number of terrestrial planets \u2014 the chaotic, stochastic giant-impact phase (L5); (b) the present positions of Uranus and Neptune \u2014 which resonance was crossed, when, and with how much disk left, possibly involving a swap (L6); (c) whether Mars is small \u2014 whether Jupiter made a Grand Tack excursion (L5/L6); (d) the existence/size of Earth's Moon (a particular giant impact); (e) the capture of particular Trojans and irregular satellites (L6). WHY BOTH ARE NEEDED: necessity explains the robust architecture that lets us GENERALIZE to other systems; contingency explains the PARTICULARS of this one, which cannot be derived from physics alone. A purely necessitarian account would wrongly predict all systems resemble ours \u2014 but L4's exoplanet statistics show they do not (hot Jupiters, and super-Earths/mini-Neptunes that our system lacks entirely, are common; our specific architecture is NOT typical). A purely contingent account would make our system a bare accident and forfeit explanatory/predictive power. So a complete account states which features are law-governed and which are historical \u2014 and the boundary between them is itself a scientific result. WHY OURS DIFFERS: the necessary physics (snow line, core accretion) operates everywhere and is confirmed statistically (giants beyond the snow line, more giants around metal-rich stars), but the contingent outcome (migration histories, stochastic impacts, whether/when instabilities occurred) varies system to system \u2014 so our particular arrangement is one draw among many. A strong answer frames 'treating a system as a causal history rather than a catalogue' as exactly the work of sorting features into necessary vs contingent."}]$astroMig_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/origins/migration-and-the-nice-model', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
