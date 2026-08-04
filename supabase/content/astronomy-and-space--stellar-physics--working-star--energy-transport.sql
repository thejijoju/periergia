-- Astronomy & Space · Stellar Physics — The Working Star —
-- "Energy Transport". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/working-star/energy-transport
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- A photon would cross the Sun in 2.3 seconds in a straight line but
-- actually random-walks out over roughly a hundred thousand years, because
-- the interior is opaque; the radiative diffusion equation and why higher
-- opacity steepens the temperature gradient rather than reducing the
-- luminosity, since the star must deliver L regardless; Kramers' law and
-- the counterintuitive fact that opacity rises as temperature falls; the
-- Schwarzschild criterion for convection and its three triggers; the
-- structure inverting across the mass range (fully convective below 0.35
-- solar masses, radiative core/convective envelope for the Sun, convective
-- core/radiative envelope above 1.3 solar masses) and the fuel-fraction,
-- lifetime, mass-luminosity-slope, and magnetic-dynamo consequences that
-- follow from each regime; and granulation and helioseismology as direct
-- observational confirmation, with the solar convection zone's base at
-- 0.713 solar radii traced to the same H-minus ion that governs the
-- Hayashi track and the Balmer-line peak at spectral type A0.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/working-star/energy-transport',
    'research',
    'advanced',
    'read',
    $astroEnergyTransport_master$> A photon released at the centre of the Sun would reach the surface in 2.3 seconds if it travelled in a straight line. It actually takes something between ten thousand and a hundred thousand years, because the interior is opaque and the photon does not travel — it diffuses, absorbed and re-emitted in a random direction over and over, making almost no net progress with each step. How that diffusion works, when it gives way to bulk motion instead, and which of the two a star chooses turns out to set its internal structure, its appearance, its magnetic behaviour, and how much of its own fuel it can ever use.

## Two point three seconds

A photon travelling in a straight line from the centre of the Sun to the surface would take

$$t = \frac{R_\odot}{c} = \frac{6.957\times10^{8}}{2.998\times10^{8}} = 2.32\ \text{seconds}$$

That is not what happens.

### The random walk

The Sun's interior is opaque. A photon travels a short distance, is absorbed or scattered, and is re-emitted in a random direction. It then travels another short distance, and so on.

For a random walk of $N$ steps of length $\ell$, the net displacement is not $N\ell$ but $\ell\sqrt{N}$ — the steps largely cancel. So to achieve a net displacement $R$ requires

$$N = \left(\frac{R}{\ell}\right)^2 \quad\text{steps, taking}\quad t = \frac{N\ell}{c} = \frac{R^2}{\ell c}$$

With a mean free path of about a millimetre in the deep interior:

| Mean free path | Steps required | Time |
|---|---|---|
| 1 cm | 4.8 × 10²¹ | 5,100 yr |
| **1 mm** | **4.8 × 10²³** | **51,000 yr** |
| 0.1 mm | 4.8 × 10²⁵ | 510,000 yr |

The energy takes something of order a hundred thousand years to make a 2.3-second journey. The ratio between diffusive and free-flight times is $R/\ell$ — about $7\times10^{11}$ for a millimetre mean free path. That single number is the measure of how opaque a star is.

### A caveat worth having

The random walk above is an order-of-magnitude argument, not a calculation. The mean free path is not constant: it is far shorter than a millimetre in the core and rises by many orders of magnitude toward the surface. A proper treatment solves the diffusion equation with a radially varying opacity, and gives an energy diffusion time of roughly $1.7\times10^{5}$ years — which is the Kelvin–Helmholtz timescale established from hydrostatic equilibrium, arrived at from the other direction.

Textbook figures ranging from $10^4$ to $10^7$ years reflect different assumptions about the mean free path, not different physics. It is worth flagging, because this is one of the most-quoted numbers in astronomy and it is quoted with unwarranted precision.

### Why it matters

Two consequences follow immediately, and both are structural.

The sunlight we see carries no information about the core. By the time energy reaches the surface it has been absorbed and re-emitted innumerable times and thoroughly thermalised. The photosphere's spectrum reports on the photosphere. Photons cannot see inside a star — which is why neutrinos and oscillation modes are the only direct probes of the interior.

And the star's luminosity is set by this rate. The mass–luminosity relation is a statement that a star's output is determined by how fast energy can leak out rather than by how fast it is generated. This node is what "leak out" means, and the opacity is the quantity that controls it.

{{image: Sun | The Sun's photosphere: the spectrum that reaches us here reports only on this thin visible layer, since a photon born at the centre is absorbed and re-emitted so many times on its way out that no trace of the core's actual conditions survives the journey.}}

## Radiative diffusion

The transport equation follows from treating radiation as a diffusing fluid. Energy flows down the temperature gradient at a rate set by how far photons get between interactions:

$$F = -\frac{4acT^3}{3\kappa\rho}\frac{dT}{dr}$$

where $\kappa$ is the opacity — the cross-section for absorption or scattering per unit mass, in m²/kg. Equivalently, for the luminosity crossing a spherical shell:

$$L(r) = -\frac{16\pi acr^2T^3}{3\kappa\rho}\frac{dT}{dr}$$

Read the structure of it. The flux is large when the temperature gradient is steep, when the temperature is high (radiation energy density goes as $T^4$), and when the opacity or density is low. Invert it and you get the equation as it is usually used:

$$\frac{dT}{dr} = -\frac{3\kappa\rho L(r)}{16\pi acr^2T^3}$$

To carry a given luminosity through opaque material, a star must maintain a temperature gradient — and the more opaque the material, the steeper the gradient must be.

That inversion is the key to everything that follows. Opacity does not reduce the luminosity; it steepens the gradient. The star must deliver $L$ to the surface regardless, so if the material resists, the temperature difference required to push the energy through simply increases.

### What sets the opacity

Several processes contribute, and which dominates depends on temperature and composition:

