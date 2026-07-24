-- Astronomy & Space · The Solar System —
-- "The Scale of the Solar System: Distance Is Destiny" (from ASTRO-201, Block 1
-- Lecture 1 — the opening chapter of the Solar System section). Curated,
-- human-reviewed master for
-- astronomy-and-space/solar-system/the-scale-of-the-solar-system @
-- research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Original, house-styled rework: Le Gentil's eleven-year chase of the transit of
-- Venus (the human cost of the measurement); Kepler's law as a "map with no legend"
-- (relative distances but no absolute scale); the transit method turning an
-- unmeasurable 8.8" solar parallax into a measurable TIME; radar ranging in 1961
-- (d = ct/2) settling the AU to one part per million; the 2012 IAU definition;
-- distance as LIGHT-TRAVEL TIME (Sun 8.3 light-min, Neptune 4.2 light-hr) and why
-- the delay makes rovers autonomous; the honest 1 AU = 10 m scale model (grapefruit
-- Sun, grain-of-sand Earth, 2,685 km to Proxima) and the emptiness / mass dominance
-- (Sun 99.87%, Jupiter 71% of the rest); and THE PAYLOAD -- the SNOW LINE (~2.7 AU):
-- temperature vs distance, water condensing below ~150-170 K, the step change in
-- solid material, and the causal chain distance -> temperature -> condensation ->
-- solid mass -> growth rate -> planet type that split the system into rocky inner
-- and giant outer families. Distance is destiny.
--
-- VISUALS (engagement pass): embeds a ```lighttime explorer (an expanding wavefront
-- sweeping past the planets from the Sun, distances as light-minutes/hours;
-- LightTime.tsx) and a ```snowline explorer (disk temperature T = 278/sqrt(d) vs
-- distance with the 2.7 AU condensation boundary and the two planetary provinces;
-- SnowLine.tsx). Four interactive ```example practice boxes (kepler-third, radar-au,
-- light-time, snow-line-temp; WorkedExample.tsx), and {image: ...} markers resolving
-- to real imagery at read time (transit of Venus, the Pale Blue Dot, a protoplanetary
-- disk). Light inline KaTeX (paired '$'; even count asserted); the dollar-quote tag
-- is checked for collisions.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/the-scale-of-the-solar-system',
    'research',
    'advanced',
    'read',
    $astroSC_master$> We begin the study of our own planetary system with what sounds like the dullest possible topic — *how far apart things are* — and this chapter aims to convince you it is the most important idea in the entire subject. The claim is simple and strange: **in the solar system, distance is destiny.** Nearly every major difference between the worlds we are about to meet — why Mercury is a scorched ball of iron and Jupiter a thousand-Earth sphere of gas, why there is a belt of rubble at 2.7 AU and a swarm of ice at 40 — traces back, through a chain of physical causes, to *where in the original disk each body formed.* Distance set the temperature; temperature set what could condense; what condensed set how big a body could grow, and how fast; and that decided whether it stayed a lump of rock or became a giant. This chapter lays down the scale on which that whole story plays out, and ends with the one boundary — the **snow line** — that divides the solar system into its two great families.

## The man who chased Venus for eleven years

In March 1760 a French astronomer named Guillaume Le Gentil boarded a ship at Brest, bound for the east coast of India. He was going to watch a black dot cross the face of the Sun.

The dot was Venus. On 6 June 1761 the planet would pass directly between the Earth and the Sun — a **transit of Venus** — and drift for some six hours as a small black disk across the solar face. This is an exceptionally rare alignment: transits come in pairs eight years apart, then do not recur for more than a century. (The most recent pair fell in 2004 and 2012; the next is not until 2117. If you missed 2012, you will not see one.) And astronomers had realized these rare events were the key to measuring the size of the solar system itself.

The idea had come from Edmond Halley — the same Halley whose comet we met in the last unit. If observers at widely separated points on Earth timed the transit precisely, each would see Venus trace a slightly different chord across the Sun, and from those timing differences geometry could yield the distance to Venus, and hence — by Kepler's laws — the absolute distance from the Earth to the Sun. Halley knew he would not live to see it; he published the method as an appeal to a future generation.

They answered on a scale never before attempted. In what was arguably the first great international scientific collaboration, hundreds of observers from Britain, France, Russia, Sweden, and the American colonies were dispatched to observing stations scattered across the globe — to Siberia, to Newfoundland, to South Africa, to Tahiti (that was Captain Cook's mission in 1769). Nations at war granted safe passage to each other's astronomers. The scientific community of the world coordinated across oceans and empires to time a shadow.

{{image: Transit of Venus | Venus in transit — a small, sharp black disk crossing the face of the Sun, as photographed during the 2012 event. It was by timing exactly this crossing, from stations scattered across the globe in 1761 and 1769, that humanity first measured the absolute size of the solar system. Transits come in pairs eight years apart and then vanish for more than a century; the next will not occur until 2117.}}

And Le Gentil? His voyage took far longer than planned; war broke out, the British had seized his destination, and on the morning of the 1761 transit he was still at sea — the sky clear, the event perfectly visible, but a pitching deck making precise timing impossible. So he decided to wait for the next one, eight years later. He stayed in the Indian Ocean, built an observatory at Pondicherry, and on the morning of 4 June 1769 rose before dawn to a sky that had been flawlessly clear for weeks. Minutes before the transit began, a single cloud moved in front of the Sun. It stayed for the entire three and a half hours and cleared shortly after. He saw nothing. Colleagues a few hundred miles away had perfect conditions.

He wrote that he could not hold a pen for days. When he finally returned to France in 1771 — eleven and a half years after setting out, after dysentery and a shipwreck — he found he had been declared legally dead, his post filled, his estate divided among his heirs, his wife remarried. It took the intervention of the king to restore his affairs.

I begin with Le Gentil to make a point a table of numbers cannot. **The astronomical unit — the Earth–Sun distance, the fundamental yardstick of the entire solar system — was not handed to us. It was hunted.** Human beings sailed to the ends of the Earth, waited years, and sometimes came home with nothing, to pin down a single number. That number is about **149.6 million kilometres.** This chapter is about what it means, how it was finally captured, and why — of all the facts in this subject — the distances matter most.

## The map with no legend

To feel why the transit expeditions mattered so much, we have to be precise about what astronomy already knew by 1700, and what it did not. The gap is a beautiful illustration of a general truth: **you can know the *shape* of something perfectly while knowing nothing about its *size.***

Kepler's third law (from the last unit) — square the period, cube the distance, $T^2 = a^3$ — gave something remarkable: the **relative** sizes of every orbit, derived from nothing but the periods, which anyone can measure with patience and a calendar. Watch how powerful this is. Time Mars's orbit: 1.881 years. Then its distance is $a = 1.881^{2/3} = 1.524$ — Mars orbits at 1.524 times the Earth's distance from the Sun. No distance measured at all. Do this for every planet and the complete architecture of the solar system falls out in *relative* terms:

| Planet | Period (yr) | Distance (AU) |
|---|---|---|
| Mercury | 0.241 | 0.387 |
| Venus | 0.615 | 0.723 |
| Earth | 1.000 | 1.000 |
| Mars | 1.881 | 1.524 |
| Jupiter | 11.86 | 5.204 |
| Saturn | 29.46 | 9.583 |

This is a complete scale model — every proportion exactly right. Practise the move both directions:

```example
kepler-third
```

But look at the unit in that table: **AU**, the astronomical unit, defined as the Earth–Sun distance. Every entry is a *ratio* to Earth's own orbit. We knew Jupiter is 5.2 times as far from the Sun as we are. We did not know how far *we* are. **We possessed a perfect map of the solar system with no legend on it** — a beautifully accurate chart with no scale bar. Multiply every number by any factor you like and the model still fits every observation equally well.

And without the absolute scale, an enormous amount stays locked away. You cannot compute a planet's true diameter (you measure its *angular* size, but converting an angle to a size needs the distance). You cannot compute its mass in kilograms (Newton's form of Kepler's third law gives masses — but only if you know the orbit in metres). You cannot compute how much sunlight it receives, or its temperature, or its density, and hence whether it is rock or gas. **The absolute scale is the key that converts the entire solar system from a set of ratios into a collection of real physical objects.** Nail the AU, and every other quantity in planetary science unlocks at once. That is why it was worth sailing to Tahiti.

Why not just measure the distance to the Sun directly, by parallax? Because the Sun is *far.* Viewed from a baseline equal to the Earth's radius, its direction shifts by only about **8.8 arcseconds** — roughly the angular size of a coin at four kilometres. Measuring an angle that small, against the blinding solar disk, was simply beyond the instruments. The transit method was ingenious precisely because it *sidestepped* the impossible measurement: instead of measuring a tiny angle to the Sun, you measure the *times* at which a sharp black dot touches and leaves the solar edge. Timing, eighteenth-century observers could do superbly. The geometry then turns those timings into the angle you actually wanted — **an impossible measurement traded for a possible one.**

## Radar: the definitive answer

The transit campaigns, after a century of effort and real human cost, got the AU to within about 2%. The definitive answer needed a fundamentally different technique — one that did not exist until the twentieth century.

In 1961, teams in the United States and the Soviet Union pointed powerful radio transmitters at Venus and did something conceptually simple and utterly decisive: **they bounced a radar pulse off it and timed the echo.** Radio waves travel at the speed of light, $c$, known with extraordinary precision. Send a pulse, wait for the echo, measure the round-trip time, and the distance is simply half of $c$ times that time. No parallax, no angles, no black-drop effect, no expeditions. Just a clock and the speed of light.

```example
radar-au
```

The result pinned the astronomical unit to about **one part in a million** — a thousand times better than the transit campaigns, obtained in an afternoon, from a single location. And there is a final twist: for most of history the AU was a *measured* quantity, but in 2012 the International Astronomical Union simply *defined* it, fixing it as exactly **149,597,870,700 metres.** From Le Gentil's ruined decade to a number fixed by committee and known to the metre — that is what scientific progress looks like. The hard-won becomes the routine, and the next generation stands on it without thinking. Every distance in this subject rests on that foundation.

## Distance as time

Now that we have the AU in kilometres, we can lay the solar system out in absolute terms. But raw kilometres are almost useless to intuition — "4.5 billion kilometres" conveys nothing except "big." So let me introduce the unit planetary scientists and mission engineers actually think in: **light-travel time.** Express a distance by how long light takes to cross it, and you get both a sense of scale *and* an operationally meaningful quantity — because light-travel time is exactly the delay in every signal we exchange with every spacecraft.

Start with the most familiar entry. **The Sun is 8.3 light-minutes away.** The sunlight on your hands right now left its surface eight minutes ago; if the Sun were extinguished this instant you would not know for eight minutes and twenty seconds. We never see the Sun as it *is*, only as it *was.* Drag the slider outward and watch a flash of light sweep past the planets one by one:

```lighttime
```

Run down the scale and the numbers grow relentlessly. Jupiter is three-quarters of an hour out; **Neptune is 4.2 light-hours** from the Sun. Light — which crosses the whole Earth seven times a second — needs a substantial fraction of a day just to cross our own planetary system. And this is not a party trick, because radio travels at the same speed: **light-travel time *is* the communication delay.** A round-trip command to a Mars rover takes anywhere from 9 to 42 minutes, so **you cannot drive it.** By the time an image of an obstacle reaches Earth, the rover has been parked in front of it for a quarter of an hour, and your "stop" takes just as long to get back. Every rover must therefore be *substantially autonomous*; every landing must execute itself before the news that it began has even arrived — the reason a Mars landing's "seven minutes of terror" are already over, one way or the other, by the time mission control hears them start.

```example
light-time
```

## The solar system is almost entirely empty

There is one more intuition to build, and it is the one that most reliably surprises people. Every diagram of the solar system you have ever seen is a *lie*, and it lies in a specific way: it shows planets as prominent objects, comfortably spaced, filling the frame. The reality is nothing like that.

Build an honest model. Set **1 AU = 10 metres**, so the Earth orbits ten metres from the Sun and the whole thing out to Neptune fits in a large field. Then:

- **The Sun** becomes a sphere about **9.3 centimetres** across — a grapefruit.
- **The Earth**, ten metres away, is **0.85 millimetres** across — *a grain of sand.*
- **Jupiter**, the giant that outweighs everything else combined, is a **9-millimetre** pea, 52 metres from the grapefruit.
- **Neptune** is a grain of sand at the far end of a **300-metre** field — three football pitches away.

Sit with that. A grapefruit, and then — across several sports fields — eight objects ranging from a grain of sand to a pea, with hundreds of metres of nothing in between. Run the numbers and it is stark: **the eight planets together occupy about one part in $1.6 \times 10^{14}$ of the volume enclosed by Neptune's orbit** — one part in a hundred and sixty trillion. Pick a random point inside the solar system and your chance of landing inside a planet is essentially zero. Every diagram cheats because an honest one would be blank.

{{image: Pale Blue Dot | Earth — the faint point of light caught in a band of scattered sunlight, upper right — photographed by Voyager 1 in 1990 from beyond Neptune, some 6 billion kilometres away. "That's here. That's home. That's us," Carl Sagan wrote of this image. It is the honest picture the textbook diagrams never show: on the true scale of the solar system, the planets are not prominent worlds filling the frame but almost invisible specks in an overwhelming emptiness.}}

The emptiness has a companion fact about *mass*, equally lopsided. **The Sun holds 99.87% of the mass of the entire solar system.** Everything else — all eight planets, all the moons, all the asteroids and comets and dust — is the remaining 0.13%. And within that sliver, **Jupiter alone is about 71% of all the mass that is not in the Sun.** Add Saturn and the two of them are 92% of everything left over. So, to an excellent approximation, **our solar system is the Sun, plus Jupiter, plus debris** — everything else we will spend the rest of this subject studying is a rounding error on a rounding error. That is not a diminishment; it is a statement about where the gravitational authority lies, and it will matter enormously when Jupiter's gravity turns out to have rearranged the whole system.

One last number completes the picture. Keep the model — Neptune at the far end of a 300-metre field. Where is the nearest star? Proxima Centauri, at 4.25 light-years, would sit **2,685 kilometres away.** If your model Sun is a grapefruit in Paris and Neptune is three hundred metres down the road, the nearest other star is a second grapefruit somewhere past Moscow — with, as far as we know, essentially nothing whatsoever in between. **Three hundred metres to our system's edge, versus twenty-seven hundred kilometres to the next star:** planetary systems are tiny islands separated by immense, empty oceans. It is why interstellar travel is not merely harder than interplanetary travel but *categorically* different — by a factor of thousands, not a few.

## The snow line: the distance that built the solar system

We come to the payload — the single idea that will govern everything, and the reason scale is not a preliminary but the foundation. Look at the solar system as a whole and one pattern leaps out. The planets fall into **two sharply distinct families**, divided by distance from the Sun:

| | Inner (terrestrial) | Outer (giant) |
|---|---|---|
| Members | Mercury, Venus, Earth, Mars | Jupiter, Saturn, Uranus, Neptune |
| Distance | 0.4 – 1.5 AU | 5.2 – 30 AU |
| Mass | 0.05 – 1 Earth mass | 15 – 318 Earth masses |
| Composition | Rock and metal | Hydrogen, helium, ices |
| Density | High (4–5.5 g/cm³) | Low (0.7–1.6 g/cm³) |
| Moons / rings | Few / none | Dozens / all four |

Four small dense rocky worlds huddled close to the Sun; four enormous low-density gas-rich worlds far out; nothing in between. **Any theory of the solar system's origin must explain this split.** And the explanation begins with a fact so simple it seems inadequate to the task: **it is hotter near the Sun and colder far away.**

The solar system formed from a disk of gas and dust around the young Sun, and that disk had a temperature *gradient* — hot near the newborn star, colder outward. The curve below is $T = 278/\sqrt{d}$, which reproduces the real equilibrium temperatures well: about 440 K at 0.4 AU, 278 K at Earth, 51 K out at Neptune. Now combine that with a fact from chemistry, and the consequences become dramatic. Each material has a temperature below which it can condense from gas into solid grains. Metals and silicates condense above 1000 K, so they can solidify *everywhere.* But **water ice** needs the disk to fall below roughly **150–170 K.** Drag the marker in from the Sun and find the boundary yourself:

```snowline
```

That boundary — the distance beyond which water ice could condense — is the **snow line** (or frost line). In the young solar nebula it lay at about **2.7 AU**, out in what is now the asteroid belt. And here is why one line changes everything: **water is enormously abundant.** Hydrogen and oxygen are the first and third most common elements in the universe, so water is one of the most abundant compounds there is — far more plentiful than rock and metal. Crossing the snow line therefore did not nudge the available building material up a little; it produced a *step change*, multiplying the solid material by roughly **two to four.**

```example
snow-line-temp
```

That abundance triggered a cascade — the chain that produced the two families:

1. **Beyond the snow line, far more solid material was available.**
2. **So bodies out there grew larger, and grew *faster.***
3. **Speed was decisive, because there was a deadline.** The disk's gas does not last: observations of young stars show these disks disperse in roughly 3–10 million years. Any planet wanting a massive hydrogen–helium envelope had to build a large solid core *before that gas vanished.*
4. **Beyond the line, cores could reach the critical size (~10 Earth masses) in time — and then gravitationally seize enormous envelopes of gas.** That runaway capture is what turns a rocky-icy core into a *giant.*
5. **Inside the line, with only rock and metal to work with, bodies grew too slowly and too small.** By the time they reached their final size, the gas was gone. They stayed small, dense, rocky worlds.

{{image: Protoplanetary disk | The protoplanetary disk around the young star HL Tauri, imaged by the ALMA array — concentric bright rings and dark gaps where forming worlds are sweeping up material. It is in a disk like this, around the newborn Sun, that our own planets took shape, sorted by temperature: rock and metal condensing throughout, water ice only beyond the snow line, where the sudden abundance of solid material let giant cores grow fast enough to seize their gas.}}

## Distance is destiny

Now you can see what the thesis means concretely. It is not a slogan; it is a causal chain:

$$\text{distance} \rightarrow \text{temperature} \rightarrow \text{what condenses} \rightarrow \text{solid mass} \rightarrow \text{growth rate} \rightarrow \text{planet type}$$

Every arrow is physics we can check. Jupiter is a giant because it formed just outside the snow line, where material was abundant and it could grow fast enough. Earth is a small rocky world because it formed inside, where the cupboard was comparatively bare and the clock ran out. When we reach Mercury and find a stripped world of iron; when we reach Venus and find a runaway greenhouse; when we ask why no planet formed in the asteroid belt; when we reach the icy swarm beyond Neptune — in every case, some part of the answer will be *where it formed, and how far that was from the Sun.*

It is tempting to study the solar system as a gallery of curiosities — the hot one, the red one, the one with rings. Resist that, because it inverts the logic of the subject. Planetary science is not a zoo; it is a *causal* science, in which the properties of each world are consequences of the conditions under which it formed. When you meet a strange fact in the chapters ahead, your first question should always be: *where did this form, and what does that distance imply?* That habit of mind turns a catalogue into a science. **The solar system is not a collection of unrelated worlds. It is one family, born from one cloud, sorted by one variable — and you now have the yardstick to measure it and the boundary that divides it.**$astroSC_master$,
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
  select $astroSC_quiz$[{"id": "q1", "type": "mcq", "prompt": "Kepler's third law is often described as giving us 'a perfect map of the solar system with no legend.' What does that mean?", "options": ["It gives the planets' distances in kilometres but not their order from the Sun", "From orbital periods alone it gives every planet's distance as a RATIO to Earth's orbit (in AU) \u2014 the complete relative architecture, exactly proportioned \u2014 but says nothing about the ABSOLUTE scale: how many kilometres one AU actually is. Multiply every distance by any factor and the model still fits every observation", "It gives the absolute distances but not the shapes of the orbits", "It works for the inner planets but fails for the giants"], "answerIndex": 1, "explanation": "Kepler's third law (T\u00b2 = a\u00b3) yields each planet's semi-major axis in AU from its period alone \u2014 no distance measured. That fixes every proportion perfectly: Jupiter is 5.2 times as far from the Sun as we are, Mars 1.52 times. But every entry is a ratio to Earth's own orbit, so the whole table is scale-free \u2014 a chart with no scale bar. Without the absolute size you cannot compute any planet's true diameter, mass, density, or temperature. Nailing the AU is the key that turns the ratios into real physical objects, which is why it was worth sailing to Tahiti to measure."}, {"id": "q2", "type": "mcq", "prompt": "In Halley's transit-of-Venus method, what did observers actually measure, and why was that easier than measuring the distance to the Sun directly?", "options": ["They measured the diameter of Venus; that was easier than resolving the Sun", "They measured the TIMING (and hence duration) of Venus's black disk crossing the Sun from widely separated stations. Observers at different latitudes see slightly different chords, so the transit lasts slightly different times, and that timing difference yields the parallax. Timing a sharp black dot with a clock was achievable; measuring the tiny 8.8-arcsecond solar parallax directly, against the blinding Sun, was beyond the instruments", "They measured the brightness of the Sun before and during the transit", "They measured the angle between Venus and the Sun at greatest elongation"], "answerIndex": 1, "explanation": "The genius of the method is that it converts an unmeasurable ANGLE into a measurable TIME. The solar parallax \u2014 the shift in the Sun's direction over one Earth-radius baseline \u2014 is only about 8.8 arcseconds, the angular size of a coin at four kilometres, and could not be measured directly against the featureless blinding solar disk. But by using Venus as a sharp black marker and timing how long it took to cross the Sun from different places on Earth, observers measured durations that differed by minutes \u2014 well within reach of a good clock. Geometry then converted those timings into the parallax, and Kepler's ratios turned the one distance into all of them."}, {"id": "q3", "type": "mcq", "prompt": "In 1961 radar ranging finally settled the astronomical unit. How does the method work, and why is it so much more precise than the transit campaigns?", "options": ["It photographs Venus through a telescope and measures its angular size; precision comes from better cameras", "It bounces a radio pulse off Venus and times the echo: distance d = ct/2, using the exactly-known speed of light. One measurement from a single location, immune to the black-drop effect and needing no angles, no rare alignment, no globe-spanning stations, pins the AU to about one part in a million \u2014 versus roughly 2% for the transits", "It measures the Doppler shift of sunlight reflected from Venus", "It uses the parallax of Venus seen from two telescopes on opposite sides of Earth"], "answerIndex": 1, "explanation": "Radar measures distance directly from a time interval: send a pulse, wait for the echo, and the target's distance is half the speed of light times the round-trip time. Because c is known exactly (indeed the metre is defined from it), and clocks are superb, a single afternoon's measurement from one site beats a century of transit expeditions by a factor of a thousand \u2014 no parallax, no delicate contact timing, no black-drop effect, no clear weather at multiple sites worldwide. Radar to Venus and Mars, and tracking of spacecraft, refined it further; in 2012 the IAU simply defined the AU as 149,597,870,700 metres exactly."}, {"id": "q4", "type": "mcq", "prompt": "Why must Mars rovers be substantially autonomous rather than driven in real time from Earth?", "options": ["Because radio signals are too weak to carry steering commands that far", "Because light-travel time IS the communication delay: a round-trip radio signal to Mars takes roughly 9 to 42 minutes. By the time an image of a hazard reaches Earth, the rover has been sitting in front of it for many minutes, and a corrective command takes just as long to return \u2014 real-time control is physically impossible, so the rover must detect hazards and plan paths on its own", "Because the rover's wheels turn too slowly for a human driver to be useful", "Because Mars rotates too fast to keep an antenna pointed at Earth"], "answerIndex": 1, "explanation": "Radio travels at the speed of light, so light-travel time is an unavoidable, hard communication lag. Mars's round-trip delay ranges from about 9 to 42 minutes depending on orbital positions. You cannot drive a machine you can only reach by letter: the picture of an obstacle is many minutes stale on arrival, and your 'stop' is many minutes late getting back. So every rover carries onboard autonomy \u2014 hazard detection, path planning, decision-making \u2014 with humans sending high-level goals, not moment-to-moment steering. The same logic makes landings execute themselves: by the time mission control learns a landing has begun, it has already succeeded or failed."}, {"id": "q5", "type": "mcq", "prompt": "What is the snow line, and how did it produce the solar system's two families of planets?", "options": ["The orbit of the coldest planet; inside it planets are rocky, outside they are icy by pure coincidence", "The distance from the young Sun (about 2.7 AU) beyond which the disk was cold enough (below ~150\u2013170 K) for water to condense into ice. Because water is enormously abundant, crossing it multiplied the available solid material several-fold; more material meant faster growth; faster growth let outer cores reach ~10 Earth masses and seize giant gas envelopes BEFORE the disk's gas dispersed. Inside the line, only rock condensed, bodies grew too slowly, and stayed small and rocky", "The boundary of the Sun's magnetic field, which deflects ice toward the outer planets", "The edge of the asteroid belt, which physically blocked material from reaching the inner planets"], "answerIndex": 1, "explanation": "The snow line (~2.7 AU) is where the protoplanetary disk fell below the ~150\u2013170 K needed for water to freeze into solid grains. Rock and metal condense above 1000 K and so could solidify everywhere; water ice could only condense beyond the line. Since hydrogen and oxygen are the first and third most abundant elements, water is one of the most abundant compounds, so adding ice to the inventory produced a step change \u2014 a factor of two to four more solids. That let outer bodies grow large and fast enough to capture hydrogen-helium envelopes before the disk's gas vanished in a few million years (giants). Inside the line, with only rock to build from, growth was too slow and small (terrestrial worlds). One distance, two provinces."}, {"id": "q6", "type": "open", "prompt": "Two intuitions capture the scale of the solar system: distance as light-travel TIME, and the honest scale MODEL. Explain both \u2014 including the Sun's and Neptune's light-times and why the delay is operationally important, and the 1 AU = 10 m model with the sizes of the Sun, Earth, and the gap to the nearest star. Then state the two great facts about where the system's MASS lives.", "rubric": "LIGHT-TRAVEL TIME: express a distance by how long light takes to cross it. The SUN is 8.3 light-minutes away \u2014 the sunlight we see left it eight minutes ago, so we never see the Sun as it is, only as it was. NEPTUNE is 4.2 light-HOURS from the Sun; light, which crosses the Earth seven times a second, needs a substantial fraction of a day to cross our own planetary system. WHY OPERATIONAL: radio travels at the speed of light, so light-travel time IS the signal delay. A round-trip to Mars is ~9\u201342 minutes, so rovers cannot be driven in real time \u2014 they must be autonomous (hazard detection, path planning); landings execute themselves before mission control learns they began; operating Voyager is like correspondence by post. THE SCALE MODEL (1 AU = 10 m): the Sun becomes a ~9 cm grapefruit; the Earth a 0.85 mm grain of sand ten metres away; Jupiter a ~9 mm pea at 52 m; Neptune a grain of sand ~300 m off (three football pitches). The planets occupy about one part in 1.6\u00d710^14 of the volume enclosed by Neptune's orbit \u2014 essentially empty; every textbook diagram cheats. THE NEAREST STAR: Proxima Centauri on the same model sits ~2,685 km away \u2014 a second grapefruit past Moscow if ours is in Paris \u2014 so planetary systems are tiny islands in immense empty oceans (interstellar travel is categorically, not incrementally, harder). MASS FACTS: (1) the SUN holds 99.87% of the solar system's mass; everything else is 0.13%. (2) Within that remainder, JUPITER alone is ~71% of all non-solar mass (with Saturn, ~92%). So to an excellent approximation the solar system is the Sun, plus Jupiter, plus debris. A strong answer ties these together: the system is overwhelmingly empty and overwhelmingly dominated by the Sun and Jupiter."}, {"id": "q7", "type": "open", "prompt": "This chapter's thesis is that 'distance is destiny.' Synthesize the chapter: the historical problem of the absolute scale and how it was solved; what the AU unlocks; and above all the snow line and the full causal chain from distance to planet type. Conclude with the block's through-line and why studying the solar system as a causal system beats studying it as a catalogue.", "rubric": "THE PROBLEM AND ITS SOLUTION: Kepler's third law gave the RELATIVE distances of all the planets from their periods alone \u2014 a perfect scale model with no scale, a map with no legend. Without the absolute AU, nothing physical could be computed (no diameters, masses, densities, temperatures). Measuring it took three centuries: the 18th-century transit-of-Venus campaigns (the first great international scientific collaboration; Le Gentil's ruined decade shows the human cost) cleverly converted the unmeasurable 8.8-arcsecond solar parallax into a measurable TIME \u2014 transit-duration differences between distant stations \u2014 and got within ~2%. Then in 1961 radar ranging off Venus (d = ct/2, using the exact speed of light) settled it to one part in a million, and in 2012 the IAU defined the AU as 149,597,870,700 m exactly. WHAT THE AU UNLOCKS: it converts the solar system from a set of ratios into real objects with sizes, masses, densities, and temperatures. THE SNOW LINE AND THE CAUSAL CHAIN (the core): the planets split cleanly into two families \u2014 small dense rocky worlds inside ~1.5 AU, giant gas-rich worlds beyond ~5 AU. Cause: temperature falls with distance; water can only condense into ice below ~150\u2013170 K, i.e. beyond ~2.7 AU (the snow line). Because water is enormously abundant, crossing the line multiplied available solids several-fold; more material meant faster growth; faster growth let outer cores reach ~10 Earth masses and capture giant gas envelopes BEFORE the disk's gas dispersed (~3\u201310 Myr); inside the line, growth was too slow and small, leaving rocky worlds. The chain: distance \u2192 temperature \u2192 what condenses \u2192 solid mass \u2192 growth rate \u2192 planet type. THROUGH-LINE / CATALOGUE vs CAUSAL: a catalogue presents worlds as unrelated curiosities to memorize; a causal treatment asks of every feature 'what produced it?' and finds the answer begins, again and again, with where the body formed and how far that was from the Sun (Mercury's iron core, Venus's greenhouse, the empty asteroid belt, Jupiter's dominance, the icy Kuiper swarm). The solar system is one family, born from one collapsing cloud, sorted by one variable \u2014 distance. A strong answer explains WHY the causal view is superior: it turns a list of facts into a story with a cause, and makes the properties of each world predictable from its formation distance rather than merely catalogued."}]$astroSC_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/the-scale-of-the-solar-system', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
