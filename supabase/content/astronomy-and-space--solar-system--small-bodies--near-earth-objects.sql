-- Astronomy & Space · The Solar System — Small Bodies —
-- "Near-Earth Objects and Planetary Defence". Curated, human-reviewed master for
-- astronomy-and-space/solar-system/small-bodies/near-earth-objects @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The one preventable catastrophe; DART, keyholes, and survey completeness.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/small-bodies/near-earth-objects',
    'research',
    'advanced',
    'read',
    $astroNEO_master$> Every other catastrophe the sky can deliver is a thing to be understood and endured; this one is a thing that could be prevented outright. An asteroid on a collision course obeys Newtonian mechanics exactly — its path can be computed years ahead with the precision of a clock, and a nudge of a few centimetres per second, applied early enough, converts a direct hit into a clean miss. It is the only natural disaster large enough to end a civilisation that a sufficiently attentive civilisation could cancel entirely: not survive, not mitigate, but prevent. And it is now, uniquely among the subjects in this account, a field with an experimental result — in September 2022 a spacecraft struck an asteroid on purpose, and the asteroid moved more than the models said it should. The physics is settled and partly flown; the impact record is written into the rocks, into the fossil record, and once across two thousand square kilometres of Siberian forest. What stands between us and the preventable version of this catastrophe is not a gap in physics or engineering but a gap in the *catalogue* — the list of what is out there and where it is going — and that gap is not a law of nature. It is a line in a budget.

## The one we were watching, and the one that hit

On **15 February 2013**, the astronomical community had a date in the diary.

Asteroid **2012 DA14** — about 30 metres across, discovered a year earlier and tracked ever since — was due to pass **27,700 km** from Earth, inside geostationary orbit. It was a well-publicised, entirely safe close approach, and telescopes across the world were pointed at it: a modest demonstration that the system worked, the object found, its orbit computed, its position known to a margin far smaller than the Earth itself.

**Sixteen hours before that close approach, a completely unrelated object exploded over the southern Urals.**

The **Chelyabinsk** impactor was about **20 metres** across and massed roughly 13,000 tonnes. It entered at about 19 km/s and detonated at an altitude of around 30 km with an energy of **roughly 500 kilotonnes of TNT** — some thirty times the Hiroshima bomb. The airburst blew in windows across six cities and damaged some 7,200 buildings. About **1,500 people were injured**, almost all by flying glass, most because they had gone to their windows to look at the brilliant light.

**Nobody saw it coming** — not hours before, not ever. It approached from within about 15° of the Sun, out of the daytime sky, from the one direction no ground-based survey can look.