| Source | Behaviour | Where it dominates |
|---|---|---|
| Electron scattering | $\kappa$ independent of $T$ and $\rho$ | hot, fully ionised interiors |
| Free–free (bremsstrahlung) | $\kappa \propto \rho T^{-3.5}$ | stellar interiors generally |
| Bound–free | $\kappa \propto \rho T^{-3.5}$; needs bound electrons | strongly metallicity-dependent |
| Bound–bound (lines) | complex | cooler layers |
| H⁻ ion | binding 0.75 eV; extremely $T$-sensitive | cool photospheres |

The free–free and bound–free forms together give Kramers' law:

$$\kappa \propto \rho T^{-3.5}$$

Note the sign of the temperature dependence, because it is the opposite of most people's intuition: opacity rises as temperature falls. The hot interior of a star is comparatively transparent; the cooler outer layers are opaque. That is why convection zones sit in the outer parts of solar-type stars, and it is the reason the structure comes out as it does.

And bound–free opacity requires bound electrons, hence elements heavier than hydrogen and helium. So metal-poor stars are less opaque, leak energy more readily, and are more luminous and hotter at a given mass — the origin of the subdwarf sequence on the Hertzsprung–Russell diagram.

## When the gas moves instead

Radiative diffusion has a limit. If the required temperature gradient becomes too steep, the gas becomes unstable to convection, and bulk motion takes over.

### The Schwarzschild criterion

Displace a parcel of gas slightly upward. It finds itself at lower pressure, so it expands — and because the expansion is fast compared with heat exchange, it expands adiabatically and cools.

Now compare it with its new surroundings. If the parcel is cooler than its surroundings, it is denser, and it sinks back: stable. If the parcel is still hotter than its surroundings, it is less dense, and it continues to rise: unstable — and it keeps going, carrying its heat with it.

The condition is therefore a comparison of two gradients: how fast the surroundings cool with height, versus how fast the parcel cools as it expands.

$$\left|\frac{dT}{dr}\right|_{\text{rad}} > \left|\frac{dT}{dr}\right|_{\text{ad}} \quad\Longrightarrow\quad \text{convection}$$

Convection occurs when the surroundings cool faster with height than an adiabatically rising parcel does.

### Three ways to trigger it

Reading the criterion together with the radiative gradient equation, there are three routes.

High opacity: $\kappa$ large makes the radiative gradient steep, because radiation struggles to carry the flux. This is what happens in the cool outer layers of solar-type stars, where Kramers' law and H⁻ opacity make the material very opaque.

High flux in a small volume: a large $L(r)$ at small $r$ demands a steep gradient. This is what happens in the cores of massive stars, where the CNO cycle's $T^{17}$ dependence concentrates all the energy generation into a tiny central region.

Low adiabatic gradient: in a partial ionisation zone, energy added to the gas goes into ionising atoms rather than raising the temperature, so a rising parcel cools less than it otherwise would. This lowers $|dT/dr|_{ad}$ and makes convection easier — and it is why the hydrogen and helium ionisation zones near a star's surface are convectively unstable. That same mechanism is, in a different context, the valve that drives the pulsation of Cepheids and RR Lyrae.

### Why convection is so effective

Once it starts, convection carries energy with extraordinary efficiency. In a stellar interior, only a tiny superadiabatic excess — a fractional temperature difference of order $10^{-6}$ — suffices to transport the entire luminosity.

Consequently, a convective region is almost exactly adiabatic, and this is a considerable practical convenience: the temperature structure can be written down without knowing anything about the details of the convection.

The near-surface layers are the exception. There the density is low, convection is inefficient, and a substantial superadiabatic gradient is required — which is precisely where the theory is worst. The standard treatment, mixing-length theory, parametrises the whole of convection with a single free parameter — the ratio of the mixing length to the pressure scale height — tuned so that a solar model reproduces the observed radius.

Convection is the largest source of uncertainty in stellar structure, and it is handled by a one-parameter recipe from 1958.

{{image: Solar granulation | Solar granulation: the photosphere resolved into roughly two million convective cells, each about 1,000 kilometres across and lasting eight to ten minutes, with bright centres of rising hot gas ringed by darker lanes of cooler gas sinking back down — convection made directly visible.}}

## The structure inverts

Now the result that makes this node structural rather than technical.

Apply the criterion across the mass range and the answer flips twice.

| Mass | Structure | Why |
|---|---|---|
| **< 0.35 M☉** | **fully convective** | cool and opaque throughout; no radiative region anywhere |
| **0.35 – 1.3 M☉** | **radiative core, convective envelope** | pp burning is spread out; the H ionisation zone near the surface is opaque |
| **> 1.3 M☉** | **convective core, radiative envelope** | CNO's $T^{17}$ concentrates burning centrally; the envelope is too hot to be opaque |

The internal structure of a star inverts across the mass range. The Sun's arrangement is one of three regimes, not the norm. That is worth stating plainly, because the Sun is the star everyone pictures and its structure is a middle case. A red dwarf and a B star are internally arranged in opposite ways, and neither resembles the Sun.

### What follows from each

Each regime has consequences worth collecting, because this node is where they originate.

Fully convective (< 0.35 M☉): the entire star circulates through the core, so all its hydrogen is available as fuel — the burnable fraction $f \approx 1$ rather than the Sun's 0.1. This is why the lowest-mass stars have lifetimes even longer than the naive $M^{-2.5}$ scaling suggests. It also flattens the mass–luminosity relation to an exponent of about 2.3 below 0.43 M☉, because convection transports energy quite differently from radiation. And full convection is what destroys a young star's lithium completely, which underlies the lithium test for distinguishing low-mass stars from brown dwarfs.

Radiative core, convective envelope (the Sun): only the core burns and it is not mixed, so roughly 90% of the Sun's hydrogen will never be used. The convective envelope, rotating differentially, drives the magnetic dynamo — which is why cool stars have magnetic braking and hot stars do not, and hence why gyrochronology as an age-dating method works only below about spectral type F5.

