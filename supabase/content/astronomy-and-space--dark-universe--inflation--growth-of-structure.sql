-- Astronomy & Space · The Dark Universe — Inflation — "Growth of Structure".
-- Curated master for
-- astronomy-and-space/dark-universe/inflation/growth-of-structure
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Third and closing chapter of the Inflation block. Picks up exactly where
-- Seeds of Structure stopped: a density contrast of ~1e-3 at recombination,
-- and asks what turns it into galaxies. Organised around one arithmetic
-- constraint - the available growth factor is 865, not 1101, because Lambda
-- shuts growth off - and around the strongest quantitative argument for
-- dark matter there is: a baryon-only universe reaches delta = 0.03 today,
-- thirty times too small. Then the perturbation equation and why growth is
-- a power law rather than an exponential; three epochs and three growth
-- laws including the Meszaros effect; the transfer function and the
-- turnover at k_eq = 0.0104 /Mpc; spherical collapse with delta_c = 1.686
-- and Delta_vir = 178; the halo mass function and hierarchical assembly;
-- the Zel'dovich approximation and why the cosmic web is generic; what
-- N-body simulations do and do not establish; and the S8 tension and the
-- small-scale problems stated at their real strength.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting against Planck 2018 (TT,TE,EE+lowE
-- +lensing+BAO: h=0.6766, Om=0.3111, Ob h^2=0.02242, sigma8=0.8102,
-- z_eq=3402): linear growth factor D(0)/D(z=1100) = 865 by direct
-- integration of the growth integral, against 1101 for pure delta ~ a,
-- the ratio 0.785 being the Lambda suppression; delta(recombination) =
-- 9.4e-4 for sigma8 = 0.81 today; baryon-only delta today = 0.029;
-- k_eq = H0 sqrt(2 Om (1+z_eq))/c = 0.0104 /Mpc, lambda_eq = 605 Mpc
-- comoving; delta_c = (3/5)(3pi/2)^(2/3) = 1.6865; Delta_vir = 18pi^2 =
-- 177.7; turnaround delta_lin = 1.062 against nonlinear 4.55; M(8 Mpc/h)
-- = 2.7e14 Msun; Millennium particle mass 8.6e8 Msun/h from
-- 0.25 rho_c (500/h)^3 / 2160^3.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/inflation/growth-of-structure',
    'research',
    'advanced',
    'read',
    $duGrowth_master$> At recombination the universe was smooth to about one part in a thousand. Today it contains galaxies a million times denser than average. **The entire history of structure is the story of how a factor of $10^{-3}$ became a factor of $10^{6}$** — and of why that required something other than ordinary matter to do it.

The previous chapter left the density field at $\delta \sim 10^{-3}$ on the scales that matter, frozen in from inflation and released at last scattering. This chapter is about what happens next. It is unusually well-suited to being *checked*, because gravity acting on a known initial condition in a known background is one of the few genuinely predictive calculations in cosmology: given the seeds, everything from the shape of the matter power spectrum to the abundance of clusters follows without further free parameters.

Three results carry the chapter. **Growth is a power law, not an exponential**, because expansion fights collapse. **The total available growth is a factor of 865, not the factor of 1100 that a naive $\delta \propto a$ suggests**, because dark energy switches growth off before the job is finished. And **a universe made only of baryons falls thirty times short** — which is not a rhetorical argument for dark matter but a numerical one, and among the sharpest available.

## 1. The arithmetic that has to work

Fix the target first. Structure is *nonlinear* when the density contrast

$$\delta(\mathbf{x}) \equiv \frac{\rho(\mathbf{x}) - \bar\rho}{\bar\rho}$$

reaches order unity; only then does a region stop expanding with the background and start collapsing on its own. The conventional summary statistic is $\sigma_8$, the root-mean-square of $\delta$ smoothed over spheres of radius $8\,\text{Mpc}/h$ — a scale chosen historically because it makes the answer come out near $1$. Planck gives

$$\sigma_8 = 0.8102 \pm 0.006.$$

So today, on that scale, the universe is right at the edge of nonlinearity. A sphere of $8\,\text{Mpc}/h$ contains

$$M = \frac{4\pi}{3}\bar\rho_m R^3 = \frac{4\pi}{3}\left(2.775\times10^{11}\,\Omega_m h^2\right)\left(\frac{8}{h}\right)^3 \approx 2.7\times10^{14}\,M_\odot,$$

a rich galaxy cluster. That is the scale that is *just now* collapsing; everything smaller collapsed earlier, everything larger is still expanding.

Now run it backwards. If perturbations grew in proportion to the scale factor from recombination at $z_* = 1090$, then

$$\delta_{\rm rec} = \frac{\sigma_8}{1+z_*} = \frac{0.81}{1101} = 7.4\times10^{-4}.$$

This is the number the previous chapter arrived at, and it is approximately right. **It is also 21% too small**, and the reason is the point of the next several sections: growth is not $\delta \propto a$ all the way down. Doing the integral properly in $\Lambda$CDM gives a total growth factor of $865$ rather than $1101$, hence

$$\delta_{\rm rec} = \frac{0.8102}{865} = 9.4\times10^{-4}.$$

Either way the order of magnitude is $10^{-3}$, and the chapter's question is now sharp: **can gravity supply a factor of $\sim900$ in the time available, and does it act on the baryons or on something else?**

## 2. Why perturbations grow, and why only slowly

### 2.1 The competition

A slightly overdense region has slightly more gravity, pulls in more matter, and becomes denser still. Left alone this runaway is exponential. Two things prevent that.

**Pressure.** If the region is small enough that a sound wave can cross it before it collapses, pressure equalises the density and the perturbation oscillates instead of growing. The threshold is the **Jeans length**,

$$\lambda_J = c_s\sqrt{\frac{\pi}{G\bar\rho}},$$

with $c_s$ the sound speed. Below $\lambda_J$, sound wins; above it, gravity wins. This is the whole content of the Jeans criterion, and it is the reason baryons behave completely differently before and after recombination — their sound speed drops by four orders of magnitude when they stop being coupled to photons.

**Expansion.** This is the less intuitive one and it dominates the answer. In a static medium the growing mode is $\delta \propto e^{t/\tau}$. In an expanding universe the background density is *also* dropping, and the overdense region is being pulled apart along with everything else. The result is that gravity does not amplify $\delta$ exponentially; it barely keeps ahead.

### 2.2 The perturbation equation

For a pressureless (cold) component on scales well inside the horizon, linearising the continuity, Euler and Poisson equations in the expanding frame gives

$$\ddot\delta + 2H\dot\delta = 4\pi G\bar\rho_m\,\delta.$$

Read the three terms. On the right is the source: self-gravity, proportional to the perturbation itself. On the left, $\ddot\delta$ is the response, and $2H\dot\delta$ is a **friction term** supplied by the expansion — mathematically identical to the drag on a damped oscillator, and the reason the runaway is tamed.

Solve it in the matter-dominated (Einstein–de Sitter) case, where $a \propto t^{2/3}$, $H = 2/3t$ and $4\pi G\bar\rho_m = \tfrac{2}{3t^2}$:

$$\ddot\delta + \frac{4}{3t}\dot\delta - \frac{2}{3t^2}\delta = 0.$$

Try $\delta \propto t^{\,n}$. Substituting gives $n(n-1) + \tfrac43 n - \tfrac23 = 0$, i.e. $3n^2 + n - 2 = 0$, with roots $n = 2/3$ and $n = -1$. So

$$\delta_+ \propto t^{2/3} \propto a, \qquad \delta_- \propto t^{-1} \propto a^{-3/2}.$$

Two conclusions follow, and both are load-bearing.

**The growing mode is a power law.** $\delta \propto a$ — perturbations grow exactly as fast as the universe expands, no faster. Over the factor of 1100 in scale factor since recombination, that buys a factor of about 1100 in amplitude and no more. There is no exponential to hide behind; **the initial conditions have to be nearly big enough already**, which is why $A_s$ being $2\times10^{-9}$ rather than $2\times10^{-15}$ matters so much.

