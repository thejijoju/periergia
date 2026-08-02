-- Astronomy & Space · Stellar Physics — Star Birth —
-- "Protostars". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/star-birth/protostars @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Charles Lada's 1987 spectral-index classification of young stellar objects
-- and Philippe André's 1993 addition of Class 0, and why a one-parameter
-- scheme turned out to encode an evolutionary sequence nobody had built in;
-- why protostars are infrared-only objects, from Wien's law through IRAS
-- (1983) to JWST; accretion luminosity (L_acc = GM*Mdot/R, ~80 L_sun for a
-- solar-mass protostar against a 1 L_sun main-sequence future) and
-- Kelvin-Helmholtz contraction luminosity, with Kelvin's ~30 Myr recast as
-- correct physics for the wrong evolutionary stage; Chushiro Hayashi's 1961
-- convective-track result and the genuine forbidden region it implies,
-- contrasted with the merely brief Hertzsprung gap; deuterium ignition at
-- ~10^6 K, its role as a temporary thermostat, and the 13-Jupiter-mass
-- brown-dwarf boundary it sets; the protostellar luminosity problem and its
-- resolution through episodic accretion and FU Orionis outbursts; and the
-- population-counting method by which Class 0-III durations are measured
-- from source statistics rather than direct observation.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/star-birth/protostars',
    'research',
    'advanced',
    'read',
    $astroProtostars_master$> A protostar is not a small star: it is still gathering mass rather than fusing hydrogen, its light comes entirely from gravitational energy — through infall and through contraction — it shines more brightly than the star it will eventually become, and because it forms deep inside an opaque envelope of dust it is invisible to any optical telescope and radiates instead in the infrared, with no internal thermostat yet in place to regulate what happens to it next.

## A classification built on one number

In 1987, Charles Lada proposed a scheme for sorting young stellar objects that was almost aggressively empirical in its foundation. Take an object's spectral energy distribution — how much energy it emits at each wavelength — across the infrared, fit a straight line to it in log–log space between roughly 2 and 20 micrometres, and read off the slope. That slope is the spectral index:

$$\alpha = \frac{d\log(\lambda F_\lambda)}{d\log\lambda}$$

Sorting objects by $\alpha$ gives three classes:

| $\alpha$ | Class |
|---|---|
| $> 0.3$ | Class I — rising into the infrared |
| $-1.6 < \alpha < -0.3$ | Class II — flat or gently falling |
| $< -1.6$ | Class III — steeply falling, nearly stellar |

That was the entire scheme: a number extracted from a graph, with no model attached, no physical interpretation offered, and no assumption made about what the objects actually were. It was proposed at a time when the physical picture of protostellar evolution remained genuinely unsettled.

Six years later, Philippe André and colleagues added a fourth class at the beginning. Submillimetre surveys had turned up objects with no detectable near-infrared emission at all — objects so cold and so deeply buried that the spectral index could not even be measured within Lada's original window. These became Class 0.

### Why the scheme turned out to matter

The classification turned out to be an evolutionary sequence, and nobody had built that in at the outset.

| Class | Physical state | Age |
|---|---|---|
| 0 | Envelope more massive than the central object | < 10⁴ yr |
| I | Envelope comparable to the central object | ~10⁵ yr |
| II | Envelope gone; disk remains | ~10⁶ yr |
| III | Disk mostly cleared | ~10⁷ yr |

The slope of an infrared spectrum, it emerged, measures how much dusty material still surrounds an object — and that quantity decreases monotonically with age. A purely observational parameter, chosen because it could be measured easily, tracks the physical quantity that actually matters.

This is the fourth instance, across the history of astronomy, of an empirical classification preceding its explanation. Annie Jump Cannon's spectral sequence ordered stars by the smooth progression of their spectral features with no theory of stellar atmospheres behind it, and it has never needed revision. Daniel Kirkwood identified resonance gaps with Jupiter in the asteroid belt in 1867, with the underlying mechanism unavailable for 116 years. Johannes Kepler's three laws were exact and uncaused for seventy years before a physical reason for them was supplied.

A classification survives, in each of these cases, when it is overdetermined — when it is forced to satisfy more constraints than it had free parameters to fit. Lada's scheme is defined by a single number, which is ordinarily a warning sign: nothing about a one-parameter scheme can fail on its own terms, since almost any monotonic quantity will sort objects into some ordering or another. Rank a set of objects by height, by brightness, by arrival time in a catalogue — any of these produces a sequence, and a sequence by itself proves nothing about the physical world it was drawn from.

What rescues Lada's scheme is that the classes turned out to correlate with independently measurable properties that played no part in defining them: envelope mass, outflow strength, disk fraction, and the presence or absence of an optical counterpart. None of those quantities entered the original definition of $\alpha$, and none of them was guaranteed, in advance, to line up with it. A scheme built from one parameter earns the right to be believed only once it starts making successful predictions about quantities it was never fitted to — and Lada's scheme, examined against exactly that standard, could have failed and did not.

{{image: Young stellar object | A young stellar object still wrapped in its natal envelope: the slope of its infrared spectrum, chosen originally only because it could be measured, turned out to track the one property — how much circumstellar material remains — that actually defines its evolutionary age.}}

## Why protostars are infrared objects

A protostar sits at the centre of an infalling envelope of gas and dust. That dust is opaque at optical wavelengths — a Class 0 source can sit behind hundreds of magnitudes of visual extinction — so no light escapes directly. Instead the dust absorbs the central radiation, warms, and re-emits it in the far infrared at whatever temperature the envelope has reached.

By Wien's law,

$$\lambda_{\max} = \frac{2.898\times10^{-3}}{T}\ \text{m}$$

the peak wavelength moves with temperature:

| Temperature | Peak wavelength | Object |
|---|---|---|
| 30 K | 97 μm | Class 0 envelope |
| 100 K | 29 μm | Class I envelope |
| 1,500 K | 1.9 μm | dust destruction radius |
| 4,000 K | 0.72 μm | T Tauri photosphere |
| 5,772 K | 0.50 μm | the Sun |

A Class 0 source peaks at about 97 microns and emits essentially nothing in the visible band. To an optical telescope it does not exist; to a submillimetre telescope it is bright.

### The consequence for the field

Protostars were effectively undiscoverable before infrared astronomy existed. The subject became observational with IRAS in 1983 — the first all-sky infrared survey — and has advanced with each subsequent facility able to see further into the infrared and submillimetre: Spitzer, Herschel, the submillimetre and millimetre interferometer arrays including ALMA, and now JWST. Every major advance in the understanding of star formation since 1980 has followed an instrument capable of seeing at longer wavelengths, or with finer angular resolution at those wavelengths, than the one before it.

Each step added a different piece of the picture. IRAS supplied the first census, coarse in resolution but complete across the sky, and made it possible to know roughly how many protostars existed and where. Spitzer and Herschel pushed sensitivity and wavelength coverage further, resolving individual sources within crowded star-forming regions and mapping the cold dust that IRAS could only detect in bulk. ALMA, working at millimetre and submillimetre wavelengths with an array of dishes rather than a single mirror, resolved the disks and envelopes around individual protostars at scales of tens of astronomical units — fine enough to see structure within a single forming system rather than merely detect its existence. JWST, observing in the near and mid-infrared with far greater sensitivity and resolution than any predecessor, now reaches into the dust destruction radius itself and toward the youngest, most deeply embedded objects that earlier instruments could barely register at all.

A general point follows, one that recurs across the history of astronomy: the observability of a phenomenon is not a property of the phenomenon itself. Protostars have been forming continuously throughout the history of the galaxy, in enormous numbers, many of them only a few hundred parsecs away. They were invisible not because they are rare or intrinsically faint but because the atmosphere and the available detectors were transparent in the wrong band.

Two of the obstacles are physical rather than merely technological. Water vapour makes the Earth's atmosphere largely opaque across much of the infrared, blocking ground-based observation outright over large stretches of the spectrum. And a room-temperature telescope glows brightly at exactly the wavelengths a cold protostellar envelope emits at, so that the instrument itself becomes a stronger source of light than the target it is pointed at. Observing a 30 K object therefore requires getting above the atmosphere and cooling the instrument — which is why this branch of astronomy is, structurally, a space-telescope subject.

{{image: Infrared astronomy | An infrared-survey satellite operating above the atmosphere: water vapour blocks much of the infrared from the ground, and a warm telescope outshines a thirty-kelvin protostellar envelope at the very wavelengths where it needs to be observed.}}

## Powered by gravity