Convective core, radiative envelope (> 1.3 M☉): the convective core mixes fresh fuel inward, raising the burnable fraction to roughly 0.15–0.20. And the absence of a convective envelope means no dynamo, no magnetised wind, no braking — which is why A and B stars remain rapid rotators for their whole lives.

One criterion, and it explains fuel fractions, lifetimes, the mass–luminosity slope, magnetic activity, rotational braking, and a brown dwarf test.

## Convection you can look at

The Sun's convection zone is not an inference. It is directly observable, and in two quite different ways.

### Granulation

Point a telescope at the solar photosphere and you see it covered in granules — bright cells separated by darker lanes, which are the tops of convective cells.

| Property | Value |
|---|---|
| Granule diameter | ~1,000 km |
| Lifetime | 8–10 min |
| Upflow speed | ~2 km/s |
| Temperature contrast | ~500 K |
| Number on the Sun | ~2 million |

Bright centres are rising hot gas; dark lanes are cooler gas sinking. The lifetime is the turnover time of a cell, and the size is comparable to the local pressure scale height — which is exactly what mixing-length theory would predict. Granulation is the most direct confirmation of convection in a star, and it is visible in a good amateur telescope under steady seeing. A second scale, supergranulation, spans roughly 30,000 km with a lifetime of about a day, and its origin remains debated.

### Helioseismology

The other observation is more precise by a wide margin.

The Sun oscillates in millions of acoustic modes, and their frequencies depend on the sound speed along their paths. Inverting them locates the base of the convection zone at $r = 0.713\,R_\odot$, to a precision of about 0.1% — better than almost any other quantity in stellar astrophysics.

Why it is there is worth stating, because it ties three earlier results together. Below $0.713\,R_\odot$ the gas is fully ionised, so the only opacity source is electron scattering and the material is comparatively transparent. Above it, hydrogen begins to recombine, the H⁻ ion appears, and the opacity soars. Radiation can no longer carry the flux, the radiative gradient exceeds the adiabatic one, and convection takes over.

It is the same H⁻ ion that pins the Hayashi track for contracting protostars and produces the peak in Balmer-line strength at spectral type A0. One weakly bound negative ion, three apparently unrelated results.

The convection zone contains only about 2% of the Sun's mass but 64% of its volume — a thin, low-density shell doing all of the outer transport, all of the mixing, and all of the dynamo action.