{{image: Chelyabinsk meteor | The Chelyabinsk fireball's smoke trail over the Urals on 15 February 2013; the roughly twenty-metre object arrived from within about fifteen degrees of the Sun and so was completely undetected until it began to glow in the atmosphere.}}

The two objects were entirely unrelated, on different orbits, and their proximity in time was chance. But as an illustration the coincidence could hardly be improved:

> **On the day the world proved it could track an asteroid, an asteroid it could not track hit it.**

That is the whole argument in one sentence. Our capability is real and incomplete, and the incompleteness is not evenly spread — there is a specific, known, structural blind spot, and something came out of it.

## Three impacts, at three scales

Impacts are not one phenomenon. The physics, consequences and recurrence intervals span so many orders of magnitude that it is worth anchoring three cases.

### Chelyabinsk, 2013 — 20 metres

Energy roughly **500 kt**. The object never reached the ground intact: at 19 km/s the ram pressure exceeded the strength of a stony body, and it **fragmented and detonated** in the air. That is the general behaviour for stony objects below about 50 metres — an airburst does no cratering but delivers a substantial overpressure at ground level, which is why Chelyabinsk's damage was almost entirely glass. Recurrence: roughly **once every 60 years**.

### Tunguska, 1908 — about 60 metres

Energy of order **10–15 megatonnes**. An airburst at 5–10 km over Siberia flattened around **2,150 square kilometres** of forest — some 80 million trees — knocked down radially away from the epicentre. There is no crater. Had it arrived a few hours later, Earth's rotation would have placed a major city underneath it. Recurrence: roughly **once per millennium**.

{{image: Tunguska event | Trees felled by the 1908 Tunguska airburst, still lying where the shock wave laid them down; the object detonated several kilometres up and left no crater at all, only some 2,150 square kilometres of flattened forest.}}

### Chicxulub, 66 million years ago — 10 to 15 kilometres

Energy of order **10⁸ megatonnes** — a hundred million times Tunguska. A crater 180 km across. The end of the Cretaceous, and of about 75% of species. The way this one was established deserves telling, because the argument ran ahead of the observation.

### The iridium anomaly

In 1980, Luis and Walter Alvarez and colleagues were studying the thin clay layer marking the Cretaceous–Palaeogene boundary, trying to determine how long it took to deposit. They measured **iridium** as a proxy, reasoning that it arrives steadily from space in micrometeoritic dust, so its concentration would indicate deposition time. They found it enriched by a factor of **thirty to a hundred and sixty** above background.

Iridium is **siderophile** — it partitions into metal — so almost all of Earth's original inventory sank into the core during differentiation, leaving the crust depleted; but chondritic meteorites, which never differentiated, retain theirs. **An iridium spike in a sedimentary layer means extraterrestrial material, and a large amount of it, deposited fast.**

They proposed an asteroid impact. The proposal was resisted for a decade, and the objection was the obvious one: *where is the crater?* **It was found in 1991** — buried under a kilometre of sediment beneath the Yucatán, straddling the coast. And here is the detail that makes it a proper story: the crater had already been mapped in **gravity and magnetic surveys conducted by the Mexican state oil company in the 1970s**, by geophysicists looking for oil. The data existed for over a decade before anyone connected it to the boundary clay.

{{image: Chicxulub crater | The buried Chicxulub impact structure beneath Mexico's Yucatán Peninsula, traced by the gravity anomaly its 180-kilometre ring imprints on the crust; the crater was reidentified in 1991, a full decade after the iridium anomaly predicted that something like it had to exist.}}

Two lessons. **Theory before observation** — the Alvarez argument stands alongside Le Verrier's prediction of Neptune and Peale's prediction of volcanoes on Io. And **the data were already there, unexamined**, mapped by oil geologists a decade before anyone connected it to the boundary clay. The decade of resistance was not obstinacy; it was the immune system of a discipline that had spent a century replacing catastrophism with the uniformitarian principle that the present is the key to the past, and to which a physicist arriving with a single chemical anomaly and a doomsday rock looked like exactly the kind of story it had learned to distrust. The hypothesis won when, and because, it produced a second independent line of evidence: the crater.

## The hazard curve

Now the arithmetic, because it settles most of the argument.

An impactor of diameter $D$ arriving at speed $v$ delivers kinetic energy $E = \tfrac{1}{2}mv^2$ with $m = \tfrac{\pi}{6}\rho D^3$. Taking a stony density of 2,600 kg/m³ and typical encounter speeds around 20 km/s:

| Diameter | Mass | Energy | Recurrence | Consequence |
|---|---|---|---|---|
| 4 m | 8.7 × 10⁴ kg | 4 kt | annual | harmless fireball |
| **20 m** | 1.1 × 10⁷ kg | **470 kt** | ~60 yr | Chelyabinsk: broken glass, injuries |
| **60 m** | 2.9 × 10⁸ kg | **14 Mt** | ~1,000 yr | Tunguska: a flattened county |
| **140 m** | 3.7 × 10⁹ kg | **179 Mt** | ~20,000 yr | **regional devastation** |
| 1 km | 1.4 × 10¹² kg | 65,000 Mt | ~500,000 yr | global climatic effects |
| 10 km | 1.4 × 10¹⁵ kg | 6.5 × 10⁷ Mt | ~100 Myr | mass extinction |

For scale: the largest nuclear device ever detonated yielded about **50 Mt**. A 140-metre rock arrives with more than three times that.

### Why the threshold is 140 metres

Here is the reasoning that sets policy. **Number** falls steeply with size: $N(>D) \propto D^{-2.3}$ or thereabouts. **Consequence** rises steeply: energy goes as $D^3$, and the *area* devastated rises faster still than linearly with energy. Multiply a falling frequency by a rising consequence and you get an **expected-damage curve dominated by neither end.** Small impacts are frequent but trivial; the largest are catastrophic but so rare that they contribute little per century. The integrated risk peaks in the middle — at the scale rare enough that there is no historical experience of it, and common enough to be worth worrying about.

That scale is a few hundred metres. Hence the **140-metre threshold** written into the United States George E. Brown Act of 2005, which directed NASA to catalogue 90% of near-Earth objects at or above that size.

**A 140-metre impact would not end civilisation. It would destroy a region** — and it is the largest event we have a realistic chance of both anticipating and preventing.

## Finding them, and the reasons we miss

### Where we actually stand

| Size | Estimated population | Catalogued | Status |
|---|---|---|---|
| **> 1 km** | ~950 | **>95%** | **Spaceguard goal — essentially achieved** |
| **> 140 m** | ~25,000 | **~45%** | George E. Brown goal — **not achieved** |
| > 50 m | ~300,000 | ~3% | Tunguska class — largely unknown |
| > 20 m | ~5,000,000 | <1% | Chelyabinsk class — effectively invisible |

The top line is a genuine success and deserves saying plainly. **We have found essentially every civilisation-threatening object in near-Earth space, and none of them is going to hit us in the foreseeable future.** That was not true in 1990, and it was achieved by a modest, sustained, cheap survey programme. The second line is the current work, and it is less than half done.

### The instruments

Ground-based optical surveys — **Catalina**, **Pan-STARRS**, **ATLAS** — do the bulk of the discovery, taking repeated wide-field images and looking for points that move against the stars. The **Vera C. Rubin Observatory**, now beginning operations, will roughly double the known catalogue within a few years by depth and cadence alone — a telescope built to find faint galaxies incidentally finds faint asteroids. But two structural problems remain, and they are not solved by building bigger optical telescopes.

### Problem one: the albedo degeneracy

An optical survey measures **brightness**, which depends on the product of size and reflectivity, so a dark 140-metre asteroid and a bright 60-metre asteroid can look identical. Since near-Earth albedos range from about 0.03 to 0.4 — a factor of more than ten — **the size inferred from optical data alone can be wrong by a factor of three or more**, and the error runs in the dangerous direction: **dark objects are systematically under-detected and, when detected, under-sized.**

The fix is **infrared.** A body in sunlight re-radiates in the thermal infrared at a rate set by the energy it absorbs, so its infrared brightness scales with **surface area**, nearly independently of albedo. Measure both bands and you get size and albedo separately. This is the purpose of **NEO Surveyor**, an infrared space telescope designed specifically for the 140-metre census — not a marginal improvement but the instrument that closes the systematic error.

### Problem two: the sunward blind spot

You cannot point a ground-based telescope near the Sun. In practice a survey covers the sky from roughly opposition round to perhaps 45–90° elongation, and the region inward of that is simply not observed.

Objects on orbits **interior to or similar to Earth's** — the Atens and Atiras — spend most of their time in that zone, and they are precisely the population that produces daytime arrivals. **Chelyabinsk came from there.** So will the object that produces the next such event. The only fix is to observe from somewhere else: ESA's proposed **NEOMIR** would sit at the Earth–Sun L1 point with an infrared telescope looking *outward* along the Sun-ward direction, catching objects structurally invisible from the ground. Both remaining survey problems are thus **systematic rather than statistical** — neither solved by more observing time, both needing a different instrument in a different place, which is a funding decision rather than a scientific one.

## Predicting an impact

### The uncertainty region

The orbit-determination problem is the classic one: a short arc, angular measurements only, and a family of orbits consistent with the data. Modern practice represents that family explicitly — sample the orbits compatible with the observations, propagate each forward, and see what fraction pass through the Earth. That fraction is the **impact probability**: not a statement about the asteroid but about **our knowledge of the asteroid** — with an immediate and constantly misunderstood consequence:

> **Impact probability normally rises before it falls.**

When an object is discovered, the uncertainty region is enormous — a long thin cloud of possible positions, of which Earth occupies a tiny fraction. As observations accumulate the cloud **shrinks**; if Earth remains inside it, the *fraction* Earth occupies necessarily **increases**, so the probability rises — right up until the cloud shrinks past Earth entirely and collapses to zero. **A rising impact probability is usually the sound of a calculation working correctly.**

### Two scales

The **Torino scale** (0–10) is a public communication tool combining probability and consequence into a single colour-coded integer, coarse by design. The **Palermo scale** is the technical one: the base-10 logarithm of the risk posed by an object relative to the **background risk** from all undiscovered objects of similar size over the same period, with negative values meaning less threatening than the ambient hazard. It is the more informative measure and almost never gets quoted in public.

### Keyholes

A subtlety worth knowing, because it changes what deflection means.

A **keyhole** is a small region in the plane of a close approach such that an object passing through it is placed on a **resonant return** — an orbit whose period is a whole-number ratio to Earth's, bringing it back to a collision at a specified later date.

Apophis's keyhole for a 2036 impact, within its 2029 encounter, was about **600 metres wide.**

That number cuts both ways. The target you must avoid can be **smaller than a football pitch**, inside an encounter region tens of thousands of kilometres across — a demanding tracking problem. But it is also an opportunity: **to prevent the 2036 impact you would only have needed to move Apophis a few hundred metres, decades in advance, rather than by an Earth radius.** Deflecting before a close approach is far cheaper than deflecting before an impact, because the planet's own gravity does the amplification for you.

### A worked example that finished

**2024 YR4** is the best case study available, because it ran its full course inside eighteen months and everything about it is public.

| Date | Development |
|---|---|
| Dec 2024 | Discovered by ATLAS |
| Feb 2025 | Earth impact probability peaks near **3.1%** for 22 December 2032 — Torino 3, the highest rating in two decades |
| late Feb 2025 | **Earth impact ruled out** (0.004%). But the *lunar* impact probability is 1.7% |
| Apr 2025 | JWST measures the diameter at **60 ± 7 m**; lunar probability 3.8% |
| Jun 2025 | Lunar probability **4.3%**; the object fades beyond reach |
| Feb 2026 | JWST catches it again on 18 and 26 February |
| Mar 2026 | **Lunar impact eliminated** — it will pass about 21,200 km from the Moon |

Watch what the number did: it rose, fell, rose again for a different target, and went to zero. **That is not indecision — it is exactly what a shrinking uncertainty region looks like** when a target is inside it and then is not.

Two further points. **JWST did planetary defence:** a telescope built to observe the early universe resolved the case twice — first by measuring the object's size thermally (60 m, not the 40–90 m the optical data allowed), then by extending the observational arc when nothing on the ground could see it. **And the lunar scenario raised a hazard nobody had costed:** modelling suggested a lunar impact could raise the micrometeoroid flux in low Earth orbit by up to a factor of a thousand for a few days — a genuine risk to satellites and crews from an impact on a body 380,000 km away. As lunar infrastructure grows, this stops being hypothetical.

## Apophis, 13 April 2029

On Friday **13 April 2029**, the asteroid **99942 Apophis** — about 340 metres across, S-type — will pass roughly **32,000 km above Earth's surface**: inside the geostationary belt, closer than many of our own satellites. It will reach naked-eye visibility from Europe, Africa and western Asia.

An object that size passing that close happens perhaps once in a few thousand years.

{{image: 99942 Apophis | Radar imagery of the asteroid 99942 Apophis, which on 13 April 2029 will pass inside the ring of geostationary satellites — closer than many spacecraft — and briefly become a moving point of light visible to the naked eye from Europe, Africa and western Asia.}}

Apophis has history. In December 2004, shortly after discovery, its 2029 impact probability rose to about **2.7%**, reaching **Torino 4** — still the highest rating ever assigned. Precovery images and then radar ranging removed the possibility entirely. **The system worked, in public, at speed.**

### Why 2029 is a free experiment

Apophis is almost certainly a **rubble pile** — a loose aggregate of boulders and gravel held together by its own feeble gravity, the structure now thought to describe most asteroids of this size. Passing within five Earth radii, it will experience tidal forces small compared with its self-gravity but not negligible compared with the pascal-scale cohesion holding its surface together. The expectation is **surface disturbance**: seismic shaking, landslides, resurfacing of regolith, possible changes to spin state and pole orientation, exposure of fresh subsurface material. **Nature is going to poke a rubble pile for us**, and the parameters we would most like to know for deflection planning — cohesion, internal friction, how stress propagates through an aggregate — are exactly what a tidal disturbance probes.

### Getting there in time

Two spacecraft will watch, and the pairing is the point. **Ramses** (ESA, with JAXA) is designed to arrive in **February 2029, two months before the encounter**, and escort Apophis through; committed at ESA's ministerial council in November 2025, it needs to launch in **April 2028** — a schedule set by orbital mechanics, not readiness. **OSIRIS-APEX** is the OSIRIS-REx spacecraft, redirected after delivering the Bennu sample in 2023; trajectory constraints put it about **ten days after** closest approach, settling into orbit in June 2029 for an eighteen-month campaign, and it will fire its thrusters at the surface to excavate subsurface material as it demonstrated at Bennu.

**Before and after, by two spacecraft.** That is the whole scientific case: not a snapshot of a disturbed asteroid but a controlled comparison, the only way to attribute changes to the encounter rather than the asteroid's ordinary state. The deadline is fixed by celestial mechanics and cannot be renegotiated.

## DART, and where the extra momentum came from

On **26 September 2022**, a 580 kg spacecraft struck the asteroid **Dimorphos** at **6.14 km/s.** Dimorphos is a 151-metre moonlet orbiting the 780-metre asteroid **Didymos**, and the choice of a binary target was the whole design. Measuring a small change in an asteroid's heliocentric orbit is very hard; measuring a change in a **mutual orbital period** is easy, because the pair eclipse each other, ground telescopes see the brightness dip, and the period follows to seconds. **The binary system was the instrument.**

{{image: Double Asteroid Redirection Test | The last complete image of Dimorphos returned by DART seconds before impact on 26 September 2022, showing the boulder-strewn surface of a rubble-pile asteroid; the collision shortened the moon's orbital period by about thirty-three minutes.}}

### The result

The mission's formal success criterion was a period change of **73 seconds.**

| | Value |
|---|---|
| Period before | 11.921 h |
| Period after | 11.372 h |
| **Change** | **≈ 33 minutes** |

It beat its threshold by a factor of about **twenty-seven.**

### The bookkeeping

The spacecraft's momentum was

$$p = (580)(6140) = 3.56\times10^{6}\ \text{kg m/s}$$

Dimorphos's mass is about **4.3 × 10⁹ kg**. If all the momentum had simply been absorbed, the resulting velocity change would be

$$\Delta v_{\text{direct}} = \frac{3.56\times10^{6}}{4.3\times10^{9}} = \mathbf{0.83\ mm/s}$$

Now work out what the observed period change requires. Dimorphos's orbital speed around Didymos is

$$v_{\text{orb}} = \sqrt{GM_{\text{Didymos}}/a} = \sqrt{(6.674\times10^{-11})(5.28\times10^{11})/1190} = \mathbf{17.2\ cm/s}$$

— a walking pace. For a small along-track kick $\delta P/P = 3\,\delta v/v$, and the fractional period change was 33/715 = 4.61%, so:

$$\Delta v_{\text{required}} = \frac{0.0461}{3}(0.172) = \mathbf{2.6\ mm/s}$$

$$\frac{\Delta v_{\text{required}}}{\Delta v_{\text{direct}}} \approx 3.2$$

**The asteroid was pushed about three times harder than the spacecraft pushed it.**

### Where the surplus came from

From the **ejecta.**

The impact excavated a large quantity of material and threw it off the surface, mostly **backwards along the impact direction**; Dimorphos's escape velocity is only about 8 cm/s, so almost all of it left. Every kilogram departing at speed carried momentum, and by conservation an equal and opposite impulse went into the asteroid. This is quantified by the **momentum enhancement factor**:

$$\beta = 1 + \frac{p_{\text{ejecta}}}{p_{\text{impactor}}}$$

$\beta = 1$ would mean perfect absorption with no ejecta. Measured, $\beta$ is about **3.6** (published range roughly 2.2–4.9, and the rough calculation above gives 3.2 — the spread is dominated by the uncertainty in Dimorphos's mass).

> **The spacecraft was not the rocket. The crater was the rocket.**

Most of the deflection came from material the asteroid threw at itself — less a cue ball than a shotgun fired into gravel, the spray providing the thrust.

### Why rubble-pile structure decided everything

$\beta$ is not a constant. It depends on **porosity, cohesion, internal friction, surface structure and the local geometry of the impact site** — precisely the properties that make a rubble pile a rubble pile. A dense monolith produces little ejecta and $\beta$ close to 1; a very porous, weakly bound aggregate absorbs energy in **compaction** rather than excavation and can also give low $\beta$. Dimorphos sat in between and returned 3.6. **We cannot currently predict $\beta$ for an arbitrary target** — the single largest uncertainty in kinetic-impactor deflection, and a materials-science problem rather than an aerospace one.

It also explains a surprise nobody anticipated: post-impact observations indicate **Dimorphos was globally reshaped** — deformed from oblate toward prolate — rather than merely cratered. You cannot reshape a rock with a 580 kg impactor. You can rearrange a pile of gravel.

**Hera** (ESA) launched in October 2024 and is on its way to Didymos to measure the crater and, critically, **Dimorphos's mass** — which is the dominant term in the uncertainty on $\beta$. Until it arrives, we know we deflected an asteroid; we do not know precisely how efficiently.

{{image: Hera (space mission) | ESA's Hera spacecraft, launched in October 2024 and bound for the Didymos–Dimorphos binary, will image the DART crater and measure Dimorphos's mass directly — the dominant unknown in the momentum-enhancement factor, and the number that turns DART from a demonstration into a calibrated result.}}

## Deflection: why warning time is the technology

Now the general problem, and it has a clean answer.

A velocity change applied **along-track** changes the semi-major axis, $\delta a/a = 2\,\delta v/v$, hence the period, $\delta P/P = 3\,\delta v/v$. The object then arrives progressively **early or late**, and the along-track displacement grows **linearly with the time available**:

$$d \approx 3\,\Delta v\,T$$

Evaluate it:

| Lead time | Δv = 0.1 cm/s | Δv = 1 cm/s | Δv = 10 cm/s |
|---|---|---|---|
| 6 months | 47 km | 473 km | 4,734 km |
| 1 year | 95 km | 947 km | 9,468 km |
| 10 years | 947 km | **9,468 km** | 94,680 km |
| 50 years | 4,734 km | 47,340 km | 473,400 km |

Earth's radius is 6,371 km, so a miss requires displacement of at least that order. Read the table again:

> **One centimetre per second, applied ten years out, is a clean miss. The identical impulse applied six months out is a direct hit.**

Turn it round and ask what impulse is needed for a two-Earth-radius miss:

| Lead time | Required Δv |
|---|---|
| 1 year | 13.5 cm/s |
| 10 years | 1.35 cm/s |
| 50 years | **0.27 cm/s** |

**Fifty years of warning turns the problem into a nudge. One year of warning turns it into a nuclear device, or into nothing.**

Which yields the conclusion that governs the entire field:

> **The binding constraint on planetary defence is not propulsion. It is survey completeness. Warning time *is* the technology.**

### The toolkit

**Kinetic impactor** — proven, cheap, fast; uncertain efficiency because of $\beta$, and risks fragmenting a weak target. **Gravity tractor** — a spacecraft station-keeping near the asteroid, towing it by mutual gravitational attraction: absurdly slow, but **completely insensitive to composition** (no $\beta$, no fragmentation risk, precisely controllable), ideal for the fine correction that steers an object out of a keyhole. **Nuclear standoff** — detonation at a distance, ablating one side so the vapour acts as a rocket: by far the most energy per kilogram launched and the only realistic option for a large object or a short warning, but politically fraught and untested. (Ion beam shepherds, laser ablation and mass drivers remain low-thrust concepts, none flown.)

A real campaign would use them together: a **reconnaissance mission first** — because $\beta$ cannot be predicted without knowing the target — then a kinetic impactor for the bulk of the change, then a gravity tractor for the precision.

### The one thing that makes it worse

**Do not fragment the object unless you can disperse it.** Breaking a 300-metre asteroid into a hundred 60-metre pieces on essentially the same trajectory converts one regional catastrophe into a cluster of them. Disruption is only a good strategy if the pieces are dispersed enough to miss — which needs either enormous energy or a lot of lead time. **With little warning and a weak target, a kinetic impactor is a genuine risk rather than a solution.**

## Who decides?

A short section, because the gap is real.

Suppose an object is discovered with a 5% probability of striking Earth in eleven years, with a footprint crossing several countries. Who authorises a deflection? There is no answer. Two international bodies exist — the **International Asteroid Warning Network** for observation and notification, and the **Space Mission Planning Advisory Group** for mitigation planning — and both are **advisory.** Neither can authorise, fund or execute anything.

And deflection has a feature that makes this more than bureaucratic: **you cannot generally move an impact point off the Earth without first moving it across the Earth.** As you push an object out of a collision, the predicted impact point sweeps along a corridor before departing the planet altogether, so for an interval a successful deflection **transfers the risk from one country to another** — a question of international law and liability never tested, and for which the Outer Space Treaty offers essentially nothing. Add that a nuclear option would mean launching a weapon into space, and the political problem starts to look harder than the physics. **The physics of planetary defence is understood. The governance is not.**

## Pulling the thread

- On the day in 2013 that the world's telescopes tracked a well-understood 30-metre asteroid past Earth, **an undetected 20-metre object exploded over Chelyabinsk** — from within 15° of the Sun, the one direction ground surveys structurally cannot cover.
- Impact energy scales as $D^3$ while number scales as roughly $D^{-2.3}$, so the **integrated risk peaks in the middle**: hence the **140-metre threshold**, an object with more than three times the yield of the largest bomb ever built. We have found **over 95% of the kilometre-scale objects** and none threatens us, but only about **45% of the 140-metre objects** — and the two remaining problems, the **albedo degeneracy** and the **sunward blind spot**, are systematic, not statistical, each needing a new instrument in a new place.
- **Impact probability normally rises before it falls**, because it measures our knowledge rather than the asteroid. **2024 YR4** ran the full cycle in eighteen months: 3.1% for Earth, then zero; then 4.3% for the Moon, then zero, resolved by JWST in February 2026.
- **Apophis passes inside geostationary orbit on 13 April 2029**, and Earth's tides will disturb a rubble pile for us — **Ramses** two months before, **OSIRIS-APEX** ten days after: a before-and-after that cannot be rescheduled.
- **DART changed Dimorphos's period by 33 minutes against a 73-second requirement**, pushing the asteroid about **three times harder than the spacecraft pushed it**. The surplus came from **ejecta** leaving a body whose escape velocity is 8 cm/s: **the crater was the rocket.** And $\beta$ depends on porosity and cohesion, so it is unpredictable without reconnaissance.
- Displacement grows as $3\Delta v T$, so **1 cm/s ten years out is a clean miss and the same impulse six months out is a direct hit. Warning time is the technology.** And nobody has any authority to act.

## Further reading

The primary sources here are unusually accessible, because so much of the subject is recent and public. NASA's planetary-defence pages and the DART and Hera mission records document the impact experiment and its follow-up in plain language and release the data and imagery for anyone to examine; the near-Earth object catalogue and the running tally of survey completeness are published and updated continuously, so the 45% figure quoted here is something you can check for yourself and watch improve. For the discovery that turned impacts from a curiosity into a science, Walter Alvarez's own account {{book: Walter Alvarez | T. rex and the Crater of Doom | 1997}} tells the story of the iridium anomaly and the decade-long argument from the inside, by the geologist who found the clay.

- **Walter Alvarez, *T. rex and the Crater of Doom* (1997).** A first-hand narrative of how the K–Pg impact hypothesis was found, resisted, and finally confirmed, written with a working scientist's honesty about the doubt — and the best single account of why demanding the crater was good science, not obstruction.

## Problems

*Constants: $G = 6.674\times10^{-11}$; 1 kt TNT = 4.184 × 10¹² J; 1 Mt = 4.184 × 10¹⁵ J; Earth radius 6,371 km; 1 yr = 3.156 × 10⁷ s. Stony density 2,600 kg/m³. DART: spacecraft 580 kg at 6.14 km/s; Dimorphos mass ≈ 4.3 × 10⁹ kg, orbital radius 1,190 m; Didymos mass 5.28 × 10¹¹ kg; period 11.921 h before, 11.372 h after. Problem 3 is the arithmetic that sets policy; problem 6 is the calculation the whole account builds to; problem 7 is the one that reframes the field; problem 9 is open and has no technical answer.*

### 1 — The one we were watching
**(a)** On 15 February 2013 two objects were in the news. Describe both, and state precisely what the juxtaposition demonstrates — and what it does *not* demonstrate.
**(b)** Chelyabinsk arrived from within ~15° of the Sun. Explain why that direction is structurally unobservable from the ground, and why this is a *systematic* rather than a statistical gap.
**(c)** Most of the 1,500 injuries were caused by glass, and most of those injured were at windows. Explain the sequence of events that produced this, and what it implies for public guidance.
**(d)** The object never reached the ground. Explain why a 20 m stony body airbursts, and why the altitude of the burst matters more than the mass.

### 2 — Iridium
**(a)** The Alvarez team measured iridium in the K–Pg boundary clay for a reason unrelated to impacts. What were they trying to determine?
**(b)** Explain why an iridium excess implies extraterrestrial material. What property of iridium does the argument rest on, and what would the argument look like for an element that was *not* siderophile?
**(c)** The proposal was made in 1980; the crater was identified in 1991 — from survey data collected in the 1970s for an unrelated purpose. Name two other historical episodes with the same structure.
**(d)** Classify the Alvarez argument alongside Le Verrier's prediction of Neptune and Peale's prediction of Io's volcanism. What do all three have in common, and how does the Alvarez case differ?

### 3 — The hazard curve *(the arithmetic that sets policy)*
**(a)** Compute the impact energy, in Mt TNT, of a 140 m stony body at 20 km/s. Compare with the largest nuclear device ever tested (~50 Mt).
**(b)** Repeat for 20 m and 60 m, and check against the stated energies for Chelyabinsk and Tunguska.
**(c)** Number scales roughly as $D^{-2.3}$; energy scales as $D^{3}$. Explain qualitatively why the *integrated expected damage* is dominated by neither the smallest nor the largest impactors.
**(d)** Using (c), justify the choice of **140 m** as the survey threshold rather than 20 m or 1 km.
**(e)** We have found >95% of kilometre-scale objects and ~45% of 140 m objects. Which statistic should worry you more, and why?

### 4 — Why we miss things
**(a)** Explain the **albedo degeneracy**: why an optical survey cannot determine an object's size, and by what factor the inferred size can be wrong.
**(b)** Explain why infrared observation breaks the degeneracy. What physical quantity does thermal emission scale with?
**(c)** Explain the **sunward blind spot** and why it preferentially hides a particular dynamical class of object. Name that class.
**(d)** Both remaining survey problems are described as systematic rather than statistical. Explain the distinction and why it matters for how you would spend money.

### 5 — Probability that rises
**(a)** Explain why an impact probability normally **increases** before it collapses to zero. Be precise about what is shrinking and what is being divided by what.
**(b)** State what an impact probability is a statement *about*.
**(c)** Reconstruct the 2024 YR4 timeline from discovery to resolution, noting the Earth and lunar probabilities at each stage.
**(d)** JWST resolved the case twice, in two different ways. Describe both contributions.
**(e)** Distinguish the Torino and Palermo scales, and say which is more informative and why the other is the one quoted publicly.

### 6 — Where the extra momentum came from *(the central calculation)*
**(a)** Compute DART's momentum at impact.
**(b)** Compute the velocity change Dimorphos would receive if all that momentum were simply absorbed.
**(c)** Compute Dimorphos's orbital speed around Didymos.
**(d)** The period changed from 11.921 h to 11.372 h. Using $\delta P/P = 3\,\delta v/v$, compute the velocity change actually required.
**(e)** Take the ratio of (d) to (b). Define $\beta$ and state what physically supplied the surplus.
**(f)** Explain why $\beta$ cannot be predicted in advance for an arbitrary target, naming the specific physical properties it depends on. What established that these properties are unknown without visiting?
**(g)** Post-impact observations suggest Dimorphos was **globally reshaped** rather than cratered. Why is that impossible for a monolith?

### 7 — Warning time is the technology *(reframes the field)*
**(a)** Derive $\delta P/P = 3\,\delta v/v$ from $\delta a/a = 2\,\delta v/v$ and Kepler's third law.
**(b)** Using $d \approx 3\Delta v\,T$, compute the displacement produced by Δv = 1 cm/s applied 10 years and 6 months before impact. Compare each with Earth's radius.
**(c)** Compute the Δv required for a two-Earth-radius miss at lead times of 1, 10 and 50 years.
**(d)** State the conclusion this forces about where planetary defence money should go, and justify it in terms of how the two costs scale.
**(e)** Compare the kinetic impactor and the gravity tractor. Give one decisive advantage of each, and explain why a real campaign would use both.

### 8 — Keyholes
**(a)** Define a keyhole and explain what a resonant return is.
**(b)** Apophis's 2036 keyhole was ~600 m wide within the 2029 encounter. State the two opposite conclusions this supports.
**(c)** Explain why deflecting an object *before* a planetary close approach is far cheaper than deflecting it before an impact. What does the planet contribute?
**(d)** Suppose an object is heading for a keyhole and you have twenty years. Which deflection method would you choose, and why is the choice different from the one you would make for a direct impact?

### 9 — Open problem: nobody is in charge
An object is discovered with a 5% probability of striking Earth in eleven years, with a risk corridor crossing several countries.
**(a)** Describe the existing international machinery and state its actual authority.
**(b)** Explain why deflection **transfers risk between nations** during the process, and why this is a feature of the physics rather than a failure of planning.
**(c)** Propose a decision-making mechanism. Be specific about who holds authority, what triggers action, and how the liability question in (b) is handled.
**(d)** Argue the opposite case: that no such mechanism should be created in advance. Then decide, and state what would change your mind.

## Worked answers

### 1 — The one we were watching

**(a)** **2012 DA14**: ~30 m, tracked continuously, passing 27,700 km from Earth — inside geostationary orbit, entirely predicted and safe. **Chelyabinsk**: ~20 m, 13,000 tonnes, entering at 19 km/s sixteen hours earlier and airbursting over the southern Urals with ~500 kt of energy, injuring about 1,500 people. Undetected. **It demonstrates that our capability is real and structurally incomplete** — we can track what we have found, and we had not found the one that mattered. **It does not demonstrate** any connection between the objects: they were on unrelated orbits and their proximity in time was chance. Nor that the surveys failed — a 20 m object is well below any survey's design threshold. **The failure was not of execution but of coverage**, and the coverage gap was known in advance.

**(b)** A ground-based telescope cannot point near the Sun: the daytime sky is bright, and at twilight airmass and scattered light defeat faint-object detection. Surveys work from opposition round to perhaps 45–90° elongation, and the sunward cone is never imaged. It is **systematic** rather than statistical because **no amount of additional observing from the ground samples that region at all** — a statistical gap shrinks as you observe more; this one never does. It is a property of where the telescope is, and the only fix is an instrument somewhere else, such as ESA's proposed NEOMIR at L1.

**(c)** The object entered in daylight and produced an extremely bright fireball visible for tens of seconds; people across the region went to their windows to look; the **shock wave arrived some 1–3 minutes later** — sound travels at ~340 m/s and the burst was ~30 km up — and blew the windows in on them. The public-guidance implication is counterintuitive: **on seeing a brilliant fireball, move away from windows and wait a few minutes.** The light and the blast are separated by minutes, ample warning if anyone knows to use it. Almost nobody does.

**(d)** A meteoroid experiences ram pressure $\approx \rho_{air}v^2$. At 30 km altitude the air density is about 0.018 kg/m³, so at 19 km/s the pressure is

$$0.018 \times (1.9\times10^{4})^2 \approx 6.5\ \text{MPa}$$

Stony meteoroids have effective strengths of only ~1–10 MPa — far below laboratory rock, because they are riddled with fractures from their collisional history. So the body **fails and fragments**, the fragments increase the cross-section, deceleration spikes, and the kinetic energy is dumped into the atmosphere almost instantaneously: an **airburst**. **Burst altitude matters more than mass** because ground overpressure falls steeply with distance from the burst point — the same energy released at 5 km rather than 30 km is enormously more destructive, which is the difference between Chelyabinsk and Tunguska, set by the object's **strength and entry angle**, not just its size.

### 2 — Iridium

**(a)** They were trying to determine **how long the boundary clay took to deposit.** Iridium arrives steadily from space in micrometeoritic dust, so its concentration in a sediment acts as a clock — a thin layer with a lot of iridium took a long time to accumulate. They found the answer off scale.

**(b)** Iridium is **siderophile** — it partitions strongly into metal rather than silicate. During Earth's differentiation essentially all of its iridium followed the iron into the core, leaving the crust depleted by orders of magnitude, while **chondritic meteorites never differentiated** and retain theirs. A large iridium excess in a crustal sediment therefore cannot come from crustal sources; it must be **extraterrestrial**, and the amount constrains the mass delivered. For a **non-siderophile** element the argument would collapse: if the crust retained its full share, an excess could be produced by ordinary volcanism, hydrothermal deposition or erosion. **The argument works only because Earth's crust had been stripped of iridium beforehand** — an inference built on what should have been there and is not.

**(c)** **Uranus** was catalogued as a star at least twenty-two times before its identification as a planet in 1781, including by the first Astronomer Royal; **Neptune** was drawn by Galileo in 1612–13 and recorded as a fixed star. In each, **the observation existed, was correct, and was filed under the wrong category** — what was missing was not data but the question that would have made the data meaningful.

**(d)** All three are cases of **theory demanding an unobserved object, which was subsequently found:** Le Verrier's residuals demanded a planet, Peale's tidal model demanded volcanoes, the Alvarez iridium demanded a crater. **Alvarez differs** in being a prediction of **existence without location** — an impact somewhere on Earth, of a given energy, with no constraint on where — where the other two were **quantitative predictions of location** (Neptune within 1°, Io's volcanism at a specific body) testable at once by pointing an instrument. That made it far harder to confirm and easier to resist, which is what happened for eleven years. **A prediction's strength is partly how cheaply it can be checked**, and "a 180 km crater somewhere on a planet that is 70% ocean and geologically active for 66 Myr" is not cheap.

### 3 — The hazard curve

**(a)** $m = \tfrac{\pi}{6}(2600)(140)^3 = 3.74\times10^{9}$ kg.
$E = \tfrac{1}{2}(3.74\times10^{9})(2\times10^{4})^2 = 7.47\times10^{17}$ J $= \mathbf{179\ Mt}$ — **about 3.6 times the yield of the largest nuclear device ever tested**, from a rock the size of a large office block.

**(b)** 20 m at 19 km/s: $m = 1.09\times10^{7}$ kg, $E = 1.97\times10^{15}$ J $= \mathbf{470\ kt}$ — matching the ~500 kt estimated for Chelyabinsk.
60 m at 20 km/s: $m = 2.94\times10^{8}$ kg, $E = 5.88\times10^{16}$ J $= \mathbf{14\ Mt}$ — within the 10–15 Mt range estimated for Tunguska.

**(c)** Expected damage per unit time is (frequency) × (consequence): **frequency falls steeply** ($\propto D^{-2.3}$) while **consequence rises steeply** ($E \propto D^3$, devastated area faster still). At the small end events are common but each does almost nothing; at the large end each is catastrophic but so rare that its contribution *per century* is small. The product **peaks in between**, at the scale rare enough to be outside historical experience and common enough to be a live concern.

**(d)** Because that is where the peak sits. A **20 m threshold** would require cataloguing millions of objects that mostly do no more than break windows — enormous cost for little risk reduction. A **1 km threshold** addresses the most consequential events, but those are ~500,000-year phenomena already >95% found, so the marginal return is nearly zero. **140 m** — roughly 179 Mt, regional destruction, ~20,000-year recurrence, ~25,000 objects — is where cost and risk reduction are best matched: a defensible optimum, not an arbitrary round number.

**(e)** **The 45% should worry you more.** First, **the remaining risk lives there**: the kilometre-scale census is essentially complete and has returned a null result, so that risk is *retired* and no further work reduces it. Second, the 140 m population is where the expected damage peaks, per (c), so the *actionable* residual risk sits precisely in the incomplete category. Third, and least obviously: **incompleteness at 45% means that if a 140 m object is on an impact trajectory, the odds are better than even that we have not found it** — and an unfound object is not a small risk but a risk with **zero lead time**, the one circumstance in which nothing can be done.

### 4 — Why we miss things

**(a)** An optical survey detects **reflected sunlight**, so apparent brightness scales as (cross-sectional area) × (albedo) — the two are **degenerate**, and a single photometric measurement cannot separate them. Near-Earth albedos span roughly **0.03 to 0.4**, a factor of about 13. Since brightness $\propto pD^2$, a fixed brightness allows $D$ to vary as $p^{-1/2}$, i.e. by $\sqrt{13} \approx 3.6$. **The inferred diameter can be wrong by a factor of three or more** — in the dangerous direction, since dark objects are both harder to detect and larger than assumed.

**(b)** In the thermal infrared an object is not reflecting but **emitting** — re-radiating the solar energy it absorbs. A dark body absorbs more and so emits more, which **compensates** for its low reflectivity, so infrared flux scales with **surface area**, nearly independently of albedo. Measure both bands and you solve for size and albedo separately. This is the design rationale for **NEO Surveyor** — not a bigger telescope but a different measurement.

**(c)** The Sun cannot be observed near, so a cone of tens of degrees around it is never imaged from the ground. Objects spending most of their time **interior to or near Earth's orbit** — the **Aten** and **Atira** classes — are preferentially in that cone and correspondingly under-discovered. They are on Earth-like orbits, meaning low relative velocities, frequent close approaches, and **daytime arrival geometry.** Chelyabinsk came from there.

**(d)** A **statistical** gap arises from finite sampling and shrinks as $1/\sqrt{N}$ with more observation. A **systematic** gap is a bias in the method that **does not shrink at all**: observing the sunward cone for a thousand years from the ground yields nothing, and photometry alone never resolves albedo from size. So **for a statistical gap, buy more of what you have; for a systematic gap, buy something different.** Doubling ground-based time does nothing about either problem here; the fixes are an infrared telescope and a spacecraft at L1 — a change of instrument and of location, both capital decisions rather than operational ones.

### 5 — Probability that rises

**(a)** The probability is the **fraction of the orbital uncertainty region that intersects Earth.** At discovery that region is enormous — a long thin cloud of possible positions at the encounter date — and Earth occupies a minuscule fraction. As observations accumulate the **cloud shrinks**; if Earth remains inside it, the *numerator* (the part hitting Earth) stays roughly constant while the **denominator** (the total cloud) falls, so the ratio **rises** — until the cloud shrinks past Earth, the numerator drops to zero, and the probability **collapses.** Rising probability is the signature of a shrinking uncertainty region that still contains the target.

**(b)** **It is a statement about our knowledge, not about the asteroid.** The trajectory is already determined; it will hit or miss, and nothing we learn changes which. The probability quantifies **our ignorance** and evolves as the ignorance does — worth being precise about, because public reporting almost invariably treats a rising number as the asteroid becoming more dangerous.

**(c)**

| Date | Earth | Moon |
|---|---|---|
| Dec 2024 | discovered (ATLAS) | — |
| Feb 2025 | peaks ~**3.1%** (Torino 3) | — |
| late Feb 2025 | **ruled out** (0.004%) | 1.7% |
| Apr 2025 | — | 3.8% |
| Jun 2025 | — | **4.3%**, then out of view |
| Feb 2026 | — | JWST re-detects, 18 & 26 Feb |
| Mar 2026 | — | **eliminated**; passes ~21,200 km from the Moon |

**(d)** **First, by measuring the size thermally:** JWST's infrared observations gave **60 ± 7 m**, breaking the albedo degeneracy that had left the optical estimate spanning roughly 40–90 m, and since consequence depends on $D^3$ this narrowed the estimated energy by nearly an order of magnitude. **Second, by extending the observational arc:** by early 2026 the object was far too faint for any ground telescope, with the next natural window in 2028, but JWST's detections on 18 and 26 February 2026 shrank the uncertainty region past the Moon — a telescope built to observe galaxy formation resolving a planetary defence question, twice.

**(e)** **Torino** is an integer 0–10 combining probability and consequence, colour-coded for **public communication**, deliberately coarse and resetting to 0 once an object is cleared. **Palermo** is $\log_{10}$ of the object's risk relative to the **background risk** from all undiscovered objects of comparable size over the same interval; negative means less threatening than the ambient hazard. **Palermo is far more informative** because it is continuous and answers the question that matters — *is this object worth attending to, compared with the things we do not know about?* Torino is quoted publicly precisely because it is coarse: a single integer is communicable and a logarithmic comparison against a background rate is not. **The reported scale is chosen for its audience, not its information content.**

### 6 — Where the extra momentum came from

**(a)** $p = (580)(6140) = \mathbf{3.56\times10^{6}\ kg\,m/s}$

**(b)** $\Delta v = p/m = 3.56\times10^{6}/4.3\times10^{9} = 8.3\times10^{-4}$ m/s $= \mathbf{0.83\ mm/s}$

**(c)** $v = \sqrt{GM/a} = \sqrt{(6.674\times10^{-11})(5.28\times10^{11})/1190} = \sqrt{0.0296} = \mathbf{0.172\ m/s} = 17.2$ cm/s — a whole orbital system moving at a slow stroll.

**(d)** $\delta P/P = (11.921-11.372)/11.921 = 0.0461$.
$\delta v = \tfrac{1}{3}(0.0461)(0.172) = 2.64\times10^{-3}$ m/s $= \mathbf{2.64\ mm/s}$

**(e)** $2.64/0.83 = \mathbf{3.2}$

$$\beta \equiv 1 + \frac{p_{\text{ejecta}}}{p_{\text{impactor}}}$$

$\beta = 1$ would mean pure absorption. The surplus came from **ejecta** — material excavated from the crater and thrown off the surface, predominantly **backwards along the impact direction.** Dimorphos's escape velocity is only ~8 cm/s, so essentially all of it left, and by momentum conservation each departing kilogram delivered an equal and opposite impulse.

**The crater was the rocket.** Published estimates put $\beta \approx 3.6$ (range ~2.2–4.9); the spread is dominated by uncertainty in Dimorphos's mass, which is what Hera is going to measure.

**(f)** $\beta$ depends on how efficiently the impact **excavates** rather than **compacts**, set by **porosity, cohesion, internal friction, grain size distribution, and the local geometry of the impact site** (boulder or fine regolith, and at what angle). The failure modes lie at both ends: a **dense monolith** produces little ejecta, $\beta \to 1$; a **highly porous, weakly bound** aggregate crushes pore space rather than launching material, and $\beta$ can also be low. Dimorphos happened to sit in a favourable regime. What establishes that these properties are indeterminable from afar is rubble-pile structure itself: bulk density and porosity can be inferred remotely, but cohesion, friction and near-surface structure cannot — and OSIRIS-REx's unplanned half-metre plunge into Bennu showed how badly expectations can fail even after close-range imaging. **Hence reconnaissance before deflection, always.**

**(g)** A monolith responds to an impact **locally**: the shock is confined near the impact point, a crater forms, the bulk shape is unchanged. Reshaping the whole body requires **large-scale internal rearrangement** — the constituent material free to move relative to itself. A 580 kg impactor delivers ~10¹⁰ J, enough to crater rock, nowhere near enough to deform a coherent 151 m body. But in a **cohesionless aggregate**, the seismic shaking alone can fluidise the pile and let it settle into a new equilibrium shape. **Global reshaping is only possible for a rubble pile**, so the deformation is itself independent evidence for the internal structure — and a warning that deflection may alter the target's shape, spin and even its orbit in ways a simple $\beta$ does not capture.

### 7 — Warning time is the technology

**(a)** Kepler's third law: $P^2 \propto a^3$. Taking logarithms and differentiating: $2\,\delta P/P = 3\,\delta a/a$, so $\delta P/P = \tfrac{3}{2}(\delta a/a)$.

From the vis-viva equation for a small along-track velocity change on a near-circular orbit, $\delta a/a = 2\,\delta v/v$. Substituting:

$$\frac{\delta P}{P} = \frac{3}{2}\left(\frac{2\delta v}{v}\right) = 3\frac{\delta v}{v}$$

**(b)** $d = 3\Delta v T$:
**10 years:** $3(0.01)(3.156\times10^{8}) = 9.47\times10^{6}$ m $= \mathbf{9{,}468\ km} = 1.49\ R_\oplus$ — **a clean miss.**
**6 months:** $3(0.01)(1.578\times10^{7}) = 4.73\times10^{5}$ m $= \mathbf{473\ km} = 0.074\ R_\oplus$ — **a direct hit, moved slightly.** The identical impulse; a factor of twenty in outcome, produced entirely by lead time.

**(c)** $\Delta v = 2R_\oplus/(3T)$:

| Lead time | Required Δv |
|---|---|
| 1 year | **13.5 cm/s** |
| 10 years | **1.35 cm/s** |
| 50 years | **0.27 cm/s** |

**(d)** **Money should go overwhelmingly to surveys rather than deflection hardware.** Required Δv falls as $1/T$, and the mass, energy and cost of a deflection mission scale at least linearly with Δv — often worse, since a large Δv may force a qualitatively more expensive technology (nuclear rather than kinetic), so **deflection cost falls as $1/T$ or faster.** Survey cost does **not** rise with the lead time it buys: finding an object twenty years out rather than five costs no more per object, because the same telescope finds it whenever it is observable. Completeness is bought by instrument-years, not urgency. So a marginal survey dollar buys more deflection capability than a marginal hardware dollar. **NEO Surveyor is a deflection programme.**

**(e)** **Kinetic impactor:** **proven, fast, delivers a large impulse in a single event** — the only method demonstrated on a real target and the only one that can act quickly. **Gravity tractor:** **completely insensitive to composition** — towing by gravity alone means no $\beta$, no ejecta, no fragmentation risk, and a force known exactly and controllable in real time. Both, because they are complementary: the impactor supplies the **bulk** of the change but with a factor-of-two uncertainty; the tractor supplies a **small, precisely known correction** to remove the residual. Deflect coarsely, measure, then trim. For a keyhole problem the tractor alone may suffice.

### 8 — Keyholes

**(a)** A **keyhole** is a small region in the plane of a close approach (the "b-plane") such that an object passing through it is deflected by the planet's gravity onto an orbit whose period is a **whole-number ratio to the planet's** — a **resonant return** — so it re-encounters the planet after an integer number of orbits at a position that produces a collision. The keyhole is small because the resonance condition is a narrow constraint on post-encounter period, and the encounter geometry maps a wide range of approach positions onto a wide range of periods.

**(b)** **(i) The tracking problem is exacting.** Determining whether an object threads a 600 m target inside an encounter region tens of thousands of kilometres across requires positional knowledge at the ~10⁻⁵ level of the encounter scale — which is why radar ranging, precovery searches and long arcs matter so much. **(ii) The deflection problem is easy.** You need move the object only a few hundred metres, decades in advance: a shift of 600 m at 20 years' lead requires $\Delta v = 600/(3\times6.3\times10^{8}) \approx 3\times10^{-7}$ m/s — **a third of a micrometre per second**, within reach of a gravity tractor operating for months.

**(c)** Because **the planet's gravity does the amplification.** During a close approach, gravitational focusing converts a small difference in approach position into a large difference in the outgoing trajectory — the encounter acts as a lever. Deflecting *after* the encounter means fighting without that lever: you must supply the entire miss distance yourself. **The planet contributes the gain**, and you only pay for the input signal.

**(d)** **A gravity tractor**, for three reasons. The **required impulse is minuscule** (per (b)), so the impactor's chief advantage — large impulse — is irrelevant. The **precision requirement is severe**: you must move the object *out of* a 600 m window without nudging it into an adjacent keyhole for a different return year, and an impactor's outcome is uncertain by a factor of two or more because $\beta$ is unpredictable, whereas a tractor's force is known and continuously adjustable. And there is **no fragmentation risk** — a partially disrupted object heading toward a keyhole is far worse than an intact one. **Match the tool to the precision required, not the impulse available:** brute force for a direct impact with short warning, a scalpel for a keyhole with decades of warning.

### 9 — Open problem: nobody is in charge

**(a)** Two bodies, both endorsed by the UN Committee on the Peaceful Uses of Outer Space. **IAWN** (International Asteroid Warning Network) coordinates detection, tracking, characterisation and **notification**, agreeing standards for how to communicate a threat; **SMPAG** (Space Mission Planning Advisory Group) brings space agencies together to plan mitigation options and recommend criteria for action. **Their actual authority is nil.** Both are **advisory**: neither can authorise a mission, appropriate funds, direct a national space agency, or compel any state to act or refrain. In the scenario given they would produce an excellent assessment and a recommendation, then wait for someone with authority to notice.

**(b)** Because **the impact point moves continuously across the Earth's surface as you deflect.** The deflection changes the object's arrival *time*: it arrives early or late, and Earth has rotated to a different position. As you increase the applied Δv from zero, the predicted impact point sweeps along a **risk corridor** — a band across the globe — before finally leaving the planet altogether. So a partial or under-performing deflection (plausible given the uncertainty in $\beta$) leaves the impact point **somewhere else along the corridor**, transferring the risk from one country to another for an interval. This is a **feature of the physics**, not a planning failure: any along-track deflection must pass through intermediate states, and those states are impacts at different longitudes. It cannot be designed away, only managed by accepting it in advance.

**(c)** A workable mechanism needs four elements:

1. **A pre-agreed technical trigger, defined before any specific object exists** — say a Palermo value above a set threshold, sustained after a defined arc and confirmed independently by two agencies. Pre-registration is essential because criteria chosen *after* the object is known will be chosen to suit the politics.
2. **A standing authority with pre-delegated powers**, most plausibly under the UN Security Council or a purpose-built treaty body, empowered to direct the operation once the trigger is met — because a body that must be convened and negotiate will consume years of the lead time that is the entire resource.
3. **A pre-funded standing mission capability** — reconnaissance and impactor spacecraft in storage or short-lead production. A campaign designed from scratch takes a decade; the trigger may leave less.
4. **A no-fault liability pool, funded in advance by participating states**, covering damage to any state whose risk is increased during a deflection. Case-by-case liability under the Outer Space Treaty's Liability Convention would instead give every state along the corridor a veto by threat of litigation, guaranteeing paralysis.

**(d)** **The case against creating this in advance:** it is a solution in search of a problem, its expected value dominated by a scenario that has not occurred in recorded history. A standing authority with pre-delegated power over national space assets is a genuine transfer of sovereignty granted for a hypothetical, and such bodies reliably acquire scope beyond their remit; the pre-funded capability would be obsolete before use; and a treaty negotiated now risks **locking in the wrong technology** — a 2020s kinetic-impactor framework applied to a 2070s problem. Better to keep the technical machinery sharp, keep IAWN and SMPAG funded, and improvise governance when there is a real object to negotiate about, since nothing focuses states like a date.

**The better course: build the mechanism, but only elements 1 and 4** — the **trigger** and the **liability pool**, precisely the things that cannot be negotiated under time pressure. A trigger agreed after an object is known will be gamed; a liability regime negotiated during a crisis is bargained from fixed positions by states whose exposure is already known, which is not negotiation. Elements 2 and 3, standing authority and pre-built hardware, are better left unbuilt: the sovereignty cost is real, the technology will change, and given ten years and a confirmed threat, states can and do act. **What would change that judgement:** a confirmed object with a lead time under fifteen years and a probability above a few percent, at which point improvisation costs years and years are the resource. **The case for standing capability is a function of the warning time we expect** — and warning time is a function of survey completeness, currently 45%. **Improve the surveys and the governance problem gets easier; neglect them and it becomes unsolvable.**$astroNEO_master$,
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
  select $astroNEO_quiz$[{"id": "q1", "type": "mcq", "prompt": "In 1980 the Alvarez team argued for a giant impact at the Cretaceous-Palaeogene boundary from an iridium measurement. Why is a large iridium spike in a thin clay layer decisive evidence for extraterrestrial material rather than an ordinary terrestrial process?", "options": ["Iridium is radioactive, so a spike marks the exact moment a burst of cosmic rays reset the isotopic clock in the clay", "Iridium is siderophile, so during differentiation almost all of Earth's inventory sank into the core and left the crust depleted; a sharp thirty-to-a-hundredfold excess therefore cannot come from crustal sources and implies a large mass of undifferentiated material deposited fast", "Iridium is only produced inside asteroids and never occurs on Earth at all, so any detection whatsoever proves an impact", "Iridium dissolves in seawater, so a concentrated layer can only form when an ocean is boiled away by an impact"], "answerIndex": 1, "explanation": "The argument rests entirely on iridium being siderophile, an iron-loving element. When the Earth differentiated, nearly all of its iridium followed the iron into the core, leaving the crust depleted by orders of magnitude. Chondritic meteorites never differentiated and retain theirs. So a sharp excess, enriched thirty to a hundred and sixty times over background, cannot be produced by concentrating crustal material through volcanism or erosion, because the crust has almost none to concentrate; it must be extraterrestrial, and the amount constrains the delivered mass. Had the team instead studied a non-siderophile element that the crust retained in full, an excess could have been explained by ordinary geology and the inference would have collapsed. Iridium is neither radioactive in the relevant sense, nor absent from Earth entirely, nor concentrated by boiling oceans; the whole force of the case is that the crust had been stripped of it beforehand."}, {"id": "q2", "type": "mcq", "prompt": "During the 2024 YR4 episode the Earth impact probability climbed from discovery to about 3.1 percent before dropping to essentially zero. Why is a rising impact probability usually a sign that the calculation is working correctly rather than that the asteroid is becoming more dangerous?", "options": ["The asteroid physically accelerates toward Earth as it approaches, so the true collision chance genuinely increases until the last moment", "The probability measures our knowledge, not the asteroid; as observations shrink the uncertainty cloud while Earth stays inside it, Earth occupies a larger fraction of a smaller cloud, so the fraction rises until the cloud shrinks past Earth and collapses to zero", "Early estimates are deliberately understated for public calm, so the number always rises later as the honest figure is released", "Adding more telescopes increases the number of possible impact sites, which mechanically raises the computed probability"], "answerIndex": 1, "explanation": "An impact probability is the fraction of the orbital uncertainty region that intersects Earth, and that region is a statement about our knowledge, not about the asteroid, whose trajectory is already fixed. At discovery the uncertainty is a long thin cloud of possible positions and Earth occupies a tiny slice. As observations accumulate the cloud shrinks; if Earth remains inside it, the numerator (the part hitting Earth) stays roughly fixed while the denominator (the whole cloud) falls, so the ratio rises. It keeps rising until the cloud shrinks past Earth entirely, at which point it collapses to zero. That is exactly what 2024 YR4 did, rising to 3.1 percent for Earth and then vanishing, then later rising to 4.3 percent for a lunar impact before that too was eliminated in March 2026. The asteroid does not accelerate toward us, the figures are not massaged for calm, and more telescopes shrink rather than multiply the possibilities."}, {"id": "q3", "type": "mcq", "prompt": "A keyhole is a small region within a close-approach plane, and Apophis's keyhole for a 2036 impact within its 2029 encounter was only about 600 metres wide. What does this simultaneously demanding and encouraging fact imply for deflection strategy?", "options": ["That deflection is hopeless, because hitting a 600 metre target is beyond any tracking capability we possess", "That tracking must be extraordinarily precise to know whether an object threads the keyhole, but deflection is cheap, because nudging the object a few hundred metres before the encounter lets the planet's gravity amplify the change into a full miss", "That the only safe response is to fragment the object, since a keyhole can only be avoided by removing the object entirely", "That keyholes make early warning irrelevant, because a resonant return happens on a fixed date no matter what we do"], "answerIndex": 1, "explanation": "A keyhole places an object on a resonant return, an orbit whose period is a whole-number ratio to Earth's that brings it back to a collision at a later date. Apophis's roughly 600 metre keyhole cuts both ways. It is a demanding tracking problem: determining whether an object will pass through a target smaller than a football pitch inside an encounter region tens of thousands of kilometres across requires positional knowledge at the ten-to-the-minus-five level of the encounter scale, which is why radar ranging and precovery searches matter. But it is a cheap deflection problem: to avoid the later impact you need only move the object a few hundred metres before the encounter, decades in advance, rather than by a whole Earth radius, because the planet's own gravity amplifies the small pre-encounter shift into a large change afterwards. This favours a precise, gentle method like a gravity tractor. Fragmentation would be reckless, and early warning is precisely what makes the cheap option available."}, {"id": "q4", "type": "mcq", "prompt": "DART shortened Dimorphos's orbital period by about 33 minutes against a 73-second requirement, and the momentum bookkeeping shows the asteroid was pushed roughly 3.2 times harder than the spacecraft's own momentum could account for, with a measured beta near 3.6. What physically supplied the surplus, and what does it tell us?", "options": ["A hidden rocket engine aboard DART fired on impact, which is why the push exceeded the bare collision momentum", "The impact excavated a crater and threw ejecta off the surface at more than the 8 centimetre-per-second escape velocity; the recoil from that departing material pushed the asteroid on top of the spacecraft's momentum, and because the amount depends on porosity and cohesion, beta is a property of the target's rubble-pile structure and cannot be predicted in advance", "Dimorphos was far lighter than expected, so the same momentum simply moved a smaller mass further", "Solar radiation pressure on the fresh dust cloud accelerated the asteroid over the following weeks"], "answerIndex": 1, "explanation": "The surplus came from ejecta. The impact excavated a large quantity of surface material and threw it off, mostly backwards along the impact direction, and since Dimorphos's escape velocity is only about 8 centimetres per second almost all of it left. By momentum conservation, every kilogram departing at speed delivered an equal and opposite impulse to the asteroid, so the total push was the spacecraft's momentum plus the ejecta recoil. This is captured by beta equals one plus the ratio of ejecta momentum to impactor momentum; beta of one would mean perfect absorption, and the measured value near 3.6 means the crater, not the spacecraft, did most of the work. Crucially beta depends on porosity, cohesion, internal friction and the local impact geometry, the very properties that make a rubble pile a rubble pile, so it is a property of the asteroid and cannot be predicted for an arbitrary target without reconnaissance. There was no engine firing, the mass was not the explanation, and radiation pressure on dust is negligible on this timescale."}, {"id": "q5", "type": "mcq", "prompt": "Using the along-track displacement estimate that the miss distance grows as three times delta-v times the lead time, why does the field conclude that warning time, not propulsion, is the binding constraint on planetary defence?", "options": ["Because a longer lead time lets engineers build a heavier, more powerful spacecraft, and deflection scales with spacecraft mass", "Because the displacement is proportional to lead time, so the required delta-v falls in direct proportion to how early you start: about 1.35 centimetres per second suffices ten years out for a two-Earth-radius miss, but roughly ten times that is needed at one year, and survey cost does not rise with the lead time it buys while deflection cost falls as one over the lead time or faster", "Because the asteroid slows down naturally the longer we wait, reducing the impact energy", "Because international treaties require a minimum notice period before any deflection can legally proceed"], "answerIndex": 1, "explanation": "The displacement opened by a small along-track velocity change grows linearly with the time available, roughly three times delta-v times the lead time, because the nudge changes the orbital period so the object arrives progressively early or late and the timing error accumulates. For a two-Earth-radius miss the required delta-v is about 13.5 centimetres per second at one year of warning, 1.35 at ten years, and 0.27 at fifty years, falling as one over the lead time. The mass, energy and cost of a deflection mission scale at least linearly with the required delta-v, and often worse when a large delta-v forces a jump from a kinetic impactor to a nuclear device, so deflection cost falls as one over lead time or faster. Survey cost, by contrast, does not rise with the lead time it buys, because the same telescope finds an object whenever it is observable. So a dollar spent finding objects earlier buys more deflection capability than a dollar spent on hardware, which is why NEO Surveyor is itself a deflection programme. Spacecraft mass, imaginary natural slowing, and treaty notice periods are not the mechanism."}, {"id": "q6", "type": "open", "prompt": "The physics of planetary defence is described as understood while the governance is not. Explain the specific governance gap, including what authority the existing international bodies actually hold, and explain why deflection transfers risk between nations as a feature of the physics rather than a failure of planning. Then propose and defend at least one element of a decision-making mechanism that could be agreed in advance.", "rubric": "A strong answer identifies the two existing bodies and their limits: the International Asteroid Warning Network (IAWN) coordinates detection, tracking and notification, and the Space Mission Planning Advisory Group (SMPAG) plans mitigation options, but both are purely advisory, endorsed by the UN, and neither can authorise a mission, appropriate funds, direct a national space agency, or compel any state to act. In the standard scenario (say a 5 percent chance of impact in eleven years with a corridor crossing several countries) they can produce an assessment and a recommendation and then must wait for someone with authority to act. The answer must explain the risk-transfer point as physics, not politics: an along-track deflection works by changing the object's arrival time so Earth rotates to a different position, and as the applied delta-v is increased from zero the predicted impact point sweeps continuously along a risk corridor across the globe before the object finally misses entirely. A partial or under-performing deflection (very plausible given the factor-of-two uncertainty in beta) therefore leaves the impact somewhere else along that corridor, so for an interval a successful deflection moves the danger from one nation to another. This is unavoidable because any continuous deflection must pass through intermediate states that are impacts at different longitudes; it can only be managed by being accepted in advance, and the Outer Space Treaty and its Liability Convention offer essentially no tested framework. A strong proposal then defends at least one concrete element agreed in advance, such as a pre-registered technical trigger (for instance a Palermo-scale threshold sustained after a defined arc and independently confirmed by two agencies) to stop criteria being gamed once an object is known, or a pre-funded no-fault liability pool so that states along the corridor cannot each wield a litigation veto that guarantees paralysis. Better answers note the trade-off with sovereignty and technological lock-in that argues against pre-building standing authority or hardware, and connect the whole problem back to survey completeness: more warning time makes improvisation viable and the governance problem easier, which is why the underlying resource is again the catalogue. Credit precision about advisory-only authority, the continuity argument for risk transfer, and a defended, specific mechanism rather than a vague call for cooperation."}, {"id": "q7", "type": "open", "prompt": "Trace the 2024 YR4 episode from discovery to resolution, giving the Earth and lunar impact probabilities at each stage and the two distinct ways JWST resolved the case. Then explain what the whole trajectory of the numbers illustrates about what an impact probability actually measures, and why the lunar scenario mattered even though the object never threatened Earth.", "rubric": "A strong answer reconstructs the timeline with the numbers roughly in place: discovered by ATLAS in December 2024; Earth impact probability peaking near 3.1 percent in February 2025 for 22 December 2032, reaching Torino 3, the highest rating in about two decades; the Earth impact then ruled out (about 0.004 percent) in late February 2025, at which point a lunar impact probability of about 1.7 percent appeared; JWST measuring the diameter at 60 plus or minus 7 metres in April 2025 with the lunar probability then about 3.8 percent; the lunar probability reaching about 4.3 percent in June 2025 before the object faded beyond reach; JWST re-detecting it on 18 and 26 February 2026; and the lunar impact eliminated in March 2026 with the object set to pass about 21,200 kilometres from the Moon. The answer must name JWST's two distinct contributions: first, measuring the size thermally in the infrared to give 60 plus or minus 7 metres, breaking the albedo degeneracy that had left the optical estimate spanning roughly 40 to 90 metres and, because consequence scales as diameter cubed, narrowing the estimated energy by nearly an order of magnitude; and second, extending the observational arc when the object was too faint for any ground telescope and the next natural window was 2028, so that its two February 2026 positions shrank the uncertainty region past the Moon. On interpretation, the answer should explain that the probability rose, fell, rose again for a different target, and went to zero not because the asteroid changed but because an impact probability measures our knowledge, the fraction of a shrinking uncertainty cloud that intersects the target; a rising number is the signature of a shrinking cloud that still contains the target, and a collapse follows when it no longer does. Finally it should note why the lunar case mattered: modelling suggested a lunar impact could raise the micrometeoroid flux in low Earth orbit by up to a factor of a thousand for a few days, a genuine hazard to satellites and crews from an impact on a body 380,000 kilometres away, which becomes less hypothetical as lunar infrastructure grows. Credit accurate numbers, both JWST roles, the knowledge-not-asteroid interpretation, and the low-Earth-orbit flux point."}]$astroNEO_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/small-bodies/near-earth-objects', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