A protostar generates no nuclear energy and yet shines brightly. The luminosity comes from two distinct gravitational sources, and during the earliest phases one of them dominates completely.

### Accretion luminosity

Material falling from the envelope onto the protostellar surface arrives with kinetic energy $GMm/R$ per unit mass and is brought to rest. That energy is radiated:

$$L_{\text{acc}} = \frac{GM\dot{M}}{R}$$

For a typical Class 0/I accretion rate of $10^{-5}\ M_\odot$/yr:

| $M/M_\odot$ | $R/R_\odot$ | $L_{\text{acc}}/L_\odot$ |
|---|---|---|
| 0.1 | 2 | 16 |
| 0.5 | 3 | 52 |
| 1.0 | 4 | 79 |
| 2.0 | 4 | 157 |

A solar-mass protostar accreting at that rate radiates about eighty solar luminosities, while fusing nothing at all. Compare that with the star it will eventually become, which radiates one solar luminosity on the main sequence.

A protostar is, in other words, roughly fifty to eighty times more luminous during its assembly than it will be for the following ten billion years, and the entire output during that phase is gravitational. The most energetic phase of a low-mass star's existence therefore happens before it becomes a star at all, compressed into a few hundred thousand years rather than spread across ten billion.

Because $L_{\text{acc}} \propto M\dot{M}/R$, the accretion luminosity rises as the object simultaneously grows more massive and shrinks in radius. Accretion luminosity is self-amplifying during assembly, which is part of why the process becomes more violent as it proceeds.

### Contraction luminosity

Once the envelope is exhausted and accretion effectively stops, the object remains far larger than a main-sequence star of the same mass — a solar-mass protostar begins its post-accretion life at perhaps five to twenty solar radii — and continues to contract, converting gravitational potential energy into radiation.

This is the Kelvin–Helmholtz mechanism, with a characteristic timescale

$$t_{KH} \sim \frac{GM^2}{RL}$$

which for the Sun's present configuration gives roughly 30 million years — the figure Lord Kelvin computed and defended as an age for the Sun, and which was wrong as an age precisely because nuclear fusion, unknown to Kelvin, sustains the Sun over a far longer span than gravitational contraction alone could.

That same calculation is exactly right for a protostar, because a protostar genuinely has no other energy source available to it at this stage. Kelvin's physics was not incorrect; it was correct physics applied to the wrong stage of a star's life, and the timescale he defended for decades turns out to be the standard tool for the phase that precedes the one he believed himself to be describing.

{{image: Protostar | A protostar contracting under its own gravity: the Kelvin-Helmholtz timescale that gave the wrong age for the Sun is, applied to this earlier stage, exactly the right description, since gravitational contraction is genuinely the only energy source available before hydrogen fusion begins.}}

## The Hayashi track and a genuine forbidden region

### The claim

In 1961, Chushiro Hayashi showed that a fully convective star in hydrostatic equilibrium cannot have an effective temperature below a critical value — one that depends only weakly on mass.

| $M/M_\odot$ | Hayashi $T_{\text{eff}}$ |
|---|---|
| 0.1 | ~2,900 K |
| 0.3 | ~3,200 K |
| 1.0 | ~4,200 K |
| 3.0 | ~4,600 K |

To the right of this line — cooler than it, for any given luminosity — no star in hydrostatic equilibrium can exist.

### Why the limit holds

The argument links the stellar interior to its surface, and the reasoning explains why the limit is so insensitive to mass.

A young protostar is fully convective: it is cool and opaque enough that radiation alone cannot carry the flux outward, and the whole object overturns instead. Convection forces the interior temperature gradient to sit very close to the adiabatic value, which fixes the run of temperature with depth almost completely once the surface conditions are specified.

That interior has to match onto a photosphere, and in cool stellar atmospheres the dominant source of opacity is the H⁻ ion — a hydrogen atom carrying an extra, very weakly bound electron, with a binding energy of only 0.75 eV. The abundance of H⁻ depends steeply on temperature, because forming it requires free electrons, which themselves come from ionising the trace metals present in the gas.

The photospheric opacity is therefore ferociously temperature-sensitive. Attempt to build a star slightly cooler than the critical value and the opacity collapses, the photosphere retreats inward, and the effective temperature is pushed back up. The matching condition between interior and photosphere pins $T_{\text{eff}}$ within a narrow range regardless of the star's radius — and that insensitivity to radius is exactly what makes the evolutionary track vertical.

### A vertical track

A contracting protostar therefore moves straight down the Hertzsprung–Russell diagram at nearly constant temperature. For a solar-mass object sitting at 4,200 K, luminosity follows from

$$L = 4\pi R^2 \sigma T_{\text{eff}}^4$$

| $R/R_\odot$ | $L/L_\odot$ | $t_{KH}$ |
|---|---|---|
| 20 | 112 | 14,000 yr |
| 10 | 28 | 112,000 yr |
| 5 | 7.0 | 900,000 yr |
| 2 | 1.1 | 14 Myr |
| 1 | 0.3 | 112 Myr |

Two features stand out. The object dims by two orders of magnitude at nearly constant colour, dropping from 112 solar luminosities to below solar while its surface temperature barely shifts. And the descent decelerates: since $L \propto R^2$ along the track, $t_{KH} \propto 1/RL \propto R^{-3}$, so contraction slows dramatically as the star shrinks. Most of the pre-main-sequence lifetime is spent near the bottom of the track, which is why young clusters show many members close to the main sequence and comparatively few high up on the Hayashi track.

For masses above roughly 0.5 solar masses, the star eventually develops a radiative core, departs from the Hayashi track, and moves leftward at nearly constant luminosity along what is called a Henyey track before reaching the main sequence. Stars below that mass remain fully convective throughout and descend the Hayashi track all the way down.

The vertical geometry of the track is worth pausing on, because it is unusual among evolutionary paths on a Hertzsprung–Russell diagram. A star evolving off the main sequence, for instance, typically moves in both temperature and luminosity at once, tracing a diagonal or curved path as its internal structure reorganises. A pre-main-sequence star on the Hayashi track does something closer to a single-parameter contraction: luminosity falls by two orders of magnitude while temperature moves hardly at all, because the photospheric condition is doing essentially all of the work of fixing where the star sits in temperature, leaving radius — and hence luminosity — as the only quantity actually evolving. That is a direct observational signature: a real population of young stars, plotted on a colour–magnitude diagram, should show exactly this pattern, a near-vertical scatter of points at cool, red colours spanning a wide range of brightness, and it does.

### A genuine prohibition

The forbidden region deserves emphasis, because outright prohibitions are rare in this subject.

Most empty regions of a Hertzsprung–Russell diagram are empty simply because nothing spends much time there — a region such as the Hertzsprung gap is sparsely populated because stars cross it quickly, not because occupying it is impossible. That is a statement purely about durations.

The Hayashi forbidden region is different in kind. It is not that stars pass through it quickly; it is that no solution to the equations of stellar structure exists there at all. A star cooler than the Hayashi limit is not in hydrostatic equilibrium and cannot be constructed, at any age, under any circumstance. Sparseness on a Hertzsprung–Russell diagram can mean brevity or it can mean impossibility, and the diagram alone does not distinguish the two; only the underlying theory does.

{{image: Hayashi track | A pre-main-sequence evolutionary track descending nearly vertically at constant effective temperature: to its cool side lies a genuine forbidden region, where no solution to the equations of stellar structure exists, rather than a region merely crossed quickly.}}

## The first fire

Long before hydrogen ignites, something else does. Deuterium — hydrogen carrying an extra neutron — fuses at about $10^6$ K, roughly fifteen times cooler than the $1.5\times10^7$ K required for the proton–proton chain. A contracting protostar therefore reaches deuterium ignition first, at a radius several times larger than its eventual one.

The reaction is

$$^2\text{H} + {}^1\text{H} \to {}^3\text{He} + \gamma$$

and it is the second step of the proton–proton chain — the step that normally has to wait on an extremely slow first step, $p + p \to d + e^+ + \nu$, a weak interaction. Primordial deuterium, already present in the gas, skips that bottleneck entirely and starts from step two.

### A tiny fuel supply that matters disproportionately

The cosmic deuterium abundance is only about $2\times10^{-5}$ of hydrogen by number — one part in fifty thousand — so the total energy available is modest: about $1.5\times10^{40}$ J for a solar mass of material, enough to sustain roughly 10 solar luminosities for about 0.1 Myr.

That small reservoir nevertheless does three distinct things.

