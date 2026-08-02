-- Astronomy & Space · Stellar Physics — Star Birth —
-- "Collapse". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/star-birth/collapse @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- James Jeans's 1902 gravitational-instability criterion, derived before
-- Payne's stellar-composition result, Trumpler's dust demonstration, or the
-- discovery of molecular clouds, and why a pure scaling argument survived
-- all three; the Jeans mass, fragmentation, and the opacity limit near
-- 0.01 M_sun (roughly 10 Jupiter masses) as a prediction matching the
-- observed brown-dwarf mass-function turnover; free-fall collapse, Shu's
-- 1977 inside-out solution, and the accretion-rate formula giving a
-- roughly 650,000-year solar-mass assembly time; and the three disposal
-- problems of energy (2.3e41 J), angular momentum (a 10^-14 rad/s core
-- spun up to break-up-defying velocities, resolved by disks and bipolar
-- outflows), and magnetic flux (a factor-of-a-million discrepancy resolved
-- by ambipolar diffusion) that together reframe star formation as a
-- problem of shedding, not gathering, material.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/star-birth/collapse',
    'research',
    'advanced',
    'read',
    $astroCollapse_master$> Star formation is not, at its core, a story about assembly; it is a story about disposal — about a collapsing cloud core shedding, by factors ranging from small to nearly a million, the energy, angular momentum and magnetic flux it cannot carry with it into a star.

## A criterion that arrived a decade too early

In 1902, the British physicist James Jeans published an analysis of when a uniform gas becomes gravitationally unstable, deriving the criterion that still carries his name.

The problem he was working on was not star formation. It was cosmology — the question of how any structure at all condenses out of a uniform medium — and the astronomical context of 1902 is worth recalling in full. The Milky Way was thought by many to be the entire universe. The nature of the spiral nebulae was disputed. Nobody knew what stars were made of: Cecilia Payne's thesis establishing that stars are overwhelmingly hydrogen was twenty-three years in the future. Nobody knew what powered them. And the existence of molecular clouds was not established — the dark patches Herschel had called holes in the heavens were still being argued over, and would not be settled as obscuring dust until Robert Trumpler's demonstration in 1930, twenty-eight years later.

Jeans derived his criterion for a medium whose composition, temperature, and even existence were unknown. He was, at the time, working primarily as a mathematician and theoretical physicist rather than as an observational astronomer, and the gravitational-instability paper was one contribution among a career that later ranged across the kinetic theory of gases, radiation theory, and — with a certain irony given the subject at hand — a rival theory of solar-system formation invoking a close stellar encounter, a proposal that did not survive scrutiny in the way the collapse criterion did. That the instability criterion outlasted several of Jeans's other ideas is itself part of what makes it worth examining closely: it is not that everything he touched proved durable, but that this particular argument had a structure that did not depend on being right about anything else.

{{image: James Jeans | James Jeans, whose 1902 gravitational-instability analysis was derived for a cosmological medium of unknown composition and remains, unmodified in its essentials, the zeroth-order criterion for cloud collapse.}}

### Why it survived anyway

The argument uses almost nothing. It compares two energies. Gravitational binding energy scales as $GM^2/R$. Thermal energy scales as $NkT$, which is proportional to $M$. That is the whole input — no chemistry, no opacity, no radiation transport, no knowledge of what the gas is made of.

The result it delivers is still the organizing idea of the field, more than a century later, essentially unmodified. Modern treatments add magnetic fields, turbulence and rotation as corrections, but the Jeans criterion remains the zeroth-order answer.

An argument built from a comparison of scalings, using no detailed physics, can outlast everything that was believed at the time it was made. Jeans was wrong about the universe, wrong about the nebulae, and had no idea what a star was. The criterion does not depend on any of that being right.

There is a well-known technical complaint against the derivation, known as the "Jeans swindle": it assumes a uniform, infinite medium that is nonetheless in equilibrium, which strictly cannot be so — a uniform self-gravitating medium has nowhere to be in equilibrium *about*, since there is no preferred center and the gravitational potential does not converge. The result is nevertheless correct. Later treatments justify it properly, recovering the same criterion from an expanding cosmological background, from a finite cloud with a genuine boundary, and from a virial-theorem argument that makes no appeal to an infinite uniform state at all. The swindle is a flaw in the derivation, not in the conclusion, and the criterion emerges unchanged from arguments that avoid it.

## Why large clouds are the unstable ones

The argument is short. A cloud has two competing energies. Gravity binds it:

$$|U| \sim \frac{GM^2}{R}$$

and thermal motion supports it:

$$K \sim \frac{3}{2}NkT = \frac{3}{2}\frac{M}{\mu m_H}kT$$

Taking the ratio, with $R \sim (M/\rho)^{1/3}$:

$$\frac{|U|}{K} \sim \frac{GM^2/R}{MkT/\mu m_H} \propto \frac{M^{2/3}\rho^{1/3}}{T}$$

Gravity scales as $M^{5/3}$; thermal support scales as $M$. That difference is the whole result, and it is worth stating plainly because it contradicts an intuition most people carry: gravity grows faster with mass than pressure support does, so a small cloud is stable and a large one is not, and every cloud has a mass above which it must collapse.

This is the opposite of how ordinary objects behave. A small pile of sand and a large pile of sand are equally stable; scaling up a bridge does not make it fall down. Self-gravitating systems are different, because the binding energy involves every pair of particles and therefore grows superlinearly with the number of them — $N(N-1)/2$ pairs rather than $N$ particles. In ordinary materials the binding is short-range: an atom in a solid is bound only to its neighbors, so doubling the object doubles the binding energy and support scales the same way. Self-gravity is the one common force for which total binding energy grows faster than total mass, which is why self-gravitating systems have a maximum stable size and ordinary objects do not.

It is worth dwelling on why this particular inequality, rather than some more elaborate stability analysis, is treated as decisive. The comparison is a virial-type argument: it asks only whether the total energy budget of a self-gravitating cloud favors expansion or contraction, without following the detailed dynamics of how a perturbation grows or decays. A full linear-stability treatment — perturbing the fluid equations and tracking the growth rate of a density fluctuation as a function of its wavelength — recovers the same critical mass to within a numerical prefactor of order unity, which is why the energy-comparison version, despite its simplicity, is not merely a rough guide but an essentially correct statement of where the instability sets in.

Setting $|U| \sim K$ gives the Jeans mass — the mass above which collapse is inevitable:

$$M_J = \left(\frac{5kT}{G\mu m_H}\right)^{3/2}\left(\frac{3}{4\pi\rho}\right)^{1/2} \qquad\Longrightarrow\qquad M_J \propto \frac{T^{3/2}}{\rho^{1/2}}$$

### Evaluating the criterion

| $T$ (K) | $n$ (cm⁻³) | $M_J$ (M☉) | $L_J$ (pc) |
|---|---|---|---|
| **10** | **10²** | **53.8** | 1.31 |
| 10 | 10⁴ | 5.38 | 0.131 |
| **10** | **10⁶** | **0.54** | 0.013 |
| 20 | 10² | 152 | 1.85 |
| 100 | 1 | 17,000 | 41.3 |

The scaling $M_J \propto T^{3/2}\rho^{-1/2}$ makes cold and dense the combination that eases collapse, and the temperature dependence is the stronger of the two. Doubling the temperature raises the Jeans mass by a factor of 2.8; the same gas at 100 K instead of 10 K needs thirty times more mass to collapse.

The characteristic molecular-cloud temperature of 10 K is not incidental — it is what makes the Jeans mass comparable to a stellar mass rather than to a star cluster's worth of mass. That temperature is achievable only because dust grains and CO molecules radiate the heat of compression away efficiently in the far infrared. The refrigerator that keeps molecular clouds at 10 K is what makes stars, rather than clusters of gas, the natural product of collapse.

{{image: Jeans instability | The Jeans mass falls with rising density and rises with temperature; a molecular cloud held near 10 K by dust and CO cooling has a Jeans mass of stellar rather than cluster scale.}}

## Collapse makes collapse easier

Suppose a region exceeds its Jeans mass and begins to collapse. The density rises, and since $M_J \propto \rho^{-1/2}$, the Jeans mass falls. Provided the temperature stays constant — and it does, because the gas is optically thin and radiates away the heat of compression as fast as it is generated — collapse is self-accelerating in a specific sense: regions that were individually stable become unstable as the whole contracts around them.

The cloud does not fall in as a unit. It shatters.

