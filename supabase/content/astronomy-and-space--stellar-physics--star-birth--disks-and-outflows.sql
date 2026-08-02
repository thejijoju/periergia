-- Astronomy & Space · Stellar Physics — Star Birth —
-- "Disks and Outflows". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/star-birth/disks-and-outflows @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- George Herbig (Lick Observatory) and Guillermo Haro (Tonantzintla)
-- independently cataloguing Herbig-Haro objects in 1946-1947, unexplained
-- for thirty years until 1980s proper-motion and infrared/radio work
-- revealed them as bipolar-jet shocks -- the exhaust seen four decades
-- before the engine; the centrifugal-radius derivation r_c = j^2/GM and its
-- R^4 scaling, showing why a collapsing rotating core inevitably produces a
-- disk rather than a point, with the disk's scale inherited from its
-- parent core's rotation; the Keplerian angular-momentum profile and
-- viscous spreading as the transport mechanism, set against the viscosity
-- problem in full -- minimum-mass-solar-nebula numbers, an ~11 m^2/s
-- molecular viscosity, a 6x10^13 yr viscous timescale (~4,500x the age of
-- the universe) against observed few-Myr disk lifetimes, a seven-order-of-
-- magnitude shortfall -- the Shakura-Sunyaev 1973 alpha prescription as a
-- parametrisation rather than a theory, and the magnetorotational
-- instability (Balbus & Hawley, 1991) with its dead-zone problem; bipolar
-- jets as the disposal mechanism, their 357 km/s escape-velocity match to
-- observed jet speeds, the magnetocentrifugal bead-on-a-rod launch, the
-- Alfven radius and a lever arm of about 3 removing roughly 90% of the
-- angular momentum by ejecting roughly 10% of the mass; the disk-lifetime
-- clock measured by infrared-excess fraction against cluster age, the
-- giant-planet deadline it sets, and photoevaporation as the dominant
-- dispersal mechanism; and the leftover angular momentum recorded in the
-- Sun holding 99.87% of the solar system's mass against 0.6% of its
-- angular momentum, with Jupiter holding 61% of the angular momentum on
-- 0.095% of the mass.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/star-birth/disks-and-outflows',
    'research',
    'advanced',
    'read',
    $astroDisks_master$> A protoplanetary disk is not a by-product of star formation but a structural requirement: a collapsing, rotating cloud core cannot deposit its mass directly onto a forming star without violating the conservation of angular momentum, so a disk forms because that angular momentum has to go somewhere, and the leftover of the disposal is still measurable in the architecture of a planetary system billions of years afterward — even though the accretion that drains the disk is observationally certain and, to a striking degree, still theoretically unresolved.

## The exhaust before the engine

In 1946 and 1947, George Herbig at Lick Observatory and Guillermo Haro at Tonantzintla in Mexico independently identified a class of small, bright nebulous patches in star-forming regions.

The objects were odd in four specific ways. They showed emission-line spectra characteristic of shocked gas rather than the reflection or fluorescence expected near young stars. They were compact, often only a few arcseconds across. They frequently came in pairs, symmetric about some point. And most were not associated with any visible star at all.

The objects were named Herbig–Haro objects, and for about thirty years nobody knew what they were. Suggestions included very young stars caught in the act of switching on, dense knots of gas being compressed by some external pressure, and reflection nebulae illuminated by something hidden from view.

Two developments settled the question, and they arrived together in the 1980s. Repeated imaging over years of observation showed that the knots were moving — at hundreds of kilometres per second — and moving away from a common origin: a point that usually contained no visible object but did contain a strong infrared source. Infrared and radio observations then identified those sources as protostars.

A Herbig–Haro object turned out to be not a thing but an event: the place where a supersonic jet, launched from a young star, rams into the surrounding molecular cloud and shocks it into emission. The pairs are symmetric because the jets are bipolar, launched in opposite directions along the rotation axis.

The sequence in which this was discovered inverts what might be expected. The most conspicuous, most distant, and most easily observed feature of star formation is the material being thrown away, rather than the star or the disk producing it. A protoplanetary disk is a few hundred astronomical units across and required ALMA to resolve properly. The protostar at the centre is buried under hundreds of magnitudes of extinction and needed space-based infrared astronomy to find. The jet, by contrast, extends for parsecs — tens of thousands of astronomical units — and was catalogued with photographic plates in the 1940s. The exhaust was visible for four decades before the engine that produced it could be seen at all.

There is a lesson in this beyond the anecdote. Herbig and Haro found the objects and could not interpret them, because the interpretation required knowing that something invisible sat at the centre of the pattern. An observation can be complete, correct, and uninterpretable until an unrelated technology reveals the thing it was about — the same structure as William Herschel's eighteenth-century "holes in the heavens," dark patches later shown to be obscuring dust rather than voids in space, or as the gaps in the asteroid belt identified by Daniel Kirkwood in 1867 and left without a mechanism for 116 years.

The name attached to the phenomenon reflects exactly this history. Herbig and Haro did not name a jet or a shock; they named a nebulous patch, because a nebulous patch was all that either of them, working independently on opposite sides of the continent, had any evidence for. The physical interpretation attached itself decades later, without requiring the original catalogue entries to be revised or the objects to be renamed — a reminder that a classification recorded honestly, at the limit of what could actually be seen, remains useful even after the theory built on top of it changes completely.

Modern surveys have since catalogued many hundreds of Herbig–Haro objects across nearby star-forming regions, and mapping their proper motions back to a common point of origin remains one of the most direct ways to locate an embedded outflow source before the driving protostar itself can be pinpointed at longer wavelengths. The technique that resolved a thirty-year puzzle in the 1980s is now a routine piece of observational bookkeeping, used to associate a jet with its engine well before any infrared or millimetre-wave follow-up confirms the association directly.

{{image: Herbig–Haro object | A Herbig-Haro object: a knot of shock-excited emission where a protostellar jet, invisible at the point of launch, rams into the surrounding cloud at hundreds of kilometres per second — cataloguing began in 1946-47, decades before the mechanism producing it was understood.}}

## Why a disk forms

The argument for why a disk should form at all is short, and it follows directly from the angular momentum carried by a collapsing, rotating cloud core.

Consider a parcel of gas in a rotating core at radius $R$ from the rotation axis, with the core rotating at angular velocity $\omega$. Its specific angular momentum is

$$j = \omega R^2$$

and this quantity is conserved as the parcel falls inward. As it approaches the centre, its rotational velocity rises, and it cannot fall past the radius at which centrifugal support balances gravity:

$$\frac{j^2}{r^3} = \frac{GM}{r^2} \qquad\Longrightarrow\qquad r_c = \frac{j^2}{GM}$$

That radius, $r_c$, is the centrifugal radius: the place where material of a given angular momentum comes to rest, unable to fall further inward.

Take a core of radius 0.05 pc rotating at $10^{-14}$ rad/s, collapsing onto a solar mass:

| Origin radius | $j$ (m²/s) | Lands at |
|---|---|---|
| 0.005 pc | 2.4 × 10¹⁴ | 0.003 AU |
| 0.015 pc | 2.1 × 10¹⁵ | 0.23 AU |
| **0.05 pc** | **2.4 × 10¹⁶** | **28 AU** |

Notice the scaling: because $j \propto R^2$, it follows that $r_c \propto R^4$. The outer parts of the core land enormously further out than the inner parts.

Two consequences follow immediately from this. Material does not arrive at a single point; it arrives spread over a wide range of radii, with the innermost core material reaching the star and the outer material stopping far away. A disk is the inevitable result of this sorting — the collapsing envelope arranges itself by angular momentum as it falls, rather than converging on the centre.

And the disk's size is inherited. Its outer radius is set by the specific angular momentum of the outermost infalling material, which is a property of the parent core rather than of anything happening near the star. The scale of a planetary system is, in this sense, a fossil of how fast its natal cloud core was rotating.

That the numbers in the table above come out at tens to hundreds of astronomical units — the scale of the solar system — is not built into the calculation. It follows from a core of the observed size rotating at the observed rate, with nothing in the arithmetic tuned toward that outcome. A parameter-free prediction landing on the right scale is a striking success for the picture.

It is worth being explicit about why conservation of angular momentum, rather than conservation of energy or momentum, is the quantity that dictates the outcome. A collapsing core loses gravitational potential energy continuously as it falls, and that energy is mostly radiated away — it does not accumulate as a barrier to further collapse. Angular momentum behaves entirely differently: nothing in a freely falling, non-magnetised parcel of gas can remove it, so it is carried inward unchanged until some other force intervenes. A core can shed almost all of its thermal and gravitational energy budget through radiation and still arrive at the centre spinning at whatever rate its parent cloud imposed. The centrifugal radius is where that unshed quantity finally asserts itself and halts the infall, radius by radius, layer by layer, until what remains is not a point but a disk.