It switches on a thermostat. Until deuterium ignites, nothing regulates the contraction: the object has no energy source that responds to its own temperature, so it simply shrinks on the Kelvin–Helmholtz timescale. Deuterium burning supplies, briefly, a negative feedback loop of the same kind that later stabilises a main-sequence star — contraction raises the core temperature, the reaction rate rises steeply in response, the energy released halts further contraction, and the star pauses.

It enforces full convection. Deuterium burning is concentrated and temperature-sensitive enough to drive vigorous convective overturn, which mixes the entire object, bringing fresh deuterium from the outer layers down into the burning region and extending the phase well beyond what the central supply alone would sustain.

And it defines the boundary between a planet and a star. An object's core must reach roughly $10^6$ K to burn deuterium, and whether it does depends on its mass. The threshold sits at about 13 Jupiter masses, and that value is the International Astronomical Union's working definition of the lower limit of a brown dwarf — the line between an object that has, at some point, run a nuclear reaction and one that never has.

Jupiter itself falls short of deuterium burning by a factor of 13, and short of sustained hydrogen burning by a factor of 80. Those two thresholds — 13 Jupiter masses and 0.08 solar masses — bracket the brown dwarfs, and both are set at this protostellar stage, by whichever temperature a contracting object's core manages to reach before something halts the contraction.

## No thermostat yet

### The luminosity problem

Take the standard picture: accretion at $10^{-5}\ M_\odot$/yr onto a growing protostar should give $L_{\text{acc}} \approx 80\ L_\odot$, so surveys of young stellar objects should turn up Class I sources of roughly that luminosity.

They do not. Observed protostellar luminosities are typically one to ten solar luminosities — an order of magnitude or more below the prediction. This is the luminosity problem, recognised as soon as IRAS supplied a large enough sample to notice it.

The discrepancy can be restated as a timing problem. At $10^{-5}\ M_\odot$/yr, assembling a solar mass takes 100,000 years, consistent with the combined duration of the Class 0 and Class I phases inferred from source counts. But at the observed luminosities the implied accretion rate is roughly ten times lower, which would take a million years — inconsistent with those same class statistics. Either the objects are accreting faster than they appear to be, or the embedded classes last far longer than the population counts suggest.

### Episodic accretion

The favoured resolution is that accretion is not steady. Material instead piles up in the surrounding disk and is delivered to the star in short, violent bursts, separated by long quiescent intervals during which the object accretes slowly and looks comparatively faint.

The evidence is direct. FU Orionis objects are young stars observed to brighten by four to six magnitudes — factors of a hundred or more in luminosity — over months to years, and then remain bright for decades. The natural interpretation is a burst of accretion at rates approaching $10^{-4}\ M_\odot$/yr.

Since protostars are caught, most of the time, in the quiescent state, the time-averaged accretion rate can be high while the typically observed luminosity is low. The statistical structure is the same as the time-exposure argument used to infer class durations from source counts: what is actually observed is weighted by how long each state lasts.

### Why it happens

A main-sequence star is regulated by a thermostat: excess energy generation heats the core, the gas expands in response, the temperature falls, and the ferociously temperature-sensitive nuclear reaction rate collapses back down. That is negative feedback, and it produces a stable equilibrium.

A protostar has no such regulator. Its energy comes from accretion, and the accretion rate is set not by any condition inside the star but by conditions in the disk — by how quickly material can be transported inward through a structure whose physics is only loosely coupled to the star itself.

Worse, the coupling that does exist is plausibly positive rather than negative. A common picture has the inner disk accumulating material until it becomes gravitationally or thermally unstable, dumping that material rapidly, and then having to rebuild before the cycle can repeat — a relaxation oscillation rather than a stable equilibrium.

One candidate trigger is a thermal, or ionisation, instability confined to the innermost disk: as material slowly accumulates there, the disk heats, and once the temperature crosses the point at which hydrogen begins to ionise, the opacity of the gas rises steeply. Rising opacity traps heat rather than letting it escape, which raises the temperature further still, which raises the opacity further again — a runaway that dramatically increases how efficiently angular momentum is transported and dumps the accumulated reservoir onto the star in a burst, closely analogous to the outbursts seen in accreting white-dwarf binaries known as dwarf novae. A second candidate operates further out: a sufficiently massive outer disk can become gravitationally unstable in its own right, fragmenting into clumps that then migrate inward and are swallowed one at a time, each producing its own burst. Both pictures share the same essential shape — accumulation followed by rapid, self-reinforcing discharge — even though the trigger differs, and distinguishing between them observationally remains an active pursuit.

An object with no thermostat does not burn steadily; it stutters. That single idea connects to phenomena elsewhere in stellar physics: the helium flash, novae, and Type Ia supernovae all occur because degenerate matter has no thermostat of its own, since pressure in a degenerate gas is essentially independent of temperature, so heating fails to produce the expansion that would otherwise shut a runaway down. Episodic accretion is the same structural situation reached by a different route — not degeneracy, but the simple absence of any internal nuclear regulator at all. The main sequence is stable because a feedback loop exists there. A great deal of what happens before it, and some of what comes after, is unstable for exactly the same underlying reason: nothing closes the loop.

{{image: FU Orionis | An FU Orionis-type outburst: a young star brightening by four to six magnitudes over months as accretion from its disk surges toward roughly ten-to-the-minus-four solar masses per year, then fading back to quiescence over subsequent decades.}}

## Counting objects to measure time

One methodological point is worth making explicit, since it explains how the durations quoted throughout actually rest on evidence. Nobody has watched a single protostar evolve from Class 0 to Class III: the Class 0 phase alone lasts roughly $10^4$ years, far longer than any observing programme.

The durations are instead obtained by counting. If star formation in a region has proceeded at a roughly steady rate for long enough, the number of objects found in each class is proportional to the time spent in that class:

$$\frac{N(\text{Class }0)}{N(\text{Class II})} = \frac{t(\text{Class }0)}{t(\text{Class II})}$$

Anchoring the sequence to one independently known timescale — typically the Class II lifetime, obtained from the fraction of stars retaining disks as a function of cluster age — lets every other duration follow from a ratio of counts.

The anchor itself is worth explaining, since the whole chronology rests on it. Star clusters of known age, established from the position of their more massive members on a Hertzsprung–Russell diagram, can be surveyed for how many of their low-mass members still show the infrared excess characteristic of a surrounding disk. Plotting the disk-bearing fraction against cluster age gives a rough half-life for disk survival, of order a few million years, and that number sets the absolute scale for the Class II duration. Every other class duration in the table below is then obtained purely from the ratio of how many objects are observed in that class relative to Class II, multiplied by the anchored Class II lifetime — a chain of reasoning that converts a single external age calibration and a set of source counts into a complete timeline for the entire embedded phase of star formation.

| Class | Duration | Fraction of the pre-main-sequence phase |
|---|---|---|
| 0 | ~10⁴ yr | 0.08% |
| I | ~10⁵ yr | 0.8% |
| II | ~2 × 10⁶ yr | 16% |
| III | ~10⁷ yr | 83% |

This is exactly the same time-exposure argument that explains why roughly 90% of stars sit on the main sequence on a Hertzsprung–Russell diagram, since roughly 92% of a stellar lifetime is spent there: applied to protostars, it converts a simple census into a chronology.

It carries the same warning, too. The method requires a complete, unbiased sample, and Class 0 objects are the hardest of all to detect, being the coldest and most deeply embedded. A survey that misses a fraction of them will overestimate how brief the phase is — precisely the direction of error that would be self-confirming, since a survey that already believes the phase is brief has no internal signal telling it otherwise. This is exactly why the inferred numbers moved as instruments improved: IRAS could not detect Class 0 sources at all, and their discovery had to wait for dedicated submillimetre surveys.

## Pulling the thread

Charles Lada's 1987 classification sorted young stellar objects by the slope of their infrared spectrum — one number extracted from a graph, with no physical model attached. It turned out to trace an evolutionary sequence, because that slope measures how much dusty material still surrounds an object, and Class 0 was added in 1993 once submillimetre surveys turned up sources with no detectable near-infrared emission at all. It is the fourth empirical classification, after Cannon's spectral sequence, Kirkwood's gaps, and Kepler's laws, to precede its own explanation, and it survived because it correlated with properties nobody had used to define it.

A Class 0 protostar peaks at roughly 97 micrometres and emits almost nothing visible; protostars were effectively undiscoverable before infrared astronomy, and the field became observational with IRAS in 1983 — not because the objects are rare, but because detectors and atmosphere alike were transparent in the wrong band.