| $n$ (cm⁻³) | $M_J$ (M☉) | Fragments from a 10⁴ M☉ cloud |
|---|---|---|
| 10² | 53.8 | 186 |
| 10³ | 17.0 | 588 |
| 10⁴ | 5.38 | 1,860 |
| 10⁵ | 1.70 | 5,880 |
| **10⁶** | **0.54** | **18,600** |
| 10⁷ | 0.17 | 58,800 |

A ten-thousand-solar-mass cloud can fragment into tens of thousands of pieces of well under a solar mass. Three consequences follow immediately.

Stars form in clusters, not singly. The fragmentation cascade produces many objects from one cloud, which is why nearly all stars are born in groups and why isolated star formation is rare, and why star clusters exist as an observed structure at all.

A spectrum of masses is produced, not a single mass. The cascade does not terminate everywhere at once — different fragments stop at different points depending on local conditions. This is the origin of the initial mass function: the distribution of masses at which fragments detach from further collapse and evolve into individual stars.

And the fragment masses land in the right range. A cascade starting at roughly 50 M☉ and running down to a fraction of a solar mass produces objects of stellar scale, which is a non-trivial success, since nothing in the argument was tuned to give that answer.

It is worth being precise about what the fragmentation picture does and does not explain. It accounts for why a single collapsing cloud breaks into many pieces rather than forming one object, and it accounts for why those pieces span a range of masses rather than a single value. It does not, by itself, predict the exact shape of that mass distribution — how many low-mass fragments form for every high-mass one — because the cascade as described here neglects turbulence, magnetic support, and rotation, each of which shapes where and how efficiently a given region fragments. The Jeans argument supplies the outline of the initial mass function; filling in its precise form requires the physics that the simple energy comparison leaves out.

### What stops it

Fragmentation cannot continue indefinitely, and what halts it is a change in the thermal behavior of the collapsing gas. Throughout the cascade the gas is isothermal because it is optically thin: compression heats it, and the heat escapes immediately as infrared radiation from dust and CO. That is what keeps $T$ constant while $\rho$ rises, and it is what makes $M_J$ fall.

But as a fragment becomes small and dense, it becomes optically thick. Radiation can no longer escape freely. Compression now heats the gas and the heat stays, so $T$ begins to rise. At that point the scaling reverses. With $T$ rising as $\rho$ rises, $M_J \propto T^{3/2}\rho^{-1/2}$ stops falling and starts increasing. No smaller fragment can become unstable, and the cascade halts.

The mass at which this occurs is the opacity limit for fragmentation, and it is roughly

$$M_{\min} \approx 0.01\ M_\odot \approx 10\ M_J$$

where $M_J$ here denotes a Jupiter mass rather than a Jeans mass. This is a testable prediction: it says the lowest-mass objects that can form by cloud fragmentation are of brown-dwarf scale, and the observed brown-dwarf mass function does indeed turn over in that region. A simple argument about when radiation stops escaping predicts the bottom of the stellar mass spectrum to within a factor of a few, which is one of the better successes in the subject.

It also connects downward to a separate limit. The hydrogen-burning threshold at 0.08 M☉ is set by entirely different physics — electron degeneracy halting contraction before a fragment reaches ignition temperature — and it sits above the opacity limit. There is therefore a range of objects that fragmentation can make and fusion cannot ignite. Brown dwarfs exist as a class precisely because those two limits do not coincide.

It is worth noting how different the two limits are in character, since the coincidence of their both mattering to the same mass range is easy to mistake for a single phenomenon. The opacity limit is a statement about radiative transfer during collapse — when photons generated by compression can no longer escape a fragment fast enough to keep it isothermal. The hydrogen-burning limit is a statement about the equation of state of a static, already-formed object — whether the pressure holding it up against gravity is thermal, and hence capable of rising with temperature until fusion ignites, or degenerate, and hence essentially independent of temperature, so that contraction simply halts without ever reaching the roughly ten-million-kelvin core temperature fusion requires. One is about what can form; the other is about what can burn. That they are set by unrelated physics and nonetheless bound the same interval of mass, 0.01 to 0.08 M☉, is what carves out the brown dwarfs as a distinct population rather than a low-mass tail of ordinary stars.

{{image: Star formation | A field of pre-main-sequence objects embedded in their natal molecular cloud: a single ten-thousand-solar-mass cloud fragments into tens of thousands of sub-solar pieces, which is why stars are born in clusters rather than singly.}}

## Inside-out collapse

Collapse does not proceed uniformly, and the reason is contained in a single formula for the free-fall time:

$$t_{ff} = \sqrt{\frac{3\pi}{32G\rho}}$$

The free-fall time depends only on density — not on mass, not on radius, not on the size of the region under consideration. Denser material collapses faster, and the center of a core, being densest, falls first.

| $n$ (cm⁻³) | $t_{ff}$ |
|---|---|
| 10² | 3.37 Myr |
| 10⁴ | 0.34 Myr |
| 10⁶ | 33,700 yr |
| 10⁸ | 3,370 yr |
| 10¹⁰ | 337 yr |

A density contrast of a hundred gives a factor of ten in collapse time. So the center collapses, which makes it denser, which makes it collapse faster still. The process runs away, and the central density rises catastrophically while the outer regions have barely begun to move.

The standard picture, developed by Frank Shu in 1977, is inside-out collapse: a rarefaction wave propagates outward from the center at the sound speed, and material begins to fall only as the wave reaches it. Inside the wave, gas is in free fall onto a growing central object; outside it, the core is still static.

Shu's solution begins from a specific initial state — a singular isothermal sphere, a density profile falling as $\rho \propto r^{-2}$ that is itself marginally unstable everywhere at once — and it is one of several collapse solutions developed around the same period; earlier work by Richard Larson and Michel Penston in 1969 examined a related problem and found collapse setting in more rapidly and with a different early density profile. The distinction between these pictures matters chiefly at the very earliest, most rapid phase of collapse; observationally, the later, slower accretion phase that both approaches converge toward is what governs how long it takes to build up a stellar mass, and it is that phase the accretion-rate formula below describes.

### The accretion rate

This picture gives a clean prediction for how fast the central object grows:

$$\dot{M} = 0.975\,\frac{c_s^3}{G}$$

At 10 K, $c_s = 188$ m/s, so $\dot{M} = 9.7\times10^{16}$ kg/s $= 1.5\times10^{-6}\ M_\odot$/yr. Building a solar mass takes about 650,000 years. Stars assemble in a few hundred thousand years — instantaneous by stellar standards, which is why so few objects are caught in the act.

What the accretion rate depends on is worth stating plainly: only the temperature, through $c_s^3 \propto T^{3/2}$. Not the density, not the mass of the cloud, not the magnetic field. Colder gas builds stars more slowly, and warmer gas builds them faster — a fact with consequences for star formation in the early universe. Metal-free primordial gas had no dust and no CO, so its only coolant was molecular hydrogen, a poor radiator, and it could not cool below a few hundred kelvin. Accretion rates roughly ninety times higher than in a present-day 10 K cloud followed directly, together with a correspondingly larger Jeans mass, and the result was a first generation of stars that was very massive.

The chain of reasoning connecting these two nodes is worth tracing explicitly, since neither fact alone forces the conclusion. A higher temperature raises the Jeans mass, so the fragments a metal-free cloud breaks into start out larger — plausibly tens of solar masses rather than a fraction of one. And the same higher temperature raises the accretion rate onto each of those fragments, so they also grow faster once collapse begins. Two effects that both push in the same direction, acting on the same underlying cause, is what makes the case for very massive first stars considerably stronger than either effect would on its own — and it is also why the first stars are expected to have been not merely somewhat more massive than typical stars today, but characteristically different in kind, short-lived, and responsible for the earliest injection of heavy elements into an otherwise pristine universe.

{{image: Protostar | A protostar embedded in its infalling envelope: material accretes at a rate set by the Shu inside-out solution, building a solar mass in roughly 650,000 years, a phase so brief that few such objects are ever caught mid-collapse.}}

## The three disposal problems

Gathering the material for a star is comparatively easy. Getting rid of what comes with it is hard, and this reframing is the central result of the analysis. A collapsing core carries three quantities that a star cannot keep, and each must be shed by a factor that is large — in one case, enormous.