{{image: Protoplanetary disk | A protoplanetary disk imaged in dust continuum emission: its outer radius is not an arbitrary scale but a fossil of the specific angular momentum carried by the outermost material in the collapsing core that produced it.}}

## How a disk disposes of angular momentum

A disk solves the immediate problem — material stops falling freely — but it does not, by itself, solve the disposal problem. The angular momentum is still present; it has merely been parked in an extended structure rather than removed.

To get material onto the star at all, that angular momentum has to be removed from the material as it moves inward. This is worth stating plainly, because it is easy to read the formation of a disk as the end of the story: material has found a stable orbit, and stable orbits, left alone, persist indefinitely. A disk with no internal friction and no external torque would simply orbit forever, its mass distribution frozen in whatever configuration the initial infall produced, and no star would ever finish assembling. Observation rules this out immediately — young stars plainly continue to grow after a disk has formed, so whatever mechanism operates must actively work against the centrifugal barrier that produced the disk in the first place.

### The Keplerian trick

In a Keplerian disk, the orbital velocity is $v = \sqrt{GM/r}$, so the specific angular momentum is

$$j = vr = \sqrt{GMr}$$

which increases outward:

| $r$ (AU) | $v_{\text{orb}}$ | $j$ (m²/s) |
|---|---|---|
| 0.1 | 94 km/s | 1.4 × 10¹⁵ |
| 1 | 30 km/s | 4.5 × 10¹⁵ |
| 10 | 9.4 km/s | 1.4 × 10¹⁶ |
| 100 | 3.0 km/s | 4.5 × 10¹⁶ |

So moving mass inward requires moving angular momentum outward — and because $j \propto \sqrt{r}$, a small amount of mass carried far out can absorb the angular momentum of a great deal of mass moved far in.

This is viscous spreading. If neighbouring annuli of the disk exert a frictional torque on one another, the inner one loses angular momentum and spirals inward while the outer one gains angular momentum and spirals outward. The disk accretes most of its mass onto the star and expels a small remainder to large radii. It is an elegant solution to the disposal problem, and it has one serious problem of its own.

### The viscosity problem

Ordinary molecular viscosity is hopeless as a transport mechanism, and not marginally so.

Take a disk at 1 AU with the properties of the minimum-mass solar nebula: temperature $T = 280$ K, surface density $\Sigma = 17{,}000$ kg/m², and scale height $H = c_s/\Omega = 0.033$ AU. Those numbers give a mid-plane number density of $4.4\times10^{20}$ m⁻³ and a molecular mean free path of about 1 centimetre.

Molecular viscosity is roughly $\nu \sim \lambda c_s$:

$$\nu_{\text{mol}} \approx (0.011)(996) = 11\ \text{m}^2/\text{s}$$

$$t_{\text{visc}} = \frac{r^2}{\nu} = \frac{(1.496\times10^{11})^2}{11} = 6\times10^{13}\ \text{yr}$$

Sixty trillion years — about 4,500 times the age of the universe. Observed disks survive a few million years, so the discrepancy between the molecular-viscosity prediction and the observed lifetime runs to seven orders of magnitude.

### The alpha prescription, and what it hides

In 1973, Shakura and Sunyaev proposed sidestepping the problem rather than solving it directly. If the disk is turbulent, the effective viscosity is set by the size and speed of the largest turbulent eddies — and those cannot exceed the scale height $H$ or the sound speed $c_s$. Write

$$\nu = \alpha\, c_s H$$

with $\alpha \le 1$ a dimensionless parameter absorbing all of the unknown underlying physics.

Numerically, it works:

| $\alpha$ | $\nu$ (m²/s) | $t_{\text{visc}}$ at 1 AU |
|---|---|---|
| 10⁻³ | 5.0 × 10⁹ | 142,000 yr |
| 10⁻² | 5.0 × 10¹⁰ | 14,000 yr |

Values of $\alpha \sim 10^{-3}$ to $10^{-2}$ reproduce observed disk lifetimes and accretion rates.

But $\alpha$ is a parametrisation, not a theory. It states that turbulence transports angular momentum at some fraction of the maximum plausible rate, and it puts every question about what actually drives the turbulence into a single number fitted to observation rather than derived from first principles.

The leading candidate mechanism is the magnetorotational instability, identified by Balbus and Hawley in 1991: a weak magnetic field threading a differentially rotating disk is unstable, because field lines connecting an inner and an outer parcel act like a spring, transferring angular momentum outward and amplifying the displacement between the two parcels. It is elegant, it is well understood theoretically, and simulations show that it produces values of $\alpha$ in roughly the right range.

It also requires the gas to be ionised — enough for the magnetic field to couple to the material at all. And much of a protoplanetary disk is cold, dense, shielded from ionising radiation, and effectively neutral. The resulting dead zones, where the magnetorotational instability cannot operate, remain a live problem, and alternative or supplementary mechanisms — gravitational instability, magnetised disk winds, purely hydrodynamic instabilities — are actively debated rather than settled.

The dead-zone problem is not a minor technical footnote; it sits directly across the region where planets actually assemble. The mid-plane at a few astronomical units, shielded from cosmic rays and stellar X-rays by the overlying gas and dust, is simultaneously the coldest, most neutral part of a typical disk and the part where rocky planets and the cores of giant planets are built. If the magnetorotational instability is confined to thin, ionised surface layers while the bulk of the mass in the mid-plane sits nearly inert, angular momentum transport there proceeds by whatever weaker or entirely different process actually operates, and the local conditions under which solids grow, settle, and concentrate depend on getting that process right. A disk model that gets the viscosity wrong in the dead zone does not merely mispredict an accretion rate; it mispredicts the environment in which planet formation itself takes place.

Disk accretion is, as a result, observationally certain and theoretically unresolved. The rate at which it proceeds is known, it can be parametrised, and what actually does the transporting is not established.

{{image: Magnetorotational instability | A simulation of the magnetorotational instability: a weak magnetic field threading a differentially rotating disk transfers angular momentum outward, and remains the leading candidate for solving a viscosity shortfall of seven orders of magnitude — though it stalls wherever the gas is too neutral for the field to couple to it.}}

## Throwing it away

Viscous transport moves angular momentum outward within the disk. Outflows remove it from the system entirely, and they are the more dramatic of the two solutions.

### What is observed

Every accreting young star drives a bipolar outflow — twin jets launched along the rotation axis in opposite directions. The correlation between the two phenomena is essentially perfect: objects that are accreting have jets, and objects that have stopped accreting do not.

Typical properties include a velocity of 100–400 km/s, highly collimated, often to opening angles of only a few degrees; a mass flux of roughly 10% of the accretion rate, so an object accreting $10^{-6}\,M_\odot$ per year ejects about $10^{-7}\,M_\odot$ per year; an extent reaching parsecs — tens of thousands of astronomical units, far beyond the disk itself; and termination in Herbig–Haro objects, where the jets shock the surrounding cloud.

### The velocity is the clue

Jet speeds of a few hundred kilometres per second look arbitrary until compared with the escape velocity from close to the star:

$$v_{\text{esc}}(3R_\odot) = \sqrt{\frac{2GM_\odot}{3R_\odot}} = \mathbf{357\ km/s}$$

Jets move at roughly the escape velocity from their launch region, which locates that region within a few stellar radii — the innermost disk, not the outer reaches.

That is the signature of a magnetocentrifugal launch. Magnetic field lines anchored in the disk and forced to rotate with it act like rigid wires; gas attached to such a field line and flung outward is accelerated centrifugally, much like a bead threaded on a spinning rod, until it reaches roughly escape speed and detaches. The mechanism naturally produces velocities comparable to the orbital speed at the launch radius, and it naturally collimates the flow along the rotation axis, where the field lines converge.

### The lever arm

The reason ejecting only about 10% of the mass can dispose of most of the angular momentum lies in a lever-arm effect.

Because the field lines remain rigid out to the Alfvén radius — the point where the flow's kinetic energy density exceeds the magnetic energy density and the field can no longer enforce co-rotation — an ejected parcel is forced to keep rotating at the disk's angular velocity out to a radius several times larger than its launch radius.

Its specific angular momentum when finally released is therefore

$$j = \Omega_{\text{launch}} r_A^2 = j_{\text{launch}}\left(\frac{r_A}{r_{\text{launch}}}\right)^2$$

