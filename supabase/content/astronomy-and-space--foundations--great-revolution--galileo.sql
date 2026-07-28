-- Astronomy & Space · Foundations — The Great Revolution —
-- "Galileo and the Telescope: looking, and noticing" (rebuilt from ASTRO-101 Lecture 9).
-- Curated, human-reviewed master for
-- astronomy-and-space/foundations/great-revolution/galileo @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Original, house-styled rework of the moment the revolution became visible — and of the
-- harder lesson underneath it. After Kepler, heliocentrism was precise but positionally
-- indistinguishable from Tycho's hybrid; the argument needed new FACTS and a new PHYSICS.
-- The telescope supplied the facts (Lipperhey 1608; Harriot's lunar drawing of 26 July
-- 1609 predating Galileo -- observation is not discovery, and Galileo himself logged
-- Neptune as a star in 1612-13). Four observations, organised by the Aristotelian pillar
-- each destroyed: lunar mountains measured by geometry (h ~ d^2/2R, ~8.7 km), sunspots,
-- Jupiter's moons (contrast not resolution), the Milky Way resolved. The phases of Venus
-- done quantitatively (apparent size varies 6.2x, ANTI-correlated with phase; Ptolemy
-- forbids full; consistent with Tycho -- refuting a theory is not establishing its rival).
-- What it takes to believe an instrument, including the star-size objection that was RIGHT
-- until Airy explained diffraction in 1835. Galilean relativity and the circular-inertia
-- flaw that made a moving Earth permissible but not necessary. And the 1633 trial without
-- the cartoon: incomplete evidence, a tidal proof that wrongly predicts one tide a day,
-- and the real stake -- who adjudicates claims about nature, authority or evidence.
--
-- This chapter uses inline KaTeX ($...$ / $$...$$), so the body carries paired delimiters
-- (an even count is expected and asserted); the dollar-quote tags are checked for
-- collisions. Nine problems with full worked answers, plus a seven-item quiz.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/foundations/great-revolution/galileo',
    'research',
    'advanced',
    'read',
    $astroGA_master$> After Kepler the heliocentric system was at last precise, and still not proven: his ellipses describe motion relative to the Sun and say nothing about whether the Sun itself moves, so they fit Tycho Brahe's hybrid — the planets orbiting the Sun while the Sun orbits a stationary Earth — exactly as well as they fit Copernicus, the geometry being identical, and no amount of positional data could ever separate them. Breaking that deadlock required two things measurement of positions could not supply: **new facts**, of a kind nobody had ever had access to, and a **physics** in which a moving Earth was possible. Galileo's telescope furnished the first, and his mechanics the beginnings of the second. But the durable lesson of the episode is subtler than the morality play in which evidence confronts superstition and is briefly suppressed, because in 1633 the evidence was genuinely incomplete, one of the strongest arguments *against* Copernicus was a sound argument from a real measurement, and Galileo's own flagship proof of the Earth's motion was **wrong** — worse than the explanation he ridiculed. Getting that right matters more than the cartoon does.

## After Kepler: precise, and still undecided

Kepler's laws removed the epicycles and, through the Rudolphine Tables and the predicted transit of Mercury in 1631, gave heliocentrism its first genuine accuracy advantage in eighty years. What they did not do is decide the question they are usually credited with deciding. The three laws describe how a planet moves *around the Sun*; they say nothing about whether the Sun is itself in motion. On positional data alone the Copernican arrangement and Tycho Brahe's hybrid — everything orbiting the Sun, the Sun orbiting a stationary Earth — are kinematically identical, and the same ellipses, equal areas and harmonic law fit both. Two thousand years of measuring where the planets appear had reached the point where measuring more of the same could settle nothing.

So the argument needed what Kepler could not provide: facts of a new kind, and a physics in which a spinning, hurtling Earth was not absurd. What follows is the account of both — and of a third thing that turns out to be the hardest, **what it takes to believe an instrument.** For an instrument supplied the new facts, and an artefact of that same instrument produced one of the best arguments the other side ever had.

## The man who looked first

The telescope was not Galileo's invention. In **October 1608**, Hans Lipperhey, a spectacle-maker in Middelburg, applied to the States-General of the Netherlands for a patent on a device for seeing distant things as though near. It was refused on the grounds that the idea was already too widely known, and within months spyglasses were on sale across Europe as novelties. Galileo did not handle one until mid-1609, and he did not obtain the first telescopic view of the heavens either.

On **26 July 1609**, **Thomas Harriot** — mathematician, formerly navigator to Walter Raleigh's Virginia expedition — pointed a six-power telescope at the Moon from a house in London and drew what he saw. The drawing survives, the first known telescopic depiction of an astronomical object, predating Galileo's earliest lunar observations by several months. Harriot went on to observe the Moon repeatedly, to see Jupiter's satellites, and to track sunspots — a superb observer with excellent instruments. **He published nothing.**