The three problems differ in kind as well as in severity, and it is useful to keep the distinction in view before working through the numbers. The energy problem is a problem of rate: the energy must be removed roughly as fast as it is generated, or the collapse simply slows and stalls, without any change to the final outcome once cooling resumes. The angular momentum and magnetic flux problems are problems of quantity: a fixed, enormous excess relative to what a star can hold, which must be disposed of through a channel — a disk, an outflow, a diffusive drift — that does not exist for the cloud as a whole and has to be built as a consequence of the collapse itself. That distinction is why the last two are frequently described as genuine obstacles to star formation, while the first is more a matter of bookkeeping the process must satisfy along the way.

### Energy, or the collapse stalls

Collapsing a solar mass from a core radius of 0.05 pc down to a solar radius releases about

$$\frac{3}{5}\frac{GM_\odot^2}{R_\odot} = 2.3\times10^{41}\ \text{J}$$

If that energy stays in the gas, the temperature rises, pressure rises, and the collapse halts. The material must radiate the energy away as fast as it is liberated, or it never reaches stellar density. This is exactly what the dust and CO cooling responsible for holding molecular clouds at 10 K accomplishes, and it is why the collapse remains isothermal for most of its duration — cooling is not incidental to cold molecular clouds but the enabling condition for collapse to proceed past its first stage.

For scale, $2.3\times10^{41}$ J is about 0.2% of the Sun's total main-sequence output. The entire energy of formation is a small fraction of a lifetime's radiation, which is why the Kelvin–Helmholtz contraction timescale is short compared with the nuclear-burning timescale.

### Angular momentum, and this one is severe

Take a molecular-cloud core of radius 0.05 pc rotating slowly — observed cores have angular velocities of order $10^{-14}$ rad/s, one rotation every twenty million years, genuinely slow rotation by any ordinary standard.

Now conserve angular momentum and collapse the core to the size of the Sun. Specific angular momentum $j \sim \omega R^2$ is conserved, and the radius falls by a factor of $2.2\times10^{6}$, so $\omega$ rises by the square of that factor:

$$\omega_{\text{final}} \sim 4.9\times10^{-2}\ \text{rad/s} \qquad\Longrightarrow\qquad P \approx 2\ \text{minutes}$$

The equatorial velocity would be 34,000 km/s — over a tenth the speed of light — against a break-up velocity of 437 km/s:

$$\frac{v_{\text{eq}}}{v_{\text{break}}} \approx 78$$

The object would exceed break-up velocity by a factor of nearly eighty. It cannot form under those conditions. This is not a marginal difficulty addressable with a correction term; it is a complete prohibition. A star cannot be assembled from a rotating core unless essentially all of the core's angular momentum is disposed of somewhere else.

Almost all of it must go, and the disposal happens through two channels: a disk, in which material that cannot fall inward because it is rotationally supported spreads outward instead, and bipolar outflows, which carry angular momentum away from the system entirely.

The disk itself does not solve the problem so much as relocate it: material parked in a disk still carries the angular momentum it arrived with, and further inward transport — whether by turbulent viscosity within the disk, by magnetic torques threading it, or by gravitational interactions once it becomes massive enough to fragment on its own — is required to let gas continue accreting onto the central object while angular momentum is passed outward to the disk's edge or removed entirely through the outflow. The disk is therefore not a passive holding pen but an active transport mechanism, and its efficiency at moving mass inward while moving angular momentum outward is what ultimately sets how much of the envelope's original mass reaches the star at all, connecting the angular-momentum problem directly to the question of what determines a fragment's final mass.

Two consequences follow from this. It is the reason planetary systems exist: the disk is not a by-product of star formation but a requirement of it, and planets form from the material that could not reach the star. And the leftover is measurable billions of years later in the present solar system — the Sun holds 99.87% of the solar system's mass and 0.6% of its angular momentum, which is the same disposal problem, still visible in its outcome.

### Magnetic flux, the largest discrepancy of all

Molecular clouds are threaded by magnetic fields of order 10 μG, and the gas is partially ionized, so the field is frozen in: field lines are dragged along with the material as it moves.

Under flux freezing, $B \propto \rho^{2/3}$. Collapse from cloud density ($n \approx 10^2$ cm⁻³) to stellar density ($n \approx 10^{24}$ cm⁻³) is a factor of $10^{22}$ in density, so:

$$B_{\text{final}} \sim 10\ \mu\text{G} \times (10^{22})^{2/3} = 5\times10^{9}\ \text{gauss}$$

Observed magnetic fields on young stars are 1 to 3 kilogauss:

$$\text{Discrepancy} \approx 10^{6}$$

A factor of a million, and the excess field would in any case have prevented the collapse from proceeding to stellar densities in the first place, since magnetic pressure scales as $B^2$ and a field of that strength would dominate everything.

The flux must be lost, and the principal mechanism is ambipolar diffusion: because the gas is only weakly ionized, neutral particles can drift slowly through the field lines, which remain tied to the sparse population of ions. Over long timescales the neutral material — which is nearly all of the mass — separates from the magnetic field and collapses without it, leaving the flux behind. Magnetic reconnection contributes as well. This is known as the magnetic flux problem, and it remains an area of active research.

The rate at which ambipolar diffusion operates depends directly on the ionization fraction: the fewer free ions there are relative to neutrals, the more weakly the two populations are coupled by collisions, and the faster the neutrals can slip past the field. In the well-shielded, cosmic-ray-ionized interior of a dense core this fraction is very low, so diffusion, though a slow process on the timescale of an individual collision, has ample time to act over the many free-fall times that a marginally magnetically supported core takes to collapse. Nearer the surface of a cloud, where ultraviolet photons from nearby stars can penetrate and raise the ionization fraction, the coupling is tighter and diffusion is correspondingly slower — so the efficiency of flux loss is itself a function of position within the cloud, not a single universal rate.

{{image: Ambipolar diffusion | Ambipolar diffusion lets neutral gas, which is coupled to the magnetic field only through collisions with a sparse population of ions, drift slowly through the field lines and collapse without carrying the field to stellar density.}}

### The pattern

Three quantities, three disposal problems, and they are not equally severe. Setting the three side by side also makes clear that they are not independent of one another: the same disk and outflow structure that resolves the angular momentum problem is, observationally, closely associated with the region where magnetic flux is being shed and reconnected, since a rotating, partially ionized flow threaded by a field is exactly the configuration in which magnetic torques and centrifugal support interact. The three problems are frequently solved, in practice, by a single evolving structure — the young disk-and-outflow system — rather than by three unrelated mechanisms operating in isolation.

| Quantity | Must shed | Mechanism |
|---|---|---|
| **Energy** | essentially all of it | radiation by dust and CO |
| **Angular momentum** | ~99.9% | disks and bipolar outflows |
| **Magnetic flux** | ~99.9999% | ambipolar diffusion, reconnection |

Star formation is not a story about assembly. It is a story about disposal, and the difficulty of each stage is set not by how hard it is to bring material together but by how hard it is to get rid of what the material brings with it.

## Pulling the thread

James Jeans derived his instability criterion in 1902, for a medium whose composition, temperature and even existence were all unknown, before anyone knew what stars are made of or that molecular clouds exist. It survives because it compares two energy scalings and uses no detailed physics.

Gravity scales as $M^{5/3}$; thermal support scales as $M$. Gravity therefore grows faster with mass, and every cloud has a mass above which it must collapse — inverting the ordinary intuition that small things are fragile and large ones stable.

Since $M_J \propto T^{3/2}\rho^{-1/2}$, cold and dense conditions are what make collapse easy, and temperature is the stronger term: the same gas at 100 K instead of 10 K needs thirty times more mass to collapse. A characteristic molecular-cloud temperature of 10 K is what makes the Jeans mass stellar rather than cluster-scale.

Collapse makes collapse easier. Because the gas is optically thin and isothermal, rising density lowers $M_J$, so regions that were stable become unstable as the whole contracts. The cloud shatters — a 10⁴ M☉ cloud into tens of thousands of sub-solar fragments — which is why stars form in clusters and why an initial mass function exists at all.

Fragmentation stops when the gas becomes optically thick, because the heat of compression can no longer escape, temperature starts rising, and $M_J$ turns around. The opacity limit of roughly 0.01 M☉ is a genuine prediction that the smallest objects fragmentation can make are of brown-dwarf scale, which matches observation. Since the hydrogen-burning limit of 0.08 M☉ is set by unrelated physics, brown dwarfs exist because the two limits do not coincide.