With a lever arm $r_A/r_{\text{launch}} \sim 3$, each ejected parcel carries away roughly nine times the angular momentum it started with. Ejecting a tenth of the mass with a lever arm of three removes about ninety percent of the angular momentum. This is the disposal mechanism the angular momentum problem demands, and it is efficient precisely because the magnetic field does work at a distance rather than requiring bulk material to be physically carried far out.

Outflows are not merely a by-product of accretion. They limit how much mass ultimately reaches the star, ejecting material that would otherwise have accreted — one of the processes that reduce a collapsing fragment's final stellar mass below its initial mass. At larger scales, the collective outflows of many young stars inject turbulence into the parent cloud, contributing to the driving needed to keep turbulent support from decaying away entirely. The exhaust, in that sense, is part of the machine that sustains the medium producing it.

Two related pictures of the launching geometry are worth distinguishing, since both appear in the literature under the general heading of magnetocentrifugal winds. A disk wind is launched from a broad range of radii across the disk surface, with the field threading the disk over a wide annulus rather than a single point; an X-wind is launched from the narrow boundary where the disk meets the star's own magnetosphere, close to the corotation radius. Real systems plausibly combine elements of both, and disentangling which geometry dominates in a given source is itself part of the open transport question, since a disk wind and an X-wind remove angular momentum from different parts of the disk and therefore leave different fingerprints on how the disk evolves.

{{image: Bipolar outflow | A bipolar outflow from a young stellar object: launched magnetocentrifugally from within a few stellar radii, a jet moving at roughly the escape velocity from its launch point carries off angular momentum out of proportion to the small fraction of mass it removes.}}

## The disk clock

Disks do not last. That fact governs everything downstream of it, including whether planets can form at all.

### How the lifetime is measured

Disk lifetimes are measured the same way protostellar populations are counted more generally: by surveying clusters of known age and measuring the fraction of member stars with a detectable disk, identified through infrared excess above the stellar photosphere.

| Cluster age | Disk fraction |
|---|---|
| 1 Myr | ~80% |
| 2 Myr | ~60% |
| 3 Myr | ~45% |
| 5 Myr | ~25% |
| **10 Myr** | **~5%** |

The half-life is a few million years, and essentially no disks survive beyond about ten.

The infrared excess itself is a direct signature of warm dust. A bare stellar photosphere follows a single blackbody curve across all wavelengths; a star still surrounded by a disk shows extra emission above that curve at wavelengths from a few micrometres out to millimetre wavelengths, produced by dust at a range of temperatures corresponding to a range of disk radii — warm dust close to the star radiating in the near and mid infrared, cooler dust further out radiating in the far infrared and submillimetre. Measuring the excess, rather than merely detecting any infrared flux at all, is what makes the fraction in the table a fair comparison across clusters of different distances and different survey depths, since the excess is defined relative to each star's own photospheric baseline rather than to an absolute brightness.

### Why this matters enormously

Giant planets must form in under about five million years. A giant planet is mostly hydrogen and helium, and that gas is only available while the disk still exists. Core accretion — building a solid core of roughly ten Earth masses and then capturing gas onto it — must therefore complete both the core-building stage and the runaway gas-accretion stage before the disk disperses.

This is a genuinely tight deadline set against the timescales core accretion itself would naturally take if left unconstrained. Building a ten-Earth-mass core through the gradual accumulation of planetesimals and pebbles is not instantaneous, and estimates of core-growth timescales at the distances where the giant planets orbit run to several million years even under favourable assumptions about the local density of solid material. A core that finishes assembling at, say, four million years has only a narrow window left in which to accrete a massive envelope before the surrounding gas disperses entirely — and a core that finishes at six million years may find there is no gas left to accrete at all, regardless of how efficiently it could otherwise capture it. Giant planet formation is consequently a race against a clock that core accretion does not control and that starts ticking the moment the disk itself forms.

That deadline is a severe one. Jupiter and Saturn won the race; Uranus and Neptune reached comparable core masses too late and captured only modest hydrogen envelopes, which is why they belong to a different class of object with only 5–15% hydrogen and helium by mass rather than roughly 90%. The ice giants exist, as a class, because they lost a race against a clock set by disk dispersal.

### How disks disperse

Not primarily by viscous accretion alone, which would take longer and would leave a slowly thinning disk rather than the sharp transition actually observed. The dominant process is photoevaporation: ultraviolet and X-ray radiation, from the central star and from nearby massive stars, heats the disk's upper layers until the gas exceeds the local escape velocity and flows away.

The observational signature is a two-stage disappearance — disks thin slowly and then vanish quickly, over perhaps a few hundred thousand years — matching the sharp drop implied by the disk-fraction table above. Transition disks, with cleared inner holes but intact outer material, appear to be objects caught in the act of dispersal.

{{image: Photoevaporation | A protoplanetary disk undergoing photoevaporation: ultraviolet and X-ray heating of its upper layers drives gas away once it exceeds the local escape velocity, producing the sharp, two-stage disappearance recorded in the disk-fraction data rather than a slow monotonic decline.}}

## What is left over

The most important consequence of the picture assembled here reaches outside stellar physics entirely.

Planets form in the material that could not reach the star. The snow line — the radius beyond which water ice condenses, and one of the most-invoked concepts in accounts of solar system formation — is a feature of the disk's temperature profile. The density gradient among the Galilean moons is the same physics operating at roughly one-thousandth the scale, inside a circumplanetary disk. Arrokoth's gentle contact-binary merger is planetesimal formation preserved in a disk's outer reaches.

And the leftover angular momentum is still there, still anomalous, four and a half billion years later:

| | Share of mass | Share of angular momentum |
|---|---|---|
| **The Sun** | **99.87%** | **0.6%** |
| Jupiter | 0.095% | **61%** |

The Sun holds virtually all of the solar system's mass and almost none of its angular momentum. That is the disposal problem addressed above, observed in fossil form: the Sun shed its angular momentum into the disk during formation, and what remains of that disk is the planets, still carrying it.

The angular momentum paradox of the solar system is not a separate puzzle requiring its own explanation. It is the record of how the Sun was assembled.

Framed this way, the paradox stops being a peculiarity of one particular star and becomes a prediction. Any star that formed with a disk should show the same qualitative split between mass and angular momentum, with the exact numbers depending on how much material the disk retained relative to the star and how efficiently viscous spreading and outflows removed angular momentum during formation. The extreme version of the split seen in the solar system — 99.87% of the mass paired with only 0.6% of the angular momentum — is not a universal ratio; it is what a roughly solar-type star with a planetary system of this particular mass happened to leave behind. Systems with more massive disks, or with giant planets formed closer in, would be expected to show a different partition, and comparing that partition across other planetary systems is one of the ways the disk-formation picture can be tested well beyond the one system where the numbers happen to be known precisely.

The Sun has, moreover, continued to shed angular momentum since formation, through magnetic braking: its wind carries away far more angular momentum per unit mass than the surface material had to begin with, because the magnetic field enforces co-rotation out to many stellar radii before releasing it. That is the same lever-arm physics as the jets described above, operating at a far lower rate over billions of years rather than violently over a few hundred thousand.

## Pulling the thread

Herbig–Haro objects were catalogued in 1946–47 and went unexplained for thirty years. They turned out to be the shocks where a protostellar jet strikes the surrounding cloud, which means the most conspicuous feature of star formation is the material being thrown away — the exhaust was visible for four decades before the engine producing it could be seen at all.

A disk forms because infalling material sorts itself by angular momentum. The centrifugal radius, $r_c = j^2/GM$, scales as $R^4$, so outer core material lands tens of astronomical units out while inner material reaches the star directly. The disk's size is inherited from the rotation of the parent core — the scale of a planetary system is a fossil of how fast its natal cloud was turning.

A disk sheds angular momentum by transporting it outward. Because $j \propto \sqrt{r}$, a little mass carried far out absorbs the angular momentum of a great deal moved far in, which is viscous spreading. But molecular viscosity fails by seven orders of magnitude — a viscous timescale of $6\times10^{13}$ years at 1 AU, some 4,500 times the age of the universe, against observed disk lifetimes of a few million years. The Shakura–Sunyaev alpha prescription reproduces the observations with $\alpha \sim 10^{-3}$ to $10^{-2}$, but it is a parametrisation rather than a theory. The leading mechanism, the magnetorotational instability, requires ionisation that much of a disk does not have. Disk accretion is observationally certain and theoretically unresolved.

Bipolar jets throw the rest away, at 100–400 km/s — roughly the escape velocity from a few stellar radii, which locates the launch region and identifies the mechanism as magnetocentrifugal. With a magnetic lever arm of about 3, ejecting 10% of the mass removes about 90% of the angular momentum. The outflows feed back on the process itself, limiting the star's final mass and driving turbulence in the parent cloud.