**The decaying mode dies.** $\delta_- \propto a^{-3/2}$ means any perturbation *not* imprinted early is suppressed. This is what makes the calculation predictive: the late-time density field is a linear map of the primordial one, and the transient contribution of anything that happened in between has been erased.

### 2.3 The general growth factor

Outside Einstein–de Sitter there is no power-law solution, but the growing mode can be written as a single integral,

$$D(a) \propto H(a)\int_0^a \frac{da'}{\left[a' H(a')\right]^3},$$

normalised however is convenient. Everything about how much structure forms in a given cosmology is in this one expression, and it is worth computing rather than quoting. With Planck parameters:

| $z$ | $D(z)/D(0)$ | $D(0)/D(z)$ | $D/a$ relative to EdS |
|---|---|---|---|
| $0$ | $1.0000$ | $1.0$ | $0.785$ |
| $0.5$ | $0.7701$ | $1.30$ | $0.907$ |
| $1$ | $0.6081$ | $1.64$ | $0.955$ |
| $2$ | $0.4183$ | $2.39$ | $0.986$ |
| $3$ | $0.3163$ | $3.16$ | $0.994$ |
| $10$ | $0.1157$ | $8.64$ | $\approx1$ |
| $1100$ | $1.156\times10^{-3}$ | $\mathbf{865}$ | $\approx1$ |

The last column is the payoff. At $z \gtrsim 3$ the universe is matter-dominated and $D \propto a$ holds to better than a per cent. Below $z \approx 1$ it fails badly: by today, growth has fallen $21.5\%$ short of what continued $D\propto a$ would have given.

**Dark energy stops structure formation.** Once $\Lambda$ dominates, $H$ approaches a constant, the friction term $2H\dot\delta$ stops decaying, and the source term $4\pi G\bar\rho_m\delta$ dies away as $\bar\rho_m \propto a^{-3}$. The equation becomes a damped oscillator with a vanishing restoring force, and $\delta$ freezes. **The cosmic web we see is very nearly final** — not because collapse has finished, but because the fuel has been switched off. Almost every structure that will ever form has already begun forming.

This gives an independent handle on dark energy. The growth rate

$$f \equiv \frac{d\ln D}{d\ln a} \approx \Omega_m(a)^{0.55}$$

falls from $f \approx 1$ at high redshift to $f = 0.526$ today. Redshift-space distortions measure the combination $f\sigma_8$, which peaks near $z \approx 0.5$ at about $0.47$ and falls either side — a shape that general relativity plus $\Lambda$ predicts with no freedom, and that modified-gravity alternatives generally do not reproduce. Current measurements track it to roughly $5\%$.

```checkpoint
q: Why does the term $2H\dot\delta$ appear in the perturbation equation, and what does it do?
a: It is a pressure term that opposes collapse on small scales
x: Pressure enters through the sound speed and only matters below the Jeans length; this term is present even for a perfectly pressureless component like cold dark matter.
a*: It is a friction term supplied by the expansion, and it turns what would be exponential growth into power-law growth
a: It is the self-gravity source term driving the instability
x: Self-gravity is the right-hand side, $4\pi G\bar\rho_m\delta$. This term sits on the left with the same sign structure as damping.
a: It represents the decaying mode
x: The decaying mode $\delta \propto a^{-3/2}$ is a *solution* of the equation, not a term in it. The friction term is part of what produces both modes.
hint: Compare the equation with that of a damped harmonic oscillator, $\ddot{x} + \gamma\dot{x} + \omega^2 x = 0$.
why: The equation $\ddot\delta + 2H\dot\delta = 4\pi G\bar\rho_m\delta$ has exactly the structure of a damped oscillator with a *negative* restoring force — an instability with drag. The drag coefficient is $2H$, set entirely by the expansion rate, and physically it represents the fact that an overdense region is being stretched apart by the Hubble flow even as it tries to collapse. Its consequence is the single most important fact about structure formation: in a static medium the instability would be exponential, but with this term the growing mode in matter domination is only $\delta \propto t^{2/3} \propto a$. Growth is therefore *linear in the scale factor*, so the total amplification since recombination is of order $10^3$ and not $10^{30}$ — which is why the primordial amplitude $A_s \approx 2\times10^{-9}$ had to be as large as it is, and why an inflationary model predicting fluctuations a thousand times smaller would produce a universe with no galaxies in it at all.
---
q: In $\Lambda$CDM, the linear growth factor from recombination to today is $865$, whereas $\delta \propto a$ would give $1101$. What accounts for the difference?
a: Radiation domination before equality suppressed growth
x: That suppression is real and important, but it happened *before* recombination, so it does not affect the growth factor computed from $z=1100$ onward.
a*: Dark energy has been switching growth off since $z\approx1$, costing about $21\%$ of the growth that would otherwise have occurred
a: The universe is not exactly flat, so the growth integral picks up a curvature correction
x: Curvature is measured to be consistent with zero at the $10^{-3}$ level; it cannot produce a $20\%$ effect.
a: Nonlinear collapse removes matter from the linear density field
x: Linear theory is a calculation about the linear density field and does not know about collapse. The two are compared, not coupled, at this level.
hint: Look at how $D/a$ behaves as a function of redshift and identify where it departs from constant.
why: $D \propto a$ is the growing-mode solution for a matter-dominated universe, and it holds to better than a per cent for $z \gtrsim 3$. Below $z\approx1$ dark energy comes to dominate: $H$ tends to a constant so the friction term $2H\dot\delta$ stops decaying, while the source term $4\pi G\bar\rho_m\delta$ dies away as $\bar\rho_m\propto a^{-3}$. The growing mode flattens, and by today $D/a$ has fallen to $0.785$ of its matter-era value — precisely the ratio $865/1101 = 0.785$. The physical statement is that **structure formation is winding down**: the growth rate $f = d\ln D/d\ln a$ has dropped from $\approx1$ to $0.53$, and in the far future it goes to zero, freezing the cosmic web in place. This is also why growth-rate measurements are a test of dark energy independent of distance measurements — the two probe the same expansion history through different functionals of it.
```

## 3. Three epochs, three growth laws

The single equation of the last section has different solutions in different eras, and the boundaries between them are imprinted permanently on the density field.

### 3.1 Radiation domination: the Mészáros effect

Before matter–radiation equality at $z_{\rm eq} = 3402$, the expansion is driven by radiation, which does *not* clump — its perturbations are wiped out by free streaming and pressure. So the friction term $2H\dot\delta$ is set by the radiation, while the source term $4\pi G\bar\rho_m\delta$ is set only by the sub-dominant matter. Friction wins.

The result, derived by Mészáros in 1974, is that a dark-matter perturbation that enters the horizon during radiation domination does not grow as a power law but **only logarithmically**:

$$\delta \propto 1 + \tfrac{3}{2}\,\frac{a}{a_{\rm eq}} \quad\longrightarrow\quad \text{effectively frozen for } a \ll a_{\rm eq}.$$

The perturbation is held nearly constant from the moment it enters the horizon until equality. **This freeze-out is the origin of every feature in the shape of the matter power spectrum**, because different modes enter the horizon at different times and therefore spend different intervals frozen. Small scales enter first and are frozen longest; large scales enter last, or after equality, and are not suppressed at all.

### 3.2 Matter domination: the productive era

Between $z_{\rm eq} = 3402$ and $z \approx 1$, $\delta \propto a$ holds, and this is where essentially all growth happens. From equality to today the available factor is $2673$; from recombination it is $865$.

Note the ordering: **dark matter perturbations start growing at equality, not at recombination.** By the time last scattering occurs, dark matter has already had a factor of $3403/1101 = 3.09$ of growth that the baryons have not. This head start is not a detail; it is what makes the timetable work.

### 3.3 Dark energy domination: shutdown

Covered above. $f = \Omega_m(a)^{0.55}$ falls, $D$ flattens, growth ends.

### 3.4 The resulting timetable

Putting the growth law together with the mass dependence of the initial amplitude gives a schedule, and it is worth having in mind because it is what observations of the high-redshift universe are testing.

Because $\sigma(M)$ decreases with mass, the smallest scales cross $\delta_c$ first. Taking $\sigma(M) \propto M^{-0.25}$ as a rough working slope and $\sigma_8 = 0.81$ at $2.7\times10^{14}\,M_\odot$, the characteristic collapsing mass $M_*$ — defined by $\sigma(M_*) = \delta_c$ — runs roughly as

$$M_*(z) \sim M_*(0)\left[D(z)/D(0)\right]^{1/0.25} = M_*(0)\left[D(z)/D(0)\right]^{4}.$$

The fourth power is what makes the hierarchy so steep. A growth factor of $8.6$ between $z=10$ and today corresponds to a factor of $\sim5\times10^3$ in characteristic mass. So:

- $z \approx 20$–$30$: the first objects collapse, in **minihalos** of $10^5$–$10^6\,M_\odot$ — the scale set not by the mass function alone but by the requirement that gas can cool, which for primordial composition means molecular hydrogen. These host the first stars.
- $z \approx 10$: halos of $10^8$–$10^9\,M_\odot$ are common; atomic hydrogen cooling becomes efficient, and the first galaxies assemble. Reionisation is underway.
- $z \approx 2$: $10^{12}\,M_\odot$ halos — Milky Way progenitors — are collapsing in numbers, and the cosmic star formation rate peaks.
- $z \approx 0$: $M_* \sim 10^{12}$–$10^{13}\,M_\odot$; clusters at $10^{15}\,M_\odot$ are collapsing *now*, which is why they are still visibly out of equilibrium, full of substructure and ongoing mergers.

**Clusters are the youngest structures in the universe, not the oldest.** That inversion of intuition is the single clearest signature of hierarchical assembly, and it is directly observable: cluster galaxies are old, but the clusters themselves are young.

```checkpoint
q: What does the Mészáros effect do to a dark-matter perturbation that enters the horizon during radiation domination?
a: It erases the perturbation entirely, which is why small-scale power is absent
x: Erasure by free streaming is what happens to *hot* dark matter. Cold dark matter perturbations are held nearly constant, not destroyed — small-scale power is suppressed but very much present.
a*: It holds the perturbation nearly constant from horizon entry until matter–radiation equality, suppressing it relative to modes that entered later
a: It makes the perturbation oscillate as a sound wave until equality
x: That is what happens to the photon–baryon fluid, which has pressure. Cold dark matter has none and does not oscillate.
a: It accelerates growth, since radiation contributes to the gravitational source
x: Radiation contributes to the *expansion* — hence to the friction term — but its own perturbations do not clump, so it adds nothing to the source term.
hint: Ask which component sets the friction term $2H\dot\delta$ and which sets the source term $4\pi G\bar\rho_m\delta$ during radiation domination.
why: Before equality the expansion rate is set by radiation, which does not clump, while the gravitational source is set only by the sub-dominant matter. Friction therefore overwhelms self-gravity and the growing mode becomes logarithmic rather than power-law — the perturbation is effectively frozen from the moment it enters the horizon until equality at $z_{\rm eq} = 3402$. The consequence is the entire shape of the matter power spectrum: modes that entered earlier stayed frozen longer and are suppressed more, giving $T(k)\propto(k_{\rm eq}/k)^2\ln(k/k_{\rm eq})$ on small scales while large-scale modes, which entered after equality, are untouched with $T\to1$. The turnover between the two regimes sits at the horizon scale at equality. Note the contrast with hot dark matter: relativistic particles free-stream *out* of small perturbations and genuinely erase them, producing a sharp cut-off and a top-down formation sequence — which is why the observation of galaxies at $z>10$ excluded that picture.
---
q: In $\Lambda$CDM, which collapsed first — galaxy-mass halos or galaxy clusters?
a: Clusters, because they are the largest and most gravitationally dominant structures
x: Size does not confer priority. What matters is the amplitude of the perturbation on that scale, and larger scales have *smaller* initial amplitude.
a*: Galaxy-mass halos, because $\sigma(M)$ decreases with mass so small scales reach the collapse threshold first — clusters are collapsing now
a: They collapsed simultaneously, since all perturbations grow by the same factor
x: They do grow by the same factor, but from different starting amplitudes, so they cross the threshold at different times.
a: Clusters formed first and fragmented into galaxies
x: That is the hot dark matter (top-down) picture, excluded principally by the observation of galaxies at redshifts far too high for fragmentation to have reached them.
hint: The power spectrum peaks at $k_{\rm eq}$ and falls at larger $k$ — work out whether variance per unit mass is larger for small or large regions.
why: The variance $\sigma^2(M)$ of the smoothed density field is a decreasing function of $M$, so small regions are proportionally lumpier than large ones. All modes grow by the same factor $D(a)$, so the ordering of collapse is set entirely by the ordering of initial amplitudes: small scales cross $\delta_c = 1.686$ first. This is hierarchical, bottom-up assembly — minihalos of $10^{5-6}\,M_\odot$ at $z\sim20$–$30$, galaxies at $z\sim10$, Milky Way-mass halos around $z\sim2$, and clusters of $10^{15}\,M_\odot$ collapsing at the present epoch. The observational signature is that **clusters are the youngest structures in the universe**: their member galaxies are old, but the clusters themselves are still assembling, which is why they are so conspicuously irregular, substructured and merger-rich. The opposite ordering was a live hypothesis into the early 1980s under hot dark matter, where free streaming erases small-scale power and superclusters fragment downwards; it was excluded by the existence of galaxies at high redshift.
```

## 4. Why a universe of baryons alone does not work

This is the sharpest quantitative argument in the chapter and it deserves to be done carefully, because it is often asserted and rarely computed.

### 4.1 Baryons cannot grow before recombination

Before recombination, baryons and photons are a single fluid, tied by Thomson scattering. Its sound speed is enormous — of order $c/\sqrt3$ — so the Jeans length is comparable to the horizon, and essentially **every baryon perturbation of interest is below the Jeans length**. Baryon perturbations therefore do not collapse. They oscillate: compression, pressure rebound, rarefaction. These are the acoustic oscillations whose frozen-in phases produce the CMB peaks and, later, the BAO feature at $147.1$ Mpc.

So the baryon density contrast at recombination is not a grown quantity. It is whatever the acoustic oscillation left behind, and it is tied to the photon perturbation by adiabaticity: $\delta_\gamma = \tfrac43\delta_b$, with the observed temperature anisotropy $\Delta T/T \approx \tfrac14\delta_\gamma = \tfrac13 \delta_b$.

### 4.2 The number

The measured CMB anisotropy is $\Delta T/T \approx 1.1\times10^{-5}$ in rms on degree scales. If baryons are all the matter there is, then

$$\delta_b(\text{recombination}) \approx 3\times\frac{\Delta T}{T} \approx 3.3\times10^{-5}.$$

Grow that forward by the full available factor of $865$:

$$\delta_b(\text{today}) \approx 3.3\times10^{-5}\times 865 = \mathbf{0.029}.$$

**Three per cent.** Not $0.81$; not order unity. In a baryon-only universe the density field today would still be everywhere linear, the largest fluctuations would be a few per cent, and **nothing would have collapsed at all** — no galaxies, no stars, no clusters.

Turn it around and the argument bites harder still. To reach $\sigma_8 = 0.81$ today by growth alone from recombination requires $\delta_{\rm rec} = 9.4\times10^{-4}$, which if carried by baryons implies

$$\frac{\Delta T}{T} = \frac{\delta_b}{3} \approx 3.1\times10^{-4}.$$

**The CMB would be about thirty times blotchier than it is.** It is not. Anisotropies at that level were searched for and excluded through the 1970s and 1980s, and each null result tightened the argument. By the time COBE finally measured $\Delta T/T \sim 10^{-5}$ in 1992, the conclusion was already unavoidable: **the smoothness of the CMB is quantitatively incompatible with the lumpiness of the present universe, unless most of the matter is something that does not scatter photons.**

This is worth stating plainly because it is a rare thing — a cosmological argument for dark matter that involves no galaxy dynamics, no rotation curves, no lensing, and no assumption about how light traces mass. It follows from two measured numbers and one differential equation.

### 4.3 What dark matter does instead

Cold dark matter does not couple to photons, so it has no pressure support and no Jeans length worth speaking of. Its perturbations are frozen by the Mészáros effect while radiation dominates, then grow as $\delta \propto a$ from equality onwards — **while the baryons are still oscillating.** By recombination, the dark matter has assembled potential wells of depth $\delta_{\rm CDM} \sim 10^{-3}$.

At recombination the photons let go. The baryon sound speed collapses from $c/\sqrt3$ to the thermal speed of hydrogen at $3000$ K — a drop of about four orders of magnitude — and the Jeans mass falls with it, from $\sim10^{17}\,M_\odot$ (super-cluster scale) to $\sim10^{5}$–$10^{6}\,M_\odot$ (globular-cluster scale). The baryons are now free, and they fall into wells that are already there.

**They catch up quickly.** The equation governing the baryon contrast in a dark-matter-dominated potential drives $\delta_b \to \delta_{\rm CDM}$ with the difference decaying as $a^{-1}$, so within a factor of a few in scale factor — by $z \sim 100$ — the baryons trace the dark matter closely. Everything after that is a single-fluid problem again.

The residual of that catch-up is observable: the baryon distribution retains a small memory of its acoustic phase, which is exactly the BAO feature, and it is *suppressed* on small scales relative to the dark matter by the distance sound travelled before decoupling — the Silk damping scale.

{{image: Millennium Run | A slice through a large cosmological N-body simulation, showing the filamentary network that gravity produces from near-uniform initial conditions. Dense knots at filament intersections host galaxy clusters, filaments channel matter into them, and the intervening voids are emptied by the same process that fills the nodes. The pattern is not put in by hand: it follows from collapsing a Gaussian random field under gravity, and its statistical properties — the shape of the power spectrum, the abundance of halos as a function of mass, the topology of the void network — are quantitative predictions that can be compared with galaxy surveys.}}

```checkpoint
q: In a universe containing only baryons and radiation (no dark matter), what would the density contrast be today on cluster scales, starting from the observed CMB anisotropy?
a: About $0.8$, the same as observed, since gravity does not care what the matter is made of
x: Gravity does not care, but *pressure* does. Baryons were pressure-supported until recombination and so entered the growth era with a much smaller amplitude than dark matter had.
a*: About $0.03$ — roughly thirty times too small for anything to have collapsed
a: About $10^{-5}$, unchanged, since baryon perturbations cannot grow at all
x: They can and do grow after recombination, by the full factor of $865$. The problem is where they start, not whether they grow.
a: Larger than observed, since baryons also feel pressure forces that compress them
x: Pressure resists compression; it does not assist it. Before recombination it prevents growth entirely.
hint: Take $\delta_b \approx 3\Delta T/T$ at recombination and apply the linear growth factor.
why: Adiabatic initial conditions tie the baryon and photon perturbations, $\delta_\gamma = \frac43\delta_b$, and the observed anisotropy is $\Delta T/T \approx \frac14\delta_\gamma = \frac13\delta_b \approx 1.1\times10^{-5}$. So $\delta_b \approx 3.3\times10^{-5}$ at recombination, and multiplying by the linear growth factor of $865$ gives $\delta \approx 0.029$ today. That universe is still entirely linear on every scale: no collapsed objects, no galaxies, no stars. Equivalently, running the requirement backwards, reaching $\sigma_8 = 0.81$ today needs $\delta_{\rm rec} \approx 9.4\times10^{-4}$, which as a baryon perturbation implies $\Delta T/T \approx 3\times10^{-4}$ — about thirty times the measured anisotropy. This mismatch between CMB smoothness and present-day lumpiness was recognised well before COBE and is one of the strongest arguments for dark matter, precisely because it uses no galaxy dynamics: only the measured anisotropy amplitude, the measured $\sigma_8$, and the linear growth equation.
---
q: Why does cold dark matter reach a density contrast of $\sim10^{-3}$ by recombination when baryons only reach $\sim10^{-5}$?
a: Dark matter is more massive per particle, so it clumps faster
x: The growth equation contains only the mean matter density, not particle masses. A heavier particle does not clump faster.
a*: Dark matter is not coupled to photons, so it has no pressure support and begins growing as $\delta \propto a$ from matter–radiation equality, while baryons are still oscillating as a sound wave
a: Dark matter began growing during inflation, whereas baryons only formed later
x: Both components carry the same primordial adiabatic perturbation from inflation. The difference is what happens to it afterwards.
a: There is more dark matter than baryons, so its perturbations are larger
x: The initial *fractional* perturbations are equal under adiabatic conditions; a larger mean density does not give a larger $\delta$.
hint: Ask which component has a large sound speed before recombination and which does not.
why: Under adiabatic initial conditions both components start with the same fractional perturbation. What separates them is pressure. Baryons are locked to photons by Thomson scattering, giving the combined fluid a sound speed near $c/\sqrt{3}$ and a Jeans length comparable to the horizon — so baryon perturbations on all relevant scales oscillate as standing sound waves rather than growing. Cold dark matter has negligible pressure and no such support: after being held nearly constant by the Mészáros effect during radiation domination, it grows as $\delta\propto a$ from equality at $z_{\rm eq} = 3402$. That gives it a head start of $3403/1101 = 3.1$ in scale factor over the baryons, on top of an amplitude that was never damped by acoustic oscillation. By recombination the dark matter has built potential wells of depth $\sim10^{-3}$, and when the photons release the baryons the baryons fall into wells that already exist — catching up within a factor of a few in scale factor. The observable residue of that catch-up is the baryon acoustic feature and the Silk damping cut-off.
```

## 5. The shape of the power spectrum

The statistics of $\delta$ are summarised by the power spectrum $P(k)$, the variance per logarithmic interval of wavenumber. Inflation supplies a nearly scale-invariant primordial spectrum, $P_i(k) \propto k^{n_s}$ with $n_s = 0.9649$. Everything between then and now is encoded in a **transfer function** $T(k)$:

$$P(k) = A\,k^{n_s}\,T^2(k)\,D^2(a).$$

### 5.1 Where the turnover is, and why

The transfer function is set by one question per mode: *did this mode enter the horizon before or after matter–radiation equality?*

- **Modes larger than the horizon at equality** never suffered the Mészáros freeze. $T(k) \to 1$, and $P(k) \propto k^{n_s} \approx k$.
- **Modes smaller than that** entered during radiation domination and were frozen from entry until equality. The longer the freeze, the greater the suppression, and the suppression works out to $T(k) \propto (k_{\rm eq}/k)^2\ln(k/k_{\rm eq})$, giving $P(k) \propto k^{n_s-4}\ln^2 k \approx k^{-3}\ln^2 k$.

The dividing scale is the horizon size at equality. Its comoving wavenumber follows from $k_{\rm eq} = a_{\rm eq}H(a_{\rm eq})/c$, and since radiation and matter densities are equal there, $H(a_{\rm eq}) = H_0\sqrt{2\Omega_m}\,a_{\rm eq}^{-3/2}$, so

$$k_{\rm eq} = \frac{H_0}{c}\sqrt{2\Omega_m(1+z_{\rm eq})} = (2.257\times10^{-4})\sqrt{2(0.3111)(3403)} = 0.0104\ \text{Mpc}^{-1},$$

corresponding to a comoving wavelength $\lambda_{\rm eq} = 2\pi/k_{\rm eq} = 605$ Mpc, or $409\ \text{Mpc}/h$.

**The matter power spectrum therefore has a maximum at $k \approx 0.01\,\text{Mpc}^{-1}$ and falls on both sides.** This turnover has been detected in galaxy surveys, and its position is a direct measurement of $\Omega_m h^2$ — because that combination is what sets $z_{\rm eq}$, and $z_{\rm eq}$ is what sets the turnover.

### 5.2 What the shape means physically

The consequence of $P(k)$ rising to a peak and then falling is that **variance per unit mass is larger on small scales**. Formally, $\sigma^2(M)$ is a decreasing function of $M$: small regions are proportionally lumpier than large ones. So small scales reach $\delta \sim 1$ first.

**Structure formation in $\Lambda$CDM is hierarchical: small objects collapse first and merge into larger ones.** This is a prediction, not a choice, and it distinguishes cold dark matter from the alternatives. Hot dark matter — light neutrinos moving relativistically — free-streams out of small perturbations and erases them, producing a sharp cut-off in $P(k)$ and a *top-down* history in which superclusters fragment into galaxies. That version was taken seriously into the early 1980s and is now excluded, principally because galaxies are observed at $z > 10$, far too early for a top-down sequence to have reached them.

## 6. From linear theory to collapsed objects

Linear theory fails exactly when it becomes interesting, at $\delta \sim 1$. The standard bridge is a model simple enough to solve exactly and close enough to reality to be useful.

### 6.1 Spherical collapse

Consider a uniform spherical overdensity in an expanding background. By Birkhoff's theorem it evolves as a closed universe in miniature, independent of everything outside. Its radius follows the cycloid

$$R = A(1-\cos\theta), \qquad t = B(\theta - \sin\theta), \qquad A^3 = GMB^2,$$

which expands, decelerates, halts, and recollapses. Three moments matter.

**Turnaround** ($\theta = \pi$). The sphere stops expanding. Its actual density contrast is

$$1 + \delta_{\rm ta} = \left(\frac{3\pi}{4}\right)^2 = 5.55, \qquad \delta_{\rm ta} = 4.55,$$

while linear theory, extrapolated to the same moment, would have said only

$$\delta_{\rm lin,ta} = \frac{3}{5}\left(\frac{3\pi}{4}\right)^{2/3} = 1.062.$$

Linear theory is already wrong by a factor of $4$ at turnaround — which is what "linear" means and why the extrapolation must be treated as a bookkeeping device rather than a description.

**Collapse** ($\theta = 2\pi$). Formally the sphere collapses to a point. The linearly extrapolated contrast at that moment is the number that matters:

$$\boxed{\ \delta_c = \frac{3}{5}\left(\frac{3\pi}{2}\right)^{2/3} = 1.6865\ }$$

**Virialisation.** Real collapses are not spherical and do not reach a point; the object relaxes to a virial equilibrium at half the turnaround radius. Comparing the mean density inside that radius with the background at the collapse time gives

$$\Delta_{\rm vir} = 18\pi^2 = 177.7 \approx 200.$$

This is the origin of the conventional definition of a halo as the region enclosing $200\times$ the mean (or critical) density, and of the mass label $M_{200}$ used throughout the literature. The number is a calculation, not a convention — though the convention has hardened around the round figure.

### 6.2 The trick that makes it useful

The useful move is counterintuitive: **use linear theory to predict nonlinear objects.** Take the linear density field, smooth it on a mass scale $M$, and declare that every region where the linear $\delta$ exceeds $1.6865$ has collapsed into a halo of that mass. The nonlinear dynamics are not simulated at all; they are replaced by a threshold whose value came from the spherical model.

For a Gaussian field with variance $\sigma^2(M)$, the fraction of space above the threshold is an error function, and differentiating with respect to $M$ gives the **Press–Schechter mass function**:

$$\frac{dn}{dM} \propto \frac{\bar\rho}{M^2}\,\frac{d\ln\sigma^{-1}}{d\ln M}\,\sqrt{\frac{2}{\pi}}\,\nu\,e^{-\nu^2/2}, \qquad \nu \equiv \frac{\delta_c}{\sigma(M)}.$$

The shape is a power law at low mass and an **exponential cut-off** above the mass where $\sigma(M) = \delta_c$. That characteristic mass $M_*$ is of order $10^{12}$–$10^{13}\,M_\odot$ today — a large galaxy halo, not a cluster.

Two things follow. **Clusters are exponentially rare**, so their abundance is exponentially sensitive to $\sigma_8$ and is one of the sharpest cosmological probes available. And **$M_*$ grows with time**, which is hierarchical assembly stated quantitatively: the characteristic collapsing mass was $\sim10^6\,M_\odot$ at $z\sim20$ and is $\sim10^{13}\,M_\odot$ now.

Press–Schechter is derived from an argument with a known flaw — it counts only half the mass, fixed historically by multiplying by two — and modern work uses calibrated fits (Sheth–Tormen, Tinker) tuned to simulations. That it works at all to within tens of per cent, from a spherical model and a Gaussian threshold, is the surprise.

```checkpoint
q: What is the physical meaning of $\delta_c = 1.686$?
a: The density contrast at which a region actually collapses
x: The actual contrast at collapse is formally infinite, and even at turnaround it is already $4.55$. This number is not an actual density.
a*: The value the *linearly extrapolated* contrast would have reached at the moment of collapse, which is used as a threshold applied to the linear density field
a: The maximum contrast that linear theory can describe before breaking down
x: Linear theory has already failed well before this, being wrong by a factor of four at turnaround. There is no sharp validity limit at $1.686$.
a: The contrast of a virialised halo relative to the background
x: That is $\Delta_{\rm vir} = 18\pi^2 \approx 178$, a different and much larger number.
hint: Ask what quantity is being extrapolated, and to what moment.
why: In the spherical collapse model, a uniform overdense sphere behaves as a miniature closed universe, expanding to turnaround and then recollapsing. If one takes the *linear* solution — which is a fiction beyond $\delta \sim 1$ but perfectly well defined as a mathematical extrapolation — and evaluates it at the time the exact solution reaches formal collapse, the answer is $\delta_c = \frac35(3\pi/2)^{2/3} = 1.6865$. The value's usefulness is that it converts a nonlinear question into a linear one: rather than simulating collapse, take the linear density field, smooth it on scale $M$, and count the regions exceeding $1.686$. That is the Press–Schechter construction, and it reproduces halo abundances from simulations to within tens of per cent. The distinct number $\Delta_{\rm vir} = 18\pi^2 \approx 178$ describes the *actual* density of the virialised remnant relative to the background, and is the origin of the $M_{200}$ convention.
---
q: The matter power spectrum peaks at $k \approx 0.01\ \mathrm{Mpc}^{-1}$. What physical scale does that correspond to?
a: The sound horizon at the baryon drag epoch, $147$ Mpc
x: That scale sets the BAO wiggles superimposed on the spectrum, not the position of the broad turnover.
a*: The comoving horizon size at matter–radiation equality, about $605$ Mpc
a: The Hubble radius today, about $4400$ Mpc
x: Nothing in the transfer function refers to today's horizon; the shape was fixed in the early universe and has only been rescaled in amplitude since.
a: The Silk damping scale, where photon diffusion erased baryon perturbations
x: Silk damping cuts off the *baryon* and photon perturbations at much smaller scales; it does not create the peak of the matter spectrum.
hint: Ask what distinguishes modes that were suppressed by the Mészáros effect from those that were not.
why: The transfer function is decided by whether a mode entered the horizon before or after matter–radiation equality. Modes entering earlier were held nearly frozen from entry until equality, and the longer the freeze the deeper the suppression, giving $T(k)\propto (k_{\rm eq}/k)^2\ln(k/k_{\rm eq})$. Modes entering after equality were never suppressed, so $T\to1$ and $P(k)\propto k^{n_s}$. The turnover therefore sits at the horizon scale at equality, $k_{\rm eq} = (H_0/c)\sqrt{2\Omega_m(1+z_{\rm eq})} = 0.0104\ \mathrm{Mpc}^{-1}$, i.e. $\lambda = 605$ Mpc comoving. Because $z_{\rm eq}$ is fixed by $\Omega_m h^2$, locating the turnover in a galaxy survey measures that combination directly — an entirely different route to it than the CMB peak heights, and a consistency test between the two.
```

## 7. The cosmic web is not a coincidence

Spherical collapse gets the timing right and the geometry wrong. Real collapse is generically **not** spherical, and the reason is a short and elegant argument.

### 7.1 The Zel'dovich approximation

Instead of following densities, follow particles. Zel'dovich's 1970 approximation writes the trajectory of a mass element as a straight-line displacement from its initial position, with the displacement growing in proportion to $D(a)$:

$$\mathbf{x}(a) = \mathbf{q} + D(a)\,\mathbf{S}(\mathbf{q}).$$

The local behaviour of the flow is set by the three eigenvalues $\lambda_1 \ge \lambda_2 \ge \lambda_3$ of the deformation tensor $\partial S_i/\partial q_j$. Collapse along an axis occurs when its eigenvalue is positive and $D\lambda_i$ reaches unity.

**The eigenvalues are generically distinct.** Exact equality would require a coincidence of measure zero in a random field. So collapse along the three axes happens at three different times, and the sequence is forced:

1. Collapse along the largest eigenvalue first, producing a **sheet** or pancake.
2. Then the second, contracting the sheet into a **filament**.
3. Then the third, contracting the filament into a **knot**.

**The cosmic web is therefore inevitable rather than incidental.** Sheets, filaments and nodes are not three kinds of object; they are one object at three stages of a sequence every region undergoes. Voids are the same statement inverted — regions where all three eigenvalues are negative expand faster than the background in all directions and empty themselves.

This also predicts what should be *rare*: perfectly spherical, isolated collapses. Observed clusters are correspondingly elongated, fed by filaments, and merging along preferred directions.

### 7.2 What N-body simulations add

The Zel'dovich approximation fails after shell crossing, when trajectories cross and the mapping is no longer single-valued. Past that point there is no analytic solution, and the field turns to simulation.

The reference example is the **Millennium Run** (2005): $2160^3 = 1.008\times10^{10}$ particles in a comoving box $500\ \text{Mpc}/h$ on a side, each particle representing $8.6\times10^8\,M_\odot/h$. Modern successors add gas, stars and feedback (Illustris, EAGLE, TNG) at increased cost and decreased volume.

Two results are worth extracting because they are robust across codes and cosmologies.

**Halos have a universal density profile.** Navarro, Frenk and White found in 1996 that simulated halos fit

$$\rho(r) = \frac{\rho_s}{(r/r_s)\left(1+r/r_s\right)^2},$$

with an inner slope of $-1$ and an outer slope of $-3$, across some twenty decades in mass. This universality is not derived from first principles even now; it is an empirical regularity of gravitational collapse from cold, hierarchical initial conditions, and it is one of the more surprising facts in the subject.

**Substructure survives.** Halos are not smooth: they retain the cores of the smaller halos they absorbed, as subhalos. The predicted subhalo abundance is what generates the small-scale tests discussed below.

What simulations do *not* do is establish the underlying model. They solve gravity, which is not in doubt, for initial conditions taken from the CMB. Agreement with observations tests the initial conditions and the matter content; it cannot test Newtonian gravity, since that was assumed. The honest description is that simulations convert a cosmology into a prediction, and the comparison then tests the cosmology.

{{image: Galaxy filament | Filamentary structure in the observed galaxy distribution, of the kind predicted by gravitational collapse of a Gaussian random field. Because the eigenvalues of the local deformation tensor are generically unequal, collapse happens along one axis first (producing a sheet), then a second (a filament), then the third (a knot) — so sheets, filaments and clusters are the same process caught at three stages rather than three distinct classes of object. The voids between are the same physics inverted, with all three eigenvalues negative.}}

## 8. Where the model is tested, and where it strains

Structure growth is over-constrained, which is what makes it useful. Several independent measurements probe the same quantity.

**Cluster abundance** counts objects on the exponential tail, so it is exquisitely sensitive to $\sigma_8$ and to $\Omega_m$.

**Weak gravitational lensing** measures the projected mass distribution directly, without assuming that galaxies trace mass. It constrains the combination $S_8 \equiv \sigma_8\sqrt{\Omega_m/0.3}$, which is what lensing is actually sensitive to because a lower $\Omega_m$ can be compensated by higher clustering.

**Redshift-space distortions** measure $f\sigma_8$, the growth *rate* rather than the amplitude, and so test gravity rather than just the matter content.

**The Lyman-$\alpha$ forest** probes $P(k)$ on scales an order of magnitude smaller than galaxy surveys reach, at $z = 2$–$5$, where the field is still nearly linear.

### 8.1 The $S_8$ question

Planck's CMB measurement, extrapolated forward with $\Lambda$CDM growth, predicts $S_8 = 0.830 \pm 0.013$. Weak-lensing surveys have consistently measured somewhat less — KiDS-1000 and DES Y3 landing near $0.76$–$0.78$, with joint reanalyses closer to $0.79$. The discrepancy has hovered at the $2$–$3\sigma$ level for the better part of a decade.

**Two features of this tension deserve emphasis, and they point in opposite directions.** It is a *growth* discrepancy in a specific sense — the CMB constrains the early universe, lensing the late one, and the disagreement is that the late universe appears slightly less clumpy than early-universe initial conditions plus $\Lambda$CDM growth predict. That is exactly the signature that suppressed late-time growth would produce, whether from evolving dark energy, massive neutrinos, or a modification of gravity. On the other hand, $2$–$3\sigma$ is not a detection, the analyses share calibration methods, and baryonic feedback — energy injected by supernovae and active nuclei, which redistributes gas and thereby suppresses small-scale power by an amount that is genuinely uncertain — can plausibly account for a good part of the gap. The honest position is that this is a discrepancy worth watching, materially weaker than the Hubble tension, and not currently evidence for new physics.

### 8.2 The small-scale problems

Three long-standing tensions appear on sub-galactic scales.

**The cusp–core problem.** Simulations of dark matter alone predict the $\rho \propto r^{-1}$ inner cusp of the NFW profile; the rotation curves of dwarf galaxies frequently indicate a flat inner core instead.

**Missing satellites.** The predicted number of subhalos around a Milky Way-sized halo exceeds the number of observed satellite galaxies by a large factor.

**Too big to fail.** The most massive predicted subhalos are dense enough that they should have formed conspicuous galaxies, and the observed satellites are not that dense.

All three were once presented as potential falsifications of cold dark matter. The current assessment is more measured, and for a reason worth stating precisely: **each of the three involves baryons, and dark-matter-only simulations do not contain baryons.** Supernova feedback can transfer energy to the dark matter and flatten a cusp; reionisation suppresses star formation in the smallest halos, leaving them dark rather than absent; tidal stripping by the disc removes subhalos that pure dark-matter runs retain. Meanwhile, deep surveys have found dozens of ultra-faint satellites and closed much of the missing-satellite gap from the observational side.

None of this amounts to a clean resolution, and alternatives — warm dark matter, self-interacting dark matter — remain viable and make distinguishable predictions. The defensible summary is that the small-scale problems are **currently ambiguous between astrophysics and dark-matter physics**, and that the ambiguity is a statement about the difficulty of modelling galaxy formation, not about the strength of the large-scale evidence, which is unaffected.

```checkpoint
q: Why does the cosmic web consist of sheets, filaments and knots rather than isolated spherical clumps?
a: Because the initial density field was itself filamentary
x: The initial field is a Gaussian random field with no filamentary structure; the web is generated by the collapse, not inherited from the seeds.
a*: Because the three eigenvalues of the local deformation tensor are generically unequal, so collapse proceeds along one axis at a time — sheet, then filament, then knot
a: Because dark matter is collisionless and cannot form spherical objects
x: Collisionless matter forms perfectly good quasi-spherical halos; the knots at filament intersections are exactly that.
a: Because magnetic fields channel matter along preferred directions
x: Magnetic fields are dynamically negligible on these scales; the structure follows from gravity alone.
hint: Consider what would have to be true for collapse to occur along all three axes simultaneously.
why: In the Zel'dovich approximation each mass element moves along a straight line with displacement growing as $D(a)$, and the local flow is characterised by the three eigenvalues $\lambda_1\ge\lambda_2\ge\lambda_3$ of the deformation tensor. Collapse along an axis occurs when $D\lambda_i$ reaches unity, so simultaneous collapse along all three axes would require $\lambda_1 = \lambda_2 = \lambda_3$ — a coincidence of measure zero in a random field. Generic collapse is therefore sequential: first a sheet, then a filament, then a knot. Sheets, filaments and clusters are not three classes of object but one process at three stages, and voids are the same statement with all three eigenvalues negative. This is why the web is a *prediction* rather than a description: it follows from collapsing a Gaussian random field under gravity, with no ingredient added to produce it.
---
q: Dark-matter-only simulations predict more satellite galaxies around the Milky Way than are observed, and predict cuspy inner density profiles where dwarf galaxies show cores. What is the most defensible reading of this?
a: Cold dark matter is falsified; the observations rule it out
x: They would if the predictions were complete, but the simulations in question omit baryons entirely, and every one of the three discrepancies is plausibly affected by baryonic processes.
a*: The discrepancies are on scales where baryonic physics matters and dark-matter-only simulations are incomplete, so they are currently ambiguous between astrophysics and dark-matter physics
a: The discrepancies are observational errors that have since been resolved
x: Deep surveys have found many ultra-faint satellites and narrowed that gap, but the cusp–core problem in particular is not resolved observationally.
a: They are irrelevant, since large-scale structure agrees so well
x: Large-scale agreement does not license dismissing a small-scale disagreement; a correct theory must work on both.
hint: Ask what physics is present in the real universe but absent from a dark-matter-only simulation.
why: All three small-scale problems — missing satellites, cusp–core, and too-big-to-fail — arise from comparing observations of *galaxies* with simulations containing only dark matter. Baryons are absent from those simulations yet demonstrably present in the systems being compared: supernova-driven outflows can transfer energy to dark matter and flatten a central cusp, reionisation can suppress star formation in the smallest halos so they remain dark rather than missing, and tidal stripping by the stellar disc destroys subhalos that a dark-matter-only run keeps. Simultaneously, surveys have found dozens of ultra-faint satellites, closing part of the gap observationally. That does not amount to a resolution, and warm or self-interacting dark matter remain live alternatives with distinguishable signatures. The correct position is that these are unresolved and informative, that they bear on galaxy-formation modelling as much as on dark-matter particle physics, and that they leave the large-scale evidence — which involves no such modelling — untouched.
```

## 9. Pulling the thread

- **Growth is a power law, not an exponential.** The friction term $2H\dot\delta$ supplied by the expansion turns runaway collapse into $\delta \propto a$ in matter domination. The total budget since recombination is a factor of a few hundred, which is why the primordial amplitude had to be nearly large enough already.
- **The real growth factor is $865$, not $1101$.** Dark energy has cost $21.5\%$ of the available growth since $z\approx1$, and is switching structure formation off. $f = \Omega_m^{0.55}$ has fallen from $\approx1$ to $0.53$; the web is close to final.
- **A baryon-only universe reaches $\delta \approx 0.03$ today** — thirty times short. Equivalently, carrying today's clustering back onto the baryons would make the CMB thirty times blotchier than measured. This is a dark-matter argument that uses no galaxy dynamics whatsoever: two measured numbers and one differential equation.
- **Dark matter's advantage is timing, not amount.** Free of photon pressure, it starts growing at equality while baryons still oscillate — a head start of $3.1$ in scale factor, on top of never having been damped. Baryons fall into wells that already exist, and catch up within a factor of a few in $a$.
- **The turnover in $P(k)$ at $k_{\rm eq} = 0.0104\ \text{Mpc}^{-1}$ is the horizon at equality**, frozen into the spectrum by the Mészáros effect. Its position measures $\Omega_m h^2$ independently of the CMB peaks.
- **$\delta_c = 1.686$ is a bookkeeping device, not a density.** It is the linearly extrapolated contrast at formal collapse, and using it as a threshold on the linear field reproduces simulated halo abundances to tens of per cent. $\Delta_{\rm vir} = 18\pi^2 \approx 178$ is the real one.
- **The cosmic web is generic.** Unequal eigenvalues of the deformation tensor force collapse to proceed sheet → filament → knot; simultaneous three-axis collapse has measure zero.
- **The tensions are honest but modest.** $S_8$ sits $2$–$3\sigma$ low and is partly degenerate with baryonic feedback; the small-scale problems compare baryon-free simulations with baryon-rich galaxies.

The transferable idea: **when a theory's prediction depends on an initial condition and a growth law, the two can be separated by finding a case where the growth law is the same but the initial condition is not.** That is exactly what the baryon-only calculation does. Baryons and dark matter obey the same growth equation after recombination and grow by the identical factor of $865$; they differ only in the amplitude they carried into that era, because one was pressure-supported and the other was not. Holding the dynamics fixed and varying only the starting point isolates the starting point as the cause — which is why the argument is so much stronger than a general appeal to "there is more gravity than light accounts for". The same manoeuvre is worth looking for elsewhere: **when two systems evolve under identical rules and end up different, the difference is in the initial data, and that is a measurement.**

## 10. Further reading

{{book: P. J. E. Peebles | The Large-Scale Structure of the Universe | 1980}}

{{book: Scott Dodelson | Modern Cosmology | 2020}}

{{book: John A. Peacock | Cosmological Physics | 1999}}

Beyond the books: Peebles wrote the subject's founding text and it remains the clearest statement of why the CMB's smoothness and the galaxy distribution's lumpiness cannot be reconciled with baryons alone — the argument of section 4 is his. Dodelson derives the transfer function and the growth equation carefully and is the standard graduate route in. Peacock is the best single source on spherical collapse and the mass function. On simulations, Springel et al.'s Millennium papers are unusually readable about methods and limitations, and Navarro, Frenk and White's original profile papers are worth reading directly for how cautiously the universality claim was originally phrased.

## Problems

*Useful numbers: $\Omega_m = 0.3111$, $\Omega_\Lambda = 0.6889$, $h = 0.6766$, $\Omega_m h^2 = 0.1424$; $\sigma_8 = 0.8102$; $z_{\rm eq} = 3402$, $z_* = 1090$; linear growth factor $D(0)/D(1100) = 865$, $D(0)/D(3402) = 2673$; $\delta_c = 1.6865$, $\Delta_{\rm vir} = 18\pi^2 = 177.7$; $k_{\rm eq} = 0.0104\ \mathrm{Mpc}^{-1}$; $\bar\rho_{m,0} = 2.775\times10^{11}\Omega_m h^2\,M_\odot\,\mathrm{Mpc}^{-3}$; $f \approx \Omega_m(a)^{0.55}$; $\Delta T/T \approx 1.1\times10^{-5}$; $H_0/c = 2.257\times10^{-4}\,\mathrm{Mpc}^{-1}$.*

**1.** *(The growth equation.)* **(a)** Show that $\delta \propto t^{2/3}$ and $\delta \propto t^{-1}$ both solve $\ddot\delta + \tfrac{4}{3t}\dot\delta - \tfrac{2}{3t^2}\delta = 0$. **(b)** Express both in terms of $a$. **(c)** State what the existence of a decaying mode implies for whether late-time structure can retain information about processes occurring between recombination and today.

**2.** *(The budget.)* Starting from $\sigma_8 = 0.8102$ today, compute the linear density contrast at recombination **(a)** assuming $\delta \propto a$ exactly, and **(b)** using the $\Lambda$CDM growth factor of $865$. **(c)** State which is correct and why they differ.

**3.** *(The dark matter argument.)* **(a)** Using $\delta_b \approx 3\,\Delta T/T$ and $\Delta T/T = 1.1\times10^{-5}$, find the baryon density contrast at recombination. **(b)** Grow it forward by $865$. **(c)** State what the result implies about a baryon-only universe, and identify precisely which assumption of the calculation dark matter violates.

**4.** *(The head start.)* **(a)** By what factor in scale factor does cold dark matter grow between equality and recombination? **(b)** Explain why baryons gain none of this. **(c)** Sketch what happens to the baryons immediately after recombination and estimate how long the catch-up takes in terms of scale factor.

**5.** *(The turnover.)* **(a)** Compute $k_{\rm eq} = (H_0/c)\sqrt{2\Omega_m(1+z_{\rm eq})}$. **(b)** Convert to a comoving wavelength in Mpc and in Mpc/$h$. **(c)** Explain why measuring the turnover position constrains $\Omega_m h^2$ specifically, rather than $\Omega_m$ and $h$ separately.

**6.** *(Spherical collapse.)* **(a)** Give the actual density contrast at turnaround and the linearly extrapolated one. **(b)** Give $\delta_c$ and explain in one sentence what it is the contrast *of*. **(c)** Give $\Delta_{\rm vir}$ and state what convention it underwrites.

**7.** *(Mass scales.)* **(a)** Compute the mass contained in a comoving sphere of radius $8\ \mathrm{Mpc}/h$. **(b)** Identify what kind of object that is. **(c)** Explain why $\sigma_8$ being close to $1$ rather than to $10^{-3}$ or $10^{3}$ is a statement about *when* we happen to be observing, and say whether that is a coincidence.

**8.** *(Growth rate as a probe.)* **(a)** Compute $f = \Omega_m(a)^{0.55}$ at $z = 0$ and $z = 1$, given $\Omega_m(a) = \Omega_m a^{-3}/(\Omega_m a^{-3} + \Omega_\Lambda)$. **(b)** Compute $f\sigma_8$ at both redshifts using $D(1)/D(0) = 0.6081$. **(c)** Explain why $f\sigma_8$ tests something that distance measurements do not.

**9.** *(Assessing the tensions.)* **(a)** State what $S_8$ is and why lensing constrains that combination rather than $\sigma_8$ alone. **(b)** Give the Planck-predicted and lensing-measured values and the approximate significance. **(c)** Give one reason to take the discrepancy seriously and one reason for caution, and state your overall assessment.

## Worked answers

**1.** **(a)** For $\delta = t^n$: $n(n-1)t^{n-2} + \tfrac43 n t^{n-2} - \tfrac23 t^{n-2} = 0$, so $3n^2 - 3n + 4n - 2 = 3n^2 + n - 2 = 0$, giving $n = 2/3$ and $n = -1$. Both check. **(b)** With $a \propto t^{2/3}$: $t^{2/3}\propto a$ and $t^{-1} \propto a^{-3/2}$. **(c)** The decaying mode is suppressed by $a^{-3/2}$, so any perturbation imprinted after recombination is heavily damped relative to the primordial growing mode. The present-day field is therefore essentially a linear map of the primordial one — which is what makes structure formation a *predictive* calculation rather than a fitting exercise, and also means late-time processes leave very little imprint on the large-scale linear field.

**2.** **(a)** $\delta_{\rm rec} = 0.8102/1101 = 7.4\times10^{-4}$. **(b)** $\delta_{\rm rec} = 0.8102/865 = 9.4\times10^{-4}$. **(c)** The second. They differ because $\delta \propto a$ is the matter-dominated solution and fails once dark energy dominates: since $z \approx 1$ the growth has flattened, so the *actual* accumulated growth ($865$) is $21.5\%$ less than $\delta\propto a$ would give ($1101$). The naive value therefore *underestimates* the required primordial amplitude, because it credits gravity with growth it never achieved.

**3.** **(a)** $\delta_b = 3 \times 1.1\times10^{-5} = 3.3\times10^{-5}$. **(b)** $3.3\times10^{-5}\times865 = 0.029$. **(c)** A baryon-only universe would today have a density field that is everywhere linear at the few-per-cent level: no collapsed objects, no galaxies, no stars. The violated assumption is that *the matter that clusters is the same matter that scatters photons*. Dark matter does not scatter, so its perturbation amplitude at recombination is unconstrained by $\Delta T/T$ and is in fact $\sim30$ times larger — it grew while the baryons oscillated.

**4.** **(a)** $(1+z_{\rm eq})/(1+z_*) = 3403/1101 = 3.09$. **(b)** Baryons are locked to photons by Thomson scattering until recombination, giving a sound speed $\approx c/\sqrt3$ and a Jeans length near the horizon; below it, perturbations oscillate rather than grow. **(c)** At recombination the sound speed drops by about four orders of magnitude and the Jeans mass falls from $\sim10^{17}\,M_\odot$ to $\sim10^{5-6}\,M_\odot$. The baryons then fall into the pre-existing dark-matter wells, with the difference $\delta_{\rm CDM} - \delta_b$ decaying as $a^{-1}$, so they track the dark matter within a factor of a few in scale factor — by $z\sim100$.

**5.** **(a)** $k_{\rm eq} = 2.257\times10^{-4}\sqrt{2(0.3111)(3403)} = 2.257\times10^{-4}\times46.0 = 0.0104\ \mathrm{Mpc^{-1}}$. **(b)** $\lambda = 2\pi/k_{\rm eq} = 605$ Mpc $= 409\ \mathrm{Mpc}/h$. **(c)** The turnover sits at the horizon size at equality, and $z_{\rm eq}$ is fixed by the ratio of matter to radiation density. The radiation density is known from the CMB temperature, so $z_{\rm eq} \propto \Omega_m h^2$ — the *physical* matter density. Neither $\Omega_m$ nor $h$ enters separately, which is why the turnover measures the combination and needs an independent distance scale to break the degeneracy.

**6.** **(a)** Actual $1+\delta = (3\pi/4)^2 = 5.55$, so $\delta_{\rm ta} = 4.55$; linearly extrapolated, $\delta_{\rm lin,ta} = \tfrac35(3\pi/4)^{2/3} = 1.062$. **(b)** $\delta_c = \tfrac35(3\pi/2)^{2/3} = 1.6865$; it is the contrast of the *linearly extrapolated* field at the moment the exact solution formally collapses — a threshold, not a density. **(c)** $\Delta_{\rm vir} = 18\pi^2 = 177.7$, the mean density of the virialised remnant relative to the background, which underwrites defining halo mass as $M_{200}$, the mass inside the radius enclosing $200\times$ the reference density.

**7.** **(a)** $\bar\rho_{m,0} = 2.775\times10^{11}\times0.1424 = 3.95\times10^{10}\,M_\odot\,\mathrm{Mpc^{-3}}$; $R = 8/0.6766 = 11.82$ Mpc; $M = \tfrac{4\pi}{3}(3.95\times10^{10})(11.82)^3 = 2.7\times10^{14}\,M_\odot$. **(b)** A rich galaxy cluster. **(c)** $\sigma(R)$ decreases with $R$, so the scale at which $\sigma = 1$ moves outward with time; $\sigma_8 \approx 0.81$ says that scale is right now about $8\ \mathrm{Mpc}/h$. It is not a coincidence in the troubling sense: any observer arises after enough structure has collapsed to make stars and planets, so a value near unity on some galactic-to-cluster scale is expected. What *is* a genuine near-coincidence is that this epoch also roughly coincides with the onset of dark-energy domination, and that has no accepted explanation.

**8.** **(a)** At $z=0$: $\Omega_m(a) = 0.3111$, $f = 0.3111^{0.55} = 0.526$. At $z=1$: $\Omega_m(a) = 0.3111\times8/(0.3111\times8+0.6889) = 2.489/3.178 = 0.783$, $f = 0.783^{0.55} = 0.874$. **(b)** $f\sigma_8(0) = 0.526\times0.810 = 0.426$; $f\sigma_8(1) = 0.874\times0.810\times0.6081 = 0.431$. **(c)** Distances constrain the expansion history $H(z)$ — the *background* — whereas $f\sigma_8$ constrains how fast perturbations grow in that background, which depends on the gravitational field equations. Modified-gravity models can be tuned to reproduce a given $H(z)$ while predicting a different growth rate, so the two together break a degeneracy that neither breaks alone.

**9.** **(a)** $S_8 \equiv \sigma_8\sqrt{\Omega_m/0.3}$. Lensing measures the projected mass fluctuation, in which a lower mean matter density can be traded against stronger clustering; that degeneracy direction is what the combination follows. **(b)** Planck (extrapolated with $\Lambda$CDM growth) gives $S_8 = 0.830\pm0.013$; weak-lensing surveys give roughly $0.76$–$0.79$; the discrepancy has stood at $2$–$3\sigma$. **(c)** *Take it seriously:* it is a late-time-versus-early-time growth comparison, and the sign is exactly what suppressed late growth — evolving dark energy, massive neutrinos, modified gravity — would produce. *Caution:* $2$–$3\sigma$ is not a detection, the lensing analyses share calibration methodology, and baryonic feedback suppresses small-scale power by an uncertain amount that could absorb much of the gap. *Assessment:* worth watching, materially weaker than the Hubble tension, not currently evidence for new physics.$duGrowth_master$,
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
