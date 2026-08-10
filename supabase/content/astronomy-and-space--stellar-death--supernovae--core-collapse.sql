-- Astronomy & Space · Stellar Death — Supernovae —
-- "Core-Collapse Supernovae". Curated master for
-- astronomy-and-space/stellar-death/supernovae/core-collapse
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (position 1 in the Supernovae block),
-- so this change is content-only: no seed edit rides with it.
--
-- The other way to die: above ~8 solar masses the block's quiet endings
-- are cancelled and gravity writes the finale. The onion's accelerating
-- endgame (centuries of carbon to a single day of silicon, paced by
-- neutrino losses); iron's double betrayal - photodisintegration
-- refunding 100 Myr of fusion in milliseconds while electron capture
-- eats the pressure's own particles; collapse at a quarter lightspeed
-- to nuclear density, the bounce, and the shock that stalls; the
-- neutrino engine (3x10^46 J, 99% of the event, 10 seconds) and the
-- fifty-year computational war over reviving the shock; SN 1987A's 25
-- neutrinos confirming the paradigm seconds before the light, and the
-- 35-year hunt for its neutron star; the observational zoo (II-P
-- plateaus as recombination waves, stripped Ib/c linking back to the
-- Ia chapter's classification, collapsars and gamma-ray bursts,
-- disappearing stars as direct-to-black-hole failures); kicks, the
-- mass cut, and what is left behind; the prompt alpha-element delivery
-- that set the Ia chapter's [alpha/Fe] clock ticking; and the watch for
-- the next Galactic event (SNEWS, Betelgeuse, one-per-few-decades).
-- ~10,000 words, checkpoint at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-death/supernovae/core-collapse',
    'research',
    'advanced',
    'read',
    $astroCoreCollapse_master$> A **core-collapse supernova** is the death of a massive star: its iron core, grown past the Chandrasekhar limit, implodes at a quarter of the speed of light to nuclear density, rebounds, and — powered by the most intense neutrino burst in the universe — blows the star apart. It is how every star born above roughly eight solar masses ends, the birth event of neutron stars and black holes, and the delivery mechanism for most of the oxygen you are breathing.

Everything in this block so far — the flashes, the shells, the nebulae, the white dwarfs, even the Type Ia bombs — belongs to the low-mass majority: stars that never ignite carbon, whose cores stop at quantum bedrock. This chapter is the minority report. **Above ~8 $M_\odot$, the escape clauses are cancelled**: the core marches through every fuel nuclear physics offers, arrives at the one element from which nothing further can be extracted, and meets the limit this block derived two chapters ago — with no nova-style surface to vent through and no way to stop at a white dwarf. What follows is the most violent *gravitational* event in stellar life, and — in one of physics' great inversions — its engine turns out to be the most elusive particle in nature, delivered in the largest single burst the universe produces.

Three numbers frame the chapter:

| Quantity | Value | Meaning |
|---|---|---|
| Total energy released | **~3 × 10⁴⁶ J** | the core's gravitational binding — 100× a Type Ia |
| Fraction carried by neutrinos | **~99%** | the "explosion" is the 1% residue |
| Collapse timescale | **~0.1 s** | a Chandrasekhar mass falling at ~0.25 c |

And one governing irony to hold throughout: the star spends ten million years fusing its way *up* the periodic table to iron — and the collapse spends its first milliseconds **undoing all of it**.

## The endgame of the onion

The Shell Burning chapter built the onion's logic: every fuel ends as a shell around its own ash. In a massive star the logic runs to completion, and the completion **accelerates catastrophically**.

Each successive fuel is poorer (the binding-energy staircase flattens toward iron) and each burns hotter — and above carbon-burning temperatures a new tax dominates everything: **neutrino losses**. At billions of kelvin, the core's plasma radiates neutrinos copiously (pair annihilation, plasmon decay — the same processes met at the helium flash, now rampant), and neutrinos, unlike photons, exit the star instantly. The core becomes a leaking bucket: burning must outrun a loss channel that grows ferociously with temperature. The schedule collapses accordingly — for a star of ~20 $M_\odot$:

| Fuel | Core temperature | Duration |
|---|---|---|
| Hydrogen | 4 × 10⁷ K | ~8 Myr |
| Helium | 2 × 10⁸ K | ~1 Myr |
| Carbon | 8 × 10⁸ K | **~600 years** |
| Neon | 1.6 × 10⁹ K | **~1 year** |
| Oxygen | 2 × 10⁹ K | **~6 months** |
| Silicon | 3.5 × 10⁹ K | **~1 day** |

Read the last line again. A star that has shone for ten million years burns its final fuel in roughly **a day** — a core furiously processing silicon to iron-group nuclei while the envelope — ten thousand years of thermal-adjustment time away — has no idea anything is happening. The supergiant's surface on the last morning is indistinguishable from the surface a century earlier. (Late-stage convective violence may belch some pre-collapse mass loss — the circumstellar shells around some events hint at it — but to first order, **the catastrophe is invisible from outside until it is over.**)

Silicon burning's product is the **iron-group core**: ~1.4 $M_\odot$ of iron-peak nuclei — the number is no coincidence but the block's oldest acquaintance, for the core is supported by **electron degeneracy** and grows toward exactly the Chandrasekhar threshold. The massive star has manufactured, at its centre, **a white dwarf made of iron** — the one composition from which the block's usual rescue (ignite the next fuel) is physically impossible.

```checkpoint
q: A massive star burns hydrogen for ~8 million years but silicon for only about a day. The dominant reason the late stages accelerate so violently is
a: silicon is a far rarer fuel, so there is less of it to burn
a: the star's envelope compresses the core faster in old age
a*: at billions of kelvin the core haemorrhages energy as freely escaping neutrinos, so each poorer fuel must burn furiously just to keep pace with the losses
a: iron's magnetism catalyses the final reactions
hint: Photons take 100,000 years to leak out of a star. What particle leaves instantly — and what happens to its production rate at 10⁹ K?
why: Neutrino losses (pair annihilation, plasmon decay) grow savagely with temperature and exit at lightspeed: the late core is a leaking bucket, and diminishing fuels burned against growing losses telescope centuries into days. The final day's silicon burning builds the fatal ~1.4 M☉ iron core while the surface shows nothing at all.
```

## Iron's double betrayal

Why iron kills the star is worth stating with precision, because the collapse is triggered not by one failure but by **two thieves working together** — and the first of them commits the great heist of the star's life.