Disks last a few million years — 80% of stars retain one at 1 Myr, only 5% at 10 Myr — measured by comparing infrared-excess fractions against cluster ages, and dispersed largely by photoevaporation. Giant planets must therefore form in under about five million years, which is the deadline the ice giants missed.

And planets form in the material that could not reach the star. The disk is not a by-product of star formation but a requirement, imposed by the prohibition against arriving at the centre carrying all of the core's original angular momentum. The Sun holds 99.87% of the solar system's mass and 0.6% of its angular momentum — the same disposal problem, still visible four and a half billion years later.

One question follows naturally from all of this and remains open at the level of the individual star: once the envelope is gone and a star is visible for the first time, it is not yet on the main sequence — it is still contracting, still accreting from what remains of its disk, violently magnetically active, and rotating far faster than a star like the Sun. A young star that has contracted by a factor of fifty from its parent core should, by simple conservation of angular momentum, be spinning close to break-up. Observed T Tauri stars instead rotate with periods of about eight days. What is holding them back is a question that belongs to the physics of young stars themselves, but the answer, whatever it proves to be, will have to remove angular momentum by some mechanism related to the same family described here — because removing angular momentum, one way or another, has been the organising problem of star formation from the moment a cloud core first began to collapse.

## Further reading

A systematic treatment of accretion disk physics, including the Shakura–Sunyaev alpha prescription and the magnetorotational instability, is given in {{book: Juhan Frank, Andrew King and Derek Raine | Accretion Power in Astrophysics | 2002}}.

- **Juhan Frank, Andrew King and Derek Raine, *Accretion Power in Astrophysics*, third edition (2002).** A graduate-level treatment of accretion disk theory across astrophysical settings, covering the viscous evolution of thin disks, the Shakura–Sunyaev alpha formalism and the transport problem it parametrises, and the launching of jets and outflows from accreting systems — the physics that, applied to protostars, produces the disk-and-outflow picture described here.

## Problems

*Data: $G = 6.674\times10^{-11}$, $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, 1 AU = 1.496 × 10¹¹ m, 1 pc = 3.086 × 10¹⁶ m, 1 yr = 3.156 × 10⁷ s, $k = 1.381\times10^{-23}$ J/K, $m_H = 1.673\times10^{-27}$ kg, $\mu = 2.33$. Centrifugal radius $r_c = j^2/GM$. Keplerian $j = \sqrt{GMr}$. Shakura–Sunyaev $\nu = \alpha c_s H$, $H = c_s/\Omega$. Minimum-mass solar nebula at 1 AU: $T$ = 280 K, $\Sigma$ = 17,000 kg/m². Collision cross-section $\approx 2\times10^{-19}$ m².*

### 1 — The exhaust before the engine

**(a)** List the four properties of Herbig–Haro objects that made them puzzling in the 1940s.
**(b)** State the two observational developments that identified them, and explain why proper motions in particular were decisive.
**(c)** Explain why the jets were catalogued forty years before the disks and protostars, in terms of physical scale and observability.
**(d)** Name two other episodes in the history of astronomy where a correct observation waited decades for the technology that made it interpretable.

### 2 — Why a disk *(the central argument)*

**(a)** Derive the centrifugal radius $r_c = j^2/GM$ by balancing centrifugal and gravitational acceleration.
**(b)** For a core with $\omega = 10^{-14}$ rad/s collapsing onto 1 M☉, compute $r_c$ for material originating at 0.005, 0.015 and 0.05 pc from the axis.
**(c)** Show that $r_c \propto R^4$ and explain why this makes a disk inevitable rather than a point.
**(d)** State what determines a disk's outer radius, and what that implies about planetary systems.
**(e)** The numbers come out at tens of AU. Explain why this is a non-trivial success rather than an assumption built into the calculation.

### 3 — Moving angular momentum outward

**(a)** Show that specific angular momentum in a Keplerian disk increases outward, and compute $j$ at 0.1 and 100 AU around 1 M☉.
**(b)** Explain why moving mass inward requires moving angular momentum outward.
**(c)** Explain why a small amount of mass sent to large radii can absorb the angular momentum of a much larger mass sent inward. Use the scaling.
**(d)** Describe viscous spreading and state what happens to the bulk of the disk mass.

### 4 — The viscosity problem

**(a)** At 1 AU with $T$ = 280 K, compute the sound speed, the Keplerian angular velocity, and the scale height $H = c_s/\Omega$. Express $H/r$.
**(b)** With $\Sigma$ = 17,000 kg/m², compute the mid-plane density and number density, and the mean free path.
**(c)** Compute the molecular viscosity $\nu \approx \lambda c_s$ and the viscous timescale $r^2/\nu$. Express in years and as a multiple of the age of the universe.
**(d)** Observed disk lifetimes are a few Myr. State the discrepancy in orders of magnitude.
**(e)** Compute $\nu$ and $t_{\text{visc}}$ for $\alpha = 10^{-3}$ and $10^{-2}$, and comment on the agreement.
**(f)** Explain precisely why $\alpha$ is "a parametrisation, not a theory," and what question it defers.
**(g)** State the leading candidate mechanism and the reason it does not settle the matter.

### 5 — Jets

**(a)** State the typical jet velocity, mass flux relative to the accretion rate, and extent.
**(b)** Compute the escape velocity from 3 $R_\odot$ around 1 M☉ and compare with jet speeds. What does the agreement tell you?
**(c)** Explain the magnetocentrifugal launching mechanism, using the bead-on-a-rod analogy.
**(d)** Define the Alfvén radius and explain how a lever arm arises.
**(e)** With a lever arm of 3, compute the factor by which an ejected parcel's specific angular momentum exceeds its launch value, and hence estimate what fraction of the angular momentum can be removed by ejecting 10% of the mass.
**(f)** Give two ways in which outflows feed back on the star-formation process.

### 6 — The clock

**(a)** Describe how disk lifetimes are measured, and state the assumption required.
**(b)** From the disk-fraction data, estimate the half-life.
**(c)** State the deadline this imposes on giant planet formation and explain why.
**(d)** Explain, in terms of this deadline, why Uranus and Neptune are a different class of object from Jupiter and Saturn.
**(e)** Viscous accretion alone would not produce the observed dispersal pattern. Name the dominant mechanism and the observational signature that supports it.
**(f)** The disk clock is calibrated against a stellar clock. State one systematic uncertainty this calibration inherits.

### 7 — The fossil

**(a)** State the Sun's share of the solar system's mass and of its angular momentum.
**(b)** Explain how the disk picture accounts for that discrepancy.
**(c)** Name three features of solar system formation that are direct consequences of the disk described here.
**(d)** The Sun has continued to shed angular momentum since formation. Name the mechanism and explain why it is the same underlying physics as the jet lever arm.

### 8 — Numerical

A core of radius 0.03 pc and mass 2 M☉ rotates at $\omega = 3\times10^{-14}$ rad/s and collapses.
**(a)** Compute the specific angular momentum of material at the outer edge.
**(b)** Compute the centrifugal radius, assuming the central object reaches 2 M☉.
**(c)** Compare with the observed disk radius distribution (tens to a few hundred AU) and comment.
**(d)** The star accretes at $10^{-6}\,M_\odot$/yr and drives a jet at 10% of that rate with a lever arm of 3. Estimate the fraction of the disk's angular momentum removed by the jet over 10⁵ yr, stating your assumptions.

### 9 — Open problem: what drives disk accretion?

Disk accretion is observed and its mechanism is not established.
**(a)** State what a successful theory must predict, and what the $\alpha$ prescription substitutes for it.
**(b)** Explain the magnetorotational instability qualitatively, and state the condition it requires.
**(c)** Explain what a "dead zone" is and why its existence is a problem.
**(d)** Name two alternative or supplementary mechanisms, and one observational test that would discriminate between them.
**(e)** ALMA has resolved rings, gaps and spirals in many disks. Explain why such structures do not by themselves settle the accretion question, and what would.

## Worked answers

### 1 — The exhaust before the engine

**(a)** Emission-line spectra characteristic of shocked gas, rather than the reflection or fluorescence expected near young stars. Compact size, often only arcseconds across. Frequent occurrence in symmetric pairs about some point. No visible star at the apparent centre.

**(b)** Proper motions — repeated imaging showed the knots moving at hundreds of km/s, radially away from a common origin. And infrared/radio observations identifying a deeply embedded protostar at that origin.