Collapse is inside-out and runaway, because $t_{ff}$ depends only on density and the center is densest. The Shu accretion rate $\dot{M} = 0.975c_s^3/G$ builds a solar mass in roughly 650,000 years and depends only on temperature — which is why metal-free first-generation stars, unable to cool below a few hundred kelvin, were very massive.

And the real difficulty is disposal. A collapsing core must shed essentially all of its energy, radiated by dust and CO; roughly 99.9% of its angular momentum, since conserving it would give a two-minute rotation period at seventy-eight times break-up velocity, an outright prohibition rather than a correction; and roughly 99.9999% of its magnetic flux, since flux freezing predicts $5\times10^9$ gauss against an observed 1–3 kilogauss.

The obstacle to making a star is not gathering the material but getting rid of what comes with it, and the angular momentum problem in particular is why disks form and why planetary systems exist.

Collapse produces a central object long before it produces a star. That object is opaque, still accreting, powered entirely by gravity, and will not fuse hydrogen for a long time to come. The natural question that follows is what such an object — one not yet burning anything — is actually radiating, and how it could be distinguished observationally from a true star that has ignited hydrogen fusion at its core.

Answering that question requires nothing beyond the physics already assembled here: an object contracting under gravity and radiating away the energy it releases is a Kelvin–Helmholtz source, exactly the mechanism Lord Kelvin proposed for the Sun and exactly the mechanism whose reservoir turned out to be roughly a thousand times too small to power a star for its full lifetime. Applied instead to the brief accretion phase itself, rather than to a star's entire existence, gravitational contraction is more than adequate — it is, for a young accreting protostar, the only energy source available, since the central temperature has not yet risen to the point where nuclear reactions can begin. The transition from an object shining on gravitational energy alone to one shining on nuclear energy is not instantaneous, and the interval between them is where the classification of pre-main-sequence objects becomes observationally delicate.

## Further reading

A detailed treatment of gravitational collapse, fragmentation and the physics of protostar formation is given in {{book: Steven W. Stahler and Francesco Palla | The Formation of Stars | 2004}}.

- **Steven W. Stahler and Francesco Palla, *The Formation of Stars* (2004).** A graduate-level treatment covering the Jeans instability and its refinements, the theory of fragmentation and the opacity limit, the inside-out collapse solution developed by Shu, and the three disposal problems of energy, angular momentum and magnetic flux, including the physics of ambipolar diffusion and the origin of circumstellar disks and bipolar outflows. The book situates the Jeans criterion in its full historical and physical context and traces the subsequent decades of work extending it toward a realistic picture of how a rotating, magnetized, turbulent cloud core actually becomes a star.

## Problems

*Data: $k = 1.381\times10^{-23}$ J/K, $G = 6.674\times10^{-11}$, $m_H = 1.673\times10^{-27}$ kg, $\mu = 2.33$. 1 pc = 3.086 × 10¹⁶ m, $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, 1 yr = 3.156 × 10⁷ s. $M_J = (5kT/G\mu m_H)^{3/2}(3/4\pi\rho)^{1/2}$; $t_{ff} = \sqrt{3\pi/32G\rho}$; $\dot{M} = 0.975c_s^3/G$; $c_s = \sqrt{kT/\mu m_H}$. Flux freezing: $B \propto \rho^{2/3}$.*

### 1 — A criterion that outlived its context
**(a)** List three things that were unknown or wrong in 1902 which one might expect to matter for a theory of gravitational collapse.
**(b)** State the two energies Jeans compared, and identify every physical input the comparison requires.
**(c)** Explain why the criterion survived despite (a). What general property of the argument is responsible?
**(d)** State the "Jeans swindle" objection and explain why the result stands regardless.
**(e)** Name two other results derivable from a comparison of scalings rather than from detailed physics.

### 2 — Why big is vulnerable *(the central argument)*
**(a)** Show that gravitational binding energy scales as $M^{5/3}\rho^{1/3}$ and thermal energy as $M$.
**(b)** From (a), explain why there is always a mass above which collapse is inevitable, and why this inverts ordinary intuitions about the stability of large structures.
**(c)** Explain physically why self-gravitating systems behave differently from, say, a bridge or a pile of sand.
**(d)** Compute $M_J$ for $T$ = 10 K at $n$ = 10², 10⁴ and 10⁶ cm⁻³.
**(e)** Compute $M_J$ at $T$ = 100 K, $n$ = 10² cm⁻³, and compare with the 10 K value at the same density. State the scaling responsible.
**(f)** Explain why the 10 K temperature of molecular clouds is a precondition for stellar-mass fragments rather than an incidental fact.

### 3 — Fragmentation
**(a)** Explain why $M_J$ falls as a cloud collapses, and state the condition that must hold for this to happen.
**(b)** Explain why that condition holds in practice, naming the physical process responsible.
**(c)** Compute the number of Jeans masses in a 10⁴ M☉ cloud at $T$ = 10 K and $n$ = 10² and 10⁶ cm⁻³.
**(d)** State three consequences of fragmentation, one observational and two structural.
**(e)** Explain what halts the cascade, being precise about the change in thermal behavior.
**(f)** State the opacity limit and explain why it is a genuine prediction rather than a fitted number.
**(g)** The opacity limit is ~0.01 M☉ and the hydrogen-burning limit is 0.08 M☉. State what follows from the fact that they differ.

### 4 — Inside-out
**(a)** State what $t_{ff}$ depends on and, more importantly, what it does not.
**(b)** Compute $t_{ff}$ at $n$ = 10², 10⁶ and 10¹⁰ cm⁻³.
**(c)** Explain why collapse is runaway, and why it proceeds inside-out rather than uniformly.
**(d)** Compute the isothermal sound speed at 10 K and the resulting Shu accretion rate in M☉/yr.
**(e)** Compute how long it takes to assemble 1 M☉, and comment on the observational consequence.
**(f)** The accretion rate depends only on temperature. Explain the consequence for the first stars, which formed from metal-free gas that could not cool below ~200 K.

### 5 — Disposal: energy
**(a)** Compute the gravitational energy released collapsing 1 M☉ from 0.05 pc to $R_\odot$.
**(b)** Explain what would happen if that energy were retained.
**(c)** Name the coolants and the wavelength regime in which they radiate.
**(d)** Express the answer to (a) as a fraction of the Sun's total main-sequence output ($\sim1.2\times10^{44}$ J) and relate it to the Kelvin–Helmholtz timescale.

### 6 — Disposal: angular momentum *(the severe one)*
**(a)** A core of radius 0.05 pc rotates at $\omega = 10^{-14}$ rad/s. Compute its rotation period in years and comment on whether this is fast or slow.
**(b)** Conserving angular momentum, compute $\omega$ if it collapsed to $R_\odot$. Give the rotation period.
**(c)** Compute the resulting equatorial velocity and compare with the break-up velocity $\sqrt{GM_\odot/R_\odot}$.
**(d)** State the conclusion. Is this a difficulty requiring a correction, or something stronger?
**(e)** Name the two mechanisms by which angular momentum is actually disposed of.
**(f)** State two consequences that reach outside stellar physics.

### 7 — Disposal: magnetic flux
**(a)** Explain what flux freezing means and why it applies to molecular-cloud gas.
**(b)** Using $B \propto \rho^{2/3}$, compute the field strength resulting from collapse from $n = 10^2$ to $n = 10^{24}$ cm⁻³, starting at 10 μG.
**(c)** Compare with observed fields on young stars and state the discrepancy.
**(d)** Explain why the excess field would prevent collapse, not merely accompany it.
**(e)** Describe ambipolar diffusion and explain why it works only because the gas is *weakly* ionized.

### 8 — Numerical
**(a)** A core has $T$ = 10 K, $n = 10^5$ cm⁻³ and mass 3 M☉. Compute $M_J$ and state whether it collapses.
**(b)** Compute its free-fall time.
**(c)** Compute the mass it can assemble at the Shu rate over one free-fall time, and compare with its actual mass. Comment.
**(d)** The same core is warmed to 30 K by a nearby massive star. Recompute $M_J$ and state what happens.
**(e)** From (d), describe the effect of massive stars on subsequent star formation in their vicinity, and connect it to the low efficiency of star formation more generally.