The core sits at the Chandrasekhar edge: electron degeneracy pressure straining under ~1.4 $M_\odot$, exactly the white-dwarf physics of three chapters ago, now at 10¹⁰ K in the middle of a living star. Two processes now conspire:

**Thief one: photodisintegration.** At these temperatures the thermal photons carry MeV energies — enough to **smash iron nuclei apart**: $\gamma + {}^{56}\text{Fe} \rightarrow 13\,{}^{4}\text{He} + 4n$, and at higher temperatures the heliums themselves unbind into nucleons. This is fusion's ledger run backward: every MeV the star banked over ten million years of building toward iron is **withdrawn again**, and the withdrawal is *endothermic* — it drains the core's thermal energy, which is to say its pressure support, precisely when compression demands more of both. The star's century-scale savings account is refunded — stolen — in milliseconds.

**Thief two: neutronisation.** At the prevailing densities, electrons — the very particles whose degeneracy pressure carries the core — are **captured by protons**: $e^- + p \rightarrow n + \nu_e$. Each capture removes one pressure-supporting electron *permanently* (the neutrino leaves) and nudges the composition toward neutrons. The support is not merely failing to grow: **its constituent particles are being deleted.**

Each thief accelerates the other — compression heats (more photodisintegration) and densifies (more capture) — and the Chandrasekhar analysis needs no further invitation. The pressure deficit becomes total, and the core does what the White Dwarfs chapter proved must happen past the limit with a softened equation of state: **it falls.** Not sags — falls, essentially freely, the inner core reaching **a quarter of the speed of light** inward. A Chandrasekhar mass of iron, the size of the Earth, collapses to the size of a city in **about a tenth of a second**.

*(Note the contrast that organises the whole Supernovae block: in the Type Ia, degenerate carbon could still burn — the limit's approach ended in thermonuclear escape. Iron is the fuel with no escape: the limit's approach ends in gravity's total victory. Same threshold, two opposite catastrophes, chosen by chemistry.)*

```checkpoint
q: Two processes conspire to trigger the iron core's collapse. Photodisintegration removes thermal pressure by unbinding iron nuclei; electron capture is even more insidious because it
a: converts the core to pure neutrons, which exert no pressure at all
a: releases energy that overheats the core
a*: permanently deletes the very electrons whose degeneracy pressure supports the core, the neutrino carrying the evidence away
a: makes the core magnetic, disrupting its equilibrium
hint: What particle holds the core up — and what does e⁻ + p → n + νₑ do to the census of that particle?
why: The core is held by electron degeneracy (the White Dwarfs chapter's physics, at the Chandrasekhar edge); captures remove those electrons one by one while photodisintegration simultaneously refunds — endothermically — ten million years of fusion savings. Support is drained and deleted at once, and a 1.4 M☉ core falls at ~0.25c to city size in a tenth of a second.
```

## The bounce, the stall, and the fifty-years' war

What stops the fall — and what almost fails to stop the star's own death from being silent — is the physics on which the rest of the chapter turns.

**The bounce.** At ~2 × 10¹⁷ kg/m³ — **nuclear density**, the interior of an atomic nucleus writ ten kilometres wide — the strong force abruptly stiffens the equation of state: nucleons resist further packing, and the inner core halts within milliseconds. Halting a quarter-lightspeed infall is not gentle: the inner core *overshoots*, rebounds — the **bounce** — and drives a **shock wave** out into the still-infalling outer core. For one optimistic decade of the field's history, that was the supernova: collapse, bounce, shock, explosion. Nature declined the simplicity.

**The stall.** The outward shock ploughs into infalling iron — and pays iron's toll. Every gram it sweeps up, it must **photodisintegrate** (the tax runs ~1.7 × 10⁴⁴ J per tenth of a solar mass — a full Type Ia's energy spent unbinding a trifle of matter), while neutrino losses drain it from behind. Within milliseconds the shock exhausts itself and **stalls** — a standing accretion front parked at ~150 km, treading water while the star's mantle rains through it onto the proto-neutron star. In every careful spherically-symmetric simulation ever run, that is the end: **the shock never leaves; the star swallows its own explosion**; a black hole forms in silence. The most dramatic event in stellar physics fails on paper.

**The engine.** The rescue — proposed by Colgate & White (1966), given its modern "delayed" form by Bethe & Wilson (1985) — is the chapter's inversion: the ghost particle as prime mover. The collapse's energy ledger is enormous — the binding energy of a neutron star,

$$E \sim \frac{GM^2}{R} \approx 3\times10^{46}\ \text{J},$$

**a hundred Type Ia's** — and ~99% of it streams out over ~10 seconds as **neutrinos** of all flavours, radiated by the newborn, 10¹¹–10¹² K proto-neutron star. The kinetic energy of any observed supernova (~10⁴⁴ J) is one percent of that flow. So the mechanism needs only this: the matter behind the stalled shock — dense, hot, at ~10¹⁰ K — is *just barely* opaque enough to neutrinos to absorb **a percent or so** of the torrent. Deposited over hundreds of milliseconds, that heating re-pressurises the region behind the shock, and — in the successful cases — **relaunches** it through the star: the explosion is the neutrino wind's tip, one percent of a gravitational catastrophe, leveraged.

**The war.** Whether the leverage actually works is the **fifty-year problem** of computational astrophysics. The margin is obscene: heating and cooling behind the shock balance to within percents, so the outcome hinges on physics at the edge of computability — full neutrino transport (a six-dimensional radiation problem), general relativity, magnetohydrodynamics, and above all **multidimensional turbulence**: convection behind the shock and the sloshing standing-accretion-shock instability (SASI) hold matter in the heating region longer, and 3D simulations explode — marginally, late, and not universally — where 1D ones never do. The modern consensus is that the neutrino mechanism, turbulence-assisted, powers the ordinary events, with rotation and magnetic fields drafted in for the extremes (next-but-one section); but a first-principles, resolution-converged, initial-condition-robust explosion remains just out of reach. The universe's most common big explosion is, in silico, still a marginal call.

