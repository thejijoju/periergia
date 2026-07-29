-- Astronomy & Space · Stellar Physics — The H–R Diagram —
-- "Spectral Types: Reading a Star's Light". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/hr-diagram/spectral-types @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The scrambled OBAFGKM alphabet, spectra and the Harvard classification, the sequence
-- as a thermometer, why Balmer lines peak in the middle, Payne's hydrogen result, the
-- luminosity dimension, brown dwarfs, and the magnitude-limited sample.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/hr-diagram/spectral-types',
    'research',
    'advanced',
    'read',
    $astroSpec_master$> The spectral sequence O B A F G K M is a thermometer wearing the labels of a discarded theory: the letters preserve an abandoned Harvard ordering by hydrogen-line strength, while the sequence preserves the correct ordering by surface temperature, and the two have nothing to do with each other. The central lesson is that a spectral line measures temperature, not composition — the strength of a feature reports which atoms happen to be in a state that can absorb, not how much of the element is present — and this single distinction, once drawn correctly by Cecilia Payne in 1925, inverted the accepted composition of the universe from rock to hydrogen. A second coordinate, read from the width of the lines, encodes a star's size, and the whole catalogue on which the science rests is a sample selected almost perfectly against the typical star.

## An alphabet that does not spell anything

The spectral sequence is **O B A F G K M**, running from hottest to coolest. Every astronomy student memorises it with a mnemonic, and almost nobody stops to ask the obvious question: **why is the alphabet scrambled?**

It is not a code, and it is not arbitrary. It is scar tissue from a discarded theory.

The original classification, developed at Harvard in the 1880s under **Edward Pickering** and executed largely by **Williamina Fleming**, sorted stars by the **strength of their hydrogen absorption lines** — strongest first. Class A had the strongest Balmer lines, B the next strongest, and so on down through the alphabet to Q. It was a sensible scheme, ordered by an observable quantity with no theoretical assumptions attached.

Then it fell apart. Several classes turned out to be duplicates or plate artefacts and were dropped. Others were found to be misordered. And when **Antonia Maury** and then **Annie Jump Cannon** reworked the scheme in the 1890s, it became clear that if the surviving classes were reordered by *something else*, all the other spectral features — the metal lines, the molecular bands, the ionised helium — fell into a smooth, continuous progression.

That something else was **temperature.** Reordered by it, the surviving classes ran O, B, A, F, G, K, M.

So the mnemonic everyone learns is a fossil of a mistake: the letters preserve an abandoned ordering by hydrogen line strength, and the sequence preserves the correct ordering by temperature, and the two orderings have nothing to do with each other.

{{image: Stellar classification | The spectral sequence O B A F G K M, from the hot blue O stars to the cool red M stars. The letters are non-alphabetical because they were assigned by hydrogen-line strength before the sequence was reordered by temperature; the ordering that survives is a thermometer, and the labels are the wreckage of the first attempt.}}

This distinction is the hinge of everything that follows. It turns on the question the Harvard classification could not answer for a quarter of a century: *if the sequence is temperature, why do the hydrogen lines peak in the middle of it?*

## What a spectrum is

Three facts, established between 1814 and 1860, are the foundation of everything that follows.

In **1814, Joseph von Fraunhofer** — a glassmaker improving optical instruments — dispersed sunlight through a prism and found the continuous rainbow interrupted by hundreds of **dark lines**. He catalogued 574 of them and labelled the strongest with letters, several of which are still in use. He did not know what they were.

In **1859–60, Gustav Kirchhoff and Robert Bunsen** established what they were, and formulated the rules:

1. A **hot dense** object emits a **continuous** spectrum.
2. A **hot diffuse gas** emits a **bright-line** (emission) spectrum, at wavelengths characteristic of its elements.
3. A **cool diffuse gas** in front of a continuous source produces **dark lines** at those same wavelengths.

Each element has its own fixed set of wavelengths — a fingerprint. So a stellar spectrum is a **continuum crossed by absorption lines**: the hot dense interior supplies the continuous rainbow, and the cooler outer layers, absorbing at their characteristic wavelengths, stamp the dark lines onto it. The dark lines in the solar spectrum identify the elements in the Sun's cooler outer layers, absorbing light from the hotter interior below.

{{image: Spectral line | A stellar spectrum: a continuous background from the hot dense interior, crossed by dark absorption lines where cooler overlying gas removes light at the fixed wavelengths characteristic of each element. Each set of lines is an elemental fingerprint, and their relative strengths encode the temperature of the layer that produced them.}}

This is a genuinely extraordinary result, and it is worth pausing on. In 1860 it became possible to determine the chemical composition of an object that no one could ever visit or sample. **Auguste Comte** had used the composition of the stars, thirty years earlier, as his standing example of knowledge forever beyond human reach. He was wrong within a generation, and wrong by a method nobody had anticipated.

The physical mechanism came later, with **Niels Bohr** in 1913: an electron bound in an atom can occupy only certain discrete energy levels, and it absorbs a photon only when that photon's energy exactly matches the gap between two of them. The line wavelengths are the level structure of the atom, written in light.

## Three hundred and fifty thousand stars

The classification that resulted was an industrial undertaking, and it is worth knowing how it was done.

Pickering's Harvard College Observatory produced the **Henry Draper Catalogue**, which eventually classified around **225,000 stars**, extended in supplements to over **350,000**. The work — examining photographic plates of spectra, one star at a time, and assigning a class — was carried out almost entirely by a group of women employed as **"computers"**, at wages of roughly 25 to 50 cents an hour.

**Williamina Fleming** devised the original alphabetical scheme and classified some 10,000 spectra. **Antonia Maury** developed a more detailed system that included a parameter for line *width*, which Pickering considered an unnecessary complication — and which turned out, decades later, to be the **luminosity** dimension. Hertzsprung, who needed exactly that information, described Maury's work as indispensable and Pickering's dismissal of it as a serious error. **Annie Jump Cannon** produced the final ordering and classified more spectra than anyone before or since — at a sustained rate of up to three stars per minute, by eye, from a photographic plate.

{{image: Annie Jump Cannon | Annie Jump Cannon, who produced the definitive ordering of the spectral sequence and classified more stellar spectra than anyone before or since, at up to three stars a minute by eye. The classification was purely empirical, with no theory of stellar atmospheres available, and the ordering she produced has never needed revision.}}

Two observations about this, and the second matters more.

The obvious one: the labour was systematically undervalued, and the names attached to the resulting system are largely Pickering's.

The less obvious one is that **the classification was purely empirical and it was correct.** Cannon ordered the sequence by the smooth progression of spectral features, with no theory of stellar atmospheres available to her — the physics did not exist. And the ordering she produced has never needed revision. **A correct classification can precede its explanation by decades, and it does not become more correct when the explanation arrives.**

## The sequence is temperature

Now the central physics, and the answer to the question left open above.

### Wien's law: colour is temperature

A star radiates approximately as a **blackbody**, and a blackbody's spectrum peaks at a wavelength inversely proportional to its temperature:

$$\lambda_{\max} = \frac{2.898\times10^{-3}\ \text{m·K}}{T}$$

| Type | $T$ (K) | Peak wavelength | Band |
|---|---|---|---|
| **O** | 40,000 | 72 nm | far ultraviolet |
| **B** | 20,000 | 145 nm | ultraviolet |
| **A** | 9,000 | 322 nm | ultraviolet |
| **F** | 6,800 | 426 nm | visible (blue) |
| **G** (Sun) | 5,772 | **502 nm** | visible (green) |
| **K** | 4,500 | 644 nm | visible (red) |
| **M** | 3,200 | 906 nm | near infrared |

Two things fall out immediately.

Only **F, G and K stars peak in the visible band at all.** O and B stars emit most of their energy in the ultraviolet; M stars emit most of theirs in the infrared. What is seen of a hot star is the tail of its spectrum.

And the Sun peaks at 502 nm, in the green — which is the middle of the range human eyes evolved to detect, and is not a coincidence. Human vision is tuned to the local star. That makes the visible band a parochial choice of window, worth remembering whenever "what a star looks like" is used as though it were a property of the star.