### 9 — Open problem: what actually sets a star's mass?
The Jeans analysis predicts fragment masses, but the observed initial mass function is not simply a Jeans mass distribution.
**(a)** List three physical effects omitted from the Jeans argument that are known to matter.
**(b)** Explain why the observed initial-mass-function peak (~0.2 M☉) sits below a typical Jeans mass, and name two processes that could reduce a fragment's final mass below its initial one.
**(c)** The initial mass function appears nearly universal across very different environments. Explain why this is surprising given (a) and (b).
**(d)** Design an observational programme to test whether the initial mass function depends on environment. State what would be measured, and what systematic would limit the result.

## Worked answers

### 1 — A criterion that outlived its context

**(a)** Three from many: the composition of stars and interstellar gas was unknown — Cecilia Payne's hydrogen result was twenty-three years away, and the prevailing view was that stars were broadly terrestrial in composition. The nature of the spiral nebulae was disputed, and many held the Milky Way to be the entire universe. The existence of interstellar dust and molecular clouds was not established — the dark patches were still argued to be genuine voids, and Trumpler's demonstration was twenty-eight years away.

*(Also creditable: no known stellar energy source; no quantum mechanics; no knowledge of interstellar magnetic fields.)*

**(b)** Gravitational binding energy $\sim GM^2/R$ and thermal kinetic energy $\sim \frac{3}{2}NkT$.

Inputs required: Newtonian gravity; the ideal gas law; the mean molecular weight; and the assumption that the gas is roughly uniform. That is all. No opacity, no radiative transfer, no chemistry, no knowledge of what the gas is made of beyond $\mu$, and no energy source.

**(c)** Because it is a comparison of scalings, and scalings are insensitive to almost everything that was unknown.

The argument asks only how two energies depend on mass and radius, and both dependences follow from definitions rather than from properties of the material. Getting the composition wrong changes $\mu$ — a factor of a few in the answer — and changes nothing about the structure of the result, which is that gravity scales as $M^{5/3}$ and support as $M$.

A result derived from dimensional structure is robust against ignorance about content, which is the general property responsible.

**(d)** The Jeans swindle: the derivation assumes a uniform, infinite medium that is nevertheless in hydrostatic equilibrium — but a uniform self-gravitating medium of infinite extent has no equilibrium state, since there is no preferred center and the gravitational potential does not converge. The unperturbed state being perturbed does not actually exist.

The result stands because later treatments recover it properly — for an expanding background, for a finite cloud with a boundary, and from a virial-theorem argument that makes no appeal to an infinite uniform state at all. The swindle is a flaw in the derivation, not in the conclusion, and the criterion emerges unchanged from arguments that avoid it.

**(e)** A mass–luminosity relation of the form $L \propto M^3$ can be derived from hydrostatic equilibrium and radiative diffusion alone, with no nuclear physics required. The free-fall time depends only on density, and can be derived without reference to composition or internal structure.

*(Also creditable: the Roche limit; the tidal force scaling as $a^{-3}$; the spin-barrier period $\sqrt{3\pi/G\rho}$, which is independent of radius.)*

### 2 — Why big is vulnerable

**(a)** $|U| \sim GM^2/R$, and with $R \sim (3M/4\pi\rho)^{1/3}$:

$$|U| \sim GM^2\left(\frac{4\pi\rho}{3M}\right)^{1/3} \propto M^{5/3}\rho^{1/3}$$

$$K = \frac{3}{2}NkT = \frac{3}{2}\frac{M}{\mu m_H}kT \propto M$$

**(b)** Because $|U|/K \propto M^{2/3}\rho^{1/3}/T$ increases without limit as $M$ grows. However small the ratio is for a small cloud, adding mass at fixed density and temperature eventually makes gravity dominate — so there is always a critical mass above which no thermal pressure can prevent collapse.

This inverts ordinary intuition because most familiar systems have relevant forces that scale with the material's own local properties rather than with the total mass: a bigger pile of sand, a longer bridge, a larger room of gas are not thereby rendered unstable.

**(c)** Because gravity is a long-range force acting between every pair of particles. The binding energy involves $N(N-1)/2$ pairs, so it grows as $N^2$ — superlinearly — while thermal energy involves each particle once and grows as $N$.

In ordinary materials the binding is short-range: an atom in a solid is bound to its neighbors only, so doubling the object doubles the binding energy, and support scales the same way. Self-gravity is the only common force for which the total binding grows faster than the total mass, which is why self-gravitating systems have a maximum stable size and ordinary objects do not.

**(d)** $M_J = (5kT/G\mu m_H)^{3/2}(3/4\pi\rho)^{1/2}$, with $\rho = n\mu m_H$ ($n$ in m⁻³):

| $n$ (cm⁻³) | $M_J$ |
|---|---|
| 10² | **53.8 M☉** |
| 10⁴ | **5.38 M☉** |
| 10⁶ | **0.54 M☉** |

**(e)** At $T$ = 100 K, $n$ = 10²: $M_J = 53.8 \times 10^{3/2} = 1{,}700\ M_\odot$ — thirty-two times larger.

Responsible scaling: $M_J \propto T^{3/2}$. A factor of 10 in temperature gives $10^{1.5} = 31.6$ in Jeans mass.

**(f)** Because the Jeans mass depends steeply on temperature, and 10 K is what puts it in the stellar range.

At 10 K and $n = 10^4$ cm⁻³, $M_J = 5.4$ M☉ — a few stellar masses, so the fragmentation cascade terminates at objects of stellar scale. At 100 K the same gas would have $M_J = 170$ M☉, and fragments would be clusters rather than stars.

The efficient cooling by dust and CO that keeps molecular-cloud gas near 10 K is therefore not a background detail but the enabling condition: without it, collapse would still occur but would produce objects of the wrong mass entirely. This is precisely what happened in the metal-free early universe, discussed further below.

### 3 — Fragmentation

**(a)** Because $M_J \propto T^{3/2}\rho^{-1/2}$, so rising density lowers the Jeans mass — provided $T$ remains constant as $\rho$ increases. If temperature rose in step, the $T^{3/2}$ term would dominate and $M_J$ would increase instead.

**(b)** Because the collapsing gas is optically thin and cools efficiently. Compression does work on the gas and heats it, but the heat is immediately radiated away in the far infrared by dust grains and CO molecules, which the gas is collisionally coupled to.

The result is an essentially isothermal collapse: energy is removed as fast as it is generated, so the temperature stays near 10 K over many decades of increasing density.

**(c)** $10^4/53.8 = 186$ at $n = 10^2$; $10^4/0.538 = 18{,}600$ at $n = 10^6$.

**(d)** Observational: stars form in clusters, not singly. One cloud produces thousands of objects, so nearly all stars are born in groups, which is why star clusters exist and provide a natural population for comparing stars of a common age and composition.

Structural, first: a spectrum of masses is produced, not one mass, because different fragments terminate the cascade at different points. This is the origin of the initial mass function.

Structural, second: the fragment masses come out in the stellar range — a cascade from roughly 50 M☉ down to a fraction of a solar mass — which is a non-trivial success, since nothing in the argument was tuned to produce it.

**(e)** The gas becomes optically thick. The fragment is now dense enough that infrared photons cannot escape freely, so the heat of compression is retained rather than radiated.

$T$ therefore begins to rise with $\rho$, and since $M_J \propto T^{3/2}\rho^{-1/2}$, the $T^{3/2}$ term overtakes the $\rho^{-1/2}$ term. $M_J$ stops falling and starts increasing, so no smaller sub-region can become unstable and the cascade halts.

**(f)** The opacity limit, $M_{\min} \approx 0.01\ M_\odot \approx 10$ Jupiter masses.

It is a genuine prediction because it follows from when radiation stops escaping — a calculable condition depending on dust opacity and the compression rate — and was not adjusted to match any observation. It predicts that the lowest-mass objects fragmentation can produce are of brown-dwarf scale, and the observed brown-dwarf mass function does turn over in that region. A calculation about photon escape predicts the bottom of the stellar mass spectrum to within a factor of a few.

**(g)** That there is a range of objects that fragmentation can make and fusion cannot ignite — between 0.01 and 0.08 M☉.

Brown dwarfs exist because the two limits do not coincide, and they are set by completely unrelated physics: the opacity limit by when radiation stops escaping during collapse, the hydrogen-burning limit by whether electron degeneracy halts contraction before ignition temperature is reached. Had the opacity limit fallen above 0.08 M☉, every object formed would have become a star and brown dwarfs would not exist as a class.

### 4 — Inside-out

**(a)** Depends on density only. $t_{ff} = \sqrt{3\pi/32G\rho}$.