{{image: Thomas Harriot | Thomas Harriot (c. 1560-1621), who drew the Moon through a telescope on 26 July 1609 — the first known telescopic image of a celestial object, months before Galileo — and then observed Jupiter's satellites and sunspots without publishing any of it. The comparison with Galileo is the point: the same appearances, treated as a record rather than as evidence about something, changed nothing.}}

The comparison is more instructive than opening with Galileo at the eyepiece. Harriot's July 1609 lunar drawing is a **record of an appearance** — a rough outline, some shaded patches, a boundary. Galileo's drawings, months later, are something different, because he was not recording the Moon's appearance but **reasoning about what produced it.** He noticed that the boundary between light and dark was ragged rather than smooth, that bright points appeared in the dark region ahead of it and slowly joined the lit portion, and that the whole pattern was exactly what sunrise over mountains looks like. Then he did the thing that separates the two men: he **measured** how far those illuminated points lay beyond the terminator, applied a piece of school geometry, and published a number for the height of a lunar mountain — all of it fast, in Latin, aimed at every learned reader in Europe, in the *Sidereus Nuncius* of March 1610, written and printed in about two months.

> Harriot looked. Galileo looked, worked out what it implied, measured it, argued from it, published it, and defended it for the rest of his life.

That lesson runs through the whole later history of the outer solar system: the first Astronomer Royal catalogued Uranus more than twenty times as a fixed star, "34 Tauri," and others did the same, before Herschel in 1781 decided to check whether the object had moved. **Observation is not discovery.** What Galileo added in 1610 was not a better telescope — Harriot's were comparable — but the decision to treat what he saw as evidence *about something.*

And the point comes with an irony attached. In **December 1612 and January 1613**, tracking Jupiter's moons, Galileo recorded a nearby star in his notebook and on one occasion noted that it seemed to have shifted relative to a neighbour. He did not follow it up. It was **Neptune**, and it would not be identified for another 233 years. The man whose career demonstrates the difference between looking and noticing failed the identical test three years after passing it — having *seen* the anomaly and let it go. The lesson is not a character trait one possesses; it is a discipline, and it has to be applied every single time.

## What a telescope actually does

Before the discoveries, the instrument, because the numbers explain both what was possible and what later went wrong. A telescope does **two** separate things.

**It gathers light**, an amount scaling as the square of the aperture. A dark-adapted human pupil is about 6.5 mm across; Galileo's objectives were around 15–25 mm, and he frequently **stopped them down** with a mask to cut the aberrations of poorly figured glass.

| Aperture | Light gathered vs eye | Magnitudes deeper |
|---|---|---|
| 15 mm | 5.3× | 1.8 |
| 20 mm | 9.5× | 2.4 |
| 25 mm | 14.8× | 2.9 |

The naked-eye limit is about magnitude 6, so Galileo could reach roughly **magnitude 8.5–9.** That is what let him resolve the Milky Way into individual stars — an observation with immediate and enormous implications for the size of the universe.

**And it resolves detail.** The eye separates points about 1 arcminute apart. The diffraction limit of a 20 mm aperture is about **7 arcseconds**, some nine times finer — though in practice his lenses were far from that limit, and aberrations probably left him with 10–20 arcseconds. Still a factor of three to six over the unaided eye.

There was a serious flaw in the design. Galileo's telescopes used a convex objective and a **concave** eyepiece — the "Galilean" arrangement, still found in opera glasses. It gives an upright image, which is convenient, and a **catastrophically small field of view:** roughly **15 arcminutes** at his magnifications, half the width of the Moon, whose disc spans about 31 arcminutes. He was observing through a straw, one small patch at a time, with a shaky hand-held tube. Kepler himself later described the superior design — convex objective, convex eyepiece, a wider field and an inverted image — which is why every research telescope since has been a "Keplerian" and not a Galilean. Bear the field of view in mind when weighing what Galileo achieved: finding four moving points near Jupiter and tracking them nightly for weeks, through an aperture that could not contain the full Moon, is not a trivial act of observation.

{{image: Galileo's telescope | One of Galileo's surviving telescopes. The convex objective was often masked down to a smaller working aperture to tame the aberrations of imperfect glass, and the concave eyepiece gave an upright image across a field of only about 15 arcminutes — half the width of the Moon — so the sky had to be built up one small patch at a time.}}

## Four observations, and the pillar each removed

The Aristotelian cosmos rested on a small number of structural claims. It is more useful to organise the discoveries by **which claim each destroyed** than to list them as a catalogue of wonders.

### The heavens are perfect and unchanging → the Moon and the Sun

**The Moon has mountains.** The terminator is ragged; bright points appear in the darkness beyond it and gradually merge with the lit portion as the Sun rises over them. That is what a mountainous landscape does at dawn, and Galileo said so. Then he measured it, and this is the part usually left out. If a peak of height $h$ is illuminated while the plain around it is still dark, and it lies a projected distance $d$ beyond the terminator, then from the geometry of a sphere of radius $R$,

$$(R+h)^2 = R^2 + d^2 \quad\Rightarrow\quad h \approx \frac{d^2}{2R}.$$

Galileo reported lit points as far as one twentieth of the Moon's diameter past the terminator — $d \approx 174$ km — which gives

$$h \approx \frac{(174)^2}{2 \times 1738} = 8.7\ \text{km}.$$

He published a figure of about four miles, or 6.4 km. The true maximum lunar elevation is about **10.8 km.** In 1610, using a hand-held tube and a triangle, he measured the height of a mountain on another world to within a factor of two. That is a measurement, not an impression, and it is why the lunar observation carried weight that Harriot's drawing did not.

**And the Sun has spots** — dark, irregular, changing shape, and marching across the disc in a way that implies the Sun rotates. The Moon proved a rough world of ordinary stuff; the Sun proved a changing one. The sharp division between the perfect heavens and the corruptible Earth, the load-bearing wall of the whole Aristotelian edifice, was simply false.

### The Earth is the unique centre of motion → Jupiter's moons

Four points of light, strung in a line through Jupiter, in different positions every night, sometimes vanishing behind or in front of the planet. **Objects orbiting something that is not the Earth.** There is a technical point worth making, because the usual account gets the reason wrong. Consider what the telescope actually contributed.

| Moon | Max separation from Jupiter | Magnitude |
|---|---|---|
| Io | 2.3 arcmin | 5.0 |
| Europa | 3.7 arcmin | 5.3 |
| Ganymede | 5.9 arcmin | 4.6 |
| Callisto | 10.3 arcmin | 5.6 |

The naked eye separates points 1 arcminute apart, and the naked-eye limit is magnitude 6. The Galilean moons are bright enough to see and far enough apart to resolve. **In principle they are naked-eye objects.** The reason nobody had ever seen them is that Jupiter is magnitude $-2.7$ — about two thousand times brighter — and the moons are drowned in its scattered-light halo. What the telescope supplied was not resolution and not sensitivity but **contrast:** magnification spreads Jupiter's glare over a larger apparent area and lifts the moons clear of it.

This also answered a specific objection to Copernicus. Critics had argued that a moving Earth would **leave the Moon behind** — surely a planet racing around the Sun could not drag a satellite with it? Jupiter is indisputably in motion under every model, and it carries four moons as it goes. The objection died on the spot: whatever lets Jupiter keep its moons is available to a moving Earth, and one need not even know the mechanism to see that the argument fails.

{{image: Galilean moons | Io, Europa, Ganymede and Callisto, the four moons Galileo found strung in a shifting line beside Jupiter in January 1610. They are the first bodies ever seen to circle a centre that is not the Earth — and, being bright enough and far enough from the planet to be naked-eye objects in principle, a demonstration that what the telescope supplied here was contrast, not resolution.}}

### The Milky Way is a vapour → it is stars

Turned on the faint band of the Milky Way, the telescope resolved it into countless individual points, too faint for the naked eye. The universe contains vastly more than anyone could see, which makes the absence of stellar parallax less surprising — the stars might simply be very far away. Hold that thought: it becomes a serious problem below, where the faintness that argues for great distance meets the apparent *size* of the stars and turns into the best argument the other side ever had.

## The phases of Venus: doing the argument properly

This is the decisive observation, and it is almost always stated too weakly. The usual version — *Venus shows phases, therefore it orbits the Sun* — is not quite right, because Venus shows *some* phases in the Ptolemaic model too. The real argument is sharper, and it is quantitative.

In the Ptolemaic system Venus rides an epicycle whose centre is fixed on the line from the Earth to the Sun, so that Venus never strays more than about 46° from the Sun. That constraint is not optional; it is what makes the model reproduce Venus's motion. The consequence is geometric and inescapable: **Venus is always between the Earth and the Sun**, always viewed from roughly the direction of its unlit side. It can show new and crescent phases. It can **never** be gibbous, and it can **never** be full.

If instead Venus orbits the Sun on a smaller orbit than the Earth's, it passes *behind* the Sun as well as in front: fully lit and far at superior conjunction, unlit and close at inferior conjunction. It runs through the complete cycle. And now the part that makes the observation decisive rather than merely suggestive:

| Configuration | Distance | Angular diameter | Phase |
|---|---|---|---|
| Superior conjunction (far side of Sun) | 1.72 AU | 9.7″ | full |
| Greatest elongation | 0.69 AU | 24.2″ | half |
| Inferior conjunction (near side) | 0.28 AU | 60.3″ | new |

The apparent size varies by a factor of **6.2**, and it is **anti-correlated with the phase:** Venus is full when smallest and a thin crescent when largest. That joint signature is the test — not something Ptolemy's model gets partly right, but something it forbids. Galileo observed exactly this in late 1610, and — following the custom of the age for establishing priority without revealing a result — announced it first as an **anagram**, which unscrambled to *the mother of loves imitates the figures of Cynthia:* Venus imitates the phases of the Moon.

There is a neat reason nobody had spotted the effect by eye, and it falls out of the numbers. Brightness depends on the illuminated area, which goes as the illuminated fraction $f$ times the square of the angular diameter:

| Phase | $f$ | Angular size | Illuminated area (arb.) |
|---|---|---|---|
| Full | 1.00 | 9.7″ | 94 |
| Half | 0.50 | 24.2″ | 292 |
| Crescent | 0.10 | 47.7″ | 227 |

The two factors nearly cancel. Venus's diameter changes by a factor of six while its brightness changes by only about a magnitude, because as it approaches it grows but shows less and less of its lit face. Without a telescope there was nothing obvious to notice: the phases of Venus were not overlooked through carelessness but were genuinely invisible.

Now the qualification, which matters more than the result. **The phases refute Ptolemy. They do not establish that the Earth moves.** In Tycho's system Venus orbits the Sun and the Sun orbits a stationary Earth; Venus therefore passes behind the Sun and shows exactly the same full cycle and the same anti-correlation of size and phase. Every observation in this section is reproduced perfectly. So what Galileo achieved in 1610 was to eliminate one of three live models. Two remained, observationally indistinguishable by any measurement then available.

> Refuting a theory is not the same as establishing its rival. This is worth stating as a general principle, because it is the most common error in reading scientific arguments, including modern ones.

What would eventually break the tie was not better observation of positions. It was **physics** — a theory in which a moving Earth makes sense and a stationary one does not. That would be Newton's achievement, fifty-four years after Galileo's death.

{{image: Phases of Venus | The full cycle of Venus's phases with its apparent size varying in step: large and crescent when Venus is near, between us and the Sun; small and full when it is far, behind the Sun. The size varies by a factor of 6.2 and is anti-correlated with the phase — a joint signature the pure Ptolemaic model forbids, since it keeps Venus always between the Earth and the Sun and so allows only crescent and new.}}

## Believing an instrument

Here is the problem most accounts treat as obscurantism and which was, in fact, entirely reasonable. Galileo was asking Europe to overturn its cosmology on the basis of things **visible only through a tube of his own manufacture.** Nobody could check the moons of Jupiter by eye; the images were faint, the field tiny, the glass variable, and the appearances included obvious artefacts — coloured fringes, distortion, ghosting. How does one establish that an instrument is showing something real? Galileo's answer is the one every instrument-based science has given since. **Terrestrial calibration:** point the telescope at a distant ship or inscription one can then walk to and verify; if it reports correctly about what can be checked, that is evidence about what cannot. **Internal consistency:** the four moons stay in a line through Jupiter, return to configurations already seen, and move as orbits require. And **prediction**, the strongest — Galileo determined the moons' periods and predicted where they would be, and they were there, because artefacts do not obey Kepler's third law.

But the sceptics were not merely obstructive, and in one specific case an instrumental artefact produced a correct-seeming argument against Copernicus that survived for two centuries. Stars, viewed by eye, appear as small discs about one to two arcminutes across. They are not discs — stars are far too distant to resolve — but the eye produces them, and early telescopes shrank them without eliminating them. **Tycho Brahe built an argument on this, and it was a good argument.** If the Earth orbits the Sun, nearby stars must show annual parallax; he could measure to about 1 arcminute and saw none, so the stars must lie beyond about 3,438 AU. But a star showing a 1-arcminute disc at that distance would be

$$\frac{60}{206265} \times 3438\ \text{AU} = 1.0\ \text{AU across} $$

— roughly a hundred times the diameter of the Sun, and as wide as the Earth's entire orbit, and every star would have to be like this. Tycho judged that absurd and rejected Copernicus on the evidence: reasoning correctly, from a real measurement, to a false conclusion, because one of his inputs was an artefact of the detector. The telescope helped and did not solve it. Shrink the discs to 3 arcseconds and push the parallax limit to 10 arcseconds, and a star comes out at about **0.30 AU across — thirty-two times the Sun.** Still uncomfortable. The objection persisted in weakened form until **Airy** showed in 1835 that the apparent discs are diffraction patterns produced by the aperture itself.

> An artefact of an instrument generated a rational, evidence-based, and entirely wrong argument that outlived Galileo by two hundred years.

That is a much better lesson than "the sceptics were foolish." Trusting an instrument is not automatic and not free, and the failure mode is not stupidity but taking an instrumental signature for a property of the world. Every observational field has a version of this problem, and most have been caught by it at least once.

## Making a moving Earth physically possible

The telescopic discoveries removed pillars of the old cosmology but did not answer the objections that had blocked heliocentrism since antiquity, and those objections were **physical**, not astronomical. If the Earth moves: why does a dropped stone land at the tower's base rather than far to the west? Why are we not flung off, or left behind by the ground? Why is there no perpetual gale? These are usually presented as naïve. They are not, and the numbers show why.

| | Speed |
|---|---|
| Earth's equatorial rotation | 465 m/s = 1,674 km/h |
| Earth's orbital motion | 29.8 km/s = 107,220 km/h |

A hundred and seven thousand kilometres an hour. "We would surely notice" is a quantitatively serious objection at that speed, and it demanded a real answer.

Galileo's contribution was to recognise that **motion is shared.** A stone atop a tower is already moving with the tower and the Earth; released, it retains that motion and travels horizontally at the same rate as the tower's base, so it lands at the foot. There is no wind because the atmosphere moves with the Earth, and nothing is flung off because nothing is being left behind. This is the seed of **inertia**, and Galileo pushed it into a general principle with the **ship.** Shut yourself in a cabin below decks of a large ship, with flies, butterflies, a bowl of fish, and a bottle dripping into a vessel below. Observe while the ship is still; now have it move at any uniform speed. Nothing changes: the flies fly no harder toward the stern, a jump toward the rear carries no further than one toward the front, the drops fall straight into the vessel.

> Galilean relativity: uniform motion is undetectable from within the moving system. No experiment performed inside a uniformly moving laboratory reveals its motion.

That dissolves the whole class of objections at a stroke. We do not feel the Earth's motion because there is nothing to feel — not because the motion is small, but because uniform motion has no local mechanical signature at all.

There is a flaw, and it cost a great deal. Galileo's inertia was **circular:** he held that a body left to itself continues in uniform *circular* motion about the Earth's centre, since a straight line would carry it away from the Earth, which he thought impossible for a natural motion. Newton's first law is straight-line inertia, and the difference is not cosmetic. Under circular inertia a planet moving in a circle does what comes naturally and needs no explanation, so the question *what holds a planet in its orbit?* never arises. Under straight-line inertia any curved path is a departure from natural motion and therefore **demands a force** — precisely the question one must ask to reach universal gravitation. So Galileo made the moving Earth **physically permissible** without making it **necessary**, and showing that it *must* move required a theory of force still half a century away.

## The trial, without the cartoon

In 1616 the Congregation of the Index declared the heliocentric proposition erroneous, and Galileo was instructed not to hold or defend it. In 1632 he published the *Dialogue Concerning the Two Chief World Systems.* In 1633 he was tried, compelled to abjure, and placed under house arrest for the remaining nine years of his life. The standard reading is science versus superstition. The actual situation is more interesting, and considerably less flattering to everyone, Galileo included.

Be precise about what could and could not be demonstrated at the time. **No stellar parallax had been detected**, and Copernicanism requires it; its absence had to be explained by enormous stellar distances, which ran straight into the star-size objection — a live, quantitative argument *against* Copernicus from real measurements. **The phases of Venus were consistent with Tycho**, so the decisive observation had eliminated only Ptolemy. **There was no physics of a moving Earth**; Galileo had shown it permissible, not required. And — the part most accounts omit, and the most damaging — **Galileo's own decisive proof was wrong.** The *Dialogue* culminates in an argument that the tides demonstrate the Earth's motion: the daily rotation and the annual revolution combine so that a point on the surface alternately speeds up and slows down, sloshing the oceans back and forth. It is checkably wrong. **It predicts one high tide per day. There are two.** And it fails to explain why tides track the Moon — a correlation known to every sailor in Europe, which Galileo dismissed as occult nonsense unworthy of a natural philosopher.

> Galileo's flagship physical proof of the Earth's motion was worse than the explanation he ridiculed. He was right about the conclusion and wrong about his best argument for it.

The politics made a bad position fatal. Urban VIII had been Galileo's friend and patron, and had authorised the *Dialogue* on condition that it treat Copernicanism hypothetically and include the Pope's own argument — that God could produce the appearances by means beyond human comprehension, so no physical proof is ever conclusive. Galileo included it, in the closing pages, in the mouth of **Simplicio** — the slow-witted Aristotelian who is wrong about everything. Whether calculated or careless, it was catastrophic. The Papacy was politically fragile in the middle of the Thirty Years' War, Urban was under attack for insufficient zeal, and a former protégé appearing to make a fool of him in print was not survivable.

Strip away the personalities and something real remains, and it is not about religion. The genuine question was **who adjudicates claims about the natural world** — whether a claim that contradicts established authority can be settled by evidence alone, on the authority of the person who gathered it. That was not settled in 1633, and the answer now taken for granted was not obvious then. Galileo's position — that nature is the arbiter, that the book of the universe is written in the language of mathematics, and that observation outranks text — is the methodological commitment on which everything after rests. He was right about the method, right about the conclusion, and wrong about his own best argument, all at once, which is what actual scientific careers look like. The Church won the battle; the principle he defended became the method of modern science, and the moving Earth he was forced to deny is now simply known to be true.

## Pulling the thread

- The telescope was not Galileo's, and Harriot drew the Moon through one months before him and published nothing. What Galileo added was the decision to treat what he saw as **evidence about something**, to measure it, and to publish. Observation is not discovery — and he failed the same test himself in 1612–13, recording Neptune as a star.
- His telescopes gathered five to fifteen times the eye's light, reaching about magnitude 9 (resolving the Milky Way into stars) and perhaps 10–20 arcseconds of detail, through a field of view half the width of the Moon.
- Mountains on the Moon, measured at about 8.7 km from lit peaks beyond the terminator — correct to within a factor of two — and sunspots killed celestial immutability. Jupiter's moons killed the Earth as unique centre of motion and answered the objection that a moving Earth would lose its Moon; being naked-eye objects in principle, what the telescope supplied was contrast, not resolution.
- The phases of Venus are the decisive observation, and the argument is quantitative: apparent size varies by 6.2× and is anti-correlated with phase — full when smallest, crescent when largest. Ptolemy forbids it; Tycho reproduces it. So it eliminated one model of three, and refuting a theory is not establishing its rival.
- Believing an instrument is not free. Galileo earned it by terrestrial calibration, internal consistency and successful prediction — but an artefact, the spurious discs of stars, generated Tycho's star-size objection, a rational argument that required stars a hundred times the Sun's diameter and survived until Airy explained diffraction in 1835.
- The physical objections were quantitatively serious — the surface moves at 107,220 km/h — and Galileo dissolved them with shared motion and the ship: uniform motion is undetectable from within. But his inertia was circular, the error that hides the need for a force, so he made a moving Earth permissible, not necessary.
- And the trial: no parallax, a star-size argument running against him, phases consistent with Tycho, no physics of a moving Earth, and a tidal proof predicting one tide a day when there are two. The durable content is not science against religion but who adjudicates claims about nature — authority, or evidence.

## Further reading

{{book: John L. Heilbron | Galileo | 2010}} is the fullest modern life, exact about the science and unsparing about the man — good on why the evidence in 1633 was genuinely inconclusive and on how Galileo's own errors and abrasiveness shaped the trial, without lapsing into either hagiography or the science-versus-superstition cartoon. Galileo's own *Sidereus Nuncius* (1610) is short and thrilling and repays reading directly, as does the *Dialogue Concerning the Two Chief World Systems* (1632), which is witty, vivid, and combative — and whose fatal placement of the Pope's argument in Simplicio's mouth is worth seeing in context.

## Problems

*Data: $1\ \text{AU} = 1.496\times10^{8}$ km; $1\ \text{radian} = 206{,}265$ arcsec. Venus: $a = 0.7233$ AU, diameter 12,104 km. Moon: radius 1,738 km. Jupiter at opposition $\approx 4.2$ AU; Callisto's orbital radius $1.883\times10^{6}$ km. Dark-adapted pupil 6.5 mm; naked-eye limiting magnitude $\approx 6$; naked-eye resolution $\approx 1$ arcmin. Earth: equatorial radius 6,378 km, sidereal day 86,164 s, orbital period $3.156\times10^{7}$ s. Sun's diameter $1.392\times10^{6}$ km.*

The Venus calculation is the quantitative core of the set; the star-size argument is the honest complication that turns a real measurement into a wrong answer; the tidal argument is the one that corrects the standard story; and the final problem is open-ended.

### 1 — The man who looked first
**(a)** Harriot drew the Moon through a telescope in July 1609, months before Galileo, with a comparable instrument, and published nothing. State precisely what Galileo added that Harriot did not.
**(b)** Compare Harriot's lunar drawing with Galileo's treatment of the same object. What is the difference in *kind*, not quality?
**(c)** Name two other episodes with the same structure, and state the shared principle.
**(d)** In 1612–13 Galileo recorded Neptune as a fixed star, and noted on one occasion that it seemed to have moved. What does this tell you about whether the principle in (c) is a character trait or something else?

### 2 — The instrument, in numbers
**(a)** Compute the light-gathering advantage over the dark-adapted eye for apertures of 15, 20 and 25 mm, and convert each to magnitudes.
**(b)** Given a naked-eye limit of magnitude 6, what limiting magnitude could Galileo reach? Name one discovery this made possible.
**(c)** Compute the diffraction limit ($\theta \approx 1.22\lambda/D$, $\lambda = 550$ nm) for a 20 mm aperture, in arcseconds. Compare with the eye's 1 arcmin.
**(d)** Galileo's field of view was about 15 arcminutes. Express this in units of the Moon's angular diameter (31 arcmin) and describe what observing was actually like.
**(e)** Why did Galileo often *stop down* his objectives, reducing the aperture he had gone to the trouble of making?

### 3 — Venus, done properly
**(a)** Compute Venus's distance from Earth at inferior conjunction, greatest elongation and superior conjunction.
**(b)** Compute its angular diameter at each, in arcseconds, and give the ratio between the extremes.
**(c)** State what Ptolemy's model requires about Venus's position relative to Earth and Sun, and derive from that which phases are possible and which are forbidden.
**(d)** State the *joint* signature that discriminates the models — not just "phases," but the specific correlation. Why is the joint version much stronger?
**(e)** Compute the illuminated area ($\propto f \times d^2$) for the full, half and crescent configurations. Use the result to explain why nobody had noticed Venus's phases without a telescope.
**(f)** Explain why this observation does **not** establish that the Earth moves. Which model survives it, and what general principle does this illustrate?

### 4 — Why the moons were invisible
**(a)** Compute Callisto's maximum angular separation from Jupiter at opposition, in arcminutes.
**(b)** Given that the Galilean moons are magnitude 4.6–5.6 and the naked-eye limit is 6, and given your answer to (a), state the paradox.
**(c)** Jupiter is magnitude $-2.7$. Compute the brightness ratio between Jupiter and a magnitude 5.6 moon.
**(d)** Resolve the paradox: what did the telescope actually supply here, and why does magnification help?
**(e)** Jupiter's moons answered a specific anti-Copernican objection. State it and explain why the observation settles it.

### 5 — Measuring a mountain
**(a)** Derive $h \approx d^2/2R$ for a peak illuminated a projected distance $d$ beyond the terminator on a sphere of radius $R$. State the approximation you make.
**(b)** Galileo reported lit points up to $1/20$ of the Moon's diameter beyond the terminator. Compute $d$ and then $h$.
**(c)** Compare with his published figure (about four miles) and with the true maximum lunar elevation (10.8 km).
**(d)** Explain why this measurement, rather than the drawing, is what made the lunar observation persuasive.

### 6 — The objection that was right
**(a)** Tycho could measure positions to about 1 arcmin and detected no stellar parallax. Compute the minimum stellar distance this implies, in AU.
**(b)** Bright stars appear to the naked eye as discs about 1 arcmin across. Compute the physical diameter such a star would have at the distance from (a), in AU and in solar diameters.
**(c)** State Tycho's conclusion and explain why his reasoning was sound.
**(d)** Early telescopes reduced the apparent discs to about 3 arcsec and pushed the parallax limit to about 10 arcsec. Recompute the implied stellar diameter. Did the telescope solve the problem?
**(e)** What are the discs actually caused by, and when was this established?
**(f)** State the general lesson about instruments in one sentence. Why is it a better lesson than "the sceptics were foolish"?

### 7 — Shared motion
**(a)** Compute Earth's equatorial rotation speed and orbital speed, in m/s and km/h.
**(b)** Using your answers, assess the objection "if the Earth moved we would surely notice." Is it naïve?
**(c)** State Galileo's ship thought experiment and the principle it establishes.
**(d)** Explain how the principle dissolves the falling-stone objection. Be precise about what the stone retains.
**(e)** Galileo's inertia was **circular.** State Newton's version, and explain why the difference is not cosmetic — what question does circular inertia prevent you from asking?
**(f)** Summarise, in one sentence, what Galileo established about the moving Earth and what he did not.

### 8 — The argument that failed
**(a)** State Galileo's tidal argument for the Earth's motion.
**(b)** How many high tides per day does it predict? How many are there?
**(c)** What correlation did Galileo dismiss, and on what grounds?
**(d)** List the four elements of the evidential position in 1633 and state, honestly, whether a well-informed and impartial observer of the time should have been convinced.
**(e)** Explain why including this material strengthens rather than weakens the case for Galileo's importance.

### 9 — Open problem: what was the trial about?
**(a)** State the "science versus superstition" reading and give two specific reasons it is inadequate.
**(b)** State the reading that survives scrutiny. What was genuinely at stake?
**(c)** The methodological principle Galileo defended is now universally accepted. Was it obviously correct in 1633? Argue both sides, using the star-size objection.
**(d)** Construct the strongest possible defence of the Church's procedural position in 1633 — not its conclusion, but its process. Then state where it fails.
**(e)** Galileo was right about the method, right about the conclusion, and wrong about his own best argument. What does that combination suggest about how we should evaluate scientists, as opposed to evaluating claims?

## Worked answers

### 1 — The man who looked first

**(a)** Galileo interpreted, measured, argued, published and defended; Harriot recorded. Specifically, Galileo identified a *cause* for what he saw (sunrise over mountains), extracted a *quantitative* result from it (a mountain height), assembled the observations into an *argument* about the structure of the cosmos, published it rapidly in Latin for a Europe-wide readership, and spent thirty years defending the conclusions. Harriot did none of those things — not from incapacity, but because he did not treat the observations as evidence *for* anything.

**(b)** Harriot's drawing is a **record of an appearance:** this is what the Moon looked like through the tube. Galileo's is a **model of a surface:** this is a landscape, lit from a particular direction, with relief that explains why the boundary is ragged and why isolated points glow in the darkness. The difference in kind is that the second is falsifiable and generative. It predicts that the bright points will merge with the lit region as the Sun rises further, that the terminator's roughness will vary with libration, and that the heights can be measured. A drawing predicts nothing.

**(c)** Uranus was catalogued as a star at least twenty-two times before Herschel, including by the first Astronomer Royal as "34 Tauri." Neptune was drawn by Galileo in 1612–13 and recorded as a fixed star. The principle: **observation is not discovery.** A correct measurement, filed under the wrong category, is not knowledge. What must be added is the question that makes the data mean something, and that is a separate act.

**(d)** That it is a **discipline, not a trait.** Galileo demonstrated the distinction more clearly than anyone in the seventeenth century, and then failed at the identical task three years later — with the aggravating detail that he *noticed the anomaly* (the "star" appeared displaced) and did not pursue it. The uncomfortable implication is that being the sort of person who has made a discovery does not protect you from missing the next one. Whatever Galileo did right in 1610 was an act performed on that occasion, not a property he possessed. The failure mode is not stupidity and cannot be avoided by being clever.

### 2 — The instrument, in numbers

**(a)** Gain $= (D/6.5)^2$; magnitudes $= 2.5\log_{10}(\text{gain})$:

| Aperture | Gain | Magnitudes |
|---|---|---|
| 15 mm | 5.3× | 1.8 |
| 20 mm | 9.5× | 2.4 |
| 25 mm | 14.8× | 2.9 |

**(b)** About **magnitude 8.5–9.** This made possible the resolution of the Milky Way into individual stars — an observation whose implication, that the universe contains vastly more than is visible, mattered immediately for the parallax problem.

**(c)** $\theta = 1.22 \times 550\times10^{-9}/0.020 = 3.36\times10^{-5}$ rad $= 6.9$ arcsec, about nine times finer than the eye's 60 arcsec. In practice his lenses were nowhere near diffraction-limited — aberrations probably left him around 10–20 arcsec — but even that is a factor of three to six.

**(d)** $15/31 = 0.48$ — less than half the Moon's diameter. Observing meant scanning a hand-held tube across a target in small overlapping patches, with no view of the whole, at high magnification, with every tremor amplified. Building a coherent map of the lunar surface under those conditions is a substantial achievement in itself, and finding four moving points near Jupiter and tracking them nightly for weeks is more so.

**(e)** Because his glass was not good enough to use at full aperture. Seventeenth-century lens grinding produced surfaces with significant figure errors, and the glass itself contained bubbles and striae; both spherical aberration and the effect of surface irregularity are worst at the edge of the lens, so masking the outer zone removed the worst-performing part of the optic. The trade is real and deliberate: he gave up light and resolution to gain image quality. A sharp faint image beats a bright blurred one when the question is whether something is a disc or a point — which was precisely the question at issue for the stars and for Jupiter.

### 3 — Venus, done properly

**(a)** Inferior conjunction: $1 - 0.7233 = 0.2767$ AU. Greatest elongation: $\sqrt{1-0.7233^2} = 0.6905$ AU. Superior conjunction: $1 + 0.7233 = 1.7233$ AU.

**(b)** $\theta = (12{,}104/d) \times 206265$ arcsec with $d$ in km:

| | Angular diameter |
|---|---|
| Inferior conjunction | 60.3″ |
| Greatest elongation | 24.2″ |
| Superior conjunction | 9.7″ |

Ratio of extremes: $1.7233/0.2767 = 6.23$.

**(c)** Ptolemy fixes the centre of Venus's epicycle on the Earth–Sun line, which is what constrains Venus to stay within about 46° of the Sun in the sky. The geometric consequence is that **Venus is always between the Earth and the Sun.** It is therefore always viewed from a direction close to its unlit hemisphere. Possible: new and crescent. Forbidden: gibbous and full. The forbidding is not approximate — it follows directly from the constraint that makes the model work at all, so it cannot be patched without breaking the elongation limit.

**(d)** The joint signature: **apparent size and phase are anti-correlated.** Venus is full when smallest (9.7″, behind the Sun) and a thin crescent when largest (60.3″, between us and the Sun). It is stronger because it is not one observation but a *correlation between two independently measurable quantities.* A single anomalous phase observation could be blamed on the instrument, on atmospheric distortion, or on an artefact of the tiny field of view. A systematic relationship between phase and diameter, tracked over a full cycle, cannot: it requires a specific three-dimensional geometry, and it is precisely the geometry Ptolemy forbids. Correlations are much harder to fake than measurements.

**(e)** Illuminated area $\propto f \times \theta^2$:

| | $f$ | $\theta$ | Area (arb.) |
|---|---|---|---|
| Full | 1.00 | 9.7″ | 94 |
| Half | 0.50 | 24.2″ | 292 |
| Crescent | 0.10 | 47.7″ | 227 |

The two factors very nearly cancel: as Venus approaches it grows but shows less of its lit face. Diameter varies by about six times while illuminated area varies by only about three, so brightness varies by roughly a magnitude — noticeable, but easily attributed to distance alone. There was no naked-eye signal to notice; Venus's phases were not overlooked through carelessness, they were genuinely invisible.

**(f)** Because **Tycho's system reproduces every one of these observations.** In it, Venus orbits the Sun (so it passes behind, showing full phases at maximum distance) while the Sun orbits a stationary Earth; the Earth–Venus geometry is identical, so the phases and the size variation are identical. Surviving models after 1610: Copernicus and Tycho. Eliminated: Ptolemy. The principle: **refuting a theory is not establishing its rival.** Evidence against one hypothesis supports the others only in proportion to how few remain and how well they were specified in advance — and here two remained, observationally indistinguishable. The tie required a different *kind* of argument, namely physics, not more of the same kind.

### 4 — Why the moons were invisible

**(a)** $\theta = 1.883\times10^{6}/(4.2 \times 1.496\times10^{8}) = 3.00\times10^{-3}$ rad $= 618″ = 10.3$ arcmin.

**(b)** The moons are brighter than the naked-eye limit (4.6–5.6 against 6) and ten times further from Jupiter than the eye can resolve (10.3 arcmin against 1 arcmin). By both criteria they should be plainly visible without any instrument — and for the whole of human history nobody saw them.

**(c)** $\Delta m = 5.6 - (-2.7) = 8.3$; ratio $= 10^{0.4 \times 8.3} = 2{,}089$ — Jupiter is about two thousand times brighter.

**(d)** **Contrast, not resolution or sensitivity.** Jupiter's light is scattered by the atmosphere and by the eye's own optics into a bright halo extending well beyond the planet's disc; the moons lie inside that halo and are lost in it, exactly as a candle beside a floodlight is invisible although well above the eye's absolute threshold. Magnification increases the angular separation between Jupiter and its moons while the halo's angular scale is set largely by the optics rather than the source, carrying the moons out of the glare. The general point recurs in modern astronomy: detecting a faint object next to a bright one is a different problem from detecting a faint object, solved by different means — coronagraphy, adaptive optics, nulling interferometry. Galileo's telescope was the first to solve a contrast problem.

**(e)** The objection: a moving Earth would leave the Moon behind. If the Earth is hurtling around the Sun, how does a satellite keep up? The Moon's continued presence was taken as evidence that the Earth is stationary. Jupiter's moons settle it because Jupiter is indisputably in motion under every model — Ptolemaic, Tychonic and Copernican alike — and it carries four satellites with it. Whatever mechanism allows Jupiter to keep its moons is available to a moving Earth, and the objection is refuted without needing to know what the mechanism is, which makes it a particularly clean piece of argument.

### 5 — Measuring a mountain

**(a)** Take a sphere of radius $R$ with the terminator at the point where the Sun's rays are tangent. A peak of height $h$ located a distance $d$ along the tangent line beyond that point is just reached by the grazing ray, so by Pythagoras on the right triangle with legs $R$ and $d$ and hypotenuse $R+h$:

$$(R+h)^2 = R^2 + d^2 \quad\Rightarrow\quad 2Rh + h^2 = d^2 \quad\Rightarrow\quad h \approx \frac{d^2}{2R}.$$

The approximation is $h \ll R$, allowing $h^2$ to be dropped. Here $h/R \sim 0.005$, so the error is negligible. (A second approximation is that the *projected* distance seen from Earth equals the true tangential distance, which requires the region to be near the centre of the disc.)

**(b)** $d = 3476/20 = 173.8$ km; $h = (173.8)^2/(2 \times 1738) = 30{,}206/3476 = 8.7$ km.

**(c)** Galileo published about four miles, or 6.4 km; this calculation gives 8.7 km; the true maximum lunar elevation is 10.8 km. All three agree within a factor of two, and Galileo's is low by about 40% — entirely accounted for by the difficulty of judging the projected distance through a 15-arcminute field.

**(d)** Because a drawing can be disputed as an artefact of the instrument, and a number cannot be disputed the same way. A measurement has three properties a picture lacks: it is reproducible (anyone with a telescope can estimate the same distance and get a comparable answer); it is falsifiable (a wildly different value from another observer would be a problem); and it commits to a physical model — the calculation only makes sense if the bright points really are elevated terrain catching the sunrise, so a sensible answer is itself evidence for the interpretation. Producing a number that is not absurd is a test the mountain hypothesis could have failed: had the geometry implied peaks a thousand kilometres high, the interpretation would have been dead. It did not, and that is an argument.

### 6 — The objection that was right

**(a)** $d = 206265/p(″) = 206265/60 = 3{,}438$ AU.

**(b)** $1' = 60/206265 = 2.909\times10^{-4}$ rad. Physical diameter $= 2.909\times10^{-4} \times 3438 = 1.00$ AU. In solar diameters: $1.00 \times 1.496\times10^{8}/1.392\times10^{6} = 107$. Every star would have to be about a hundred times the Sun's diameter, and as wide as the Earth's entire orbit.

**(c)** Tycho concluded that Copernicanism required an absurdity, and rejected it. His reasoning was sound in every step: he had a real measurement (no detectable parallax) with a defensible precision, and a second real measurement (the apparent angular size of stars), and he combined them correctly. The conclusion — that the Copernican universe demands stars of preposterous size, so that the Sun would have to be a uniquely tiny star among giants — followed validly. He was doing exactly what a careful empiricist should do, and he got the wrong answer, because one of his inputs was an artefact.

**(d)** $3/206265 \times 20{,}626 = 0.30$ AU $= 32$ solar diameters. No, it did not solve it. Reducing the apparent discs by a factor of twenty and pushing the parallax limit by a factor of six leaves stars still an order of magnitude larger than the Sun — implausible, though no longer absurd. The objection was weakened, not removed, and it persisted as a live argument for two centuries.

**(e)** They are **diffraction patterns** — the Airy disc — produced by the finite aperture of the eye or the telescope, not by the star, whose true angular size is thousands of times smaller and utterly unresolvable. Established by George Airy in 1835.

**(f)** An instrument does not merely fail to show you things; it can show you things that are not there, and those artefacts can support rational, quantitative, entirely wrong arguments. It is a better lesson than "the sceptics were foolish" because the sceptics were not foolish — Tycho was the finest observational astronomer of the age, reasoning correctly from his own excellent data. If the failure mode were stupidity, it could be avoided by being clever; instead it is taking a signature of your instrument for a property of the world, and it is invisible from the inside. Every observational field has been caught by this, which is why calibration, independent instruments and cross-checks with different physics matter so much.

### 7 — Shared motion

**(a)** Rotation: $v = 2\pi(6378)/86164 = 0.465$ km/s $= 465$ m/s $= 1{,}674$ km/h. Orbit: $v = 2\pi(1.496\times10^{8})/3.156\times10^{7} = 29.8$ km/s $= 107{,}220$ km/h.

**(b)** Not naïve at all — it is quantitatively serious. At 107,220 km/h the expectation of *some* detectable consequence is entirely reasonable, and the burden was properly on the Copernicans to explain the absence. The objection is wrong, but it is wrong for a subtle reason that required a new principle of mechanics to articulate. Dismissing it as obvious foolishness requires knowing the answer in advance. A good objection is one that would be decisive if the physics were what everyone assumed — and here it was.

**(c)** Shut yourself below decks in a large ship with flying insects, a bowl of fish, and a bottle dripping into a vessel. Observe while at rest, then have the ship move uniformly at any speed. Nothing changes: drops fall straight into the vessel, insects fly no harder toward the stern, jumps carry equally far in both directions. **Galilean relativity: uniform motion is undetectable from within the moving system.** No experiment performed inside a uniformly moving laboratory reveals its motion.

**(d)** The stone retains the horizontal velocity it shared with the tower before release. It does not need to be pushed; there is nothing to slow it horizontally, so it keeps pace with the tower's base and lands there. The essential point is *what changes at release:* only the vertical support is removed, and the stone's horizontal state of motion is not affected by dropping it, because nothing acts horizontally. Aristotelian physics assumed a body left to itself comes to rest, so the stone would "stop" moving east and be left behind. Galileo's insight is that continuing is the default and stopping is what requires a cause.

**(e)** Newton's first law: a body continues in uniform motion in a straight line unless acted on by a force. Galileo held that natural inertial motion is *circular* about the Earth's centre. The difference is not cosmetic. Under circular inertia a planet moving in a circle is doing what comes naturally and needs no explanation — so the question *what holds a planet in its orbit?* does not arise. Under straight-line inertia any curved path is a departure from natural motion and therefore demands a force. That question is the one universal gravitation would answer, and circular inertia conceals the very problem whose solution is universal gravitation.

**(f)** Galileo made a moving Earth physically permissible; he did not make it necessary.

### 8 — The argument that failed

**(a)** That the Earth's daily rotation and annual revolution combine, so that a point on the surface is alternately moving with and against the orbital motion over the course of a day. The resulting periodic acceleration sloshes the oceans in their basins, producing tides — which Galileo took as a direct mechanical proof that the Earth moves in both ways.

**(b)** It predicts one high tide per day. There are two.

**(c)** He dismissed the well-known correlation of tides with the Moon's position — familiar to every sailor and tabulated for centuries — as occult nonsense: action at a distance with no mechanical contact, which he regarded as unworthy of a natural philosopher and akin to astrology. The irony is acute. The lunar correlation is the correct explanation, and Galileo rejected it on *methodological* grounds — the same grounds on which he was, elsewhere, entirely right. And the "occult" action at a distance he despised is exactly what universal gravitation would later vindicate.

**(d)** The four elements: no stellar parallax detected, as Copernicanism requires; the star-size objection turning that absence into a positive argument against Copernicus; the phases of Venus fully consistent with Tycho, so that the decisive observation eliminated only Ptolemy; and no physics of a moving Earth — permissibility, not necessity — with Galileo's own proposed proof demonstrably wrong. An impartial, well-informed observer in 1633 should *not* have been convinced. They should have concluded that Ptolemy was dead, that Copernicus and Tycho remained, that Copernicus was more elegant, and that the evidence did not yet decide between them. That is the correct assessment on the evidence available, and it is what most competent astronomers of the period actually held. The vindication came from new physics, not from anything on the table in 1633.

**(e)** Because the case for Galileo's importance does not rest on his having been right about everything, and pretending otherwise makes it fragile. If his significance depended on the tidal argument, a reader discovering it is wrong might reasonably discount the rest. His actual contributions — the telescopic evidence, the refutation of Ptolemy, Galilean relativity, and above all the methodological insistence that nature adjudicates — survive the failure of the tidal argument completely, because none of them depends on it. More importantly, including it demonstrates the very principle he was defending: a tradition that hides its heroes' errors is behaving exactly like the authority Galileo opposed. The honest version is both more accurate and more persuasive, and it gives a student a realistic model of what a great scientific career contains.

### 9 — Open problem: what was the trial about?

**(a)** The reading: rational evidence-based inquiry confronted dogmatic religious authority and was suppressed by it. Two reasons it fails. First, the evidence was genuinely inconclusive — no parallax had been observed, the star-size argument ran against Copernicus, the phases were consistent with Tycho, and Galileo's own proof was wrong; the trial was not evidence-versus-dogma because the evidence did not yet establish the conclusion. Second, the Church was not uniformly opposed to Copernicanism: it was widely taught as a calculational device, Jesuit astronomers at the Collegio Romano confirmed Galileo's telescopic observations and honoured him for them, the *Dialogue* was licensed, and Urban VIII had been a supporter and patron. The objection was to how the licence conditions were met, not to the subject.

**(b)** The genuine question was **who adjudicates claims about the natural world** — and specifically whether a claim that contradicts established authority can be settled by evidence alone, on the authority of whoever gathered it. That is a question about epistemic jurisdiction, and it is not about religion. Structurally the same conflict recurs whenever any institution — a state, a profession, a funding body, a journal — claims the right to determine what may be concluded. Galileo's position, that nature is the arbiter and observation outranks text, is the methodological commitment underlying everything after.

**(c)** Not obvious in 1633. **For:** the star-size objection is the decisive counter-example. Tycho reasoned impeccably from real measurements to a conclusion that was false, because one input was an artefact he had no way to detect; if evidence alone adjudicates, then in 1600 evidence alone said Copernicus was wrong. A principle that would have led a careful person to the wrong answer is not self-evidently correct, and Urban's argument — that no physical demonstration can be treated as final, since the appearances might be produced otherwise — was, in the specific circumstances, prudent rather than obscurantist. **Against:** the alternative is worse, and its failure mode is unbounded. Authority has no mechanism for self-correction, whereas the star-size objection was eventually overturned by better evidence, which is exactly how the principle is supposed to work. Evidence-based inquiry is not reliable in any single instance; it is reliable in the limit, because it contains the machinery to detect and correct its own errors, and authority contains no such machinery. The honest verdict: Galileo's principle was correct but not demonstrably correct in 1633, and its correctness is a claim about long-run convergence, not about any particular dispute. The evidence in 1633 was against him. He was right anyway. Both are true, and the second does not follow from the first.

**(d)** The strongest procedural defence: the *Dialogue* was submitted for licence, and a licence was granted on conditions — treat Copernicanism as a hypothesis rather than an established truth, and include the argument that appearances may be produced by means beyond human comprehension. These conditions were reasonable given that the question was, in fact, undecided; the licensing body was requiring a book to represent the evidential situation accurately. Galileo formally complied and substantively did not: the work argues throughout for the Copernican position and places the Pope's argument in the mouth of Simplicio, the character shown to be wrong about everything. A body that grants conditional permission and finds its conditions met in letter and inverted in spirit has a legitimate procedural grievance, quite independent of the astronomy, and there was a prior undertaking from 1616. **Where it fails:** the conditions themselves were illegitimate in kind, whatever their reasonableness in content. Requiring that a conclusion be framed hypothetically is a claim to authority over what may be concluded, not over how it may be argued, and no procedural propriety in enforcing such a condition can rescue the condition itself. The defence establishes that Galileo behaved badly within a system that should not have existed. A fair trial under an illegitimate jurisdiction is still an illegitimate trial.

**(e)** That claims and people must be evaluated separately, by different standards. A claim is assessed on the evidence and reasoning supporting it, and the character, motives and other opinions of whoever advanced it are irrelevant: Galileo's tidal argument is wrong on its own terms, and that he was right about heliocentrism does not improve it; Tycho's star-size argument is well-constructed, and that his cosmology was wrong does not damage it. A person is assessed on something else entirely — the quality and originality of their contributions, weighed against their failures — and a great scientist is not someone who is right about everything but someone whose best work is transformative. Galileo was right about the method, right about the conclusion, wrong about his own best argument, and unwise in his handling of a patron, all four at once, and the first is what matters. The practical warning runs both ways: do not accept a claim because of who made it, and do not dismiss a claim because of who made it. Neither authority nor its inverse is evidence, which is, in the end, exactly what the trial was about.$astroGA_master$,
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
  select $astroGA_quiz$[{"id": "q1", "type": "mcq", "prompt": "The telescope was not Galileo's invention, and Thomas Harriot drew the Moon through one on 26 July 1609, months before Galileo. Why is it still Galileo's revolution and not Harriot's?", "options": ["Harriot's telescope was far inferior, so his drawing was too crude to reveal the mountains that Galileo's finer optics showed.", "Harriot merely recorded an appearance and published nothing, whereas Galileo reasoned out a cause (sunrise over mountains), measured a mountain's height from the geometry, built the observations into an argument about the cosmos, and published it fast in the Sidereus Nuncius. Observation is not discovery; the added step is treating what you see as evidence about something.", "Harriot never looked at Jupiter or the Sun, so he missed the moons and the sunspots that made Galileo famous.", "Galileo was first to point a telescope at the sky, so priority is simply his by date."], "answerIndex": 1, "explanation": "Harriot's instruments were comparable to Galileo's, and he went on to observe Jupiter's satellites and sunspots too. The difference is not the optics and not priority of date. Harriot's July 1609 drawing is a record of an appearance; Galileo, months later, reasoned about what produced the ragged terminator and the points of light glowing in the darkness, measured a lunar mountain, argued from it, and published rapidly for all of learned Europe. The lesson, that observation is not discovery, recurs when Uranus was catalogued more than twenty times as a star before Herschel checked whether it moved in 1781 and, most sharply, when Galileo himself logged Neptune as a fixed star in 1612-13 and let the anomaly go."}, {"id": "q2", "type": "mcq", "prompt": "The Galilean moons are magnitude 4.6 to 5.6 (brighter than the naked-eye limit of 6) and reach about 10 arcminutes from Jupiter (far more than the eye's 1-arcminute resolution). So why had nobody ever seen them, and what did the telescope actually supply?", "options": ["The telescope supplied resolution: the eye cannot separate the moons from Jupiter until they are magnified.", "The telescope supplied sensitivity: the moons are just below the naked-eye brightness limit and only a light-gathering aperture can reach them.", "The moons are bright enough and far enough apart to be naked-eye objects in principle, but Jupiter is magnitude minus 2.7, about two thousand times brighter, and drowns them in its scattered-light halo. The telescope supplied contrast: magnification spreads the glare over a larger apparent area and lifts the moons clear of it.", "The moons only became bright enough to see after Galileo's era because their orbits have since evolved."], "answerIndex": 2, "explanation": "By both ordinary criteria, brightness and separation, the moons should be naked-eye objects, yet nobody saw them for all of human history. The reason is contrast, not resolution or sensitivity. Jupiter at magnitude minus 2.7 is roughly two thousand times brighter than a magnitude 5.6 moon, and its light, scattered by the air and by the eye's own optics, forms a halo that swallows the moons like a candle beside a floodlight. Magnification increases the angular separation between planet and moons while the halo's angular scale is set mostly by the optics, carrying the moons out of the glare. Detecting a faint object next to a bright one is a different problem from detecting a faint object, and Galileo's was the first instrument to solve a contrast problem."}, {"id": "q3", "type": "mcq", "prompt": "The phases of Venus are usually stated as: Venus shows phases, therefore it orbits the Sun. The chapter calls this too weak. What is the sharp, quantitative version of the argument, and what does it prove?", "options": ["Venus shows a full cycle of phases, which is impossible in any Earth-centred model, so the observation proves the full Copernican system directly.", "Venus's apparent size varies by a factor of 6.2 and is anti-correlated with phase: full when smallest (far, behind the Sun), a thin crescent when largest (near, between us and the Sun). The pure Ptolemaic model keeps Venus always between Earth and Sun and so forbids full or gibbous phases, so it is decisively refuted; but the same joint signature is reproduced exactly by Tycho's hybrid, so the phases refute Ptolemy without establishing that the Earth moves.", "Venus is brightest when full, which shows it must be on the far side of the Sun, ruling out both Ptolemy and Tycho at once.", "Venus never strays more than 46 degrees from the Sun, and only a moving Earth can produce that limit, so the elongation alone settles the question."], "answerIndex": 1, "explanation": "The decisive point is the joint signature: apparent size varies 6.2 times (about 9.7 arcsec full and behind the Sun, up to about 60.3 arcsec new and near) and runs opposite to the phase. Ptolemy pins Venus's epicycle on the Earth-Sun line to keep it near the Sun, which forces Venus always between us and the Sun and permits only new and crescent, never gibbous or full. Galileo saw a full Venus, so pure geocentrism is refuted. But Tycho's system, in which Venus orbits the Sun while the Sun orbits a stationary Earth, gives an identical Earth-Venus geometry and reproduces every one of these observations. So the phases eliminated one model of three and left Copernicus and Tycho tied. Refuting a theory is not the same as establishing its rival, and breaking that tie needed physics, not more positional data."}, {"id": "q4", "type": "mcq", "prompt": "Tycho Brahe argued against Copernicus from the apparent size of stars, and the chapter says it was a good argument that was nonetheless wrong. What was the argument, and why does it matter for how we think about instruments?", "options": ["Tycho argued that stars are too faint to show parallax, which was a religious prejudice dressed up as measurement and easily dismissed.", "Stars appear as discs about 1 arcmin across; with no detectable parallax the stars must lie beyond about 3,438 AU, at which distance a 1-arcmin disc implies a star about 1.0 AU wide, roughly a hundred solar diameters. Tycho reasoned correctly from real measurements to a false conclusion, because the discs are an instrumental artefact, diffraction patterns explained only by Airy in 1835. The lesson is that an artefact can support a rational, evidence-based, wrong argument.", "Tycho argued that the telescope shrinks stars to points, proving they are infinitely distant, which supported Copernicus rather than opposing him.", "Stars appear to twinkle, which Tycho took as proof the Earth is stationary, an argument disproved as soon as telescopes steadied the image."], "answerIndex": 1, "explanation": "The naked eye, and early telescopes, render stars as small discs of one to two arcminutes. No parallax to about 1 arcmin means the stars are at least roughly 3,438 AU away, and a 1-arcmin disc at that distance works out to about 1.0 AU across, some 107 solar diameters, and every star would have to be a giant with the Sun a uniquely tiny exception. Tycho judged this absurd and rejected Copernicus. His reasoning was valid and his data real; the flaw was that the discs are diffraction artefacts of the aperture, not the stars themselves, which George Airy explained only in 1835. The telescope helped but did not solve it, shrinking the implied size to about 0.30 AU or 32 solar diameters. The honest lesson is that trusting an instrument is not free: the failure mode is taking a signature of the instrument for a property of the world."}, {"id": "q5", "type": "mcq", "prompt": "Galileo answered the ancient objection that a moving Earth would produce a perpetual gale and leave dropped stones behind. What was his answer, and what was the flaw in the physics underneath it?", "options": ["He showed the Earth moves too slowly to notice; the flaw is that the orbital speed is actually about 107,220 km/h, which he underestimated.", "He argued that motion is shared, so everything on Earth keeps the Earth's motion by inertia and a smoothly moving Earth is undetectable from within (Galilean relativity, the ship in the sealed cabin). The flaw is that his inertia was circular rather than straight-line, which lets a planet circle with no force required and so conceals the very need for a force that leads to gravitation. He made a moving Earth permissible but not necessary.", "He proved by experiment that the Earth is at rest, then argued the appearances of motion are illusions; the flaw is that the experiments were faked.", "He appealed to the tides as proof that motion is shared; the flaw is that tides are actually caused by the Moon."], "answerIndex": 1, "explanation": "Galileo's insight was that motion is shared: a stone at the top of a tower already moves with the tower and the Earth, retains that horizontal motion when dropped, and lands at the foot, and the air moves with us so there is no wind. He generalised it with the ship thought experiment, where no experiment in a sealed cabin can reveal uniform motion, which is Galilean relativity, and it dissolves the whole class of objections: we feel no motion because uniform motion has no local signature, not because the motion is small. The flaw is that his inertia was circular about the Earth's centre, not straight-line. Under circular inertia a planet in a circle needs no cause, so the question of what holds it in orbit never arises; Newton's straight-line inertia makes any curve demand a force. Galileo thus made a moving Earth permissible, not necessary."}, {"id": "q6", "type": "open", "prompt": "Galileo measured the height of a lunar mountain from the geometry of a peak still lit beyond the terminator, obtaining about 8.7 km. Reconstruct the argument: the geometry and the approximation, the numbers, and, most importantly, why a measurement persuaded where Harriot's drawing did not.", "rubric": "THE GEOMETRY: model the Moon as a sphere of radius R with the terminator at the point where sunlight grazes tangentially. A peak of height h a projected distance d beyond the terminator is just caught by the grazing ray, forming a right triangle with legs R and d and hypotenuse R plus h, so (R plus h) squared equals R squared plus d squared. Expanding gives 2Rh plus h squared equals d squared, and dropping h squared (the approximation h much less than R, valid since h over R is about 0.005) yields h is about d squared over 2R. THE NUMBERS: Galileo reported lit points up to one twentieth of the Moon's diameter beyond the terminator, so with a diameter of 3,476 km, d is about 173.8 km (about 174 km); with R equal to 1,738 km, h is (173.8) squared over (2 times 1738), about 8.7 km. He published a figure of about four miles (6.4 km); the true maximum lunar elevation is 10.8 km. All three agree within a factor of two, the published value low by roughly 40 percent, explained by the difficulty of judging the projected distance through a field only 15 arcminutes wide. WHY THE MEASUREMENT PERSUADED: a drawing can be dismissed as an artefact of the glass; a number cannot be disputed the same way. A measurement is reproducible (another observer can estimate d and get a comparable h), falsifiable (a wildly different value would be a problem), and it commits to a physical model, since the arithmetic only makes sense if the bright points really are elevated terrain catching the dawn. Crucially, producing a value that is not absurd is a test the mountain hypothesis could have failed: had the geometry implied peaks a thousand kilometres high, the interpretation would have died. It did not, and getting a sensible number is itself evidence for the interpretation. A strong answer ties this to the Harriot comparison: measuring, not merely depicting, is what turned an appearance into evidence."}, {"id": "q7", "type": "open", "prompt": "The trial of 1633 is usually told as science against superstition. Explain why that cartoon is inadequate, including the honest state of the evidence and Galileo's own worst argument, and then state what the trial was really about and why that is Galileo's deepest legacy.", "rubric": "WHY THE CARTOON FAILS: the evidence in 1633 was genuinely incomplete, so it was not simply evidence versus dogma. Four points. (1) No stellar parallax had been detected, which Copernicanism requires, and its absence fed the star-size objection, a real quantitative argument against Copernicus (a 1-arcmin stellar disc with no parallax implied stars about 1.0 AU or roughly a hundred solar diameters across). (2) The phases of Venus were fully consistent with Tycho's hybrid, so the decisive observation had eliminated only Ptolemy and left two models tied. (3) There was no physics of a moving Earth; Galileo had shown it permissible, not necessary. (4) Galileo's own flagship proof, the tidal argument, was wrong: it predicts one high tide per day when there are two, and he dismissed the correct lunar correlation, known to every sailor, as occult nonsense. A strong answer notes that an impartial, well-informed observer in 1633 should not have been convinced, and that the Church was not uniformly anti-Copernican (Jesuit astronomers confirmed the observations; the Dialogue was licensed). THE POLITICS: Urban VIII had been Galileo's patron and licensed the Dialogue on condition it treat heliocentrism hypothetically and include the Pope's own argument; Galileo put that argument in the mouth of Simplicio, the simpleton, during the Thirty Years' War when the fragile papacy could not tolerate public humiliation. WHAT IT WAS REALLY ABOUT: strip away the personalities and the real question is who adjudicates claims about the natural world, and whether a claim contradicting established authority can be settled by evidence alone. It is a question of epistemic jurisdiction, not religion, and the same conflict recurs with any institution (state, profession, journal, funding body) claiming to decide what may be concluded. WHY IT IS THE DEEPEST LEGACY: individual discoveries are specific facts, and some of Galileo's specific claims were incomplete or wrong, but the method, that nature and evidence adjudicate rather than authority or text, is the engine that generates all future facts. A strong answer observes that Galileo was right about the method, right about the conclusion, and wrong about his best argument, all at once, which is what real scientific careers look like, and that the Church won the battle but the principle became the method of modern science."}]$astroGA_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/foundations/great-revolution/galileo', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