A protostar is powered entirely by gravity. Accretion at $10^{-5}\ M_\odot$/yr gives $L_{\text{acc}} = GM\dot{M}/R \approx 80\ L_\odot$ for a solar-mass object, fifty to eighty times brighter than the star it will become, while fusing nothing at all: the most energetic phase of a low-mass star's existence happens before it is a star. Contraction then proceeds on the Kelvin–Helmholtz timescale — Kelvin's calculation, wrong as an age for the Sun, and exactly right here, because a protostar genuinely has no other energy source.

The Hayashi track is vertical because full convection fixes the interior temperature gradient and steeply temperature-sensitive H⁻ opacity pins the photospheric temperature almost independently of radius. A protostar dims by two orders of magnitude at nearly constant colour, and the descent decelerates as $t_{KH} \propto R^{-3}$, so most of the pre-main-sequence lifetime is spent near the bottom of the track. To the cool side of that track lies a genuine forbidden region, where no solution to the structure equations exists at all — unlike the Hertzsprung gap, which is sparse only because the crossing there is fast. Sparseness on a Hertzsprung–Russell diagram can mean brevity or impossibility, and the diagram alone never distinguishes the two.

Deuterium ignites first, at $10^6$ K rather than $1.5\times10^7$ K. The fuel supply is tiny, one part in fifty thousand, but it briefly switches on a thermostat, enforces full convection, and sets the 13-Jupiter-mass boundary between a planet and a brown dwarf. The luminosity problem — observed protostars roughly ten times fainter than steady accretion predicts — resolves through episodic accretion: long quiescent intervals punctuated by FU Orionis bursts of four to six magnitudes. The underlying reason is structural: a protostar has no thermostat, because its energy comes from a disk whose behaviour is not regulated by anything happening inside the star. An object with no thermostat stutters.

And the durations themselves were measured by counting objects in each class — the time-exposure argument again, converting a census into a chronology, with the standing caveat that the hardest class to detect is exactly the one whose apparent brevity the method would otherwise confirm without warning.

The disposal of a collapsing core's angular momentum, addressed elsewhere in the account of star birth, leaves an open question that this survey of protostars has repeatedly gestured toward without resolving: if material that cannot fall directly onto the star has to go somewhere, where does it go, and what does it become? That question — of disks and the outflows launched from them — is the natural continuation of everything traced here, from an object still assembling itself out of infalling gas to the structures left orbiting once assembly is complete.

## Further reading

A detailed treatment of protostellar evolution, the classification of young stellar objects, and the physics of pre-main-sequence contraction is given in {{book: Steven W. Stahler and Francesco Palla | The Formation of Stars | 2004}}.

- **Steven W. Stahler and Francesco Palla, *The Formation of Stars* (2004).** A graduate-level treatment covering Hayashi's 1961 convective limit and the pre-main-sequence tracks that follow from it, the accretion and contraction luminosities that power a protostar before hydrogen ignition, deuterium burning and its role in setting the lower boundary of the brown dwarfs, and the observational classification of young stellar objects from Lada's 1987 spectral-index scheme through André's 1993 addition of Class 0.

## Problems

*Data: $G = 6.674\times10^{-11}$, $\sigma = 5.670\times10^{-8}$, $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, $L_\odot = 3.828\times10^{26}$ W, 1 yr = $3.156\times10^{7}$ s. Wien: $\lambda_{\max} = 2.898\times10^{-3}/T$ m. $L_{\text{acc}} = GM\dot{M}/R$; $t_{KH} \sim GM^2/RL$. Deuterium: D/H ≈ $2\times10^{-5}$ by number, ~5.5 MeV released per deuteron burned.*

### 1 — A classification with nothing behind it
**(a)** State what the spectral index $\alpha$ measures, and what physical quantity it turns out to track.
**(b)** Explain why Class 0 was added six years after the other three, and what instrumental development made it possible.
**(c)** Name three earlier examples of an empirical classification preceding its explanation.
**(d)** A classification defined by a single parameter is normally a warning sign. Explain why, and state what rescued Lada's scheme.
**(e)** Apply the overdetermination criterion: name three independently measurable properties that correlate with the classes but were not used in defining them.

### 2 — Why infrared
**(a)** Compute the peak wavelength for envelopes at 30 K and 100 K, and for a T Tauri photosphere at 4,000 K.
**(b)** Explain why a Class 0 source is invisible to an optical telescope but bright to a submillimetre one.
**(c)** State when this field became observational and name the instrument.
**(d)** Explain in what sense the observability of protostars is not a property of protostars.
**(e)** Two physical obstacles make ground-based observation at these wavelengths hard. Name both, and explain why the second is particularly awkward.

### 3 — Powered by gravity *(the central calculation)*
**(a)** Write the accretion luminosity and explain physically where the energy comes from.
**(b)** Compute $L_{\text{acc}}$ for $M = 1\,M_\odot$, $R = 4\,R_\odot$, $\dot{M} = 10^{-5}\,M_\odot$/yr.
**(c)** Compare with the main-sequence luminosity of the resulting star. State the conclusion in one sentence.
**(d)** $L_{\text{acc}} \propto M\dot{M}/R$. Explain why this makes accretion luminosity self-amplifying during assembly.
**(e)** Kelvin computed a solar lifetime of roughly 30 Myr from gravitational contraction, a figure long known to be wrong as an age for the Sun. Explain in what sense the same calculation is correct for a protostar.

### 4 — The Hayashi track
**(a)** State Hayashi's result and what it forbids.
**(b)** Explain the two-part argument: what does full convection fix, and what does H⁻ opacity fix?
**(c)** Explain why the resulting limit is nearly independent of radius, and hence why the track is vertical.
**(d)** For a 1 M☉ protostar at $T_{\text{eff}}$ = 4,200 K, compute $L$ at $R$ = 20, 5 and 1 $R_\odot$.
**(e)** Compute $t_{KH}$ at each radius in (d) and state what happens to the contraction rate. Where is most of the pre-main-sequence life spent?
**(f)** Distinguish the Hayashi forbidden region from the Hertzsprung gap. Why is the difference important, and what does it imply about reading a Hertzsprung–Russell diagram?

### 5 — The first fire
**(a)** State the ignition temperature of deuterium and compare with hydrogen. Explain why a contracting protostar reaches it first.
**(b)** Deuterium is $2\times10^{-5}$ of hydrogen by number. Estimate the total energy available in 1 M☉ and the duration at $L = 10\,L_\odot$.
**(c)** Despite being a tiny reservoir, deuterium burning matters. Give three reasons.
**(d)** State the deuterium-burning mass limit and explain what boundary it defines.
**(e)** Jupiter falls short of deuterium burning by a factor of 13 and of hydrogen burning by 80. Explain what occupies the range between, and why two different thresholds are needed to define it.

### 6 — The luminosity problem *(the conceptual core)*
**(a)** State the problem quantitatively: what does steady accretion predict, and what is observed?
**(b)** Restate it as a timing problem, using the class durations.
**(c)** State the favoured resolution and the observational evidence for it.
**(d)** Explain why a protostar has no thermostat, contrasting explicitly with a main-sequence star.
**(e)** Explain why the coupling between star and disk is plausibly positive feedback rather than negative, and what behaviour that produces.
**(f)** Name three other phenomena that occur because a system lacks a thermostat, and state what is different about the protostellar case.

### 7 — Counting objects to measure time
**(a)** The Class 0 phase lasts ~10⁴ years. Explain how its duration can be known when no observation programme is that long.
**(b)** State the assumption the method requires.
**(c)** Given the durations above, compute the expected ratio of Class II to Class 0 objects in a steady star-forming region.
**(d)** Class 0 sources are the hardest to detect. Explain why this is a particularly dangerous bias, and in which direction it acts.
**(e)** State the general statistical principle this method exemplifies, and give one other setting in which it is used to convert a census into a duration.

### 8 — Numerical
**(a)** A protostar has $M = 0.5\,M_\odot$, $R = 3\,R_\odot$ and $\dot{M} = 3\times10^{-6}\,M_\odot$/yr. Compute $L_{\text{acc}}$.
**(b)** Compute its Kelvin–Helmholtz time at that luminosity.
**(c)** Compare (b) with the time remaining to accrete another 0.5 M☉ at the given rate. Which process is limiting?
**(d)** The object undergoes an FU Orionis burst, brightening by 5 magnitudes. Compute the factor by which $L$ increases and the implied accretion rate.
**(e)** If bursts like this deliver most of the mass, estimate what fraction of the time the object must spend in outburst to average $10^{-5}\,M_\odot$/yr.