Proper motions were decisive because they converted a static puzzle into a dynamical one. A stationary knot admits many interpretations — a dense clump, an illuminated cloud, a young star. A knot moving at 200 km/s away from a specific point can only be material that was launched, which immediately requires a launcher and identifies where it is. The motion supplied both the mechanism and the location of the source.

**(c)** Scale and obscuration work in opposite directions for the three components of the system.

The jet extends parsecs — tens of thousands of AU — so it is spatially enormous, and it emerges from the dense core into regions of low extinction where it can be seen optically. It is bright in emission lines because shocks are efficient at producing them.

The disk is a few hundred AU across — arcseconds or less at typical distances — and required interferometry at millimetre wavelengths to resolve.

The protostar is buried under hundreds of magnitudes of visual extinction and emits at around 100 micrometres, requiring space-based infrared astronomy.

The most distant, most extended, and most easily observed part of the system is the part being discarded.

**(d)** William Herschel's "holes in the heavens" (1784) — correctly observed dark patches, interpreted as voids, and not established as obscuring dust until photographic surveys and cluster studies in the early twentieth century. The Kirkwood gaps (1867) — correctly identified as resonances with Jupiter, with no mechanism available for 116 years until computers could integrate orbits for millions of years.

Also creditable: Uranus catalogued repeatedly as an ordinary star before its planetary nature was recognised; impact structures identified in geological survey data long before anyone connected them to an impact event.

### 2 — Why a disk

**(a)** A parcel with specific angular momentum $j$ orbiting at radius $r$ has centrifugal acceleration $v^2/r = j^2/r^3$. Gravity supplies $GM/r^2$. Balancing the two:

$$\frac{j^2}{r^3} = \frac{GM}{r^2} \quad\Longrightarrow\quad \boxed{r_c = \frac{j^2}{GM}}$$

Inside $r_c$ the centrifugal term exceeds gravity, so the parcel cannot fall any further.

**(b)** With $j = \omega R^2$ and $\omega = 10^{-14}$:

| $R$ (pc) | $R$ (m) | $j$ (m²/s) | $r_c$ (AU) |
|---|---|---|---|
| 0.005 | 1.54 × 10¹⁴ | 2.38 × 10¹⁴ | **0.003** |
| 0.015 | 4.63 × 10¹⁴ | 2.14 × 10¹⁵ | **0.23** |
| 0.05 | 1.54 × 10¹⁵ | 2.38 × 10¹⁶ | **28.5** |

**(c)** $j = \omega R^2$, so $j^2 \propto R^4$, and $r_c = j^2/GM \propto R^4$.

A disk is inevitable because material from different origin radii cannot land in the same place. The fourth-power dependence means the spread is enormous — a factor of ten in origin radius gives a factor of ten thousand in landing radius. Infalling material is sorted by angular momentum into a structure extending over many decades in radius, with the innermost material reaching the star and the outermost stopping tens of AU out.

Collapse cannot produce a point. It necessarily produces a radially extended, rotationally supported structure.

**(d)** The outer radius is set by the specific angular momentum of the outermost infalling material, which is $\omega R_{\text{core}}^2$ — a property of the parent core's size and rotation rate.

Implication: the scale of a planetary system is inherited from its natal cloud core. A faster-rotating or larger core produces a larger disk and hence, plausibly, a more extended planetary system. This is a testable prediction, and one worth checking by comparing the observed distribution of disk radii against the observed distribution of core rotation rates.

**(e)** Because nothing in the calculation was tuned to produce it. The inputs are the observed sizes of molecular cloud cores (around 0.05 pc) and their observed rotation rates (around $10^{-14}$ rad/s), both measured independently of anything to do with planetary systems. The output — tens of AU — is the scale of the solar system.

Had the answer come out at 0.01 AU or at 10,000 AU, the picture would have been in serious trouble. A parameter-free prediction landing on the right scale is evidence in favour of the picture, of the same kind as a fragmentation process producing stellar rather than cluster masses.

### 3 — Moving angular momentum outward

**(a)** $v = \sqrt{GM/r}$, so $j = vr = \sqrt{GMr} \propto \sqrt{r}$ — increasing outward.
At 0.1 AU: $j = \mathbf{1.41\times10^{15}}$ m²/s. At 100 AU: $j = \mathbf{4.46\times10^{16}}$ m²/s.

**(b)** Because angular momentum is conserved. A parcel moving inward to a smaller $r$ ends up with a smaller $j = \sqrt{GMr}$, so it must give up the difference, and the only place to put it is other material in the disk, which consequently moves outward.

Accretion and expulsion are two halves of one process: nothing can fall in unless something else moves out.

**(c)** Because $j \propto \sqrt{r}$, the angular momentum carried per unit mass grows only as the square root of radius — but there is no upper bound on $r$.

A mass $m$ sent from $r_0$ to $10^4 r_0$ carries away $100\times$ the specific angular momentum it started with. So it can absorb the angular momentum shed by roughly $100m$ of material falling inward. Sending a little material very far out is an efficient way to dispose of a lot of angular momentum, which is why disks spread rather than simply accreting whole.

**(d)** Viscous spreading: frictional torques between neighbouring annuli transfer angular momentum outward. The inner annulus loses angular momentum and spirals in; the outer gains angular momentum and spirals out.

The bulk of the disk mass — the great majority — accretes onto the star, while a small remainder is carried to large radii and eventually lost. The structure therefore evolves toward a state with almost all the mass at the centre and almost all the angular momentum in a tenuous outer remnant.

### 4 — The viscosity problem

**(a)** $c_s = \sqrt{kT/\mu m_H} = \sqrt{(1.381\times10^{-23})(280)/(2.33 \times 1.673\times10^{-27})} = \mathbf{996\ m/s}$

$\Omega = \sqrt{GM_\odot/r^3} = \sqrt{(1.327\times10^{20})/(3.35\times10^{33})} = 1.99\times10^{-7}$ rad/s

$H = c_s/\Omega = 996/1.99\times10^{-7} = 5.0\times10^{9}$ m $= \mathbf{0.033\ AU}$

$H/r = \mathbf{0.033}$ — a thin disk, with an aspect ratio of about 1:30.

**(b)** $\rho = \Sigma/2H = 17{,}000/(1.0\times10^{10}) = \mathbf{1.70\times10^{-6}\ kg/m^3}$

$n = \rho/\mu m_H = 1.70\times10^{-6}/(3.90\times10^{-27}) = \mathbf{4.36\times10^{20}\ m^{-3}}$

$\lambda = 1/n\sigma = 1/(4.36\times10^{20} \times 2\times10^{-19}) = \mathbf{0.011\ m}$

**(c)** $\nu = \lambda c_s = 0.011 \times 996 = \mathbf{11.4\ m^2/s}$

$t = r^2/\nu = (1.496\times10^{11})^2/11.4 = 1.96\times10^{21}$ s $= \mathbf{6.2\times10^{13}\ yr}$

$= \mathbf{4{,}500\times}$ the age of the universe.

**(d)** Observed lifetime: a few Myr. Predicted lifetime: $6\times10^{13}$ yr. The ratio is roughly $2\times10^{7}$ — seven orders of magnitude.

**(e)** $\nu = \alpha c_s H$:

$\alpha = 10^{-3}$: $\nu = 4.98\times10^{9}$ m²/s, $t = \mathbf{142{,}000\ yr}$

$\alpha = 10^{-2}$: $\nu = 4.98\times10^{10}$ m²/s, $t = \mathbf{14{,}000\ yr}$

These are local viscous times at 1 AU; integrated over the whole disk they correspond to global evolution on Myr timescales, matching observation. A single dimensionless number in the range $10^{-3}$–$10^{-2}$ reproduces the observations.

**(f)** Because it does not say what causes the transport; it says only that whatever does it operates at a fraction $\alpha$ of the maximum plausible rate — the largest eddies, of size $H$, moving at $c_s$.

That is a dimensional bound repackaged as a model. It states the answer must be of a particular form, and then fits the one free parameter to the data.

The question it defers is the physical one: what generates the turbulence, whether $\alpha$ is constant with radius and time (it almost certainly is not), whether the transport is even turbulent rather than, say, magnetically driven from the surface, and what actually determines its value.

**(g)** The magnetorotational instability, identified by Balbus and Hawley in 1991: a weak magnetic field connecting an inner and an outer fluid parcel in a differentially rotating disk acts like a spring, transferring angular momentum outward and amplifying the separation between the two — an instability that saturates into turbulence.

It does not settle the matter because it requires the gas to be sufficiently ionised for the field to couple to it. Much of a protoplanetary disk — cold, dense, and shielded from ionising radiation — is far too neutral, producing dead zones where the mechanism cannot operate. Yet accretion evidently proceeds there regardless.