{{image: Helioseismology | A cutaway of the Sun's interior derived from helioseismology, which pins the base of the convective envelope at 0.713 solar radii to a precision of about 0.1 percent — the depth at which recombining hydrogen and the appearance of the H-minus ion send the opacity soaring and hand transport over from radiation to convection.}}

## Pulling the thread

- A photon would cross the Sun in 2.3 seconds in a straight line. Because the interior is opaque, energy instead random-walks: with a millimetre mean free path, $N = (R/\ell)^2 \approx 5\times10^{23}$ steps and a diffusion time of order $10^5$ years. The ratio of diffusive to free-flight time is $R/\ell \approx 7\times10^{11}$, and that number is the measure of a star's opacity. Commonly quoted figures span $10^4$ to $10^7$ years and differ by assumption, not physics.
- Two consequences follow: sunlight carries no information about the core, since the energy is thermalised long before it emerges, which is why neutrinos and oscillations are the only direct probes; and the diffusion rate is the luminosity, which is why the mass–luminosity relation can be derived from opacity and gravity alone.
- Opacity does not reduce the luminosity; it steepens the gradient. The star must deliver $L$ regardless, so more opaque material simply requires a larger temperature difference to push the energy through.
- Kramers' law, $\kappa \propto \rho T^{-3.5}$, means opacity rises as temperature falls — the hot interior is transparent and the cool outer layers are opaque, the opposite of the usual intuition and the reason convection zones sit near the surface. Bound–free opacity requires metals, so metal-poor stars are less opaque, more luminous, and form the subdwarf sequence.
- The Schwarzschild criterion compares two gradients: convection occurs when the surroundings cool faster with height than an adiabatically rising parcel. Three triggers — high opacity, high flux in a small volume, and a low adiabatic gradient in ionisation zones. Once started, convection is so efficient that a superadiabatic excess of about $10^{-6}$ carries the whole luminosity, so convective interiors are essentially adiabatic — except near the surface, where the theory is a one-parameter recipe and is the largest single uncertainty in stellar structure.
- The structure inverts across the mass range: fully convective below 0.35 M☉; radiative core and convective envelope from 0.35 to 1.3 M☉, which is the Sun; convective core and radiative envelope above 1.3 M☉. The Sun's arrangement is one of three regimes, not the norm.
- That single fact explains a great deal: burnable fuel fractions and hence lifetimes; the flattening of the mass–luminosity relation below 0.43 M☉; complete lithium destruction and hence the brown dwarf test; and the presence or absence of a magnetic dynamo, and hence magnetic braking, gyrochronology, and why it fails above spectral type F5.
- Convection is directly observable. Granulation — 1,000 km cells, eight-minute lifetimes, two million of them — is visible in a good telescope. Helioseismology locates the base of the Sun's convection zone at $0.713\,R_\odot$ to 0.1%, where hydrogen recombination makes H⁻ opacity soar — the same ion that pins the Hayashi track and peaks the Balmer lines at A0.

Hydrostatic equilibrium fixed the temperature from gravity; nuclear furnaces supplied a steeply temperature-dependent energy source; and this node has determined how the energy gets out, which turns out to set the structure, and through the structure almost everything else about how a star behaves. Every claim across these three chapters concerns a place no instrument will ever directly reach, and all of them have been asserted with some confidence. The Sun's core sits 700,000 kilometres below an opaque surface, and photons take on the order of $10^5$ years to emerge thoroughly scrambled — so what would it actually take to know its central temperature to better than a percent, and what would it take to be wrong?

## Further reading

A systematic derivation of the radiative transport equation, the Schwarzschild criterion, mixing-length theory, and the opacity sources that together determine a star's internal structure is given in {{book: Rudolf Kippenhahn, Alfred Weigert, and Achim Weiss | Stellar Structure and Evolution | 2012}}.

- **Rudolf Kippenhahn, Alfred Weigert, and Achim Weiss, *Stellar Structure and Evolution*, 2nd edition (2012).** The standard graduate reference on the equations of stellar structure, including a full treatment of radiative diffusion, the various opacity sources and Kramers' law, the Schwarzschild and Ledoux criteria for convective instability, and mixing-length theory — with discussion of how each varies across the mass range from fully convective low-mass stars to convective-core massive stars.

## Problems

*Data: $c = 2.998\times10^{8}$ m/s, $R_\odot = 6.957\times10^{8}$ m, $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, $a = 7.566\times10^{-16}$ J m⁻³K⁻⁴, 1 yr = 3.156 × 10⁷ s. Mean free path $\ell = 1/\kappa\rho$. Radiative gradient $dT/dr = -3\kappa\rho L/16\pi acr^2T^3$. Kramers: $\kappa \propto \rho T^{-3.5}$. Base of the solar convection zone: 0.713 $R_\odot$.*

### 1 — Two point three seconds *(the central estimate)*
**(a)** Compute the straight-line light crossing time for the Sun's radius.
**(b)** Explain why a random walk of $N$ steps of length $\ell$ gives a net displacement $\ell\sqrt{N}$ rather than $N\ell$.
**(c)** Derive $t = R^2/\ell c$ for the diffusion time, and evaluate for $\ell$ = 1 cm, 1 mm and 0.1 mm.
**(d)** Show that the ratio of diffusion time to free-flight time is $R/\ell$, and evaluate it for $\ell$ = 1 mm.
**(e)** Quoted values for this timescale range from $10^4$ to $10^7$ years. Explain what varies between the estimates, and why the naive calculation is an order-of-magnitude argument rather than a result.
**(f)** State two structural consequences of the energy taking so long to emerge.

### 2 — Radiative diffusion
**(a)** Write the radiative transport equation for $dT/dr$ and identify each quantity.
**(b)** Explain, from the equation, why higher opacity steepens the gradient rather than reducing the luminosity. What is being held fixed, and why?
**(c)** Compute the mean free path for $\kappa = 0.1$ m²/kg and $\rho = 1.5\times10^{5}$ kg/m³ (solar core conditions), and for $\kappa = 10$ m²/kg, $\rho = 10^{-4}$ kg/m³ (photosphere). Comment on the ratio.
**(d)** Explain what each of the five opacity sources is, and where each dominates.
**(e)** State Kramers' law and explain why the sign of the temperature dependence is counterintuitive but structurally important.
**(f)** Explain why metal-poor stars are more luminous at a given mass, and name the observational consequence.

### 3 — The Schwarzschild criterion
**(a)** Give the physical argument: displace a parcel upward and follow what happens in each of the two cases.
**(b)** State the criterion as an inequality between two gradients, and say in words what it compares.
**(c)** Explain why the parcel's expansion is treated as adiabatic. What assumption about timescales does that make?
**(d)** Name the three routes to convective instability, and give a stellar location where each operates.
**(e)** Explain how a partial ionisation zone lowers the adiabatic gradient.
**(f)** Explain why convective interiors are almost exactly adiabatic, and where this breaks down.
**(g)** Mixing-length theory has one free parameter tuned to the Sun. State why this is unsatisfactory and what it means for stellar models generally.

### 4 — The structure inverts *(the structural result)*
**(a)** Tabulate the three regimes with their mass ranges and structures.
**(b)** For each, explain the physical reason using the Schwarzschild criterion.
**(c)** Explain why the Sun's structure should not be taken as typical.
**(d)** For the fully convective regime, name three results that follow.
**(e)** For the convective-core regime, explain why such stars have no magnetic braking, and name the age-dating method this invalidates.
**(f)** The transition at ~1.3 M☉ coincides with the pp/CNO transition. Explain the connection.

### 5 — Looking at convection
**(a)** State the size, lifetime, speed and temperature contrast of solar granules, and explain what the bright and dark regions are.
**(b)** Explain why the granule size is comparable to the local pressure scale height.
**(c)** Helioseismology locates the base of the convection zone at $0.713\,R_\odot$. Explain physically why it is there.
**(d)** Compute what fraction of the Sun's volume lies above $0.713\,R_\odot$. Given that it contains ~2% of the mass, comment.
**(e)** The H⁻ ion appears in three different contexts in stellar physics. Name all three and state what is common to them.

### 6 — Numerical
**(a)** Estimate the radiative temperature gradient at $r = 0.5R_\odot$, taking $L(r) = L_\odot$, $\kappa = 1$ m²/kg, $\rho = 10^{3}$ kg/m³, $T = 4\times10^{6}$ K.
**(b)** Express your answer in K per km, and compare with the average gradient $T_c/R_\odot$.
**(c)** Using Kramers' law, compute the factor by which opacity changes between $T = 10^{7}$ K and $T = 10^{6}$ K at fixed density.
**(d)** Use (c) to explain why the outer parts of a solar-type star are convective while the interior is not.

### 7 — Why photons cannot see inside
**(a)** Explain what happens to the information carried by a photon during $10^{23}$ absorption and re-emission events.
**(b)** Explain why the solar spectrum reports on the photosphere rather than the core.
**(c)** Name the two probes that can see the interior and state, for each, why it escapes the problem in (a).
**(d)** Contrast the timescales: how long does a neutrino take to leave the Sun, and how long does the energy take?

### 8 — Convection as a mixer
Convection transports composition as well as energy.
**(a)** Explain why a convective region is chemically homogeneous.
**(b)** State the consequence for the burnable fuel fraction in a fully convective star, and give the value.
**(c)** Explain why the Sun's core composition and envelope composition differ, and what this implies for the star's evolution.
**(d)** Explain why convective mixing is what makes the lithium test for brown dwarfs work.
**(e)** Massive stars have convective cores. Explain the consequence for their main-sequence lifetimes relative to the naive scaling.

### 9 — Open problem: convection is the weak link
Mixing-length theory dates from 1958 and has one free parameter.
**(a)** State precisely what the mixing length is and what the free parameter represents.
**(b)** Explain why the parameter is calibrated on the Sun, and what is assumed when it is applied elsewhere.
**(c)** Name two situations where that assumption is likely to fail.
**(d)** Describe what three-dimensional radiation-hydrodynamic simulations offer, and what limits them.
**(e)** Name one observable that would test convection theory independently of the solar calibration, and state its limitation.

## Worked answers

### 1 — Two point three seconds

**(a)** $t = R_\odot/c = 6.957\times10^{8}/2.998\times10^{8} = 2.32\ \text{s}$

**(b)** Because each step is in a random direction, so the displacements largely cancel. Treating the net displacement as a vector sum of $N$ random unit vectors of length $\ell$:

$$\langle |\vec{d}|^2\rangle = \sum_i \ell^2 + \sum_{i \ne j}\langle \vec{\ell}_i \cdot \vec{\ell}_j\rangle = N\ell^2 + 0$$

The cross terms vanish because the directions are uncorrelated, so $|\vec{d}| = \ell\sqrt{N}$. Only if every step were in the same direction would the total be $N\ell$.

**(c)** Setting $\ell\sqrt{N} = R$ gives $N = (R/\ell)^2$. Each step takes $\ell/c$, so

$$t = N\frac{\ell}{c} = \frac{R^2}{\ell c}$$

| $\ell$ | $t$ |
|---|---|
| 1 cm | 5,100 yr |
| 1 mm | 51,000 yr |
| 0.1 mm | 510,000 yr |

**(d)** $\dfrac{t_{\text{diff}}}{t_{\text{free}}} = \dfrac{R^2/\ell c}{R/c} = \dfrac{R}{\ell}$. For $\ell$ = 1 mm: $6.957\times10^{8}/10^{-3} = 7.0\times10^{11}$.

**(e)** The assumed mean free path, which is not a constant. It is of order $10^{-4}$ m in the core and rises to hundreds of metres near the photosphere — a range of some seven orders of magnitude — so any single-$\ell$ estimate is arbitrary.

The naive calculation is an order-of-magnitude argument because it assumes a constant $\ell$, ignores that the diffusion is driven by a temperature gradient rather than being a pure random walk, and conflates the transit of an individual photon with the diffusion of energy — photons are absorbed and re-emitted, so no single photon makes the journey.

A proper treatment solves the diffusion equation with a radially varying opacity, giving ~$1.7\times10^5$ yr for the energy diffusion time — which is the Kelvin–Helmholtz timescale established elsewhere, obtained independently.

**(f)** Sunlight carries no information about the core. The energy is absorbed and re-emitted so many times that it is completely thermalised; the emergent spectrum reports on the photosphere alone. This is why neutrinos and oscillations are the only direct probes of the interior.

The diffusion rate sets the luminosity. A star's output is determined by how fast energy can escape rather than by how fast it is generated, and this node is what "escape" means.

### 2 — Radiative diffusion

**(a)** $$\frac{dT}{dr} = -\frac{3\kappa\rho L(r)}{16\pi a c r^2 T^3}$$

$\kappa$ = opacity (m²/kg, cross-section per unit mass); $\rho$ = density; $L(r)$ = luminosity crossing radius $r$; $a$ = radiation constant; $c$ = speed of light; $T$ = temperature.

**(b)** Because $L(r)$ is held fixed, not $dT/dr$. The luminosity crossing a given shell is set by what the core generates (and, in equilibrium, by what the surface radiates). The star has no choice about delivering it. So if $\kappa$ increases, the equation is satisfied by increasing $|dT/dr|$ — the star adjusts its internal temperature structure until the gradient is steep enough to push the required flux through the more resistant material.

Opacity is a resistance, and the temperature gradient is the potential difference across it. More resistance at fixed current means a larger voltage, not a smaller current.

**(c)** Core: $\ell = 1/(0.1 \times 1.5\times10^{5}) = 6.7\times10^{-5}\ \text{m}$ — about 0.07 mm. Photosphere: $\ell = 1/(10 \times 10^{-4}) = 10^{3}\ \text{m}$ — about 1 km. Ratio: $1.5\times10^{7}$.

The mean free path varies by seven orders of magnitude between the core and the surface, which is precisely why the single-$\ell$ random walk of problem 1 is only an order-of-magnitude estimate. It is also why the photosphere is where it is — the surface of a star is defined as the depth at which $\ell$ becomes comparable to the remaining distance, so photons escape rather than being re-absorbed.

**(d)** Electron scattering (Thomson): photons scatter off free electrons; $\kappa$ independent of $T$ and $\rho$; dominates in hot, fully ionised interiors.

Free–free (inverse bremsstrahlung): a free electron passing an ion absorbs a photon; $\kappa \propto \rho T^{-3.5}$; important throughout stellar interiors.

Bound–free (photoionisation): a photon ionises a bound electron; requires bound electrons, so depends strongly on metallicity; $\kappa \propto \rho T^{-3.5}$.

Bound–bound (line absorption): transitions between bound levels; important in cooler layers where many atoms remain neutral.

H⁻: an extra electron weakly attached to hydrogen (0.75 eV), extremely temperature-sensitive; dominant in cool stellar photospheres.

**(e)** $\kappa \propto \rho T^{-3.5}$ — opacity increases as temperature decreases.

Counterintuitive because one expects hot material to be more obstructive, not less. The physical reason is that free–free and bound–free absorption both require bound or slowly moving electrons: at high temperature the gas is fully ionised and electrons move too fast to interact efficiently, leaving only electron scattering.

Structurally important because it means the hot interior is comparatively transparent while the cool outer layers are opaque. That is what places convection zones in the outer parts of solar-type stars, and it is why a star's structure is not uniform.

**(f)** Because bound–free opacity requires bound electrons, which requires elements heavier than hydrogen and helium — at stellar interior temperatures, H and He are fully ionised and contribute only electron scattering, while metals retain inner-shell electrons.

So a metal-poor star has lower $\kappa$, and since $L \propto M^3/\kappa$, it is more luminous at a given mass, and correspondingly hotter. The observational consequence is the subdwarf sequence — metal-poor main-sequence stars lie below and to the left of the metal-rich main sequence on the Hertzsprung–Russell diagram.

### 3 — The Schwarzschild criterion

**(a)** Displace a parcel upward into a region of lower pressure. It expands adiabatically and cools.

Case 1: the parcel is now cooler than its surroundings. Being at the same pressure but lower temperature, it is denser, so buoyancy pulls it back down. The displacement is reversed: stable.

Case 2: the parcel is still hotter than its surroundings. It is less dense, so buoyancy pushes it further up, where the argument repeats. The displacement grows: unstable, and the parcel rises through the star carrying its heat.

**(b)** $$\left|\frac{dT}{dr}\right|_{\text{rad}} > \left|\frac{dT}{dr}\right|_{\text{ad}}$$

In words: convection occurs when the ambient temperature falls with height faster than an adiabatically rising parcel cools.

**(c)** Because the parcel's expansion is fast compared with the rate at which it can exchange heat with its surroundings. Radiative exchange across the parcel's surface takes far longer than the buoyant rise time in a stellar interior, so no significant heat enters or leaves during the displacement.

The assumption compares the radiative diffusion timescale across the parcel with the dynamical timescale of its motion. It holds well in the deep interior and fails near the surface, where the density is low, radiative exchange is fast, and the parcel loses heat as it rises — exactly the regime where mixing-length theory is least trustworthy.

**(d)** High opacity — steepens the radiative gradient because radiation cannot carry the flux. Location: the outer envelope of a solar-type star, where Kramers and H⁻ opacity dominate.

High flux in a small volume — a large $L(r)$ at small $r$ demands a steep gradient. Location: the core of a massive star, where CNO's $T^{17}$ concentrates all the burning centrally.

Low adiabatic gradient — in a partial ionisation zone. Location: the hydrogen and helium ionisation zones near the surface of a cool star.

**(e)** Because energy supplied to a partially ionised gas goes partly into ionising atoms rather than into increasing the kinetic energy of particles.

So when a parcel expands and does work, the temperature falls less than it would in a non-ionising gas — some of the energy deficit is met by recombination releasing ionisation energy. That reduces $|dT/dr|_{ad}$, and a smaller adiabatic gradient is easier for the radiative gradient to exceed. Ionisation zones are therefore convectively unstable almost automatically, which is why every cool star has a convective envelope located where hydrogen is recombining.

**(f)** Because convection is extremely efficient: in the dense interior, a fractional superadiabatic excess of order $10^{-6}$ suffices to transport the entire stellar luminosity. The gas needs to be only imperceptibly hotter than adiabatic to carry everything.

Consequently one can set $dT/dr = (dT/dr)_{ad}$ throughout a convective interior and compute the structure without knowing anything about the convection itself — a considerable simplification.

It breaks down near the surface, where the density is low. There, convection is inefficient (parcels lose heat radiatively as they rise), and a substantial superadiabatic gradient is required. That region cannot be treated by assuming adiabaticity, and it is precisely the region that determines a star's radius and effective temperature.

**(g)** Because it means the theory contains no predictive account of convection — it has a dimensionless parameter, the ratio of mixing length to pressure scale height, which is not derived from anything but is chosen so that a solar model reproduces the Sun's observed radius.

Unsatisfactory for two reasons: it is a fit, not a theory, since the model reproduces the quantity it was tuned on, which tests nothing; and it is calibrated on one star and then applied to stars of very different mass, metallicity and evolutionary state, where there is no guarantee the same value applies.

The consequence for stellar models generally: stellar radii and effective temperatures are the least reliable model outputs, which propagates into pre-main-sequence tracks, cluster ages, and every mass derived from a position on the Hertzsprung–Russell diagram.

### 4 — The structure inverts

**(a)**

| Mass | Structure |
|---|---|
| < 0.35 M☉ | fully convective |
| 0.35 – 1.3 M☉ | radiative core, convective envelope |
| > 1.3 M☉ | convective core, radiative envelope |

**(b)** Below 0.35 M☉: the star is cool throughout, so by Kramers' law the opacity is high everywhere. The radiative gradient exceeds the adiabatic one at all depths, and there is no radiative region anywhere.

0.35–1.3 M☉: the interior is hot and fully ionised, so opacity is low (electron scattering) and radiation carries the flux comfortably; and pp burning is spread over a relatively large central volume, so no extreme gradient is required. Near the surface, hydrogen recombines, H⁻ opacity soars, and convection sets in. Radiative core, convective envelope.

Above 1.3 M☉: CNO burning with $\epsilon \propto T^{17}$ concentrates the entire luminosity into a tiny central volume, requiring a very steep gradient there — convective core. The envelope is hot enough to remain substantially ionised and therefore transparent, so radiation suffices — radiative envelope.

**(c)** Because it is the middle case of three, and the two adjacent regimes are internally arranged in opposite ways. A red dwarf has no radiative zone at all; a B star has its convective and radiative regions swapped relative to the Sun.

Generalising from the Sun therefore gets the answer wrong for the great majority of stars by number, since M dwarfs are the large majority of the stellar population.

**(d)** Burnable fuel fraction $f \approx 1$ rather than 0.1, because the whole star circulates through the core, so the lowest-mass stars' lifetimes exceed the naive $M^{-2.5}$ scaling by a wide margin. The mass–luminosity exponent flattens to about 2.3 below 0.43 M☉, because convection transports energy quite differently from radiation. And complete lithium destruction, because all the lithium is circulated through the burning region — which is what makes the lithium test for brown dwarfs a clean threshold.

**(e)** Because a magnetic dynamo requires a convecting, electrically conducting fluid combined with rotation — and in a star above 1.3 M☉ the convection is confined to the core, deep inside, while the envelope and surface are radiative and quiescent. There is no near-surface convection to generate a large-scale field.

No dynamo means no magnetised stellar wind, hence no magnetic braking, hence such stars remain rapid rotators throughout their lives. The method invalidated is gyrochronology, which relies on rotational braking and therefore works only for stars cooler than about spectral type F5 — which corresponds closely to this same 1.3 M☉ boundary.

**(f)** They are the same transition, viewed from two sides.

Above ~1.3 M☉ the central temperature exceeds ~$1.8\times10^{7}$ K, at which the CNO cycle overtakes the pp chain. CNO's $T^{17}$ dependence concentrates energy generation into a small central volume, which requires a steep temperature gradient to carry away — and that steep gradient is exactly the Schwarzschild condition for convection.

The nuclear physics determines the transport physics. The reaction that dominates sets where the energy is released, which sets the gradient, which sets whether the core convects — and hence the fuel fraction, the lifetime, and the presence of a dynamo.

### 5 — Looking at convection

**(a)** Diameter ~1,000 km; lifetime 8–10 minutes; upflow ~2 km/s; temperature contrast ~500 K; about 2 million on the visible disc.

Bright centres are rising hot gas, which has come up from below and is at higher temperature. Dark lanes are cooler gas sinking after having radiated at the surface.

**(b)** Because the pressure scale height is the natural vertical scale over which a parcel's properties change substantially as it rises. A convective cell smaller than that would not experience a significant pressure change and would transport little; one much larger would be disrupted before completing a turnover.

So the cell size adjusts to be comparable to the scale height — which is the entire premise of mixing-length theory, and the agreement between predicted and observed granule sizes is one of the few direct checks on it.

**(c)** Because that is the depth at which hydrogen begins to recombine. Below $0.713R_\odot$ the gas is fully ionised, so the only significant opacity source is electron scattering and the material is comparatively transparent — radiation carries the flux and the region is stable.

Above it, temperatures drop enough for hydrogen to recombine; the H⁻ ion forms and bound–free and bound–bound opacity appear. The opacity rises steeply, the radiative gradient steepens past the adiabatic value, and convection takes over.

**(d)** Fraction of volume above $0.713R_\odot$: $1 - (0.713)^3 = 63.8\%$.

The convection zone occupies 64% of the Sun's volume and 2% of its mass — a vast, tenuous outer shell. Yet it performs all the outer energy transport, all the chemical mixing of the envelope, and all the dynamo action that produces the solar cycle, sunspots, flares and the wind that brakes the Sun's rotation. A tiny fraction of the mass produces essentially everything about the Sun that is observable as activity.

**(e)** The Hayashi track — H⁻ opacity's extreme temperature sensitivity pins the photospheric temperature of a fully convective star almost independently of radius, making the track vertical and creating a genuine forbidden region.

The Balmer line maximum at spectral type A0 — hydrogen's ionisation state controls this directly, but H⁻ dominates the continuous opacity in cool photospheres and therefore controls the depth at which the spectrum forms more generally.

The base of the solar convection zone, established in this node — H⁻ opacity appearing on recombination is what triggers convective instability at $0.713R_\odot$.

What is common: a weakly bound ion (0.75 eV) whose abundance is ferociously temperature-sensitive, so that it appears or disappears over a narrow temperature range and produces sharp structure wherever cool hydrogen is present.

### 6 — Numerical

**(a)** $$\left|\frac{dT}{dr}\right| = \frac{3\kappa\rho L}{16\pi acr^2T^3} = \frac{3(1)(10^{3})(3.828\times10^{26})}{16\pi(7.566\times10^{-16})(2.998\times10^{8})(3.479\times10^{8})^2(4\times10^{6})^3} = 1.30\times10^{-2}\ \text{K/m}$$

**(b)** $= 13.0\ \text{K/km}$.

Average gradient $T_c/R_\odot = 1.57\times10^{7}/6.957\times10^{5}\ \text{km} = 22.6\ \text{K/km}$.

Ratio: 0.58 — the local gradient at mid-radius is of the same order as the average, which is reassuring for an order-of-magnitude estimate and confirms the calculation is self-consistent.

**(c)** $\kappa \propto T^{-3.5}$, so $\kappa(10^{6})/\kappa(10^{7}) = (10^{-1})^{-3.5} = 3{,}162$ — opacity rises by more than three orders of magnitude for a factor of ten drop in temperature.

**(d)** Because that enormous rise in opacity steepens the radiative gradient in the same proportion: to push the same luminosity through material 3,000 times more resistant requires a far larger temperature difference.

At some depth the required radiative gradient exceeds the adiabatic gradient, the Schwarzschild criterion is satisfied, and convection takes over. In the interior, where $T \sim 10^{7}$ K and the opacity is low, radiation carries the flux comfortably and the region remains stable. The temperature dependence of the opacity is what divides a star into radiative and convective regions.

### 7 — Why photons cannot see inside

**(a)** It is destroyed. Each absorption event completely erases the photon's direction, energy and phase; the re-emitted photon's properties are drawn from the local thermal distribution and carry no memory of what was absorbed.

After ~$10^{23}$ such events, the emergent radiation reflects only the conditions in the layer from which it last escaped. The information content of the original core photon is not degraded but eliminated, and it is eliminated after the first few interactions.

**(b)** Because the emergent spectrum is determined by the last scattering surface — the depth at which the mean free path becomes comparable to the remaining distance to the exterior (~1 km at the photosphere).

Everything deeper is thermalised. So the spectral lines, the continuum shape and the effective temperature all report on the photosphere, at roughly 5,770 K, and none of them constrains the core at $1.57\times10^{7}$ K except through a model connecting the two.

**(c)** Neutrinos — they interact only weakly, so their mean free path in stellar material is enormous and they escape without a single interaction, carrying information about the reaction that produced them.

Acoustic oscillations (helioseismology) — sound waves propagate through the interior and their frequencies depend on the sound speed along their paths. They escape the problem differently: the wave is a coherent, collective motion of the gas rather than a particle being absorbed, so it is not thermalised, and the surface displacement it produces encodes the conditions it traversed.

**(d)** A neutrino leaves the Sun in about 2.3 seconds — the free-flight time, since it does not interact. The energy takes of order $10^5$ years. Ratio: about $10^{12}$. The neutrinos we detect today were produced today; the sunlight we see was produced tens of thousands of years ago or considerably earlier.

### 8 — Convection as a mixer

**(a)** Because convective motions physically transport material, not only heat. Rising and sinking parcels carry their composition with them, and the turnover time — months to years in a stellar envelope — is far shorter than the nuclear timescale of billions of years.

So any composition difference is erased far faster than nuclear burning can create one, and the region is homogeneous in composition at all times.

**(b)** In a fully convective star, the entire mass circulates through the burning core, so all the hydrogen is available as fuel: $f \approx 1.0$, against the Sun's $f \approx 0.10$.

**(c)** Because the Sun's core is radiative and therefore does not mix with the envelope. Hydrogen consumed in the core is not replaced from above, and the helium produced stays there.

Consequence: the core's mean molecular weight $\mu$ rises while the envelope's does not. Since central temperature scales with $\mu M/R$, the core must contract and heat to maintain support, so the Sun brightens over its main-sequence lifetime. And the star will leave the main sequence with roughly 90% of its hydrogen unused, in the envelope.

**(d)** Because the test relies on complete lithium destruction rather than partial. Lithium burns at $2.5\times10^{6}$ K, reached only in the central region. In a radiative star, only the lithium already in the core would be destroyed and the envelope's would survive, so a low-mass star would retain surface lithium and the test would fail.

Full convection circulates the entire lithium supply through the burning region, destroying all of it. So surviving surface lithium in a cool object of sufficient age proves that its core never reached $2.5\times10^{6}$ K, hence that it is below about 0.06 M☉ and substellar.

**(e)** A convective core mixes fresh hydrogen inward from a region larger than the nominal burning zone, raising the burnable fraction from about 0.10 to roughly 0.15–0.20.

Consequence: massive stars live somewhat longer than the naive $t \propto M^{-2.5}$ scaling predicts, by roughly a factor of 1.5–2. This acts in the opposite direction to the low-mass correction, so the true lifetime spread is wider than $M^{-2.5}$ at both ends.

### 9 — Open problem: convection is the weak link

**(a)** The mixing length is the characteristic distance a convective parcel travels before dissolving into its surroundings and depositing its heat — the convective analogue of a mean free path.

The free parameter is $\alpha_{MLT} = \ell/H_P$, the ratio of the mixing length to the local pressure scale height. It has no independent derivation; it is a single number standing in for the entire dynamics of a turbulent, compressible, radiating flow.

**(b)** Because the Sun is the one star whose radius, luminosity, age and mass are all known independently, so $\alpha_{MLT}$ can be adjusted until a solar-mass model at 4.57 Gyr reproduces the observed radius.

What is assumed when it is applied elsewhere: that $\alpha_{MLT}$ is universal — that the efficiency of convection relative to the pressure scale height is the same in stars of different mass, metallicity, surface gravity and evolutionary state. There is no physical reason to expect this, and three-dimensional simulations indicate it is not true.

**(c)** Red giants, where the envelope has a very low density and an enormous scale height, and convection is inefficient in a regime quite unlike the Sun's. Metal-poor stars, where the opacity — and hence the radiative gradient the convection must compete with — differs substantially. Also creditable: pre-main-sequence stars, fully convective M dwarfs, and any star with significant rotation or magnetic fields in the convection zone.

The consequence in each case is an error in the predicted radius and effective temperature, which propagates into pre-main-sequence tracks, cluster ages and every mass inferred from an H–R diagram position.

**(d)** Three-dimensional radiation-hydrodynamic simulations resolve the actual convective flow — granulation, downdrafts, the superadiabatic layer — from first principles, without a mixing-length parameter. They reproduce observed granulation properties and spectral line shapes well, and can be used to calibrate $\alpha_{MLT}$ as a function of stellar parameters rather than assuming it constant.

What limits them: they cannot simulate a whole star. The dynamic range from the granulation scale (~$10^6$ m) to the stellar radius (~$10^9$ m), and from the convective turnover time (minutes) to the evolutionary time (Gyr), is far beyond any computation. So they model a small box near the surface and the results must still be imported into a one-dimensional evolutionary model — which reintroduces a fitted parameter, better calibrated but not eliminated.

**(e)** Asteroseismology of stars other than the Sun. Oscillation frequencies depend on the internal sound-speed profile, and the outermost layers — where convection is inefficient and mixing-length theory is worst — produce a characteristic frequency offset known as the surface effect. Measuring that offset across stars of different mass and metallicity constrains convective efficiency independently of the solar calibration.

Limitation: the surface effect is itself difficult to model, so extracting a clean constraint requires disentangling it from other near-surface physics, and the technique needs long, high-precision photometry, restricting it to bright targets. Also creditable: granulation observations of other stars via their photometric flicker, now available in bulk from space-based photometric surveys, which directly probe convective properties across the Hertzsprung–Russell diagram.$astroEnergyTransport_master$,
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