### 9 — Open problem: how does accretion actually work?
Episodic accretion is well established observationally, and its mechanism is not.
**(a)** State what must be explained: which quantities does a successful model need to predict?
**(b)** Give two candidate mechanisms for triggering an accretion burst, and one observational consequence that would distinguish them.
**(c)** Explain why observing a single object for a long time is not a practical route to the answer, and what must be done instead.
**(d)** Suppose episodic accretion turns out to deliver 90% of a star's mass. Name two consequences elsewhere in the study of star formation that would follow, and how.

## Worked answers

### 1 — A classification with nothing behind it

**(a)** $\alpha$ measures the slope of the infrared spectral energy distribution between roughly 2 and 20 μm — how the emitted energy is distributed across those wavelengths.

It tracks the amount of cool dusty material surrounding the object. A large envelope reprocesses the central luminosity into the far infrared, producing a rising SED; as the envelope disperses, more short-wavelength light escapes directly and the SED steepens downward. Since the envelope is depleted monotonically with time, $\alpha$ is a proxy for age.

**(b)** Because Class 0 objects have no detectable near-infrared emission at all — they are so cold and so deeply embedded that there is nothing to measure a 2–20 μm slope on. They fall outside the domain in which Lada's parameter is even defined.

The enabling development was submillimetre astronomy — instruments sensitive at hundreds of microns to a millimetre, where a 30 K envelope actually radiates. André's identification in 1993 followed the availability of submillimetre continuum surveys.

**(c)** Cannon's spectral sequence — OBAFGKM ordered by the smooth progression of spectral features, with no theory of stellar atmospheres, and never revised. Kirkwood's gaps — resonances with Jupiter identified in 1867, mechanism unavailable for 116 years. Kepler's three laws — exact and uncaused for seventy years.

**(d)** Because a single-parameter classification is not overdetermined: any monotonic quantity will sort objects into some ordering, and there is no way for the data to refuse the classification. The scheme cannot fail on its own evidence, which means agreement with it demonstrates nothing by itself.

What rescued Lada's scheme is that the classes turned out to correlate with quantities that played no part in defining them. The classification was defined by one number and then made predictions about many others — so it could have failed, and did not.

**(e)** Envelope mass, from submillimetre continuum observations, which decreases monotonically from Class 0 to Class III. Outflow strength, from CO line wings and jet detections, strongest in Class 0 and largely absent by Class III. Presence of an optical counterpart — Class 0 and I sources have none, Class II and III do.

*(Also creditable: disk fraction; the ratio of submillimetre to bolometric luminosity; and spatial association with dense gas.)*

### 2 — Why infrared

**(a)** $\lambda_{\max} = 2.898\times10^{-3}/T$: 30 K → 96.6 μm; 100 K → 29.0 μm; 4,000 K → 0.72 μm.

**(b)** Because the dust in the envelope is optically thick at visible wavelengths — hundreds of magnitudes of extinction — so no light escapes directly. The dust absorbs the central luminosity, warms to roughly 30 K, and re-emits it as a blackbody peaking at about 97 μm.

At 0.5 μm the emission from a 30 K body is smaller by an enormous factor, since the Wien tail falls exponentially, so an optical telescope sees nothing. At 850 μm the object is bright and the surrounding cloud is transparent, so a submillimetre telescope sees it clearly.

**(c)** 1983, with IRAS — the first all-sky infrared survey.

**(d)** Because protostars have been forming continuously throughout the galaxy's history, in enormous numbers, some of them only a few hundred parsecs away. They were not rare, not faint in absolute terms, and not distant.

They were invisible because detectors and atmosphere alike were transparent in the wrong band. Observability is a joint property of the object and the observing apparatus, and treating it as a property of the object alone leads to systematically wrong conclusions about what exists — the same kind of error made when dark, starless patches in the sky were once taken for literal holes in space rather than obscuring dust.

**(e)** Atmospheric opacity — water vapour absorbs strongly across much of the infrared, so large parts of the band are inaccessible from the ground at any altitude.

Thermal self-emission — a telescope at roughly 290 K radiates as a blackbody peaking near 10 μm, exactly where one wants to observe. The instrument is brighter than the target. This is more awkward than atmospheric absorption because it cannot be escaped by going higher or to a drier site; the telescope must be cooled, which is why infrared astronomy is a space-and-cryogenics discipline. JWST, for this reason, operates at around 40 K.

### 3 — Powered by gravity

**(a)** $L_{\text{acc}} = GM\dot{M}/R$. Material falling from far away onto the protostellar surface arrives with kinetic energy per unit mass approximately $GM/R$ and is brought to rest. That energy is thermalised at the surface and radiated away.

**(b)** $\dot{M} = 10^{-5} \times 1.989\times10^{30}/3.156\times10^{7} = 6.30\times10^{17}$ kg/s.

$L_{\text{acc}} = (6.674\times10^{-11})(1.989\times10^{30})(6.30\times10^{17})/(4 \times 6.957\times10^{8}) = 3.00\times10^{28}$ W $= 78\ L_\odot$

**(c)** The resulting star has $L = 1\,L_\odot$, so the protostar is about eighty times more luminous.

The most energetic phase of a low-mass star's life happens before it becomes a star, lasts a few hundred thousand years rather than ten billion, and is powered entirely by gravity.

**(d)** Because as the object accretes, $M$ increases and $R$ decreases — the protostar grows more massive and contracts toward its main-sequence radius simultaneously. Both changes raise $L_{\text{acc}}$.

So the same accretion rate produces steadily more luminosity as assembly proceeds, and the object becomes progressively more capable of disrupting its own envelope by radiation pressure. The process intensifies as it goes, which is part of why the terminal stages of assembly are violent and why radiation feedback limits the masses of the stars that can form.

**(e)** Kelvin's calculation asks how long gravitational contraction alone can sustain a given luminosity. For the Sun the answer, roughly 30 Myr, is wrong as an age, because the Sun has a nuclear source and has been shining for 4.57 Gyr.

But a protostar genuinely has no nuclear source. Contraction is its only energy supply, so the Kelvin–Helmholtz timescale is not an underestimate of anything — it is the actual duration of the contraction phase.

Kelvin's physics was correct, and it was applied to the wrong stage of a star's life. The calculation he defended for forty years is the standard tool for the phase that precedes the one he was attempting to describe.

### 4 — The Hayashi track

**(a)** That a fully convective star in hydrostatic equilibrium cannot have an effective temperature below a critical value, which depends only weakly on mass — from roughly 2,900 K at 0.1 M☉ to roughly 4,600 K at 3 M☉.

It forbids the region to the right of that line on the Hertzsprung–Russell diagram: no star in hydrostatic equilibrium can be cooler.

**(b)** Full convection fixes the interior temperature gradient to be very nearly adiabatic — convective mixing is efficient, so the structure is forced onto the adiabat and the run of temperature with depth is essentially determined.

H⁻ opacity fixes the photospheric temperature. In cool atmospheres the dominant opacity is the negative hydrogen ion, whose abundance depends steeply on temperature, since it requires free electrons supplied by ionising the metals. The photosphere is where the optical depth reaches roughly two-thirds, and because the opacity is so temperature-sensitive, that condition is met only within a narrow range of temperature.

**(c)** Because the photospheric condition is a constraint on temperature, essentially independent of where the surface happens to be. Change the radius and the interior adiabat shifts, but the matching to the photosphere still demands nearly the same $T_{\text{eff}}$ — the opacity's steepness means a small temperature departure produces a large change in optical depth, restoring the balance.

So as the star contracts, $R$ falls, $L = 4\pi R^2\sigma T^4$ falls, and $T_{\text{eff}}$ barely moves. The evolutionary path on the Hertzsprung–Russell diagram is therefore vertical.

**(d)** $L = 4\pi R^2\sigma T_{\text{eff}}^4/L_\odot$ at 4,200 K: $R = 20\,R_\odot$: 112 L☉; $R = 5$: 7.0 L☉; $R = 1$: 0.28 L☉.

**(e)** $t_{KH} = GM^2/RL$: $R = 20$: 14,000 yr; $R = 5$: 900,000 yr; $R = 1$: $1.1\times10^{8}$ yr.

Since $L \propto R^2$ on the track, $t_{KH} \propto 1/RL \propto R^{-3}$ — so the contraction decelerates dramatically as the star shrinks: a factor of 20 in radius gives a factor of 8,000 in timescale.

Most of the pre-main-sequence life is spent near the bottom of the track, close to the main sequence. This is directly observable: young clusters show most members low on their tracks and few high, which is the time-exposure argument again.

**(f)** The Hertzsprung gap is sparse because stars cross it quickly — a duration effect. Solutions to the structure equations exist there; stars simply do not linger.