### 5 — Jets

**(a)** Velocity 100–400 km/s, highly collimated. Mass flux roughly 10% of the accretion rate. Extent of parsecs — tens of thousands of AU — terminating in Herbig–Haro shocks.

**(b)** $v_{\text{esc}} = \sqrt{2GM_\odot/3R_\odot} = \sqrt{2(1.327\times10^{20})/(2.087\times10^{9})} = \mathbf{357\ km/s}$

Jets move at roughly this speed, which reveals where they are launched. A flow escaping a gravitational well emerges at approximately the escape velocity from its launch point, so a jet at 200–350 km/s must originate within a few stellar radii — in the innermost disk, not the outer regions. That localisation points to a magnetic launching mechanism operating where the field is strongest and the rotation fastest.

**(c)** Magnetic field lines are anchored in the disk and forced to rotate with it. Because the field is strong enough near the launch point to dominate the gas dynamics, the field lines behave like rigid rotating wires.

Gas attached to a field line inclined outward from the rotation axis is flung outward along it — exactly like a bead threaded on a rotating rod: if the rod is inclined sufficiently, the bead's equilibrium is unstable and it slides outward, accelerating as it goes. The gas is accelerated centrifugally until it reaches escape speed and the field can no longer constrain it.

Collimation follows because the field lines converge toward the rotation axis at larger heights, funnelling the flow into a narrow jet.

**(d)** The Alfvén radius is where the kinetic energy density of the outflowing gas equals the magnetic energy density — the point at which the flow becomes strong enough to bend the field rather than be guided by it.

Inside it, the field enforces co-rotation: the gas is forced to keep rotating at the angular velocity of its launch point even as it moves outward. So a parcel released at $r_A$ has specific angular momentum $\Omega_{\text{launch}}r_A^2$ rather than $\Omega_{\text{launch}}r_{\text{launch}}^2$. The lever arm is the ratio $r_A/r_{\text{launch}}$.

**(e)** $j/j_{\text{launch}} = (r_A/r_{\text{launch}})^2 = 3^2 = \mathbf{9}$.

Ejecting a fraction $f$ of the mass removes a fraction $\approx 9f$ of the angular momentum, so $f = 0.1$ removes about 90%.

Ejecting a tenth of the mass disposes of nearly all the angular momentum. This is what makes outflows an efficient solution to a problem that viscous transport alone would solve only slowly.

**(f)** They limit the star's final mass, ejecting material that would otherwise have accreted — one of the processes that reduce a fragment's final mass below its initial mass, and hence part of why the distribution of stellar masses peaks below a typical fragmentation mass.

They drive turbulence in the parent cloud. The collective momentum injected by many outflows contributes to the turbulent driving needed to sustain support against gravitational collapse — so the products of star formation help maintain the medium that produces it.

### 6 — The clock

**(a)** By surveying clusters of known age and measuring the fraction of members with detectable disks, identified by infrared excess above the stellar photosphere.

The assumption required: that clusters of different ages are otherwise comparable — drawn from similar populations, with similar detection completeness — so that the disk fraction as a function of age traces the evolution of a single population rather than differences between environments.

**(b)** From 80% at 1 Myr to 45% at 3 Myr to 25% at 5 Myr, the half-life is roughly 2–3 Myr.

**(c)** Giant planets must form in under about 5 Myr.

Because a giant planet is predominantly hydrogen and helium, and that gas is only available while the disk survives. Core accretion requires building a solid core of roughly ten Earth masses and then capturing a massive gaseous envelope onto it, and both stages must complete before the disk disperses. After that, there is nothing left to accrete.

**(d)** Because Jupiter and Saturn completed the race and Uranus and Neptune did not.

All four formed beyond the snow line, where solids were abundant. Jupiter and Saturn reached the runaway-accretion threshold early and captured enormous envelopes — around 90% hydrogen and helium by mass. Uranus and Neptune reached comparable core masses too late, when the disk was already dispersing, and captured only 5–15% hydrogen and helium.

The ice giants are a distinct class of object because of a deadline set by photoevaporation. They lost a race.

**(e)** Photoevaporation — ultraviolet and X-ray heating of the disk's upper layers by the central star and by nearby massive stars, driving gas off once it exceeds the local escape velocity.

The supporting signature is two-timescale behaviour: disks persist for a few Myr and then vanish quickly, rather than thinning gradually. Viscous accretion alone would produce slow, monotonic decline. Transition disks, with cleared inner holes and intact outer regions, appear to be objects caught mid-dispersal.

**(f)** The cluster ages used to calibrate disk lifetimes come from main-sequence turnoffs and pre-main-sequence contraction tracks, so the disk clock inherits the systematic uncertainties of the stellar clock underneath it — in particular, cluster ages depend on absolute magnitudes, which depend on distances, and stellar evolutionary tracks carry their own mass-scale uncertainties. A disk lifetime is not an independently measured quantity; it is calibrated against a stellar one.

### 7 — The fossil

**(a)** The Sun holds 99.87% of the solar system's mass and about 0.6% of its angular momentum. Jupiter alone holds roughly 61% of the angular momentum with only 0.095% of the mass.

**(b)** Because the Sun shed its angular momentum into the disk during formation, exactly as described above. Material could not reach the star until its angular momentum was transported outward, so the angular momentum ended up in the outer disk while the mass ended up at the centre.

What remains of that disk is the planets, and they still carry the angular momentum. The solar system's anomalous distribution is not a separate puzzle requiring its own explanation; it is the direct record of the disposal process that allowed the Sun to form at all.

**(c)** The snow line — the radius beyond which water ice condenses, a feature of the disk's temperature profile and one of the organising concepts of solar system formation. The density gradient among the Galilean moons — the same physics in a circumplanetary disk. Arrokoth's gentle contact-binary merger — planetesimal formation in the disk's outer reaches, preserved essentially unmodified.

Also creditable: the coplanarity and near-circularity of planetary orbits; the characteristic ratio of satellite mass to planet mass seen across the giant planets.

**(d)** Magnetic braking by the solar wind. The Sun's magnetic field enforces co-rotation of the outflowing wind out to many stellar radii, so each departing particle carries away far more angular momentum than it had at the surface.

It is the same lever-arm physics as jet launching: a magnetic field forcing material to co-rotate out to a large radius before releasing it, so that a small mass loss removes a disproportionate share of the angular momentum. Jets do this violently over a few hundred thousand years; the wind does it gently over billions — and both are why the Sun rotates once a month rather than in a few hours.

### 8 — Numerical

**(a)** $R = 0.03 \times 3.086\times10^{16} = 9.26\times10^{14}$ m.

$j = \omega R^2 = 3\times10^{-14}(9.26\times10^{14})^2 = \mathbf{2.57\times10^{16}\ m^2/s}$

**(b)** $r_c = j^2/GM = (2.57\times10^{16})^2/[(6.674\times10^{-11})(3.978\times10^{30})] = 2.49\times10^{12}$ m $= \mathbf{16.6\ AU}$

**(c)** Comfortably within the observed range of tens to a few hundred AU, and toward the compact end.

The calculation gives the radius at which the outermost material lands, so it is a lower bound on the eventual disk size — viscous spreading subsequently moves material further out. A modest core rotation produces a solar-system-scale disk without any adjustment to the numbers.

**(d)** Jet mass over 10⁵ yr: $0.1 \times 10^{-6} \times 10^{5} = \mathbf{0.01\ M_\odot}$.

Assuming a launch radius of 0.1 AU and a lever arm of 3, each parcel carries $j = 3^2\sqrt{GM(0.1\ \text{AU})} = 9 \times 1.99\times10^{15} = 1.79\times10^{16}$ m²/s, so

$$J_{\text{jet}} = (0.01 \times 1.989\times10^{30})(1.79\times10^{16}) = 3.6\times10^{44}\ \text{kg\,m}^2/\text{s}$$

Taking a disk of 0.01 M☉ at a characteristic 30 AU, $J_{\text{disk}} = (1.989\times10^{28})\sqrt{GM(30\ \text{AU})} = 6.9\times10^{44}$.

Ratio ≈ 0.5 — the jet removes roughly half the disk's angular momentum over 10⁵ years.

Assumptions to state: a fixed launch radius, whereas real jets are launched over a range of radii; a constant lever arm; a steady accretion rate over 10⁵ years, which is known not to hold, since accretion proceeds episodically rather than steadily; and a single characteristic disk radius. The calculation is an order-of-magnitude check, and it confirms that jets are quantitatively capable of the disposal task, which is the point of the exercise.

### 9 — Open problem: what drives disk accretion?

