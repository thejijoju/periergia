-- Space Exploration · Propulsion & Ascent — "Ascent: Getting Off the Ground"
-- (Lecture 4). Curated, human-reviewed master for
-- astronomy-and-space/space-exploration/rockets/ascent @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert. Shorter depths are
-- distilled from this master (the delete drops derived caches on change).
--
-- Original, house-styled rework of ASTR-191 Lecture 4: why 9.4 km/s is a budget
-- not a speed; where 7.67 comes from and why higher orbits are slower; the
-- equations of motion and the loss integrals; gravity loss and the gravity turn;
-- drag, max-Q and the throttle bucket; the Earth-rotation rebate and the launch
-- geopolitics it dictates; the loss-budget table; and why the budget never
-- improves. KaTeX math; literal currency escaped; body Postgres dollar-quoted.
--
-- Embeds interactive ```example blocks (orbital-velocity, gravity-loss,
-- launch-rebate) rendered as infinite practice boxes
-- (src/components/WorkedExample.tsx), a curated self-test, and a linked
-- Further reading section (affiliated at render time).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/space-exploration/rockets/ascent',
    'research',
    'advanced',
    'read',
    $l4_master$> The "9.4 km/s to low Earth orbit" quoted for three chapters is not a constant of nature. Orbital velocity at 400 km is only 7.67 km/s; the other 1.7 km/s is loss — energy the engine delivers that the planet pockets and returns nothing for. This is the tax on the tax, and it is where the idealized rocket equation meets a real spinning, bulging, air-wrapped planet.

## Cold open: the number that isn't a number

This is a question most people get wrong, and the wrongness is instructive.

**How fast do you have to go to be in orbit?**

{{image: Gravity turn | A launch vehicle arcing downrange on its ascent. The curved path is the gravity turn — the trajectory that turns the planet's own pull into free steering while climbing out through the atmosphere.}}

The confident answer is "escape velocity, 11.2 km/s." **Wrong** — that's the speed to *leave* Earth entirely, never to return, and orbit is precisely *not* leaving. The next answer is "9.4 km/s, the Δv to LEO." **Also wrong**, and this is the interesting wrong, because 9.4 is the number used through the earlier chapters. The number 9.4 is not a *speed*. Nothing in orbit moves at 9.4 km/s. It is a **budget** — a sum of a real speed plus a pile of losses — and confusing the budget with the speed is the single most common conceptual error in this subject.

The actual orbital speed at the International Space Station's altitude is **7.67 km/s**. That's how fast the ISS is moving right now, over your head, and it's the number that falls out of Newton (derived below). So if orbit costs 7.67 km/s of actual velocity, **why is the required budget 9.4?**

Because between the launch pad and orbit, your engine must deliver 9.4 km/s of Δv — of impulse-per-unit-mass, the thing the rocket equation counts — but **1.7 km/s of it never becomes speed.** It's spent fighting gravity while you climb slowly, pushing through air, and steering. It vanishes. You pay for it in propellant, at the full exponential rate (recall the rocket equation: every km/s of Δv multiplies your mass ratio), and you get *nothing* for it — no velocity, no altitude you keep, nothing. It is pure overhead.

Consider the exponential from the rocket equation to make the stakes vivid. Suppose all ascent losses could be magically eliminated — delivering exactly 7.67 km/s and reaching orbit. With a decent methalox stage ($v_e = 3{,}432$ m/s):
- **Real (9.4 km/s):** $R = e^{9400/3432} = e^{2.739} = 15.47$. Payload sliver is tiny.
- **Loss-free (7.67 km/s):** $R = e^{7670/3432} = e^{2.235} = 9.35$.

The mass ratio would drop from 15.5 to 9.4 — **the vehicle would need to be 40% less propellant-dominated.** Payload fraction would roughly *double*. **That 1.7 km/s of loss is, in exponential terms, the difference between a hard vehicle and an easy one.** So it is worth understanding exactly where it goes, and exactly how much of it can be clawed back.

The punchline, stated up front: **most of the 1.7 km/s is gravity loss, gravity loss is the price of spending time going up slowly, and therefore the entire art of launch is a race — get horizontal and get fast before gravity drains you.** The vertical rise off the pad, the immediate tip-over, the whole balletic trajectory: it's a machine for spending as little time as possible fighting gravity at low speed. The physics that proves it follows below.

---

## First, the honest number: where 7.67 comes from

Before accounting for the losses, consider the one part of the budget that's *real* physics, not overhead. Why is orbital velocity 7.67 km/s, and why does it *decrease* with altitude (a surprising fact that governs all of the orbits unit)?

An orbit, recall from the overview, is a projectile that keeps missing the ground. The condition is that gravity provides exactly the centripetal force needed to bend your straight-line motion into a circle. Set gravitational force equal to the centripetal requirement:

$$\frac{GM_\oplus m}{r^2} = \frac{m v^2}{r}$$

The satellite's mass $m$ cancels — orbits don't care what you weigh, which is why a wrench and a space station orbit side by side — and solving for $v$:

$$\boxed{\;v_{\text{circ}} = \sqrt{\frac{GM_\oplus}{r}} = \sqrt{\frac{\mu_\oplus}{r}}\;}$$

with $\mu_\oplus = GM_\oplus = 3.986\times10^{14}$ m³/s². At the ISS altitude of 400 km, $r = R_\oplus + h = 6{,}371 + 400 = 6{,}771$ km:

$$v_{\text{circ}} = \sqrt{\frac{3.986\times10^{14}}{6.771\times10^{6}}} = \sqrt{5.887\times10^{7}} = \mathbf{7{,}673\ m/s}$$

**There's the honest 7.67 km/s.** That's real velocity, physically present, the speed the ISS is actually doing. It's the floor of the budget — the part you cannot avoid paying, because it's the definition of being in orbit.

**Note something that governs the entire orbits unit:** $v_{\text{circ}} \propto 1/\sqrt{r}$. **Higher orbits are slower.** The ISS at 400 km does 7.67 km/s; a GPS satellite at 20,200 km altitude does 3.87 km/s; a geostationary satellite at 35,786 km does 3.07 km/s. Climb higher and you go *slower*. This feels wrong — surely getting higher costs more energy? It does (you have to climb, which costs Δv), but the *orbital speed* you end up at is lower, because gravity is weaker up there and less centripetal force is needed to hold the circle. **The universe charges you Δv to climb and then hands you a slower, lazier orbit as change.** The orbits unit is devoted to the consequences of this one fact. For now, note: orbital speed goes *down* with altitude, and 7.67 km/s at LEO is near the maximum orbital speed you'll ever want.

**The key conceptual move:** the required Δv to orbit is *not* 7.67 km/s. It's 7.67 km/s **plus** everything you waste getting there. So:

$$\Delta v_{\text{required}} = \underbrace{v_{\text{orbital}}}_{7.67} + \underbrace{\Delta v_{\text{gravity}}}_{\sim 1.2\text{–}1.5} + \underbrace{\Delta v_{\text{drag}}}_{\sim 0.1\text{–}0.3} + \underbrace{\Delta v_{\text{steering}}}_{\sim 0.1} - \underbrace{\Delta v_{\text{Earth rotation}}}_{\text{up to }0.46}$$

That's the anatomy of 9.4. Each term is taken apart below, in order of importance, to understand not just its size but *why it's there and whether it can be fought.*

---

```example
orbital-velocity
```

## The equations of motion: a rocket is not a projectile

Understanding the losses requires the actual equations of motion for a rocket climbing through an atmosphere, and deriving them carefully is worthwhile because the *structure* of the equations is where every loss term lives — you can literally point at each loss in the differential equations.

Consider a rocket at some instant during ascent. It has velocity $\vec{v}$, and let $\gamma$ be the **flight-path angle** — the angle between the velocity vector and the local horizontal. So $\gamma = 90°$ means going straight up; $\gamma = 0°$ means flying horizontally; and orbit requires $\gamma \approx 0°$ (you go *around*, not up). The whole trajectory is a controlled swing of $\gamma$ from 90° at liftoff to ~0° at orbit insertion.

Three forces act on the rocket:
1. **Thrust** $T$, along the vehicle's axis (assume it points along the velocity vector — thrust aligned with motion, which is optimal and nearly true).
2. **Gravity** $mg$, pointing down (toward Earth's center).
3. **Drag** $D$, opposing the velocity, i.e. pointing backward along $-\vec{v}$.

Resolve Newton's second law along two directions: **along** the velocity (tangential) and **perpendicular** to it (normal). Along the velocity direction, the forces that matter are thrust (forward), the component of gravity along the flight path (backward, since you're climbing against gravity), and drag (backward):

$$m\frac{dv}{dt} = T - D - mg\sin\gamma$$

**Note this equation, because it contains three of the four loss terms explicitly.** The rate of change of speed equals thrust, minus drag, minus *the component of gravity along your direction of travel*. That last term, $mg\sin\gamma$, is the gravity loss, and look at what governs it: $\sin\gamma$. When you're going straight up ($\gamma = 90°$, $\sin\gamma = 1$), gravity subtracts its *full* value from your acceleration — every second, gravity eats $g = 9.8$ m/s of your velocity gain. When you're flying horizontally ($\gamma = 0°$, $\sin\gamma = 0$), gravity subtracts *nothing* from your forward acceleration (it's pulling perpendicular to your motion, bending your path but not slowing you). **This single $\sin\gamma$ term is why the entire game is to get horizontal fast.**

Now the perpendicular (normal) direction. The rocket's velocity vector is rotating (the path curves), and the force available to rotate it is the perpendicular component of gravity, $mg\cos\gamma$, minus whatever the vehicle does by steering. In the simplest case (a pure gravity turn, discussed in the gravity-turn section, where the vehicle doesn't actively steer and lets gravity do the bending):

$$mv\frac{d\gamma}{dt} = -mg\cos\gamma + (\text{steering forces})$$

The $-mg\cos\gamma$ term is gravity **bending your path downward** — pulling the velocity vector toward the horizontal, which is exactly what you want during ascent. This is the key to the gravity turn: gravity, which is stealing your speed via the tangential equation, is *simultaneously* doing the useful work of tipping you over via the normal equation, **for free.** This is exploited in the gravity-turn section.

Now integrate the tangential equation over the whole burn to get the Δv budget. Divide by $m$ and integrate:

$$\underbrace{\int \frac{T}{m}dt}_{\Delta v_{\text{ideal}} \text{ (what the rocket eqn gives)}} = \underbrace{\int \frac{dv}{dt}dt}_{v_{\text{final}} - v_{\text{initial}} \text{ (actual speed gained)}} + \underbrace{\int \frac{D}{m}dt}_{\Delta v_{\text{drag}}} + \underbrace{\int g\sin\gamma\, dt}_{\Delta v_{\text{gravity}}}$$

Rearranged, this is the whole argument in one line:

$$\boxed{\;\Delta v_{\text{ideal}} = \Delta v_{\text{gained}} + \Delta v_{\text{gravity}} + \Delta v_{\text{drag}}\;}$$

**The Δv your engine delivers** (left side, what the rocket equation charges you for) **equals the velocity you actually keep, plus the gravity loss, plus the drag loss.** The losses are literally the integrals of the loss terms in the equation of motion. And now each one can be seen precisely:

$$\boxed{\;\Delta v_{\text{gravity}} = \int_0^{t_b} g\sin\gamma\, dt\;} \qquad \boxed{\;\Delta v_{\text{drag}} = \int_0^{t_b}\frac{D}{m}\, dt\;}$$

These are not hand-waving. They're exact. Every launch trajectory ever flown is a solution to these equations that tries to make the two loss integrals as small as possible while still ending at $\gamma \approx 0$ and $v \approx 7.67$ km/s. Each integral is examined physically below, starting with the big one.

---

## Gravity loss: the price of time spent climbing slowly

Gravity loss is $\int g\sin\gamma\, dt$, and it's the largest loss — typically **1.2 to 1.5 km/s** of the 1.7. Understanding it deeply is understanding ascent, so it is worth building intuition from three angles.

### The pure-vertical thought experiment

Imagine the worst possible launch: straight up, $\gamma = 90°$ the entire time, $\sin\gamma = 1$. Then gravity loss is simply $\int g\, dt = g \times t_{\text{burn}}$. **Every single second you spend going straight up costs you 9.8 m/s of Δv, gone, for nothing.**

Suppose your ascent takes 8 minutes (typical). If you went straight up the whole time: $9.8 \times 480 = 4{,}704$ m/s of gravity loss. **Nearly 5 km/s wasted** — that would make orbit essentially impossible (you'd need $R = e^{(7670+4704)/3432} = e^{3.6} = 37$, a catastrophic mass ratio). Going straight up is a disaster, and now you can see *why* in the equation: $\sin\gamma = 1$ is the maximum possible value of the gravity-loss integrand, sustained.

So the entire trick is to make $\sin\gamma$ small — to get *off* vertical and *onto* horizontal — as fast as you safely can. Every degree you tip over reduces $\sin\gamma$ and thus the rate at which gravity drains you. This is why rockets pitch over almost immediately after clearing the tower: **they are fleeing the $\sin\gamma = 1$ condition as fast as structural and aerodynamic limits allow.**

### Why you can't just go horizontal immediately

If tipping over saves gravity loss, why not launch horizontally and skip the vertical part entirely? Two reasons, both hard constraints:

**1. The atmosphere.** You're sitting at the bottom of the thickest air. If you went horizontal immediately, you'd fly *through* the dense lower atmosphere at building speed, and drag (discussed below) would be catastrophic — drag scales with air density times velocity squared, and the lower atmosphere is where density is highest. You'd also subject the vehicle to crushing aerodynamic loads (max-Q, below) that would tear it apart. So you must first go *up*, quickly, to get above the thick air, *before* you build horizontal speed. **The vertical phase is a tax you pay to the atmosphere: climb out of the thick air fast, even though climbing costs gravity loss, because the drag and structural loads of going horizontal in thick air would be worse.**

**2. The ground.** Trivially but importantly, you're on the ground. You must gain *some* altitude before you can fly horizontally, or you'll fly into a mountain. The launch tower, terrain, and range safety all require an initial vertical clearance.

So ascent is a **compromise**: go vertical long enough to clear the tower and punch up out of the thickest atmosphere (paying gravity loss to do it), then tip over as fast as possible to kill $\sin\gamma$ and stop the gravity bleed, then spend the rest of the climb building horizontal speed with $\gamma$ near zero (where gravity loss is minimal). The optimal trajectory threads exactly between "too vertical, bleeding gravity loss" and "too horizontal, dying to drag." It is a genuine optimization, solved numerically for every vehicle, and its solution is the trajectory you see.

### The deepest way to see it: thrust-to-weight and the impulsive limit

Here's the most powerful framing, and it directly connects gravity loss to a design parameter you can control. Rewrite the gravity loss in terms of the burn: for a roughly vertical early phase, gravity loss accrues at rate $g$ per unit time, so **the total gravity loss is proportional to how long your burn takes.** And how long does the burn take? It depends on your **thrust-to-weight ratio (TWR)**. A high-TWR vehicle accelerates hard, reaches orbital velocity quickly, and spends *little time* fighting gravity — small gravity loss. A low-TWR vehicle wallows, taking a long time to get going, bleeding gravity loss the whole while.

Consider the limit: an **impulsive burn** — infinite thrust, zero duration. TWR → ∞, burn time → 0, and $\int g\sin\gamma\, dt \to 0$ because you integrate over zero time. **An impulsive burn pays zero gravity loss.** You'd instantly acquire orbital velocity with no time for gravity to act. This is the theoretical ideal, and every real rocket is an approximation to it — gravity loss is precisely the measure of *how far you fall short* of an impulsive burn.

This gives a clean design rule: **higher thrust-to-weight reduces gravity loss.** And this is why — recall the rocket equation and the chapter on the thermochemical ceiling — solid boosters and dense high-thrust first stages earn their place *despite* mediocre $I_{sp}$: they provide high TWR at liftoff, cutting the burn time through the gravity-loss-heavy low-and-slow phase. **A stage with poor $I_{sp}$ but high thrust can be worth more at liftoff than a high-$I_{sp}$ low-thrust stage, because the gravity loss it saves exceeds the $I_{sp}$ it lacks.** This is a genuine, quantitative trade: you can *spend* $I_{sp}$ to *buy* thrust and come out ahead on total Δv, if you're in the gravity-loss-dominated regime. It's why liftoff TWR is typically 1.2–1.5 (you want margin above 1 to accelerate meaningfully, but too high wastes propellant on drag and crushes the payload with g-forces), and why the first thing that happens after ignition is a hard, fast acceleration to get *moving* before gravity drinks your budget.

**One more consequence, slightly counterintuitive:** gravity loss means a rocket that hovers is a rocket that's dying. If TWR = 1 exactly, the rocket sits still, burning propellant, going nowhere, and $\int g\, dt$ climbs at 9.8 m/s per second with *zero* velocity to show for it. Hovering is pure gravity loss — it's the worst thing a launch vehicle can do. This is why you never see an orbital rocket hover on ascent; it accelerates continuously, because every second not spent gaining speed is a second of gravity loss with no return. (Landing is different — there, hovering briefly is worth it for precision, which is why landing burns are a separate, carefully-managed thing, covered in the chapter on reusability.)

---

```example
gravity-loss
```

## The gravity turn: letting the enemy do your steering

As established above, gravity loss forces you to tip over fast. But *how* do you tip over? Here is where ascent becomes genuinely elegant, and where the same gravity that's stealing your speed does you an enormous favor for free.

### The naive way, and why it wastes Δv

The obvious way to change your flight-path angle is to **steer** — gimbal the engine, thrust sideways, force the vehicle to rotate. But thrust used for steering is thrust *not* used for acceleration along your path. If you point the engine 10° off your velocity vector to turn, only $\cos 10° = 0.985$ of the thrust goes into speeding you up; the other $\sin 10° = 0.17$ is spent cranking you around. That sideways component is **steering loss** — Δv delivered by the engine that doesn't go into your orbital velocity. It's usually small (~0.1 km/s) precisely because good trajectories *avoid* active steering. And the way they avoid it is beautiful.

### The gravity turn

Recall the normal (perpendicular) equation of motion derived above:

$$mv\frac{d\gamma}{dt} = -mg\cos\gamma$$

(with no steering forces — the vehicle keeps its thrust aligned with its velocity and doesn't actively push sideways). This equation shows that **gravity, through its perpendicular component $g\cos\gamma$, is continuously rotating your velocity vector downward — bending your path from vertical toward horizontal — all on its own.** You don't have to steer. Gravity does it.

Here's the maneuver, called a **gravity turn** (or zero-lift turn):
1. Lift off vertically ($\gamma = 90°$).
2. Shortly after clearing the tower, give a small, deliberate **pitch-over kick** — steer just a few degrees off vertical, so $\gamma$ drops slightly below 90°. This is the only active steering in the whole ascent, and it's tiny.
3. Now *stop steering*. Keep the thrust aligned with the velocity vector and let go. Because $\gamma$ is now slightly off vertical, gravity's perpendicular component $g\cos\gamma$ has something to grab, and it begins rotating the velocity vector downward — bending the trajectory over. As the rocket climbs and speeds up, gravity keeps tipping it, more and more horizontal, following a smooth curve.
4. By the time the rocket is out of the atmosphere and approaching orbital velocity, gravity has naturally swung $\gamma$ from 90° down to nearly 0° — horizontal — which is exactly the condition for orbit.

**The vehicle steers itself onto the correct trajectory using gravity as the steering force, spending essentially no thrust on turning.** The single pitch-over kick at the start is the only steering Δv you pay; everything after is free, gravity doing the work. This is why launch trajectories are those smooth, graceful arcs — they're not being actively flown around a curve, they're *falling* around it, with gravity as the invisible hand tipping them over.

### The beautiful double role of gravity

The structure is worth appreciating. **Gravity plays two opposite roles simultaneously during ascent:**

- In the **tangential** equation, gravity is the villain: $-g\sin\gamma$ steals your speed. Gravity loss.
- In the **normal** equation, gravity is the hero: $-g\cos\gamma$ tips you over toward horizontal, for free, saving you the steering loss you'd otherwise pay.

And these two roles are **complementary in exactly the right way.** Early in flight, $\gamma$ is near 90°: $\sin\gamma \approx 1$ (max gravity loss — bad) but $\cos\gamma \approx 0$ (little turning — but you don't want to turn much yet, you want to climb out of the atmosphere first). Late in flight, $\gamma$ is near 0°: $\sin\gamma \approx 0$ (minimal gravity loss — good, you're going horizontal and fast) and $\cos\gamma \approx 1$ (maximum turning authority — but by now you're nearly horizontal and don't need to turn much more). **The geometry arranges for gravity to hurt you most when you can least avoid it (early, climbing out) and help you most when you need it (turning you over), and to fade in both roles right as you reach orbit.** It's as if the physics were designed to make ascent just barely possible — which, of course, it wasn't; we just happen to live on a planet where the numbers work out to permit it, and if $g$ were much larger, or $v_{\text{orbital}}$ much higher, no chemical rocket could close the trajectory at all.

### Why the pitch-over kick is so delicate

The timing and magnitude of the initial pitch-over kick is one of the most sensitive parameters in the whole ascent, and getting it wrong is expensive:
- **Kick too early or too hard:** you go horizontal too soon, while still deep in the atmosphere, and drag and aerodynamic loads spike (you're flying sideways through thick air at building speed). In the worst case, aerodynamic forces exceed structural limits and the vehicle breaks up.
- **Kick too late or too soft:** you stay too vertical too long, bleeding gravity loss ($\sin\gamma$ near 1), and you may not have enough trajectory left to swing all the way to horizontal before your propellant runs out — you reach engine cutoff still climbing at a steep angle, with a large vertical velocity component that's useless for orbit and that gravity will then convert into a fall back toward Earth.

The optimal kick is computed numerically for each vehicle and each mission, and it's tuned to thread between these failures. Once the kick is set, though, the rest is gravity — which is why the guidance during a nominal ascent is mostly *monitoring* rather than *steering*. The rocket knows how to fall around the curve; the computer just watches to make sure it's falling correctly.

---

## Drag loss, max-Q, and the surprisingly small number

Drag loss is $\int (D/m)\, dt$, and here's the surprise that catches everyone: **it's small.** Typically only **0.1 to 0.3 km/s** of the 1.7 — an order of magnitude less than gravity loss. Given that drag is the force everyone associates with "atmosphere = hard," why is its Δv cost so modest? The answer teaches you how atmospheric ascent actually works.

### The drag force and why the loss is small

The drag force is:

$$D = \tfrac12 \rho v^2 C_d A$$

where $\rho$ is air density, $v$ is speed, $C_d$ is the drag coefficient, and $A$ is the cross-sectional area. It scales with density times velocity *squared*, so drag is worst when $\rho$ and $v$ are *both* large. Now here's the crucial fact: **those two conditions barely overlap.** When density $\rho$ is high (down low, first ~30 km), the rocket is still slow (it just left the pad). By the time the rocket is fast (later in ascent), it's up high where $\rho$ has fallen off exponentially — the atmosphere thins so fast with altitude that by 30–50 km, drag is negligible regardless of speed.

So the rocket spends only a brief window — roughly the first 90 seconds, passing through the lower atmosphere — where both density and speed are appreciable enough for drag to matter. Before that it's too slow; after that it's too high. **Drag loss is small because the rocket escapes the thick atmosphere quickly** — it climbs out of the region where drag can hurt it before it builds the speed that would make drag catastrophic. This is, incidentally, the *other* reason (besides clearing the tower) for the initial vertical phase: get *up*, out of the dense air, fast, before you accelerate to the speeds where drag would bite.

### Max-Q: the moment of maximum stress

The product $q = \tfrac12 \rho v^2$ is called **dynamic pressure**, and it's the aerodynamic load on the vehicle. Early in flight it's low (high $\rho$, but low $v$). It rises as the rocket speeds up, then falls as the rocket climbs out of the dense air ($\rho$ dropping faster than $v^2$ rises). Somewhere in between — typically 60–90 seconds after liftoff, around 10–15 km altitude — it reaches a maximum: **max-Q**, the moment of peak aerodynamic stress on the vehicle.

Max-Q is the structurally dangerous moment of ascent, and it's why you'll hear, in every launch commentary, the callout: *"vehicle is throttling down."* Many rockets deliberately **throttle their engines down** as they approach max-Q, reducing acceleration so the vehicle doesn't build speed too fast while still in dense air — keeping the dynamic pressure below the structural limit. Then, past max-Q, once the air has thinned, they **throttle back up** to full power. The Saturn V did this; the Shuttle did this ("throttle up" after max-Q was a standard callout — tragically, "Challenger, go at throttle-up" was among the last transmissions to Challenger). This throttle-down/throttle-up sequence — the "throttle bucket" — is the rocket managing the trade between gravity loss (which wants maximum thrust, minimum time) and structural survival (which wants reduced thrust through max-Q). It's a real, visible manifestation of the loss physics we've been deriving.

### The trade nobody escapes

Notice the tension max-Q reveals. Gravity loss (discussed earlier) says: **thrust hard, minimize time, high TWR.** Drag and structural loads say: **don't go too fast in thick air, throttle down through max-Q.** These pull in opposite directions during the first two minutes, and the trajectory is a negotiated settlement: accelerate hard enough to minimize gravity loss, but not so hard that you exceed dynamic-pressure limits before clearing the atmosphere. The throttle bucket is where these two demands are balanced in real time. And the fairing — the aerodynamic nose cone protecting the payload — is jettisoned the moment drag becomes negligible (usually ~3–4 minutes in, above ~100 km), because from then on it's just dead weight being dragged through a Δv it no longer needs to experience (there's the through-line again — the fairing is staged away the instant it's useless, exactly like an empty tank).

### Why drag scales badly for small rockets

One more insight the drag equation hands you, and it explains a real feature of the launch industry. Drag scales with cross-sectional *area* ($\propto r^2$), while the rocket's mass scales with *volume* ($\propto r^3$). So the drag *deceleration* ($D/m$) scales as $r^2/r^3 = 1/r$ — **drag loss is worse for smaller rockets.** A tiny rocket has a lot of surface area per unit mass, so drag hurts it proportionally more; a giant rocket barely notices drag. This is one reason (among several) that very small launch vehicles are inefficient and the industry trends toward larger rockets: the physics of drag, like the physics of the square-cube law generally, rewards size. A pebble and a boulder dropped through air fall very differently, and the same logic makes a small rocket pay more of its budget to drag than a large one.

---

## The rebate: Earth's rotation, and how geography became geopolitics

So far the atmosphere and gravity have only *taken*. Now, finally, a term that *gives*: Earth's rotation. And this single term — a free gift of up to 0.46 km/s — turns out to explain the map of every spaceport on Earth, and to encode a surprising amount of Cold War geopolitics into the flight paths of rockets. This is where physics becomes geography becomes politics, seamlessly.

### The free velocity

Earth rotates. A point on the equator is moving eastward at:

$$v_{\text{rot}} = \frac{2\pi R_\oplus}{T_{\text{day}}} = \frac{2\pi \times 6{,}371{,}000}{86{,}164} = \mathbf{465\ m/s}$$

(using the sidereal day, 86,164 s — the true rotation period relative to the stars, which is what matters physically). So **if you launch eastward from the equator, you start with 465 m/s of orbital velocity for free** — you and your rocket are already moving east at 465 m/s before the engines even light, because you're standing on a spinning planet, and orbit is (mostly) an eastward motion. That's 465 m/s you don't have to buy with propellant. In exponential terms (from the rocket equation), shaving 465 m/s off a 9.4 km/s budget is worth a real chunk of payload — a few percent, on every flight, forever.

{{image: Baikonur Cosmodrome | Baikonur, at 46°N: far from the equator, it collects only ~323 m/s of rebate against Kourou's ~409. Geography is destiny in the ascent budget — and the Soviet space programme paid that latitude penalty on every single launch.}}

But the rebate depends on **where** and **which direction** you launch:

**Latitude matters.** The eastward speed of Earth's surface is $465 \cos(\text{latitude})$ — maximum at the equator, zero at the poles (where you're just spinning in place). At Kennedy Space Center (28.5°N): $465 \cos(28.5°) = 409$ m/s. At Baikonur (46°N): $465\cos(46°) = 323$ m/s. At a hypothetical polar launch site: ~0 m/s. **The closer to the equator, the bigger the free rebate.**

**Direction matters even more.** The rebate is only "free" if you launch **eastward**, with Earth's rotation. Launch **westward**, against the rotation, and you must not only forgo the 465 m/s gift but *also cancel out* your existing eastward motion — you pay the rebate *twice*, as a penalty. A westward equatorial launch costs ~930 m/s *more* than an eastward one. And launching due **north or south** (into a polar orbit) gets you *none* of the rebate — you're not using Earth's eastward spin at all.

### Why almost everything launches east over water

{{image: Guiana Space Centre | The Guiana Space Centre at Kourou, just 5° from the equator on an east-facing Atlantic coast — the geography that collects almost the full 0.47 km/s rotation rebate. The launch map of the world is the rocket equation drawn on coastlines.}}

Put these together and the launch map of the world writes itself:

**Launch eastward.** Nearly every orbital launch in history goes east, to collect the rotation rebate. This is why Cape Canaveral launches east *over the Atlantic* — the rocket heads out over open ocean, both to collect the rebate and (critically) so that if it fails, the debris falls in the sea, not on cities. Range safety and the rotation rebate *both* point east over water, which is why spaceports cluster on **east-facing coastlines**: Florida (Atlantic to the east), Kourou (Atlantic to the east), Vandenberg (Pacific — but Vandenberg launches *south* for polar orbits, more on that below), Tanegashima in Japan, Sriharikota in India (Bay of Bengal to the east). **The rocket equation and range safety agree, and the agreement is written on the coastlines of the world.**

**Launch near the equator.** The rebate is biggest at the equator, so equatorial launch sites are prized. This is why **Kourou, French Guiana** (5°N) is one of the most valuable pieces of launch real estate on Earth — Europe's spaceport is in South America, specifically because 5°N gives a rotation rebate of $465\cos(5°) = 463$ m/s, nearly the full 465, versus what a European site (~48°N) would give: $465\cos(48°) = 311$ m/s. **Europe launches from South America to buy 150 m/s of free velocity**, and that 150 m/s, through the exponential, is worth enough extra payload to justify operating a spaceport across an ocean.

### The geopolitics hidden in the flight paths

Now the geopolitical part. Because latitude sets the *minimum inclination* of the orbit you can reach (you can't easily reach an orbit inclined less than your launch latitude without an expensive plane change — covered in the orbits unit, in the chapter on orbital maneuvers), a spaceport's latitude constrains what it can do. But the deeper geopolitics is in the *direction* and *overflight* constraints:

**Baikonur and the Soviet penalty.** The Soviet Union's main spaceport, Baikonur, is at 46°N — far from the equator, giving a smaller rebate (323 m/s vs Florida's 409). Worse, the USSR was landlocked in the relevant directions: launching east from Baikonur sends spent stages and potential debris across Kazakhstan, China, and beyond — not open ocean. The Soviets accepted this, dropping stages on land in designated (sparsely populated) drop zones, because they had no equatorial coastline. **Their geography cost them Δv and forced them to litter their own steppe with rocket stages** — a permanent, structural disadvantage baked into where their country happened to be, and one reason Soviet rockets emphasized brute lifting power (to overcome the Δv penalty) over efficiency.

**Israel launches west — the only country that does.** Israel's Shavit rockets launch **westward**, over the Mediterranean, *against* Earth's rotation, paying the full ~930 m/s penalty (forgoing the 465 rebate *and* cancelling the existing 465). Why would anyone do this? **Because to launch east, Israel's rockets would overfly hostile neighboring countries**, dropping spent stages on (or provoking) nations it is technically at war with. So Israel eats an enormous Δv penalty — nearly a full km/s, which through the exponential roughly *halves* its payload capacity — purely for geopolitical safety. **This is the single clearest example in the world of politics overriding physics in launch: a nation deliberately flying the aerodynamically and energetically *worst* direction because the *politically* best direction is closed to it.** When you see a Shavit launch heading out over the Mediterranean toward the sunset, you are watching Δv being sacrificed on the altar of geopolitics, in real time, quantifiably.

**Vandenberg launches south.** The US has two main spaceports: Florida (launches east, for low-inclination and geostationary orbits) and Vandenberg, California (launches *south*, over the Pacific, for polar and sun-synchronous orbits — covered in the chapter on perturbations / sun-synchronous orbits). Why two? Because from Florida you cannot safely launch into a polar orbit — a due-south launch from Florida would overfly Cuba and Central America, and a due-north launch would overfly the US mainland. Vandenberg, on the California coast with open Pacific to the south, can launch due south over water into polar orbits without overflying anyone. **The US needs two spaceports because a single site cannot reach all orbital inclinations without overflying land** — geography again dictating infrastructure, this time to reach the polar orbits that Earth-observation and spy satellites require.

### The synthesis: the map is the physics

Step back and see the whole picture. **The global distribution of spaceports is not an accident of history or national pride — it is a direct readout of ascent physics.** East-facing coastlines (rebate + range safety), proximity to the equator (maximum rebate), open water downrange (safety), and the specific direction each site launches (east for low inclination, south for polar) — every one of these is dictated by the loss-and-rebate budget we derived today. A geographer looking at the launch map, and a physicist looking at $v_{\text{rot}} = 465\cos(\text{lat})$ and the range-safety constraint, are looking at the same thing. And the exceptions — Israel flying west, the Soviets dropping stages on the steppe — are exactly where *politics* was allowed to override *physics*, at a precisely calculable cost in Δv and therefore payload. **You can price the geopolitics.** Israel's westward launch costs ~930 m/s, which is worth roughly half its payload; that number is the quantified cost of its neighbors' hostility, and it's paid on every launch. Physics doesn't care about borders, but it will tell you exactly what your borders cost you.

---

```example
launch-rebate
```

## Putting it together: a real loss budget

Assembling the whole thing for a realistic vehicle shows the 9.4 emerging from its parts. Take an eastward launch from Cape Canaveral (28.5°N) to a 400 km LEO. The budget looks like this:

| Term | Value (km/s) | Sign | Why |
|---|---|---|---|
| Orbital velocity (at 400 km) | 7.67 | + | The honest number — real speed you keep |
| Gravity loss | ~1.3 | + | $\int g\sin\gamma\, dt$ — time spent climbing |
| Drag loss | ~0.15 | + | $\int (D/m)\, dt$ — brief, in the thick air |
| Steering loss | ~0.05 | + | The pitch-over kick and minor corrections |
| Altitude/potential term | ~0.2 | + | Raising the orbit to 400 km (some bookkeeping overlaps gravity loss) |
| Earth rotation rebate | −0.41 | − | $465\cos(28.5°)$ — free eastward velocity |
| **Total required Δv** | **~9.0–9.4** | | What the engine must deliver |

The exact split varies with vehicle, trajectory, and how you do the bookkeeping (gravity loss and the altitude term overlap somewhat depending on convention), but the totals land at **9.0–9.4 km/s**, and now every digit is accounted for. **The 9.4 is 7.67 of physics plus ~1.7 of loss minus ~0.4 of rebate**, and you can point at each contributor and say what it is and whether it can be fought.

**What can be reduced, and by how much:**
- **Gravity loss** (~1.3): reducible by higher thrust-to-weight (faster ascent, less time), but bounded below — you can't have an impulsive burn, and structural/g-limits cap TWR. Realistically you might shave 0.2–0.3 km/s with an aggressive high-thrust ascent, at the cost of higher structural loads and g-forces. **This is where most of the recoverable loss lives.**
- **Drag loss** (~0.15): already small; hard to reduce much without a bigger, sleeker vehicle. Not worth chasing.
- **Steering loss** (~0.05): already minimized by the gravity-turn technique. Nearly optimal already.
- **Rotation rebate** (−0.41): maximized by launching east from as close to the equator as your geography and politics allow. Kourou (5°N) beats Canaveral (28.5°N) by ~0.05 km/s of extra rebate — small, but free, and it compounds over a launch program.

Build the budget with your own hands. Slide the launch latitude and the thrust-to-weight below and watch the total the engine must deliver. Notice two things: launching near the equator collects a bigger slice of Earth's free eastward spin, and a punchier climb shaves a little gravity loss — but the total barely moves off ~9.4, because most of the overhead is simply the cost of leaving a rotating planet through its air.

```ascentbudget
```

**The deep lesson:** the losses are *mostly irreducible*. You can trim gravity loss with brute thrust and collect the full rotation rebate with good site selection, but the fundamental ~1.5 km/s of overhead is baked into the problem of climbing out of a gravity well through an atmosphere from a rotating planet. There is no clever trajectory that eliminates it — it's been optimized to within a few hundred m/s of the theoretical floor for decades. **This is why the 9.4 number has been stable for the entire history of spaceflight: it's not an engineering parameter that improves with technology, it's a property of launching from Earth, and Earth hasn't changed.** The Saturn V paid ~9.4 km/s to LEO in 1967; the Falcon 9 pays ~9.4 km/s to LEO today. Sixty years of progress, and the ascent budget is identical, because the planet is identical. All the progress went into $\varepsilon$, into reusability, into cost — not into the budget, which is fixed by physics that cannot be negotiated.

---

## Abort, and the Shuttle's fraudulent options

One more piece of ascent physics, because it's where the loss budget meets human lives, and because it exposes a lie the Space Shuttle program told for thirty years.

If something goes wrong during ascent, the crew needs a way to survive — an **abort mode.** And abort during ascent is brutally constrained by exactly the physics we've derived, because at any moment during the climb the vehicle is in a specific, usually terrible, energy state: too fast to just land, too slow to reach orbit, deep in a gravity well, possibly still in the atmosphere. The abort options depend on *when* the failure happens, and they map onto the ascent trajectory:

- **Early failure (first ~2 minutes, low and slow):** you don't have the energy to go anywhere useful. The only options are a launch-escape system (a small rocket that yanks the crew capsule away from the failing vehicle — Mercury, Apollo, Dragon, Soyuz all have these) or, if you're low enough, a pad abort. The launch-escape tower is why crewed capsules have that spiky rocket on top during launch; it's jettisoned once the vehicle is high and fast enough that it's no longer needed.
- **Mid-ascent failure:** you might have enough energy to turn around and glide/fly back, or to continue to a lower-than-planned orbit, depending on the vehicle.
- **Late failure (near orbital velocity):** you might be able to limp to orbit, or to a safe abort orbit, and sort it out there.

### The Shuttle's abort modes were mostly theater

The Space Shuttle had a famous list of ascent abort modes — RTLS (Return to Launch Site), TAL (Transatlantic Abort Landing), AOA (Abort Once Around), ATO (Abort to Orbit) — and they sound comprehensive and reassuring. Several of them were, in the honest assessment of the people who would have had to fly them, **not survivable and probably not physically real.**

The worst was **RTLS — Return to Launch Site.** The concept: if an engine fails early, the Shuttle would continue downrange burning its remaining engines, then — while still attached to its external tank and boosters, still supersonic, still in the atmosphere — **flip around 180° and fly *backward*, then thrust to cancel its downrange velocity and fly back to Florida.** Astronaut John Young, who commanded the first Shuttle flight and was as experienced and unflappable as they came, reportedly called RTLS **"an unnatural act of physics"** and expressed grave doubts it could actually be flown. The maneuver required the vehicle to reverse a velocity of thousands of m/s (paying, in effect, the full ascent budget backward) while managing aerodynamic loads that were near or beyond structural limits, in a configuration and flight regime that had never been tested and never could be tested without risking a crew. It was on the checklist. Nobody knew if it worked. It was, in the darkest sense, a mode that existed to be listed rather than flown.

**Why does this belong in an ascent lecture?** Because RTLS is *ascent physics run in reverse*, and its impossibility is a direct consequence of the loss budget. During ascent you spend ~9 km/s of Δv, most of it acquiring downrange velocity. To "return to launch site" mid-ascent, you must *undo* that velocity — cancel thousands of m/s and reverse direction — which costs a comparable amount of Δv and subjects the vehicle to the same crushing aerodynamic and structural loads as ascent, but in a configuration never designed for it. **The reason RTLS was so dubious is the same reason ascent is so expensive: velocity in a gravity well through an atmosphere is enormously costly to acquire, and therefore enormously costly to reverse.** You cannot cheaply undo an ascent, because the ascent budget doesn't have a refund policy.

The deeper point, developed in the chapter on risk and organizations: the Shuttle's abort modes were a case study in an organization believing its own reassuring paperwork. The modes were listed, briefed, and trained, and this created an impression of safety — a "we have options" comfort — that the underlying physics did not actually support. When Challenger failed at 73 seconds, there *was* no survivable abort mode for that failure at that time; the crew cabin, it's believed, survived the breakup intact and the crew were likely conscious during the fall to the ocean. The abort matrix had a gap exactly where the vehicle was most vulnerable, and the gap was papered over with modes that sounded like solutions. **Ascent is unforgiving, the loss budget is why, and pretending otherwise is how you get people killed** — a theme returned to, hard, in a later unit.

---

## Coda: the tax on the tax

Collecting the argument: ascent is where the abstract rocket equation of the earlier chapters finally touches the ground — literally.

**Through the earlier chapters, "9.4 km/s to LEO" was a given.** Taking it apart reveals it is not a physical constant but a **budget**: 7.67 km/s of honest orbital velocity (real, physical, the speed the ISS is doing) plus ~1.7 km/s of loss minus ~0.4 km/s of rotation rebate. And crucially, that 1.7 km/s of loss is the **tax on the tax** — because the rocket equation showed that every km/s of Δv costs exponentially in propellant, the 1.7 km/s of pure overhead inflates the mass ratio dramatically. Eliminating it would roughly double payload fraction. It's real, it's expensive, and it comes from launching through an atmosphere out of a gravity well from a spinning planet.

**Every term comes from the equations of motion:**
- **Gravity loss** (~1.3 km/s, the big one): $\int g\sin\gamma\, dt$ — the price of *time spent climbing slowly*. Minimized by tipping over fast (killing $\sin\gamma$) and by high thrust-to-weight (short burn). Bounded below by the impossibility of an impulsive burn. This is why rockets pitch over immediately and why high-thrust dense first stages earn their place despite poor $I_{sp}$ — they buy back gravity loss.
- **Drag loss** (~0.15 km/s, surprisingly small): $\int (D/m)\, dt$ — small because the rocket escapes the thick air before it builds the speed that would make drag catastrophic. Max-Q is its dangerous moment, managed by the throttle bucket.
- **Steering loss** (~0.05 km/s, nearly zero): minimized by the **gravity turn** — letting gravity's perpendicular component do the steering for free, so the only steering Δv paid is the initial pitch-over kick.
- **Rotation rebate** (−0.41 km/s, the gift): $465\cos(\text{lat})$ of free eastward velocity, collected by launching east from near the equator.

**Two things are most worth carrying:**

**First, the gravity turn is where gravity plays both villain and hero.** The same $g$ that steals your speed ($-g\sin\gamma$, tangentially) tips you gracefully onto the horizontal trajectory you need ($-g\cos\gamma$, normally), for free, and the geometry arranges these two roles to complement each other almost perfectly across the ascent. Every smooth launch arc you've ever watched is a rocket *falling* around a curve, steered by the very force it's fighting. That's not a trick anyone invented — it's the physics being just barely generous enough to permit ascent on a planet like ours.

**Second, the loss budget is written on the map of the world.** East-facing coastlines, equatorial spaceports, open water downrange, Vandenberg launching south and Florida launching east — every feature of the global launch map is a direct readout of the ascent physics we derived. And the exceptions are where politics overrode physics at a calculable cost: Israel launching *west* over the Mediterranean, paying ~930 m/s — roughly half its payload — because launching east would overfly hostile neighbors. **You can price the geopolitics.** The cost of a nation's hostile borders, in payload, paid on every launch, is a number you can compute from $465\cos(\text{lat})$ and a map. Physics doesn't care about politics, but it will tell you exactly what your politics cost you.

**The through-line, for the fourth time.** The fairing is jettisoned the instant drag becomes negligible — staged away the moment it's dead weight, exactly like an empty tank (as in the chapter on staging). *Never carry anything through a Δv it does not need to experience.* Ascent is that principle applied continuously, in real time, to the trajectory itself: don't spend a second going straight up that you don't have to, don't carry the fairing a meter past where it's useful, don't fly a degree off your velocity vector that gravity could steer for you.

**And the punchline that connects to everything ahead.** The 9.4 km/s budget has been *stable for the entire history of spaceflight* — the Saturn V paid it in 1967, the Falcon 9 pays it today — because it's a property of Earth, and Earth hasn't changed. This is the seized-knob lesson one final time: $v_e$ is capped by chemistry (the chapter on the thermochemical ceiling), $\varepsilon$ is floored by matter (the rocket equation), staging can only claw back so much (the chapter on staging), and now the ascent budget is fixed by the planet (this chapter). **Four locked constraints.** All the progress of the last sixty years — reusability, cost, manufacturing — happened *around* these locks, never through them. Which is exactly why the next three chapters turn to the places where progress *is* possible: the engine cycles that squeeze more from fixed chemistry (the chapter on engine cycles), the propulsion that escapes chemistry entirely (the chapter on escaping chemistry), and the economics that gives up on the physics and attacks the cost instead (the chapter on reusability).

The chapter on engine cycles opens the turbopump. You must inject propellant into a chamber at 300 bar, something must pump it, the pump needs power, and the power must come from the propellant — a circular problem with several ingenious solutions, one of which the Americans believed was physically impossible right up until they found out the Soviets had been flying it for twenty years.

---
---

## Problem set

*This set closes the ascent material and bridges to the orbits unit. Problems 1–4 are the loss physics; 5–6 are the gravity turn and geography; 7 is the full budget; 8–9 tie the unit together. Full worked answers follow.*

---

**1 — The honest number.** 
**(a)** Compute the circular orbital velocity at 200 km, 400 km, 800 km, and 2,000 km altitude. ($R_\oplus = 6{,}371$ km, $\mu = 3.986\times10^{14}$.)
**(b)** Confirm that orbital velocity *decreases* with altitude, and explain physically why higher orbits are slower.
**(c)** At what altitude would orbital velocity be exactly 7.0 km/s?

**2 — Gravity loss and the straight-up disaster.** 
**(a)** A rocket ascends purely vertically ($\gamma = 90°$ throughout) for 7 minutes. Compute its gravity loss.
**(b)** A realistic ascent averages $\sin\gamma \approx 0.35$ over an 8-minute burn (because it tips over). Compute the gravity loss.
**(c)** Compare, and explain in one sentence why tipping over is worth so much Δv.
**(d)** Using the rocket equation with $v_e = 3{,}400$ m/s, compute the mass-ratio difference between paying the (a) gravity loss versus the (c) gravity loss, on top of 7.67 km/s of orbital velocity. What does this tell you about the value of the gravity turn?

**3 — Thrust-to-weight and gravity loss.** 
**(a)** Explain, using the impulsive-burn limit, why higher thrust-to-weight reduces gravity loss.
**(b)** Two candidate liftoff stages must each contribute 4.0 km/s of useful velocity. Stage A (solid-like): $I_{sp} = 280$ s, very high thrust, so its short burn incurs only 0.2 km/s of gravity loss. Stage B (efficient): $I_{sp} = 340$ s, lower thrust, so its longer burn incurs 0.6 km/s of gravity loss (0.4 more than A). Compute the mass ratio each requires (ideal Δv = 4.0 + its gravity loss). Which needs *less* propellant per unit payload? Then find the crossover: how much extra gravity loss would B have to suffer before the high-thrust Stage A wins?
**(c)** What does this problem reveal about why solid boosters (bad $I_{sp}$, huge thrust) are used at liftoff — and about why the trade is *not* automatic?

**4 — Drag and max-Q.** 
**(a)** Explain why drag loss (~0.15 km/s) is so much smaller than gravity loss (~1.3 km/s), despite the atmosphere being "the hard part" in popular imagination.
**(b)** Dynamic pressure is $q = \tfrac12\rho v^2$. Early in flight $\rho$ is high and $v$ low; later $\rho$ is low and $v$ high. Explain why $q$ has a maximum in between, and why max-Q is the structurally dangerous moment.
**(c)** Why do rockets throttle *down* approaching max-Q and *up* after? What trade is being managed?
**(d)** Drag deceleration scales as $1/r$ (radius). Explain why this means small rockets suffer more drag loss, and what it implies about optimal launch-vehicle size.

**5 — The gravity turn.** 
**(a)** Write the normal (perpendicular) equation of motion for a gravity turn and explain how gravity steers the rocket.
**(b)** Explain the "double role" of gravity during ascent — villain in one equation, hero in another — and why the geometry makes these complementary.
**(c)** Explain what goes wrong if the initial pitch-over kick is (i) too aggressive, (ii) too gentle.

**6 — Geography as physics.** 
**(a)** Compute the Earth-rotation rebate for eastward launches from Kourou (5°N), Cape Canaveral (28.5°N), Baikonur (46°N), and a polar site (90°).
**(b)** Israel's Shavit launches *westward*. Compute the total Δv penalty relative to an eastward launch from the same latitude (~31°N). Express as a fraction of the 9.4 km/s budget.
**(c)** Using the rocket equation ($v_e = 3{,}400$ m/s), estimate how much Israel's westward launch reduces its payload capacity relative to an eastward launch. 
**(d)** Explain, in a paragraph, how the global distribution of spaceports is a "readout of ascent physics," citing at least three specific features of the launch map.

**7 — The full budget. (The concrete one.)** Assemble a complete ascent Δv budget for an eastward launch from Cape Canaveral (28.5°N) to 400 km LEO. Include: orbital velocity, gravity loss (~1.3), drag loss (~0.15), steering loss (~0.05), altitude term (~0.2), and rotation rebate. Show the total, and confirm it lands near 9.4 km/s. Then: which single term would you most want to reduce, and how, and what's the realistic best case?

**8 — Why the budget never improves.** Explain why the Δv-to-LEO budget (~9.4 km/s) has been essentially constant for the entire history of spaceflight — Saturn V (1967) and Falcon 9 (2020s) pay nearly the same — while enormous progress has occurred in other areas. What does this tell you about where spaceflight progress comes from, connecting to the "seized knobs" theme of the earlier chapters?

**9 — Unit I synthesis (ascent edition).** In three or four paragraphs, explain how ascent completes the picture built in the earlier chapters. Cover: the four "locked constraints" of Unit I ($v_e$, $\varepsilon$, staging's limits, the ascent budget), why each is fixed, how the through-line principle ("never carry anything through a Δv it doesn't need") appears in ascent, and what this implies about where the next three chapters (on engine cycles, escaping chemistry, and reusability) must look for progress. This is the ascent capstone essay.

---

---

## Worked answers

---

### 1 — The honest number

**(a)** $v = \sqrt{\mu/r}$, $r = R_\oplus + h$:

| Altitude | $r$ (km) | $v$ (m/s) |
|---|---|---|
| 200 km | 6,571 | **7,789** |
| 400 km | 6,771 | **7,673** |
| 800 km | 7,171 | **7,456** |
| 2,000 km | 8,371 | **6,900** |

**(b)** Confirmed — velocity drops monotonically with altitude (7,789 → 6,900 m/s). **Physically:** orbital velocity is set by the balance $\mu/r^2 = v^2/r$, giving $v = \sqrt{\mu/r}$. Higher up, gravity is weaker (the $1/r^2$ force is smaller), so *less* centripetal force is needed to hold the circular path, so a *slower* speed suffices. You're not fighting as much gravity, so you don't need to move as fast to keep missing the ground. **The counterintuitive part — "higher costs more but ends slower" — is resolved by noting that climbing costs *Δv* (energy to get there), but the *destination speed* is lower because gravity is gentler there.** This single fact governs all of the orbits unit: it's why GEO satellites drift slowly (3.07 km/s), why higher orbits have longer periods, and why "catching up" to something ahead of you in orbit requires dropping *lower* and speeding up (the rendezvous paradox, in the chapter on orbital maneuvers).

**(c)** Set $\sqrt{\mu/r} = 7{,}000$: $r = \mu/7000^2 = 3.986\times10^{14}/4.9\times10^7 = 8{,}135$ km, so altitude $= 8{,}135 - 6{,}371 = \mathbf{1{,}764\ km}$. (A medium Earth orbit, in the region GPS-adjacent but lower.)

---

### 2 — Gravity loss and the straight-up disaster

**(a)** Vertical, $\sin\gamma = 1$, for 7 min: $\Delta v_{\text{grav}} = g \times t = 9.80665 \times 420 = \mathbf{4{,}119\ m/s = 4.12\ km/s}$.

**(b)** Realistic, $\overline{\sin\gamma} = 0.35$, 8 min: $\Delta v_{\text{grav}} = 9.80665 \times 0.35 \times 480 = \mathbf{1{,}648\ m/s = 1.65\ km/s}$.

**(c)** The vertical ascent wastes **4.12 km/s**; the realistic tipped-over ascent wastes **1.65 km/s** — a saving of nearly 2.5 km/s. **Tipping over is worth ~2.5 km/s of Δv because it reduces $\sin\gamma$ from 1 to ~0.35, and gravity loss is the integral of $g\sin\gamma$ over time — cutting $\sin\gamma$ by a factor of ~3 cuts the loss by roughly the same factor.** Going horizontal means gravity pulls *perpendicular* to your motion (bending your path, the useful gravity-turn effect) rather than *against* it (draining your speed).

**(d)** With $v_e = 3{,}400$ m/s, total Δv = 7.67 (orbital) + gravity loss:
- Vertical: $\Delta v = 7{,}670 + 4{,}119 = 11{,}789$ m/s → $R = e^{11789/3400} = e^{3.467} = \mathbf{32.0}$
- Realistic: $\Delta v = 7{,}670 + 1{,}648 = 9{,}318$ m/s → $R = e^{9318/3400} = e^{2.741} = \mathbf{15.5}$

**Ratio of mass ratios: 32.0/15.5 = 2.07.** The straight-up rocket must be **twice as propellant-heavy** for the same payload — and since payload lives in the thin burnout sliver (from the rocket equation), *doubling the mass ratio roughly quarters or worse the payload fraction*. **The gravity turn is not a refinement; it is the difference between a viable vehicle and an impossible one.** A rocket that couldn't tip over — that had to ascend vertically — would need a mass ratio of 32, deep in the "everything is fragile" regime from the rocket equation, and would likely give negative payload with any realistic $\varepsilon$. **The gravity turn, which costs essentially nothing (gravity does the steering), is worth a factor of two in mass ratio. It may be the highest-leverage free lunch in all of spaceflight.**

---

### 3 — Thrust-to-weight and gravity loss

**(a)** Gravity loss is $\int g\sin\gamma\, dt$ — it accrues at rate $g\sin\gamma$ per unit *time*. So the total depends on how *long* the gravity-loss-heavy phase lasts, which depends on how fast you accelerate through it, which is thrust-to-weight. **The limiting case makes it undeniable: an impulsive burn (infinite thrust, zero duration) integrates $g\sin\gamma$ over zero time, paying zero gravity loss** — you'd acquire orbital velocity instantly, with no time for gravity to act. Real burns take finite time and pay finite gravity loss; the *higher* the thrust-to-weight, the *shorter* the burn, the *closer* to the impulsive ideal, the *less* gravity loss. High TWR buys you toward the free-lunch limit.

**(b)** Ideal Δv each must deliver = 4.0 km/s useful + its own gravity loss:
- **Stage A** (solid-like, $I_{sp}=280$, +0.2 km/s grav loss): ideal Δv = 4.2 km/s. $v_e = 2{,}746$ m/s. $R_A = e^{4200/2746} = e^{1.529} = \mathbf{4.62}$.
- **Stage B** (efficient, $I_{sp}=340$, +0.6 km/s grav loss): ideal Δv = 4.6 km/s. $v_e = 3{,}334$ m/s. $R_B = e^{4600/3334} = e^{1.380} = \mathbf{3.97}$.

**Stage B wins** — lower mass ratio (3.97 vs 4.62) means less propellant per unit payload, *despite* paying 0.4 km/s more gravity loss, because its 60-second $I_{sp}$ advantage ($v_e$ higher by 588 m/s) more than compensates. **Crossover:** Stage A wins only if Stage B's *extra* gravity loss exceeds **~900 m/s** (found by setting $R_A = R_B$). So the trade is: **the high-thrust engine is worth choosing at liftoff only when the gravity loss it saves is large — greater than ~0.9 km/s in this case.**

**(c)** This reveals that **the solid-booster-at-liftoff decision is a genuine quantitative trade, not automatic.** Solids (bad $I_{sp}$, huge thrust) win *when the gravity-loss saving is large enough to overcome their $I_{sp}$ deficit* — and that condition is met precisely at **liftoff**, in the first seconds, where the vehicle is heaviest, slowest, most gravity-loss-vulnerable, and where high thrust is worth the most. Deeper into the ascent, where the vehicle is lighter and faster and gravity loss per second is smaller, the trade flips and you want the efficient engine. **This is why solids are used as *boosters* (dropped early) rather than sustainers: their high-thrust virtue pays off only in the brief high-gravity-loss window at liftoff, and their bad $I_{sp}$ becomes a liability the moment that window closes — so you use them for exactly that window and jettison them.** *Use the bad engine where its badness doesn't count, then drop it* — the through-line, quantified. And note the subtlety: it's *not* automatic. A vehicle where the gravity-loss saving from high thrust is modest (say, an upper stage, already fast and high) should use the efficient engine, and does. The crossover math tells you which regime you're in.

---

### 4 — Drag and max-Q

**(a)** Drag is $D = \tfrac12\rho v^2 C_d A$, worst when $\rho$ **and** $v$ are both large. But **those conditions barely overlap**: when air density $\rho$ is high (low altitude, first ~30 km), the rocket is still slow (just left the pad); by the time it's fast, it's high up where $\rho$ has fallen exponentially. The rocket spends only ~90 seconds in the window where both are appreciable, then escapes into thin air where drag vanishes regardless of speed. **Gravity loss, by contrast, acts the *entire* 8-minute ascent** (gravity is everywhere, always), so its integral is far larger. Popular imagination fixates on the atmosphere because that's the visible, dramatic part (the shaking, the max-Q, the flames), but the *quiet, relentless* gravity loss — acting the whole time — costs an order of magnitude more Δv. **The dramatic enemy is cheap; the boring enemy is expensive.**

**(b)** $q = \tfrac12\rho v^2$. Early: $\rho$ high, $v$ low → $q$ low. Late: $\rho$ low (dropped exponentially), $v$ high → $q$ low again (density falls faster than $v^2$ rises). In between, both are moderate and their product peaks — **max-Q**, typically 60–90 s in, ~10–15 km altitude. It's the structurally dangerous moment because $q$ *is* the aerodynamic pressure loading the vehicle: the bending, buffeting, and compression forces on the airframe are proportional to $q$, so peak $q$ = peak structural stress. Exceed the design $q$ limit and the vehicle can break up aerodynamically.

**(c)** Rockets **throttle down** approaching max-Q to avoid building speed too fast while still in dense air, keeping $q$ below the structural limit; then **throttle up** past max-Q once the air has thinned and $q$ is falling. **The trade being managed: gravity loss wants maximum thrust (minimize time), but structural survival wants reduced thrust through max-Q (don't over-pressure the airframe).** The throttle bucket is the real-time negotiated settlement between these two — accept a little extra gravity loss (from throttling down) in exchange for not exceeding the aerodynamic structural limit. It's the loss physics of this material, made audible in every launch commentary.

**(d)** Drag *force* scales with cross-sectional area ($\propto r^2$); mass scales with volume ($\propto r^3$); so drag *deceleration* $D/m \propto r^2/r^3 = 1/r$. **Smaller rockets (small $r$) have larger $D/m$ — drag hurts them proportionally more.** A tiny rocket has lots of surface area per unit mass; a giant rocket barely notices drag. **Implication: the physics of drag rewards size** — larger launch vehicles are more efficient (lower drag loss fraction), which is one of several square-cube-law reasons the industry trends toward big rockets and why very small launchers pay a disproportionate drag penalty. (It's the same physics as a dust mote drifting down slowly while a boulder plummets: $D/m \propto 1/r$.)

---

### 5 — The gravity turn

**(a)** Normal equation: $mv\dfrac{d\gamma}{dt} = -mg\cos\gamma$ (no active steering). **Gravity's perpendicular component, $g\cos\gamma$, continuously rotates the velocity vector downward** — bending the flight path from vertical toward horizontal. Once you give the rocket a small initial tip off vertical, $\gamma < 90°$ means $\cos\gamma > 0$, so gravity has a perpendicular component to grab, and it steers the rocket over on its own, following a smooth curve, with the thrust kept aligned to the velocity (no steering thrust spent). **Gravity does the turning for free.**

**(b)** Gravity's **double role**: in the *tangential* equation ($m\dot v = T - D - mg\sin\gamma$) gravity is the **villain**, $-g\sin\gamma$ stealing your speed (gravity loss); in the *normal* equation ($mv\dot\gamma = -mg\cos\gamma$) gravity is the **hero**, $-g\cos\gamma$ tipping you toward the horizontal you need for orbit, for free. **These are complementary because of the geometry:** early (γ near 90°), $\sin\gamma \approx 1$ (max gravity loss — unavoidable, you must climb out of the atmosphere) but $\cos\gamma \approx 0$ (little turning — which is fine, you don't want to turn much while still low); late (γ near 0°), $\sin\gamma \approx 0$ (minimal gravity loss — you're horizontal and fast) and $\cos\gamma \approx 1$ (max turning authority — but you're nearly horizontal and need little more). **The physics arranges for gravity to steal most where you can't avoid it and steer most where you need it, fading in both roles right as you reach orbit** — as if the trajectory were designed to be *just barely* flyable, which is the recurring miracle of living on a planet where chemical rockets can close the ascent at all.

**(c)** **(i) Kick too aggressive:** you go horizontal too soon, while still in thick air, and drag + aerodynamic loads spike (flying sideways through dense atmosphere at building speed) — in the worst case the vehicle exceeds structural limits and breaks up. **(ii) Kick too gentle:** you stay too vertical too long, bleeding excess gravity loss ($\sin\gamma$ near 1), and you may run out of trajectory — reaching engine cutoff still climbing steeply, with a large *vertical* velocity that's useless for orbit and that gravity will convert into a fall back toward Earth. **The optimal kick threads between "too horizontal, die to drag" and "too vertical, waste gravity loss and fail to reach horizontal" — and it's so sensitive it's computed numerically for each vehicle and mission.**

---

### 6 — Geography as physics

**(a)** Rebate $= 465\cos(\text{lat})$ m/s:

| Site | Latitude | Rebate (m/s) |
|---|---|---|
| **Kourou** | 5°N | **463** |
| **Cape Canaveral** | 28.5°N | **409** |
| **Baikonur** | 46°N | **323** |
| **Polar site** | 90° | **0** |

Kourou collects nearly the full 465; a polar site gets nothing.

**(b)** Israel (~31°N). Eastward rebate would be $465\cos(31°) = 399$ m/s. Launching **westward**, you forgo that 399 *and* must cancel the 399 you already have, so the total penalty relative to eastward is $2 \times 399 = \mathbf{797\ m/s}$. As a fraction of 9,400: **8.5%.**

**(c)** With $v_e = 3{,}400$: eastward budget ~9,400 → $R_{\text{east}} = e^{9400/3400} = 15.9$. Westward budget ~9,400 + 797 = 10,197 → $R_{\text{west}} = e^{10197/3400} = 20.1$. Mass-ratio penalty factor: $20.1/15.9 = 1.264$. Since payload lives in the burnout sliver ($\propto 1/R$ roughly), payload capacity drops by about $(1 - 15.9/20.1) = \mathbf{\sim 21\%}$. **Israel gives up roughly a fifth of its payload on every launch, purely because it must fly west.** (The lecture body's "half" overstates it — the honest number for a 31°N site is ~20%, which is still enormous: it means a fifth of every Shavit's lift capacity is spent on geopolitics rather than payload.)

**(d)** The global spaceport map is a direct readout of ascent physics. **Three specific features:** (1) **Spaceports sit on east-facing coastlines** (Florida→Atlantic, Kourou→Atlantic, Tanegashima, Sriharikota→Bay of Bengal) because launching *east* collects the rotation rebate *and* sends failures over open water — the rebate and range-safety both point east over sea, so the coastlines of the world are where those two demands agree. (2) **Equatorial sites are prized** (Kourou at 5°N; Europe operates a spaceport in South America) because the rebate is $465\cos(\text{lat})$, maximized at the equator — worth ~150 m/s over a European site, enough extra payload to justify an ocean-spanning operation. (3) **Nations need multiple sites for different inclinations** (US: Florida launches east for low-inclination/GEO, Vandenberg launches *south* over the Pacific for polar/sun-synchronous, because a polar launch from Florida would overfly Cuba or the mainland) — geography dictating infrastructure. And the exceptions prove the rule by pricing the politics: **Israel launches west (~800 m/s / ~20% payload penalty) to avoid overflying hostile neighbors, and the Soviets accepted Baikonur's inland location (smaller rebate, stages dropped on the steppe) because they had no equatorial coast.** Every feature is physics; every exception is politics overriding physics at a computable cost.

---

### 7 — The full budget

| Term | Value (km/s) | Sign |
|---|---|---|
| Orbital velocity at 400 km | 7.67 | + |
| Gravity loss | 1.30 | + |
| Drag loss | 0.15 | + |
| Steering loss | 0.05 | + |
| Altitude/potential term | 0.20 | + |
| Rotation rebate (28.5°N, east) | 0.41 | − |
| **Total required Δv** | **8.96** | |

The total lands at **~9.0 km/s** (and closer to 9.3–9.4 for less-optimal trajectories, higher target orbits, or vehicles with lower thrust-to-weight and thus more gravity loss). Every digit is now accounted for: **9.4 = 7.67 of honest physics + ~1.7 of loss − ~0.4 of rebate.**

**Which term to reduce, and how:** **Gravity loss (~1.3 km/s) is where the recoverable Δv lives** — drag and steering are already small and nearly optimal, and the rebate is fixed by geography. Gravity loss is reducible by **higher thrust-to-weight** (faster ascent, less time integrating $g\sin\gamma$) and by an aggressive early pitch-over (killing $\sin\gamma$ sooner). **Realistic best case:** shave maybe 0.2–0.3 km/s with a high-thrust ascent — but bounded, because you can't have an impulsive burn, higher TWR wastes propellant fighting drag and crushes the payload with g-forces, and the structural loads at max-Q cap how hard you can push through the atmosphere. **So the practical floor is around 8.7–8.9 km/s, and it's been near there for sixty years.** You cannot trajectory-optimize your way below the fundamental cost of climbing out of Earth's gravity well through its atmosphere; that floor is a property of the planet.

---

### 8 — Why the budget never improves (model answer)

The Δv-to-LEO budget (~9.4 km/s) has been essentially constant across the entire history of spaceflight — Saturn V (1967) and Falcon 9 (2020s) both pay ~9.4 km/s — because **the budget is a property of Earth, and Earth has not changed.** Every term in it is set by the planet: orbital velocity (7.67 km/s) by Earth's mass and radius; gravity loss (~1.3) by Earth's surface gravity and the fact that you must climb through it; drag loss (~0.15) by Earth's atmosphere; the rotation rebate (−0.41) by Earth's spin rate and your latitude. None of these are engineering parameters that improve with better technology — they're geophysical constants. A better engine, a lighter tank, a cleverer trajectory: none of them change how fast Earth rotates or how deep its gravity well is or how thick its air is. **The 9.4 is fixed by the launch site, which is a planet, and the planet is not a variable.**

**What this tells you about where progress comes from:** it confirms the "seized knobs" theme of the earlier chapters and completes it. The rocket equation: the mass ratio is exponential and $\varepsilon$ is floored by matter. The chapter on the thermochemical ceiling: $v_e$ is capped at ~4.5 km/s by chemistry. The chapter on staging: staging can only claw back so much before diminishing returns. Ascent: the ascent budget is fixed by the planet. **Four locked constraints, none of which improve with technology.** So the enormous progress of the last sixty years — reusability taking \$/kg from \$54,500 to \$2,700, manufacturing revolutions, the commercial launch industry — happened *entirely around* these locks, never through them. **Nobody made the rocket equation more forgiving, or chemistry more energetic, or Earth's gravity weaker.** They made rockets *reusable* (the chapter on reusability), *cheaper to build*, *faster to turn around* — attacking cost and logistics, the things that *aren't* fixed by physics, because the things that *are* fixed by physics were already optimized to their limits decades ago. **The lesson for anyone entering this field: don't look for progress in the budget — it's a dead end, mapped and locked. Look for it in cost, reusability, manufacturing, and in leaving chemistry entirely (the chapter on escaping chemistry). That's where the locks aren't.**

---

### 9 — Unit I synthesis, ascent edition (model capstone essay)

**Ascent completes Unit I by revealing the fourth and final locked constraint, and by showing that the idealized rocket equation of the earlier chapters must be paid not once but with a planet-sized surcharge.**

Unit I is the story of four constraints, each fixed by something outside the engineer's control. **First, the mass ratio** (the rocket equation): the rocket equation is exponential in $\Delta v/v_e$, and the structural coefficient $\varepsilon$ is floored near 0.05–0.10 because tanks and engines are made of matter — this is what makes single-stage orbit impossible. **Second, exhaust velocity** (the chapter on the thermochemical ceiling): $v_e$ is capped at ~4.5 km/s because a chemical rocket must carry its own heavy oxidizer into the exhaust, a limit of chemistry itself, confirmed by Clark's decade of setting propellants (and chemists) on fire. **Third, staging's ceiling** (the chapter on staging): the one loophole — jettison dead tanks — takes us from impossible to a few percent payload, but its gains collapse after two or three stages, bounded by separation-failure probability and the fixed overhead of small stages. **Fourth, the ascent budget** (this chapter): the ~9.4 km/s to LEO is 7.67 of honest orbital velocity plus ~1.7 of loss minus ~0.4 of rebate, and it's fixed by Earth's mass, gravity, atmosphere, and spin — geophysical constants that no technology changes. Each constraint is locked by something the engineer cannot negotiate: matter, chemistry, reliability, the planet.

**The through-line principle — *never carry anything through a Δv it does not need to experience* — appears in ascent as vividly as anywhere.** The fairing is jettisoned the instant drag becomes negligible, staged away like an empty tank the moment it's dead weight. The gravity turn refuses to spend thrust on steering, letting gravity tip the vehicle over for free rather than *carrying* the cost of active steering through the ascent. The whole trajectory is the principle applied continuously in time: don't spend a second going vertical you don't have to (gravity loss), don't fly a degree off your velocity vector that gravity could steer for you (steering loss), don't carry the fairing a meter past its usefulness. Ascent is the principle made into a flight path.

**And ascent teaches the meta-lesson that governs where the rest of the course looks for progress.** With all four constraints locked — mass ratio, $v_e$, staging, ascent budget — the enormous progress of the last sixty years happened entirely *around* the physics, never through it. Reusability (the chapter on reusability) didn't make the rocket equation more forgiving; it attacked *cost* while paying the same 9.4 km/s. Better manufacturing didn't lower the ascent budget; it lowered the price of paying it. The budget the Saturn V paid in 1967 is the budget the Falcon 9 pays today, because the planet is the same — and *that stability is the proof that the physics is locked.*

**So Unit I ends by pointing forward.** The next three chapters go exactly where the locks aren't. **The chapter on engine cycles** squeezes the last few percent from fixed chemistry — not breaking the $v_e$ wall, but reaching it more fully and cheaply, through turbopump and combustion-cycle ingenuity (including one the Americans thought impossible). **The chapter on escaping chemistry** is the only chapter that actually moves $v_e$ — ion drives and nuclear thermal — by paying in thrust, or reactors, or decade-long durations. **The chapter on reusability** gives up on the physics entirely and attacks the economics, because when four constraints are locked, the money becomes the only battlefield left. Unit I proved the walls are real; the chapters through reusability show you the doors that aren't in the walls. **That is the whole architecture: understand what cannot be changed so precisely that you know exactly where the changeable things are — and then go there.**

---

---

## Further reading

- **Howard D. Curtis, *Orbital Mechanics for Engineering Students*.** Chapter 11 covers atmospheric ascent and works the loss budget in engineering detail.
- **James R. Wertz & Wiley J. Larson, *Space Mission Analysis and Design*.** The standard systems reference; its launch chapter tabulates real ascent loss budgets.
$l4_master$,
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

-- Curated, human-reviewed self-test — same set served at every level.
with q as (
  select $l4_quiz$[{"id": "q1", "type": "mcq", "prompt": "The \"9.4 km/s to low Earth orbit\" quoted throughout is best described as:", "options": ["the actual speed a satellite travels in LEO", "escape velocity from Earth", "a BUDGET \u2014 about 7.67 km/s of real orbital velocity plus ~1.7 km/s of losses minus ~0.4 km/s of rotation rebate", "the speed of the launch pad"], "answerIndex": 2, "explanation": "Nothing in orbit moves at 9.4 km/s. It is the \u0394v the engine must deliver: 7.67 km/s of honest orbital velocity plus gravity, drag, and steering losses, minus the Earth-rotation rebate. Confusing the budget with the speed is the most common error in the subject."}, {"id": "q2", "type": "mcq", "prompt": "How does circular orbital velocity change with altitude?", "options": ["Higher orbits are faster", "Higher orbits are slower \u2014 v = \u221a(\u03bc/r), so v \u221d 1/\u221ar", "Orbital velocity is the same at every altitude", "It increases then decreases"], "answerIndex": 1, "explanation": "v = \u221a(\u03bc/r): higher up, gravity is weaker, so less centripetal force is needed to hold the circle and a slower speed suffices. The ISS (400 km) does 7,673 m/s; a geostationary satellite (35,786 km) only 3,070. Climbing costs \u0394v but leaves you moving slower \u2014 the fact that governs all of orbital mechanics."}, {"id": "q3", "type": "mcq", "prompt": "Which ascent loss is by far the largest, and what reduces it?", "options": ["Drag loss; a sleeker fairing", "Steering loss; a bigger gimbal", "Gravity loss (~1.3 km/s) \u2014 the price of time spent climbing slowly \u2014 reduced by high thrust-to-weight and by tipping over fast to cut sin \u03b3", "Rotation loss; launching west"], "answerIndex": 2, "explanation": "Gravity loss is \u222b g sin \u03b3 dt, and it acts the whole ascent. Going straight up (sin \u03b3 = 1) is a disaster; the vehicle pitches over fast to shrink sin \u03b3. Higher thrust-to-weight shortens the burn toward the impulsive-burn ideal (which would pay zero), which is also why high-thrust dense first stages and solid boosters earn their place despite poor specific impulse."}, {"id": "q4", "type": "mcq", "prompt": "Drag loss is surprisingly small (~0.15 km/s) despite the atmosphere being 'the hard part'. Why?", "options": ["Rockets are perfectly streamlined", "Drag scales with air density \u00d7 velocity\u00b2, and those two barely overlap \u2014 when the air is dense the rocket is slow, and once it is fast it is already high where the air is thin", "The fairing eliminates drag entirely", "Drag pushes the rocket forward"], "answerIndex": 1, "explanation": "D = \u00bd\u03c1v\u00b2CdA. Density is highest low down where the rocket is still slow; by the time it is fast it is above the thick air, where \u03c1 has fallen exponentially. The rocket spends only ~90 seconds where both matter. Gravity loss, acting the entire 8-minute climb, costs an order of magnitude more \u2014 the dramatic enemy (drag) is cheap; the boring one (gravity) is expensive."}, {"id": "q5", "type": "mcq", "prompt": "In a gravity turn, how does the rocket get from vertical to horizontal without wasting thrust on steering?", "options": ["It fires side thrusters continuously", "After a small initial pitch-over kick, gravity's perpendicular component (g cos \u03b3) rotates the velocity vector over for free while thrust stays aligned with velocity", "It uses aerodynamic fins the whole way up", "It never actually turns"], "answerIndex": 1, "explanation": "Once the vehicle is tipped a few degrees off vertical, the perpendicular component of gravity bends the flight path toward horizontal on its own. The only steering \u0394v paid is the initial kick; the rest of the arc is the rocket 'falling' around the curve. Gravity is villain and hero at once \u2014 it steals speed tangentially while it steers for free normally."}, {"id": "q6", "type": "open", "prompt": "Explain the Earth-rotation rebate, why almost every spaceport launches east from near a coast, and why Israel is the exception that launches west.", "rubric": "Earth's surface moves east at 465\u00b7cos(latitude) m/s, so launching EAST gives that much orbital velocity for free \u2014 maximal at the equator, zero at the poles. Through the rocket equation's exponential, shaving a few hundred m/s off the budget is worth real payload on every flight. So spaceports cluster on EAST-FACING COASTLINES near the equator: east to collect the rebate, over water so a failure drops debris in the sea (rebate and range-safety agree), and low-latitude to maximize the rebate (Kourou at 5\u00b0N is prime real estate \u2014 Europe operates a spaceport in South America for ~150 m/s over a European site). Launching WEST forgoes the rebate AND must cancel the existing eastward motion \u2014 paying it roughly twice, ~800-930 m/s. Israel's Shavit launches west over the Mediterranean because launching east would overfly hostile neighbours; it eats that penalty (~20% of its payload) for geopolitical safety. The launch map is a readout of ascent physics, and the exceptions price the politics."}, {"id": "q7", "type": "open", "prompt": "Why has the ~9.4 km/s budget to LEO stayed essentially constant from the Saturn V (1967) to the Falcon 9 today, and what does that say about where spaceflight progress comes from?", "rubric": "Every term in the budget is set by the planet, not by technology: orbital velocity (7.67 km/s) by Earth's mass and radius, gravity loss (~1.3) by its surface gravity, drag loss (~0.15) by its atmosphere, and the rotation rebate (\u22120.41) by its spin and your latitude. None improve with a better engine, lighter tank, or cleverer trajectory \u2014 Earth is not a variable \u2014 so the budget is the same for the Saturn V and the Falcon 9. This completes the 'seized knobs' of the propulsion unit: the mass ratio is exponential and the structural coefficient is floored by matter; exhaust velocity is capped near 4.5 km/s by chemistry; staging's gains collapse after two or three stages; and the ascent budget is fixed by the planet. Four locked constraints. So the enormous progress of the last sixty years happened AROUND the physics, not through it \u2014 reusability, cheaper manufacturing, faster turnaround took cost per kilogram from ~54,500 dollars to ~2,700 while paying the same 9.4 km/s. Progress lives in cost, logistics, and leaving chemistry entirely \u2014 where the locks aren't."}]$l4_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/space-exploration/rockets/ascent', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