The Hayashi forbidden region contains no solutions at all. A star cooler than the limit is not in hydrostatic equilibrium and cannot be constructed, at any age, in any circumstance.

The difference matters because the diagram alone cannot distinguish them. Both appear as regions with few or no stars, and only physical argument tells you whether you are looking at a fast transit or an impossibility. Reading emptiness as prohibition, or prohibition as brevity, are both available errors — and the correct interpretation determines whether it is worth going looking for objects that ought to be there.

### 5 — The first fire

**(a)** Deuterium ignites at roughly $10^6$ K, against $1.5\times10^7$ K for the proton–proton chain — about fifteen times cooler.

A protostar's central temperature rises steadily as it contracts, scaling roughly as $T \sim GM/R$, so it passes through $10^6$ K on the way to $10^7$ K. It therefore reaches deuterium ignition first, at a radius several times its eventual one, long before hydrogen can burn.

The reason deuterium is easier is that it skips the proton–proton chain's bottleneck: the first step, $p + p \to d + e^+ + \nu$, is a weak interaction and extraordinarily slow, whereas $d + p \to {}^3\text{He} + \gamma$ is electromagnetic and fast. Primordial deuterium starts at step two.

**(b)** $N_D = 2\times10^{-5} \times 0.71 \times M_\odot/m_H = 1.69\times10^{52}$ deuterons.

$E = 1.69\times10^{52} \times 5.5\times10^{6} \times 1.602\times10^{-19} = 1.5\times10^{40}$ J

At $10\,L_\odot = 3.83\times10^{27}$ W: $t = 3.9\times10^{12}$ s $= 0.12$ Myr

**(c)** It switches on a thermostat. Before ignition nothing regulates the contraction — there is no temperature-sensitive energy source, so the object simply shrinks on the Kelvin–Helmholtz timescale. Deuterium burning provides, briefly, the same kind of negative feedback that later stabilises a main-sequence star, and the contraction pauses.

It enforces full convection, mixing the whole object and delivering fresh deuterium from the outer layers to the core, which extends the burning phase well beyond what the central supply alone would sustain.

It defines the planet/brown dwarf boundary, discussed in (d).

**(d)** About 13 Jupiter masses — the minimum mass whose contracting core reaches $10^6$ K before degeneracy halts it.

It defines the lower limit of a brown dwarf, and hence the boundary between a planet and a star-like object, in the working definition of the International Astronomical Union. The criterion is whether the object has ever run a nuclear reaction.

**(e)** Brown dwarfs occupy the range from roughly 13 Jupiter masses to roughly 0.08 M☉ (about 80 Jupiter masses).

Two thresholds are needed because they mark different reactions with different ignition temperatures. Above 13 Jupiter masses an object burns deuterium — briefly, since the supply is one part in fifty thousand — and is therefore not a planet. Above 80 Jupiter masses it can burn hydrogen sustainably and is a star. Between the two it does one and not the other: it fuses something, exhausts it in a few million years, and then cools forever.

Brown dwarfs exist because the two ignition temperatures differ, and the class is defined by falling between them. A related pair of limits — the opacity limit for cloud fragmentation, near 0.01 M☉, and the hydrogen-burning limit at 0.08 M☉ — brackets, by an entirely separate line of argument, the same interval of objects that gravitational fragmentation can produce but nuclear fusion cannot ignite.

### 6 — The luminosity problem

**(a)** Steady accretion at $10^{-5}\,M_\odot$/yr predicts $L_{\text{acc}} \approx 80\,L_\odot$ for a forming solar-mass star. Observed Class I luminosities are typically 1–10 $L_\odot$ — low by an order of magnitude or more.

**(b)** At $10^{-5}\,M_\odot$/yr, assembling 1 M☉ takes $10^5$ yr, matching the Class 0 + I duration inferred from source counts. But the observed luminosities imply $\dot{M} \sim 10^{-6}\,M_\odot$/yr, which would take $10^6$ yr — ten times longer than the classes appear to last.

Either the objects accrete faster than they look, or the embedded phases last far longer than the counts suggest.

**(c)** Episodic accretion. Material accumulates in the disk and is delivered to the star in short violent bursts separated by long quiescent intervals, during which the object accretes slowly and appears faint.

Evidence: FU Orionis objects, young stars observed to brighten by 4–6 magnitudes over months to years and then remain bright for decades, implying accretion rates approaching $10^{-4}\,M_\odot$/yr. Since sources are observed mostly in quiescence, the time-averaged rate can be high while the typically observed luminosity is low.

**(d)** A main-sequence star's energy source is internal and steeply temperature-dependent: excess generation heats the core, the gas expands, the temperature falls, and the reaction rate collapses. The regulator is inside the star and responds to the star's own state.

A protostar's energy source is accretion, and the accretion rate is set by conditions in the disk — by how fast material can be transported inward through a structure whose own physics is only loosely coupled to the central object. Nothing about the star's temperature controls how fast material arrives. There is no loop to close.

**(e)** Because a plausible picture has material accumulating in the inner disk until it becomes unstable — gravitationally, or thermally through an ionisation instability — and then being dumped rapidly.

That is positive feedback: the instability, once triggered, accelerates the transport rather than damping it, and the burst continues until the reservoir is drained. The system then must rebuild before it can burst again.

The behaviour is a relaxation oscillation — long quiet accumulation punctuated by short violent discharge — rather than a stable equilibrium. Exactly the structure a system with positive feedback and a finite reservoir produces.

**(f)** The helium flash, novae, and Type Ia supernovae all occur because degenerate matter has no thermostat: pressure is independent of temperature, so heating does not produce expansion, and a thermonuclear runaway follows.

What is different here: the protostar's failure is not degeneracy. It has an ordinary equation of state and would expand if heated. The problem is that its energy source is external — it is being fed from outside, and no internal property regulates the feeding rate.

Two distinct routes lead to the same structural condition: in the degenerate case the feedback loop is broken at the pressure–temperature link; in the protostellar case the loop is never closed at all, because the energy generation is not a function of the star's state.

### 7 — Counting objects to measure time

**(a)** By counting objects in each class. In a region where star formation has proceeded steadily, the number of objects in a state is proportional to the time spent in it:

$$\frac{N_i}{N_j} = \frac{t_i}{t_j}$$

Anchor the sequence to one independently known timescale — usually the Class II lifetime, from the fraction of stars retaining disks as a function of cluster age — and every other duration follows from a ratio of counts.

**(b)** That the population is in a steady state and fairly sampled: star formation has continued at a roughly constant rate for at least as long as the longest phase being measured, and the survey detects objects in every class with comparable completeness.

**(c)** $t(\text{II})/t(0) = 2\times10^{6}/10^{4} = 200$. Two hundred Class II sources per Class 0 object.

**(d)** Because Class 0 sources are the coldest and most deeply embedded, so they are the hardest to detect — and an incomplete Class 0 census makes $N_0$ too small, which makes $t_0$ appear too short.

That is dangerous because it is self-confirming: the conclusion that the Class 0 phase is very brief would be supported by the very incompleteness that produced it, and there is no internal signal that anything is wrong. A survey missing half the Class 0 objects would report a duration half the true value with no indication of error.

The direction of the bias always makes the hardest-to-see phase look briefest, which is precisely the phase whose brevity one is trying to establish. The numbers did move as instruments improved — IRAS could not detect Class 0 sources at all.

**(e)** The general principle: in a steady-state population, the density of objects in a state measures the time spent in that state, provided the sample is complete. It converts a census into a chronology, and it fails exactly when the completeness varies between the states being compared.

The same argument explains why roughly 90% of stars lie on the main sequence of a Hertzsprung–Russell diagram — because roughly 92% of a stellar lifetime is spent there — while the sparse Hertzsprung gap is a fast phase rather than a forbidden one, illustrating the same time-exposure logic applied to a different population.

### 8 — Numerical

**(a)** $\dot{M} = 3\times10^{-6}(1.989\times10^{30})/(3.156\times10^{7}) = 1.89\times10^{17}$ kg/s.

$L_{\text{acc}} = (6.674\times10^{-11})(0.5)(1.989\times10^{30})(1.89\times10^{17})/(3 \times 6.957\times10^{8}) = 6.01\times10^{27}$ W $= 15.7\ L_\odot$

**(b)** $t_{KH} = GM^2/RL = (6.674\times10^{-11})(9.945\times10^{29})^2/[(3)(6.957\times10^{8})(6.01\times10^{27})] = 5.26\times10^{12}$ s $= 167{,}000$ yr