Does not depend on mass, radius, temperature, composition, or the size of the region considered. That last point matters — every part of a uniform cloud collapses on the same timescale regardless of how much of it is enclosed within a given boundary.

**(b)** $n$ = 10²: 3.37 Myr. $n$ = 10⁶: 33,700 yr. $n$ = 10¹⁰: 337 yr.

**(c)** Runaway because $t_{ff} \propto \rho^{-1/2}$: as material collapses its density rises, which shortens its own collapse time, which accelerates the collapse further. There is no restoring term.

Inside-out because the center is densest to begin with, so it has the shortest $t_{ff}$ and collapses first. The central region detaches dynamically from the envelope, and a rarefaction wave propagates outward at the sound speed as material is removed from beneath the outer layers. Inside the wave, gas is in free fall onto a growing central object; outside it, the core has not yet begun to move.

**(d)** $c_s = \sqrt{kT/\mu m_H} = \sqrt{(1.381\times10^{-23})(10)/(2.33 \times 1.673\times10^{-27})} = 188\ \text{m/s}$.

$\dot{M} = 0.975(188)^3/(6.674\times10^{-11}) = 9.7\times10^{16}$ kg/s $= 1.55\times10^{-6}\ M_\odot/\text{yr}$.

**(e)** $1/1.55\times10^{-6} = 6.5\times10^{5}\ \text{yr}$ — about 650,000 years.

Observational consequence: the assembly phase is extremely short compared with a stellar lifetime — 650 kyr against roughly 10 Gyr for a solar-mass star, a ratio of about $10^{-4}$. So at any moment only a tiny fraction of objects are caught in the act, which is why protostars are rare, why they are found only in active star-forming regions, and why the observational classification of collapse stages had to be assembled by comparing many objects at different phases rather than by watching a single one evolve.

**(f)** $\dot{M} \propto c_s^3 \propto T^{3/2}$, so warmer gas accretes faster.

Metal-free primordial gas had no dust and no CO, so its only coolant was molecular hydrogen, a poor radiator, and it could not cool below a few hundred kelvin. At 200 K rather than 10 K, $\dot{M}$ is larger by $20^{3/2} \approx 90\times$.

Combined with a Jeans mass larger by the same $T^{3/2}$ factor, this means the first stars formed from much larger fragments accreting much faster, and were correspondingly very massive — plausibly tens to hundreds of solar masses. The absence of coolants determined the character of the first generation of stars, and hence the character of the first supernovae and the first metals released into the universe.

### 5 — Disposal: energy

**(a)** $E = \tfrac{3}{5}GM_\odot^2/R_\odot = 0.6(6.674\times10^{-11})(1.989\times10^{30})^2/(6.957\times10^{8}) = 2.3\times10^{41}\ \text{J}$

Essentially all of it is released in the final stages, since the energy scales as $1/R$ and the last factor of ten in radius dominates.

**(b)** The gas would heat up, raising the pressure, which would halt the collapse. The material would settle into a warm, pressure-supported configuration at a radius far larger than a star's and stay there — a slowly contracting object radiating away its heat on a Kelvin–Helmholtz timescale, never reaching stellar density on any short timescale.

Efficient cooling is what allows collapse to proceed at all, rather than stalling at the first stage.

**(c)** Dust grains and CO molecules, together with other molecular species at higher densities, radiating in the far infrared — wavelengths of tens to hundreds of microns, where a blackbody at 10–20 K peaks.

**(d)** $2.3\times10^{41}/1.2\times10^{44} = 0.19\%$.

Relation to the Kelvin–Helmholtz timescale: the ratio is essentially $t_{KH}/t_{nuclear}$, since both are the same energy divided by the same luminosity. The Sun's gravitational reservoir sustains it for roughly $10^7$ yr against roughly $10^{10}$ yr for nuclear burning — a ratio of $10^{-3}$, matching. The formation energy is a small perturbation on a stellar lifetime's output.

### 6 — Disposal: angular momentum

**(a)** $P = 2\pi/\omega = 2\pi/10^{-14} = 6.28\times10^{14}$ s $= 19.9\ \text{Myr}$ per rotation.

Extremely slow — one rotation every twenty million years, comparable to the lifetime of the cloud itself. This is not a rapidly spinning object by any standard, which is what makes the result in (c) so striking.

**(b)** Specific angular momentum $j \sim \omega R^2$ is conserved, so $\omega \propto R^{-2}$. With $R_i = 0.05$ pc $= 1.54\times10^{15}$ m and $R_f = R_\odot = 6.96\times10^{8}$ m:

$$\omega_f = 10^{-14}\left(\frac{1.54\times10^{15}}{6.96\times10^{8}}\right)^2 = 10^{-14}(4.9\times10^{12}) = 4.9\times10^{-2}\ \text{rad/s}$$

$P = 2\pi/0.049 = 128\ \text{seconds}$ — about two minutes.

**(c)** $v_{eq} = \omega_f R_\odot = 0.049 \times 6.96\times10^{8} = 3.4\times10^{7}\ \text{m/s} = 34{,}000$ km/s — over a tenth the speed of light.

$v_{break} = \sqrt{GM_\odot/R_\odot} = 437\ \text{km/s}$.

Ratio: $34{,}000/437 = 78$.

**(d)** Something stronger — a complete prohibition.

A difficulty requiring a correction would be a factor of order unity, addressable by refining the model. A factor of 78 in velocity means a factor of roughly 6,000 in centrifugal acceleration relative to gravity; the object flies apart long before reaching stellar radius. The star simply cannot form unless essentially all the angular momentum is removed — and "essentially all" means better than 99.9%.

**(e)** A circumstellar disk, which absorbs angular momentum from infalling material — matter that is rotationally supported cannot fall inward and spreads outward instead, transporting angular momentum outward while mass moves inward. And bipolar outflows and jets, which eject material along the rotation axis, carrying angular momentum out of the system entirely.

**(f)** Planetary systems exist because of it. The disk is not incidental to star formation; it is a requirement, and planets form from the material that could not reach the star. Every planetary system is, in that sense, a fossil of the angular momentum disposal problem.

And the leftover is measurable today. The Sun holds 99.87% of the solar system's mass and about 0.6% of its angular momentum, with Jupiter alone carrying roughly 60% of the total. That is the same problem, observed billions of years after it was solved.

### 7 — Disposal: magnetic flux

**(a)** Flux freezing means the magnetic field lines are effectively tied to the fluid: as material moves, it drags the field with it, and the magnetic flux through any comoving surface is conserved.

It applies because molecular-cloud gas, though only weakly ionized (ionization fraction of order $10^{-7}$), contains enough free charges that the conductivity is very high on the relevant length and time scales. In the limit of perfect conductivity, the field and the matter move together.

**(b)** Density ratio $10^{24}/10^{2} = 10^{22}$, so $B$ increases by $(10^{22})^{2/3} = 4.6\times10^{14}$:

$$B_f = 10\ \mu\text{G} \times 4.6\times10^{14} = 4.6\times10^{9}\ \text{gauss}$$

**(c)** Observed fields on young stars: 1–3 kG. Discrepancy: $4.6\times10^{9}/2\times10^{3} \approx 2\times10^{6}$ — a factor of roughly two million.

**(d)** Because magnetic pressure is $B^2/2\mu_0$, and under flux freezing it grows very steeply with density — with the field amplified by the factor above, the magnetic term would dominate overwhelmingly long before stellar densities were reached.

So the excess field is not something a forming star would carry along and shed only at the end. It would halt the collapse partway, leaving a magnetically supported cloud that never becomes a star. The flux must be lost during the collapse, not after it.

**(e)** Ambipolar diffusion: the field is tied to the ions, not to the neutrals. Since the gas is only weakly ionized, the neutral particles — which constitute essentially all of the mass — are coupled to the field only indirectly, through collisions with the sparse ion population.

Gravity therefore pulls the neutrals inward while the field holds the ions back, and the neutrals drift slowly through the ion–field fluid. Over long timescales the bulk of the mass separates from the magnetic flux and collapses without it.

It works only because the ionization is low. In a fully ionized gas every particle is tied to the field and there is no neutral component to drift; the field would be dragged along completely. The inefficiency of the coupling is what permits the separation — a case where a process works because the physics is weak rather than strong.

### 8 — Numerical

**(a)** $M_J(10\ \text{K}, 10^5\ \text{cm}^{-3}) = 1.70\ M_\odot$. The core is 3 M☉, greater than $M_J$, so it collapses.