```checkpoint
q: The bounce shock stalls at ~150 km, and in spherical simulations the star never explodes. The "delayed neutrino mechanism" revives it because
a: a second core collapse launches a stronger shock
a: nuclear burning reignites in the shocked material
a*: the proto-neutron star radiates ~3 × 10⁴⁶ J in neutrinos, and the dense matter behind the shock absorbs just ~1% of them — enough heating, over hundreds of milliseconds, to re-pressurise and relaunch the shock
a: the infalling envelope's momentum reverses the shock by recoil
hint: 99% of the event's energy leaves as ghost particles. How opaque is 10¹⁰ K matter just behind the shock — and how much of that torrent would the observed 10⁴⁴ J explosion require?
why: The observed explosion is one percent of the true (neutrino) event: matter behind the stalled shock is marginally neutrino-opaque, and percent-level absorption re-launches it — with 3D turbulence (convection, SASI) needed to hold matter in the heating zone long enough. The margin is so fine that fifty years of simulation still fight over it.
```

## Twenty-five ghosts: SN 1987A

Theory of this delicacy needed an experiment, and on 23 February 1987 the universe supplied one — the nearest naked-eye supernova since Kepler's of 1604, in the Large Magellanic Cloud, 160,000 light-years away.

Hours **before** any telescope saw the brightening, three underground detectors built for other purposes (proton decay!) recorded a simultaneous chirp: **Kamiokande II in Japan: 12 events; IMB in Ohio: 8; Baksan in the Caucasus: 5.** Twenty-five neutrino interactions, in about thirteen seconds, out of the ~10⁵⁸ neutrinos that swept through the Earth — through *you*, if you were alive that morning: some hundred trillion of 1987A's neutrinos crossed every human body on the planet, and statistically, in all of humanity, perhaps a handful interacted at all.

Twenty-five events founded a field, because every gross property matched the paradigm above:

- **Total energy** (extrapolated from the detected sample): ~3 × 10⁴⁶ J — the binding energy of a neutron star, on the nose. The 99%-invisible ledger, audited and confirmed.
- **Duration**: ~13 seconds — the proto-neutron star's neutrino diffusion time, as computed. (Not a millisecond flash: the newborn star is so dense that even *neutrinos* must diffuse out.)
- **Timing**: hours before the optical rise — exactly as an engine buried beneath 10⁵ seconds' worth of exploding envelope requires. The ghosts left first because the light had a star to climb out of.