**(c)** Time to accrete another 0.5 M☉: $0.5/3\times10^{-6} = 167{,}000$ yr — the two are equal.

Neither process is limiting; they are concurrent and comparable. This is not a coincidence but a consequence of the object being in the accretion-dominated phase: while $\dot{M}$ is high, the accretion luminosity is what sets $t_{KH}$, so the contraction timescale is tied to the accretion timescale. The object contracts and grows on the same clock, and only when accretion ceases does it settle onto a pure Kelvin–Helmholtz descent.

**(d)** 5 magnitudes $= 10^{5/2.5} = 100\times$ in luminosity. Since $L_{\text{acc}} \propto \dot{M}$ at fixed $M$ and $R$, the implied rate is $3\times10^{-6} \times 100 = 3\times10^{-4}\,M_\odot$/yr.

**(e)** To average $10^{-5}$ with a burst rate of $3\times10^{-4}$, neglecting the quiescent contribution:

$$\text{duty cycle} = \frac{10^{-5}}{3\times10^{-4}} = 3.3\%$$

The object would spend about 3% of its time in outburst and 97% quiescent — which is exactly why observed protostars look underluminous: the sample is overwhelmingly drawn from the quiet phase. This is also why FU Orionis objects are rare while their contribution to the mass budget is large.

### 9 — Open problem: how does accretion actually work?

**(a)** A successful model must predict: the burst amplitude, a factor of roughly 100 in luminosity; the burst duration, decades; the recurrence interval, implied to be $10^3$–$10^4$ yr by the duty cycle; the fraction of total mass delivered in bursts versus quiescence; and how all of these depend on stellar mass and evolutionary stage, since a model that reproduces the solar-mass case and fails for others has not identified the mechanism.

**(b)** Thermal, or ionisation, instability in the inner disk. As material accumulates, the inner disk heats until hydrogen ionises; the opacity then rises steeply, trapping heat and raising the temperature further, which triggers a runaway increase in viscous transport. Analogous to dwarf nova outbursts.

Gravitational instability plus fragmentation in the outer disk. A massive disk becomes gravitationally unstable, forms clumps, and those clumps migrate inward and are accreted, each producing a burst.

Distinguishing observation: the two predict different burst locations and precursors. Gravitational instability requires a massive disk and should produce detectable clumps or spiral structure in high-resolution millimetre imaging before an outburst; the thermal instability requires only a modest inner disk and predicts no such large-scale structure. ALMA imaging of disks around FU Orionis objects and pre-outburst sources is the natural test.

*(Also creditable: perturbation by a binary companion on an eccentric orbit — distinguishable by predicting strictly periodic rather than quasi-random recurrence.)*

**(c)** Because the recurrence interval is $10^3$–$10^4$ years and the burst duration is decades. No observing programme spans a cycle, and the probability of catching a given object at the moment of outburst is the duty cycle, about 3%.

What must be done instead: survey many objects and treat the population statistically — measure the fraction in outburst, the distribution of luminosities, and the rate at which new outbursts appear across a large sample. This is the same move used to measure class durations: converting a census into a chronology, because the timescale exceeds the observation baseline.

A supplementary route: look for fossil evidence of past bursts in individual objects — chemical signatures in the surrounding envelope, since a burst heats the envelope and evaporates ices whose recondensation takes longer than the burst. That records outbursts that occurred before the object was observed.

**(d)** The luminosity problem would be fully resolved and the class timescales would need revision. If most mass arrives in bursts, the mean accretion rate inferred from typical luminosities is a severe underestimate, and the embedded phases are correspondingly shorter than the count-based durations suggest.

Protostellar evolutionary tracks — and hence pre-main-sequence ages — would be systematically wrong. A star that gained most of its mass in violent episodes has a different thermal history, radius, and position on the Hertzsprung–Russell diagram than one that accreted steadily. Since pre-main-sequence tracks are used to date young clusters and to convert luminosity functions into an initial mass function, the ages of young stars and the shape of the low-mass initial mass function both depend on getting this right.