**(b)** $t_{ff} = 107{,}000\ \text{yr}$

**(c)** $\dot{M} \times t_{ff} = 1.55\times10^{-6} \times 1.07\times10^{5} = 0.17\ M_\odot$, against an actual core mass of 3 M☉.

The accretion rate is far too slow to assemble the core in one free-fall time. Building 3 M☉ at this rate takes about 1.9 Myr, roughly eighteen free-fall times. Collapse and accretion are not the same timescale — the inner regions collapse quickly and the star is then fed for a much longer period from the envelope, which is precisely the inside-out picture. A star's assembly is limited by the rate at which the envelope can be delivered, not by the free-fall time of the core.

**(d)** $M_J(30\ \text{K}, 10^5) = 1.70 \times 3^{3/2} = 8.84\ M_\odot$.

The core is 3 M☉, now below the Jeans mass. Collapse is suppressed — the warmed core is stable and will not form a star.

**(e)** Massive stars heat and disperse the gas around them, and since $M_J \propto T^{3/2}$, a modest temperature rise sharply raises the mass required for collapse. A factor of 3 in temperature raises $M_J$ by a factor of 5.2, converting marginally unstable cores into stable ones.

This is negative feedback: the first stars to form suppress the formation of subsequent ones nearby. Combined with their ionizing radiation, winds and eventual supernovae — and with the fact that O stars live only a few hundred thousand to a few million years, comparable to a cloud's free-fall time — star formation terminates itself before most of the cloud is consumed. This is the leading explanation for the low overall efficiency of star formation: efficiency runs to only a few percent not because clouds are strongly supported against collapse, but because the process destroys its own raw material.

### 9 — Open problem: what actually sets a star's mass?

**(a)** Turbulence — supersonic motions dominate the energy budget of real clouds, and shocks both compress gas, creating fragments, and disperse it. The Jeans argument assumes a static, thermally supported medium.

Magnetic fields — comparable to gravity in the support budget, and they suppress fragmentation along field lines while permitting it across them, imposing a preferred geometry the Jeans analysis has no room for.

Feedback from the fragments themselves — accretion is not passive. A forming star drives outflows that eject a substantial fraction of the infalling material, and radiation heats the surrounding gas, raising the local Jeans mass.

*(Also creditable: rotation; competitive accretion between fragments sharing a common reservoir; the fact that cores are filamentary rather than spherical.)*

**(b)** The observed initial mass function peaks near 0.2 M☉, below typical Jeans masses of 1–5 M☉ at realistic core densities. So fragments must lose mass between formation and arrival on the main sequence.

Two processes that reduce the final mass: outflows, in which bipolar jets driven during accretion eject a substantial fraction — plausibly 30–50% — of the material that would otherwise have reached the star (the angular momentum disposal problem requires such outflows, so this is not an optional addition); and envelope dispersal by feedback, in which radiation and winds from the forming star, and from neighboring massive stars, remove the outer envelope before it can accrete, terminating the star's growth at a mass below the original fragment's.

*(Also creditable: further sub-fragmentation of a core into a binary, dividing the mass; and dynamical ejection of a still-accreting protostar from its reservoir.)*

**(c)** Because the processes in (a) and (b) depend on environment — turbulence level, magnetic field strength, metallicity (hence cooling efficiency and dust opacity), radiation field, and stellar density — and those vary enormously between, for example, a quiescent nearby cloud, a starburst, and a metal-poor dwarf galaxy.

If the initial mass function were set by the Jeans mass alone it would depend on $T^{3/2}\rho^{-1/2}$ and should differ measurably between environments with different temperatures and densities. If it is set by the processes in (b), it should depend on feedback strength and metallicity.

Yet it appears nearly invariant. That suggests either a self-regulating mechanism, in which the same feedback that would change the outcome also adjusts the conditions to compensate, or that the observations are not yet sensitive enough to detect the variation. Universality demands explanation as much as variation would, and it is not currently explained.

**(d)** Measure the mass function in environments as extreme as possible, and compare.

What to measure: the mass function of young stars in nearby quiescent clouds, massive starburst clusters, low-metallicity systems such as the Magellanic Clouds and nearby dwarf galaxies, and the galactic center, where density, turbulence and radiation are all extreme. The observable is a luminosity function of pre-main-sequence stars, converted to masses using pre-main-sequence evolutionary tracks.

The limiting systematic is that conversion. Pre-main-sequence tracks are poorly calibrated — they depend on accretion history, on the treatment of convection, and on the star's radius at the point where it becomes visible, none of which is well constrained, and the calibration rests on a small sample of eclipsing binaries that contains few pre-main-sequence systems.

A secondary systematic, and in crowded fields the dominant one, is unresolved binaries, which make two stars look like one more massive one and systematically distort the inferred mass function — worst in exactly the dense environments where the signal is expected to be largest.