**(a)** A successful theory must predict the magnitude of the transport (equivalently, the effective $\alpha$) from first principles; its dependence on radius, density, temperature and ionisation state; its time variability, including whether it produces the episodic accretion bursts observed at protostars; and its behaviour in dead zones, where the leading candidate mechanism cannot operate.

The $\alpha$ prescription substitutes a single fitted number for all of these — a dimensional bound on the transport rate, with the underlying physics absorbed into a parameter. It is worth being precise about what this substitution costs. A single value of $\alpha$, applied uniformly, cannot by construction predict a dead zone, since a dead zone is exactly a region where the physical transport mechanism switches off while the fitted parameter has no mechanism for switching off with it; nor can it predict an accretion burst, since a constant $\alpha$ produces smooth, steady evolution by definition. Every phenomenon that looks like a departure from smooth, spatially uniform accretion is, from the point of view of the $\alpha$ prescription, an anomaly to be patched with a radius- and time-dependent $\alpha(r,t)$ rather than a prediction the original framework makes on its own.

**(b)** A weak magnetic field threads a differentially rotating disk. Two fluid parcels at slightly different radii are connected by a field line, which behaves like a spring. Because the inner parcel orbits faster, the spring is stretched; the tension slows the inner parcel, removing angular momentum so that it falls further in, and speeds the outer parcel, adding angular momentum so that it moves further out. That increases the separation, stretching the spring further still — a runaway, which saturates into turbulence that transports angular momentum outward.

It requires the gas to be sufficiently ionised for the magnetic field to be coupled to the fluid at all. In a neutral gas, the field slips through the material and exerts no torque.

**(c)** A dead zone is a region of the disk — typically the cold, dense mid-plane at intermediate radii — where the ionisation fraction is too low for the magnetorotational instability to operate. Cosmic rays and stellar X-rays ionise only the surface layers; the interior is shielded from them.

It is a problem because accretion evidently proceeds regardless. Observed accretion rates onto young stars require angular momentum transport throughout the disk, including in regions where the leading mechanism cannot function. Either something else operates there, or the transport is confined to active surface layers with the mid-plane essentially inert — which would change the structure and evolution of the disk substantially, and matters directly for where planets form.

**(d)** Gravitational instability — a sufficiently massive disk becomes self-gravitating and develops spiral structure, which transports angular momentum. This applies only to young, massive disks.

Magnetised disk winds — angular momentum removed vertically from the disk surface rather than transported radially, essentially the same mechanism that launches jets, but operating over a wide range of radii rather than only near the star.

A discriminating observation: the two predict different velocity structure. Radial turbulent transport predicts measurable turbulent line broadening in the disk mid-plane; a wind removes angular momentum without requiring strong internal turbulence, and predicts a detectable slow outflowing component at the disk surface. Measurements of turbulent linewidths and of molecular wind signatures test exactly this distinction, and the turbulence measured so far has generally come out lower than $\alpha \sim 10^{-2}$ turbulence would require, which favours winds.

**(e)** Because structure is not transport. Rings, gaps and spirals show that something is organising the disk radially, but several unrelated processes produce similar morphology: embedded planets clearing gaps, condensation fronts such as snow lines altering dust properties, magnetic zonal flows, and gravitational instability. The observation is degenerate with respect to the mechanism, and inferring accretion physics from morphology alone would be reading a cause from an appearance rather than establishing it independently.

