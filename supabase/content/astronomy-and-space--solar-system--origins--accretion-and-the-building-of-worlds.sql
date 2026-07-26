-- Astronomy & Space · The Solar System — Origins —
-- "Accretion: From Dust to Worlds" (from ASTRO-201, Block 1 Lecture 5). Curated,
-- human-reviewed master for
-- astronomy-and-space/solar-system/origins/accretion-and-the-building-of-worlds @
-- research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Original, house-styled rework: how dust grains become planets -- a journey of ~13
-- orders of magnitude in size and ~40 in mass, secure at both ends and unresolved in
-- the middle. Chondrules as the pebble stage in hand (oldest solids, 4.567 Gyr, and we
-- still don't know what melted them); stage 1 (van der Waals sticking to cm pebbles);
-- THE METRE-SIZE BARRIER in both forms (bouncing/fragmenting collisions, and the
-- sub-Keplerian headwind that spirals metre boulders into the Sun in ~500 yr, thousands
-- of times faster than the disk survives); the STREAMING INSTABILITY resolution
-- (pebbles concentrate and collapse straight into 10-100 km planetesimals, skipping the
-- metre scale; 'born big' evidence in asteroid/KBO size distributions and Arrokoth);
-- pressure bumps as the ALMA rings; GRAVITATIONAL FOCUSING (F = 1 + (v_esc/v_rel)^2)
-- and RUNAWAY -> oligarchic growth; the chaotic GIANT IMPACT phase (30-100 Myr, why the
-- terrestrials have no primordial atmospheres); CORE ACCRETION and the race won by
-- Jupiter (with pebble accretion easing the timescale, and the irony that the barrier's
-- pebbles feed the cores); and THE MARS PROBLEM (models overpredict Mars 5-10x ->
-- abandon the fixed-orbit assumption). Confidence and open questions coexisting in a
-- living science.
--
-- VISUALS (engagement pass): embeds a ```driftbarrier explorer (radial-drift infall
-- time vs body size, the catastrophic minimum at ~1 m against the disk lifetime;
-- DriftBarrier.tsx) and a ```gravfocus explorer (a body's gravitational reach vs its
-- actual size, F = 1 + (v_esc/v_rel)^2, and runaway growth; GravFocus.tsx). Three
-- interactive ```example practice boxes (accretion-scale, radial-drift, grav-focus;
-- WorkedExample.tsx), and {image: ...} markers resolving to real imagery (a chondritic
-- meteorite, Arrokoth, the Moon-forming giant impact). Light inline KaTeX (paired '$';
-- even count asserted); the dollar-quote tag is checked for collisions.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/origins/accretion-and-the-building-of-worlds',
    'research',
    'advanced',
    'read',
    $astroAcc_master$> We have a disk, chemically stratified by a temperature gradient with the snow line at its heart. What remains is the hardest part of the origin story, and the part where our understanding is least complete: **how do microscopic dust grains actually become planets?** The scale of the problem is worth stating plainly at the outset. A dust grain in the solar nebula was about a micron across and weighed roughly $10^{-15}$ kilograms. The Earth is $6.4 \times 10^{12}$ times larger in radius and about **forty orders of magnitude** more massive. Accretion theory must carry material across that entire span, and it must do so within the few million years before the disk's gas disperses. This chapter follows that journey in stages — and the honest structure of the story is that **the beginning works, the end works, and there is a genuine, unsolved problem in the middle.** Grains stick together readily at first, growing to millimetre and centimetre pebbles by simple contact forces; we can even hold the products in our hands, as the **chondrules** embedded in primitive meteorites are exactly that stage of the process, preserved for 4.567 billion years. And once bodies reach a kilometre or so, gravity takes over and growth becomes rapid and secure — through **gravitational focusing**, **runaway growth**, **oligarchy**, and a final chaotic phase of giant impacts that assembled the terrestrial planets over tens of millions of years. But between the pebble and the kilometre lies the **metre-size barrier**, and it is a serious difficulty. At that size, bodies collide too fast to stick and instead bounce or shatter — and, far worse, they experience a headwind from the slower-orbiting gas that causes them to **spiral into the Sun in a few hundred years**, thousands of times faster than the disk's own lifetime. The physics, taken at face value, says that metre-sized boulders should be destroyed or lost long before they can become planetesimals. **Planets should not exist.** They do, of course, so something is missing from that account, and the leading candidate — the **streaming instability**, in which drifting pebbles concentrate and collapse directly into 100-kilometre planetesimals, skipping the dangerous sizes entirely — is elegant, well-supported by simulations, and consistent with the observed sizes of asteroids and Kuiper Belt objects. But the barrier is not definitively closed. This chapter is therefore a study in how a science handles a gap in its central narrative: not by papering over it, but by naming it precisely, proposing testable mechanisms, and looking for observational traces — including, quite possibly, in the rings that ALMA sees in real disks. We will finish by assembling the giant planets through core accretion and runaway gas capture, watching Jupiter win the race the snow line set up, and confronting one more honest difficulty: **the Mars problem**, in which our best simulations of terrestrial planet formation produce a Mars five to ten times too massive, and whose leading solution requires the planetary migration taken up next.

## The building blocks in your hand

There is a class of meteorite called a **chondrite**, and it is the most common kind of stone that falls from the sky. Cut one open, polish the face, and look at it — with a hand lens, or often with the naked eye — and you will see something remarkable. Embedded in a fine dark matrix are thousands of small **spheres**, mostly a fraction of a millimetre to a couple of millimetres across, often glassy, sometimes beautifully preserved. They are called **chondrules**, and the meteorites are named for them.

Here is what those spheres are. Each one is a droplet of silicate rock that was, at some moment in the early solar system, **flash-melted** — heated to something like 1,700–2,000 K, hot enough to melt entirely into a liquid ball — and then **cooled within hours to days**, freezing into a sphere while floating freely in space. (We know the cooling was that fast from the crystal textures; slower cooling produces different mineral structures.) Then those spheres were gathered together with fine dust and gently compacted into a larger body, which has been orbiting ever since, until a fragment of it fell to Earth and someone picked it up.

Now consider the date. Radiometric dating of chondrules gives ages of about **4.567 billion years**. And the calcium–aluminium inclusions (CAIs) found in the same meteorites — irregular white blobs of the most refractory minerals, the very first solids to condense in the condensation sequence — date to **4.5673 billion years**, and are conventionally used to define $t = 0$ for the solar system. These objects are, quite literally, **the oldest solid material we have ever held.**

{{image: Chondrite | A slice through a chondritic meteorite, its surface crowded with small round chondrules — droplets of silicate rock, flash-melted and frozen into spheres in the early solar system, then gathered with fine dust into a body that has drifted ever since. Dated to 4.567 billion years, they are the oldest solids we possess, and they are the millimetre-pebble stage of planet formation, preserved. We can hold the first rung of the ladder in our hands — though, fittingly for this chapter, we still cannot agree what melted them.}}

And here is why they belong at the start of this chapter. **Chondrules are the millimetre-to-centimetre stage of planet formation, preserved.** This chapter is about how dust becomes worlds, and the first step of that journey — grains sticking together into millimetre pebbles — is not a theoretical construct we must take on faith. We have the pebbles. They are in museum drawers and university collections around the world. Some of them are sitting in a display case near you.

There is a pleasing honesty in this too, which sets the tone for the chapter. We possess these objects, we have studied them intensively for over a century, we can date them to four significant figures — and **we still do not agree on what melted them.** The candidate mechanisms include shock waves passing through the nebula, lightning discharges in the disk, splashes from early impacts, and proximity to the young Sun's flares. Each has advocates; none has won. So the very first physical stage of planet formation is represented by objects we can hold, weigh, slice, and date — whose origin remains an open question.

That is a fair emblem for what follows. **The story of accretion is exceptionally well-grounded at its two ends and genuinely unresolved in its middle.** We begin with dust that we know sticks, we end with planets that indisputably exist, and in between lies a stage where our best physics says the process should fail. Let us walk the whole path and see where it strains.

### On holding an unsolved problem

Before we do, a word about method. This is now the third genuine open question flagged in as many chapters — the coronal heating problem, the angular momentum problem of star formation, and now the metre-size barrier. That is not because planetary science is unusually shaky; it is because an accurate picture of what a mature, successful, *live* science actually looks like from the inside is worth developing. Textbooks, by their nature, present settled results, and a reader who meets only textbooks can acquire the impression that the major questions are answered and the work is essentially finished. **It is not, and the honest presentation of where a theory strains is not a weakness of an account but a service to the reader.** What makes the metre-size barrier particularly instructive is its *position*: it does not sit at the periphery of accretion theory, on some exotic edge case. It sits squarely in the middle of the main narrative, at the very stage where planets must be built. And yet the theory around it — dust sticking below, gravitational growth above, the whole architecture of the condensation sequence — is well-established and well-tested. **A science can be confident about the beginning and the end of a process and genuinely unsure about a step in the middle.** Holding that combination without either overstating the confidence or dismissing the framework is a skill worth practising, and this chapter is a good place to practise it.

## The scale of the problem, and the first easy stage

First make the size of the task explicit, because it is easy to underestimate.

### Forty orders of magnitude

Accretion must carry material from interstellar dust grains to planets:

- **Starting size:** roughly 1 micron ($10^{-6}$ m), the typical dust grain in a molecular cloud.
- **Ending size:** Earth's radius, $6.371 \times 10^6$ m.
- **Span in radius:** a factor of $6.4 \times 10^{12}$ — nearly **thirteen orders of magnitude.**

In mass the span is more dramatic still. A one-micron silicate grain has a mass of about $1.6 \times 10^{-15}$ kg; the Earth is $5.97 \times 10^{24}$ kg. The ratio is about $4 \times 10^{39}$ — roughly **forty orders of magnitude.**

And it must happen fast. The disk's gas disperses in **3 to 10 million years**, and while the *rocky* planets can continue assembling after the gas is gone, the giants cannot: their envelopes must be captured while gas remains. So the clock the disk set is running throughout.

```example
accretion-scale
```

Crucially, the physics that dominates growth **changes completely** across this range. At the smallest sizes, gravity is utterly negligible and growth depends on contact forces — molecular stickiness. At the largest, gravity dominates absolutely. Somewhere in between, control must pass from one regime to the other. **The metre-size barrier is precisely the awkward middle where neither force works well** — where bodies are far too large for contact adhesion to hold them together and far too small for their own gravity to help.

### Stage one: dust to pebbles — this part works

The first stage is comparatively straightforward and well-supported by laboratory experiment.

Micron-sized dust grains in the disk are strongly coupled to the gas — they are so small that gas drag dominates their motion entirely, so they move essentially *with* the gas. That means their relative velocities when they meet are very low, of order millimetres per second: gentle encounters, not collisions in any violent sense.

At those speeds, grains **stick**, held by **van der Waals forces** — the weak electrostatic attraction between molecules in contact. This is the same adhesion that makes dust cling to a surface or fine powder clump. Several factors help:

- **Porosity.** Aggregates built this way are fluffy and open-structured, not compact. Fluffy aggregates absorb impact energy by deforming, which greatly improves sticking.
- **Ice mantles.** Beyond the snow line, grains carry coatings of water ice, which is considerably stickier than bare silicate.
- **Slow speeds.** Because small grains track the gas closely, encounters stay gentle.

Laboratory experiments — dropping and colliding real dust aggregates in vacuum chambers and microgravity — confirm that grains stick and grow readily under these conditions. Growth from microns to **millimetres and centimetres** proceeds in perhaps a few thousand years, which is nothing against the disk's lifetime.

And, as the chondrules attest, **we have the products.** Chondrules are millimetre-scale objects from exactly this stage, and the fine-grained matrix surrounding them in chondritic meteorites is the primordial dust. The first rung of the ladder is not in doubt.

So far, so good. The trouble begins as the pebbles keep growing.

## The metre-size barrier: where the theory says planets cannot form

Here is the central difficulty of accretion theory, and it comes in two parts, of which the second is much the worse.

### Problem one: collisions become destructive

As bodies grow larger, they **decouple from the gas.** A micron grain is carried along by the gas completely; a centimetre pebble is only partly coupled; a metre boulder largely ignores the gas and follows its own orbit. And bodies with different degrees of coupling move differently — so as sizes diverge, **relative velocities between colliding bodies rise sharply.**

For bodies in the centimetre-to-metre range, typical collision speeds are of order **1 to 50 metres per second.** And at those speeds, laboratory experiments are unambiguous about what happens: the bodies do **not** stick. They **bounce** off one another, or if the impact is fast enough, they **shatter** — fragmenting back into smaller pieces.

The problem is that neither growth mechanism is available at this size. Van der Waals forces, which held the small grains together, are far too weak relative to the kinetic energy of a metre-sized boulder. And self-gravity is still utterly negligible: a one-metre rock has an escape velocity of well under a millimetre per second, so it cannot gravitationally retain anything.

This is often called the **bouncing barrier**, and by itself it would be serious enough — growth stalls somewhere around the centimetre-to-metre scale, with collisions destroying as much as they build.

### Problem two: radial drift, which is far worse

The second problem is more severe, and it is one of the most striking results in planet formation. To see it, we need one non-obvious fact about the disk.

**The gas in the disk orbits slightly more slowly than Keplerian velocity.** The reason is pressure. Gas in the disk has a pressure that decreases outward, and that outward pressure gradient provides a small additional outward force. So the gas needs slightly *less* centripetal support from orbital motion than a solid body does — and it therefore orbits at slightly *sub-Keplerian* speed. The shortfall is small, typically around 0.5%: at 1 AU, where Keplerian velocity is about 29,780 m/s, the gas lags by roughly **50 metres per second** (the precise lag varies with disk model, but the Keplerian speed and the order of magnitude of the lag are robust).

Now consider a solid body. It has no pressure support, so it orbits at the **full Keplerian speed**. It is therefore moving *through* the gas at about 50 m/s — it experiences a permanent **headwind.**

A headwind exerts drag. Drag removes orbital energy and angular momentum. And a body that loses angular momentum **spirals inward**, toward the Sun. Explore how catastrophically the infall time depends on size:

```driftbarrier
```

The drift rate depends on size, and here is the cruel part: it is **maximized for bodies of roughly one metre.** Smaller bodies are well coupled to the gas and move with it, so they feel little headwind. Much larger bodies have so much inertia relative to their surface area that drag barely affects them. But metre-sized bodies sit at exactly the worst point — large enough to decouple and feel the full headwind, small enough for drag to dominate their motion.

The resulting timescale is startling. **A one-metre boulder at 1 AU spirals into the Sun in something like 100 to 1,000 years.**

Compare that to the disk's lifetime of 3 to 10 million years. Taking 500 years as representative, **metre-sized bodies are lost to the Sun roughly six thousand times faster than the disk itself survives.** They do not have time to grow. They are swept up and destroyed almost as soon as they form.

```example
radial-drift
```

### The barrier stated

Put the two problems together:

> **The metre-size barrier:** at around one metre, bodies collide too fast to stick (they bounce or fragment) *and* they spiral into the star within a few hundred years. Contact forces are too weak to hold them; gravity is too weak to help. **Taken at face value, the physics says that growth cannot proceed through this size range — and therefore that planetesimals, and hence planets, should not form at all.**

This is not a minor discrepancy at the edge of the theory. It sits at the heart of the main narrative, at the exact stage where planets must be assembled. And the empirical situation is unambiguous: planets exist, we are standing on one, and thousands more have been catalogued around other stars. So something is missing from the account above.

**The question is not whether planetesimals form — obviously they do — but how.** That is the subject of the next section, and it is where planetary science currently has its most interesting arguments.

## Getting past the barrier: the streaming instability

Several mechanisms have been proposed to bridge the metre-size gap. The leading candidate is elegant, counterintuitive, and — pleasingly — turns the radial-drift problem itself into the solution.

### The streaming instability

The idea is this. We saw that pebbles drift inward because the gas lags and they feel a headwind. But the interaction runs *both* ways: the pebbles also exert drag *on the gas.* A single pebble's effect is negligible; a dense concentration of pebbles is not.

So consider a region where, by chance, pebbles are locally somewhat more concentrated than average. That clump of pebbles **drags the local gas along with it**, partially accelerating the gas toward Keplerian speed. But if the local gas is moving faster, the headwind in that region is *reduced* — and pebbles in that clump therefore **drift inward more slowly** than pebbles elsewhere.

Now the feedback: pebbles arriving from farther out, still drifting at the full rate, **catch up and join the clump**. The concentration increases. Which reduces the headwind further. Which slows the clump further. Which allows still more pebbles to accumulate.

**This is a runaway positive feedback: a local overdensity of pebbles concentrates itself.** It is called the **streaming instability**, and simulations show it can raise pebble concentrations by factors of thousands above the background.

And once the concentration is high enough, something decisive happens: **the clump becomes dense enough to be gravitationally bound, and collapses under its own gravity** into a single solid body.

### Why this solves the problem so neatly

The crucial feature is what size body it produces. Simulations of streaming-instability collapse typically yield planetesimals of order **10 to 100 kilometres** in diameter, formed **directly** from a collapsing cloud of pebbles.

That is the whole point. **The dangerous size range is never traversed.** Material goes from centimetre pebbles — which are safe, being well-coupled to the gas and slow-drifting — straight to 100-kilometre planetesimals, which are also safe, being far too massive for drag to move appreciably and large enough for self-gravity to hold them together. **The metre scale is skipped entirely.** There are no metre-sized boulders to bounce apart or spiral into the Sun, because bodies of that size are never made.

{{image: Arrokoth | Arrokoth, a small, pristine body in the Kuiper Belt, imaged by New Horizons in 2019 — two lobes that settled together gently, at walking pace. Its unshattered, gently-joined shape is direct evidence that at least some planetesimals formed not by violent collisions but by the soft gravitational collapse of a local cloud of pebbles — exactly what the streaming instability predicts. Untouched since the birth of the solar system, it is a fossil of how the first planetesimals were assembled.}}

### The observational test: were planetesimals "born big"?

This makes a checkable prediction. If planetesimals formed by streaming-instability collapse, they should have been *born* at sizes of tens to a hundred kilometres, rather than growing gradually up through all smaller sizes. So the surviving primitive populations should show a characteristic size scale.

They appear to. The **size distribution of asteroids** shows a distinct feature around **100 kilometres**, which is difficult to explain by collisional grinding alone but arises naturally if that was the birth size. The same is true of the **Kuiper Belt**, where the size distribution also suggests a preferred formation scale of order 100 km. This is the "**born big**" hypothesis, and the streaming instability provides exactly the mechanism it requires. Pristine bodies like Arrokoth — two gently-joined lobes, unshattered, evidently assembled by soft collapse rather than violent collision — carry the same message in their very shape.

We will meet these populations properly in the chapters on the asteroid belt and the Kuiper Belt, but note the logic: **the leftovers of planet formation carry the signature of how they were made**, just as the asteroid belt's composition carried the signature of the snow line.

### A second mechanism: pressure bumps and dust traps

There is another idea, complementary rather than competing, and it connects directly to observations we have already met.

Radial drift happens because the gas is sub-Keplerian, which is a consequence of the outward-decreasing pressure gradient. But suppose the disk is not perfectly smooth — suppose there are local **pressure maxima**, rings where the pressure peaks. At such a maximum the local pressure gradient is zero, so the gas there orbits at **full Keplerian speed** — and a solid body in that ring feels **no headwind at all.**

Drifting pebbles arriving at such a location therefore **stop drifting and accumulate.** A pressure bump acts as a **dust trap**, gathering solid material from a wide region and holding it in place — precisely the conditions needed for the streaming instability to operate, or simply for growth to proceed undisturbed.

And here is the connection that makes this exciting: **the rings and gaps that ALMA sees in disks like HL Tauri and throughout the DSHARP survey may be exactly these structures.** What is often interpreted as gaps carved by forming planets may in part be — or may coexist with — pressure bumps trapping dust and *building* planetesimals. Either way, the observed substructure of real disks is directly relevant to the barrier, which is a large part of why those images mattered so much.

Additional contributing factors include **fluffy, porous aggregates** (low density improves sticking and reduces drift) and **ice-rich compositions** beyond the snow line (icy surfaces stick better than rocky ones) — the latter offering another way in which the snow line may favour rapid growth in the outer disk.

### The honest status

**The streaming instability is the leading answer, supported by increasingly sophisticated simulations and by the size distributions of asteroids and Kuiper Belt objects. It is not, however, a closed question.** The conditions required to trigger it — sufficient local pebble concentration, the right pebble sizes, adequate disk turbulence properties — are demanding, and whether they were met throughout the solar nebula is actively debated. So too are the relative roles of streaming instability, pressure traps, and other mechanisms.

**The metre-size barrier is best described as a problem with a strong leading solution rather than a solved problem.** It is one of the most active areas in planetary science, and the situation is genuinely better than it was two decades ago — but a definitive account of how the first planetesimals formed does not yet exist.

## Once gravity takes over: runaway growth

Once bodies reach kilometre scale, everything changes — and from here to planets, the story is comparatively secure. The reason is that a new force enters: the bodies' own **gravity**.

### Gravitational focusing

A small body sweeping through a swarm of others collides only with what it physically runs into: its cross-section is its geometric area, $\pi R^2$. But a body with appreciable gravity does better. It **attracts** passing bodies, bending their trajectories inward, so that objects which would have missed are pulled in and hit. Its *effective* cross-section is therefore larger than its geometric one, by the **gravitational focusing factor**:

$$F_{\text{grav}} = 1 + \left(\frac{v_{\text{esc}}}{v_{\text{rel}}}\right)^2$$

where $v_{\text{esc}}$ is the body's escape velocity and $v_{\text{rel}}$ the typical relative velocity of encounters. The effect is negligible when $v_{\text{esc}} \ll v_{\text{rel}}$ and enormous when the reverse holds.

Some representative values (rocky bodies, density 3,000 kg/m³):

| Body radius | Escape velocity | Focusing at $v_{\text{rel}} = 100$ m/s | Focusing at $v_{\text{rel}} = 10$ m/s |
|---|---|---|---|
| 1 km | 1.3 m/s | ~1.0 | ~1.0 |
| 100 km | 130 m/s | 2.7 | **169** |
| 1,000 km | 1,295 m/s | **169** | **16,775** |

Look at what happens. For a 1 km body, focusing is irrelevant — it collides only with what it hits. But a 1,000 km body in a dynamically cold swarm (low relative velocities) has an effective cross-section nearly **seventeen thousand times** its geometric one. It reaches out and gathers material from a vastly larger volume than its size alone would allow. See how far a large body reaches:

```gravfocus
```

### Runaway growth

Now notice the consequence, which is the key dynamical result of this stage. **The focusing factor increases with the body's mass.** So the largest body in a region grows *faster* than its neighbours — and as it grows, its advantage *increases*, which lets it grow faster still.

This is **runaway growth**: a positive feedback in which the biggest body in a feeding zone rapidly outpaces everything else, accreting the surrounding planetesimals and pulling away from the pack. Where the streaming instability was a runaway in *concentration*, this is a runaway in *mass*.

Runaway growth is fast. Simulations produce **Moon-to-Mars-sized bodies** — called **planetary embryos** — in perhaps $10^4$ to $10^5$ years in the inner disk. Once gravity is in charge, building large bodies is quick and essentially assured.

### Oligarchic growth: the runaway self-limits

Runaway growth cannot continue indefinitely, because it undermines its own conditions in two ways. First, the growing embryo **depletes its feeding zone** — it eventually consumes the planetesimals within reach. Second, its own gravity **stirs up** the remaining planetesimals, raising their relative velocities, which (per the formula above) *reduces* the focusing factor.

Growth therefore transitions to a slower, more orderly regime called **oligarchic growth**, in which a number of comparably-sized embryos — "oligarchs" — grow in parallel, each dominating its own annular zone of the disk, spaced apart by their gravitational reach. In the inner solar system this produces perhaps a few dozen embryos of roughly 0.01 to 0.1 Earth masses.

```example
grav-focus
```

At the end of oligarchy we have a disk populated by numerous Moon-to-Mars-sized bodies on well-separated, near-circular orbits — and a great deal of leftover debris. One more stage remains.

## The giant impact phase: finishing the terrestrial planets

Oligarchic growth leaves the inner solar system with dozens of embryos, each too small to be a planet, on orbits that are stable only so long as the gas disk provides damping. When the gas disperses, at 3–10 million years, that damping vanishes — and the system becomes **chaotic.**

The embryos perturb one another gravitationally. Orbits become eccentric, begin to cross, and the bodies start to collide. This is the **giant impact phase**, and it is a genuinely violent chapter of the story: collisions between Mars-sized objects at kilometres per second, each one capable of melting or partly vaporizing both bodies.

Two features of this phase matter for everything that follows about the planets themselves.

**It takes a long time.** Unlike the rapid earlier stages, final assembly by giant impacts requires **tens of millions of years** — Earth is generally estimated to have reached its final mass in something like **30 to 100 million years** after the solar system began. Note the implication: by then the disk's gas was long gone. **The terrestrial planets were finished in a gas-free environment, which is precisely why they have no primordial hydrogen envelopes.** Their atmospheres are entirely secondary — outgassed from their interiors or delivered later.

**It is stochastic.** The outcome depends on which embryos happened to collide with which, at what angles, at what times. Run the simulation again with slightly different initial conditions and you get a different number of planets with different masses on different orbits. **The specific architecture of the inner solar system — four planets of these particular masses at these particular distances — is partly a matter of chance.** This is worth holding onto: some features of our system are determined by physics (the rocky/giant division set by the snow line), and others are essentially accidents of a chaotic assembly process.

{{image: Giant-impact hypothesis | An artist's depiction of the giant impact that formed the Moon — a collision between the young Earth and a Mars-sized body, roughly 4.5 billion years ago. Far from exotic, such impacts were the normal business of the inner solar system for its first hundred million years, as dozens of Moon-to-Mars-sized embryos crossed orbits and collided. This chaotic, stochastic phase is why the terrestrial planets took tens of millions of years to finish — long after the disk's gas was gone, which is why they carry no primordial hydrogen atmospheres.}}

The most consequential single event of this phase, for us, was the impact that formed the **Moon** — a collision between the proto-Earth and a Mars-sized body, conventionally called Theia, roughly 4.5 billion years ago. That story gets a full chapter of its own; for now, note that it is a *typical* event of this era rather than an exotic one. Giant impacts were the normal business of the inner solar system for its first hundred million years.

## The giant planets: winning the race

Now we return to the race the snow line set up and watch it run. Giant planets form by a different route, called **core accretion**, and the timing is everything.

### The four stages of core accretion

**Stage 1 — build a core.** Beyond the snow line, where solid surface density is 2–4 times higher, the gravitational growth processes above operate on a richer supply. A solid core grows by accreting planetesimals — and, in the modern picture, by **pebble accretion**, of which more below. It must reach roughly **5 to 10 Earth masses.**

**Stage 2 — attract an envelope.** As the core grows, its gravity begins to capture hydrogen and helium from the surrounding disk. Initially this envelope is thin and in equilibrium, its growth limited by how fast it can radiate away the heat of accretion.

**Stage 3 — runaway gas accretion.** When the envelope mass becomes comparable to the core mass — the "crossover," at a total of roughly 10 Earth masses — the envelope can no longer support itself. It contracts as it cools, which allows more gas to flow in, which adds more heat and mass, which contracts it further. **The accretion runs away**, and the planet swallows an enormous quantity of gas very quickly. Jupiter is thought to have gained something like **300 Earth masses of hydrogen and helium in perhaps $10^5$ years.**

**Stage 4 — open a gap and stop.** Eventually the planet becomes massive enough to clear an annular **gap** in the disk around its orbit, cutting off its own supply, and accretion slows and halts. (This is the very process invoked to explain the gaps in ALMA images of young disks.)

### The race, and why the snow line decided it

Everything hinges on Stage 3 happening **before the gas disperses.** And that requires Stage 1 — building a 10-Earth-mass core — to be completed within the disk's few-million-year lifetime.

**Outside the snow line**, with several times more solid material available, cores could reach the critical mass in time. Jupiter, sitting just beyond the boundary where solids were richest and orbital periods still reasonably short, won most decisively and grew largest.

**Inside the snow line**, with only rock and metal available, no body came close to 10 Earth masses within the window. Earth reached its final mass of 1 Earth mass some 30–100 million years later, when the gas had been gone for tens of millions of years. **It never had the chance to capture an envelope.**

**Farther out**, beyond Saturn, a different limitation bites: surface density falls as $r^{-3/2}$ and orbital periods lengthen, so growth is slow. Uranus and Neptune — at 14.5 and 17.1 Earth masses — appear to be bodies that reached substantial core masses but only captured modest envelopes before the gas vanished. **They are, in effect, the planets that *almost* won the race**, which is why they are compositionally intermediate: mostly heavy elements with relatively thin hydrogen–helium envelopes, hence "ice giants" rather than gas giants.

### The timescale problem, and pebble accretion

There is an honest difficulty here that deserves flagging. **Classical core accretion models had trouble building 10-Earth-mass cores fast enough.** Assembling such a core by sweeping up kilometre-scale planetesimals typically took several million years in early calculations — uncomfortably close to, or exceeding, the disk's lifetime. Jupiter existing at all was, in these models, marginal.

The most important recent development in the field addresses this: **pebble accretion.** The insight is that a growing core embedded in a disk still full of centimetre-sized pebbles accretes them *extraordinarily efficiently*, because gas drag helps. A pebble approaching the core is slowed by the gas, loses energy, and spirals in rather than flying past — so the core captures pebbles from a far larger region than it could capture planetesimals. Pebble accretion can build a 10-Earth-mass core in perhaps $10^5$ to $10^6$ years, comfortably inside the deadline.

Pebble accretion has substantially eased the timescale problem, though the details of how much pebble flux was available and for how long remain areas of active work. **Note also the pleasing connection:** the same drifting pebbles that create the metre-size barrier turn out, in this picture, to be the very material that builds giant planet cores. The problematic population becomes the essential resource.

### An alternative: disk instability

For completeness: an alternative mechanism, **disk instability**, proposes that a sufficiently massive disk can become gravitationally unstable and fragment directly into giant planets, without building a core first. This is fast, and it may operate for giant planets on very wide orbits around other stars. **It is not generally thought to be how our giants formed** — among other reasons, because Jupiter and Saturn have substantial heavy-element cores, which core accretion predicts and disk instability does not naturally produce.

## The Mars problem: where the models still fail

One more honest difficulty, and it points directly at the next chapter.

Run a simulation of terrestrial planet formation using the standard picture — a disk of planetesimals and embryos in the inner solar system, evolving through oligarchic and giant-impact growth. Such simulations do well at producing something like Venus and Earth at roughly the right distances. But they consistently produce a planet at Mars's location that is **far too massive** — typically comparable to Earth, and often several times Mars's actual mass.

Mars is only **0.107 Earth masses.** The classical models overpredict it by roughly **five to ten times.** This is the **Mars problem**, and it is a real and persistent failure of the standard picture.

The difficulty is that the standard picture assumes a smooth disk of planetesimals extending outward through the terrestrial region. But Mars's small size implies that **the region around 1.5 AU was strongly depleted of material** — there was much less there to build with than a smooth disk would provide. Something must have removed it.

The leading explanation requires abandoning an assumption we have carried implicitly through this entire chapter: that **planets form and remain where we find them.** If Jupiter migrated inward through the inner solar system early on and then retreated outward — the "**Grand Tack**" scenario — it would have scattered and depleted material in the Mars region, truncating the disk and starving Mars of building blocks.

That is the subject of the next chapter. **Notice the pattern: the same assumption that failed for hot Jupiters around other stars is now failing for Mars in our own system.** Twice now, the fixed-orbit assumption has broken. It is time to abandon it.

## How worlds get built

Gather the argument.

**We began with the building blocks in hand.** Chondrules — millimetre spheres of once-molten rock, flash-heated and cooled within hours, dated to **4.567 billion years** — are the pebble stage of accretion, preserved in meteorites. Alongside CAIs at **4.5673 Gyr**, which define $t=0$ for the solar system, they are the oldest solids we possess. And fittingly for this chapter, we still do not agree on what melted them.

**We stated the scale of the task:** from micron grains to planets is thirteen orders of magnitude in size and about **forty in mass**, and it must happen before the gas disperses.

**Stage one works.** Micron grains are well coupled to the gas, meet gently at millimetres per second, and stick by **van der Waals forces**, helped by porosity and icy mantles. Growth to centimetre pebbles takes a few thousand years and is confirmed by laboratory experiment and by the meteorites themselves.

**Then the theory breaks.** At around a metre, two problems converge. Collision speeds rise to 1–50 m/s, at which bodies **bounce or shatter** rather than stick — too large for contact forces, too small for gravity. And worse, because gas is pressure-supported and orbits **sub-Keplerian**, solid bodies feel a permanent **headwind** of order 50 m/s, and drag causes them to **spiral inward** — most severely at exactly the metre scale, with an infall time of **100–1,000 years** against a disk lifetime of 3–10 million years. Metre boulders are lost to the Sun roughly **six thousand times faster than the disk survives.** Taken literally, the physics says planetesimals cannot form.

**The leading resolution turns the problem into the solution.** In the **streaming instability**, a local concentration of pebbles drags the gas with it, reducing its own headwind, slowing its drift, and allowing more pebbles to catch up — a runaway concentration that ends in **direct gravitational collapse into 10–100 km planetesimals.** The dangerous metre scale is **skipped entirely.** The prediction that planetesimals were "born big" is supported by the size distributions of asteroids and Kuiper Belt objects, and by pristine gently-joined bodies like Arrokoth. **Pressure bumps** offer a complementary mechanism, halting drift where the gas becomes locally Keplerian — and may be visible as the rings in ALMA images. The barrier is best described as **a problem with a strong leading solution, not a solved problem.**

**Above a kilometre, gravity takes over and growth becomes secure.** **Gravitational focusing** ($F = 1 + (v_{esc}/v_{rel})^2$) gives large bodies effective cross-sections vastly exceeding their geometric ones — a 1,000 km body in a dynamically cold swarm reaches out **17,000 times** its own area. Because focusing strengthens with mass, the biggest body grows fastest: **runaway growth**, producing Moon-to-Mars-sized **embryos** in $10^4$–$10^5$ years. This self-limits as embryos clear their zones and stir their neighbours, giving **oligarchic growth** and a population of comparable embryos.

**The terrestrial planets were finished by giant impacts** over **30–100 million years**, long after the gas had gone — which is exactly why they have no primordial envelopes. That phase was **chaotic and stochastic**: the specific masses and number of inner planets are partly a matter of chance, and the Moon-forming impact was a typical event of the era.

**The giants won the race the snow line set up.** Core accretion builds a **10-Earth-mass core**, which triggers **runaway gas accretion** — Jupiter gaining ~300 Earth masses in ~$10^5$ years — until it opens a gap and stops. Outside the snow line there was enough material to finish the core in time; inside there was not; and far out, Uranus and Neptune reached large cores but **captured only modest envelopes before the gas vanished** — the planets that almost won. The classical timescale difficulty has been substantially eased by **pebble accretion**, in which the very drifting pebbles that create the metre barrier become the efficient food supply for giant cores.

**And we ended on a failure.** Simulations of terrestrial formation overpredict Mars's mass by **five to ten times** — the **Mars problem** — implying that the region around 1.5 AU was strongly depleted. The leading fix requires giving up an assumption this chapter quietly relied on throughout: that planets stay where they form.

**Here is the lesson to carry.** This chapter has been an exercise in holding a mixed verdict. **The framework is sound and well-tested at both ends** — we have the pebbles in museum drawers, we have the planets underfoot, and the gravitational physics of the later stages is secure. **And there is a genuine, unresolved gap in the middle, at precisely the stage where planets must be built.** Neither fact cancels the other. A mature science can be confident about a process's beginning and end while actively arguing about a step between them, and the honest response is to name the gap precisely, propose testable mechanisms, and go looking for evidence — which is exactly what the field is doing, and why the ALMA images matter so much. **Confidence and open questions are not opposites; they coexist in every living science.**

**Next: the planets moved.** Twice now the assumption that planets remain where they form has failed — for hot Jupiters around other stars and for the stunted Mars in our own system. The next chapter abandons it. We will examine **planetary migration** — how a planet exchanges angular momentum with the disk and spirals inward or outward — and the **Nice model**, in which Jupiter and Saturn crossing a resonance flung Uranus and Neptune outward, scattered the small bodies into the Kuiper Belt and Oort Cloud, and triggered the **Late Heavy Bombardment** that scarred the Moon. The tidy picture of planets forming in place and staying there is about to be replaced by something far more violent and far more interesting.

## Further reading

Any planetary-science treatment of planetesimal formation, the metre-size barrier, the streaming instability, runaway and oligarchic growth, and core accretion will cover the framework of this chapter. A caution, though: the literature here moves quickly. The streaming instability has been the leading candidate for roughly fifteen years and pebble accretion for about a decade — both considerably more recent than most textbook treatments suggest, so favour recent editions and review articles where you can.

## Problems

*The accretion set. Problem 3 (the metre-size barrier) is the conceptual core; problem 4 (gravitational focusing) is the quantitative heart and explains runaway growth; problem 7 (core accretion) closes the race the snow line began; problem 8 asks you to reason about how science handles an unsolved problem in the middle of a successful theory. Full worked answers follow.*

**1 — Chondrules and the oldest solids.**
**(a)** What are chondrules, and what does their spherical shape and crystal texture tell us about their history?
**(b)** How old are chondrules and CAIs, and what role do CAIs play in solar-system chronology?
**(c)** Why is it significant that we hold physical samples of an accretion stage — and what remains unresolved about them?

**2 — The scale of the problem. (Quantitative.)**
**(a)** A dust grain is ~1 μm; Earth's radius is 6.371×10⁶ m. Compute the ratio, and express it in orders of magnitude.
**(b)** A 1 μm silicate grain has mass ~1.6×10⁻¹⁵ kg; Earth is 5.97×10²⁴ kg. Compute the mass ratio in orders of magnitude.
**(c)** Explain why the *dominant physics* must change across this range, and identify where the changeover creates trouble.

**3 — The metre-size barrier. (Conceptual core.)**
**(a)** Explain the "bouncing barrier": why do centimetre-to-metre bodies fail to stick, and why is neither contact adhesion nor gravity available to help?
**(b)** Explain why disk gas orbits at *sub-Keplerian* speed, and why this causes solid bodies to experience a headwind.
**(c)** Why is radial drift *worst* for bodies of about one metre, rather than for the smallest or largest bodies?
**(d)** A metre boulder drifts into the Sun in ~500 years; the disk lasts ~5 Myr. Compute the ratio and state the problem in one sentence.

**4 — Gravitational focusing and runaway growth. (Quantitative heart.)** Use $F = 1 + (v_{esc}/v_{rel})^2$; take density 3,000 kg/m³.
**(a)** Compute the escape velocity of a 500 km body, and its focusing factor at $v_{rel}$ = 50 m/s and 200 m/s.
**(b)** Explain what the focusing factor physically represents.
**(c)** By what factor does the focusing factor differ between a 1,000 km and a 100 km body at the same relative velocity? Show why this implies runaway growth.
**(d)** What two effects eventually halt runaway growth and bring on oligarchic growth?

**5 — Streaming instability.**
**(a)** Describe the feedback loop, being careful about what drags on what.
**(b)** What size bodies does it produce, and why does this *specifically* solve the metre-size barrier?
**(c)** What observational evidence supports the "born big" prediction?
**(d)** What is a pressure bump, why does it trap dust, and what observed structures may correspond to it?

**6 — The giant impact phase.**
**(a)** Why does this phase begin only after the gas disperses?
**(b)** How long did it take, and what does that timing explain about terrestrial planet atmospheres?
**(c)** What does it mean to say this phase was "stochastic," and what does that imply about how much of our system's architecture is determined by physics versus chance?

**7 — Core accretion and the race. (Closes the snow-line race.)**
**(a)** Describe the four stages of giant-planet formation by core accretion.
**(b)** Explain, using the snow line, why Jupiter won this race and Earth did not.
**(c)** Uranus and Neptune are 14.5 and 17.1 Earth masses. Explain their intermediate character in terms of the race.
**(d)** What was the classical "timescale problem," and how does pebble accretion address it? Note the irony regarding drifting pebbles.

**8 — Holding an unsolved problem.**
**(a)** State the Mars problem quantitatively.
**(b)** What assumption, carried through this whole chapter, must be abandoned to solve it?
**(c)** The metre-size barrier sits in the *middle* of accretion theory, not at its periphery. Explain how a theory can be well-established at both ends of a process while genuinely unresolved in the middle — and why acknowledging this is preferable to glossing over it.

**9 — Synthesis (from dust to worlds).** In three or four paragraphs, synthesize the chapter: the scale of the task; the secure first stage and the evidence in meteorites; the metre-size barrier in both its forms and why it is severe; the leading resolutions and their status; the gravity-dominated stages from focusing through runaway and oligarchic growth to giant impacts; and the formation of the giants as the race the snow line set up. Conclude by reflecting on what this chapter shows about how a mature science holds confidence and open questions simultaneously. This is the accretion synthesis essay.

## Worked answers

### 1 — Chondrules and the oldest solids

**(a)** Chondrules are sub-millimetre to millimetre **spheres of once-molten silicate** embedded in the matrix of chondritic meteorites. Their **spherical shape** shows they solidified as free-floating liquid droplets in space (surface tension pulls a free liquid into a sphere). Their **crystal textures** indicate they were flash-heated to ~1,700–2,000 K and then cooled within **hours to days** — slower cooling would have produced coarser, different mineral structures.

**(b)** Chondrules date to about **4.567 billion years**; CAIs (calcium–aluminium inclusions, the most refractory minerals and therefore the first solids to condense in the condensation sequence) date to **4.5673 billion years** and are conventionally taken to define **$t = 0$** for the solar system. They are the oldest solid materials known.

**(c)** It is significant because the first physical stage of accretion — growth to millimetre-scale objects — is not merely a theoretical construct but something we can hold, slice, weigh, and date to four significant figures. What remains unresolved is **what melted them**: candidates include nebular shock waves, lightning in the disk, impact splashes, and proximity to the young Sun's flares. None has won. So we possess the objects and can date them precisely, yet cannot agree on their origin — a fitting emblem for a chapter about a theory that is secure at its ends and unresolved in its middle.

### 2 — The scale of the problem

**(a)** $6.371\times10^6 / 10^{-6} = 6.4\times10^{12}$ — nearly **13 orders of magnitude** in radius.

**(b)** $5.97\times10^{24} / 1.6\times10^{-15} = 3.8\times10^{39}$ — about **40 orders of magnitude** in mass.

**(c)** At the smallest sizes, **gravity is utterly negligible** and growth depends entirely on contact forces (van der Waals adhesion). At the largest sizes, **gravity dominates completely** and contact forces are irrelevant. Control must therefore pass from one regime to the other somewhere in between — and the trouble is that the changeover region is a **gap** rather than a smooth handover: around one metre, bodies are far too massive for van der Waals forces to hold together and far too small for self-gravity to assist. That is exactly where the metre-size barrier sits.

### 3 — The metre-size barrier

**(a)** As bodies grow they **decouple from the gas** to differing degrees, so their relative velocities diverge and rise — reaching **1–50 m/s** for cm-to-m bodies. At those speeds collisions **bounce or fragment** rather than stick. Neither growth mechanism is available: **van der Waals forces** are far too weak relative to the kinetic energy of a metre-scale boulder, and **self-gravity** is negligible (a 1 m rock has escape velocity well under a mm/s, so it retains nothing).

**(b)** The disk gas has a **pressure that decreases outward**, providing an extra outward force. The gas therefore requires slightly less centripetal support from orbital motion and orbits at **sub-Keplerian** speed — about 0.5% slow, roughly 50 m/s at 1 AU. Solid bodies have **no pressure support** and orbit at the full Keplerian speed, so they move through the gas and experience a permanent **headwind**, which exerts drag, removes angular momentum, and causes inward spiralling.

**(c)** Because drift depends on the **coupling** between body and gas, which is size-dependent. **Small** bodies are tightly coupled and essentially move *with* the gas, so they feel little headwind. **Large** bodies have enormous inertia relative to their surface area, so drag barely alters their motion. **Metre-sized** bodies are at the worst possible intermediate point: large enough to decouple and feel the full headwind, small enough for drag to dominate their dynamics.

**(d)** Ratio $= 5\times10^6 / 500 = \mathbf{10{,}000}$. **Statement:** metre-sized bodies spiral into the Sun about ten thousand times faster than the disk survives, so they are destroyed or lost long before they can grow into planetesimals — meaning that, taken at face value, the physics predicts planets should not form.

### 4 — Gravitational focusing and runaway growth

**(a)** $M = \frac{4}{3}\pi R^3 \rho$ with $R = 5\times10^5$ m gives $M = 1.57\times10^{21}$ kg; $v_{esc} = \sqrt{2GM/R} = \mathbf{648\ m/s}$.
At $v_{rel} = 50$: $F = 1 + (648/50)^2 = \mathbf{169}$.
At $v_{rel} = 200$: $F = 1 + (648/200)^2 = \mathbf{11.5}$.

**(b)** It is the ratio of the body's **effective** collisional cross-section to its **geometric** cross-section. A gravitating body deflects passing objects inward, so bodies that would have missed geometrically are pulled in and collide. $F$ measures how much larger the body's gravitational "reach" is than its physical size. Note it depends strongly on $v_{rel}$: a dynamically *cold* swarm (low relative velocities) allows much stronger focusing.

**(c)** $v_{esc} \propto R$ for fixed density, so $F - 1 \propto v_{esc}^2 \propto R^2$. Going from 100 km to 1,000 km increases $R$ by 10, so the focusing term increases by $10^2 = \mathbf{100\times}$. **This implies runaway growth** because the focusing factor *grows with mass*: the largest body in a region accretes fastest, which makes it larger still, which further increases its accretion advantage. It is a positive feedback in mass, so the biggest body rapidly outpaces its neighbours and "runs away" from the pack — producing Moon-to-Mars-sized embryos in ~10⁴–10⁵ years.

**(d)** (1) The embryo **depletes its feeding zone**, exhausting the planetesimals within reach. (2) Its own gravity **stirs up** the remaining planetesimals, raising their relative velocities — which *reduces* $F$ (since $F$ falls as $v_{rel}$ rises), throttling the runaway. Growth then proceeds in the slower, parallel **oligarchic** regime.

### 5 — Streaming instability

**(a)** Pebbles drift inward because the sub-Keplerian gas gives them a headwind — but the pebbles also **exert drag on the gas**. Where pebbles are locally concentrated, they **drag the gas forward**, accelerating it toward Keplerian speed; this **reduces the headwind** in that region, so those pebbles **drift more slowly**. Pebbles arriving from farther out, still drifting at full rate, then **catch up and join the clump**, increasing the concentration further — a **runaway positive feedback**. Concentrations can rise by factors of thousands until the clump is dense enough to **collapse gravitationally**.

**(b)** It produces planetesimals of roughly **10–100 km** diameter, formed **directly** by gravitational collapse of a pebble cloud. This solves the barrier specifically because **the dangerous size range is never traversed**: material goes from centimetre pebbles (safe — well coupled, slow-drifting) straight to 100 km bodies (safe — too massive for drag to move, large enough for self-gravity), with **no metre-sized bodies ever existing** to bounce apart or spiral inward.

**(c)** The **size distributions** of the surviving primitive populations. Both the **asteroid belt** and the **Kuiper Belt** show a characteristic feature around **100 km**, which is hard to produce by collisional grinding from smaller bodies but arises naturally if that was the *birth* size — the "born big" hypothesis. Pristine, gently-joined bodies such as Arrokoth add direct morphological evidence of soft collapse rather than violent assembly.

**(d)** A **pressure bump** is a local maximum in disk gas pressure. At the maximum the pressure gradient is zero, so the gas orbits at **full Keplerian speed** — meaning solid bodies there feel **no headwind** and stop drifting. Pebbles arriving from outside therefore accumulate: the bump acts as a **dust trap**, concentrating solids and creating ideal conditions for further growth. The **rings and gaps observed by ALMA** (HL Tauri and the DSHARP survey) may correspond to such structures, making the barrier problem directly connected to observation.

### 6 — The giant impact phase

**(a)** Because while gas is present it **damps** the embryos' orbital eccentricities and inclinations, keeping orbits near-circular and non-crossing. Once the gas disperses (3–10 Myr), that damping vanishes, embryos perturb one another freely, eccentricities grow, orbits begin to **cross**, and collisions become inevitable.

**(b)** It took **30–100 million years** for Earth to reach final mass. Since the gas had dispersed by ~3–10 Myr, the terrestrial planets were **completed in a gas-free environment** — which is precisely why they possess **no primordial hydrogen–helium envelopes**. Their atmospheres are entirely **secondary**: outgassed from their interiors or delivered by later impacts.

**(c)** "Stochastic" means the outcome depends on the **chance details** of which embryos collided with which, at what angles and times. Rerunning the simulation with slightly different initial conditions yields a different number of planets with different masses on different orbits. The implication is that our system's architecture is **partly determined by physics and partly by accident**: the *rocky-versus-giant division* is robust physics (the snow line), but the *specific* number and masses of the inner planets — four, of these particular sizes, at these particular distances — is substantially a matter of chance.

### 7 — Core accretion and the race

**(a)** **(1)** Build a solid core of ~5–10 Earth masses by accreting planetesimals and pebbles. **(2)** The core's gravity attracts a hydrogen–helium envelope, growing slowly, limited by how fast accretion heat can be radiated away. **(3)** When envelope mass approaches core mass (~10 Earth masses total, the "crossover"), the envelope contracts as it cools, admitting more gas, which drives further contraction — **runaway gas accretion**, adding ~300 Earth masses in ~10⁵ years for Jupiter. **(4)** The planet becomes massive enough to **open a gap** in the disk, cutting off its supply, and accretion halts.

**(b)** The entire sequence depends on completing Stage 1 **before the disk's gas disperses** (3–10 Myr). **Outside** the snow line, water ice raised the solid surface density by 2–4×, so cores could reach ~10 Earth masses in time — and Jupiter, just beyond the boundary where solids were richest and orbital periods still short, won most decisively. **Inside** the snow line, only rock and metal were available; no body approached 10 Earth masses within the window. Earth reached its final 1 Earth mass only after 30–100 Myr, long after the gas was gone, so it **never had the opportunity** to capture an envelope.

**(c)** They are the planets that **almost won**. Beyond Saturn, surface density falls as $r^{-3/2}$ and orbital periods lengthen, so growth is slow. Uranus and Neptune assembled substantial cores but reached the crossover point only late — capturing **modest** H/He envelopes before the gas vanished. Hence their intermediate masses (14.5 and 17.1 $M_\oplus$) and their composition: mostly heavy elements with relatively thin envelopes, making them **ice giants** rather than gas giants.

**(d)** The **timescale problem**: classical models building cores by sweeping up kilometre-scale planetesimals took several million years — uncomfortably close to or exceeding the disk lifetime, making Jupiter's existence marginal. **Pebble accretion** resolves much of this: a core embedded in a disk of centimetre pebbles accretes them **extremely efficiently**, because gas drag slows approaching pebbles and causes them to spiral in rather than fly past, greatly enlarging the effective capture region. Cores can then form in ~10⁵–10⁶ years. **The irony:** the very drifting pebbles whose rapid inward migration *creates* the metre-size barrier turn out to be the ideal food supply for giant-planet cores. The problematic population becomes the essential resource.

### 8 — Holding an unsolved problem

**(a)** Mars is **0.107 Earth masses**. Standard simulations of terrestrial planet formation from a smooth disk consistently produce a planet at ~1.5 AU that is **five to ten times too massive** (often approaching Earth's mass). The models systematically overpredict Mars.

**(b)** The assumption that **planets form and remain where we find them** — that formation location equals final location. Mars's small mass implies its region was strongly **depleted** of building material, which requires something to have removed it. The leading explanation (the **Grand Tack**) has Jupiter migrating inward through the inner solar system and back out, scattering and truncating the disk near 1.5 AU. This is the subject of the next chapter. Note that the same assumption already failed for hot Jupiters around other stars — twice now, fixed orbits have proven untenable.

**(c)** A theory can be secure at both ends of a process and unresolved in the middle when the **evidence at the endpoints is direct while the intermediate stage leaves few traces**. Here, the beginning is confirmed by laboratory experiments on dust sticking *and* by physical samples (chondrules); the end is confirmed by the planets themselves and by well-understood gravitational dynamics. The middle stage — metre-sized bodies — is transient, leaves no surviving population (by hypothesis, they never existed in quantity), and involves complex gas–solid interactions that are hard to simulate and impossible to observe directly.

Acknowledging this is preferable to glossing over it for three reasons. **Scientifically**, naming the gap precisely is what allows testable mechanisms (streaming instability, pressure traps) to be proposed and checked against observations like the ALMA rings and asteroid size distributions — progress requires an accurately located problem. **Pedagogically**, readers who are told only settled results acquire a false picture of science as finished, and are poorly equipped to evaluate genuine controversy. **Epistemically**, it models the correct attitude: confidence and open questions are not opposites but normal companions in any living science. The framework of accretion is not in doubt; a step within it is. Both statements are true, and holding them together is the accurate position.

### 9 — Synthesis

**This chapter confronts the hardest part of the origin story: how microscopic dust becomes planets — a journey of thirteen orders of magnitude in size and roughly forty in mass, which must be completed before the disk's gas disperses within a few million years.** The story has an unusual shape: it is secure at both ends and genuinely unresolved in the middle. The first stage is not in doubt. Micron grains are tightly coupled to the gas, meet at millimetres per second, and stick by van der Waals forces, aided by porosity and icy mantles; growth to centimetre pebbles takes a few thousand years, is reproduced in laboratory experiments, and — most convincingly — is preserved physically in the chondrules of primitive meteorites, millimetre spheres of once-molten rock dated to 4.567 billion years. We hold the products of the first rung of the ladder in museum drawers, even though we still cannot agree what melted them.

**Then the theory breaks, at around one metre, in two ways that compound.** First, growing bodies decouple from the gas to differing degrees, so relative velocities rise to 1–50 m/s, at which collisions bounce or shatter rather than stick — and neither contact adhesion (too weak at this mass) nor self-gravity (still negligible) can help. Second and far worse, because disk gas is pressure-supported it orbits sub-Keplerian, so solid bodies feel a permanent headwind of order 50 m/s; drag then causes inward spiralling, most severely for bodies of precisely one metre, which drift into the Sun in 100–1,000 years against a disk lifetime of millions. Metre boulders are lost roughly ten thousand times faster than the disk survives. Taken at face value, the physics says planetesimals cannot form — and yet they plainly did.

**The leading resolution turns the problem into its own solution.** In the streaming instability, a local pebble overdensity drags the gas along with it, locally reducing the headwind, slowing its own drift, and allowing more pebbles to catch up — a runaway concentration that ends in direct gravitational collapse into 10–100 km planetesimals, skipping the dangerous metre scale entirely. The prediction that planetesimals were "born big" is supported by the ~100 km features in the size distributions of both asteroids and Kuiper Belt objects, and pressure bumps offer a complementary trapping mechanism possibly visible in the ALMA rings. Above a kilometre the story becomes secure again: gravitational focusing gives large bodies effective cross-sections far exceeding their geometric ones — a 1,000 km body in a cold swarm reaches 17,000 times its own area — and because focusing strengthens with mass, the largest body accretes fastest in a positive feedback called runaway growth, producing embryos in 10⁴–10⁵ years. Runaway self-limits into oligarchy, and the terrestrial planets were finished by a chaotic phase of giant impacts over 30–100 Myr, long after the gas had gone, which is exactly why they hold no primordial envelopes. Meanwhile the giants won the race the snow line set up: cores of ~10 Earth masses triggered runaway gas accretion, Jupiter gaining ~300 Earth masses in ~10⁵ years, with Uranus and Neptune reaching large cores but capturing only modest envelopes — the planets that almost won.

**What this chapter ultimately teaches is how a mature science holds confidence and uncertainty at once.** The framework of accretion is well-founded: we have the pebbles in hand, the planets underfoot, and secure gravitational physics governing the later stages. And there is a real gap in the middle, at precisely the point where planets must be built — plus a second honest failure at the end, the Mars problem, where models overpredict Mars's mass by five to ten times. Neither difficulty undermines the framework, and neither should be concealed. The productive response is what the field has actually done: name the gap precisely, propose testable mechanisms, and go looking for observational traces — which is why images of disk substructure and the size distributions of leftover populations have become so central. And the Mars problem points somewhere specific: to an assumption this chapter quietly relied on throughout, that planets stay where they form. That assumption has now failed twice — for hot Jupiters around other stars and for Mars in our own system. It is time to abandon it, which is where the story goes next.$astroAcc_master$,
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
  select $astroAcc_quiz$[{"id": "q1", "type": "mcq", "prompt": "Chondrules \u2014 the millimetre spheres in chondritic meteorites \u2014 are described as 'the building blocks in your hand.' What are they, and why do they open a lecture on accretion?", "options": ["Fragments of a destroyed planet, showing planets can shatter", "Droplets of silicate rock that were flash-melted (~1,700\u20132,000 K) and cooled within hours to spheres in space, then gathered into a body; dated to 4.567 billion years, they are the oldest solids we hold \u2014 and they ARE the millimetre-pebble stage of accretion, preserved, so the first step of dust-to-worlds is a physical sample, not a theoretical construct", "Grains of interstellar dust that never melted", "Crystals that grew slowly inside a large asteroid over millions of years"], "answerIndex": 1, "explanation": "A chondrule is a sub-millimetre-to-millimetre sphere of once-molten silicate. Its spherical shape shows it solidified as a free-floating liquid droplet (surface tension), and its crystal texture shows it was flash-heated to ~1,700\u20132,000 K and cooled within hours to days. Radiometric dating gives ~4.567 billion years, and the calcium\u2013aluminium inclusions in the same meteorites (the first solids to condense) define t = 0 for the solar system. They open the lecture because they are the millimetre stage of planet formation preserved \u2014 we can hold, slice, weigh, and date the first rung of the ladder. Fittingly for a lecture about a theory secure at its ends and unresolved in its middle, we still cannot agree what melted them."}, {"id": "q2", "type": "mcq", "prompt": "Why do disk gas and solid bodies orbit at different speeds, and what does that difference do to a metre-sized boulder?", "options": ["The gas is heavier, so it orbits faster and pushes solids outward", "The disk's gas pressure decreases outward, giving an extra outward push, so the gas needs less centripetal support and orbits slightly SLOWER than Keplerian (sub-Keplerian, ~50 m/s slow at 1 AU). A solid body has no pressure support and orbits at full Keplerian speed, so it flies through the gas into a permanent headwind \u2014 drag saps its angular momentum and it spirals into the Sun, fastest of all at about one metre", "Solids are electrically charged and repelled by the magnetic field", "The gas orbits faster, dragging solids ahead of their orbits"], "answerIndex": 1, "explanation": "The disk's gas has a pressure that falls off outward, and that outward pressure gradient provides a small additional outward force. So the gas requires slightly less centripetal support from its orbital motion and settles at a sub-Keplerian speed \u2014 roughly 0.5% slow, about 50 m/s at 1 AU. A solid body has no pressure support and must orbit at the full Keplerian speed, so it moves through the slower gas and feels a constant headwind. That drag removes orbital angular momentum, and the body spirals inward toward the Sun. The effect is worst at about one metre: smaller bodies ride along with the gas and feel little wind, larger bodies have too much inertia for drag to matter, but a metre boulder is large enough to feel the full headwind and small enough for drag to dominate \u2014 spiralling in within a few hundred years."}, {"id": "q3", "type": "mcq", "prompt": "State the metre-size barrier and why it is so serious.", "options": ["Bodies over a metre are too heavy for the disk to support, so they sink to the midplane", "At about one metre, bodies collide too fast (1\u201350 m/s) to stick \u2014 they bounce or shatter \u2014 AND they spiral into the Sun within a few hundred years, thousands of times faster than the disk survives. Contact forces are too weak to hold them and their own gravity is far too weak to help, so taken at face value the physics says planetesimals, and hence planets, should not form at all", "Metre-sized bodies collide and always merge, growing uncontrollably", "The barrier only affects icy bodies beyond the snow line"], "answerIndex": 1, "explanation": "The barrier combines two problems at the metre scale. First, growing bodies decouple from the gas to different degrees, so collision speeds rise to 1\u201350 m/s, at which laboratory experiments show bodies bounce off or fragment rather than stick \u2014 and neither growth mechanism helps, because van der Waals adhesion is far too weak for a metre boulder's kinetic energy while self-gravity is still negligible (escape velocity under a mm/s). Second and worse, the sub-Keplerian headwind spirals metre bodies into the Sun in 100\u20131,000 years, versus a disk lifetime of millions \u2014 they are lost roughly thousands of times faster than they could grow. It sits in the very middle of the main narrative, at the stage where planets must be assembled, and taken literally it forbids planet formation. Since planets plainly exist, something is missing from the naive account."}, {"id": "q4", "type": "mcq", "prompt": "How does the streaming instability get past the metre-size barrier?", "options": ["It makes metre-sized bodies collide gently so they stick after all", "A local overdensity of pebbles drags the surrounding gas forward, reducing its own headwind and slowing its inward drift, so more pebbles catch up and pile in \u2014 a runaway concentration that collapses under gravity DIRECTLY into 10\u2013100 km planetesimals. Material goes from safe centimetre pebbles straight to safe 100-km bodies, skipping the deadly metre scale entirely", "It speeds up metre bodies so they escape the disk before drifting in", "It removes the gas so there is no headwind"], "answerIndex": 1, "explanation": "The streaming instability turns the drift problem into its own solution. Pebbles drift because the gas lags \u2014 but pebbles also drag on the gas. Where pebbles are locally concentrated, they drag the gas forward toward Keplerian speed, which reduces the headwind there, so those pebbles drift more slowly; pebbles from farther out then catch up and join, raising the concentration further in a runaway feedback. Once dense enough, the clump is gravitationally bound and collapses directly into a planetesimal of 10\u2013100 km. The crucial feature is the size: material jumps from centimetre pebbles (safe \u2014 well-coupled, slow-drifting) straight to 100-km bodies (safe \u2014 too massive for drag, self-gravitating), so the dangerous metre scale is never traversed. The 'born big' prediction is supported by the ~100 km features in the size distributions of asteroids and Kuiper Belt objects, and by pristine bodies like Arrokoth."}, {"id": "q5", "type": "mcq", "prompt": "Once bodies pass a kilometre, gravitational focusing drives 'runaway growth.' What is the focusing factor, and why does it cause a runaway?", "options": ["F = v_esc \u00d7 v_rel; growth runs away because faster swarms collide more often", "F = 1 + (v_esc/v_rel)\u00b2: a gravitating body bends the paths of passing objects and pulls in ones that would have missed, so its effective cross-section exceeds its geometric one by F. Because F grows with mass, the biggest body in a region accretes fastest, which makes it bigger still, which widens its advantage \u2014 a positive feedback in mass that lets the largest body run away from the pack", "F = \u03c0R\u00b2; growth runs away because larger bodies have larger areas", "F = v_rel/v_esc; growth runs away in hot, fast-moving swarms"], "answerIndex": 1, "explanation": "A body without gravity collides only with what it physically strikes (cross-section \u03c0R\u00b2). A gravitating body deflects nearby objects inward, capturing ones that would have missed, so its effective cross-section is larger by the focusing factor F = 1 + (v_esc/v_rel)\u00b2 \u2014 negligible when escape velocity is far below the swarm's relative speed, enormous when the reverse holds (a 1,000 km body in a cold swarm reaches ~17,000\u00d7 its own area). The runaway follows because F grows with mass: the largest body accretes fastest, which increases its mass advantage, which lets it accrete faster still. This positive feedback \u2014 runaway growth \u2014 lets the biggest body outpace its neighbours, building Moon-to-Mars-sized embryos in 10\u2074\u201310\u2075 years. It self-limits when the embryo clears its feeding zone and stirs up the survivors (raising v_rel, which lowers F), handing over to slower oligarchic growth."}, {"id": "q6", "type": "open", "prompt": "Trace the full journey from dust grains to planets, identifying which stages are secure and which is the genuine gap. Cover: the easy first stage; the metre-size barrier in BOTH its forms; the streaming-instability resolution; and the gravity-dominated stages (focusing, runaway, oligarchy, giant impacts). Explain why the terrestrial planets have no primordial hydrogen atmospheres.", "rubric": "THE SCALE: micron grains to planets is ~13 orders of magnitude in size, ~40 in mass, all before the gas disperses in 3\u201310 Myr. STAGE 1 (SECURE): micron grains are tightly coupled to the gas, meet gently (~mm/s), and stick by VAN DER WAALS forces, aided by porosity and (beyond the snow line) icy mantles; growth to cm pebbles takes a few thousand years, confirmed by lab experiments and by chondrules preserved in meteorites. THE METRE-SIZE BARRIER (THE GAP), both forms: (1) BOUNCING \u2014 as bodies grow they decouple from the gas, so collision speeds rise to 1\u201350 m/s, at which they BOUNCE or SHATTER rather than stick; van der Waals is too weak for a metre boulder and self-gravity is still negligible. (2) RADIAL DRIFT (worse) \u2014 the disk gas is pressure-supported and orbits SUB-KEPLERIAN, so solid bodies feel a permanent ~50 m/s HEADWIND; drag spirals them inward, worst at ~1 metre, with an infall time of 100\u20131,000 years vs a disk lifetime of millions (~thousands of times faster). Taken at face value, planetesimals cannot form \u2014 yet they did, so something is missing. THE RESOLUTION (leading, not closed): the STREAMING INSTABILITY \u2014 a local pebble overdensity drags the gas forward, reduces its own headwind, slows its drift, and gathers more pebbles in a runaway that collapses DIRECTLY into 10\u2013100 km planetesimals, SKIPPING the metre scale; 'born big' is supported by asteroid/KBO size distributions and pristine bodies (Arrokoth). Pressure bumps/dust traps (maybe the ALMA rings) are a complementary mechanism. GRAVITY-DOMINATED STAGES (secure again): GRAVITATIONAL FOCUSING, F = 1 + (v_esc/v_rel)\u00b2, gives large bodies effective cross-sections far exceeding geometric (17,000\u00d7 for a 1,000 km body in a cold swarm); because F grows with mass, the biggest body runs away \u2014 RUNAWAY GROWTH \u2014 building embryos in 10\u2074\u201310\u2075 yr; this self-limits (feeding zone depleted, neighbours stirred up) into OLIGARCHIC growth (comparable embryos, each ruling a zone); finally the GIANT IMPACT phase, chaotic collisions of Mars-sized embryos over 30\u2013100 Myr, assembles the terrestrial planets. NO PRIMORDIAL ATMOSPHERES: the giant-impact phase finishes over 30\u2013100 Myr, LONG AFTER the disk's gas dispersed (3\u201310 Myr), so the terrestrial planets never captured hydrogen\u2013helium envelopes \u2014 their atmospheres are entirely SECONDARY (outgassed or later-delivered). A strong answer explicitly labels which stages are confident (both ends) and which is the open gap (the middle)."}, {"id": "q7", "type": "open", "prompt": "This is the third chapter in a row to flag an unsolved problem (coronal heating, angular momentum, now the metre-size barrier), and it ends on the Mars problem. Explain how a science can be confident at the two ENDS of a process while unresolved in the MIDDLE, why acknowledging this is a service rather than a weakness, and how the Mars problem points to abandoning a specific assumption. Include the core-accretion race for the giant planets and pebble accretion.", "rubric": "CONFIDENT AT THE ENDS, UNSURE IN THE MIDDLE: this is possible when the evidence at the endpoints is DIRECT while the intermediate stage leaves few traces. The beginning is confirmed by lab experiments on dust sticking AND physical samples (chondrules); the end by the planets themselves and well-understood gravitational dynamics. The middle \u2014 metre-sized bodies \u2014 is transient, leaves no surviving population (by the streaming-instability hypothesis they never existed in quantity), and involves complex gas\u2013solid interactions hard to simulate and impossible to observe directly. So the metre-size barrier sits in the MIDDLE of the main narrative, not at its periphery, yet the framework around it is well-tested. WHY ACKNOWLEDGING IT IS A SERVICE: (scientifically) naming the gap precisely is what lets testable mechanisms (streaming instability, pressure traps) be proposed and checked against observations (ALMA rings, asteroid size distributions) \u2014 progress needs an accurately located problem; (pedagogically) students told only settled results acquire a false picture of a finished science and can't evaluate genuine controversy; (epistemically) it models the correct attitude \u2014 confidence and open questions are normal companions in any living science, not opposites. THE CORE-ACCRETION RACE: giants form by core accretion \u2014 build a ~10 Earth-mass core, which triggers runaway gas capture (Jupiter ~300 Earth masses in ~10\u2075 yr), until it opens a gap and stops. It all hinges on building the core BEFORE the gas disperses. Outside the snow line (2\u20134\u00d7 more solids) cores made it in time \u2014 Jupiter won; inside, Earth never came close; far out, Uranus/Neptune reached big cores but captured only modest envelopes (the planets that almost won \u2014 'ice giants'). PEBBLE ACCRETION: classical models struggled to build cores fast enough (marginal for Jupiter); pebble accretion \u2014 gas drag makes an embedded core sweep up cm pebbles extremely efficiently \u2014 builds a 10 Earth-mass core in 10\u2075\u201310\u2076 yr, easing the timescale. IRONY: the same drifting pebbles that create the metre barrier are the ideal food for giant cores. THE MARS PROBLEM: standard simulations overpredict Mars's mass by 5\u201310\u00d7 (Mars is 0.107 Earth masses), implying the ~1.5 AU region was strongly depleted. THE ASSUMPTION TO ABANDON: that planets form and REMAIN where we find them (formation location = final location). The leading fix (Grand Tack) has Jupiter migrating in and back out, truncating the disk near Mars. This same fixed-orbit assumption already failed for hot Jupiters \u2014 twice now it has broken, setting up planetary migration in the next chapter. A strong answer ties the mixed verdict together: the framework is sound, the gap and the Mars failure are real, and neither cancels the other."}]$astroAcc_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/origins/accretion-and-the-building-of-worlds', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