{{image: Wien's displacement law | Blackbody curves for stars of different temperature. The peak wavelength shifts inversely with temperature, so a 40,000 K O star peaks in the far ultraviolet and a 3,200 K M dwarf in the near infrared; only F, G and K stars peak within the visible band, and the Sun's peak at 502 nm sits where human vision is most sensitive.}}

### Why hydrogen lines peak in the middle

Here is the puzzle that defeated the Harvard classifiers.

Hydrogen is by far the most abundant element in every star. Yet the **Balmer** absorption lines — the visible hydrogen series — are strongest in **A stars**, in the middle of the temperature sequence, and weaker in both hotter and cooler stars.

If line strength measured abundance, this would mean A stars are made of hydrogen and O and M stars are not. That is what people assumed, and it is completely wrong.

The resolution requires two pieces of physics, and the second was not available until the 1920s.

**Piece one: the Balmer lines require an atom already excited.** The visible hydrogen lines are absorbed by electrons jumping *up from* the $n=2$ level, not from the ground state. So a hydrogen atom in $n=1$ — which is where an atom sits unless something excites it — is invisible in the Balmer lines. The atom must first be lifted to $n=2$, which costs **10.2 eV**.

The fraction of atoms with that much thermal energy follows the **Boltzmann distribution**:

$$\frac{N_2}{N_1} = \frac{g_2}{g_1}\,e^{-E/kT}$$

| Star | $T$ (K) | $kT$ (eV) | Fraction in $n=2$ | Relative to Sun |
|---|---|---|---|---|
| M dwarf | 3,200 | 0.276 | $3\times10^{-16}$ | $7\times10^{-8}\times$ |
| **Sun (G2)** | 5,772 | 0.497 | $5\times10^{-9}$ | $1\times$ |
| F star | 6,800 | 0.586 | $1.1\times10^{-7}$ | $22\times$ |
| **A0 star** | 9,500 | 0.819 | $1.6\times10^{-5}$ | $3{,}100\times$ |

At the Sun's photosphere, only about **one hydrogen atom in two hundred million** is in the $n=2$ state. The Balmer lines are weak in the Sun not because hydrogen is scarce — it is 91% of the atoms — but because almost none of it is in a position to absorb.

**Piece two: at higher temperatures, hydrogen ionises.** Strip the electron away and the atom cannot absorb at all. The balance between neutral and ionised states is given by the **Saha equation**, and above about 10,000 K ionisation wins rapidly.

So the Balmer line strength is a product of two competing factors — **excitation rising with temperature** and **neutral atoms disappearing with temperature** — and the product peaks where they cross, at roughly **9,500 K**. Spectral type **A0**.

> **Line strength measures temperature, not abundance.**

That is the single most important idea here, and it is the reason the Harvard sequence was interpretable as temperature long before anyone could say what stars are made of.

It also generalises. Every spectral feature peaks at the temperature that puts the relevant atom or molecule in the right state:

| Feature | Peaks at | Why |
|---|---|---|
| Ionised helium | O | Requires 54 eV — only the hottest stars |
| Neutral helium | B | Requires 21 eV |
| **Hydrogen Balmer** | **A** | 10.2 eV excitation versus ionisation |
| Ionised metals (Ca II) | F, G | Low ionisation energies, abundant |
| Neutral metals | K | Too cool to ionise |
| **Molecules (TiO)** | **M** | Cool enough for molecules to survive at all |

**The sequence is a thermometer**, and each class is defined by whichever species happens to be in a detectable state at that temperature.

## What stars are made of

In 1925, a 25-year-old graduate student at Radcliffe submitted a doctoral thesis that applied this physics — the Saha ionisation equation, then only five years old — to the Harvard spectral classification.

**Cecilia Payne** was doing something nobody had done: using the new atomic theory to convert observed **line strengths** into actual **abundances**, correcting properly for excitation and ionisation state.

The answer came out unambiguous. **Stars are overwhelmingly hydrogen and helium.** By number of atoms, hydrogen exceeded everything else by a factor of order a million.

{{image: Cecilia Payne-Gaposchkin | Cecilia Payne, whose 1925 doctoral thesis applied the five-year-old Saha equation to the Harvard spectra and found that stars are overwhelmingly hydrogen and helium. Told the hydrogen result was clearly impossible, she hedged it in print; she was vindicated four years later, and became the first woman to head a department at Harvard.}}

### Why that was unacceptable

The prevailing view, and it was not a fringe position, was that the Sun and stars have **broadly the same composition as the Earth** — silicon, magnesium, iron, oxygen, with hydrogen a minor constituent. It followed naturally from the assumption that the solar system had formed as a unit, and the solar spectrum appeared to support it: the strongest lines in the visible solar spectrum belong to calcium, sodium and iron, and hydrogen's lines are modest.

Payne's calculation showed that this reading was exactly the error described above. **The metal lines are strong because metals are easy to excite and ionise at photospheric temperatures. Hydrogen's lines are weak because almost none of it is in $n=2$.** Correct for the physics and the abundances invert.

**Henry Norris Russell** — the most influential astronomer in America, and co-author of the diagram this sub-block is named for — reviewed the thesis and told her the hydrogen result was "clearly impossible."

Payne added a sentence to the published version describing the hydrogen and helium abundances as almost certainly not real.

Four years later, working from a different line of evidence, Russell reached the same conclusion and published it. He cited Payne's thesis. He is nonetheless frequently credited with the discovery.

### Why this belongs in a physics course

Not merely as a morality tale, though it is one. Three reasons.

**It is the most consequential correction in the whole subject.** Hydrogen being the dominant constituent of stars is the precondition for everything downstream — nuclear fusion of hydrogen to helium, the mass–luminosity relation, stellar lifetimes, nucleosynthesis, and the composition of the universe.

**It is the same error twice.** The Harvard classifiers assumed line strength tracked abundance and got the sequence's *meaning* wrong for 25 years. The astronomical establishment assumed line strength tracked abundance and got the *composition of the universe* wrong. Both are the failure to distinguish **what is present from what is detectable** — the same failure mode that appears elsewhere as albedo bias in asteroid surveys, as survey selection in the outer solar system, and in the interpretation of a probe's atmospheric measurement.

**And Payne's hedge was the right call by every practical measure and the wrong call by the standard the field claims to hold.** She was a graduate student contradicting the discipline's most powerful figure on the strength of a five-year-old theory. Hedging was prudent, and it cost her the credit. It is worth being honest that the professional incentive and the scientific ideal pointed in opposite directions, and that the incentive won — because that is still true, and pretending otherwise leaves a student unprepared for it.

Payne's thesis was later described by Otto Struve as the most brilliant PhD thesis ever written in astronomy. She became the first woman to head a department at Harvard, in 1956, thirty-one years after the thesis.

## The second dimension

The sequence O B A F G K M is one axis. It is not sufficient, and the reason is a genuine discovery.

Take two stars of identical spectral type — both G2, both about 5,772 K. They can differ in **luminosity** by a factor of ten thousand, because one is a main-sequence star like the Sun and the other is a **giant** a hundred times larger. Same surface temperature; vastly different size, and therefore vastly different total output.

Temperature alone does not locate a star.

### Reading size from line shapes

What distinguishes them spectroscopically is **line width**, and the physics is direct.

A giant's atmosphere is enormously extended and its surface gravity is low, so the photosphere is **tenuous** — the gas is at low pressure and atoms are far apart. A main-sequence star's photosphere is far denser.

In a dense gas, an absorbing atom is constantly perturbed by neighbouring particles passing close by, and these encounters shift its energy levels slightly. Averaged over many atoms, the absorption is smeared over a range of wavelengths: **pressure broadening**. In a tenuous gas the encounters are rare and the lines stay **sharp**.

So **narrow lines mean a low-density photosphere, which means a large star.** The spectrum reports the surface gravity, and therefore the size, from line shapes alone.

This is exactly what Antonia Maury had recorded in the 1890s with her line-width parameter, and exactly what Pickering had dismissed as an unnecessary complication. Hertzsprung used it, and said so.

### The MK system

The modern scheme adds a **luminosity class** in Roman numerals:

