-- Astronomy & Space · Stellar Death — Supernovae —
-- "Type Ia Supernovae". Curated master for
-- astronomy-and-space/stellar-death/supernovae/type-ia
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (position 0 in the Supernovae block),
-- so this change is content-only: no seed edit rides with it.
--
-- The standard bomb: how a spectral accident of classification (no
-- hydrogen, strong silicon) turned out to select a single physical event —
-- a carbon-oxygen white dwarf destroyed at the Chandrasekhar threshold;
-- the century of simmering, the turbulent flame, and the
-- deflagration-to-detonation uncertainty at the heart of every model; a
-- light curve that is not starlight at all but the radioactive clock of
-- half a solar mass of nickel-56 (6.1-day and 77-day half-lives read
-- directly off the decline); the Phillips relation turning a
-- nearly-standard candle into a genuinely standardisable one; the 1998
-- discovery of cosmic acceleration and dark energy; the progenitor
-- problem inherited from the Novae chapter (single- vs double-degenerate
-- vs sub-Chandrasekhar double detonation, with SN 2011fe and the empty
-- remnant searches as evidence); the iron ledger - two-thirds of the
-- universe's iron from these bombs, with the alpha/Fe knee as a galactic
-- clock; historical remnants typed centuries later by their own light
-- echoes; and the open discomfort of doing percent-level cosmology with
-- an explosion whose progenitor is unidentified. ~10,000 words, with a
-- ```checkpoint self-test at every key learning point.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-death/supernovae/type-ia',
    'research',
    'advanced',
    'read',
    $astroTypeIa_master$> A **Type Ia supernova** is the complete thermonuclear destruction of a white dwarf: a carbon–oxygen stellar corpse, pushed to its Chandrasekhar threshold, ignites and detonates — no remnant, no survivor, half a solar mass of freshly made radioactive nickel flung into space at ten thousand kilometres per second. Because the bomb's yield is set by a universal mass limit, its brightness is nearly uniform — which made it the measuring instrument that discovered the acceleration of the universe.

The Novae chapter ended with a ledger: accreting white dwarfs that erode versus accreting white dwarfs that grow, and a ceiling at 1.4 $M_\odot$ with something waiting at the top. This chapter is what waits.

It is the block's violent counterpart to everything the quiet chapters built. The white dwarf assembled over ten billion years — its C/O mix fixed by helium burning's sub-threshold states, its mass by the AGB's race of ash against wind, its rigidity by quantum statistics — is disassembled in **about one second**. The event outshines its host galaxy for weeks; its debris seeds the next stellar generation with most of the iron the universe owns; and its near-uniformity, corrected by one empirical trick, turned dying stars into rulers precise enough to weigh the cosmos — and to start the great cosmological argument of the present era.

Three numbers to carry through:

| Quantity | Value | Meaning |
|---|---|---|
| Energy released | ~10⁴⁴ J | the binding energy of a star, delivered in ~1 s |
| ⁵⁶Ni synthesised | **~0.6 $M_\odot$** | the radioactive battery that *is* the light curve |
| Peak luminosity | ~5 × 10⁹ $L_\odot$ | a galaxy's worth of light from one dead star |

And one organising irony: the class was defined by what its spectrum *lacks* — and the lack turned out to be the physics.

## A taxonomy that accidentally worked

Supernova classification is a fossil of 1940s spectroscopy, and its survival is one of astronomy's luckier accidents.

When Rudolph Minkowski began sorting supernova spectra in 1941, he split them on the simplest available criterion: **Type I** showed **no hydrogen lines**; Type II showed them. It was pure phenomenology — a filing system, not a theory. Later refinement subdivided Type I by the next most obvious features: **Ia** for a deep absorption trough of **ionised silicon** near maximum light, Ib/Ic for spectra with neither hydrogen nor that silicon signature.

The luck is that this spectral bookkeeping, drawn with no physical understanding, **carved the phenomenon at a true joint**. Type II (and, it turns out, Ib and Ic — hydrogen-stripped variants) are the deaths of *massive* stars, the next chapter's subject. Type Ia is something else entirely — and the spectrum announces it twice over:

**No hydrogen** — yet hydrogen is the universe's default substance, the outermost layer of every ordinary star. An explosion with *no hydrogen at all* must come from an object that lost or burned every gram of it long before dying. The block knows exactly one such object intimately: a **white dwarf**, hydrogen reduced to a 10⁻⁴ veneer or less.

**Strong silicon** — silicon is what carbon and oxygen become when burned *partially*: the ash of a thermonuclear flame that processed C/O fuel but did not everywhere run to iron. Silicon in the spectrum is the smoking residue of **carbon–oxygen fuel, incompletely burned** — a white dwarf's substance, mid-detonation.

{{image: SN 1994D | SN 1994D on the outskirts of galaxy NGC 4526: for weeks, one dead star rivals the combined light of a hundred billion living ones. The spectrum showed no hydrogen and deep silicon — a white dwarf's substance, caught mid-detonation — and the light itself was not the explosion but the radioactive afterglow of half a solar mass of freshly minted nickel.}}

Two further fingerprints seal the identification. Type Ia's occur in **all galaxy types** — including ancient ellipticals with no young stars — so the progenitor must be a member of *old* populations: no massive star qualifies; a white dwarf in an aged binary does. And their **uniformity** (the next sections' engine) whispers the same: events triggered at a *universal threshold* should look alike; deaths of stars spanning 8–100 $M_\odot$ should not.

*(The Ib/Ic clarification took decades — early "Type I" samples mixed the true thermonuclear Ia's with stripped-envelope core collapses, muddying the uniformity. The modern silicon criterion is what purified the standard-candle class.)*

```checkpoint
q: The two defining spectral features of a Type Ia supernova — no hydrogen, strong silicon — point to a white dwarf progenitor because
a: white dwarfs are the only stars hot enough to ionise silicon
a*: only a white dwarf has shed every trace of hydrogen, and silicon is precisely the ash of partially burned carbon–oxygen fuel
a: silicon is the main constituent of white dwarf interiors
a: hydrogen would be invisible at supernova temperatures anyway
hint: What object has no hydrogen left to show — and what does a thermonuclear flame make when it burns C/O only partway to iron?
why: The absence identifies the corpse (nothing else in astronomy is so hydrogen-free), and the silicon identifies the fuel caught mid-burn. Add the demographics — Ia's erupt even in ancient ellipticals where massive stars are extinct — and the 1941 filing system turns out to have carved a true physical joint.
```

## One second: the anatomy of the bomb

Now assemble the explosion the whole block has been arming.

**The approach.** However the mass arrives (the contested part — later section), a C/O white dwarf nearing 1.4 $M_\odot$ contracts, and its centre compresses toward carbon ignition. The block's oldest theme then plays its final variation: the fuel sits in **totally degenerate** matter. Pressure will not answer temperature. When carbon fusion finally lights, there is no expansion, no cooling, no brake — the thermostat is not merely broken but irrelevant, and this time the fuel is not a surface layer or a shell but **the entire star**.

**The simmer.** Ignition is not instant drama. For roughly a **century** the core "simmers" — convective carbon burning, slowly escalating, the star's last internal weather — until some hottest plume tips into runaway. (That the bomb spends a hundred years fizzing and one second exploding is a detail models must care about deeply: the simmering sets where, and at how many points, the flame is born.)

**The flame.** What ignites is a **subsonic flame** — a *deflagration* — a burning front thinner than a millimetre, crawling outward at kilometres per second through a star ten thousand kilometres across. Left alone it is far too slow: the star would expand and quench it, yielding a fizzle. What saves the explosion is **turbulence** — buoyant hot ash rising through cold fuel shreds the flame surface (Rayleigh–Taylor instability), wrinkling and multiplying its area until burning accelerates a thousandfold. For a fraction of a second, the interior of the white dwarf is the most violent turbulent combustion chamber in nature — and its physics is, embarrassingly and fascinatingly, the physics of **engine knock and industrial explosions**, imported from terrestrial combustion engineering at stellar scale.

**The transition.** In the best-fitting models, the churning deflagration then jumps the sonic barrier: somewhere in the turbulent froth, burning goes **supersonic** — a *detonation* — and a shock-driven burn sweeps the remaining fuel in tenths of a second. This **deflagration-to-detonation transition (DDT)** matches observed yields beautifully and is the field's standing embarrassment: whether and where turbulence triggers detonation is not derivable from first principles (it is imperfectly understood even in laboratory tubes), so the heart of the standard model contains a tuned switch. Every simulated Ia carries an engineering parameter where its trigger should be.

**The disassembly.** The energy ledger closes brutally. Burning ~1.4 $M_\odot$ of C/O toward iron-group elements releases ~1.5 × 10⁴⁴ J; the star's gravitational binding is a mere ~5 × 10⁴³ J. Fusion wins by a factor of three: **the star is not damaged but abolished** — accelerated to a homologous cloud expanding at ~10⁴ km/s, its inner regions burned to iron-group ash (chiefly **⁵⁶Ni**, the flame's natural endpoint in degenerate matter), its outer regions to the intermediate silicon–sulfur–calcium the spectrum shows, with a skin of unburned C/O. **No neutron star, no black hole, no survivor: the only stellar death that leaves nothing bound behind.**

```checkpoint
q: A Type Ia explosion destroys the entire white dwarf — unlike a nova, which the star survives — because
a: the Chandrasekhar-mass dwarf's gravity is too weak to hold any ejecta
a: the companion star's collision disrupts the dwarf
a*: the fuel is the whole degenerate star, and burning ~1.4 M☉ of C/O releases about three times the star's gravitational binding energy
a: the explosion ignites the companion as well
hint: Compare the two ledgers: a nova burns a 10⁻⁵ M☉ surface layer; this burns everything. Fusion yield versus binding energy — who wins?
why: ~1.5 × 10⁴⁴ J of fusion against ~5 × 10⁴³ J of binding: the star is unbound threefold over, converted in ~1 second into a 10⁴ km/s cloud of freshly synthesised elements. Same broken thermostat as the nova — but with the entire star as the charge, there is nothing left to reload.
```

## The light is a radioactive clock

Here is the chapter's most elegant single fact: **the supernova you see is not the explosion.**

The fireball's own heat is spent within minutes — adiabatic expansion at 10⁴ km/s cools the debris with brutal efficiency, and by rights the event should go dark almost immediately. Instead the light *rises* for nearly three weeks and then declines for years. The power source was identified in the 1960s (Truran; Colgate & McKee), and it is nuclear physics of textbook cleanliness:

$$^{56}\text{Ni} \xrightarrow{\ t_{1/2} = 6.1\ \text{d}\ } {}^{56}\text{Co} \xrightarrow{\ t_{1/2} = 77\ \text{d}\ } {}^{56}\text{Fe}.$$

The flame's main product, ~0.6 $M_\odot$ of ⁵⁶Ni, is a **radioactive battery** salted through the ejecta. Its decay gamma-rays and positrons thermalise in the expanding cloud and leak out as optical light. Every feature of the light curve reads off the decay chain:

- **The rise (~19 days)**: the ejecta, initially opaque, must thin enough for the deposited decay heat to diffuse out; the peak marks the crossover.
- **The peak luminosity** is, to a good approximation, the **instantaneous nickel decay power** — so peak brightness *measures the nickel mass*. A number on a light curve is a mass on a nuclear scale.
- **The long tail** declines at almost exactly the **77-day cobalt half-life's** slope (steepened slightly as the thinning ejecta let more gamma-rays escape unthermalised). For months, observers watch a nuclear decay curve drawn across the sky in galaxy-outshining light.
- **The late spectra** seal it: as the ejecta go transparent, emission features of **cobalt** fade in lockstep with **iron's** growth — element transmutation, watched live across weeks.

Pause on what this means: **Type Ia supernovae are the only astronomical objects whose luminosity is powered by radioactivity** rather than fusion, gravity, or leftover heat — and the block's iron punchline is already visible. That ⁵⁶Fe endpoint is not incidental ash; it is *the* iron — the reason the universe's most abundant heavy element is number 26. The chapter returns to the ledger below.

```checkpoint
q: Weeks after the ~1-second explosion, a Type Ia still shines with the light of billions of Suns. The power source is
a: leftover heat from the thermonuclear flame, slowly leaking out
a: the shock of ejecta ploughing into interstellar gas
a*: the radioactive decay chain ⁵⁶Ni → ⁵⁶Co → ⁵⁶Fe (6.1-day and 77-day half-lives), whose gamma-rays and positrons thermalise in the expanding debris
a: nuclear burning continuing in the densest clumps
hint: The fireball's own heat dies with expansion in minutes — yet the decline slope for months matches a specific nuclear half-life. Whose?
why: Half a solar mass of freshly made ⁵⁶Ni is a battery salted through the ejecta: peak brightness measures the nickel mass, the tail tracks cobalt's 77-day half-life, and late spectra show cobalt lines fading as iron's grow — transmutation watched in real time. The display is radioactivity, not the explosion itself.
```

## Standardisable: the Phillips relation

The bomb's uniformity is the cosmological treasure — and its honest imperfection, plus the fix, is the real story.

The naive argument was always attractive: every Ia fires at the same 1.4 $M_\odot$ threshold, so every Ia should make similar nickel and reach similar peak brightness — a **standard candle** by construction. Reality is close but not obedient: measured peaks scatter over roughly a **factor of three** — useless for percent-level cosmology and, uncorrected, fatal to it.

The rescue, published by Mark Phillips in 1993 from painstaking nearby light curves, is a one-parameter miracle: **brighter Ia's decline more slowly.** Plot peak luminosity against the drop in the 15 days after maximum ($\Delta m_{15}$) and the scatter collapses onto a tight sequence. The physics cooperates fully: a more energetic event makes **more nickel** (brighter) *and* more iron-group opacity, which traps the radioactive heat longer (**slower fade**). One underlying number — the nickel yield — moves both observables together, so either one calibrates the other.

Measure a light curve's *shape*, which costs no distance information, and you correct its *peak* to a calibrated standard — turning a factor-of-three scatter into **~7% distance precision** per event. The class is not a standard candle; it is a **standardisable** one, which for cosmology is every bit as good. (Modern fitters add a colour/dust correction and, at the percent frontier, host-galaxy terms — refinements that will matter again at this chapter's end.)

```checkpoint
q: The Phillips relation rescued Type Ia cosmology by exploiting the fact that intrinsically brighter events
a: occur only in younger galaxies, which can be identified independently
a: expand faster, blueshifting their spectra measurably
a*: decline more slowly after peak — more nickel means both more light and more heat-trapping opacity — so the light curve's shape calibrates its true peak
a: always occur in pairs, allowing cross-calibration
hint: One number — the nickel mass — controls two observables. Which second observable costs nothing to measure from any distance?
why: More ⁵⁶Ni brightens the peak AND thickens the iron-group opacity that slows the fade: shape and luminosity are locked together. Measuring Δm₁₅ (distance-free) corrects each event's peak, collapsing 3× scatter to ~7% distances — a standardisable candle, which is all cosmology needs.
```

## 1998: the candles weigh the universe

What the standardised bombs found, when pointed at the deep universe, rearranged physics.

The programme was audacity itself: use the Phillips-corrected Ia's — visible across billions of light-years — to measure how cosmic expansion has *changed over time*. Distant supernovae show the expansion rate of the universe when their light left; nearby ones show it now; the comparison reads the universe's deceleration, expected to be set by how much matter is braking the expansion. Two rival teams — the High-z Supernova Search (Riess, Schmidt) and the Supernova Cosmology Project (Perlmutter) — spent the 1990s industrialising discovery (wide CCD searches, scheduled follow-up) to build the samples.

Both teams found the same *wrong* answer. The distant supernovae were **too faint** — 10–25% dimmer than any decelerating universe allowed. At the measured redshifts, they sat *farther away* than deceleration permitted: the expansion has **not** been slowing. It is **accelerating.**

Every mundane escape was hunted and cornered. Grey dust dimming without reddening? The Hubble Space Telescope's z > 1 supernovae showed the faint-ward trend *reversing* at the highest redshifts — exactly the fingerprint of early deceleration giving way to late acceleration, which no dust screen mimics. Evolution of the bombs themselves? Nearby and distant spectra and light-curve families match in detail. Within a few years the community capitulated to the data, and the 2011 Nobel Prize ratified it.

Acceleration requires the universe's energy budget to be dominated — about **70%** — by something with negative pressure: **dark energy**, indistinguishable so far from Einstein's cosmological constant, resurrected from the theory's attic where he had famously discarded it. Two-thirds of everything, discovered by exploding white dwarfs.

Sit with the block's perspective for a moment. The chain of custody runs: sub-threshold nuclear levels set C/O ratios → degenerate matter sets a universal mass ceiling → the ceiling standardises a bomb → the bomb's radioactive battery makes it visible across cosmic time → its calibrated brightness reveals the universe's fate. **The largest discovery in modern cosmology is a corollary of stellar death.** And the same candles remain load-bearing today, anchoring one arm of the Hubble-tension fight (via the Cepheid and TRGB calibrations of earlier chapters), where percent-level systematics — hence progenitors, hence the next section — are now the battleground.

```checkpoint
q: The 1998 supernova teams concluded the universe's expansion is accelerating because distant Type Ia's were
a: brighter than expected, implying they were closer than a decelerating universe allows
a*: fainter than expected — farther away than any decelerating universe permits, with the highest-redshift events reversing the trend exactly as early deceleration giving way to acceleration predicts
a: redshifted more than their distances implied
a: absent entirely beyond a certain distance
hint: In a decelerating universe, a given redshift corresponds to a nearer (hence brighter) supernova. The data showed the opposite — and dust can't explain the high-z reversal.
why: 10–25% too faint at moderate redshift, with the deviation turning around beyond z ~ 1 (the early universe DID decelerate) — a signature no dust or evolution mimics. The fix requires ~70% dark energy with negative pressure: the universe's dominant component, discovered by standardised dead stars.
```

## The embarrassment: nobody has seen the gun

Now the inheritance from the Novae chapter, sharpened by two decades of null results: cosmology's premier ruler is an explosion whose **progenitor system has never been identified.**

The candidate lineup, updated to the modern state of play:

**Single-degenerate (SD)** — the Novae chapter's accretors, ratcheted to the limit. *For it:* natural uniformity (one threshold). *Against it, and mounting:* the missing survivors — the donor star should outlive the explosion, yet searches of the nearest remnants (Tycho's, Kepler's, SNR 0509-67.5 in the LMC) find **no viable ex-companion**, with the LMC case excluding essentially all non-degenerate donors; the missing X-rays — populations of steadily nuclear-burning accretors should glow collectively in soft X-rays, and elliptical-galaxy budgets fall an order of magnitude short; and the missing hydrogen — the donor's wind and stripped envelope should contaminate the spectrum, and normal Ia's are hydrogen-clean to stringent limits.

**Double-degenerate (DD)** — two white dwarfs, orbit decayed by gravitational radiation, merging past the limit. *For it:* no survivor, no X-ray glow, no hydrogen — every SD embarrassment vanishes — and binary surveys count enough merging pairs. *Against it:* total merged masses vary, so where does the uniformity come from? — and simulations still dispute whether mergers reliably detonate rather than collapsing to a neutron star.

**Sub-Chandrasekhar double detonation** — the modern insurgent. A dwarf *below* the limit accretes a thin **helium** shell; the shell detonates (helium's flash physics, one last encore), and the converging shock **ignites the C/O core from outside** — no 1.4 $M_\odot$ required. *For it:* it explodes robustly in 3D simulations without a tuned DDT switch; yields track the (variable) core mass, neatly explaining the *Phillips sequence itself* as a mass sequence; and manganese — an element whose synthesis demands the high densities unique to near-Chandrasekhar burning — is underproduced in a way that matches some observed abundance patterns and remnant spectra. *Against it:* the first helium detonation should leave ash signatures (titanium, chromium) at the surface that normal events show only marginally.

The two sharpest single-object constraints frame the stakes. **SN 2011fe** (2011, in M101, caught within hours of ignition): the early light curve caps the progenitor's radius at ≲ 0.1 $R_\odot$ — *directly confirming a compact white dwarf exploded* — while the absence of any companion-collision signature disfavours red-giant and most main-sequence donors. And **Tycho's remnant**, typed by its own centuries-delayed **light echo** in 2008 as a spectroscopically normal Ia, hosts no surviving donor to deep limits. The bomb is confirmed; the trigger is not.

The honest synthesis: **probably more than one channel operates** — with sub-Chandrasekhar detonations claiming a growing share of "normal" events, DD mergers contributing broadly, and SD relegated to a minority (perhaps supplying some peculiar subclasses). Which mixture, and whether it drifts across cosmic time, is precisely what percent-level cosmology needs to know — the discomfort the final section makes explicit.

```checkpoint
q: The searches inside Type Ia remnants like Tycho's and SNR 0509-67.5 for surviving donor stars matter because
a: finding the donor would let astronomers predict the next local supernova
a*: the single-degenerate channel REQUIRES a surviving companion — and finding none, to deep limits, pushes the events toward white-dwarf mergers or sub-Chandrasekhar detonations
a: donors are needed to explain where the ejecta's hydrogen went
a: a surviving donor would disprove the Chandrasekhar limit
hint: In an accretion scenario, the explosion destroys only one star. What should be left behind, conspicuously moving and heated, near the remnant's centre?
why: An SD donor survives — oddly fast, oddly hot, near the centre. Its absence in the nearest remnants (the LMC case excludes essentially all non-degenerate donors), plus missing accretor X-rays and hydrogen-clean spectra, has shifted the field toward DD mergers and helium-shell double detonations — leaving cosmology's ruler with an unidentified trigger.
```

## The iron ledger

Before the cosmological coda, the chemical one — because this chapter, not core collapse, is where the universe's iron chiefly comes from.

Each event ejects **~0.6 $M_\odot$ of iron** (once the nickel-cobalt chain completes) plus the silicon-group elements — and, integrated over cosmic history, Type Ia's supply roughly **two-thirds of the iron in the universe** (core-collapse events, despite their greater number, eject iron more stingily: most of theirs falls back or was never synthesised in comparable mass). The skillet, the haemoglobin, the planetary core: mostly the ash of exploded white dwarfs.

The delivery's *tardiness* is itself a measuring tool of galactic archaeology. A core-collapse supernova follows its massive star's birth within millions of years; a Ia requires first building a white dwarf and then arranging its destruction — a **delay of hundreds of millions to billions of years**. So young stellar systems are iron-poor but rich in the alpha elements (O, Mg, Si) that core collapses spray promptly; iron catches up only when the Ia's begin detonating. In any galaxy's stellar abundance record, the **[α/Fe] "knee"** — the metallicity at which iron begins gaining on the alphas — timestamps when Ia's switched on against how fast the galaxy formed stars. Chemical archaeologists read galactic histories from it routinely: the block's bombs, used as stratigraphic markers.

{{image: Tycho's Supernova | The remnant of Tycho's 1572 supernova in X-rays: the stratified silicon-to-iron anatomy of a thermonuclear burn, still expanding four and a half centuries on. In 2008 a light echo — the explosion's own light, arriving late off interstellar dust — delivered a maximum-light spectrum and typed the event as a normal Type Ia; the searches inside for a surviving donor star have come up empty.}}

And the remnants keep their own archives. Tycho's (1572 — the *stella nova* that opened the Novae chapter, now typed by light echo), Kepler's (1604), SN 1006 (the brightest stellar event in recorded history, chronicled from China to Switzerland): each is an expanding X-ray laboratory where the stratified silicon-to-iron anatomy of a thermonuclear burn can be imaged directly, checking the models element by element, century by century.

```checkpoint
q: The "[α/Fe] knee" in a galaxy's stellar abundances — where iron starts catching up to oxygen and magnesium — works as a clock because
a: alpha elements decay into iron over billions of years
a: iron forms only after a galaxy's gas cools below a threshold
a*: core-collapse supernovae deliver alpha elements promptly after star formation, while Type Ia iron arrives only after the hundreds-of-Myr-to-Gyr delay needed to build and detonate white dwarfs
a: the knee marks when a galaxy's first stars formed
hint: Two element factories with two different fuses — one fires within Myr of stellar birth, the other must first manufacture a corpse.
why: Early generations inherit alpha-rich, iron-poor gas (core collapse only); once the delayed Ia channel ignites, iron floods in and [α/Fe] bends. The knee's position dates the onset of Ia enrichment against the star-formation pace — galactic history read from the block's two kinds of bombs. And ~2/3 of all iron, cookware to haemoglobin, is Ia ash.
```

## The discomfort, stated plainly

Close the chapter the way the field actually lives it: with a magnificent instrument and an unresolved conscience.

The Type Ia is simultaneously (a) the best-calibrated distance tool in deep cosmology, validated empirically end to end — Phillips-standardised, cross-checked against Cepheids and the TRGB (both graduates of this block), consistent across thousands of events; and (b) **an explosion without an identified progenitor, whose central engine contains a tuned switch (the DDT), and whose channel mixture may evolve with cosmic time.** The parallel with the PNLF — a ruler that outperforms its theory — is exact, but the stakes are no longer a nearby galaxy's distance: they are the **dark-energy equation of state** and the **Hubble tension**, both argued at the few-percent level where progenitor demographics, metallicity drifts, and calibration systematics all live.

The working resolution is empirical vigilance: host-mass corrections, spectral-twin matching, sub-population splits, and — decisively, in time — the accumulating single-event forensics (early flash photometry à la 2011fe, remnant archaeology, gravitational-wave counts of double-dwarf binaries) that will eventually convict the progenitor(s). Until then, cosmology's sharpest ruler is wielded with documented, quantified, but not fully understood confidence — the recurring epistemic posture of this entire block, here carrying its heaviest load.

*(And one forward pointer: the sub-Chandrasekhar story means helium detonation physics — the flash of the block's first act — may be the actual trigger of its last. The block's next chapter leaves thermonuclear physics entirely: above ~8 $M_\odot$, cores do not stop at white dwarfs, and gravity, not fusion, writes the ending.)*

```checkpoint
q: The deepest current worry about Type Ia cosmology at the percent level is that
a: the Phillips relation has been shown to fail beyond redshift 1
a: nickel-56's half-life may differ in the early universe
a*: with the progenitor channel(s) unidentified and possibly a cosmic-time-evolving mixture, the standardisation could drift systematically in ways the empirical corrections might not fully capture
a: modern surveys find too few distant supernovae to use
hint: The candle is calibrated empirically on nearby events. What guarantees the same calibration applies nine billion years ago — and what fact about the progenitors blocks that guarantee?
why: A channel mix (SD/DD/sub-Chandrasekhar) that shifts with redshift or metallicity could bias standardised distances at exactly the few-percent level where dark energy's equation of state and the Hubble tension are contested. Empirical checks (host corrections, spectral twins) police it, but conviction of the progenitor is what would close the case — the block's ruler-without-a-theory pattern, at maximum stakes.
```

## Pulling the thread

- **A 1941 filing system carved a true joint**: no hydrogen (only a white dwarf is that clean) + strong silicon (partially burned C/O) + presence in ancient ellipticals = thermonuclear destruction of a white dwarf; Ib/Ic contamination's removal purified the standard-candle class.
- **The bomb**: a century of convective simmering; a millimetre-thin subsonic flame saved from fizzle by Rayleigh–Taylor turbulence (engine-knock physics at stellar scale); a deflagration-to-detonation transition that fits the data and lacks a first-principles trigger; ~1.5 × 10⁴⁴ J of fusion against 5 × 10⁴³ J of binding — **complete disassembly, no remnant**, the block's only survivor-less death.
- **The light is radioactivity**: ~0.6 $M_\odot$ of ⁵⁶Ni → ⁵⁶Co (6.1 d) → ⁵⁶Fe (77 d). Peak = nickel mass; tail = cobalt's half-life; late spectra swap cobalt lines for iron in real time. The only objects lit by decay.
- **Phillips 1993**: brighter declines slower (more Ni = more light *and* more opacity), collapsing 3× scatter to ~7% distances — **standardisable**, which suffices.
- **1998**: distant Ia's 10–25% too faint, high-z trend reversal killing the dust escape — the expansion **accelerates**; ~70% dark energy; Nobel 2011. Stellar death's chain of custody runs all the way to the fate of the universe.
- **The unidentified gun**: SD's missing survivors/X-rays/hydrogen (Tycho, SNR 0509-67.5), DD's uniformity-and-ignition doubts, and the rising **sub-Chandrasekhar double detonation** (helium shell triggers core; explains the Phillips sequence as a mass sequence; manganese as discriminant). SN 2011fe proved the corpse compact; nothing yet has convicted the trigger. Likely a mixture.
- **The iron ledger**: ~2/3 of cosmic iron is Ia ash; the delay-time offset against prompt alpha elements bends every galaxy's [α/Fe] at a knee that timestamps its history; the historical remnants (1006, 1572, 1604) are element-stratified X-ray checksums, one typed by its own light echo.
- **The stated discomfort**: percent-level cosmology on an explosion with a tuned switch and no confirmed progenitor — the PNLF pattern at civilisational stakes, policed empirically, awaiting conviction.

The transferable idea: the entire chapter — and the block it crowns — is a study in **thresholds as standardisers**. Events triggered at a universal limit inherit the limit's uniformity, and uniformity is measurement; but a standard whose *mechanism* is unidentified must be wielded with audited humility, because thresholds can hide mixtures. Wherever a measurement rests on "these events are all alike," ask *what enforces the alikeness* — and what happens to the ruler if more than one mechanism can reach the trigger.

## Further reading

The physics and the people are both well served: {{book: J. Craig Wheeler | Cosmic Catastrophes: Exploding Stars, Black Holes, and Mapping the Universe | 2007}} for the explosions, and {{book: Robert P. Kirshner | The Extravagant Universe | 2002}} for the acceleration discovery from inside one of the teams.

- **J. Craig Wheeler, *Cosmic Catastrophes: Exploding Stars, Black Holes, and Mapping the Universe* (2007).** A supernova theorist's guided tour — thermonuclear versus core-collapse mechanisms, flame physics, and the cosmological application, at serious-amateur depth.
- **Robert P. Kirshner, *The Extravagant Universe* (2002).** The High-z team from within: how standardisable candles were built, doubted, and finally believed into dark energy — a first-person history of the 1998 result.
- **Stuart L. Shapiro and Saul A. Teukolsky, *Black Holes, White Dwarfs, and Neutron Stars* (1983).** The block's compact-object text once more: the Chandrasekhar analysis underlying the threshold that makes the bomb standard.

Beyond the books: Phillips' 1993 *ApJ Letters* paper is four pages and founded precision supernova cosmology; Riess et al. 1998 and Perlmutter et al. 1999 are the discovery papers; Hillebrandt & Niemeyer's review is the standard door into explosion modelling; Maoz, Mannucci & Nelemans (2014, *ARA&A*) codifies the progenitor debate; and the SN 2011fe literature shows single-event forensics at its sharpest.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, 1 yr = 3.156 × 10⁷ s, 1 d = 86,400 s, c = 2.998 × 10⁸ m/s. C/O → Fe-group fusion yield ≈ 7 × 10¹³ J/kg. WD binding energy ≈ 5 × 10⁴³ J. ⁵⁶Ni: t½ = 6.1 d, decay energy 1.72 MeV; ⁵⁶Co: t½ = 77 d, 4.57 MeV total (1 MeV = 1.602 × 10⁻¹³ J; ⁵⁶ nucleon mass ≈ 9.3 × 10⁻²⁶ kg). Ejecta speed ~10⁴ km/s. Phillips: brighter ⇔ slower decline; standardised precision ~7%. Distance modulus $m - M = 5\log_{10}(d/10\,\text{pc})$; standardised Ia peak $M_B \approx -19.3$.*

### 1 — The energy ledger
**(a)** Compute the energy released by burning 1.4 $M_\odot$ of C/O to iron-group elements.
**(b)** Compare with the white dwarf's binding energy and compute the ratio.
**(c)** The ejecta (1.4 $M_\odot$) move at 10⁴ km/s. Compute their kinetic energy and check consistency: fusion output minus binding should be of this order.
**(d)** Contrast with the nova's ledger (10⁴⁰ J, star survives) in one sentence each on fuel mass and outcome.

### 2 — The radioactive clock
**(a)** How many ⁵⁶Ni nuclei are in 0.6 $M_\odot$?
**(b)** Compute the initial nickel decay power: $P = \lambda N E$ with $\lambda = \ln 2/t_{1/2}$ and E = 1.72 MeV per decay. Express in $L_\odot$.
**(c)** After 100 days, essentially all Ni is Co and the cobalt is decaying. Compute the surviving Co fraction at t = 100 d (from an initial 0.6 $M_\odot$ formed at t = 0 via the 6.1 d step — approximate by pure ⁵⁶Co decay from ~t = 20 d) and the corresponding power.
**(d)** Explain why the observed late decline can be *steeper* than 77 d/ln2 would predict.
**(e)** State the two spectroscopic observations that confirm the chain in real time.

### 3 — The flame
**(a)** Explain why an unaided deflagration fizzles: what does the star do while the flame crawls?
**(b)** Explain how Rayleigh–Taylor turbulence rescues the burn.
**(c)** State what the DDT is, why models need it, and why it is an embarrassment.
**(d)** A flame at 100 km/s must cross ~2,000 km of core. Compare that time with the star's expansion timescale R/v for R = 2,000 km, v(sound) ≈ 5,000 km/s, and conclude why speed matters.

### 4 — Standardisation
**(a)** Explain the physical chain from nickel mass to both peak luminosity and decline rate.
**(b)** Two Ia's have Δm₁₅ = 0.9 and 1.7. Which peaked brighter, and which made more nickel?
**(c)** A standardised Ia is observed at m_B = 24.7. With M_B = −19.3, compute its distance in Mpc.
**(d)** At 7% distance precision per event, how many independent events reduce the *statistical* distance error to 1%? What error type does averaging not reduce?
**(e)** Why is "standardisable" as good as "standard" for cosmology?

### 5 — 1998
**(a)** State the observable that signalled acceleration, with its approximate size.
**(b)** Explain how z > 1 supernovae dispatched the grey-dust alternative.
**(c)** Compute the lookback fraction: a z ≈ 0.5 Ia exploded when the universe was roughly 2/3 its current age. What is being compared between then and now?
**(d)** State what energy budget the result demands, and the historical irony attached to its simplest candidate.
**(e)** Name the two block-chapter candles that calibrate the Ia ladder's first rung, and the current tension they feed.

### 6 — The progenitor courtroom
**(a)** For each channel — SD, DD, sub-Chandrasekhar — give the single strongest supporting fact and the single strongest objection.
**(b)** Explain what SN 2011fe's early light curve proved, and how.
**(c)** Explain the logic of remnant companion searches and the strongest null result.
**(d)** Explain why manganese abundances discriminate near- versus sub-Chandrasekhar burning.
**(e)** Explain why the sub-Chandrasekhar channel naturally produces a Phillips-like sequence.

### 7 — The iron ledger
**(a)** One Ia ejects 0.6 $M_\odot$ of (eventual) iron. At a galactic rate of 1 per 200 years over 10 Gyr, how much Ia iron does a galaxy accumulate?
**(b)** Explain the [α/Fe] knee and what two quantities its position trades off.
**(c)** A dwarf galaxy formed all its stars in its first Gyr. Predict its stars' [α/Fe] pattern.
**(d)** Explain how Tycho's remnant was spectroscopically typed 436 years after the event.

### 8 — Numerical
**(a)** Peak luminosity 5 × 10⁹ $L_\odot$: compute the peak absolute magnitude from $M = M_\odot^{bol} - 2.5\log_{10}(L/L_\odot)$ with $M_\odot^{bol} = 4.74$, and compare with −19.3.
**(b)** Ejecta at 10⁴ km/s for 400 years: compute the free-expansion remnant radius in light-years, compare with Tycho's measured ~4 ly, and interpret the difference.
**(c)** Compute the recession redshift at which a Ia appears at m_B = 24.7 using your distance from 4(c) and Hubble's law with H₀ = 70 km/s/Mpc (low-z approximation), and comment on its validity.
**(d)** SN 1006 reached apparent magnitude ≈ −7.5. With M_B = −19.3, compute its distance and compare with the measured ~7,000 ly.

### 9 — Open problem: a tuned switch at the heart of cosmology
**(a)** State precisely what is tuned in near-Chandrasekhar models and why first-principles derivation fails.
**(b)** Explain how the sub-Chandrasekhar channel evades the DDT — and what new uncertainty it introduces instead.
**(c)** Design the observational programme most likely to convict the progenitor mixture within a decade (early-time photometry, remnants, gravitational waves, manganese) and justify each element.
**(d)** Quantify the stakes: how would a 2% redshift-dependent drift in standardised magnitudes propagate into dark-energy inference?
**(e)** Compare this chapter's epistemic posture with the PNLF's, and state the general principle both illustrate.

## Worked answers

### 1 — The energy ledger

**(a)** $E = 1.4 \times 1.989\times10^{30} \times 7\times10^{13} = 2.78\times10^{30} \times 7\times10^{13} = \mathbf{1.9\times10^{44}\ J}$.

**(b)** $1.9\times10^{44}/5\times10^{43} \approx \mathbf{4}$ — fusion overpays the star's binding roughly fourfold: unbinding is guaranteed, with change left over for kinetic energy.

**(c)** $E_K = \tfrac12 \times 2.78\times10^{30} \times (10^{7})^2 = \mathbf{1.4\times10^{44}\ J}$ — indeed ≈ (a) − binding: the ledger closes, with most of the fusion yield emerging as bulk motion.

**(d)** Nova: ~10⁻⁵–10⁻⁴ $M_\odot$ of *surface* fuel; the star survives to reload. Ia: the *entire* 1.4 $M_\odot$ star is the charge; nothing survives to try again.

### 2 — The radioactive clock

**(a)** $N = 0.6 \times 1.989\times10^{30}/9.3\times10^{-26} = 1.193\times10^{30}/9.3\times10^{-26} = \mathbf{1.28\times10^{55}}$ nuclei.

**(b)** $\lambda = \ln 2/(6.1 \times 86{,}400) = 0.693/5.27\times10^{5} = 1.315\times10^{-6}$ s⁻¹. $P = \lambda N E = 1.315\times10^{-6} \times 1.28\times10^{55} \times 1.72 \times 1.602\times10^{-13} = 1.315\times10^{-6} \times 1.28\times10^{55} \times 2.755\times10^{-13} = \mathbf{4.6\times10^{36}\ W} = \mathbf{1.2\times10^{10}\ L_\odot}$ — ten billion Suns of pure decay power at the start, in comfortable agreement with observed peaks (a portion is lost to escaping gamma-rays and expansion work).

**(c)** From ~t = 20 d as Co: surviving fraction at 100 d $= 2^{-(80/77)} = 2^{-1.04} = \mathbf{0.49}$. Power scales with $\lambda_{\text{Co}}N$: $\lambda_{\text{Co}} = 0.693/(77\times86{,}400) = 1.04\times10^{-7}$ s⁻¹; $P = 1.04\times10^{-7} \times (0.49 \times 1.28\times10^{55}) \times 4.57\times1.602\times10^{-13} = \mathbf{4.8\times10^{35}\ W} \approx 1.2\times10^{9}\,L_\odot$ — still a billion Suns at day 100, on cobalt alone.

**(d)** As the ejecta thin, an increasing fraction of decay gamma-rays escapes *without* depositing energy (and only the positron channel deposits fully): the optical light then declines faster than the raw half-life slope, exactly as observed.

**(e)** The late-time (nebular) spectra show **cobalt emission features weakening in step with iron features strengthening** over weeks — transmutation directly witnessed — and the light curve's tail slope matches the 77-day chain. Together: the battery's chemistry, read twice independently.

### 3 — The flame

**(a)** A subsonic flame gives the star time to respond: the released heat raises pressure ahead of the front, the star expands, density falls, and burning at low density both slows and produces less nickel — the event quenches toward a feeble, iron-poor fizzle inconsistent with observed Ia's.

**(b)** Hot burned ash below cold dense fuel is buoyantly unstable: rising plumes stretch and wrinkle the flame surface, and turbulence cascades that wrinkling to small scales, multiplying flame area enormously. Burning rate ∝ area: the crawl becomes a churn fast enough to matter — combustion engineering's flame-turbulence interaction, on a 10⁴ km chassis.

**(c)** The DDT is the assumed jump from turbulent subsonic burning to a supersonic detonation partway through the event; models need it because pure deflagrations underburn (too little Ni, unburned core fuel) while pure prompt detonations overburn (all iron, no silicon — contradicting spectra). It embarrasses because no first-principles criterion for turbulence-triggered detonation exists even terrestrially: the transition density is a dial set to match observations.

**(d)** Crossing time $2\times10^{6}\ \text{m}/10^{5}\ \text{m/s} = 20$ s; expansion time $2\times10^{6}/5\times10^{6} = 0.4$ s. The star rearranges itself fifty times faster than the flame walks: without turbulent acceleration (or detonation), the fuel decompresses long before the front arrives — speed is not a detail but the difference between bomb and fizzle.

### 4 — Standardisation

**(a)** Nickel mass sets the radioactive power (peak brightness) and, being iron-group, dominates the ejecta opacity: more Ni traps heat longer, stretching the light curve. One parameter drives both observables in lockstep — the correlation Phillips measured.

**(b)** Δm₁₅ = 0.9 (slower decline) is the **brighter** event with **more nickel**; 1.7 is the fast-fading, nickel-poor one.

**(c)** $m - M = 24.7 + 19.3 = 44.0$; $d = 10^{(44.0/5)+1}$ pc $= 10^{9.8}$ pc $= \mathbf{6.3\times10^{3}\ Mpc}$ — 6.3 Gpc, deep cosmological range.

**(d)** $N = (7\%/1\%)^2 = \mathbf{49}$ events. Averaging beats statistical scatter but **not systematic** error — calibration offsets, dust laws, progenitor drift hit every event coherently, which is why the progenitor problem, not photon statistics, bounds modern precision.

**(e)** Cosmology needs *knowable* luminosities, not identical ones: a one-parameter family whose parameter is measurable from the (distance-free) light-curve shape delivers exactly that. Corrected, the family collapses to an effective standard — the correction, not the uniformity, is what must be trusted.

### 5 — 1998

**(a)** Standardised distant Ia's appeared **10–25% fainter** than any matter-decelerated expansion allows at their redshifts.

**(b)** Any dimming screen accumulates with path length: dust makes *higher*-z events *ever fainter* relative to models. The measured deviation instead **reverses** beyond z ~ 1 — supernovae there sit *brighter* than the constant-deviation line — matching a universe that decelerated early and accelerated late. No screen mimics a sign change.

**(c)** The comparison is the **expansion rate then versus now**: each supernova's redshift records the integrated stretch since its light departed, and its standardised distance fixes how long that light travelled. Fainter-than-expected at fixed z means more travel time — an expansion that sped up after the light left.

**(d)** A component with strongly negative pressure comprising ~**70%** of the total: dark energy, whose simplest form is Einstein's cosmological constant Λ — the term he inserted to hold the universe static and reportedly repudiated as his greatest blunder, resurrected as the dominant ingredient of reality.

**(e)** **Cepheids** (Pulsation chapter) and the **TRGB** (Helium Flash chapter) both calibrate nearby Ia's; their few-percent disagreement propagates into the **Hubble tension**, with the Ia's carrying either calibration to cosmological depth.

### 6 — The progenitor courtroom

**(a)** **SD** — for: a single universal threshold elegantly explains uniformity; against: no surviving donors in the nearest remnants (with missing X-rays and hydrogen as corroborating absences). **DD** — for: every SD null is naturally expected (no survivor, no glow, no H), and merging pairs are counted in sufficient numbers; against: variable total masses undercut uniformity, and simulations dispute reliable detonation. **Sub-Chandrasekhar** — for: robust first-principles explosions (no DDT dial) whose mass-dependent yields reproduce the Phillips sequence; against: the helium-shell first detonation should imprint surface Ti/Cr ash beyond what normal events clearly show.

**(b)** Caught within ~hours, the earliest light rises as shocked surface layers cool: its faintness and rise shape cap the exploding object's radius at ≲ 0.1 $R_\odot$ — only a white dwarf is simultaneously that compact and that explodable. The corpse's identity was proven by how *little* early light there was.

**(c)** An SD donor survives the blast — heated, stripped, and flung at its former orbital speed — and must sit near the remnant centre as a kinematic outlier. Searches: Tycho's candidate ("Tycho G") remains disputed at best; **SNR 0509-67.5** (LMC) shows *no* star to limits excluding essentially all non-degenerate donors — the cleanest single verdict against SD for that event.

**(d)** Stable manganese (⁵⁵Mn) is produced in normal freeze-out at the **highest densities** — conditions reached only near the Chandrasekhar mass; sub-M_ch burning at lower density underproduces it. Solar-neighbourhood Mn/Fe and remnant X-ray Mn lines thus vote on the mass distribution of past explosions; current readings suggest a *mixture*, with a substantial sub-M_ch share.

**(e)** With no universal threshold, the exploding core mass varies — and nickel yield tracks core mass tightly in the simulations. A spread of core masses therefore generates a one-parameter family from bright/slow (heavier) to faint/fast (lighter): the Phillips relation emerges as a **mass sequence**, arguably more naturally than SD explains its own residual scatter.

### 7 — The iron ledger

**(a)** Events: $10^{10}/200 = 5\times10^{7}$. Iron: $5\times10^{7} \times 0.6 = \mathbf{3\times10^{7}\ M_\odot}$ — tens of millions of solar masses of skillet iron per galaxy.

**(b)** Stars formed early inherit gas enriched only by prompt core-collapse ejecta: alpha-rich, iron-poor (high [α/Fe]). Once the delayed Ia channel switches on, iron pours in and [α/Fe] declines — the knee. Its position trades **star-formation speed** against the **Ia delay-time distribution**: fast-forming systems climb to high metallicity before the knee; slow ones bend early.

**(c)** All its stars predate significant Ia enrichment: uniformly **high [α/Fe] at all its (low) metallicities** — an alpha-plateau with no knee, the classic chemical signature actually observed in ultra-faint dwarfs.

**(d)** Light from the 1572 explosion, scattered toward Earth by interstellar dust clouds *behind* the remnant, arrives centuries late by the detour's extra path. In 2008 a spectrum of such a **light echo** — genuinely the supernova's own maximum-light spectrum, time-delivered — showed the silicon trough and features of a spectroscopically **normal Type Ia**: the event typed four centuries after the fact, by its own postponed light.

### 8 — Numerical

**(a)** $M = 4.74 - 2.5\log_{10}(5\times10^{9}) = 4.74 - 2.5 \times 9.70 = 4.74 - 24.25 = \mathbf{-19.5}$ — matching the standardised −19.3 within the bolometric-vs-B-band niceties.

**(b)** $R = 10^{7}\ \text{m/s} \times 400 \times 3.156\times10^{7}\ \text{s} = 1.26\times10^{17}$ m $= \mathbf{13.3\ ly}$ free-expansion radius — versus Tycho's measured ~4 ly: the remnant has been decelerated several-fold by swept interstellar gas, exactly what remnant dynamics predicts at age ~450 yr.

**(c)** $v = H_0 d = 70 \times 6.3\times10^{3} = 4.4\times10^{5}$ km/s → naive $z = v/c \approx \mathbf{1.5}$ — far beyond the low-z approximation's validity (the honest statement: at m_B ≈ 24.7 one is at genuinely relativistic redshifts where proper cosmological distance relations, the very ones the supernovae calibrate, must replace Hubble's linear law).

**(d)** $m - M = -7.5 + 19.3 = 11.8$; $d = 10^{(11.8/5)+1} = 10^{3.36}$ pc $= 2.3$ kpc $= \mathbf{7{,}500\ ly}$ — squarely the measured ~7,000 ly: the brightest stellar event in recorded history was a Type Ia at kiloparsec range, and the standard candle back-dates coherently to the year 1006.

### 9 — Open problem: a tuned switch at the heart of cosmology

**(a)** The transition density at which turbulent deflagration is declared to become detonation. Deriving it requires resolving how turbulence creates the localised, gradient-prepared hot spots that can shock-ignite — physics spanning from millimetre flame thickness to kilometre eddies, unresolved in any simulation and incompletely understood even in laboratory detonation tubes. The dial is set so yields match observed Ia's — calibration posing as mechanism.

**(b)** A helium-shell detonation is *robustly* achievable (thin degenerate helium ignites readily — the block's flash physics), and its converging shock ignites the core hydrodynamically: no turbulence-to-detonation miracle needed. The new uncertainties: the shell's required mass and purity, the ash it leaves on the outside of the ejecta (Ti/Cr spectral constraints), and the double-detonation geometry's viewing-angle diversity — a different set of dials, though arguably more physical ones.

**(c)** (1) **Early-time (hours) photometry at scale** — LSST-era discovery pipelines catching every nearby Ia's first day: companion-shock signatures and radius limits sort SD from compact channels statistically, not anecdotally. (2) **Remnant censuses** — completed donor searches plus Mn/Ti/Cr X-ray abundance forensics across all young Ia remnants: each remnant votes on its own channel. (3) **Gravitational waves** — LISA will count the Galaxy's double-white-dwarf binaries and their merger rate directly, fixing the DD channel's supply side. (4) **Mn in stellar populations** — chemical-evolution fits to Mn/Fe across metallicity constrain the historical near-/sub-M_ch mix. Four independent verdicts on one question; concordance would convict.

**(d)** Standardised magnitudes entering distance moduli directly: a 2% (≈0.02 mag... strictly 2% flux ≈ 0.022 mag) coherent drift with redshift maps onto a ~1% distance drift across the survey depth — comparable to the *entire* current error budget on the dark-energy equation-of-state parameter and to a substantial fraction of the Hubble-tension gap. A progenitor-mix evolution of quite modest size could thus masquerade as (or conceal) new fundamental physics — which is why the courtroom of part (c) is funded.

**(e)** Both are empirically validated rulers whose enforcing mechanism is unidentified (the PNLF's universal cutoff; the Ia's standardisable uniformity); both are policed by cross-checks rather than derivations; both carry the risk that an unmodelled *mixture* underlies the apparent standard. The principle: **empirical calibration certifies a ruler only within the sampled regime — extrapolation requires the mechanism.** The PNLF risks a galaxy's distance; the Ia risks the inventory of the universe; the epistemics are identical, the stakes are not.$astroTypeIa_master$,
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
