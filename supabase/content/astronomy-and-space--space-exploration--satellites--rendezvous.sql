-- Space Exploration · Orbits and the Commons — "Rendezvous: The Great Inversion"
-- (Lecture 10). Curated, human-reviewed master for
-- astronomy-and-space/space-exploration/satellites/rendezvous @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert. Shorter depths are
-- distilled from this master (the delete drops derived caches on change).
--
-- Original, house-styled rework of ASTR-191 Lecture 10: the Gemini 4 target
-- that floated away; why higher is slower and the inversion it generates; the
-- Hohmann transfer and the three-step vis-viva ritual; the worked LEO-to-GEO
-- transfer; the plane-change penalty (2v sin(theta/2)) and turning where you
-- are slow; the phasing maneuver (catch up by dropping down); the
-- Clohessy-Wiltshire relative motion and the football ellipse; the anatomy of
-- a real docking; and the "new gut" of orbital intuition. Formula-dense KaTeX
-- (display + boxed); body Postgres dollar-quoted (no literal currency).
--
-- Embeds interactive ```example blocks (hohmann-transfer, plane-change,
-- phasing) rendered as infinite practice boxes
-- (src/components/WorkedExample.tsx), a curated self-test, and a linked
-- Further reading section (affiliated at render time).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/space-exploration/satellites/rendezvous',
    'research',
    'advanced',
    'read',
    $l10_master$> In orbit, to catch something ahead of you, you slow down. The intuition built on highways and playgrounds — speed up to catch up, point at the thing you want to reach — is not merely useless here; it is exactly inverted, and acting on it makes your target float away. This chapter makes the inversion rigorous through the Hohmann transfer, the phasing problem, and the Clohessy–Wiltshire equations. The whole thing flows from one fact: higher is slower.

## The target that floated away

{{image: Gemini 4 | Gemini 4, 1965: Jim McDivitt tried to fly up to his spent booster the way you fly one plane toward another — and it floated away. NASA learned, publicly, that nobody yet knew how to fly one spacecraft to another.}}

On June 3, 1965, Gemini 4 was in orbit, and astronaut Jim McDivitt was going to do something no American had done: fly his spacecraft up to another object in orbit and station-keep alongside it. The target was the spent second stage of his own Titan II launch vehicle — the booster that had just put him in orbit, now tumbling nearby, a few hundred meters away, a big obvious cylinder against the black. All he had to do was fly over to it and match its motion. It looked, from the cockpit, exactly like flying an airplane toward another airplane: the target was *right there*, a little ahead and below. You point the nose at it, add thrust, and close the gap. Every instinct McDivitt had — and he was a superb test pilot — told him this was straightforward.

It was not straightforward. It was impossible, in the way he was trying to do it, and the reason is the entire subject of this chapter.

McDivitt pointed his spacecraft at the target and thrust toward it. And the target... moved away. Not dramatically at first — but instead of closing, the gap *opened.* He thrust harder, more directly at it. It receded faster, and *sank*, dropping below him and pulling ahead. The harder he chased, the worse it got. He was doing everything right by the logic of the air and the road, and the target was behaving as though it were actively fleeing him, obeying some malicious physics that punished every correct-seeming move. After expending a worrying amount of precious propellant and getting no closer, McDivitt gave up. The rendezvous was abandoned. NASA had discovered, the hard and public way, that **nobody actually knew how to fly one spacecraft to another**, because the intuition everyone brought to it — the pilot's intuition, the driver's intuition — was not just unhelpful but *precisely wrong.*

Here is what was actually happening. Hold the paradox in full before it is resolved, because the resolution is the payoff of the entire unit. When McDivitt thrust *toward* the target — which was slightly ahead of and below him, so thrusting toward it meant thrusting *forward and down* — he did two things, and both backfired:

1. **Thrusting forward added energy to his orbit**, which — by vis-viva, from the two-body chapter — *raised* his orbit, lifting him to a higher altitude. And a higher orbit is a *slower* orbit (higher is slower, in both speed and period). So by speeding up to chase, he climbed to a higher, slower orbit and began falling *behind* — the target, now lower than him, was on a faster orbit and pulled ahead. **He accelerated toward the target and, as a direct result, fell behind it.**

2. The geometry got worse the harder he tried, because every forward thrust climbed him higher and slowed him more, opening the gap he was trying to close.

**The target floated away because McDivitt did the intuitive thing, and the intuitive thing is exactly backward.** To catch the target — which was ahead of him — he needed to *slow down*: thrust *backward*, which would *lower* his orbit, which would *speed him up* (lower is faster), which would let him *catch up* from below, and then, at the right moment, raise back up to the target's altitude. Slow down to speed up. Drop to catch up. Every word of it contradicts the cockpit intuition of a fighter pilot, and every word of it is correct, and the correctness is forced by the same vis-viva equation derived in the two-body chapter.

{{image: Buzz Aldrin | Buzz Aldrin — "Dr. Rendezvous" — whose MIT doctoral thesis worked out orbital rendezvous before anyone had flown one. The counterintuitive maneuver (slow down to catch up) was theory before it was practice.}}

NASA figured this out — it had, in fact, been worked out theoretically by Buzz Aldrin, whose MIT doctoral thesis was on orbital rendezvous (this is the actual reason he was selected as an astronaut, and the actual reason his crewmates called him "Dr. Rendezvous"). Six months after Gemini 4's failure, Gemini 6 and Gemini 7 performed the first true rendezvous in December 1965, flying in formation just a foot apart, because they did the counterintuitive thing correctly. But the lesson stood, and it stands still: **rendezvous is not flying. It is orbital mechanics, and orbital mechanics inverts every instinct you have about chasing and catching.** What follows is the physics that makes the inversion not just true but *obvious* — because by the end of this chapter, "slow down to catch up" should feel not paradoxical but inevitable.

## Why higher is slower

Before any transfers or phasing, nail the single fact from which the entire inversion flows, because if you own this fact deeply, everything else becomes obvious rather than paradoxical. The fact comes from the two-body chapter, stated three ways until it is part of you:

> **In orbit, a higher orbit is a slower orbit — slower in speed, and slower in period. A lower orbit is faster — faster in speed, and faster in period.**

**Way one, from vis-viva.** Circular orbital speed is $v = \sqrt{\mu/r}$. As $r$ increases, $v$ decreases. Higher up, gravity is weaker, so less speed is needed to stay in orbit. The ISS at 400 km does 7.67 km/s; a satellite at 800 km does 7.45 km/s; geostationary at 35,786 km does 3.07 km/s. **Climb, and you slow down.**

**Way two, from Kepler's Third.** The period is $T = 2\pi\sqrt{a^3/\mu}$. As $a$ increases, $T$ increases — and it increases *faster* than the circumference does, because you're both traveling a longer path *and* moving more slowly along it. A satellite 100 km higher than another isn't just on a slightly longer track; it's crawling along that longer track at a lower speed, so it takes disproportionately longer to complete a lap. **Higher orbits lap more slowly.**

**Way three, the physical picture.** Imagine two runners on a circular track, one on the inside lane (lower orbit) and one on the outside lane (higher orbit). On a real track, the outside runner has farther to go but can run just as fast, so a good outside runner can keep up. In orbit, it's crueler: the outside (higher) runner not only has farther to go but is *forced to move more slowly* by the weaker gravity. So the inside (lower) runner laps faster on both counts — shorter path *and* higher speed. The lower orbit always wins the race around.

Now here is the consequence that generates the entire inversion, derived as a chain of "therefore"s so tight that the paradox dissolves:

- You are chasing a target **ahead of you** in the *same* orbit. You want to catch up — to move forward relative to it.
- Your instinct: **thrust forward** (prograde) to go faster.
- But thrusting forward *adds energy*, which *raises* your orbit (vis-viva: more energy → larger $a$).
- A higher orbit is a **slower** orbit (the fact above).
- So you end up moving **slower** than the target, and you fall **behind.**
- **Therefore: thrusting forward to catch up makes you fall behind.** ∎

And the inverse:

- To catch a target ahead of you, you must get to a **faster** orbit.
- A faster orbit is a **lower** orbit.
- To lower your orbit, you **remove** energy — thrust **backward** (retrograde), i.e. *slow down.*
- Now you're on a lower, faster orbit, and you **catch up** to the target from below.
- Once you've pulled ahead (in angle), you thrust forward again to raise back up to the target's orbit and match it.
- **Therefore: to catch up, you slow down (drop lower), then speed up (rise back).** ∎

Read those two chains until the "therefore"s click, because they are the whole chapter. There is no trick, no exotic physics — just vis-viva and Kepler's Third, applied with rigor, producing a conclusion that the gut refuses until it is forced through the logic. This is the moment orbital mechanics stops being "physics with different numbers" and becomes "physics in a regime where intuition is trained backward." McDivitt's target floated away because he ran the first chain (thrust toward/forward → fall behind) without knowing it. Aldrin's rendezvous worked because he ran the second (slow down → drop → catch up → rise). Same equations. Opposite instincts. The equations win, always.

## The Hohmann transfer

Now to the fundamental maneuver of all of astronautics: the **Hohmann transfer**, the minimum-energy way to move between two circular orbits. Walter Hohmann worked this out in 1925 — in a book about the feasibility of spaceflight, decades before anything flew — and it remains the backbone of orbital mechanics, the maneuver behind moving a satellite from a parking orbit to geostationary, sending a probe from Earth's orbit to Mars's orbit, and countless others. It's also the setting where "slow down to change orbits" gets its precise, quantitative form.

### The geometry

Suppose you're in a low circular orbit (radius $r_1$) and want to reach a higher circular orbit (radius $r_2$). The Hohmann transfer connects them with a single **transfer ellipse** that is tangent to both: its perigee (closest point) touches the low orbit at $r_1$, and its apogee (farthest point) touches the high orbit at $r_2$. You ride this half-ellipse from the low orbit up to the high orbit, and it takes two engine burns:

- **Burn 1 (at perigee, on the low orbit):** a *prograde* burn (speed up) that raises your apogee from $r_1$ out to $r_2$. This injects you onto the transfer ellipse. You are now coasting on an ellipse whose perigee is your old orbit and whose apogee just kisses your target orbit.
- **Coast:** you drift halfway around the transfer ellipse — from perigee up to apogee — under no thrust, purely on orbital mechanics, climbing and slowing as you go (Kepler's Second Law: you slow down as you climb toward apogee).
- **Burn 2 (at apogee, on the high orbit):** when you arrive at apogee — which is at radius $r_2$, your target altitude — you're moving *too slowly* to be in a circular orbit there (you're at the slow apogee of an ellipse, moving slower than a circular orbit at that radius would). So you do a second *prograde* burn (speed up again) to circularize — boosting your speed up to the circular speed at $r_2$, which turns the ellipse into your target circle.

Two prograde burns, both speeding up, to go *higher*. That part matches intuition — to go up, you add energy twice. The inversion (slowing down to catch up) comes back in the phasing problem; but first compute the cost of the transfer itself, because the computation is a beautiful application of vis-viva and it's a skill you must own.

### The computation

Every Hohmann Δv calculation is the same three-step ritual, and once it is internalized you can compute any transfer in the solar system:

**Step 1 — speeds on the circular orbits.** Use $v_{circ} = \sqrt{\mu/r}$ for the starting and ending circular orbits:
$$v_1 = \sqrt{\mu/r_1}, \qquad v_2 = \sqrt{\mu/r_2}$$

**Step 2 — speeds on the transfer ellipse at its two ends.** The transfer ellipse has semi-major axis $a_t = (r_1 + r_2)/2$ (its perigee is $r_1$, apogee is $r_2$, and the semi-major axis is their average). Use vis-viva, $v^2 = \mu(2/r - 1/a_t)$, at perigee ($r = r_1$) and apogee ($r = r_2$):
$$v_{p} = \sqrt{\mu\left(\frac{2}{r_1} - \frac{1}{a_t}\right)}, \qquad v_{a} = \sqrt{\mu\left(\frac{2}{r_2} - \frac{1}{a_t}\right)}$$

**Step 3 — the two burns are the differences.** At perigee, you jump from the low circular speed $v_1$ up to the transfer-perigee speed $v_p$ (which is faster — you're speeding up to stretch the orbit out to apogee). At apogee, you jump from the transfer-apogee speed $v_a$ up to the high circular speed $v_2$ (again faster — you're speeding up to circularize):
$$\Delta v_1 = v_p - v_1, \qquad \Delta v_2 = v_2 - v_a, \qquad \boxed{\Delta v_{\text{total}} = \Delta v_1 + \Delta v_2}$$

That's it. Two applications of vis-viva, three subtractions. Every orbit-raising maneuver in the catalog is this ritual with different numbers. One subtlety must be clear, because it's where intuition can misfire: **at apogee, the transfer-ellipse speed $v_a$ is *slower* than the circular speed $v_2$ you want.** This surprises people — you're way up high, and you need to *speed up* to stay there? Yes: at apogee of the transfer ellipse you're at the slow far point of an elongated orbit, dawdling along, and a circular orbit at that same radius requires *more* speed than your dawdling apogee pace. So you burn prograde to speed up and round out the orbit. If you *didn't* do the second burn, you'd simply fall back down the transfer ellipse to your original perigee — you'd have an elongated orbit touching both radii but circularized at neither. The second burn is what "locks in" the new altitude.

### Why it is the minimum-energy transfer

The Hohmann transfer is provably the cheapest two-burn transfer between two circular coplanar orbits (for ratios of $r_2/r_1$ below about 11.94; above that, a weirder three-burn "bi-elliptic" transfer can beat it). The intuition for its optimality: it's tangent to both orbits, so both burns are purely *along* the direction of motion — every bit of Δv goes into changing speed, none is wasted turning the velocity vector sideways. Any non-tangential transfer "wastes" some Δv cranking the direction around rather than purely changing energy. The Hohmann transfer is the geodesic of orbit-raising: the straightest, cheapest path, spending every drop of Δv on the one thing that matters. It is slow (you coast half an orbit, which for an Earth-to-Mars transfer is many months), but it is cheap, and in the tyranny of the rocket equation, cheap usually wins. When you want *fast* instead of cheap, you pay for it, exponentially — a trade that returns in full when trajectories leave Earth orbit for other planets.

## LEO to GEO: a worked transfer

Here is a complete Hohmann transfer with real numbers, because the abstract ritual only becomes yours once you've watched it produce a number you can check against reality. Take the most common transfer in the commercial space industry: moving a satellite from a low parking orbit up to geostationary orbit. This is done, quietly, several times a month, every month, by the world's launch providers, and it's exactly the Hohmann transfer just built.

**Setup.** Start: circular LEO at 400 km altitude, $r_1 = 6{,}378 + 400 = 6{,}778$ km. End: geostationary, $r_2 = 42{,}164$ km. Earth's $\mu = 3.986\times10^5$ km³/s².

**Step 1 — circular speeds.**
$$v_1 = \sqrt{\mu/r_1} = \sqrt{3.986\times10^5/6{,}778} = \mathbf{7.669\ km/s}$$
$$v_2 = \sqrt{\mu/r_2} = \sqrt{3.986\times10^5/42{,}164} = \mathbf{3.075\ km/s}$$
Note immediately: the GEO speed (3.075) is less than half the LEO speed (7.669). **The destination is slower than the origin** — higher is slower, exactly as promised. You are traveling *up* to an orbit where you move *more slowly.*

**Step 2 — transfer-ellipse speeds.** Semi-major axis $a_t = (6{,}778 + 42{,}164)/2 = 24{,}471$ km.
$$v_p = \sqrt{\mu(2/r_1 - 1/a_t)} = \sqrt{3.986\times10^5(2/6{,}778 - 1/24{,}471)} = \mathbf{10.066\ km/s}$$
$$v_a = \sqrt{\mu(2/r_2 - 1/a_t)} = \sqrt{3.986\times10^5(2/42{,}164 - 1/24{,}471)} = \mathbf{1.618\ km/s}$$

**Step 3 — the two burns.**
$$\Delta v_1 = v_p - v_1 = 10.066 - 7.669 = \mathbf{2.398\ km/s} \quad\text{(prograde, at LEO perigee)}$$
$$\Delta v_2 = v_2 - v_a = 3.075 - 1.618 = \mathbf{1.457\ km/s} \quad\text{(prograde, at GEO apogee)}$$
$$\Delta v_{\text{total}} = \mathbf{3.855\ km/s}$$

**The transfer takes half the period of the transfer ellipse:** $t = \pi\sqrt{a_t^3/\mu} = \pi\sqrt{24{,}471^3/3.986\times10^5} = \mathbf{5.3\ hours}$. So a satellite launched to LEO reaches its geostationary slot about five and a quarter hours later, after two burns totaling 3.855 km/s.

Watch the transfer ellipse stretch as you change the destination. Slide the target radius below — the GEO preset reproduces exactly the numbers just computed — and see how the first burn dominates, how the trip time grows, and how at apogee you arrive crawling and must burn *again* just to stay.

```hohmann
```

Feel these numbers, because they tell a story. The first burn (2.4 km/s) is the big one — it's down low where you're moving fast, and stretching the orbit all the way out to geostationary takes a hefty shove. The second burn (1.46 km/s) circularizes way up high. And notice the strange middle: at apogee, before the second burn, you're crawling along at **1.618 km/s** — slower than you'll be moving *after* you circularize (3.075 km/s). You climbed 36,000 km and slowed to a crawl, and now you must speed *up* to stay there. That crawling apogee speed is the visceral signature of Kepler's Second Law: you dumped almost all your speed climbing the transfer ellipse, arrived at the top barely moving, and must re-accelerate into the (still slow, but faster-than-your-crawl) geostationary orbit.

And here's the connection back to the rocket-equation chapter that must never be lost. That 3.855 km/s of Δv is not free — it costs propellant, via the rocket equation. With a decent upper-stage engine ($v_e = 4.4$ km/s, hydrolox), the mass ratio to perform this transfer is $e^{3855/4400} = e^{0.876} = 2.40$ — meaning the satellite-plus-transfer-stage must be **more than half propellant** just to climb from LEO to GEO. This is why getting to geostationary is expensive, why the transfer stage is a big fraction of the launch mass, and why launching from near the equator — to minimize the plane change to the equatorial GEO orbit — matters so much. **Every orbit is connected to every other by a Hohmann transfer, and every Hohmann transfer is a Δv, and every Δv is a bill from the rocket equation.** Where things go is one question; what it costs is another; and vis-viva is the exchange rate between them. The LEO-to-GEO transfer is where the two shake hands.

```example
hohmann-transfer
```

## The plane-change penalty

A quick but crucial detour, because it explains a launch-geography fact and a real operational constraint. So far all these orbits have been coplanar — in the same plane. But often you need to change the *plane* of an orbit — its inclination — for instance to get from the inclination your launch site gives you (from Florida, ~28.5°, as the ascent chapter showed) to the equatorial plane (0° inclination) that geostationary orbit requires. How much does it cost to tilt an orbit?

The answer is brutal, and it's a piece of vector geometry. To change your orbital plane by an angle $\theta$ without changing your speed, you must rotate your velocity vector by $\theta$. Your velocity has magnitude $v$, and rotating a vector of length $v$ by angle $\theta$ requires a Δv of:

$$\Delta v_{\text{plane change}} = 2v\sin(\theta/2)$$

Look at what this costs. To change your plane by 28.5° (the Florida-to-equatorial change) while moving at LEO speed (7.67 km/s):

$$\Delta v = 2 \times 7.67 \times \sin(14.25°) = 2 \times 7.67 \times 0.246 = \mathbf{3.78\ km/s}$$

**Nearly 4 km/s just to tilt the orbit** — as much as the *entire* LEO-to-GEO Hohmann transfer! Plane changes are savagely expensive, because you're not adding energy, you're just *redirecting* a large velocity vector, and redirecting a 7.67 km/s vector by any significant angle takes a comparable amount of Δv. This is one of the deepest cost asymmetries in orbital mechanics: **changing your speed (energy) is often cheap; changing your direction (plane) is often ruinous.**

Two consequences you must carry:

**First — do plane changes where you're slow.** Since the cost is $2v\sin(\theta/2)$, it's proportional to your speed $v$. So you should perform plane changes where $v$ is *smallest* — which, higher-is-slower, means at *high altitude*. This is why geostationary transfers do their plane change at apogee (way out at 42,164 km, where the transfer-ellipse speed is a crawling 1.6 km/s), not down at LEO where you're screaming along at 7.67. A 28.5° plane change at 1.6 km/s costs $2\times1.6\times\sin(14.25°) = 0.79$ km/s — versus 3.78 km/s down low. **Same tilt, one-fifth the cost, purely by doing it where you're slow.** Real GEO insertions *combine* the circularization burn and the plane change into a single vector maneuver at apogee, saving even more. The lesson — do your turning where you're slow — is a direct child of "higher is slower," and it's why the whole architecture of getting to GEO is shaped around doing the plane change at the far, slow apogee.

```example
plane-change
```

**Second — this is why launch latitude matters so much.** If you launch from the equator, your initial orbit is already in (or near) the equatorial plane, so the plane change to reach equatorial GEO is small or zero — you save that brutal 3.78 km/s. Launch from Florida at 28.5°, and you're stuck paying a plane change (mitigated by doing it at apogee, but never free). This is a large part of *why* equatorial launch sites like Kourou are so valuable for geostationary missions: not just the rotation rebate, but the avoided plane-change penalty. **Geography sets your starting plane, and plane changes are expensive, so geography reaches all the way up to geostationary orbit and taxes you there.** The Δv you didn't have to spend on a plane change because you launched near the equator is, through the rocket equation, real payload — which is why a geostationary satellite operator will pay a premium to launch from close to the equator.

## The phasing problem: catching up by dropping down

Now return, armed, to McDivitt's nightmare. The Hohmann transfer tells you how to change *orbits* — to go from a low circle to a high circle. But rendezvous has an extra dimension: the target is in a *specific orbit at a specific place*, and you must arrive not just at its orbit but *at its location, at the same time.* This is the **phasing problem** — matching not just the orbit but the position along it — and it's where "slow down to catch up" gets its exact quantitative form.

### The maneuver

Suppose you and the target are in the *same* circular orbit (say, both approaching the ISS's orbit), but the target is **ahead of you** by some angle — a "phase angle" $\phi$. You need to close that gap: to catch up, in angle, until you're at the same place. Your instinct (McDivitt's instinct) is to thrust forward and speed up. That's exactly wrong. Here's what you actually do, and it's one of the most elegant maneuvers in the field.

To catch a target ahead of you, you drop into a **lower phasing orbit**:

1. **Thrust retrograde** (slow down) by a small amount. This lowers your orbit — you drop to a slightly lower altitude. By vis-viva, your new lower orbit is *faster*, with a *shorter period.*
2. **Coast on the lower orbit.** Because your period is shorter, you complete each lap *faster* than the target. Every orbit, you gain a little angle on it — you catch up, from below, exactly as the "runner on the inside lane" laps the outer runner.
3. **When you've caught up** — when the phase angle has closed to zero and you're directly below the target — **thrust prograde** (speed up) to raise back up to the target's orbit. You arrive at the target's altitude, at the target's location, matching its velocity. Rendezvous.

**You caught the target ahead of you by slowing down.** The retrograde burn dropped you to a lower, faster orbit; you sprinted ahead underneath the target; then you rose to meet it. This is *precisely* the maneuver McDivitt needed and didn't know, and it is precisely backward from every chasing instinct — and now, having built "higher is slower," it should feel not paradoxical but obvious. *Of course* you drop down to catch up; the lower orbit is faster; that's the only way to gain angle.

### The numbers

Quantify the catch-up, because the rates are surprisingly gentle and it teaches you why rendezvous is *slow*. The ISS orbits at about 6,771 km radius with a period of 92.4 minutes. Suppose you drop into a phasing orbit just a bit lower:

- **Drop 10 km** (to 6,761 km): your period shortens to 92.21 minutes — you complete each orbit 0.20 minutes (12 seconds) sooner than the target. In angular terms, you gain about **0.80° per orbit** on the target.
- **Drop 20 km:** period 92.0 min, gaining **1.59° per orbit.**
- **Drop 50 km:** period 91.4 min, gaining **3.98° per orbit.**

So if you're trailing the target by, say, 16° and you drop 20 km, you gain 1.59° per orbit and close the gap in about **10 orbits** — roughly 15 hours. Drop lower (bigger burn) and you catch up faster but spend more Δv (and must climb back farther). Drop just slightly and you creep up over many orbits, spending almost no propellant but taking days. **This is the fundamental trade of rendezvous: how much to drop (Δv and time), balancing propellant against patience.** And it's why real ISS rendezvous historically took *many hours to a few days* — the chaser eases into progressively refined phasing orbits, nudging the phase angle closed a fraction of a degree per orbit, because big aggressive burns waste propellant and precision matters more than speed when you're about to dock a crewed vehicle with a space station at 7.7 km/s.

(Modern "fast rendezvous" profiles — the Russian and now American few-hour approaches — are a triumph of precise launch timing and onboard computation: they launch at the *exact* instant that the phase angle will work out with minimal phasing, so the chaser needs only a small phase correction rather than days of patient creeping. But the underlying physics is identical: catch up by dropping lower, always.)

```example
phasing
```

### The general rule

The general principle, which covers every case:

> **To catch a target AHEAD of you, drop to a LOWER (faster) orbit, gain angle, then rise back.**
> **To let a target ahead of you pull further ahead — or equivalently, to catch a target BEHIND you — rise to a HIGHER (slower) orbit, let the angle open the other way, then drop back.**

Both are the same physics: you exploit the fact that orbital period depends on altitude, temporarily changing your altitude to change your angular rate relative to the target, then returning. **Altitude is the throttle for relative angular position.** Want to move forward relative to a co-orbiting object? Go lower (faster). Want to move backward relative to it? Go higher (slower). This is the complete, exact inversion of flat-world intuition, and it is the operational heart of every rendezvous ever flown. Aldrin's thesis, the thing that made him "Dr. Rendezvous," was fundamentally about doing this timing correctly — computing the phasing so the chaser arrives at the target's location at the target's time, using altitude as the control.

## Clohessy–Wiltshire: the local physics of close approach

There's a final piece, and it's the most conceptually beautiful thing here: what does the world look like when you're *close* to another spacecraft — meters to kilometers away — and trying to do the final delicate approach to docking? Here the full orbital-mechanics machinery is overkill; instead there's a gorgeous linearized description that reveals the local physics near an orbiting object, and it's where the inversion becomes almost hallucinatory.

Imagine you're an astronaut on the ISS, and a free-floating object — a dropped tool, an approaching capsule — is nearby. You want to describe its motion *relative to the station*, in a little coordinate frame centered on the station: $x$ pointing forward (along the velocity, "downtrack"), $z$ pointing up (away from Earth, "radial"), $y$ out of plane. This frame is not inertial — it's rotating with the station as it orbits — so the relative motion in it obeys modified equations that include the orbital rotation. When you linearize the two-body problem for small separations from a circular orbit, you get the **Clohessy–Wiltshire equations** (also called the Hill equations), and their solutions describe how nearby free objects drift relative to you.

Skip the full derivation, but keep the equations and, more importantly, the *astonishing physical picture* they produce:

$$\ddot{x} = 2n\dot{z}, \qquad \ddot{z} = -2n\dot{x} + 3n^2 z, \qquad \ddot{y} = -n^2 y$$

where $n$ is the orbital mean motion (the station's angular rate). Don't memorize these — *feel* what they say. They're coupled: motion in $x$ (downtrack) drives motion in $z$ (radial) and vice versa, through those $2n\dot{}$ Coriolis-like terms. And that coupling produces behavior that looks, to an astronaut, like magic.

### The three hallucinations

**Hallucination 1: push something "forward" and it drifts up, loops, and comes back behind you.** Suppose you gently push a free object in the $+x$ direction (forward, along your velocity). In flat-world intuition, it should just drift forward and keep going. Instead — because pushing it forward raises its energy, raising its orbit, and a higher orbit is slower — the object drifts forward, but then *rises* (its orbit is now slightly higher), and as it rises it *slows down* (higher is slower) and begins to *fall behind*, curving up and back, and it traces a little *ellipse* relative to you, eventually looping back around. **A push forward produces a closed looping ellipse, not a straight drift.** The object you shoved forward comes curving back around behind and below you like a boomerang, because "forward" in orbit means "higher and therefore slower and therefore backward." The whole McDivitt paradox, playing out in miniature, visible in real time, in the motion of a dropped wrench.

**Hallucination 2: to approach a target ahead of you, aim below it.** If you want to drift toward a target that's ahead of you in the same orbit, you do *not* thrust toward it (McDivitt again). In the CW picture, the way to close a downtrack gap is to drop slightly (go radially inward), which speeds you up and carries you forward relative to the target. So you approach a thing that's in *front* of you by moving *down*, and the orbital mechanics carries you forward to it. To an observer with flat-world intuition, you'd be aiming at the floor to reach something in front of your face — and it works.

**Hallucination 3: the football-shaped drift.** A free object released near the station, with a small relative velocity, generally traces a closed **2:1 ellipse** relative to the station over one orbit — twice as long in the downtrack ($x$) direction as in the radial ($z$) direction, a stretched oval. Astronauts and mission planners live inside this fact: objects released near a spacecraft don't drift away in straight lines; they trace these predictable ovals, returning to near their start after each orbit (which is both a hazard — released debris comes *back* — and a tool, since you can predict exactly where a released or approaching object will drift). The "football" of relative motion is the signature shape of the space near any orbiting object, and learning to think in it is a core skill of rendezvous and proximity operations.

The Clohessy–Wiltshire picture is how spacecraft actually do the final approach to docking — the last few kilometers down to contact are computed and flown in this linearized relative frame, with its counterintuitive ellipses and coupled drifts. Modern autonomous docking (SpaceX Dragon to the ISS, the Russian Progress vehicles, the coming lunar-gateway operations) runs on CW-based guidance, executing tiny burns to shape the relative-motion ellipse until it collapses gently onto the docking port.

But the deep point — the one to carry out of this chapter and this unit — is this: **the space near an orbiting object has its own physics, and that physics is the inversion, made local and continuous.** Everywhere in orbit, "forward is up is slow is backward" — and when you get close to another spacecraft and watch a released object trace its little returning ellipse, you are *seeing* that inversion with your eyes, in real time, in a wrench floating in the air in front of you. The paradox that defeated McDivitt is not an edge case or a trick; it is the *ordinary, continuous, everywhere-true* character of motion in a gravity well, and the Clohessy–Wiltshire equations are its local dialect. Once you can think in the football, once "push it forward and it loops back" feels natural rather than magical, you have replaced your flat-world intuition with an orbital one — and that replacement is the entire intellectual achievement of the unit.

## Anatomy of a real docking

{{image: SpaceX Dragon | A SpaceX Dragon approaching the ISS. The final kilometers are flown in the Clohessy–Wiltshire relative frame, on a passively-safe ellipse chosen so that if every thruster failed, the drift would miss the station rather than hit it.}}

Assemble the whole chapter into the actual sequence a crewed vehicle flies to reach the ISS, because seeing the pieces in operational order — launch, phasing, transfer, proximity operations, contact — turns the abstract machinery into something you can picture, and it introduces the safety concepts that govern how you approach a crewed station you must not hit.

**Phase 1 — Launch into the target's plane.** The chaser (a Dragon, a Soyuz, a Progress) must launch into the *same orbital plane* as the ISS — because plane changes are ruinous, you cannot afford to fix a plane error after launch. This means the rocket must lift off at the precise moment the ISS's orbital plane passes over the launch site — an **instantaneous launch window**, or nearly so. Miss it by minutes and the plane is wrong and the mission scrubs to the next day. This is why crewed ISS launches have those unforgiving "launch on time or wait a day" windows: the plane-change penalty reaches all the way down to the launch pad and dictates the countdown.

**Phase 2 — Phasing: the patient chase.** The chaser launches into a *lower* orbit than the ISS (typically a couple hundred km lower). Why lower? Because lower is faster, so the chaser, on its lower orbit, gains on the ISS every lap — closing the phase angle exactly as the phasing maneuver describes. The chaser spends anywhere from a few hours (fast rendezvous, launched at the perfect phase angle) to two days (the traditional profile) creeping up on the station, executing a series of small burns to refine its phasing orbit and raise gradually toward the ISS altitude, always approaching from below and behind. Every one of these burns is a tiny Hohmann-like transfer, computed by vis-viva, closing the gap in both altitude and angle.

**Phase 3 — Proximity operations: into the football.** Once the chaser is within a few kilometers, the physics shifts from the global orbital picture to the *local* Clohessy–Wiltshire relative frame. Now the chaser is maneuvering inside the strange local dialect where free objects trace returning ellipses, and the approach must be flown with exquisite care, because the target is a crewed station moving at 7.7 km/s that must absolutely not be struck. Two safety concepts govern this phase, and both are pure orbital mechanics:

- **The approach corridor.** The chaser approaches along a specific, carefully chosen direction — typically the **R-bar** (radial, from directly below, along the Earth-station line) or the **V-bar** (velocity vector, from directly ahead or behind). These aren't arbitrary. The R-bar approach from below has a lovely self-braking property: as the chaser rises toward the station along the radial, orbital mechanics (higher is slower) naturally *retards* its approach — the closer it gets, the more the CW dynamics work against it, so a failed thruster tends to make the chaser *drift away* rather than collide. The approach direction is chosen so that the *default, unpowered* relative motion is safe.

- **The safety ellipse and passive abort.** During proximity operations, the chaser is often placed on a relative trajectory (a CW ellipse) that, if all thrust failed right now, would carry it *around* the station and safely away rather than into it. This is called a **passively safe** or **abort-safe** trajectory: the football-ellipse shape of relative motion is deliberately chosen and phased so that the natural, no-thrust drift misses the station. You design the relative-motion ellipse to be inherently non-colliding, so that the *failure mode* is safe. This is a profound application of the CW picture: because you understand that released/drifting objects trace predictable returning ellipses, you can arrange your approach so that the passive ellipse is a miss, not a hit.

**Phase 4 — Contact.** The final meters are flown at centimeters per second, the chaser creeping onto the docking port or berthing position, with the relative-motion ellipse collapsed to nearly zero. Docking (the chaser flies itself to contact, as Dragon and Soyuz do) or berthing (the chaser holds position and the station's robotic arm grapples it and pulls it in, as cargo Dragons historically did) completes the rendezvous. Contact velocities are on the order of a few cm/s — a gentle nudge after a chase that began with a rocket launch and a two-hundred-kilometer altitude gap.

**Why the whole sequence is this chapter in operational form.** Trace it: the launch window is set by the plane-change penalty; the phasing chase is "catch up by dropping lower"; the gradual altitude-raising is a sequence of Hohmann transfers; the final approach is flown in the Clohessy–Wiltshire relative frame, with the approach corridor and safety ellipse chosen so the *passive* dynamics are safe. **Every abstract piece of this chapter appears, in order, in the flight of a Dragon to the ISS** — which happens, routinely, every few weeks, carrying crews and cargo, each mission a live demonstration that the inversion is not paradox but procedure. The astronauts riding up are trusting their lives to the fact that "slow down to catch up" is correct — and it is, every time, because vis-viva and Kepler do not have bad days.

## The new gut

Collect the argument, because this is the emotional and intellectual climax of the orbital-mechanics core — the point where the inversion promised earlier becomes rigorous, quantitative, and finally *intuitive*.

**It began with a failure.** McDivitt, a superb pilot, tried to fly to a target the way you fly an airplane to another airplane — point at it, thrust toward it — and watched it float away, because the intuition of the air and the road is *exactly inverted* in orbit. That failure was not incompetence; it was the entire species discovering, publicly, that nobody yet knew how orbital motion works in the gut, only on paper.

**The root of the inversion is a single fact:** higher is slower. From vis-viva ($v = \sqrt{\mu/r}$) and Kepler's Third ($T \propto a^{3/2}$), a higher orbit is slower in both speed and period. And from that one fact, the whole paradox unspools as a chain of rigorous "therefore"s: *thrust forward → add energy → rise higher → move slower → fall behind.* To catch a target ahead, you must instead *slow down → drop lower → move faster → catch up → rise back.* Same equations as flat-world physics; opposite instincts; the equations win.

**Then the fundamental maneuver, the Hohmann transfer** — the minimum-energy road between two circular orbits, two prograde burns joined by a coasting half-ellipse, computed by the three-step vis-viva ritual. LEO-to-GEO gave 3.855 km/s over 5.3 hours, with the strange crawling 1.618 km/s apogee speed — the visceral signature of Kepler's Second Law — and that Δv connects straight back to the rocket equation: **vis-viva is the exchange rate between "where things go" and "what it costs."**

**Then the brutal asymmetry of plane changes** — that changing your *direction* (tilting the orbit, $2v\sin(\theta/2)$) is often far more expensive than changing your *energy*, that you must therefore do plane changes where you're slow (high up), and that this reaches all the way back to launch geography: your launch latitude sets your starting plane, and plane changes are ruinous, so geography taxes you all the way up at geostationary orbit.

**Then the phasing problem** — the extra dimension of rendezvous, matching not just the orbit but the *place and time* — solved with the maneuver that is McDivitt's exact missing answer: **to catch a target ahead, drop to a lower, faster phasing orbit, gain angle, then rise to meet it.** Altitude is the throttle for relative angular position: go lower to move forward relative to a co-orbiting object, higher to move backward. And the catch-up is gentle — a fraction of a degree to a few degrees per orbit — which is why rendezvous takes hours to days, a patient closing of the phase angle.

**And the strange local physics of close approach** — the Clohessy–Wiltshire equations, where the inversion becomes local, continuous, and visible: push a free object forward and it loops up, slows, and boomerangs back behind you; approach a target ahead by aiming below it; watch every released object trace its returning 2:1 football ellipse. The space near an orbiting body has its own dialect of physics, and that dialect is the inversion made continuous — the McDivitt paradox playing out in the drift of a floating wrench, every orbit, forever.

Here is what matters most, and it's about intuition itself. This chapter asked you not to learn but to *unlearn* — to replace a gut trained in the wrong regime. Your flat-world intuition (speed up to catch up, point at your target) is not wrong about *physics*; Newton's laws are the same in orbit as on Earth. It's wrong about the *regime*: it was trained in a world where gravity is a constant downward tug and the interesting forces are friction and thrust, and it never learned what central gravity does — coupling speed to altitude to period so that "faster" and "ahead" point in opposite directions. The achievement here is growing a *new* gut, an orbital one, in which "slow down to catch up" feels not paradoxical but inevitable, in which the returning football ellipse feels not magical but ordinary. **That new gut is what separates someone who has studied orbital mechanics from someone who can *do* it** — and it can only be grown by trusting the equations over your instincts, again and again, until the instincts themselves are rebuilt. McDivitt trusted his old gut and lost his target. Aldrin trusted the equations and caught his. Be Aldrin.

The through-line, one final time. *Never carry anything through a Δv it does not need to experience* — and the Hohmann transfer is that principle applied to *maneuvering*: the minimum-energy path, tangent to both orbits, every drop of Δv spent purely on changing energy and none wasted turning the velocity vector, because turning is the expensive thing (the plane-change penalty proves it). The cheapest way between two orbits is the one that wastes no Δv on direction — the geodesic of orbit-raising. Efficiency in orbital mechanics, exactly as in the rocket-equation unit, is the discipline of spending Δv only on what strictly needs it.

And from here, the trajectories leave Earth entirely. The same vis-viva and the same Hohmann logic, extended across the gulf between worlds, produce the porkchop plots that constrain every interplanetary launch, the gravity assists that let a spacecraft steal energy from a planet's orbital motion, and the Voyager Grand Tour — the most beautiful trajectory ever flown. The rocket equation and vis-viva are about to reach across the solar system.


## Further reading

- **Howard D. Curtis, *Orbital Mechanics for Engineering Students*.** The clearest worked treatment of the Hohmann transfer and the Clohessy–Wiltshire relative-motion equations.
- **Wigbert Fehse, *Automated Rendezvous and Docking of Spacecraft*.** The definitive engineering reference — approach corridors, the safety ellipse, and passively-safe trajectories, in full.
- **Roger R. Bate, Donald D. Mueller & Jerry E. White, *Fundamentals of Astrodynamics*.** The classic derivation of transfers and the vis-viva ritual, written for Air Force cadets.
$l10_master$,
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
  select $l10_quiz$[{"id": "q1", "type": "mcq", "prompt": "A chaser trails a target in the same circular orbit and, reasoning like a pilot, thrusts prograde (forward) to catch up. What actually happens, and why?", "options": ["It catches up quickly, exactly as on a highway", "It falls FURTHER behind: thrusting forward adds energy, which raises the orbit; a higher orbit is slower (in speed and period), so the chaser now laps more slowly than the target and loses ground", "Nothing changes, because thrust does not affect orbits", "It rises to a higher orbit and speeds up"], "answerIndex": 1, "explanation": "This is the Gemini 4 paradox that defeated McDivitt. The whole inversion flows from one fact \u2014 higher is slower (from v = \u221a(\u03bc/r) and T \u221d a^{3/2}). Thrusting forward adds energy, raising the semi-major axis, lifting the chaser to a higher, slower orbit \u2014 so it falls behind the very target it was chasing. To catch a target ahead you must instead slow down: a retrograde burn lowers the orbit, which makes it faster, so you catch up from below, then rise to match. Slow down to catch up."}, {"id": "q2", "type": "mcq", "prompt": "In a Hohmann transfer from a low orbit to a higher one, why does the SECOND burn, at apogee, speed the spacecraft UP?", "options": ["It doesn't \u2014 the second burn slows the spacecraft down", "At the transfer ellipse's apogee the spacecraft is at the slow far point of an elongated orbit, moving slower than a circular orbit at that radius would; a prograde burn raises it to the (faster) circular speed and locks in the new altitude", "The second burn changes the orbital plane, not the speed", "Because higher orbits are faster"], "answerIndex": 1, "explanation": "The Hohmann transfer is two prograde burns joined by a coasting half-ellipse. The first burn, down low, stretches the orbit so its apogee just reaches the target radius. Coasting up to apogee, the craft slows (Kepler's Second Law) and arrives crawling \u2014 slower than the circular speed at that radius (in the LEO-to-GEO case, 1.618 km/s vs 3.075). So the second burn speeds it up to circularize. Without it, the craft would simply fall back down the transfer ellipse. Every \u0394v is computed by the same three-step vis-viva ritual and paid for, exponentially, through the rocket equation."}, {"id": "q3", "type": "mcq", "prompt": "Changing an orbit's plane by an angle \u03b8 costs \u0394v = 2v\u00b7sin(\u03b8/2). What does that imply about where to do plane changes?", "options": ["Plane changes are free, so do them anywhere", "The cost is proportional to your speed v, so do plane changes where you are slowest \u2014 high up (higher is slower) \u2014 which is why GEO insertions tilt the plane at the far, slow apogee, not down at fast LEO", "Do plane changes at the lowest, fastest point to save time", "The cost depends only on \u03b8, never on speed"], "answerIndex": 1, "explanation": "A plane change rotates the velocity vector without changing its length, and rotating a longer vector by the same angle costs proportionally more \u0394v. A 28.5\u00b0 tilt at LEO speed (7.67 km/s) costs about 3.78 km/s \u2014 as much as an entire LEO-to-GEO transfer \u2014 but only about 0.79 km/s at a 1.6 km/s apogee. So plane changes are done where you are slow (high), often combined with the circularization burn. It also explains why launch latitude matters: geography sets your starting plane, and the plane-change penalty reaches all the way up to geostationary orbit, which is why equatorial sites like Kourou are prized."}, {"id": "q4", "type": "mcq", "prompt": "To close a phase-angle gap to a target that is AHEAD of you in the same orbit, what is the correct maneuver?", "options": ["Thrust forward to speed up and close the gap directly", "Drop into a lower phasing orbit (thrust retrograde): the lower orbit is faster, so you gain angle on the target every lap and catch it from below, then rise back to match", "Thrust radially outward to rise toward the target", "Wait \u2014 the gap closes on its own"], "answerIndex": 1, "explanation": "Rendezvous adds a dimension to the Hohmann transfer: you must arrive not just at the target's orbit but at its place and time. To catch a target ahead, you drop to a lower, faster orbit, gaining a fraction of a degree to a few degrees per lap (e.g. about 2.4\u00b0 per orbit for a 30 km drop at ISS altitude), then rise to meet it. Altitude is the throttle for relative angular position: go lower/faster to move forward relative to a co-orbiting object, higher/slower to move backward. The catch-up is gentle, which is why rendezvous historically took hours to days."}, {"id": "q5", "type": "mcq", "prompt": "Close to another spacecraft, the Clohessy\u2013Wiltshire equations govern relative motion. A crew member gently pushes a floating tool FORWARD (prograde). What does it do?", "options": ["It drifts forward in a straight line and keeps going", "It rises, slows (higher is slower), falls behind, and loops back around behind and below \u2014 tracing a closed ellipse rather than escaping, because a forward push becomes a higher, slower, backward drift", "It falls straight down toward Earth", "It stops immediately"], "answerIndex": 1, "explanation": "The CW equations linearize relative motion in the rotating frame near an orbiting craft, and they are coupled: a push forward raises the object's orbit, and a higher orbit is slower, so it drifts up, slows, and boomerangs back \u2014 the McDivitt paradox in miniature, visible in the drift of a wrench. Released objects generally trace a closed 2:1 downtrack-by-radial football ellipse, returning near their start each orbit (a hazard, and a tool). This is why final docking is flown in the CW frame with approach corridors (R-bar, V-bar) and passively-safe safety ellipses, so that the natural no-thrust drift misses the station rather than hitting it."}, {"id": "q6", "type": "open", "prompt": "On Gemini 4, McDivitt tried to fly to a nearby target the way a pilot flies to another aircraft, and watched it float away. Trace exactly why the intuitive maneuver fails, state the correct maneuver, and name the single fact from which the whole inversion follows.", "rubric": "McDivitt pointed at the target (slightly ahead and below) and thrust toward it \u2014 effectively a forward (prograde) push. Trace the chain: thrusting forward ADDS energy \u2192 the semi-major axis INCREASES \u2192 the spacecraft RISES to a higher orbit \u2192 a higher orbit is SLOWER in both speed and period \u2192 the chaser now moves slower than the target and FALLS FURTHER BEHIND. The harder he chased, the worse it got, and the target appeared to flee. The correct maneuver is the opposite: thrust RETROGRADE (slow down) \u2192 REMOVE energy \u2192 the orbit DROPS to a lower altitude \u2192 a lower orbit is FASTER (shorter period) \u2192 the chaser gains angle and catches up from BELOW \u2192 once caught up, thrust prograde to RISE back to the target's orbit and match velocity. Slow down, drop, catch up, rise. The single fact from which the entire inversion follows is: in orbit, a higher orbit is a slower orbit (from v = \u221a(\u03bc/r) and T \u221d a^{3/2}). The physics is identical to flat-world Newtonian mechanics; only the regime is different \u2014 central gravity couples speed to altitude to period so that 'faster' and 'ahead' point in opposite directions. Aldrin (\"Dr. Rendezvous\"), who had written his doctoral thesis on the problem, flew the correct maneuver on Gemini 6/7; McDivitt, trusting the pilot's gut, did not."}, {"id": "q7", "type": "open", "prompt": "Explain how the single fact 'higher is slower' generates the whole of rendezvous \u2014 the Hohmann transfer, the plane-change penalty, phasing, and Clohessy\u2013Wiltshire \u2014 and how vis-viva ties this chapter back to the rocket-equation unit. Why is the chapter really about unlearning?", "rubric": "Higher is slower (from v = \u221a(\u03bc/r) and Kepler's Third T \u221d a^{3/2}) is the root. From it: (1) The INVERSION \u2014 thrust forward \u2192 rise \u2192 slow \u2192 fall behind; so to catch a target ahead you slow down, drop lower/faster, catch up from below, then rise. (2) The HOHMANN TRANSFER \u2014 the minimum-energy road between two circular orbits, two prograde burns joined by a coasting half-ellipse, computed by the three-step vis-viva ritual; the apogee is slower than the circular speed there, so the second burn speeds you up. It is optimal because it is tangent to both orbits, spending every drop of \u0394v on changing energy and none on turning the velocity vector. (3) The PLANE-CHANGE PENALTY \u2014 \u0394v = 2v\u00b7sin(\u03b8/2), ruinous because it rotates a large velocity vector; since the cost \u221d v, plane changes are done where you are slow (high), and launch latitude therefore reaches all the way up to GEO. (4) PHASING \u2014 altitude is the throttle for relative angular position: drop lower to move forward relative to a co-orbiting object, rise to move backward. (5) CLOHESSY\u2013WILTSHIRE \u2014 the inversion made local and continuous: push a free object forward and it loops back; approach a target ahead by aiming below; released objects trace returning 2:1 football ellipses, which is why approach corridors and passively-safe trajectories are designed so the no-thrust drift misses the station. Vis-viva is the exchange rate: it converts geometry (orbit radii) into speeds, whose differences are \u0394v, which the rocket equation converts into propellant mass and thus payload cost \u2014 the hinge between 'where things go' (this unit) and 'what it costs' (the rocket-equation unit). Finally, the chapter is about UNLEARNING rather than learning: the flat-world gut (speed up to catch up, point at the target) is not wrong about physics \u2014 Newton's laws are the same \u2014 but wrong about the regime, trained where gravity is a constant downward tug. Mastery is growing a new, orbital gut in which 'slow down to catch up' feels inevitable \u2014 the difference between studying orbital mechanics and being able to do it. The through-line holds: never spend \u0394v on what does not need it, which is exactly why the tangent Hohmann transfer is optimal."}]$l10_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/space-exploration/satellites/rendezvous', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