| Class | Type | Example |
|---|---|---|
| **I** | Supergiant | Betelgeuse (M2 I), Rigel (B8 I) |
| **II** | Bright giant | |
| **III** | Giant | Aldebaran (K5 III), Arcturus (K1.5 III) |
| **IV** | Subgiant | Procyon (F5 IV–V) |
| **V** | Main sequence ("dwarf") | **The Sun (G2 V)**, Sirius (A1 V) |
| **VI / sd** | Subdwarf | |
| **D** | White dwarf | Sirius B (DA2) |

**The Sun is a G2 V star.** Two coordinates — temperature class and luminosity class — and that pair specifies a position on the H–R diagram from spectroscopy alone, with no distance required.

That last clause is the practical payoff, and it is large. **Spectroscopic parallax** — classifying a star, reading its intrinsic luminosity off the diagram, and comparing with its observed brightness to get a distance — works far beyond the range of geometric parallax. It is a rung of the distance ladder, and it exists because Maury noticed line widths.

## Below the bottom: L, T and Y

The sequence has been extended downward twice since 1900, and the extension is where the subject's central thesis meets its lower boundary.

| Class | $T$ (K) | Character |
|---|---|---|
| **M** | 2,300–3,900 | Coolest true stars; TiO bands |
| **L** | 1,300–2,300 | Metal hydrides, alkali metals; dust clouds form |
| **T** | 600–1,300 | **Methane** in absorption |
| **Y** | < 600 | Ammonia; some cooler than the human body |

The L, T and Y classes are mostly **brown dwarfs** — objects below the **hydrogen-burning limit** of about **0.08 M☉**, roughly 80 Jupiter masses.

Below that mass, the core never reaches the temperature required to fuse ordinary hydrogen, so the object has no sustained energy source. It forms hot, radiates, and **cools forever.** A brown dwarf's spectral type is therefore not fixed: an object may be class L when young and class T or Y after a few billion years of cooling, simply by getting colder.

That is a real break with everything above it. **A star's spectral type is a statement about its mass; a brown dwarf's is a statement about its age.**