*(A third: disk chemistry and planet formation. Episodic heating repeatedly moves the snow line outward and back, which would leave a signature in the composition of planetesimals.)*$astroProtostars_master$,
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
  select $astroProtostars_quiz$[{"id": "q1", "type": "mcq", "prompt": "Charles Lada's 1987 classification of young stellar objects sorted them purely by the slope of their infrared spectrum between about 2 and 20 micrometres, with no physical model attached at the time it was proposed. Why did this purely empirical number turn out to trace an evolutionary sequence?", "options": ["Because Lada quietly built envelope mass into the definition of the spectral index from the start, so the correlation with age was expected rather than discovered later", "Because the slope of the infrared spectrum measures how much dusty circumstellar material still surrounds an object, and that quantity decreases steadily as the object ages, so a number chosen only because it could be measured turned out to track the physical property that actually drives the sequence", "Because nearly all young stellar objects have identical infrared spectra, so any sorting scheme applied to them would automatically look like an evolutionary sequence regardless of what it measured", "Because the spectral index is mathematically identical to stellar mass, which is the only quantity that changes as a star assembles"], "answerIndex": 1, "explanation": "The spectral index was defined purely operationally, as the slope of a source's infrared spectral energy distribution fit in log-log space, with no assumption about what the objects were. It turned out that this slope is set by how much dusty envelope material still surrounds the central object: a massive envelope reprocesses light into the far infrared and produces a rising spectrum, while a dispersing envelope lets more short-wavelength light escape directly, steepening the spectrum downward. Because envelope mass falls steadily as a young stellar object ages, from Class zero through Class three, a parameter chosen for measurability alone ended up tracking age. That the classification later correlated with independently measured quantities such as envelope mass, outflow strength, and disk fraction, none of which were used to define it, is what confirmed it as a genuine evolutionary sequence rather than an arbitrary sorting."}, {"id": "q2", "type": "mcq", "prompt": "A Class 0 protostar can sit behind hundreds of magnitudes of visual extinction, invisible to any optical telescope, while it is one of the brightest objects in the sky at a wavelength near one hundred micrometres. What accounts for this pairing of optical invisibility and infrared brightness?", "options": ["The protostar itself has no optical light to emit in the first place, since gravitational contraction produces only infrared and radio radiation and never emits at shorter wavelengths under any circumstance", "The surrounding dust envelope is opaque at visible wavelengths, so no optical light escapes directly, but the dust absorbs the central luminosity, warms to roughly thirty kelvin, and re-radiates it as a blackbody whose emission peaks near one hundred micrometres by Wien's law, exactly where the source becomes bright", "Optical telescopes are simply less sensitive instruments than infrared telescopes, so the same amount of light is emitted at both wavelengths but only the infrared telescopes are capable of detecting it", "The protostar converts optical photons into infrared photons through a resonant scattering process in its outer atmosphere before they can escape the system"], "answerIndex": 1, "explanation": "A protostar sits inside an infalling envelope of gas and dust that is optically thick at visible wavelengths, so no light from the central object escapes directly outward. The dust instead absorbs that radiation, warms to a characteristic temperature of order thirty kelvin for a deeply embedded Class 0 source, and re-emits the absorbed energy as thermal blackbody radiation. By Wien's law, a thirty-kelvin blackbody peaks at about ninety-seven micrometres, deep in the far infrared, so essentially none of the reprocessed light appears at visible wavelengths while a large fraction appears in the infrared and submillimetre. This is why protostars were effectively undiscoverable before infrared astronomy existed, and why the field only became observational once instruments capable of seeing at these wavelengths, beginning with an all-sky infrared survey in 1983, became available."}, {"id": "q3", "type": "mcq", "prompt": "A solar-mass protostar accreting at a typical rate of ten to the negative fifth solar masses per year radiates roughly eighty solar luminosities, while fusing no hydrogen whatsoever, compared to the one solar luminosity the resulting star will produce for billions of years afterward on the main sequence. What powers this much larger output despite the absence of any nuclear reaction?", "options": ["Residual heat left over from the original molecular cloud out of which the protostar condensed, which has not yet had time to radiate away", "Gravitational energy released as infalling material strikes the protostellar surface and is brought to rest, converting its kinetic energy into radiated luminosity, combined with ongoing gravitational contraction of the object itself", "A brief early phase of hydrogen fusion that occurs before the star settles onto its stable main-sequence rate, then shuts off once the star reaches its final radius", "Tidal heating produced by a close binary companion star still embedded in the same collapsing cloud"], "answerIndex": 1, "explanation": "The accretion luminosity is given by the gravitational potential energy released per unit time as infalling material lands on the protostellar surface, L equals G times M times the accretion rate divided by R, and for a solar-mass object accreting at ten to the negative fifth solar masses per year with a radius of a few solar radii this evaluates to roughly eighty solar luminosities. Because this luminosity scales with mass times accretion rate divided by radius, and the protostar simultaneously grows more massive and shrinks in radius as it assembles, the luminosity is self-amplifying and becomes progressively larger during assembly. Once the envelope is exhausted, the protostar continues shining on a second gravitational source, slow contraction toward its main-sequence radius, described by the Kelvin-Helmholtz mechanism, until fusion eventually ignites at a far lower steady luminosity. The entire output during assembly is therefore gravitational, and it is the reason a protostar can be tens of times brighter than the very star it becomes."}, {"id": "q4", "type": "mcq", "prompt": "On a Hertzsprung-Russell diagram, both the Hertzsprung gap and the region to the cool side of the Hayashi track are sparsely populated with stars. Why is it wrong to treat these two empty regions as examples of the same underlying phenomenon?", "options": ["They are in fact the same phenomenon, since both regions are empty purely because stars cross them on a fast dynamical timescale before settling into a more stable configuration", "The Hertzsprung gap is empty because stars cross it quickly on their way between evolutionary stages, a statement about duration, whereas the region beyond the Hayashi track is empty because no solution to the equations of stellar structure exists there at all, a statement about impossibility rather than brevity", "The Hertzsprung gap is a genuine forbidden region while the Hayashi track boundary is merely a region that stars pass through unusually fast, the reverse of the standard description", "Neither region is actually empty; both appear sparse only because of observational selection effects that make faint evolved stars harder to detect than young ones"], "answerIndex": 1, "explanation": "A star is absent from the Hertzsprung gap chiefly because it crosses that region of the diagram on a short timescale compared to the time it spends elsewhere, so a solution to the structure equations exists there, stars simply do not linger. The Hayashi result is a different and stronger kind of statement: a fully convective star in hydrostatic equilibrium cannot have an effective temperature below a critical, only weakly mass-dependent value, because full convection fixes the interior temperature gradient near the adiabat while the steep temperature sensitivity of negative-hydrogen-ion opacity pins the photospheric temperature almost independently of radius. No star, at any age or under any circumstance, can exist in hydrostatic equilibrium cooler than that limit. Sparseness on a Hertzsprung-Russell diagram can therefore mean either brevity or genuine impossibility, and the diagram by itself cannot distinguish the two without an underlying theoretical argument for each specific region."}, {"id": "q5", "type": "mcq", "prompt": "Steady accretion at ten to the negative fifth solar masses per year predicts a protostellar luminosity of roughly eighty solar luminosities, yet observed young stellar objects typically show only one to ten solar luminosities. What is the favoured resolution of this luminosity problem, and why does it connect to the idea that a protostar lacks a thermostat?", "options": ["The discrepancy is resolved by episodic accretion: material accumulates in the surrounding disk and is delivered to the star in short violent bursts, evidenced by FU Orionis objects brightening by four to six magnitudes, separated by long quiescent intervals during which the typically observed luminosity is low, which is possible because the accretion rate is set by the disk rather than by any internal regulator responding to the star's own temperature", "The discrepancy is resolved because protostars are, on average, several times more massive than previously assumed, which lowers the accretion rate needed to match the observed luminosities", "The discrepancy is resolved by dust extinction alone, since the observed luminosities are simply the true eighty solar luminosities dimmed by circumstellar absorption before reaching the observer", "The discrepancy indicates that the accretion luminosity formula itself is wrong for protostars and needs to be replaced with a different expression that yields lower predicted values"], "answerIndex": 0, "explanation": "The favoured resolution is episodic accretion: rather than accreting steadily, a protostar spends most of its time in a quiescent state with a low accretion rate and correspondingly low luminosity, punctuated by short violent bursts during which the rate rises toward roughly ten to the negative fourth solar masses per year. FU Orionis objects, observed to brighten by four to six magnitudes over months and then remain bright for decades, are the direct evidence for such bursts. Because sources are caught mostly during their quiescent intervals, the time-averaged accretion rate can be much higher than the typically observed luminosity implies. This behavior is possible precisely because a protostar has no thermostat: a main-sequence star's energy generation responds to its own internal temperature through a stabilizing feedback loop, but a protostar's luminosity is set by the accretion rate, which is controlled by conditions in the disk rather than by anything happening inside the star, so nothing prevents the rate from swinging between quiescence and burst."}, {"id": "q6", "type": "open", "prompt": "Charles Lada's 1987 spectral-index scheme for young stellar objects is the fourth case, alongside stellar spectral classification, the identification of resonance gaps in the asteroid belt, and the three laws describing planetary orbits, in which an empirical classification preceded its physical explanation by years or decades. Explain the overdetermination criterion that distinguishes a classification scheme that deserves to be taken seriously from one that does not, and explain specifically why a classification defined by a single parameter is normally treated as a warning sign, and what rescued Lada's scheme despite that warning sign applying to it directly.", "rubric": "A strong answer explains that a classification survives scrutiny when it is overdetermined, meaning it is forced to satisfy more independent constraints than it had free parameters used to construct it, so that it could in principle have failed some of those constraints and did not. The answer should explain why a scheme built from a single parameter is ordinarily suspect: almost any monotonic quantity can be used to sort a set of objects into some ordering, so agreement between that ordering and the data proves very little by itself, since the classification cannot be falsified by the very data used to define it. The answer should then explain what rescues Lada's spectral-index scheme specifically: although it is defined by one number, the slope of an infrared spectral energy distribution between about two and twenty micrometres, the resulting classes turned out to correlate strongly with several independently measurable properties that played no role whatsoever in defining the classes, including envelope mass measured from submillimetre continuum observations, outflow strength measured from carbon monoxide line wings and jet detections, and the presence or absence of a detectable optical counterpart. Because the classification made testable predictions about these unrelated quantities and those predictions held up, the scheme passed a test it could have failed, which is precisely what overdetermination requires. A complete answer should note the parallel with three earlier cases of the same pattern: a stellar spectral sequence ordered by the smooth progression of spectral features with no theory of stellar atmospheres behind it and never subsequently revised, resonance gaps identified in 1867 whose underlying mechanism was not available for 116 years, and three laws of planetary motion that were exact and uncaused for seventy years, and should observe that in each case the classification's later correlation with unrelated, independently measured quantities is what separated genuine discovery from a data-fitting exercise with no explanatory content."}, {"id": "q7", "type": "open", "prompt": "Explain, referencing the specific physical mechanism involved, why a main-sequence star possesses an internal thermostat while a protostar does not, and explain how the absence of that thermostat produces the observed luminosity problem in protostars and connects, by a different mechanism, to phenomena such as the helium flash, novae, and Type Ia supernovae, which are also described as arising from systems that lack a thermostat.", "rubric": "A strong answer explains that a main-sequence star is stabilized by a negative feedback loop entirely internal to the star: if nuclear energy generation in the core rises, the gas heats, expands, and cools in response, which sharply reduces the strongly temperature-dependent nuclear reaction rate and restores balance, so that the star's own thermal state regulates its own energy output. The answer should then explain that a protostar has no equivalent loop, because its luminosity before hydrogen ignition comes from accretion rather than fusion, and the rate at which material is delivered from the surrounding disk is set by the physics of that disk, largely decoupled from the star's own temperature or internal state, so there is no internal variable that responds to and controls the energy input. The answer should connect this directly to the luminosity problem: steady accretion at a standard rate predicts roughly eighty solar luminosities for a forming solar-mass protostar, but observed luminosities are typically only one to ten solar luminosities, and the resolution is that accretion proceeds episodically, in short violent bursts evidenced by FU Orionis objects brightening four to six magnitudes and separated by long quiescent intervals, which is possible precisely because nothing internal to the star prevents such swings. A complete answer should also address why this connects to, yet differs from, the helium flash, novae, and Type Ia supernovae: in those cases the missing thermostat arises because the fuel is held up by electron-degenerate pressure, which is essentially independent of temperature, so that heating fails to produce the expansion that would otherwise throttle a runaway reaction, whereas in a protostar the gas is not degenerate at all and would respond normally to heating; the absence of regulation there instead arises because the energy source is external to the star altogether, being supplied by an accretion disk whose own instabilities, plausibly involving positive rather than negative feedback as material accumulates and is then dumped, drive the swings between quiescence and outburst. Both cases share the general structural description that an object with no active thermostat does not settle into steady behavior, but the specific broken or absent link in the feedback loop differs between the two."}]$astroProtostars_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/star-birth/protostars', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