What would settle it: direct measurement of the gas kinematics — turbulent linewidths, radial drift velocities, and vertical outflow — rather than dust morphology. Those are what distinguish a turbulent disk from a wind-driven one, and they are increasingly measurable with high-resolution molecular line observations.$astroDisks_master$,
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
  select $astroDisks_quiz$[{"id": "q1", "type": "mcq", "prompt": "Herbig-Haro objects were catalogued by George Herbig and Guillermo Haro in 1946-1947, but the mechanism producing them was not understood for about thirty years, until observations in the 1980s showed the knots moving at hundreds of kilometres per second away from a common origin. Why were the objects visible so long before their cause could be identified?", "options": ["Because the jets that produce Herbig-Haro objects extend for parsecs and emerge from the dense cloud into regions of low extinction, so they could be photographed with 1940s equipment, while the disk and the protostar driving the jets are far smaller and far more deeply obscured, requiring interferometry and space-based infrared astronomy that did not yet exist", "Because early telescopes could not resolve emission-line spectra at all, so the objects were misidentified as ordinary stars until spectroscopy improved in the 1980s", "Because Herbig and Haro deliberately withheld their identification of the objects as jet shocks until proper motions could be confirmed, despite already suspecting the correct explanation in the 1940s", "Because the objects only began emitting light in the 1980s, coinciding with the moment their driving protostars first switched on"], "answerIndex": 0, "explanation": "The jet responsible for a Herbig-Haro object extends for parsecs, tens of thousands of astronomical units, and travels away from the dense natal core into regions of comparatively low extinction, so it was bright enough in emission lines to be photographed with 1940s plates. The disk producing the jet is only a few hundred astronomical units across and required millimetre interferometry to resolve, while the protostar itself sits behind hundreds of magnitudes of visual extinction and needed space-based infrared astronomy to detect. The exhaust was therefore visible for roughly four decades before the engine producing it could be observed at all, and the interpretation only became possible once proper motions showed the knots moving away from a common point that infrared and radio observations then identified as an embedded protostar."}, {"id": "q2", "type": "mcq", "prompt": "A rotating molecular cloud core collapses under gravity. Why does this process necessarily produce a disk rather than allowing all of the material to fall directly onto a single central point?", "options": ["Because magnetic pressure prevents material closer than a fixed radius from falling any further, regardless of how much angular momentum it carries", "Because the centrifugal radius at which infalling material is halted by centrifugal support scales as the fourth power of the material's original distance from the rotation axis, so material from different starting radii lands at wildly different final radii rather than converging on a single point, sorting the infalling envelope into an extended, rotationally supported structure", "Because collisions between infalling gas parcels randomise their trajectories before they can reach the centre, spreading the material out by pure chance rather than by any systematic effect", "Because radiation pressure from the newly forming protostar pushes outer material away before it can fall all the way in"], "answerIndex": 1, "explanation": "A parcel of gas at radius R in a rotating core carries specific angular momentum j equal to the rotation rate times R squared, and this quantity is conserved as the parcel falls. It cannot fall past the radius where centrifugal support balances gravity, the centrifugal radius, equal to j squared divided by G times the central mass. Because j scales as R squared, the centrifugal radius scales as R to the fourth power, so a factor of ten difference in a parcel's original distance from the rotation axis produces a factor of ten thousand difference in where it finally lands. Material from the inner core reaches close to the star while material from the outer core stops far away, and the infalling envelope is necessarily sorted by angular momentum into a radially extended disk rather than converging on a point. The disk's outer radius is set by the angular momentum of the outermost material, making the scale of a planetary system a fossil of how fast its parent core was rotating."}, {"id": "q3", "type": "mcq", "prompt": "At one astronomical unit in a minimum-mass solar nebula disk (280 kelvin, surface density about 17,000 kilograms per square metre), ordinary molecular viscosity gives a viscous timescale of about 6 times 10 to the 13th years, roughly 4,500 times the age of the universe, against observed disk lifetimes of only a few million years. Why is the widely used Shakura-Sunyaev alpha prescription, published in 1973, described as a parametrisation rather than a genuine theory of this transport?", "options": ["Because it was derived purely from dimensional analysis without any reference to observed disk lifetimes, so it fails to match the data at all", "Because it writes the effective viscosity as alpha times the sound speed times the disk scale height, with alpha a single fitted dimensionless number that reproduces observed accretion rates, but it does not identify what physically generates the turbulence, does not predict how alpha should vary with radius or time, and does not explain regions where the leading candidate mechanism cannot operate", "Because alpha must always be greater than one, which contradicts the physical requirement that turbulent eddies cannot exceed the local sound speed or scale height", "Because the prescription applies only to disks around black holes and cannot be extended to protoplanetary disks around young stars"], "answerIndex": 1, "explanation": "The Shakura-Sunyaev prescription writes the effective viscosity as a dimensionless parameter alpha, bounded by one, multiplied by the sound speed and the disk scale height, on the reasoning that turbulent eddies cannot exceed those two scales. With alpha of order one thousandth to one hundredth, the prescription reproduces observed disk lifetimes and accretion rates well. But it is a parametrisation because it states only that transport proceeds at some fraction of the maximum plausible rate without identifying what actually drives the turbulence, without predicting whether alpha is constant with radius and time, and without explaining what happens in dead zones, regions of a disk too neutral for the leading candidate mechanism, the magnetorotational instability identified by Balbus and Hawley in 1991, to operate at all since that mechanism requires the gas to be ionised for a magnetic field to couple to it. The physics is absorbed into a single fitted number rather than derived from first principles, leaving disk accretion observationally certain and theoretically unresolved."}, {"id": "q4", "type": "mcq", "prompt": "Bipolar jets from young accreting stars typically move at 100 to 400 kilometres per second, close to the escape velocity of about 357 kilometres per second computed for a point three solar radii from a one-solar-mass star. With a magnetic lever arm of about 3, ejecting only about 10 percent of the accreted mass can remove roughly 90 percent of the star-disk system's angular momentum. What mechanism explains both the jet speed and this disproportionate removal of angular momentum?", "options": ["Radiation pressure from the young star's photosphere accelerates the ejected gas directly outward, with the lever arm referring to the increasing distance light has to travel as the gas moves away", "A magnetocentrifugal mechanism: magnetic field lines anchored in the disk and forced to co-rotate with it act like rigid rods, flinging attached gas outward like a bead sliding along a spinning rod until it reaches roughly escape velocity, while the field enforces co-rotation out to several times the launch radius before releasing the gas, so each ejected parcel carries away a specific angular momentum roughly nine times larger, with a lever arm of three, than it had at its point of launch", "Collisions between infalling and outflowing material near the disk surface convert inward momentum directly into outward momentum through elastic scattering, with no role for magnetic fields", "Thermal pressure from a hot corona surrounding the star pushes gas away isotropically, and the jets are simply the small fraction of that isotropic outflow that happens to align with the rotation axis"], "answerIndex": 1, "explanation": "Jet speeds close to the escape velocity from a few stellar radii point to a launch region deep in the inner disk and to a magnetocentrifugal mechanism: magnetic field lines anchored in the disk rotate with it and behave like rigid wires, so gas attached to an outward-inclined field line is flung centrifugally along it, much like a bead on a spinning rod, until it reaches roughly escape speed and detaches from the field. Because the field enforces co-rotation out to the Alfven radius, the point where the flow's kinetic energy density first exceeds the magnetic energy density, an ejected parcel keeps rotating at the disk's angular velocity out to several times its launch radius before being released. With a lever arm, the ratio of the Alfven radius to the launch radius, of about three, the specific angular momentum carried away is about nine times what the parcel started with, since the relation scales as the square of the lever arm, so removing about a tenth of the accreted mass can carry off roughly ninety percent of the angular momentum."}, {"id": "q5", "type": "mcq", "prompt": "The fraction of young stars retaining a detectable circumstellar disk falls from about 80 percent at 1 million years of cluster age to about 5 percent at 10 million years, dispersal driven mainly by ultraviolet and X-ray heating that evaporates the disk's upper layers. Why does this disk lifetime effectively set a deadline for giant planet formation, and why did Jupiter and Saturn end up so different in composition from Uranus and Neptune as a result?", "options": ["Because a giant planet is made mostly of hydrogen and helium gas that is only available while the disk survives, so a solid core of roughly ten Earth masses must finish forming and then capture a massive gas envelope before the disk disperses within about five million years; Jupiter and Saturn completed both stages in time and captured envelopes of roughly 90 percent hydrogen and helium by mass, while Uranus and Neptune reached comparable core masses too late and captured only about 5 to 15 percent", "Because disk gas becomes chemically toxic to planet formation after about five million years, preventing any further accretion regardless of how much gas remains present", "Because Jupiter and Saturn formed closer to the young star where temperatures were higher, which by itself explains their larger hydrogen and helium content compared with Uranus and Neptune", "Because the fraction of stars with disks is unrelated to planet formation timescales, and the compositional difference between the two pairs of giant planets is explained entirely by their different distances from the snow line rather than by any timing effect"], "answerIndex": 0, "explanation": "A giant planet's hydrogen and helium envelope can only be captured while gas remains present in the disk, and disk gas disperses on a timescale of a few million years, driven largely by photoevaporation, ultraviolet and X-ray heating of the disk's upper layers that drives gas away once it exceeds the local escape velocity, producing a sharp two-stage disappearance rather than a slow decline. Core accretion requires building a solid core of roughly ten Earth masses and then undergoing runaway gas accretion onto that core, and both stages must finish before the surrounding gas is gone. Jupiter and Saturn reached the runaway-accretion threshold early enough to capture roughly 90 percent hydrogen and helium envelopes by mass, while Uranus and Neptune reached comparable core masses too late, after the disk had substantially dispersed, and captured only about 5 to 15 percent hydrogen and helium, making the ice giants a compositionally distinct class of object because they lost a race against the photoevaporation clock rather than because of any difference in formation mechanism."}, {"id": "q6", "type": "open", "prompt": "The Shakura-Sunyaev alpha prescription reproduces observed protoplanetary disk lifetimes and accretion rates using a single dimensionless parameter, typically of order one thousandth to one hundredth, in place of ordinary molecular viscosity, which falls short by roughly seven orders of magnitude. Explain the numerical scale of the viscosity problem this prescription is patching over, and explain precisely what physical question the alpha prescription leaves unanswered even though it fits the observed numbers.", "rubric": "A strong answer should reconstruct the magnitude of the discrepancy: at one astronomical unit in a minimum-mass solar nebula disk at 280 kelvin with surface density about 17,000 kilograms per square metre and scale height about 0.033 astronomical units, the molecular mean free path is about one centimetre, giving a molecular viscosity of roughly 11 square metres per second and a viscous timescale of about 6 times 10 to the 13th years, some 4,500 times the age of the universe, against observed disk lifetimes of only a few million years, a shortfall of about seven orders of magnitude. The answer should explain that the alpha prescription resolves this numerically by proposing that the disk is turbulent and writing the effective viscosity as alpha multiplied by the sound speed and the local scale height, since turbulent eddies cannot plausibly exceed those two scales, and that values of alpha around one thousandth to one hundredth reproduce the observed lifetimes and accretion rates well. Critically, the answer should explain why this is a parametrisation rather than a theory: alpha does not specify what physically generates the turbulence, whether it is constant with radius and time, whether the transport is even turbulent as opposed to, for instance, magnetically driven from the disk surface, or what determines its numerical value from first principles; it states only that transport proceeds at some fraction of the maximum plausible rate and fits that one free parameter to observation. A complete answer should note that the leading candidate mechanism, the magnetorotational instability identified by Balbus and Hawley in 1991, in which a weak magnetic field connecting differentially rotating parcels acts like a spring and transfers angular momentum outward, produces alpha values in roughly the right range in simulations but requires the gas to be sufficiently ionised for the field to couple to it, and that much of a real protoplanetary disk, cold, dense, and shielded from ionising radiation, is too neutral for this mechanism to operate, producing dead zones that remain an unresolved problem sitting directly across the region where planets themselves are assembled."}, {"id": "q7", "type": "open", "prompt": "The Sun holds about 99.87 percent of the solar system's mass but only about 0.6 percent of its angular momentum, while Jupiter holds about 61 percent of the angular momentum with only about 0.095 percent of the mass. Explain how the physics of disk formation and disk-driven jets accounts for this split, and explain why the split is described as a fossil record of how the Sun assembled rather than a separate, unrelated puzzle.", "rubric": "A strong answer should connect the mass-angular-momentum split directly to the disk-formation and outflow mechanisms described earlier. It should explain that a collapsing, rotating cloud core cannot deposit material directly onto a forming star without violating conservation of angular momentum, so infalling material is sorted by its specific angular momentum into a disk whose outer radius is set by the angular momentum of the outermost material, with the centrifugal radius scaling as the fourth power of the material's original distance from the rotation axis. It should explain that getting mass from the disk onto the star requires transporting angular momentum outward, through viscous spreading within the disk and, more efficiently, through magnetocentrifugal jets that use a lever-arm effect, in which magnetic field lines enforce co-rotation out to several times the launch radius so that ejecting roughly a tenth of the accreted mass can remove roughly ninety percent of the angular momentum being carried. The answer should conclude that because the Sun could only accrete its mass by shedding its angular momentum into the surrounding disk and outflows, and what remains of that disk today is the planetary system, the planets are not a coincidental leftover but the literal repository of the angular momentum the Sun had to discard in order to form at all, meaning the mass-angular-momentum split observed today is a direct, still-legible record of the disposal process rather than an independent anomaly requiring its own explanation. Credit should be given for noting that the Sun has continued shedding angular momentum since formation through magnetic braking of its stellar wind, the same lever-arm physics operating far more slowly over billions of years rather than violently over a few hundred thousand."}]$astroDisks_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/star-birth/disks-and-outflows', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