{{image: Brown dwarf | An artist's rendering of a brown dwarf, an object below the roughly 0.08 solar-mass hydrogen-burning limit. Lacking a sustained energy source, it forms hot and cools forever through the L, T and Y classes, so its spectral type reports its age rather than its mass; degeneracy pressure keeps it approximately Jupiter-sized across the whole mass range.}}

Two connections are worth making explicitly.

**This is the subject's central thesis at its lower edge.** Mass determines everything — and at 0.08 M☉ the "everything" it determines includes whether the object is a star at all. The boundary is sharp, it is set by a single piece of physics (whether the core reaches ~3 million K before electron degeneracy halts the contraction), and it separates objects that shine for trillions of years from objects that never shine at all.

**And it has already been met from the other side.** In the study of the giant planets, Jupiter falls short of deuterium burning by a factor of 13 and hydrogen burning by a factor of 80. Brown dwarfs occupy exactly that gap — from about 13 to 80 Jupiter masses — and they are, by radius, approximately **Jupiter-sized**, because degeneracy pressure makes radius nearly independent of mass in that regime. The same physics that caps a planet's size sets the floor of the stellar sequence.

## What a magnitude-limited sample does

One more result, and it is a warning rather than a fact about stars.

Here is the distribution of spectral types among main-sequence stars in the solar neighbourhood:

| Type | Fraction of stars | Fraction of the light |
|---|---|---|
| O | 0.00003% | 1.8% |
| B | 0.13% | **76.6%** |
| A | 0.6% | 7.1% |
| F | 3.0% | 7.1% |
| **G** | **7.6%** | 4.5% |
| K | 12.1% | 2.1% |
| **M** | **76.5%** | **0.9%** |

**Three quarters of all stars are M dwarfs, and not one of them is visible to the naked eye.** Meanwhile B stars are one in eight hundred and produce three-quarters of the light.

So the naked-eye sky — and by extension every pre-photographic catalogue, and every intuition built on "the stars you can see" — is a sample selected almost perfectly *against* the typical star. The Sun sits in the top 8% by mass, which makes it distinctly above average, and the phrase "an ordinary star like the Sun" is wrong in a specific and measurable way.

**The population you find is not the population that exists**, and here the bias is a factor of a hundred in the wrong direction. This is the same principle known elsewhere as albedo bias in the asteroid belt, as survey selection in the outer solar system, and as detectability bias in the exoplanet census — and it appears here before any physics does, because the raw material of stellar astronomy is a catalogue, and every catalogue has a threshold.

This form of bias, in which a brightness-limited sample over-represents the luminous and rare, is the **Malmquist bias**: at any distance the faint majority drops below the detection limit while the rare bright objects remain, so a flux-limited survey progressively fills with intrinsically luminous stars that are not representative of the underlying population. It also poses a question that later work must answer: if most stars are faint red dwarfs, what determines how many stars of each mass form? That is the initial mass function, and it is why the study of stars cannot stop at the working star.

## Pulling the thread

- **The alphabet is scrambled because it is a fossil of a discarded theory.** The original Harvard classes were ordered by hydrogen line strength; reordering the survivors by **temperature** produced O B A F G K M, and the letters are the wreckage of the first attempt.
- **Kirchhoff and Bunsen made stellar composition measurable in 1860** — thirty years after Comte used it as his standing example of permanently unattainable knowledge. A spectrum is a continuum crossed by absorption lines, and each set of lines is an elemental fingerprint.
- The Harvard classification of over 350,000 spectra was executed largely by women paid 25–50 cents an hour, and it was **empirically correct with no theory available.** Cannon's ordering has never needed revision. A classification can precede its explanation by decades without being any less right.
- **Wien's law** puts the peak of an O star in the far ultraviolet and an M star in the infrared. Only F, G and K peak in the visible — and the Sun peaks at 502 nm because human eyes are tuned to it, not the reverse.
- The central result: **line strength measures temperature, not abundance.** Balmer lines peak at A0 because excitation to $n=2$ rises with temperature while neutral hydrogen ionises away above 10,000 K, and the product peaks at 9,500 K. At the Sun's photosphere only one hydrogen atom in two hundred million is in a position to absorb.
- **Cecilia Payne applied that physics in 1925 and found stars are overwhelmingly hydrogen.** She was told it was clearly impossible, hedged the conclusion, and was proved right four years later by the man who told her so. The error she corrected was the same error the Harvard classifiers had made — confusing what is present with what is detectable.
- **The second axis is size, read from line width.** Pressure broadening means narrow lines indicate a tenuous photosphere and therefore a large star. Maury recorded exactly this in the 1890s and Pickering dismissed it. The Sun is **G2 V**, and the pair of coordinates gives a distance without any geometry.
- **Below 0.08 M☉** the core never ignites hydrogen, and the L, T and Y classes are objects that cool forever. A star's spectral type reports its mass; a brown dwarf's reports its age. They are Jupiter-sized, for the degeneracy reason established for the giant planets.
- And **76% of stars are M dwarfs producing 0.9% of the light**, while B stars are 0.13% of stars producing 77%. The naked-eye sky is a sample selected against the typical star — the Malmquist bias, present in the very first catalogue.

## Further reading

The reception of Payne's thesis, and the physics that made it possible, are told in full biographical detail — with the atomic theory, the Harvard "computers", and Russell's intervention all in place — in {{book: Donovan Moore | What Stars Are Made Of: The Life of Cecilia Payne-Gaposchkin | 2020}}.

- **Donovan Moore, *What Stars Are Made Of: The Life of Cecilia Payne-Gaposchkin* (2020).** A thorough, well-documented life of the woman who first showed that stars are hydrogen and helium, and the clearest lay account of why the result was resisted: it traces the Saha equation into her calculation, reconstructs the Russell episode from the correspondence, and sets the discovery in the context of the Harvard classification effort that produced the sequence.

## Problems

*Data: Wien constant $b = 2.898\times10^{-3}$ m·K. Boltzmann constant $k = 8.617\times10^{-5}$ eV/K. Hydrogen $n=1 \to n=2$ excitation energy 10.2 eV; ionisation energy 13.6 eV. Statistical weights $g_1 = 2$, $g_2 = 8$. Neutral helium excitation $\approx 21$ eV; ionised helium $\approx 54$ eV. Sun: $T_\text{eff} = 5{,}772$ K, spectral type G2 V. Hydrogen-burning limit $\approx 0.08\ M_\odot \approx 80\ M_J$.*

### 1 — The scrambled alphabet
**(a)** State what the original Harvard classes were ordered by, and what the modern sequence is ordered by.
**(b)** Explain why the letters survive in a non-alphabetical order rather than having been renamed.
**(c)** Give one other example of a piece of terminology that preserves an abandoned idea.
**(d)** Is the survival of the scrambled sequence a defect? Argue both sides briefly.

### 2 — Colour is temperature
**(a)** Compute the peak wavelength for an O star (40,000 K), the Sun (5,772 K), and an M dwarf (3,200 K).
**(b)** State which spectral types peak within the visible band (roughly 400–700 nm).
**(c)** An O star and an M star are both observed in visible light. For each, is the observed flux from near the peak or from a tail? Which tail?
**(d)** The Sun peaks at 502 nm, near the centre of human visual sensitivity. Explain why this is not a coincidence, and state what it implies about using visual appearance to characterise stars.
**(e)** A brown dwarf of class Y has $T \approx 400$ K. Compute its peak wavelength and comment on what instrument is required to observe it.

### 3 — Why hydrogen lines peak in the middle *(the central calculation)*
**(a)** Explain why the visible Balmer lines require hydrogen atoms already in the $n=2$ state, and why an atom in the ground state is invisible in them.
**(b)** Using the Boltzmann relation $N_2/N_1 = (g_2/g_1)e^{-E/kT}$ with $E = 10.2$ eV, compute the fraction of hydrogen in $n=2$ for the Sun (5,772 K) and for an A0 star (9,500 K). Take the ratio.
**(c)** Express the solar value as "one atom in N." Comment on it, given that hydrogen is ~91% of the atoms in the Sun's photosphere.
**(d)** Excitation increases monotonically with temperature. Explain why the Balmer line strength nevertheless **peaks** and then declines, and name the equation governing the second effect.
**(e)** State the general principle in one sentence.
**(f)** Ionised helium lines appear only in O stars. Using the excitation energies given, explain why — and predict, without calculation, at roughly what temperature neutral helium lines should peak relative to hydrogen.

### 4 — The thermometer, generalised
**(a)** For each of He II, He I, H Balmer, Ca II, neutral metals and TiO, state the spectral type at which it peaks and the physical reason.
**(b)** Molecular bands appear only in the coolest stars. Explain why, in terms of bond energies and thermal energies.
**(c)** Two stars have identical composition but differ by 4,000 K in temperature. Describe qualitatively how their spectra differ and explain why a naive reading would suggest they are made of different things.

### 5 — Payne *(the methodological core)*
**(a)** State the prevailing view of stellar composition before 1925 and the evidence that appeared to support it.
**(b)** Explain precisely why that evidence was misread, connecting it to the answer to problem 3(e).
**(c)** State what Payne's calculation required that earlier work did not have available.
**(d)** Payne hedged her conclusion in print after Russell called it impossible, and was vindicated four years later. Assess the decision: was it correct by the standards of scientific practice, and was it correct by the standards of professional survival? Explain why the two answers may differ.
**(e)** Identify the common failure mode linking (i) the Harvard classifiers' misreading of the sequence for 25 years and (ii) the establishment's view of stellar composition. Name two episodes elsewhere with the same structure.
**(f)** State three specific downstream results that depend on Payne's conclusion being right.

### 6 — The second axis
**(a)** Two stars are both G2. Explain how they can differ in luminosity by a factor of $10^4$, and what physical quantity actually differs.
**(b)** Explain **pressure broadening**: what causes it, and why a low-density photosphere gives narrow lines.
**(c)** Deduce the chain from an observed line width to a stellar radius. What intermediate quantity does the line width actually measure?
**(d)** Give the MK luminosity class of each of the Sun, Betelgeuse, Aldebaran and Sirius B.
**(e)** Explain **spectroscopic parallax** in three steps, and state the one thing it requires that geometric parallax does not.
**(f)** Antonia Maury's line-width parameter was dismissed by Pickering as an unnecessary complication. State what was lost, and what general lesson this offers about classification schemes.

### 7 — Below the limit
**(a)** State the hydrogen-burning limit in solar masses and in Jupiter masses, and the physical criterion that sets it.
**(b)** Explain why a brown dwarf's spectral type changes over its lifetime while a main-sequence star's does not.
**(c)** Complete the sentence and justify it: *"A star's spectral type reports its ___; a brown dwarf's reports its ___."*
**(d)** Brown dwarfs span 13–80 $M_J$ and are all approximately Jupiter-sized. Explain why, referring to the mass–radius behaviour established for the giant planets.
**(e)** Explain in what sense the L/T/Y extension is the subject's thesis "at its lower edge."

### 8 — What you can see *(should change how you read any stellar statistic)*
**(a)** Given that M dwarfs are 76.5% of stars and contribute 0.9% of the light, while B stars are 0.13% and contribute 76.6%, compute the ratio of light output per star between the two classes.
**(b)** No M dwarf is visible to the naked eye. Explain what this implies about every pre-photographic stellar catalogue.
**(c)** The Sun is often described as "an ordinary star." Assess this claim quantitatively.
**(d)** State the general principle, name it, and give three earlier episodes where it appeared.
**(e)** A survey reports that 40% of nearby stars host a detected planet. Before interpreting this, what two things must be established?

### 9 — Open problem: classification before understanding
Cannon's spectral ordering was produced with no theory of stellar atmospheres and has never required revision.
**(a)** Explain how a classification can be correct without an explanation. What is it correct *about*?
**(b)** Give two further examples of correct classification preceding correct explanation by decades.
**(c)** The Harvard scheme's first version — ordering by hydrogen line strength — was also empirical, and it was wrong. What distinguishes the two cases? Be precise: both were "just describing what was seen."
**(d)** From (c), derive a criterion for when an empirical classification is likely to survive theoretical scrutiny and when it is not. Test the criterion against one classification scheme from elsewhere.

## Worked answers

### 1 — The scrambled alphabet

**(a)** Originally: **hydrogen Balmer line strength**, strongest first — class A had the strongest lines, B the next, and so on. Now: **temperature**, hottest first.

**(b)** Because the letters were already in use across a large body of published work — tens of thousands of classified spectra, catalogues, and cross-references — by the time the reordering was understood. Renaming would have invalidated every existing reference and every printed catalogue, for a purely cosmetic gain.

The classes were **reordered and pruned** rather than relabelled: several were found to be duplicates or plate artefacts and dropped, and the survivors were rearranged. What remains is the intersection of two orderings, which is why it looks arbitrary.

**(c)** Several are creditable. **"Planetary nebula"** — nothing to do with planets; the name records that they looked like planetary discs in eighteenth-century telescopes. **"Asteroid"** — meaning "star-like," a name for a telescopic appearance rather than a physical nature. **"Ices"** in planetary science, meaning a class of compounds rather than a physical state. **"Metals"** in astronomy, meaning everything heavier than helium.

**(d)** **A defect:** it is an obstacle for every student, it conveys no information, and it requires a mnemonic to memorise something that could have been self-describing. It also actively misleads — a reader may reasonably assume the letters mean something.

**Not a defect:** stability of nomenclature has real value, and the cost of renaming a widely used system almost always exceeds the benefit. More interestingly, the oddity is **informative**: the scrambled sequence is a visible reminder that the classification preceded its interpretation, which is the correct thing to remember about it. A tidy sequence would conceal the history.

On balance a defect worth keeping, in the way that irregular verbs are.

### 2 — Colour is temperature

**(a)** $\lambda_{\max} = b/T$:
O star: $2.898\times10^{-3}/40{,}000 = 7.2\times10^{-8}$ m $= \mathbf{72\ nm}$.
Sun: $2.898\times10^{-3}/5{,}772 = \mathbf{502\ nm}$.
M dwarf: $2.898\times10^{-3}/3{,}200 = \mathbf{906\ nm}$.

**(b)** **F, G and K only.** A stars peak at 322 nm (ultraviolet), M stars at 906 nm (near infrared).

**(c)** The **O star** is observed on the long-wavelength (Rayleigh–Jeans) tail — visible light is far beyond its peak. The **M star** is observed on the short-wavelength (Wien) tail — visible light is at higher energy than its peak, where the spectrum falls exponentially.

The M star's case is the more severe: the Wien tail falls off exponentially rather than as a power law, so an M dwarf is drastically under-represented in visible-light observations relative to its total output. This is part of why they were historically undercounted.

**(d)** **Not a coincidence, and the causation runs from the Sun to the eye.** Human vision evolved under sunlight, and the photoreceptor sensitivity curve peaks close to where the incident flux is greatest — which is where evolution would put it, since the greatest information return per photon-detecting apparatus is at the wavelength with the most photons.

The implication: **"visible light" is a parochial window defined by the local star, not a natural category.** Any statement of the form "what a star looks like" is a statement about a narrow band selected by an accident of biology. An observer evolved beside an M dwarf would call the infrared "visible" and would find the sky populated by objects otherwise considered dark.

**(e)** $\lambda_{\max} = 2.898\times10^{-3}/400 = 7.2\times10^{-6}$ m $= \mathbf{7{,}245\ nm} = 7.2\ \mu$m — the **thermal infrared**.

Requiring a **cryogenically cooled infrared telescope**, and preferably a space-based one: at 7 μm the Earth's atmosphere is substantially opaque, and — more fundamentally — a room-temperature telescope glows brightly at exactly these wavelengths and would swamp the target. An object colder than the instrument cannot be observed without cooling the instrument. This is why the Y class was discovered by WISE and is studied with JWST.

### 3 — Why hydrogen lines peak in the middle

**(a)** The Balmer series consists of transitions **starting from $n=2$**: absorption lifts an electron from $n=2$ to $n=3$, 4, 5 and so on, and the corresponding photon energies fall in the visible band.

An atom in the **ground state** ($n=1$) can only absorb transitions of the **Lyman** series, which start at 10.2 eV and lie in the **ultraviolet**. Such an atom is therefore entirely invisible in the visible spectrum. Only the small excited fraction participates.

**(b)** The relevant ratio, with $g_2/g_1 = 8/2 = 4$, is

$$\frac{N_2}{N_1} = \frac{g_2}{g_1}\,e^{-E/kT} = 4\,e^{-10.2/kT}$$

Sun: $kT = (8.617\times10^{-5})(5772) = 0.497$ eV; $4e^{-20.5} = \mathbf{5.0\times10^{-9}}$.
A0: $kT = (8.617\times10^{-5})(9500) = 0.819$ eV; $4e^{-12.46} = \mathbf{1.6\times10^{-5}}$.
Ratio: $\mathbf{3{,}100\times}$.

**(c)** About **one atom in two hundred million** ($1/5.0\times10^{-9} = 2.0\times10^{8}$).

Which is the whole point. Hydrogen constitutes roughly **91% of the atoms** in the Sun's photosphere, and 99.999999% of it is invisible to the visible-band observation. The observed weakness of the Balmer lines carries essentially no information about how much hydrogen is present — it is a measurement of temperature dressed as a measurement of composition.

**(d)** Because a competing process removes the absorbers. Above roughly 10,000 K, thermal collisions and radiation **ionise** hydrogen: the electron is stripped away entirely, and a bare proton cannot absorb at any Balmer wavelength.

So line strength is the **product** of two opposing factors — the excited fraction, rising steeply with $T$, and the neutral fraction, falling steeply with $T$ — and the product peaks where they cross, near **9,500 K** (type A0).

The governing relation for the ionisation balance is the **Saha equation**, published in 1920, and its absence is precisely why the Harvard classifiers could not interpret their own sequence.

**(e)** Line strength measures the **temperature-dependent population of a particular atomic state, not the abundance of the element.**

**(f)** Ionised helium requires an electron to be removed from He$^+$, which costs **54 eV** — enormously more than hydrogen's 13.6 eV. The Boltzmann and Saha factors both depend on $e^{-E/kT}$, so a species requiring 54 eV appears in appreciable quantity only where $kT$ is a substantial fraction of that, i.e. at temperatures of tens of thousands of kelvin. Only O stars are hot enough, which makes He II lines a clean temperature discriminant at the top of the sequence.

**Prediction for neutral helium:** its excitation energy is ~21 eV, roughly **twice** hydrogen's 10.2 eV. Since the peak occurs where excitation and ionisation balance, and both scale with $E/kT$, the peak should fall at roughly **twice** hydrogen's peak temperature — around 20,000 K. That is spectral type **B**, which is exactly where neutral helium lines are strongest. A prediction from a ratio of two numbers, with no calculation.

### 4 — The thermometer, generalised

**(a)**

| Feature | Peaks at | Reason |
|---|---|---|
| He II | O | 54 eV required — only the hottest stars supply it |
| He I | B | 21 eV, roughly twice hydrogen's, so roughly twice the peak temperature |
| H Balmer | A | 10.2 eV excitation against 13.6 eV ionisation; product peaks at 9,500 K |
| Ca II | F, G | Low ionisation energy (6.1 eV), so calcium is singly ionised at these temperatures, and Ca II has strong visible transitions |
| Neutral metals | K | Too cool to ionise the metals, so they remain neutral and absorb |
| TiO bands | M | Cool enough for **molecules to survive**; above ~4,000 K they dissociate |

**(b)** A molecule is held together by a chemical bond of a few eV. When the characteristic thermal energy $kT$ — and more importantly the energetic tail of the distribution — becomes comparable to the bond energy, collisions **dissociate** the molecule faster than it can form.

At 3,000 K, $kT \approx 0.26$ eV, well below typical bond energies of 3–7 eV, so molecules survive in appreciable numbers. At 6,000 K the dissociation rate has risen enormously (the relevant factor is again exponential), and molecular bands vanish.

Molecular bands are therefore not evidence of unusual chemistry; they are evidence of **low temperature.** The elements are present in hotter stars too; they are simply not bound together.

**(c)** The hotter star would show strong helium and hydrogen lines and few metal lines; the cooler star would show strong metal lines, weak hydrogen, and possibly molecular bands.

A naive reading — line strength as abundance — would conclude that one star is made of hydrogen and helium and the other of calcium, iron, sodium and titanium oxide. That is precisely the inference the astronomical establishment made before 1925, and precisely what Payne corrected. The two stars have identical composition and differ only in which species happens to be in an absorbing state.

### 5 — Payne

**(a)** That stars have **broadly terrestrial composition** — dominated by silicon, magnesium, iron and oxygen, with hydrogen a minor constituent.

The supporting evidence: the strongest absorption lines in the **visible** solar spectrum belong to **calcium (Ca II H and K), sodium and iron**, while hydrogen's Balmer lines are comparatively modest. Read as abundances, this says the Sun is made mostly of metals. It was also consistent with the reasonable prior that the Sun and the planets formed from the same material.

**(b)** Because line strength is set by the **population of the absorbing state**, not by the abundance of the element (problem 3(e)).

At photospheric temperatures, calcium is **easy** to ionise (6.1 eV) and Ca II has strong visible transitions, so a small amount of calcium produces enormous lines. Hydrogen is **hard** to excite to $n=2$ (10.2 eV), so only one atom in $2\times10^{8}$ can absorb in the visible, and an enormous amount of hydrogen produces modest lines.

Correct for the excitation and ionisation state and the abundances invert by a factor of order a million.

**(c)** The **Saha ionisation equation**, published by Meghnad Saha in 1920. It gives the ratio of ionised to neutral atoms as a function of temperature and electron pressure, and without it there is no way to convert an observed line strength into an abundance. Payne's thesis was among the first applications of it to stellar spectra, five years after it existed.

**(d)** **By the standards of scientific practice: no.** The calculation was sound, the conclusion followed, and the appropriate action was to state it and let it be tested. Adding a disclaimer that the result was "almost certainly not real," on the authority of a senior figure's disbelief rather than on any identified flaw, substituted deference for evidence.

**By the standards of professional survival: almost certainly yes.** She was a graduate student, in a field with essentially no women in permanent positions, contradicting the most influential astronomer in America on the basis of a five-year-old theory. Publishing the claim unhedged, against Russell's explicit judgement, carried a real risk of ending her career before it began.

The two answers differ because the incentives and the ideal point in opposite directions, and pretending otherwise is dishonest about how the discipline actually works. The ideal is that evidence outranks authority; the incentive is that authority controls appointments, referee reports and funding. In 1925 the incentive won, and the cost was borne by Payne rather than by Russell. Naming this is not cynicism: a student who believes the ideal is automatically enforced will be unprepared the first time it is not.

**(e)** **Confusing what is present with what is detectable.**

The Harvard classifiers assumed the strength of a feature tracked the amount of the substance, and so could not interpret why hydrogen lines peaked in the middle of the sequence. The establishment made the identical assumption at larger scale and concluded the universe was made of metals.

Two others: the **albedo bias in asteroid surveys**, where dark C-types are systematically under-detected in magnitude-limited work, distorting the apparent taxonomy of the belt; and the **Planet Nine clustering claim**, where extreme trans-Neptunian objects are discovered only near perihelion by non-uniform surveys, so the discovered sample is clustered by construction.

**(f)** Three downstream dependencies:

**Nuclear energy generation.** Stars run on hydrogen fusion. If stars were metal-dominated there would be no proton–proton chain, no CNO cycle, and no explanation for stellar energy output over billions of years.

**Mass–luminosity and lifetimes.** Both are computed from the fuel supply — the hydrogen available — and its burning rate. The fuel has to be there.

**Nucleosynthesis and the composition of everything.** If stars begin as hydrogen and helium and manufacture the heavier elements, then the metals in the Earth and in living bodies were made in earlier stars. If stars were already metal-rich, there is nothing to explain and the origin of the elements is pushed back with no mechanism.

### 6 — The second axis

**(a)** Because **luminosity depends on radius as well as temperature**:

$$L = 4\pi R^2\sigma T^4$$

Two stars at the same $T$ differ in $L$ only through $R^2$, so a factor of $10^4$ in luminosity is a factor of **100 in radius**.

The physical quantity that differs is **size** — one is a main-sequence star, the other a giant with an enormously extended envelope.

**(b)** An absorbing atom's energy levels are perturbed by the electric fields of nearby particles passing close by. Each encounter shifts the transition energy slightly, and different atoms experience different perturbations at any instant, so the absorption is **smeared over a range of wavelengths** rather than confined to one.

The effect scales with the **frequency and closeness of encounters**, hence with density. A **low-density** photosphere means rare, distant encounters, minimal perturbation, and therefore **narrow lines**.

**(c)** The chain: line width $\to$ **pressure** in the photosphere $\to$ **surface gravity** $g = GM/R^2 \to$ (with a mass from the spectral type or from a binary) $\to$ **radius**.

The line width actually measures **surface gravity**, not radius directly. Radius follows only once a mass is supplied — which is why a purely spectroscopic classification gives a *class* rather than a size.

**(d)** Sun: **G2 V**. Betelgeuse: **M2 I** (supergiant). Aldebaran: **K5 III** (giant). Sirius B: **D** (white dwarf).

**(e)** Three steps: (i) obtain a spectrum and classify the star in both dimensions (e.g. G2 V); (ii) read its **intrinsic luminosity** from the H–R diagram, since that position corresponds to a known absolute magnitude; (iii) compare with the **observed** brightness and apply the inverse-square law to obtain the distance.

The one thing it requires that geometric parallax does not: **a calibrated H–R diagram** — a prior sample of stars whose distances are already known by geometry, from which the luminosity of each class was established. It is not an independent measurement but a ladder rung, and it inherits every systematic error in the calibration below it.

**(f)** **What was lost:** the second dimension of stellar classification, for roughly two decades. Maury's parameter was the giant/dwarf distinction, and it is the difference between locating a star on a line and locating it on a plane.

**The general lesson:** a classification scheme's designer decides what counts as signal and what counts as nuisance, and **that decision is a theoretical commitment even when it is presented as mere description.** Pickering's judgement that line width was an unnecessary complication was not neutral bookkeeping; it embodied a belief that temperature was the only relevant variable. Recording more than one can currently explain is cheap; discarding it is not recoverable, because the plates get filed and the parameter goes unmeasured for a generation.

### 7 — Below the limit

**(a)** **$\approx 0.08\ M_\odot \approx 80$ Jupiter masses.** The criterion: whether the contracting core reaches the temperature required for sustained hydrogen fusion (~$3\times10^{6}$ K) **before electron degeneracy pressure halts the contraction.**

Below the limit, degeneracy pressure — which does not depend on temperature — takes over the support of the core, contraction stops, and the interior never gets any hotter. The object is stalled below the ignition threshold permanently.

**(b)** A **main-sequence star** is in a steady state: fusion replaces the energy it radiates, so its surface temperature is essentially constant for the whole of its main-sequence lifetime, and its spectral type is fixed.

A **brown dwarf** has no sustained energy source. It forms hot from gravitational contraction and thereafter **cools monotonically**, radiating away its residual heat. Its surface temperature falls continuously, so it migrates down the sequence — an object may be class L when young and class T or Y after several billion years.

**(c)** *"A star's spectral type reports its **mass**; a brown dwarf's reports its **age**."*

Justification: for a main-sequence star, mass determines luminosity and radius and therefore surface temperature, and all are constant with time — so type is a proxy for mass. For a brown dwarf, the temperature is set by how much of its initial heat has been radiated away, which depends on time — so type is a proxy for age. Two objects of the same class L may have quite different masses; two main-sequence G2 stars may not.

**(d)** Because in this regime the support is dominated by **electron degeneracy pressure**, for which radius *decreases* with mass ($R \propto M^{-1/3}$) rather than increasing.

The radius–mass curve for cold hydrogen-rich objects rises at low mass, **peaks around 3–4 $M_J$**, and declines thereafter. Across the entire brown dwarf range — 13 to 80 $M_J$, a factor of six in mass — the radius therefore varies remarkably little and stays close to Jupiter's.

This is the same result established for the giant planets: adding mass to Jupiter would eventually make it *smaller*, which is why radius is nearly useless as a mass indicator for giant exoplanets.

**(e)** Because the central thesis is that **mass determines everything about a star's life** — and at 0.08 M☉ the "everything" it determines includes **whether the object is a star at all.**

The boundary is set by a single piece of physics, it is sharp, and it separates objects that shine steadily for trillions of years from objects that never ignite and cool forever. There is no more dramatic demonstration that one number fixes the outcome.

### 8 — What you can see

**(a)** Light per star $\propto$ (fraction of light)/(fraction of stars):
B: $76.6/0.13 = 589$. M: $0.9/76.5 = 0.0118$.
Ratio $= 589/0.0118 \approx \mathbf{50{,}000}$.

A single B star outshines a single M dwarf by roughly **fifty thousand times.**

**(b)** That every pre-photographic catalogue is a catalogue of the **rarest** stars. Naked-eye observation is limited to about magnitude 6, and no M dwarf reaches it — so the entire observational record from antiquity to the nineteenth century samples the top fraction of a percent of the stellar population by number, selected precisely for being atypical.

Every intuition built on "the stars you can see" is therefore built on a sample chosen against the typical case, and the bias is not small or correctable by observing more carefully. It required photography, and then infrared surveys, to see the population that actually dominates.

**(c)** The Sun is in the **G class, which is 7.6% of stars** — and since M, K and most of the brown dwarf population lie below it, the Sun is in roughly the **top 8% by mass.**

So "ordinary" is wrong in a measurable way. It is more massive than about 92% of stars, more luminous than about 95%, and shorter-lived than the great majority. What it *is* is the most common type of star that is easily visible, which is a statement about the detection threshold rather than about stellar populations. A more defensible phrasing: the Sun is an unremarkable member of the minority of stars that can be seen well.

**(d)** **The population you find is not the population that exists, and the difference is systematic rather than random** — the **Malmquist bias**, in which a brightness-limited sample over-represents luminous, rare objects.

Three earlier episodes: the **C-type albedo bias** in asteroid surveys; **Planet Nine's orbital clustering**, manufactured by non-uniform survey coverage; and **exoplanet detectability bias**, whereby an observer with equivalent instruments looking at this solar system from 50 light years would probably detect nothing.

**(e)** **First: the survey's detection function** — for each star observed, what range of planet masses, radii and orbital periods *would* have been detected had they been present? Without that, a 40% detection rate is a statement about the instrument.

**Second: how the target stars were selected.** If the survey preferentially observed bright, nearby, quiet, metal-rich stars — which most do, for good practical reasons — then the sample is not representative of stars generally, and the rate cannot be extrapolated.

The two are distinct: the first is about **what could be seen**, the second about **where one looked.** Both must be characterised before any occurrence rate means anything.

### 9 — Open problem: classification before understanding

**(a)** It is correct about the **ordering relation among the observations** — that the spectra form a single continuous one-parameter family, and that this is the order in which they lie along it.

That claim is entirely checkable without knowing what the parameter *is*. Cannon could verify that intermediate spectra exist between any two classes, that the progression of every spectral feature is monotonic or single-peaked along the sequence, and that no star falls outside it. The structure of the data is an observable, independent of its interpretation — and it was that structure, not any theory, that showed the sequence had to be reordered from the original alphabetical scheme.

**(b)** **Kepler's three laws** — exact empirical relations extracted from Tycho's data, unexplained until Newton some seventy years later. **The Kirkwood gaps** — correctly identified in 1867 as resonances with Jupiter, with no mechanism available for 116 years until Wisdom showed the eccentricity evolves chaotically. (Also creditable: Mendeleev's periodic table, and the Balmer formula of 1885 explained by Bohr in 1913.)

**(c)** Both were empirical, and this is the crux: **describing what one sees is not a neutral act, because one must choose what to describe.**

Fleming's scheme measured **one feature** — hydrogen line strength — and ordered by it. Cannon's ordering was constrained by **all** the features simultaneously: it had to place He II, He I, hydrogen, Ca II, neutral metals and TiO in a consistent progression at once.

Ordering by one variable is nearly unconstrained; almost any monotonic quantity produces *some* ordering, and there is no way to be wrong. Ordering by the simultaneous behaviour of many independent features is **massively overdetermined** — if the spectra did not genuinely form a one-parameter family, no single ordering could make all of them behave smoothly, and the attempt would fail visibly. The first scheme could not have been refuted by its own data. The second could have been, and was not.

**(d)** **Criterion: an empirical classification is likely to survive if it is overdetermined by the data — if it is forced to satisfy more independent constraints than it has free choices — and unlikely to survive if it is imposed by a single chosen variable.**

Equivalently: ask whether the scheme *could have failed*. If the data could have refused to fall into the classification and did not, the classification is probably tracking something real. If any dataset would have produced some classification, it is tracking the choice.

**Test — the Kuiper Belt dynamical classes.** Classical, resonant, scattered and detached are defined by several quantities at once (semi-major axis, eccentricity, inclination, and whether Neptune can reach the perihelion), and the resulting groups **also** turn out to differ in colour, size distribution and binary fraction — properties that played no part in defining them. The classification is heavily overdetermined and predicts correlations it was not built to produce. By the criterion, it should survive, and it has. **Contrast** the original Harvard scheme, or the Titius–Bode relation, which fits one chosen variable, makes no independent predictions, and failed as soon as new data arrived.$astroSpec_master$,
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
  select $astroSpec_quiz$[{"id": "q1", "type": "mcq", "prompt": "The spectral sequence O B A F G K M runs from hottest to coolest, yet the letters are not in alphabetical order. Why is the alphabet scrambled?", "options": ["The letters were assigned in the order the classes were discovered, and hotter stars simply happened to be found first", "The original Harvard scheme ordered classes by the strength of their hydrogen Balmer lines (strongest first); when the survivors were later reordered by temperature the letters were kept to avoid invalidating tens of thousands of published classifications, so the sequence preserves temperature while the letters preserve the abandoned hydrogen-strength ordering", "The letters encode the colour of each class in an old German naming convention unrelated to temperature", "The sequence was deliberately scrambled so that students would need a mnemonic and remember it better"], "answerIndex": 1, "explanation": "The first Harvard classification, developed in the 1880s under Pickering and executed largely by Williamina Fleming, sorted stars by hydrogen Balmer line strength, strongest first, so class A had the strongest lines, B the next, and so on. Several classes were later found to be duplicates or plate artefacts and dropped, and when Maury and then Cannon reworked the scheme it became clear that reordering the survivors by temperature made every other feature (metals, molecular bands, ionised helium) fall into a smooth progression. That reordering gave O B A F G K M. The letters were not renamed because they were already embedded in tens of thousands of published classifications and catalogues, so renaming would have invalidated every existing reference for a cosmetic gain. The result is the intersection of two orderings: the letters are a fossil of the discarded hydrogen-strength scheme, and the sequence is the correct temperature ordering."}, {"id": "q2", "type": "mcq", "prompt": "A star radiates approximately as a blackbody, whose spectrum peaks at a wavelength inversely proportional to temperature (Wien's law, with constant about 2.898 times ten to the minus three metre-kelvin). What does this imply about which stars we see well in visible light?", "options": ["All stars peak in the visible band, because that is where stars emit most of their energy by definition", "Only F, G and K stars peak within the visible band; O and B stars peak in the ultraviolet and M stars in the infrared, so for a hot O star or a cool M star the visible flux is only the tail of the spectrum", "Hotter stars peak at longer wavelengths, so O stars are seen in the infrared and M stars in the ultraviolet", "The peak wavelength is the same for every star, and only the total brightness changes with temperature"], "answerIndex": 1, "explanation": "Wien's law puts the peak wavelength at the Wien constant divided by temperature, so a 40,000 K O star peaks near 72 nm in the far ultraviolet, a 20,000 K B star near 145 nm, a 9,000 K A star near 322 nm (still ultraviolet), and a 3,200 K M dwarf near 906 nm in the near infrared. Only F, G and K stars, roughly 6,800 down to 4,500 K, peak within the visible band of about 400 to 700 nm. For an O star the visible flux comes from the long-wavelength Rayleigh-Jeans tail, and for an M star it comes from the short-wavelength Wien tail, which falls off exponentially, so M dwarfs are badly under-represented in visible light relative to their total output. The Sun peaks at 502 nm in the green, near the centre of human visual sensitivity, because human vision evolved under sunlight, not the other way round."}, {"id": "q3", "type": "mcq", "prompt": "Hydrogen is about 91 percent of the atoms in the Sun's photosphere, yet the visible hydrogen Balmer lines are weak in the Sun and strongest in A stars at around 9,500 K. What resolves this?", "options": ["A stars genuinely contain far more hydrogen than the Sun does; line strength is a direct measure of abundance", "The Balmer lines are absorbed only by atoms already excited to the n equals 2 level, whose population rises with temperature (Boltzmann), while above about 10,000 K hydrogen ionises and cannot absorb at all (Saha), so the product of the two effects peaks at intermediate temperature", "Hydrogen in the Sun is hidden beneath a layer of calcium and iron that blocks the Balmer lines from view", "The Sun rotates too slowly for its hydrogen lines to broaden enough to be detected"], "answerIndex": 1, "explanation": "The Balmer series is absorbed by electrons jumping up from the n equals 2 level, not from the ground state, so a hydrogen atom in n equals 1 is invisible in the visible band; it must first be lifted to n equals 2 at a cost of 10.2 eV. The fraction of atoms with that much thermal energy follows the Boltzmann distribution and rises steeply with temperature: at the Sun only about one hydrogen atom in two hundred million is in n equals 2, whereas at an A0 star of 9,500 K the fraction is about 3,100 times larger. But above roughly 10,000 K a second process, ionisation governed by the Saha equation, strips the electron away entirely and a bare proton cannot absorb at any Balmer wavelength. Balmer line strength is therefore the product of excitation rising with temperature and neutral atoms disappearing with temperature, and the product peaks where they cross, near 9,500 K, type A0. The general principle is that line strength measures the temperature-dependent population of an atomic state, not the abundance of the element."}, {"id": "q4", "type": "mcq", "prompt": "In 1925 Cecilia Payne's doctoral thesis applied the new Saha ionisation equation to the Harvard spectra and reached a conclusion the establishment found unacceptable. What was the conclusion, and why was it resisted?", "options": ["That stars are mostly iron and calcium, which contradicted the prevailing view that they were made of hydrogen", "That stars are overwhelmingly hydrogen and helium, resisted because the accepted view held stars had broadly terrestrial composition; the strongest visible solar lines belong to calcium, sodium and iron, and Henry Norris Russell called the hydrogen result clearly impossible, so Payne hedged it in print and was vindicated four years later", "That the Sun is cooling and will soon change spectral class, which violated the belief in stable stars", "That the spectral sequence measures composition rather than temperature, overturning Cannon's ordering"], "answerIndex": 1, "explanation": "Payne converted observed line strengths into abundances while correcting properly for excitation and ionisation using the Saha equation, then only five years old, and found that stars are overwhelmingly hydrogen and helium, with hydrogen exceeding everything else by a factor of order a million by number of atoms. The prevailing view, not a fringe position, was that stars had broadly the same composition as the Earth, dominated by silicon, magnesium, iron and oxygen, supported by the fact that the strongest lines in the visible solar spectrum belong to calcium, sodium and iron while hydrogen's are modest. That reading was exactly the error of confusing detectability with abundance: metals are easy to excite and ionise at photospheric temperatures, while almost no hydrogen sits in the n equals 2 state that the visible lines require. Henry Norris Russell, the most influential astronomer in America, told her the hydrogen result was clearly impossible, so she added a line calling it almost certainly not real. Four years later Russell reached the same conclusion by another route and is often credited with it. The episode belongs in a physics course because hydrogen dominance is the precondition for fusion, stellar lifetimes and nucleosynthesis."}, {"id": "q5", "type": "mcq", "prompt": "Among main-sequence stars in the solar neighbourhood, M dwarfs are about 76.5 percent of all stars but contribute only 0.9 percent of the light, while B stars are 0.13 percent of stars but 76.6 percent of the light, and no M dwarf is visible to the naked eye. What is the correct lesson?", "options": ["The naked-eye sky is a representative sample of stars, so the Sun is a genuinely typical star", "The catalogue is not the population: a brightness-limited sample over-represents luminous rare stars (Malmquist bias), so every pre-photographic catalogue records the rarest stars, and the Sun, in the top 8 percent by mass, is above average rather than ordinary", "M dwarfs must be much younger than B stars, which is why they are so faint and hard to see", "B stars are the most common kind of star in the galaxy, since they dominate the light we receive"], "answerIndex": 1, "explanation": "Three quarters of all stars are M dwarfs and not one is visible to the naked eye, which cuts off around magnitude 6, while B stars are about one in eight hundred yet produce three quarters of the light; a single B star outshines a single M dwarf by roughly fifty thousand times. So the naked-eye sky, and every pre-photographic catalogue, samples the top fraction of a percent of stars by number, selected precisely for being atypical. This is the Malmquist bias: at any distance the faint majority drops below the detection limit while rare luminous objects remain, so a flux-limited survey fills with intrinsically bright stars that do not represent the underlying population. The Sun sits in the G class at 7.6 percent of stars and is in roughly the top 8 percent by mass, more massive than about 92 percent of stars, so calling it ordinary is wrong in a measurable way. The population you find is not the population that exists, and the difference is systematic, the same failure mode as albedo bias in asteroid surveys and detectability bias in the exoplanet census."}, {"id": "q6", "type": "open", "prompt": "The spectral sequence needs a second coordinate beyond temperature. Explain how two stars of identical spectral type (both G2, about 5,772 K) can differ in luminosity by a factor of ten thousand, how the difference is read from the spectrum, and what the MK luminosity classes encode. Explain why this second axis makes spectroscopic parallax possible and what it requires that geometric parallax does not.", "rubric": "A strong answer explains that luminosity depends on radius as well as temperature, through L equals 4 pi R squared sigma T to the fourth, so at fixed temperature a factor of ten thousand in luminosity is a factor of one hundred in radius: one star is a main-sequence dwarf like the Sun and the other a giant with an enormously extended envelope, so temperature alone does not locate a star. It must explain that the difference is read from line width via pressure broadening: a giant has low surface gravity and a tenuous, low-pressure photosphere where absorbing atoms are rarely perturbed by neighbours, giving sharp narrow lines, whereas a dense main-sequence photosphere perturbs the atoms constantly and smears the absorption over a range of wavelengths, giving broad lines, so narrow lines mean a low-density photosphere and therefore a large star. It should note that the line width actually measures surface gravity (g equals G M over R squared), and radius follows only once a mass is supplied, so spectroscopy gives a class rather than a size directly. It should describe the MK luminosity classes in Roman numerals: I supergiant (Betelgeuse, Rigel), II bright giant, III giant (Aldebaran, Arcturus), IV subgiant, V main sequence or dwarf (the Sun is G2 V, Sirius A1 V), plus subdwarfs and D for white dwarfs (Sirius B). Credit the point that Antonia Maury recorded exactly this line-width parameter in the 1890s and Pickering dismissed it, and Hertzsprung used it. On spectroscopic parallax it should give three steps: classify the star in both dimensions, read its intrinsic luminosity from its position on the H-R diagram, and compare with observed brightness using the inverse-square law to get distance. Full credit requires stating that the one thing it needs that geometric parallax does not is a calibrated H-R diagram, a prior sample of stars whose distances are already known by geometry, so it is a ladder rung that inherits every systematic error in the calibration below it rather than an independent measurement."}, {"id": "q7", "type": "open", "prompt": "A recurring failure mode links the Harvard classifiers' inability to interpret their own sequence for 25 years, the pre-1925 belief that stars were made of rock and metal, and the fact that the Sun is often called an ordinary star. Name the failure mode, explain how it operates in each case with the relevant numbers, and state the general principle a reader should carry away.", "rubric": "A strong answer identifies the single failure mode as confusing what is present with what is detectable, or equivalently mistaking a temperature-dependent detectability for an abundance. Case one, the spectral sequence: the Harvard classifiers assumed line strength tracked the amount of an element, so they could not explain why hydrogen Balmer lines peak in the middle of the sequence at A stars around 9,500 K rather than tracking hydrogen abundance; the resolution is that the visible lines require atoms excited to n equals 2 (costing 10.2 eV, populated per the Boltzmann distribution, only about one atom in two hundred million at the Sun) while above 10,000 K hydrogen ionises per the Saha equation, so the product peaks at intermediate temperature. Case two, composition: the establishment read the strong calcium, sodium and iron lines in the visible solar spectrum as showing stars are mostly metals with terrestrial composition, but metals are easy to excite and ionise while hydrogen is hard to lift to n equals 2, so correcting for the physics inverts the abundances by a factor of order a million and shows stars are overwhelmingly hydrogen and helium, as Payne found in 1925. Case three, the catalogue: a brightness-limited or naked-eye sample over-represents rare luminous stars (Malmquist bias), so although M dwarfs are 76.5 percent of stars they are 0.9 percent of the light and none is naked-eye visible, while B stars at 0.13 percent give 76.6 percent of the light; the Sun sits in the top 8 percent by mass, so ordinary is wrong in a measurable way. The general principle: the strength of a feature, or the visibility of an object, measures detectability under the observing conditions, not the underlying quantity, so the population you find is not the population that exists. Credit naming parallels elsewhere such as the C-type asteroid albedo bias, the Planet Nine clustering claim, and exoplanet detectability bias, and credit the observation that a correct empirical classification (Cannon's ordering) can still precede its physical explanation by decades."}]$astroSpec_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/hr-diagram/spectral-types', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