The apparent universality of the initial mass function is therefore partly a statement about the limits of the ability to measure it. Before concluding that a distribution is universal, it is necessary to establish that the method used could in fact have detected the variation.$astroCollapse_master$,
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
  select $astroCollapse_quiz$[{"id": "q1", "type": "mcq", "prompt": "James Jeans derived his gravitational-instability criterion in 1902, at a time when nobody knew what stars were made of, the nature of the spiral nebulae was disputed, and the existence of molecular clouds had not been established. Why does the Jeans criterion still function as the field's zeroth-order description of cloud collapse over a century later?", "options": ["Because Jeans revised the derivation repeatedly over his career as new observations became available, gradually updating it to match modern data", "Because the argument compares only two energy scalings, gravitational binding against thermal support, using no chemistry, opacity, radiation transport, or knowledge of the gas's composition, so it does not depend on anything that turned out to be wrong in 1902", "Because later astronomers discovered that Jeans had, by coincidence, used the correct values for hydrogen abundance and cloud temperature despite not knowing either was relevant", "Because the criterion was reformulated from scratch in the 1930s using Trumpler's dust results, making the 1902 version essentially obsolete but its name retained"], "answerIndex": 1, "explanation": "The Jeans argument rests on comparing how gravitational binding energy and thermal kinetic energy each scale with a cloud's mass and radius, an argument built from Newtonian gravity, the ideal gas law, and a mean molecular weight. None of that requires knowing what the gas is made of, how it radiates, or whether molecular clouds even exist as a class of object. A result derived from dimensional structure rather than detailed content is robust against exactly the kind of ignorance that characterized 1902, which is why the criterion survived essentially unmodified while nearly everything else believed about the universe at the time was overturned."}, {"id": "q2", "type": "mcq", "prompt": "Gravitational binding energy scales as mass to the five-thirds power at fixed density, while thermal support energy scales only as mass to the first power. Why does this inversion of the usual intuition about size and stability matter for understanding cloud collapse?", "options": ["It means small clouds are always the ones that collapse first, since they have the least thermal energy to begin with", "It means that because gravity involves every pair of particles and grows superlinearly with particle number while thermal energy involves each particle once, there is always some mass above which gravitational binding must exceed thermal support, guaranteeing every cloud has a critical mass beyond which collapse is inevitable", "It means gravity and thermal support scale identically once density is held fixed, so mass has no bearing on whether a cloud is stable", "It means large clouds are stabilized by their own gravity in the same way a large pile of sand is stabilized by friction between grains"], "answerIndex": 1, "explanation": "Ordinary objects, such as a pile of sand or a bridge, are held together by short-range forces where binding energy and support both scale in step with size, so scaling up does not make them less stable. Self-gravity is different because it is a long-range force acting between every pair of particles, so total binding energy grows with the square of particle number while thermal energy grows only linearly with it. That means however small the ratio of gravity to thermal support is for a small cloud, adding enough mass at fixed density and temperature eventually makes gravity dominate, so a critical mass above which collapse is inevitable always exists. This is the opposite of how ordinary large structures behave and is the central reason the Jeans mass exists at all."}, {"id": "q3", "type": "mcq", "prompt": "As a fragment of a collapsing cloud shrinks and its density rises, the fragmentation cascade eventually stops rather than continuing down to arbitrarily small masses. What physical change halts it, and at roughly what mass does this occur?", "options": ["The fragment becomes optically thick, so the heat of compression can no longer escape as radiation, temperature begins rising with density, and the Jeans mass turns around and starts increasing rather than falling, halting the cascade at roughly one hundredth of a solar mass, comparable to ten Jupiter masses", "The fragment's rotation rate becomes so fast that centrifugal force alone prevents any further collapse, regardless of the fragment's temperature or opacity", "The fragment's magnetic field reaches the interstellar medium's ambient strength, at which point magnetic pressure exactly balances gravity for every fragment regardless of mass", "The available supply of dust grains within the fragment is exhausted, removing the only channel for further gravitational contraction"], "answerIndex": 0, "explanation": "Throughout most of the cascade the collapsing gas is optically thin, so the heat generated by compression escapes immediately as far-infrared radiation from dust and CO, keeping the gas isothermal and allowing the Jeans mass to keep falling as density rises. Once a fragment becomes dense enough to be optically thick, radiation can no longer escape freely, so compression heats the gas and the temperature begins rising with density instead of staying constant. Because the Jeans mass scales as temperature to the three-halves power divided by the square root of density, a rising temperature eventually reverses the trend, and the Jeans mass starts increasing rather than falling. This opacity limit, at roughly one hundredth of a solar mass or about ten Jupiter masses, is a genuine testable prediction, and it matches where the observed brown dwarf mass function turns over."}, {"id": "q4", "type": "mcq", "prompt": "A molecular cloud core of radius 0.05 parsecs rotating at ten to the negative fourteenth radians per second, a rotation period of about twenty million years, would spin up to a two-minute rotation period and an equatorial velocity of about seventy-eight times its break-up velocity if it collapsed to the size of the Sun while conserving angular momentum. Why is this described as a complete prohibition rather than a difficulty requiring only a correction?", "options": ["Because a factor of seventy-eight over break-up velocity corresponds to roughly six thousand times too much centrifugal acceleration relative to gravity, meaning the object would fly apart long before reaching stellar radius, so a star simply cannot form this way unless nearly all the angular momentum is removed by some other means, such as a disk or an outflow", "Because a factor of seventy-eight is only a modest overestimate that can be absorbed by refining the assumed initial core radius by a small amount", "Because rotation only matters for stars more massive than about ten solar masses, so the calculation is not actually relevant to typical star formation", "Because the calculation assumes the core is a rigid body, and real cores are fluid, which removes the excess angular momentum automatically as they collapse"], "answerIndex": 0, "explanation": "A difficulty requiring only a correction would be a discrepancy of order unity, something a more careful model could absorb. Exceeding break-up velocity by a factor of about seventy-eight corresponds to roughly six thousand times too much centrifugal force relative to the gravity holding the object together, which means the star cannot assemble at all under simple angular momentum conservation. Essentially all of the core's angular momentum, better than 99.9 percent of it, has to be disposed of through some channel other than being carried along with the collapsing gas, which is why circumstellar disks and bipolar outflows are not optional refinements but a structural requirement of star formation, and why planetary systems form as a direct consequence."}, {"id": "q5", "type": "mcq", "prompt": "A collapsing core must dispose of energy, angular momentum, and magnetic flux, and the magnitude of what must be shed differs enormously between the three. Ranking them and connecting the angular momentum problem to what remains observable today, which statement is correct?", "options": ["Magnetic flux is the least severe of the three, since flux freezing predicts a final field only modestly above what is observed on young stars", "Energy is the most severe, since essentially none of the gravitational energy released during collapse can be radiated away before the star ignites", "Angular momentum disposal is the least severe of the three problems, and the present solar system shows no trace of it having occurred", "Magnetic flux disposal is the most severe, with flux freezing predicting a field roughly a million times stronger than the one to three kilogauss actually observed on young stars, while angular momentum disposal, though less extreme, is severe enough that the Sun today still holds 99.87 percent of the solar system's mass but only about 0.6 percent of its angular momentum"], "answerIndex": 3, "explanation": "Flux freezing predicts that collapsing cloud-density gas threaded by a ten microgauss field would produce a field of roughly five times ten to the ninth gauss at stellar density, against an observed one to three kilogauss on young stars, a discrepancy of about a factor of a million, resolved chiefly through ambipolar diffusion. Angular momentum disposal, requiring roughly 99.9 percent of the core's angular momentum to be shed, is somewhat less extreme in relative terms but still an outright prohibition rather than a correction, and its resolution through disks and outflows is directly responsible for planetary systems. The present solar system preserves a fossil of that resolution: nearly all of the system's mass is in the Sun, while nearly all of its angular momentum resides in the orbiting planets, chiefly Jupiter. Energy disposal, by contrast, is comparatively mild, a problem of rate rather than of an enormous fixed excess, solved continuously by dust and CO radiating the heat of compression away in the far infrared."}, {"id": "q6", "type": "open", "prompt": "Explain, using the specific numbers involved, why the angular momentum problem in star formation is described as a complete prohibition rather than a correction, and explain how the resolution of that problem is connected to the existence of planetary systems and to the present-day mass and angular momentum distribution of the solar system.", "rubric": "A strong answer starts from a molecular cloud core of radius 0.05 parsecs rotating at about ten to the negative fourteenth radians per second, a period of roughly twenty million years, and shows that conserving specific angular momentum, which scales as angular velocity times radius squared, while collapsing the core down to the radius of the Sun raises the angular velocity by the square of the radius ratio, about 2.2 million, giving a final angular velocity of about 4.9 times ten to the negative second radians per second and a rotation period of about two minutes. The answer should compute or state the resulting equatorial velocity of about 34,000 kilometers per second, over a tenth the speed of light, and compare it with the break-up velocity of about 437 kilometers per second, giving a ratio of about seventy-eight. It should explain that this is not a modest overestimate correctable by refining assumptions, since seventy-eight times break-up velocity corresponds to thousands of times too much centrifugal force relative to gravity, so the star could not hold together at all unless essentially all the angular momentum, better than 99.9 percent, is removed by some channel other than direct conservation. The answer should then connect this to the two disposal channels, a circumstellar disk that absorbs infalling material that cannot fall directly inward because it is rotationally supported, and bipolar outflows that carry angular momentum out of the system entirely, and explain that the disk is therefore not incidental but a structural requirement of star formation, with planets forming from exactly the material that could not reach the star. A complete answer notes that the outcome is still measurable in the solar system today: the Sun holds about 99.87 percent of the system's mass but only about 0.6 percent of its angular momentum, most of which resides in the orbiting planets, particularly Jupiter, meaning the present distribution of mass and angular momentum is a direct, still-visible record of how the disposal problem was solved four and a half billion years ago."}, {"id": "q7", "type": "open", "prompt": "James Jeans derived his 1902 collapse criterion using only a comparison between gravitational binding energy and thermal support energy, with no knowledge of stellar composition, cloud chemistry, or radiative cooling. Explain why fragmentation, one of the direct consequences of that same criterion, nonetheless depends critically on a cooling process that Jeans had no way to include, and explain why the mass at which fragmentation halts constitutes a genuine testable prediction rather than a number simply fitted to match observation.", "rubric": "A strong answer explains that the Jeans mass scales as temperature to the three-halves power divided by the square root of density, so as a collapsing region's density rises, the Jeans mass falls only if the temperature stays roughly constant rather than rising in step with compression. It should explain that this near-constant temperature is maintained because the collapsing gas is optically thin, allowing dust grains and CO molecules to radiate the heat generated by compression away as far-infrared radiation as fast as it is produced, so that a falling Jeans mass, and therefore fragmentation into progressively smaller pieces, depends on an efficient cooling mechanism that plays no role in the original 1902 energy comparison itself, since Jeans did not know clouds or dust or CO existed. The answer should then explain that fragmentation halts once a fragment becomes dense enough to be optically thick, so that radiation can no longer escape freely, compression heats the gas, temperature begins rising with density, and the Jeans mass, now dominated by the rising temperature term, turns around and increases rather than continuing to fall, which prevents any smaller sub-region from becoming unstable. A complete answer explains why the resulting opacity limit, at roughly one hundredth of a solar mass or about ten Jupiter masses, counts as a genuine prediction: it follows from calculating when radiation stops escaping a collapsing fragment, a condition set by dust opacity and compression rate rather than by any observed stellar or brown dwarf mass, and was not adjusted after the fact to match data. The answer should note that this calculated value does match the observed turnover of the brown dwarf mass function to within a factor of a few, and should distinguish the opacity limit from the separate hydrogen-burning limit at 0.08 solar masses, set by unrelated physics involving electron degeneracy pressure halting contraction before ignition temperature is reached, explaining that brown dwarfs exist as a distinct class of object precisely because these two independently derived limits do not coincide."}]$astroCollapse_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/star-birth/collapse', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