{{image: SN 1987A | SN 1987A and its triple-ring system: the flash overtaking shells the star shed millennia before dying. Hours before any telescope saw the light, three underground detectors caught 25 neutrinos — the 99% of the event that is invisible, audited for the first time — and after 35 years of searching, JWST spectroscopy has now found the neutron star those thirteen seconds of ghosts guaranteed, swaddled in its own explosion's dust.}}

The event kept teaching. The progenitor, identified in archival plates, was a **blue** supergiant — not the red one every textbook expected — a lasting lesson in how binarity and composition shuffle massive-star endgames. The now-iconic **triple-ring system** lit up as the flash overtook mass shed millennia earlier. The radioactive tail tracked ⁵⁶Co's 77-day half-life (the Ia chapter's clock, here powering ~0.07 $M_\odot$ of nickel — a tenth of a thermonuclear event's yield). And one absence nagged for thirty-five years: **where is the neutron star?** The neutrinos midwifed one — thirteen seconds of them say so — yet no pulsar has ever been seen. The current best answer is a warm, compact dust-shrouded blob at the remnant's centre, whose infrared and (in 2024, via JWST spectroscopy of ionised argon) emission-line signatures now argue strongly for a hot young neutron star swaddled in its own explosion's soot. The corpse, it seems, is there — dressed, not missing.

```checkpoint
q: The ~13-second duration of SN 1987A's neutrino burst was itself a confirmation of the theory because it matches
a: the light-crossing time of the collapsing iron core
a: the free-fall time of the entire star
a*: the time needed for neutrinos to DIFFUSE out of the newborn proto-neutron star, which is so dense that even neutrinos cannot stream through it freely
a: the rotation period of the new neutron star
hint: In ordinary stars neutrinos leave instantly. What does it say about a newborn neutron star that they took thirteen seconds?
why: At nuclear density the proto-neutron star is opaque even to neutrinos — they random-walk out over ~10 seconds, exactly as models predicted. Combined with the measured ~3 × 10⁴⁶ J total (a neutron star's binding energy) and the hours-early arrival, 25 events in three detectors audited the invisible 99% of the paradigm and founded neutrino astronomy.
```

## The zoo: one engine, many costumes

Observationally, core collapses arrive in a wardrobe of types — and the wardrobe turns out to be a **striptease sequence**: one engine, dressed in whatever envelope the progenitor retained.

**Type II-P** — the commonest supernova in the universe — is the engine inside a full red-supergiant hydrogen envelope. Its signature **plateau** (the "P": ~100 days at nearly constant luminosity) is lovely physics: the explosion ionises the vast envelope, and the light we see is the **recombination front** — a cooling wave at the fixed ~6,000 K of hydrogen recombination — eating inward through the expanding gas like a glowing shoreline. The plateau ends when the wave runs out of envelope; the radioactive cobalt tail (smaller than a Ia's — ~0.07 $M_\odot$ of nickel) then takes over.

**II-L, IIn, IIb** — thinner envelopes, circumstellar collisions (the "n" is narrow lines from the shock lighting pre-collapse mass loss), transitional stripping.

**Ib and Ic** — the Ia chapter's leftover file, now resolved: hydrogen-free (Ib) and hydrogen-and-helium-free (Ic) events that are **core collapses undressed** — progenitors stripped by Wolf–Rayet winds or, more often, by **binary companions** (the block's persistent co-star, one last time). Their existence in star-forming regions only, their oxygen-rich late spectra, and their lack of silicon troughs distinguish them cleanly from the thermonuclear Ia's they once contaminated.

**Ic-BL and the gamma-ray-burst connection** — the extreme tail. A rapidly rotating stripped core can collapse not to a neutron star but **through** it: the **collapsar** — a newborn black hole eating its own star through an accretion disk, firing relativistic jets along the poles that drill out of the stellar corpse and flash the universe as a **long gamma-ray burst**, with a hyper-energetic broad-lined Ic supernova (10× ordinary kinetic energy) as the wreckage. The 1998–2003 association of GRBs with Ic-BL supernovae welded high-energy astrophysics to this chapter; magnetar-powered variants (next chapter's magnetic monsters as central batteries) populate the superluminous fringe.

**And the failures.** The engine's marginality (the fifty-years' war) predicts that some stars **don't** explode: the shock is never revived, and the star simply... goes out — envelope quietly slipping into the hole that used to be a core. The prediction has a face: **N6946-BH1**, a 25 $M_\odot$ red supergiant in the Fireworks Galaxy, brightened weakly in 2009 and then *vanished* — optical searches (HST, JWST) find no star where a supergiant used to be, only faint infrared consistent with late accretion. The best current example of a **failed supernova**: a star subtracted from the sky, a black hole added to the ledger, no fireworks in between. Survey programmes now monitor a million supergiants for exactly such disappearances — astronomy's strangest census, counting deaths by absence.

```checkpoint
q: Type Ib and Ic supernovae show no hydrogen (Ic: no helium either), yet they are core collapses, not white-dwarf explosions. The missing layers were
a: burned to completion during the star's life
a: hidden by dust formed before the explosion
a*: stripped from the massive progenitor beforehand — by Wolf–Rayet winds or, more commonly, a binary companion — leaving the same engine to explode undressed
a: ejected by the collapse itself before light escaped
hint: One engine, many costumes: what removes a massive star's outer wardrobe before death — and which chapter-long theme does that implicate one more time?
why: The II → IIb → Ib → Ic sequence is progressive pre-explosion stripping (winds and binary transfer), not different bombs: star-forming locations, oxygen-rich late spectra, and no silicon trough separate them from the thermonuclear Ia's they once contaminated. At the spun-up extreme, stripping plus rotation yields collapsars — black-hole engines, jets, and long gamma-ray bursts.
```

## What is left, and what is paid forward

The engine's aftermath writes the next two chapters' cast lists — and closes this block's chemical books.

**The remnant fork.** The proto-neutron star that powered the neutrinos either survives as a **neutron star** — the typical outcome for progenitors up to roughly 20–25 $M_\odot$ — or, when fallback from a weak explosion or outright failure adds too much mass, collapses onward to a **black hole**. The dividing line ("explodability") is not a clean mass threshold: the fifty-years' war's marginality makes it a jagged, non-monotonic function of the pre-collapse core's structure, which is why 25 $M_\odot$ stars can vanish (N6946-BH1) while some 27 $M_\odot$ stars explode. The **mass cut** — the radius inside which matter falls back versus flies out — also sets how much freshly made nickel escapes; its scatter is why twin progenitors can yield unequal light.

**The kick.** Newborn neutron stars are observed racing at hundreds of km/s (some exceed 1,000) — far too fast to be orbital debris. The explosion itself is asymmetric — the turbulent, sloshing engine guarantees it — and momentum conservation hands the compact remnant a **natal kick**. The Pulsars chapter inherits the evidence; this chapter notes the cause: the same multidimensional chaos that saves the explosion also aims its recoil.

**The chemical will.** A core collapse ejects the onion's outer rings wholesale: **oxygen above all** (several solar masses per event — the dominant cosmic source of the element you are breathing), plus neon, magnesium, silicon, sulfur — the **alpha elements** whose *prompt* delivery, millions of years after each starburst, set the fast hand of the [α/Fe] clock the Ia chapter read. Iron it delivers too, but modestly (~0.07 $M_\odot$ typical): the slow-fuse Ia's remain iron's majority supplier. So the two supernova classes split the periodic table's midfield between them — **alphas prompt from gravity's bombs, iron delayed from fusion's** — and galactic archaeology reads every stellar population against that two-clock standard.

One conspicuous ledger line remains open. The heaviest elements — the r-process half of everything beyond iron, the gold and uranium the s-process chapters explicitly deferred — were long booked to these explosions on faith. The modern audit (spoiler: a different corpse-collision entirely) is the **Nucleosynthesis** chapter's story, two nodes ahead.

```checkpoint
q: Core-collapse and Type Ia supernovae divide the chemical delivery of the universe roughly as
a: core collapses make all elements; Ia's make none
a*: core collapses promptly deliver the alpha elements (especially oxygen, several M☉ per event) but little iron; delayed Ia's supply most of the iron — the two-clock structure behind the [α/Fe] galactic chronometer
a: both make mostly iron, in equal shares
a: core collapses make elements lighter than carbon; Ia's the rest
hint: One class fires Myr after star formation and ejects the onion's outer rings; the other waits Gyr and burns to the iron peak. Which chapter's clock did this difference wind?
why: ~0.07 M☉ of Ni from a typical II-P versus ~0.6 from a Ia, but several solar masses of O/Ne/Mg/Si — prompt. Alphas early, iron late: the [α/Fe] knee's mechanism, with the r-process heavies deliberately left off this ledger for the Nucleosynthesis chapter's audit.
```

## The next one

The chapter closes on a watch, because for once astronomy's timescales and a reader's overlap.

The Milky Way's core-collapse rate is one or two per century; the last *certainly observed* Galactic supernova was Kepler's (1604 — a Ia at that), with Cassiopeia A's ~1680 event apparently fizzling unnoticed behind dust. By the crudest actuarial reading, **the Galaxy is due**. When it comes:

- **The neutrinos arrive first** — hours ahead of the light, as 1987A demonstrated — and today's detectors dwarf 1987's: a Galactic event would light up Super-Kamiokande with **~10,000 events** (against Kamiokande's 12), resolving the engine's workings second by second — stall, revival, accretion, even black-hole formation (the burst would *cut off* mid-stream). The **SNEWS** network exists precisely to turn that early chirp into a worldwide telescope alert: the ghosts as advance couriers, institutionalised.
- **Betelgeuse**, the perennial question: yes, it is a ~15–20 $M_\odot$ red supergiant in late helium burning or beyond; no, its famous 2019–20 "Great Dimming" was dust, not doom (the surface belched a cloud — a photospheric event, thoroughly post-mortemed); and its remaining ~10⁴–10⁵ years, while astronomical eyeblink, comfortably outlast every reader. At 550 light-years it would peak near the full Moon's brightness — spectacular, harmless, and the single most informative astrophysical event conceivable with current instruments.
- The physics stakes are the fifty-years' war's resolution: one Galactic neutrino light curve would referee the simulations outright — stall duration, revival time, turbulence signatures — closing on data what half a century of computation has held open.

{{image: Crab Nebula | The Crab Nebula — the wreckage of the "guest star" Chinese astronomers logged in July 1054, bright enough for daytime viewing for three weeks. The filaments are the star's onion layers, mid-delivery to the interstellar medium; the eerie blue glow is powered by the lighthouse at the centre, spinning thirty times a second — the next chapter's protagonist.}}

Meanwhile the corpses already among us carry the story forward: the Crab's 1054 guest star left a lighthouse this block meets next; Cassiopeia A's oxygen-rich filaments are the onion's rings photographed mid-delivery. The block turns now from the explosion to what it leaves spinning.

```checkpoint
q: When the next Galactic core-collapse supernova occurs, astronomers expect to know before any telescope sees it because
a: gravitational waves will trigger alerts weeks in advance
a: the progenitor star will visibly swell in its final months
a*: the neutrino burst leaves the star hours before the light does, and networked detectors (SNEWS) will turn ~10,000 expected events into an immediate worldwide alert
a: radio interference from the collapse precedes the optical flash
hint: In 1987, three underground tanks chirped hours before the LMC brightened. What was travelling ahead of the light, and why?
why: The engine fires at the buried core; light must wait for the shock to climb the envelope (hours), while neutrinos stream out at once — 1987A proved it with 25 events, and a Galactic event would give Super-K ~10⁴, resolving the stall-and-revival engine second by second (a mid-burst cutoff would even announce black-hole birth live). SNEWS exists to convert the ghosts' head start into pointed telescopes.
```

## Pulling the thread

- **Above ~8 $M_\odot$ the block's escape clauses are void**: the onion runs to completion, neutrino losses telescoping the schedule (C: centuries; Si: **a day**) while the surface shows nothing; the product is a ~1.4 $M_\odot$ **iron white dwarf inside a living star** — the Chandrasekhar physics of three chapters ago, rebuilt in the one element that cannot burn.
- **Two thieves trigger the fall**: photodisintegration refunds ten million years of fusion endothermically in milliseconds, while electron capture deletes the pressure's own particles (each loss feeding the other). The core drops at ~0.25 c from Earth-size to city-size in ~0.1 s.
- **Bounce, stall, engine**: nuclear stiffness rebounds a shock that iron's unbinding tax promptly stalls at ~150 km. The rescue is the **neutrino engine** — 3 × 10⁴⁶ J (99% of the event, 100 Ia's) streaming out over ~10 s, of which ~1% absorbed behind the shock relaunches it — but only with 3D turbulence's help (convection, SASI), and only marginally: the **fifty-years' war** of simulation remains unfinished.
- **SN 1987A audited the invisible ledger**: 25 neutrinos, ~3 × 10⁴⁶ J, 13 s (a proto-neutron star's diffusion time), hours before the light; a blue-supergiant curveball; a 35-year missing neutron star now apparently found warm and dust-swaddled by JWST.
- **One engine, many costumes**: II-P's plateau is a recombination shoreline crossing a retained hydrogen envelope; Ib/Ic are the same engine stripped (winds, binaries) — resolving the Ia chapter's classification residue; rotation's extreme is the **collapsar**: black hole + jets + long gamma-ray burst; and the engine's marginality predicts **failed supernovae** — stars that simply vanish, with N6946-BH1 as the poster absence.
- **The aftermath is cast and chemistry**: neutron star or (via fallback/failure) black hole along a jagged explodability landscape; turbulent asymmetry kicks newborns at hundreds of km/s; the ejecta deliver the universe's oxygen and alphas promptly (winding the [α/Fe] clock) while leaving iron mostly to the Ia's — and the r-process heavies explicitly to the Nucleosynthesis chapter's audit.
- **The next one is overdue-ish**: 1–2 per century, neutrinos hours ahead, Super-K expecting ~10⁴ events, SNEWS on watch; Betelgeuse is safe, spectacular-in-waiting, and not tonight.

The transferable idea: the chapter's engine runs on a **one-percent margin of a hidden budget** — the visible explosion is a rounding error on an invisible neutrino ledger, and whether the rounding error exists at all hinges on turbulence at the edge of computability. When a spectacular outcome sits on a marginal balance, expect a **jagged outcome landscape** (twins that explode and vanish), expect **failures** alongside successes, and expect the decisive measurement to be of the hidden budget, not the visible show — which is exactly why twenty-five ghost-particle events in 1987 outweigh every photon ever collected from every supernova since.

## Further reading

The physics is served by {{book: David Arnett | Supernovae and Nucleosynthesis | 1996}}, the panorama by {{book: J. Craig Wheeler | Cosmic Catastrophes: Exploding Stars, Black Holes, and Mapping the Universe | 2007}}, and the 1987A story by {{book: Laurence A. Marschall | The Supernova Story | 1988}}.

- **David Arnett, *Supernovae and Nucleosynthesis* (1996).** The standard advanced treatment from one of the field's architects: late burning stages, collapse physics, explosive nucleosynthesis, and light curves, with the honest seams showing.
- **J. Craig Wheeler, *Cosmic Catastrophes* (2007).** The block's supernova companion continues: the core-collapse mechanism, the zoo, and the GRB connection at accessible depth.
- **Laurence A. Marschall, *The Supernova Story* (1988).** SN 1987A as lived history — the detection, the neutrinos, the scientific scramble — written while the event was still fading.

Beyond the books: Colgate & White (1966) and Bethe & Wilson (1985) are the mechanism's founding papers; Janka's reviews are the modern door into the simulation war; the Kamiokande, IMB and Baksan detection papers of 1987 repay reading in the original; Smartt's reviews codify progenitor identifications (and the red-supergiant problem); and the N6946-BH1 and 2024 JWST 1987A papers carry the failed-supernova and missing-neutron-star threads to their current edges.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, $G = 6.674\times10^{-11}$, $c = 2.998\times10^{8}$ m/s, 1 yr = 3.156 × 10⁷ s, 1 MeV = 1.602 × 10⁻¹³ J. Iron core: $M = 1.4\,M_\odot$, initial $R \approx 3\times10^{6}$ m; proto-neutron star $R = 12$ km. Nuclear density 2.3 × 10¹⁷ kg/m³. Photodisintegration cost: ~1.7 × 10⁴⁴ J per 0.1 $M_\odot$ of iron. Neutrino burst: ~3 × 10⁴⁶ J over ~10 s. Observed SN kinetic energy ~10⁴⁴ J. ⁵⁶Ni yields: II-P ~0.07 $M_\odot$; Ia ~0.6. SN 1987A: 160,000 ly ≈ 50 kpc, 25 events. Super-K fiducial mass ≈ 22× Kamiokande's. Betelgeuse ≈ 0.16 kpc. Kick speeds: 200–1,000 km/s. NS mass 1.4 $M_\odot$.*

### 1 — The accelerating endgame
**(a)** Using the burning table, compute the fraction of a 20 $M_\odot$ star's ~9 Myr life spent beyond carbon ignition.
**(b)** Explain why neutrino losses, not fuel poverty alone, set the late schedule.
**(c)** Explain why the surface betrays nothing on the final day — compare the core's last-day timescale with the envelope's thermal timescale (~10⁴ yr).
**(d)** The iron core reaches 1.4 $M_\odot$. Name the physics that makes this number the trigger, and the two chapters of this block where it was derived and first exploited.

### 2 — Two thieves
**(a)** Write the photodisintegration of ⁵⁶Fe to alphas and neutrons, and state the ledger it reverses.
**(b)** Compute the energy stolen by photodisintegrating 0.5 $M_\odot$ of iron (scale the given tax).
**(c)** Write the neutronisation reaction and state its double damage.
**(d)** Explain why each thief strengthens the other.
**(e)** Compute the free-fall timescale $t \sim 1/\sqrt{G\rho}$ for the core at ρ = 10¹² kg/m³, and compare with the stated ~0.1 s.

### 3 — The energy ledger *(the central computation)*
**(a)** Compute the gravitational binding energy released collapsing 1.4 $M_\odot$ from R = 3,000 km to R = 12 km: $E \approx \frac{3}{5}GM^2(1/R_f - 1/R_i)$.
**(b)** Express the observed 10⁴⁴ J kinetic energy as a fraction of (a).
**(c)** Compute the mean neutrino luminosity during the 10 s burst, and express it as a fraction of the combined luminosity of all stars in the observable universe (take 10⁴⁹ W).
**(d)** Explain why ~1% deposition suffices for explosion, and what parks the mechanism on a knife-edge.

### 4 — The stall
**(a)** The shock sweeps 0.3 $M_\odot$ of infalling iron. Compute the photodisintegration tax and compare with the shock's initial ~10⁴⁴ J.
**(b)** Explain the "standing accretion shock" configuration in one sentence.
**(c)** State the two multidimensional phenomena that assist revival and what each contributes.
**(d)** Explain why 1D simulations fail while (some) 3D simulations succeed, and why "some" is the operative word.

### 5 — Twenty-five ghosts
**(a)** From 25 detected events at 50 kpc, estimate the count for the same event at 10 kpc (Galactic centre) in the same detectors.
**(b)** Scale to Super-Kamiokande (~22× Kamiokande's mass; Kamiokande saw 12 of the 25) for the 10 kpc event.
**(c)** Betelgeuse at 0.16 kpc: scale Super-K's count from (b) and comment.
**(d)** State the three gross properties of the 1987A burst that matched prediction, and what each certified.
**(e)** Explain the 35-year neutron-star puzzle and its current resolution.

### 6 — The zoo
**(a)** Explain the II-P plateau as recombination physics: what sets its temperature, and what its duration?
**(b)** Order II → IIb → Ib → Ic as a physical sequence and name the two stripping agents.
**(c)** Distinguish Ic from Ia observationally in three criteria (the ones that purified the cosmology sample).
**(d)** Describe the collapsar chain from rotating stripped core to observed gamma-ray burst.
**(e)** Describe N6946-BH1's observational history and what it is taken to demonstrate.

### 7 — Kicks and cuts
**(a)** A 1.4 $M_\odot$ neutron star recoils at 400 km/s. Compute its momentum and kinetic energy; express the latter as a fraction of 10⁴⁴ J.
**(b)** Explain why natal kicks implicate an asymmetric engine, and which engine ingredient supplies the asymmetry.
**(c)** Define the mass cut and list two observables it controls.
**(d)** Explain "islands of explodability" and its observational corollary (which stars vanish).

### 8 — Numerical
**(a)** Compute the mean density of the proto-neutron star (1.4 $M_\odot$, R = 12 km) and compare with nuclear density.
**(b)** SN 1987A's ⁵⁶Ni (0.07 $M_\odot$): using the Ia chapter's clock, compute the radioactive power at t = 100 d (pure Co phase; scale the Ia chapter's 0.6 $M_\odot$ answer of 4.8 × 10³⁵ W).
**(c)** An envelope of 10 $M_\odot$ ejected with 10⁴⁴ J: compute its speed, and compare with a Ia's 10⁴ km/s from 1.4 $M_\odot$.
**(d)** Oxygen delivery: at 1.5 $M_\odot$ of O per event and 2 events per century, how much oxygen does the Galaxy make per Gyr?

### 9 — Open problem: the fifty-years' war
**(a)** State the problem precisely: what must a successful ab-initio model produce, and against what margin?
**(b)** List the four physics ingredients whose coupling makes the computation extreme.
**(c)** Explain what a Galactic neutrino light curve would decide, feature by feature (onset, stall plateau, revival, cutoff).
**(d)** Explain how the failed-supernova census and the black-hole mass spectrum (gravitational waves) constrain the engine from opposite ends.
**(e)** Defend or attack: "The supernova problem is solved in principle; only resolution is lacking."

## Worked answers

### 1 — The accelerating endgame

**(a)** Beyond carbon: ~600 + 1 + 0.5 + 0.003 yr ≈ 600 yr of 9 × 10⁶ yr: $\mathbf{7\times10^{-5}}$ — the star's terminal illness occupies a hundred-thousandth of its life.

**(b)** Each later fuel yields less per kilogram (flattening binding-energy staircase) — but the *rate* is forced by the loss side: neutrino emission grows explosively with T and exits freely, so the core must burn ever faster merely to stay in equilibrium. It is the losses that turn "poorer" into "briefer": same fuels without neutrino leakage would burn orders of magnitude longer.

**(c)** The envelope re-adjusts on its thermal timescale, ~10⁴ years; the core's final act lasts a day — a factor of ~10⁶–10⁷ too fast for any signal to propagate as structural change. The photosphere on the last morning is a fossil of the core of centuries past. (Only neutrinos — pre-collapse Si-burning ones are in principle detectable from very nearby stars — could carry the warning.)

**(d)** Electron degeneracy pressure's relativistic ceiling — the **Chandrasekhar limit**: derived in *White Dwarfs* (the shipboard calculation, the softened $\rho^{4/3}$), first exploited as a trigger in *Type Ia Supernovae*. Here it recurs with iron's fatal twist: no thermonuclear escape exists, so the threshold's crossing is purely gravitational.

### 2 — Two thieves

**(a)** $\gamma + {}^{56}\text{Fe} \rightarrow 13\,{}^{4}\text{He} + 4n$ (and onward, $\gamma + {}^{4}\text{He} \rightarrow 2p + 2n$). It reverses the star's entire fusion ledger: every reaction from hydrogen to iron banked binding energy; this withdraws it — endothermically, at the worst moment.

**(b)** $0.5/0.1 \times 1.7\times10^{44} = \mathbf{8.5\times10^{44}\ J}$ — several Type Ia's worth of energy *consumed* (not released) in the fall's first act.

**(c)** $e^- + p \rightarrow n + \nu_e$. Damage one: the electron — a unit of the core's supporting degeneracy pressure — is permanently removed. Damage two: the neutrino exits with energy, an additional drain. (The neutrons accumulate toward the next chapter's protagonist.)

**(d)** Collapse compresses and heats: heating accelerates photodisintegration (more pressure-energy spent), compression raises electron Fermi energies above capture thresholds (more electrons deleted); each loss deepens the collapse that drives both. A cooperative runaway — the block's feedback grammar, in its purely destructive conjugation.

**(e)** $t \sim 1/\sqrt{6.674\times10^{-11} \times 10^{12}} = 1/\sqrt{66.7} = \mathbf{0.12\ s}$ — the tenth-of-a-second fall, from the dimensional estimate alone.

### 3 — The energy ledger

**(a)** $E = \tfrac35 \times 6.674\times10^{-11} \times (2.785\times10^{30})^2 \times (1/1.2\times10^{4} - 1/3\times10^{6})$. $GM^2 = 6.674\times10^{-11} \times 7.76\times10^{60} = 5.18\times10^{50}$; × 3/5 = $3.11\times10^{50}$. Bracket: $8.33\times10^{-5} - 3.3\times10^{-7} \approx 8.30\times10^{-5}$. $E = 3.11\times10^{50} \times 8.30\times10^{-5} = \mathbf{2.6\times10^{46}\ J}$ — the canonical ~3 × 10⁴⁶ J, essentially all from the final compact configuration.

**(b)** $10^{44}/2.6\times10^{46} \approx \mathbf{0.4\%}$ — the visible supernova is a sub-percent residue of the true event.

**(c)** $L_\nu = 3\times10^{46}/10 = 3\times10^{45}$ W. Against ~10⁴⁹ W for every star in the observable universe: $3\times10^{45}/10^{49} = \mathbf{3\times10^{-4}}$ — for ten seconds, one newborn neutron star emits, in neutrinos, about **0.03% of the combined luminosity of every star in the observable universe** — equivalently outshining its entire host galaxy's photon output by a factor of ~10⁷ during the burst.

**(d)** The explosion needs only ~10⁴⁴ J delivered behind the shock — ~1% of the neutrino flow through marginally opaque 10¹⁰ K matter, which is roughly what the absorption cross-sections provide. The knife-edge: heating (absorption) and cooling (re-emission by the same hot matter) balance to within percents, so success hinges on how long turbulence detains matter in the net-heating zone — a competition decided at the resolution limit of the best simulations.

### 4 — The stall

**(a)** $3 \times 1.7\times10^{44} = \mathbf{5.1\times10^{44}\ J}$ against ~10⁴⁴ available: the toll exceeds the treasury several-fold within the first few hundred kilometres — the stall is arithmetic, not subtlety.

**(b)** The stalled front becomes a standing shock through which the star's mantle continuously rains onto the proto-neutron star — a waterfall with a hovering hydraulic jump, parked until the energy balance beneath it changes sign.

**(c)** **Neutrino-driven convection**: hot buoyant bubbles behind the shock churn, lengthening matter's residence in the heating zone and pressing the shock outward. **SASI** (standing accretion shock instability): a global sloshing/spiral mode of the shock surface that similarly stores energy and residence time, and imprints asymmetry. Both convert the geometry's third dimension into extra heating efficiency.

**(d)** In 1D, matter falls radially through the heating zone at maximal speed and the balance stays negative: no explosion, ever. In 3D, turbulence and SASI raise the effective heating; many progenitors then explode — late, marginal, energy on the low side — but outcomes vary with progenitor structure, resolution, transport scheme, and even stochastic seed perturbations. "Some": the margin is real physics, not numerical noise, and nature's own outcome (explode or fail) plausibly varies just as the simulations do.

### 5 — Twenty-five ghosts

**(a)** Flux ∝ 1/d²: $25 \times (50/10)^2 = \mathbf{625}$ events.

**(b)** Kamiokande's share: 12 × 25 = 300 at 10 kpc; Super-K at 22×: $\mathbf{\sim6{,}600}$ events — call it the promised ~10⁴: a second-by-second neutrino light curve.

**(c)** $6{,}600 \times (10/0.16)^2 = 6{,}600 \times 3{,}900 \approx \mathbf{2.6\times10^{7}}$ — tens of millions of events; Betelgeuse would saturate the detectors and deliver the finest-grained measurement of a stellar interior ever made, milliseconds resolved.

**(d)** **Total energy** ~3 × 10⁴⁶ J certified the ledger (a neutron star's binding, 99% invisible); **duration** ~13 s certified the proto-neutron star's neutrino *diffusion* (opacity even to neutrinos = nuclear density reached); **timing** hours pre-optical certified the buried engine (light must climb the envelope; ghosts don't).

**(e)** Thirteen seconds of neutrinos guarantee a neutron star existed at t = 0 — yet no pulsar, no X-ray point source appeared for decades, raising the spectre of late collapse to a black hole. Resolution, 2019–2024: ALMA found a warm dust blob ("the blob") at the predicted off-centre position, and JWST spectroscopy found ionised argon requiring a central ionising source — a hot young neutron star, swaddled in explosion soot, not missing but dressed.

### 6 — The zoo

**(a)** The shock ionises the huge hydrogen envelope; as it expands and cools, a **recombination front** — pinned near ~6,000 K, where hydrogen recombines and the opacity collapses — moves inward through the mass while the ejecta carry it outward: the photosphere rides the front at nearly constant temperature and effective radius, hence ~constant luminosity. Duration = how long the wave takes to traverse the envelope: plateau length measures envelope mass.

**(b)** Progressive pre-explosion stripping: full H envelope (II) → partial H (IIb) → no H (Ib) → no H, no He (Ic). Agents: **Wolf–Rayet-type radiative winds** (metal-line driven, strongest in massive/metal-rich stars) and — dominantly, by the demographics — **binary mass transfer**, the block's recurring co-author.

**(c)** Location: Ib/c only in star-forming regions (Ia's everywhere, including ellipticals). Spectra: no deep Si II trough at maximum; late-time spectra dominated by **oxygen** (core-collapse ash), not iron. Light curves/energetics: Ni masses ~0.07-scale, not 0.6. These three, applied in the 1980s–90s, purified the cosmological Ia sample.

**(d)** A rapidly rotating, stripped C/O core collapses; angular momentum halts free infall into a **disk** around the newborn black hole; accretion at whole-solar-masses-per-second powers Poynting/neutrino-driven **jets** along the rotation axis, which drill through the residual star in ~10 s and emerge relativistically — beamed gamma-rays flag the escape (**long GRB**) — while disk winds and jet-heated ejecta produce the accompanying broad-lined, hyper-energetic Ic.

**(e)** A ~25 $M_\odot$ red supergiant in NGC 6946, monitored for years, brightened mildly in 2009 (~10⁶ $L_\odot$ — a candidate "failed-supernova transient": envelope ejection by the neutrino-burst mass loss), then faded below its own progenitor luminosity; HST and later JWST find no surviving star, only faint IR consistent with fallback accretion. Reading: the shock was never revived; the star became a black hole with no supernova — the engine's marginality made visible as a subtraction from the sky.

### 7 — Kicks and cuts

**(a)** $p = 1.4 \times 1.989\times10^{30} \times 4\times10^{5} = \mathbf{1.1\times10^{36}\ kg\,m/s}$; $E = \tfrac12 mv^2 = \tfrac12 \times 2.785\times10^{30} \times 1.6\times10^{11} = \mathbf{2.2\times10^{41}\ J}$ — ~**0.2%** of the ejecta's 10⁴⁴ J: a slight asymmetry in the blast comfortably pays for a violent kick.

**(b)** A spherical explosion recoils nothing; observed velocities (to 1,000+ km/s, far above any progenitor orbital speed) demand momentum asymmetry at birth. The supplier is the engine's own chaos — convective plumes and SASI sloshing make the inner ejecta lopsided by ~percent, and momentum conservation does the rest. The explosion's rescuer and its recoil share one cause.

**(c)** The mass cut is the boundary between matter that falls back onto the remnant and matter ejected. It controls (i) the **remnant's final mass** (neutron star vs black hole, and where in between) and (ii) the **ejected ⁵⁶Ni** — synthesised innermost, hence first hostage to fallback — and through it the light curve's radioactive tail.

**(d)** Explodability is a jagged, non-monotonic function of pre-collapse core structure (compactness): stars at 22 $M_\odot$ may fail while 26 $M_\odot$ neighbours explode — "islands." Corollary: the vanishing stars need not be the very biggest, and the red-supergiant progenitor statistics (no confirmed II-P progenitors above ~18 $M_\odot$ — the "red supergiant problem") plus N6946-BH1 fit the prediction that certain intermediate compactness peaks quietly close.

### 8 — Numerical

**(a)** $V = \tfrac43\pi(1.2\times10^{4})^3 = 7.24\times10^{12}$ m³; $\rho = 2.785\times10^{30}/7.24\times10^{12} = \mathbf{3.8\times10^{17}\ kg/m^3}$ — ~1.7× the given nuclear density: the star is a nucleus with a gravitational field.

**(b)** Scale by nickel mass: $4.8\times10^{35} \times (0.07/0.6) = \mathbf{5.6\times10^{34}\ W} \approx 1.5\times10^{8}\,L_\odot$ — a hundred million Suns from radioactivity alone at day 100, an order of magnitude below a Ia's tail, exactly as 1987A's light curve showed.

**(c)** $v = \sqrt{2E/M} = \sqrt{2\times10^{44}/(10 \times 1.989\times10^{30})} = \sqrt{1.005\times10^{13}} = \mathbf{3{,}200\ km/s}$ — a third of the Ia's speed: same energy scale spread through sevenfold more mass. (The block's two explosions are distinguishable by kinematics alone.)

**(d)** Rate × time × yield: $(2/100\ \text{yr}^{-1}) \times 10^{9}\ \text{yr} \times 1.5\,M_\odot = \mathbf{3\times10^{7}\ M_\odot}$ of oxygen per Gyr — the breathable element, delivered at tens of millions of solar masses per billion years; the Ia chapter's iron ledger has its prompt-side counterpart.

### 9 — Open problem: the fifty-years' war

**(a)** From an unaltered stellar-evolution progenitor, with all physics on and no tuned parameters, produce explosions matching observation — ~10⁴⁴ J kinetic energy, correct ⁵⁶Ni, correct remnant masses and kicks, across the progenitor mass function (and failures where the census demands them) — robust to resolution and initial perturbations. The margin to beat: heating–cooling balance behind the shock fine to ~percents.

**(b)** (i) Six-dimensional neutrino transport with energy- and flavour-dependent opacities; (ii) general relativity (compactness matters at 10–20%); (iii) 3D (magneto)hydrodynamic turbulence down to unresolved scales; (iv) the nuclear equation of state at and above nuclear density (the next chapter's uncertainty, imported whole).

**(c)** **Onset**: capture and infall physics (thief rates). **A plateau in the burst while the shock stalls**: accretion luminosity — its duration times the stall directly. **A step/decline at revival**: accretion cutoff timestamps the explosion mechanism's success and delay. **A mid-burst hard cutoff**: black-hole formation, live. One Galactic light curve with ~10⁴ events adjudicates each simulated feature against data — the war's Appomattox.

**(d)** Failed-supernova surveys measure the *fraction and progenitor types* that quietly close (the engine's failure statistics); gravitational-wave catalogues measure the black-hole *mass spectrum* those failures and fallbacks produce (the failure's products). The engine must simultaneously predict who fails and what the failures weigh — two independent, already-flowing data streams squeezing the same marginal physics from either side.

**(e)** *Defence*: the mechanism's ingredients are identified, 3D simulations do explode across much of parameter space, 1987A audited the ledger, and remaining disagreements track resolution and transport approximations — hallmarks of an in-principle-solved problem awaiting compute. *Attack*: "in principle" has been claimed since 1985; outcomes still flip with seed perturbations, EoS choice, and progenitor 3D structure (itself uncomputed); energies persistently undershoot; and a mechanism whose predictions vary within present uncertainty bands cannot yet claim explanation — it claims plausibility. *Honest verdict*: the neutrino-turbulence paradigm is very probably right and demonstrably not yet predictive; the decisive input will be observational (the next Galactic burst), not another decade of resolution — a fitting close for a block whose refrain has been regularities trusted ahead of their derivations.$astroCoreCollapse_master$,
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
