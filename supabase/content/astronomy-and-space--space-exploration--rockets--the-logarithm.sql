-- Space Exploration · Propulsion & Ascent — "Momentum, Exhaust, and the Logarithm"
-- (Lecture 1). Curated, human-reviewed master for
-- astronomy-and-space/space-exploration/rockets/the-logarithm @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert, so it also restores
-- the article after any database incident. Shorter depths/levels are distilled
-- from this master (the delete below drops derived caches when the body changes).
--
-- Original, house-styled rework of the ASTR-191 Lecture 1: the rocket equation
-- derived from momentum, specific impulse, the payload-fraction formula, the
-- single-stage impossibility theorem, the I_sp elasticity, propulsive
-- efficiency, and the relativistic tail. KaTeX math ($...$ / $$...$$); literal
-- currency escaped (\$) so it is never read as a math span; the body is
-- Postgres dollar-quoted so inner $ needs no SQL escaping.
--
-- Embeds interactive ```example blocks (rocket-mass-ratio,
-- rocket-payload-fraction, rocket-propulsive-efficiency) rendered as infinite
-- "Your turn" practice boxes (see src/components/WorkedExample.tsx), plus a
-- curated self-test quiz at the bottom.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/space-exploration/rockets/the-logarithm',
    'research',
    'advanced',
    'read',
    $l1_master$> The rocket equation is not a design. It is a **prohibition** — derived in four lines from conservation of momentum alone, with no chemistry, no engineering, and no assumptions whatsoever about the future.

## Cold open: the ninety-year gap

In 1813, a British mathematician named **William Moore**, who taught at the Royal Military Academy at Woolwich, published *A Treatise on the Motion of Rockets*.

In it, he did something remarkable and then failed to notice he had done it. Applying Newtonian mechanics to a body that expels mass, he derived — correctly, ninety years early — the relationship between a rocket's velocity change, its exhaust velocity, and the logarithm of its mass ratio.

**He had the rocket equation.**

He was computing artillery tables. Britain had been on the receiving end of Indian war rockets at Seringapatam, had reverse-engineered them into the Congreve rocket, and had recently used them against Fort McHenry — which is why an American lawyer named Francis Scott Key wrote a line about red glare that your countrymen now sing at baseball games. The Board of Ordnance wanted to know how far the things would go. Moore told them. He did the mathematics beautifully and correctly, and the mathematics said: the velocity is proportional to the logarithm of the mass ratio.

And then nothing happened. For ninety years.

Not because anyone disproved it. Not because it was hidden — it was *published*. Nothing happened because Moore was answering the question he had been asked, which was **"how far will this artillery rocket fly?"**, and the answer to that question is "about two miles, sir," and everyone went home satisfied.

**Nobody asked what the equation *meant*.**

Ninety years later, in a wooden house in Kaluga, 180 km southwest of Moscow, a deaf schoolteacher with no laboratory, no funding, no colleagues, and no access to the Woolwich journals wrote the same equation down again. And then he did the thing Moore didn't do.

**He asked it a different question.**

He didn't ask "how far will this rocket fly?" He asked: *what would it take to leave?*

And the equation answered him. It said: **here is exactly what it would take, here is why it is nearly impossible, here is the one trick that makes it possible, and here — since you asked — is the shopping list.** Liquid hydrogen and liquid oxygen. Multiple stages, discarded in sequence. Airlocks. Closed-loop life support with plants. Spin gravity. Orbital stations.

Konstantin Tsiolkovsky, in 1903, using a pencil and an equation that had been sitting in the open literature since before Waterloo, wrote down essentially the entire twentieth century.

**Hold onto this, because it is the most important point here and it has nothing to do with rockets.**

The mathematics was not the achievement. The mathematics was *ninety years old and freely available*. Moore had it. Anyone at Woolwich could have had it. The achievement was **asking the equation a question nobody had thought to ask it**, and then being sufficiently unreasonable to take the answer seriously.

There is an equation sitting in the open literature of your own field right now, correctly derived, answering a question nobody important cares about. Somebody is going to ask it something else.

Now to find out what this one says.

---

## The trinity: three men, three countries, one equation

Between 1903 and 1923, three men independently founded astronautics. **None of them had read each other.** None of them had access to the others' work. Two of them didn't know the others existed until well after.

This is worth a moment, because convergent discovery is always a signal. When three people find the same thing independently, the thing was **there**, and it was **findable**, and the only question was who would trip over it first.

### Konstantin Eduardovich Tsiolkovsky (1857–1935)

Born in Izhevskoye, Ryazan Province. At ten, scarlet fever took most of his hearing. He would later write that the deafness drove him out of society and into books — that it was, in the end, the thing that made him.

He was effectively expelled from formal schooling — he couldn't hear the teachers. At sixteen his father sent him to Moscow with a small allowance, hoping he'd enroll somewhere. He didn't. He spent three years, 1873 to 1876, in the **Chertkovskaya Library**, teaching himself physics and mathematics from the shelves. He lived on black bread and water and spent the allowance on chemicals and books. He later said the library was his university, which is the kind of thing people say sentimentally and which in his case was a bare description of fact.

The librarian was a man named **Nikolai Fyodorov**, worth describing because he is one of the great strange figures of intellectual history. Fyodorov was a **Cosmist**: he believed, with total sincerity, that humanity's moral duty was to conquer death and **physically resurrect every human being who had ever lived** — all of them, by scientific means, back to the first. And he had noticed a logistical problem with this plan, which is that if you resurrect everyone who ever lived, **they will not fit on the Earth.**

So they would need somewhere to go.

Fyodorov, unpaid, curated the reading of a deaf, penniless teenager, feeding him physics and mathematics, and never charged him a kopeck. Tsiolkovsky did not adopt the resurrection programme. But he did absorb, from a librarian mystic, the *premise* that leaving the Earth was a thing one might have to actually plan for — and then he went off and did the arithmetic that Fyodorov could not do.

**The most consequential equation of the twentieth century has a mystic librarian upstream of it, who wanted somewhere to put the resurrected dead.** History is not tidy. Get used to it.

Tsiolkovsky became a provincial schoolteacher — Borovsk, then Kaluga from 1892, teaching arithmetic and geometry to schoolchildren for the rest of his working life. In his spare time, in his apartment, at his own expense, he built **the first wind tunnel in Russia** (1897) and used it to study aerodynamic drag, publishing results that the Russian Academy of Sciences ignored.

In **1897** he derived the rocket equation in his notebook.

In **1903** he published *Исследование мировых пространств реактивными приборами* — *Exploration of Outer Space by Means of Rocket Devices* — in a journal called *Nauchnoye Obozreniye* (*Scientific Review*).

The journal was shut down by the censors shortly afterward. **The paper vanished.** It reached almost nobody. Tsiolkovsky, deaf, in Kaluga, having just written down the founding document of astronautics, received essentially no response at all, and continued teaching arithmetic.

**And in the same year, on the seventeenth of December, in North Carolina, two bicycle mechanics got a canvas-and-spruce contraption twelve feet off the ground for twelve seconds.**

Nobody on Earth noticed that these two events were the same event.

What was in the 1903 paper: the rocket equation. The case for **liquid** propellants — specifically liquid hydrogen and liquid oxygen — at a time when every rocket on Earth was a solid-fueled firework. The analysis of Earth's gravity well. Cooling the nozzle with the propellant. And in later work: **multistage rockets** (he called them "rocket trains"), airlocks, closed-loop life support with plants, spin gravity, and orbital stations.

He got it right. From a schoolteacher's desk. With no data, no funding, no laboratory, and no rocket.

Recognition came only after 1917, when the Soviet state — which needed heroes who were scientific, Russian, and safely apolitical — discovered him. He was made a member of the Socialist Academy in 1918. He died in 1935, at 78, having never seen a liquid-fueled rocket fly.

The line everyone quotes is from a 1911 letter: **the Earth is the cradle of humanity, but one cannot live in a cradle forever.** It is on his monument in Kaluga. What people forget is the rest of the thought — he meant it as a *schedule*, not a slogan. He thought it would take about four hundred years. He was pessimistic by roughly three hundred and fifty.

### Robert Hutchings Goddard (1882–1945)

American, Worcester, Massachusetts. Physicist at Clark University. Where Tsiolkovsky was a theorist who never built a rocket, Goddard was an experimentalist who built them constantly and published almost nothing — and the reason for that is one of the sadder stories in this field.

In **1919** the Smithsonian published his monograph *A Method of Reaching Extreme Altitudes*. It is a careful, sober, mathematical document about high-altitude atmospheric research. It contains the rocket equation, independently derived. And in the final section, almost as an afterthought, Goddard noted that the same mathematics permitted a rocket to reach **the Moon** — and suggested that one could confirm arrival by detonating a charge of flash powder on the surface, visible from Earth through a telescope.

The press seized on the flash powder and ignored everything else.

On **13 January 1920**, the *New York Times* ran an unsigned editorial mocking him. Its central argument was that a rocket cannot work in a vacuum, because it needs *something to push against* — and it added, with real venom, that Professor Goddard appeared to lack the basic knowledge dispensed daily in high schools.

**The editorial writer had the physics exactly backwards.** A rocket does not push against air. Air is *drag*; it is the enemy; a rocket works **better** in a vacuum. The mechanism is conservation of momentum, which is not an advanced topic — it is, as it happens, the knowledge ladled out daily in high schools.

Goddard was mocked in the national press, by a newspaper that was confidently, demonstrably wrong, on a matter of first-year physics, for being correct.

**And it broke something in him.** He became secretive. He moved his operations to Roswell, New Mexico, and worked in near-isolation for the rest of his career, funded quietly by Charles Lindbergh's advocacy and the Guggenheims' money. He filed **214 patents** and told almost no one what he was doing.

Here is the bitter part. **The German rocket team read Goddard's published work carefully.** Oberth wrote to him. Von Braun's people studied the 1919 monograph. The Americans ignored him; the Germans did not. When von Braun was captured and interrogated in 1945 and asked about the V-2's origins, he is said to have suggested the Americans consult their own Dr. Goddard, who knew all about it. Goddard died that year, of throat cancer, at 62.

On **17 July 1969**, with Apollo 11 three days from the lunar surface, the *New York Times* published a correction. It stated that it was now definitively established that a rocket functions in a vacuum as well as in an atmosphere, and that the Times regretted the error.

**Forty-nine years.** He had been dead for twenty-four of them.

On 16 March 1926, on his Aunt Effie Ward's farm in Auburn, Massachusetts, Goddard launched the first liquid-fueled rocket in history. It burned for two and a half seconds, reached 41 feet, landed 184 feet away in a cabbage patch, and hit about 60 mph. His wife Esther filmed it, and the camera ran out of film before the launch, so the famous photograph is of Goddard standing next to it beforehand, in a coat and tie, looking like a man about to give a lecture.

**Every rocket in this book descends from that cabbage patch.**

### Hermann Oberth (1894–1989)

Transylvanian Saxon, born in what is now Romania. In **1922** he submitted a doctoral dissertation on rocket-powered spaceflight to the University of Heidelberg.

**It was rejected as too speculative.**

So in **1923** he published it himself, as *Die Rakete zu den Planetenräumen* — *By Rocket into Planetary Space*. He remarked later, with characteristic dryness, that he had refrained from writing another dissertation, having concluded he could manage perfectly well without the title. He was right. He got the title anyway, eventually, from a different university, in 1938, by which point it hardly signified.

Oberth's book contains the rocket equation, the case for multistaging, the mathematics of orbital velocity, the **Oberth effect** (the chapter on interplanetary trajectories — burn deep in the gravity well, where you're moving fast, and the same propellant buys you far more energy), and a serious analysis of human physiology under acceleration.

It also did something the others didn't: **it landed.** It was read. It created the *Verein für Raumschiffahrt*, the German rocket society, and the VfR's young members included an eighteen-year-old named **Wernher von Braun**, who would build the V-2, and then the Saturn V, and about whom the final chapter has a great deal more to say, none of it comfortable.

And Oberth did one more thing. In 1929 he was hired as technical consultant on Fritz Lang's film *Frau im Mond* — *Woman in the Moon* — which is, for its date, an astonishingly accurate depiction of a lunar mission. Multistage rocket. Liquid propellants. Weightlessness in coast. A rollout to the pad on a transporter.

And for the launch scene, Lang needed **dramatic tension**. Numbers going *up* are not tense. So he had them count **down**.

**The countdown does not come from engineering. There is no technical reason to count backwards.** It comes from a German silent film director in 1929 who needed the audience to hold its breath.

Reality watched the movie and adopted the convention. Every launch you have ever seen — every "T-minus," every "three, two, one" — is a piece of **cinematic grammar** that escaped from the screen and colonized the physical world. When they counted down to Apollo 11, they were doing Fritz Lang's blocking.

### The point of the trinity

1813 Moore. 1903 Tsiolkovsky. 1919 Goddard. 1923 Oberth. **Four independent derivations, four countries, no contact.**

The equation was not hidden. It was not hard. It follows in four lines from conservation of momentum, which Newton published in 1687. **Any competent physicist in any year after 1687 could have derived the rocket equation on a wet afternoon.**

What was hard was **caring**. What was hard was looking at $\Delta v = v_e \ln(m_0/m_f)$ and seeing, in it, the Moon.

Now to derive it. And to derive it properly, first consider how nearly everyone derives it **wrong**, including several textbooks.

---

## The wrong derivation, and why it is wrong

Here is the derivation that appears in a distressing number of places. Watch it carefully. It is short, it is plausible, and it is **wrong**.

Newton's second law, in the form Newton actually preferred:

$$F = \frac{dp}{dt}$$

The rocket has momentum $p = mv$. Both $m$ and $v$ are functions of time. So differentiate the product:

$$F = \frac{d}{dt}(mv) = m\frac{dv}{dt} + v\frac{dm}{dt}$$

$$F_{\text{ext}} = ma + v\dot m$$

Rearranged, with no external force:

$$ma = -v\dot m$$

And since $\dot m < 0$ (the rocket is losing mass), $-v\dot m > 0$, and the rocket accelerates. **Thrust**, apparently, is $-v\dot m$.

It looks fine. It is not fine. It is **catastrophically** not fine, and it is worth killing twice, with two different weapons, because you will meet this error in the wild and you need to be able to dispatch it without thinking.

### Kill #1: the leaking sandbag

Put a cart of sand on a frictionless track. Give it a shove; it coasts at velocity $v$. Now open a small hole in the bottom of the cart.

Sand dribbles out. It falls straight down, **with no velocity relative to the cart**. It just... leaves.

What does the cart do?

Everyone knows the answer. **The cart coasts.** It does exactly what it was doing. Nothing has happened to it. The sand didn't push on anything; it was carried along, and then it wasn't.

Now ask the formula.

$F_{\text{ext}} = 0$, so $ma = -v\dot m$. The cart is losing mass, so $\dot m < 0$, so $-v\dot m$ is **positive**, so $a > 0.$

**The formula says the leaking sandbag accelerates.**

It doesn't. It never has. If leaking sandbags accelerated, the world would be an interesting and unstable place, and hourglasses would be a propulsion technology.

Kill #1 is not a subtlety. It's a demolition. **The formula predicts, for the simplest imaginable case, a phenomenon that does not exist.**

### Kill #2: Galilean invariance, the referee

The second kill is deeper and it's the one you should carry with you.

Look at the alleged thrust term: $-v\dot m$. It contains $v$ — **the rocket's velocity**.

Velocity *with respect to what?*

Suppose a rocket is sitting on the launch pad, engines lit, straining against the hold-downs. In the frame of the launch pad, $v = 0$. So the thrust is $-v\dot m = 0$. **The formula says an engine at full throttle produces no thrust when you're standing next to it.**

Now walk past the launch pad at 5 m/s. In your frame, $v = 5$, and there's some thrust.

Now consider the frame of the Sun, in which the launch pad is moving at about 30 km/s. In *that* frame, the thrust is enormous.

**Same rocket. Same engine. Same propellant. Same combustion. Three different answers.**

This is not allowed. It is not allowed by anything. **A law of physics cannot depend on which inertial frame you are standing in.** Galilean invariance is not a suggestion or a convention or a philosophical preference; it is the referee, and it has just blown the whistle and sent this formula off the field.

And notice *exactly* where the error entered, because the diagnosis is the whole lesson:

> **The formula contains an absolute velocity where it should contain a relative velocity.**

Thrust cannot depend on how fast the rocket is going. Thrust depends on **how fast the exhaust leaves the rocket**, which is a relative quantity, and relative quantities are the same in every inertial frame.

That's the disease. Now to understand why the physician got sick.

### The actual mistake

Here is the thing that makes this error so seductive, and it's worth being precise about it because the precision is the point.

**Newton's second law, $F = dp/dt$, applies to a system of *fixed identity* — a specific, unchanging collection of particles.**

That's not a footnote. That's what the law *is*. Newton's laws are statements about *a body*. When you write $F = dp/dt$ you are making a claim about a fixed set of stuff.

When you write $p = mv$ for a rocket and let $m$ change, you have quietly changed **which particles you are talking about** from one instant to the next. At time $t$ you meant *the rocket plus all its propellant*. At time $t + dt$ you meant *the rocket plus slightly less propellant* — **a different object.**

So $dp/dt$ is not the rate of change of the momentum of a body. **It's the difference between the momenta of two different bodies, divided by $dt$**, and there is no theorem in physics that says such a thing equals the external force. Why would it? You've compared apples to slightly smaller apples and demanded that Newton account for the difference.

**Newton's second law is not wrong here. It is being *misapplied*, by being pointed at a system whose membership changes.** The law was never asked this question and cannot answer it.

The fix is not to patch the formula. The fix is to **stop cheating on the definition of the system.**

### An aside, because this generalizes viciously

This error — *applying a conservation law to a system whose boundaries you are quietly changing* — is not a rocket error. It is one of the great recurring errors of physical reasoning, and it has cost real money.

It's the same error as computing a company's "profit" while quietly changing which subsidiaries count. It's the same error as an energy balance across a control volume with an unacknowledged leak. It's the same error as the "the population is getting healthier" claim that turns out to be people leaving the cohort. **Any time you see a conservation argument, the first question is never "is the law true?" It is: *what is the system, and did it change while you weren't looking?***

In fluid mechanics they teach this properly and give it a name — the **Reynolds transport theorem** — precisely because getting it wrong destroys everything downstream. In introductory mechanics it mostly isn't taught, and then the surprise comes when students derive accelerating sandbags.

Now to do it properly.

---

## The right derivation: four lines, and one honest definition

The trick is the one you should now be able to guess: **define the system to include the propellant that leaves.** Then the system has fixed identity, its mass is constant, and Newton is back on solid ground and will answer questions again.

### Set up

At time $t$:
- Take a rocket of mass $m$, moving at velocity $v$ in some inertial frame. Pick one; any one. It won't matter, and *that it won't matter* is the whole point.
- **The system is: the rocket *and* everything currently inside it, including the propellant it is about to eject.** Total mass $m$. Total momentum:

$$p(t) = mv$$

During the interval $dt$, the engine ejects a small quantity of propellant. Let $dm$ be the change in the rocket's mass, so $dm < 0$, and the ejected mass is $-dm > 0$.

At time $t + dt$, our system — **the same particles, no more and no less** — consists of two pieces:

1. **The rocket**, now of mass $m + dm$, moving at $v + dv$.
2. **The ejected propellant**, of mass $-dm$, moving at some velocity $u$ in our inertial frame.

Now: what is $u$?

The exhaust leaves the rocket at speed $v_e$ **relative to the rocket**, directed backwards. So in our inertial frame:

$$u = v - v_e$$

**Look at what just happened, because this is the entire fix in one line.** The physics of the engine — combustion, nozzle, the whole business of the next chapter (the thermochemical ceiling) — is contained in $v_e$, a *relative* velocity, a property of the engine and nothing else. The frame-dependent quantity $v$ enters only as bookkeeping, and it is about to cancel. That cancellation is not luck. It is Galilean invariance doing its job.

### Compute

$$p(t + dt) = \underbrace{(m + dm)(v + dv)}_{\text{rocket}} + \underbrace{(-dm)(v - v_e)}_{\text{exhaust}}$$

Expand:

$$p(t+dt) = mv + m\,dv + v\,dm + \underbrace{dm\,dv}_{\text{second order}} - v\,dm + v_e\,dm$$

The $+v\,dm$ and $-v\,dm$ **cancel** — there is the invariance, arriving on schedule — and $dm\,dv$ is a product of two infinitesimals and dies:

$$p(t+dt) = mv + m\,dv + v_e\,dm$$

So the change in the system's momentum over $dt$ is:

$$dp = p(t+dt) - p(t) = m\,dv + v_e\,dm$$

**Now, and only now, apply Newton** — because *this* system has fixed identity, so the law is entitled to speak:

$$F_{\text{ext}}\,dt = m\,dv + v_e\,dm$$

Divide by $dt$ and rearrange:

$$\boxed{\;m\frac{dv}{dt} = F_{\text{ext}} - v_e\frac{dm}{dt}\;}$$

This is the **rocket equation in differential form**, and it is correct, and it is frame-independent, and it does not accelerate sandbags. (Sandbag check: sand leaves with $v_e = 0$. So $m\dot v = 0$. The cart coasts. ✓)

Since $dm/dt < 0$, the term $-v_e \dot m$ is **positive**. It is a force. It is *the* force. Name it:

$$\boxed{\;T = -v_e\dot m = v_e\,|\dot m| = \dot m_p\, v_e\;}$$

where $\dot m_p$ is the propellant mass flow rate, a positive number.

**Thrust is exhaust velocity times mass flow rate.** It depends on the engine and nothing else. It does not care how fast you're going, which way you're facing, what frame you measure it in, or whether anyone is watching. **You can measure it on a test stand bolted to the ground, and the number you get is the number you will get in deep space at 20 km/s**, which is a good thing, because otherwise the entire practice of ground-testing engines would be a fraud.

### Integrate

Set $F_{\text{ext}} = 0$ — no gravity, no drag, nothing but the engine. (Gravity returns in the chapter on ascent, where it will cost about 1.5 km/s, and you will not enjoy it.)

$$m\,dv = -v_e\,dm$$

Separate:

$$dv = -v_e\frac{dm}{m}$$

Integrate from the start of the burn ($v = v_i$, $m = m_0$) to the end ($v = v_f$, $m = m_f$):

$$\int_{v_i}^{v_f} dv = -v_e\int_{m_0}^{m_f}\frac{dm}{m}$$

$$v_f - v_i = -v_e\left[\ln m\right]_{m_0}^{m_f} = -v_e(\ln m_f - \ln m_0)$$

$$\boxed{\;\Delta v = v_e\ln\!\left(\frac{m_0}{m_f}\right)\;}$$

**That is the Tsiolkovsky rocket equation.** Four lines from conservation of momentum. 1813. 1897. Sitting in the open the whole time.

### What we assumed, stated honestly

Every derivation smuggles assumptions. Here are these ones, on the table, laid out rather than smuggled:

1. **$v_e$ is constant.** Real engines throttle, and their exhaust velocity varies with ambient pressure (as shown below). This is handled by using an *average* effective $v_e$ over the burn, which is legitimate and is what everyone does.
2. **One-dimensional.** Thrust is along the velocity vector. In reality you steer, and steering costs you (the chapter on ascent).
3. **No external forces.** A lie. Gravity is on, drag is on. **But — and this is why the equation survives contact with reality — those get accounted for as *additional Δv*, added to the budget, rather than as corrections to the equation.** That accounting choice is the reason the Δv map in the overview works at all, and it's the subject of the chapter on ascent.
4. **The exhaust is a single stream.** Fine.
5. **Non-relativistic.** This gets fixed in the relativity section below, and you will wish it hadn't been.

**Note what was *not* assumed.** Nothing was assumed about combustion. Or chemistry. Or the nozzle. Or the year. Or the technology. **This equation is true for a chemical rocket, an ion drive, a nuclear thermal engine, a photon rocket, an antimatter drive, a fusion torch, or a man in a spacesuit throwing bricks.**

That last one is not a joke, and it should land. **A man in a spacesuit throwing bricks is a rocket**, governed by exactly this equation, and if you know how fast he can throw a brick, you can compute his Δv budget. This is why the equation is a *prohibition* rather than a *design*: it doesn't describe the machines we happen to have built. It describes **every machine that could ever exist that works by throwing mass**, including all the ones nobody has invented yet.

Anything that isn't in this equation — better metallurgy, better software, better funding, a genius, a war, a century — **cannot help you.** The only two things that appear are $v_e$ and $m_0/m_f$. That's the whole board. Those are your only pieces.

Now to find out how much room that gives us. (Spoiler: less than you'd like. Considerably less.)

---

## Thrust, mass flow, and what real engines actually do

$T = \dot m_p v_e$ is beautiful and it is incomplete, and the incompleteness explains a number you've seen and probably not questioned.

### The pressure term

Our derivation assumed the exhaust leaves and that's the end of it. But a real nozzle is a *hole*, and the gas coming out of it has a pressure, $p_e$, and the atmosphere outside is pushing back with a pressure, $p_a$, and those don't have to be equal.

Doing the control-volume analysis properly (the fluid mechanics comes in the next chapter, the thermochemical ceiling; take the result on credit for now):

$$\boxed{\;T = \dot m_p v_e + (p_e - p_a)A_e\;}$$

where $A_e$ is the nozzle exit area. The second term is a **pressure thrust**: if the exhaust exits at higher pressure than the ambient air, that pressure difference, acting over the exit area, pushes the rocket forward.

Bundle it all into an **effective exhaust velocity**:

$$c = v_e + \frac{(p_e - p_a)A_e}{\dot m_p} \quad\Longrightarrow\quad T = \dot m_p\, c$$

And now the number you've seen and not questioned:

**In a vacuum, $p_a = 0$, so the pressure term is as large as it can possibly be. At sea level, $p_a = 101{,}325$ Pa, and it eats into your thrust.**

That is why **every engine in this course has two numbers**:

| Engine | $I_{sp}$ sea level | $I_{sp}$ vacuum | Gain |
|---|---|---|---|
| F-1 (Saturn V S-IC) | 263 s | 304 s | **+16%** |
| Merlin 1D | 282 s | 311 s | +10% |
| RS-25 (Shuttle/SLS) | 366 s | 452 s | **+23%** |
| RD-180 (Atlas V) | 311 s | 338 s | +9% |
| Raptor 2 | 327 s | 353 s | +8% |
| Merlin 1D **Vacuum** | *(would be much worse)* | 348 s | — |
| RL10 (Centaur) | *(never fired at SL)* | 465 s | — |

Look at the RS-25. **The same engine, unchanged, produces 23% more specific impulse in vacuum than at sea level.** It is not a different engine. Nobody adjusted anything. The atmosphere simply stopped standing in the way.

And now you understand a piece of hardware you've seen a thousand times without knowing why. **The Merlin Vacuum's nozzle is enormous** — comically, almost embarrassingly large, a great flaring bell that looks like a design-school affectation. It isn't. A bigger nozzle expands the exhaust to lower pressure, extracting more velocity from it. On the ground, that nozzle would be a disaster — the flow would over-expand, separate from the walls, and tear itself apart in a phenomenon that has destroyed real engines. **In vacuum, there is no ambient pressure to over-expand against, so you make the bell as big as mass permits and take the free $I_{sp}$.**

The sea-level Merlin has a stubby little nozzle for exactly the opposite reason. **Same engine family. Different atmospheric pressure. Different bell. The atmosphere designed the hardware.**

The fluid mechanics comes in the next chapter (the thermochemical ceiling). For now, just note the shape of the result: **$v_e$ is not a property of the propellant. It is a property of the propellant *and the sky above it*.**

### The numbers, made physical

To make thrust real, invert the thrust equation for mass flow:

$$\dot m_p = \frac{T}{I_{sp}\,g_0}$$

**The F-1**, five of which powered the Saturn V's first stage. Sea-level thrust: **6.77 MN**. Sea-level $I_{sp}$: 263 s, so $c = 263 \times 9.80665 = 2{,}579$ m/s.

$$\dot m_p = \frac{6.77\times10^6}{2{,}579} = \mathbf{2{,}625\ kg/s}$$

**Per engine.** Two and a half tonnes of kerosene and liquid oxygen, every second, down one engine.

Five engines: **about 13,000 kg/s.**

Sanity check against the vehicle: the S-IC carried roughly 2,000 tonnes of propellant and burned for 168 seconds. $2{,}000{,}000/168 = 11{,}900$ kg/s. Same ballpark (the difference is throttling and the centre engine shutting down early). **The model works.**

**Thirteen tonnes per second.** To make that mean something: a large family car is about 1.5 tonnes. **The Saturn V's first stage consumed the mass of eight cars every second, for two and a half minutes.** It drained an Olympic swimming pool's worth of propellant in roughly ninety seconds.

Now the power. How fast was it dumping kinetic energy into the exhaust?

$$P = \tfrac12\dot m_p v_e^2 = \tfrac12 \times 13{,}000 \times (2{,}579)^2 = 4.3\times10^{10}\ \mathrm{W} = \mathbf{43\ GW}$$

**Forty-three gigawatts.** The Hoover Dam is about 2 GW. **The Saturn V's first stage was roughly twenty Hoover Dams, for a hundred and sixty-eight seconds**, produced by five machines you could park in a tennis court.

(Careful with this number — you'll see "60 GW" and "190 GW" quoted for the Saturn V, and they're not wrong, they're *different questions*: total chemical energy release rate, or peak propulsive power at max velocity, versus the exhaust kinetic power computed just above. **When someone quotes you a power figure for a rocket, ask which one.** This is a small instance of a large habit, and the habit is what matters.)

### The thing that should bother you

$T = \dot m_p c$.

**Thrust is bought with mass flow.** Not with energy. Not with cleverness. **With mass, per second, out the back.**

There is no way to make a lot of thrust without throwing a lot of mass, quickly. And you are carrying that mass. And you had to accelerate it to get it here.

Hold that thought for the compound-interest section below, where it comes back with interest — literally.

---

## Specific impulse: the unit that confuses everyone, and should

$$I_{sp} = \frac{c}{g_0}$$

Exhaust velocity divided by 9.80665 m/s². Units: metres per second, divided by metres per second squared, equals **seconds**.

Every physicist meeting this for the first time has the same reaction, and it is the correct reaction: **why on Earth would you do that?** You have a perfectly good velocity. It has units of velocity. It *is* a velocity. Why divide it by a gravitational acceleration that has nothing to do with anything, and produce a number in seconds, which is not a unit of anything the engine does?

Three answers. The first is embarrassing, the second is respectable, and the third is the one that makes it worth keeping.

### Answer 1: it's a units treaty, and it's embarrassing

In the 1940s and 50s, American engineers worked in pounds-force and pounds-mass; Europeans and Russians worked in newtons and kilograms. Define specific impulse as thrust divided by *mass* flow and you get:

- US: $\mathrm{lbf}/(\mathrm{lbm/s})$ → some number
- Metric: $\mathrm{N}/(\mathrm{kg/s})$ = m/s → a **different** number

Two communities, two numbers, one engine, endless confusion, and at least one very expensive misunderstanding per decade.

But define it as thrust divided by **weight** flow:

- US: $\mathrm{lbf}/(\mathrm{lbf/s}) = \mathrm{s}$
- Metric: $\mathrm{N}/(\mathrm{N/s}) = \mathrm{s}$

**Seconds. Both. The same number.** Because lbf and lbm are numerically equal at Earth's surface, the $g_0$ absorbs the entire unit system and vomits it out.

**Specific impulse is measured in seconds because two engineering cultures could not agree on a unit of mass and split the difference with a fudge factor.** That's it. That's the reason. The most important performance parameter in aerospace is carried in a unit that exists because of a diplomatic failure in about 1948.

### Answer 2: $g_0$ is a constant, not a gravity — and people get this wrong constantly

$g_0 = 9.80665\ \mathrm{m/s^2}$, **exactly, by definition**. It is not measured. It is not the local gravitational acceleration. It is not the gravity at your launch site (which is 9.78 at the equator and 9.83 at the poles, and neither is 9.80665). It is a **defined conversion constant**, fixed by international agreement, like the metre or the second.

Therefore, and this must be said very clearly because it comes up constantly:

> **An engine's specific impulse does not change when you take it to Mars.**

It does not change on the Moon. It does not change in deep space. **There is no gravity in the specific impulse.** The $g_0$ is a unit conversion and nothing else. An engine with $I_{sp} = 350$ s has $I_{sp} = 350$ s on Pluto.

(What *does* change off Earth is the ambient pressure, as shown above — so an engine's *vacuum* $I_{sp}$ applies on the Moon and its *sea-level* $I_{sp}$ applies nowhere but here. But that's the atmosphere, not the gravity.)

This error has appeared in published papers. It has appeared in a mission proposal. **Watch for it. It's a tell.** When someone says an engine gets better $I_{sp}$ on the Moon because gravity is lower, they have revealed that they do not know what the symbol means, and you may safely stop reading.

### Answer 3: the interpretation that makes it worth keeping

Here is the reading that redeems the whole ugly business:

> **$I_{sp}$ is how many seconds one kilogram of propellant can produce one kilogram-weight of thrust.**

An engine with $I_{sp} = 300$ s: give it one kilogram of propellant, and it will produce **9.8 newtons of thrust for 300 seconds** — and then the propellant is gone.

Or, most vividly: **$I_{sp}$ is how long the engine can hover on one unit of its own propellant.** An engine with $I_{sp} = 300$ s, hovering, holding up exactly its own propellant weight, runs out in five minutes.

That's a real, physical, intuitive thing. It's "how long does the tank last," which is the question anyone actually has. Suddenly the seconds mean something: they're **endurance**.

And now the trade in the table from the overview reads properly:

| Engine | $I_{sp}$ (vac) | $c$ (km/s) | Reading |
|---|---|---|---|
| Solid booster | 268 s | 2.63 | 4½ minutes of hover |
| F-1 (kerolox) | 304 s | 2.98 | 5 minutes |
| Merlin 1D Vac | 348 s | 3.41 | 5¾ minutes |
| Raptor Vac | ~380 s | ~3.7 | 6⅓ minutes |
| J-2 (hydrolox) | 421 s | 4.13 | 7 minutes |
| RS-25 (hydrolox) | 452 s | 4.43 | 7½ minutes |
| NSTAR ion | 3,100 s | 30.4 | **52 minutes** |
| NEXT ion | 4,190 s | 41.1 | **70 minutes** |

**Look at the gap.** Everything chemical is packed into 268–452 seconds — a factor of 1.7 across the entire history of combustion, every propellant ever tried, every engine ever built, seventy years of the best engineers in the world. And then the ion drive is at **4,190**, ten times better, and it is essentially a different universe.

That gap is the subject of the next chapter, the thermochemical ceiling (why chemistry is stuck), and of the chapter on escaping chemistry (what it costs to leave). For now, the only thing that matters is: **$c$ is between 2.6 and 4.5 km/s and it is not moving.** Whatever we do next, we do it with those numbers.

### Notation, so we don't fight about it later

This text uses $v_e$ and $c$ and $I_{sp} g_0$ more or less interchangeably, because everyone does and you need to be fluent in all three. Strictly:

- $v_e$ — the actual physical exhaust velocity
- $c$ — the *effective* exhaust velocity, including the pressure term ($T = \dot m c$)
- $I_{sp} g_0$ — the same as $c$, laundered through the units treaty

Physicists write $c$. Engineers write $I_{sp}$. **Read both, and when someone hands you an $I_{sp}$, always ask: sea level or vacuum?** Both numbers are true. Only one is relevant, and it depends where you are, and someone quoting the flattering one at you is not necessarily lying but is definitely selling.

---

## The inversion: meet the exponential

Recall the result:

$$\Delta v = v_e\ln\!\left(\frac{m_0}{m_f}\right)$$

Nobody uses it in that form. **Nobody.** Because that form answers a question no one has.

The question you actually have is: *you need to go somewhere — how much rocket does that take?* So you invert it:

$$\boxed{\;R \equiv \frac{m_0}{m_f} = e^{\Delta v/v_e}\;}$$

And there it is. **The logarithm was never the villain. The logarithm was the disguise.** Turn the equation around to face the direction you're actually walking and the exponential is standing there waiting for you.

### The only number that matters

Look at the exponent: $\Delta v/v_e$. It is **dimensionless**. Velocity over velocity.

**The entire field of astronautics is a function of one dimensionless number.** Not the mission distance. Not the payload mass. Not the year, the budget, the nation, or the technology. One ratio: *how much velocity change do you need, measured in units of how fast your engine throws things.*

Call it $x$. Everything follows from $x$.

$$R = e^x, \qquad x = \frac{\Delta v}{v_e}$$

And the **propellant mass fraction** — the fraction of your liftoff mass that is nothing but propellant:

$$\zeta = \frac{m_p}{m_0} = 1 - \frac{1}{R} = 1 - e^{-x}$$

Tabulate it. Learn this table. Actually learn it.

| $x = \Delta v/v_e$ | $R = m_0/m_f$ | Propellant fraction $\zeta$ | What survives |
|---|---|---|---|
| 0.5 | 1.65 | 39% | 61% |
| 1.0 | **2.72** | **63%** | 37% |
| 1.5 | 4.48 | 78% | 22% |
| 2.0 | **7.39** | **86.5%** | 13.5% |
| 2.5 | 12.2 | 91.8% | 8.2% |
| 3.0 | **20.1** | **95%** | 5% |
| 4.0 | 54.6 | 98.2% | 1.8% |
| 5.0 | 148 | 99.3% | 0.7% |
| 6.0 | 403 | 99.75% | 0.25% |
| 10.0 | 22,026 | 99.995% | 0.005% |

Now the sentence to carry out of this room:

> **Every $v_e$ worth of Δv costs you a factor of $e$.**

One exhaust velocity of mission: you're 63% propellant. Two: 86.5%. Three: 95%. Four: 98.2%. **Each additional $v_e$ multiplies your mass ratio by 2.718, forever, with no negotiation and no exceptions.**

And now put in the number that ruins your life. Getting to low Earth orbit costs $\Delta v = 9.4$ km/s. A good methane engine has $v_e = 3.43$ km/s.

$$x = \frac{9.4}{3.43} = \mathbf{2.74}$$

**Reaching orbit is a 2.74-exhaust-velocity mission.** $R = 15.5$. You may weigh **6.45%** of your liftoff mass when you get there — and that 6.45% has to include your tanks, your engines, your pumps, your avionics, your structure, **and, at some point, the thing you actually wanted to send.**

That's the whole problem. That's this entire course. **Two point seven four.**

If $x$ were 1, spaceflight would be an industry like trucking. If $x$ were 0.5 we'd have flying cars and this would be a different subject. **$x$ is 2.74, and there is nothing anybody can do about the numerator (it's Newton's) and nothing anybody has managed to do about the denominator in seventy years (it's the periodic table's).**

### The other direction, which is worse

Notice the table is *not symmetric in usefulness*. Read it backwards.

If you're at $x = 1$ and you want to improve your payload, gaining a bit of $v_e$ helps you nicely. If you're at $x = 4$, you are living at the bottom of a cliff: you're 98.2% propellant, and the 1.8% that isn't propellant has to be *everything else*, and small changes in $x$ produce violent changes in what's left.

**The exponential doesn't just make hard missions hard. It makes hard missions *fragile*.** At $x = 4$, a 5% shortfall in $I_{sp}$ — three or four seconds, the sort of thing you discover in acceptance testing — doesn't cost you 5% of your payload. It can cost you **all of it**, because your payload was living in the 1.8% and the 1.8% just moved.

This gets quantified in the impossibility-theorem section, and it will be one of the more upsetting things in Unit I.

---

```example
rocket-mass-ratio
```

## Why a logarithm? Because it's compound interest, running backwards

Students accept the derivation and still don't *feel* it. Fair. Here's the intuition, and once you have it you will never lose it.

### The real reason

Go back to the differential form:

$$\frac{dv}{v_e} = -\frac{dm}{m}$$

Read that as English. **The *fractional* change in mass is proportional to the velocity change.**

Not the absolute change. The **fractional** change. To gain another 3.43 km/s, you don't need another fixed number of tonnes. You need to **shrink by the same fraction again** — 63% of whatever you currently are.

Where else does the fractional rate of change of a quantity depend on the quantity itself? **Compound interest.** Radioactive decay. Population growth. Every process where the thing grows or shrinks in proportion to how much of it there already is.

$$\frac{dM}{M} = r\,dt \quad\Longrightarrow\quad M = M_0 e^{rt}$$

$$\frac{dm}{m} = -\frac{dv}{v_e} \quad\Longrightarrow\quad m = m_0 e^{-\Delta v/v_e}$$

**Identical.** $e$ is in the rocket equation for exactly the same reason it is in your mortgage.

### The physical reason underneath the mathematical one

But *why* is the change fractional? Here is the physical statement, and it's the sentence to leave with:

> **Every kilogram of propellant you add must itself be accelerated by all the propellant beneath it.**

The last gram of propellant in the tank is easy. It has almost nothing left to push — just the empty structure and the payload. It's nearly free.

The **first** gram is a catastrophe. It has to accelerate *itself, and all the propellant above it, and the tanks that hold them, and the payload.* It costs enormously.

So when you add propellant to go further, **the propellant you added has to be carried and accelerated by propellant you must now also add**, which must be carried and accelerated by propellant you must *also* add...

**It's a mortgage on a mortgage on a mortgage.** You aren't buying velocity with propellant. You are buying velocity with propellant **that you must first buy with propellant**.

That's the logarithm. That's the whole thing. **The rocket equation is compound interest and the rocket is the borrower and physics does not restructure debt.**

### The intuition pump that finally does it

Every year someone asks: "but couldn't you just add a bigger tank?"

Yes. So try it.

You have a rocket. It does 3.43 km/s ($x=1$, 63% propellant). You want double: 6.86 km/s.

**Naive answer:** double the propellant. $x = 1$ needed 63%; surely $x=2$ needs 126%... and there's your first clue that something is wrong, because 126% is not a fraction of anything.

**Real answer:** $x = 2 \Rightarrow \zeta = 86.5\%$. So to *double* your Δv, you go from 63% propellant to 86.5% propellant.

That sounds *easier*, not harder! 63 to 86.5 is only 23 points!

**No.** Look at what happened to what's left. **37% → 13.5%.** Your entire non-propellant budget — everything that isn't fuel, including the whole point of the exercise — **shrank by a factor of 2.7.** Your rocket didn't get 23% harder. **Everything that matters got 2.7 times smaller.**

Double it again, to 13.7 km/s. $x = 4$, $\zeta = 98.2\%$, non-propellant = **1.8%**. Another factor of 7.4.

**Triple the mission, and everything that isn't fuel has shrunk twentyfold.**

*That's* what the exponential does. It doesn't attack your propellant budget — propellant fraction crawls politely toward 100% and never alarms anyone. **It attacks the complement.** It eats the small number, the leftover, the sliver, the *whole reason you built the thing* — and the small number is where you live.

**Never look at propellant fraction. Look at what's left.** Propellant fraction is the number that makes hard missions look fine. It is the number people put in slide decks.

---

## Where the payload actually lives: the formula behind the arithmetic

The overview did this with arithmetic. Here it is done with algebra, and the algebra gives something the arithmetic couldn't: **a theorem**.

### Set up the bookkeeping properly

A single stage consists of three things:

$$m_0 = \underbrace{m_s}_{\text{structure}} + \underbrace{m_p}_{\text{propellant}} + \underbrace{m_{pl}}_{\text{payload}}$$

**Structure** is everything that isn't propellant and isn't payload: tanks, engines, turbopumps, plumbing, avionics, wiring, the airframe, the paint. It burns nothing and does nothing except exist and be heavy.

Define two dimensionless ratios:

$$\boxed{\;\lambda = \frac{m_{pl}}{m_0}\;}\quad\text{the \textbf{payload fraction} — the answer}$$

$$\boxed{\;\varepsilon = \frac{m_s}{m_s + m_p}\;}\quad\text{the \textbf{structural coefficient} — the villain}$$

$\varepsilon$ is the fraction of the *stage itself* (structure plus propellant, ignoring payload) that is dead weight. **Physically: how much tankage and machinery do you need per unit of propellant?**

Real values, and they are hard-won:

| Stage | $\varepsilon$ | Why |
|---|---|---|
| Excellent kerolox stage | 0.05 – 0.07 | Dense propellant, small tanks |
| Typical stage | 0.08 – 0.10 | |
| Hydrolox stage | 0.09 – 0.13 | **Hydrogen is 71 kg/m³.** Enormous tanks, heavy insulation |
| Solid motor | 0.08 – 0.12 | The casing must contain 60 bar |
| Pressure-fed stage | 0.12 – 0.20 | The *tanks* are the combustion chamber's pressure vessel |

**Why 5–10% is the floor**, physically: the tank must contain the propellant against internal pressure and inertial loads; the engine must contain 100–300 bar of combustion; the structure must not buckle under 4 g of thrust while being 70 metres long and as thin as we dare.

How thin do we dare? **The Atlas rocket's tanks were 0.5 mm stainless steel.** Thinner than a coin. They had no internal structure at all — they were **pressure-stabilized**, held rigid entirely by the gas inside, like a balloon or a fizzy drink can. An Atlas that was not pressurized **would collapse under its own weight.** They had to be kept inflated at all times, from manufacture to launch, including during transport, or they would crumple into foil. There were dedicated pressurization carts whose entire job was making sure the rocket didn't fall over and die in the warehouse.

**That is how aggressively this field shaves structure.** We build rockets out of balloons because $\varepsilon$ is worth more than dignity.

### Derive the payload fraction

Now, four lines. Watch.

Everything that isn't payload is stage:

$$m_s + m_p = m_0 - m_{pl} = m_0(1 - \lambda)$$

So the structure is:

$$m_s = \varepsilon(m_s + m_p) = \varepsilon\, m_0 (1-\lambda)$$

The **final** (burnout) mass is structure plus payload — the propellant is gone:

$$m_f = m_s + m_{pl} = \varepsilon m_0(1-\lambda) + \lambda m_0 = m_0\big[\varepsilon(1-\lambda) + \lambda\big]$$

But by definition $m_f = m_0/R$. Divide through by $m_0$:

$$\frac{1}{R} = \varepsilon(1-\lambda) + \lambda = \varepsilon + \lambda(1 - \varepsilon)$$

Solve for $\lambda$:

$$\boxed{\;\lambda = \frac{\dfrac{1}{R} - \varepsilon}{1 - \varepsilon}\;,\qquad R = e^{\Delta v/v_e}\;}$$

**There it is.** Two lines of input — your engine and your engineering — and out comes the answer to the only question that matters: *what fraction of what you put on the pad arrives?*

### Check it against the overview

The overview computed, by arithmetic, that an SSTO with $I_{sp} = 350$ s, $\varepsilon = 0.08$, and $\Delta v = 9.4$ km/s has a payload of **−1.68%**.

Formula: $R = 15.47$, so $1/R = 0.06464$.

$$\lambda = \frac{0.06464 - 0.08}{0.92} = \frac{-0.01536}{0.92} = -0.0167 = \mathbf{-1.67\%}$$

✓ (The 0.01% is rounding.) **Good.** The algebra reproduces the arithmetic, which is what algebra is for. But now watch what the algebra can do that the arithmetic could not.

---

```example
rocket-payload-fraction
```

## The impossibility theorem

Stare at the formula:

$$\lambda = \frac{1/R - \varepsilon}{1-\varepsilon}$$

The denominator is positive (unless your rocket is more than 100% structure, in which case you have a sculpture). So the **sign of the payload is the sign of the numerator.**

$$\lambda > 0 \iff \frac{1}{R} > \varepsilon \iff \boxed{\;R < \frac{1}{\varepsilon}\;}$$

**A single stage cannot achieve a mass ratio greater than $1/\varepsilon$. Ever. Not with more money, not with a better team, not next century.**

There is your ceiling. Take logs:

$$\boxed{\;\Delta v_{\max} = v_e \ln\!\left(\frac{1}{\varepsilon}\right)\;}$$

**This is the impossibility theorem of single-stage rocketry**, and its status is worth being precise about: it is not an engineering estimate, or a rule of thumb, or a conservative bound. Given $v_e$ and $\varepsilon$, it is **the maximum Δv a single stage can produce while carrying a payload of exactly zero.** Any actual payload — a gram — requires strictly less.

Note the structure of it. **Your engine sets the scale ($v_e$). Your engineering sets the exponent ($1/\varepsilon$). And you get a logarithm, which means engineering enters *logarithmically*** — halving your structural coefficient, an achievement of decades, buys you only $v_e \ln 2 = 0.69 v_e$ of extra Δv. About 2.4 km/s. That's it. That's what halving the dead weight of the entire rocket gets you.

**The equation is generous to your engine and stingy with your engineering.** It always has been.

### The table that killed a thousand dreams

$\Delta v_{\max} = v_e\ln(1/\varepsilon)$, in km/s. **The target is 9.4.**

| | $\varepsilon = 0.12$ | $\varepsilon=0.10$ | $\varepsilon = 0.08$ | $\varepsilon = 0.05$ | $\varepsilon = 0.03$ |
|---|---|---|---|---|---|
| **$I_{sp}=300$ (kerolox, SL-ish)** | 6.24 | 6.77 | 7.43 | 8.81 | 10.3 |
| **$I_{sp}=350$ (methalox avg)** | 7.28 | 7.90 | 8.67 | 10.3 | 12.0 |
| **$I_{sp}=400$ (hydrolox avg)** | 8.32 | 9.03 | 9.91 | 11.8 | 13.7 |
| **$I_{sp}=450$ (hydrolox vac)** | 9.36 | 10.2 | 11.1 | 13.2 | 15.4 |

Everything left of and above the 9.4 line **does not exist**. Not "is uneconomic." **Does not exist**, in the way that a triangle with four sides does not exist.

And look where 9.4 falls. It runs right through the middle of the table, through the *plausible* region, at an angle, taunting.

- **Methalox at $\varepsilon = 0.08$:** ceiling 8.67. **Impossible.**
- **Methalox at $\varepsilon = 0.05$:** ceiling 10.3. Possible! Payload: $R = e^{9400/3432} = 15.47$, $\lambda = (0.0646 - 0.05)/0.95 = \mathbf{1.5\%}$. It exists. It is also nearly pointless — 1.5% payload, and you've thrown away the entire vehicle.
- **Hydrolox at vacuum $I_{sp}$, $\varepsilon = 0.10$:** ceiling 10.2. **Possible!** $\lambda = 2.1\%$.

**And that last line is the one that fooled everybody, for thirty years, and it's a lie.** Now to kill it.

### The death of the X-33, in three numbers

In 1996 NASA and Lockheed Martin began the **X-33**, a technology demonstrator for **VentureStar** — a fully reusable single-stage-to-orbit vehicle. Not a paper study. A real programme, real money, real hardware. VentureStar was to be hydrolox, with a linear aerospike engine, and to carry about **20 tonnes to LEO on a 1,000-tonne vehicle**.

$$\lambda_{\text{target}} = \frac{20}{1000} = \mathbf{2\%}$$

Right in the plausible corner of the table. **So what did it require?** Run the formula backwards and find out — this is the calculation that decided the programme, and it is worth watching land.

Hydrolox, but be honest: **$I_{sp} = 450$ s is the *vacuum* number.** The vehicle starts at sea level, where the RS-25 gets 366 s. Averaged over an ascent that spends its first minutes in thick air, the *effective* $I_{sp}$ is around **400 s**. So $v_e = 400 \times 9.80665 = 3{,}923$ m/s.

$$R = e^{9400/3923} = e^{2.396} = 10.98 \quad\Rightarrow\quad \frac{1}{R} = 0.0911$$

Now solve $\lambda = (1/R - \varepsilon)/(1-\varepsilon)$ for $\varepsilon$, with $\lambda = 0.02$:

$$0.02(1 - \varepsilon) = 0.0911 - \varepsilon \;\Rightarrow\; 0.02 - 0.02\varepsilon = 0.0911 - \varepsilon \;\Rightarrow\; 0.98\varepsilon = 0.0711$$

$$\boxed{\;\varepsilon = 0.0726\;}$$

**VentureStar required a hydrogen stage with a structural coefficient of 7.3%.**

Now go back and look at the table of real $\varepsilon$ values. **Hydrolox stages run 0.09 to 0.13**, because liquid hydrogen has a density of 71 kg/m³ — **one fourteenth that of water** — so the tanks are gigantic, and gigantic tanks are heavy, and they need heavy insulation, and hydrogen leaks through solid metal and embrittles it on the way past.

And this vehicle wasn't a stage. **It had to be a stage *and* an aeroplane *and* a reentry vehicle**: wings, landing gear, thermal protection, all of it dead weight, all of it counted in $\varepsilon$, none of it optional.

**It needed 0.073. Aluminium-lithium gives you about 0.10 in that configuration.** So the entire programme — a billion dollars, five years, Lockheed's Skunk Works — rested on **one** technology to close that gap:

> **A composite liquid-hydrogen tank.**

That was it. That was the bet. There was no plan B, because there was no plan B available: the number 0.073 had to come from somewhere, and composites were the only somewhere.

**On 3 November 1999**, the composite LH₂ tank was cryogenically tested and it failed. The mechanism is worth knowing because it's beautiful and horrible: hydrogen — the smallest molecule there is — **permeated through the inner facesheet** into the honeycomb core. When the tank was warmed and depressurized, the trapped hydrogen expanded, and **the facesheet delaminated from the inside out.** The tank was destroyed by the propellant getting *into the walls*.

The programme's response was to consider an **aluminium** tank instead. It would have worked. It would have been heavier.

**And now do the arithmetic that killed it.** Aluminium pushes $\varepsilon$ from 0.073 to about 0.10:

$$\lambda = \frac{0.0911 - 0.10}{0.90} = \frac{-0.0089}{0.90} = \mathbf{-0.99\%}$$

**Negative.**

Not "reduced payload." Not "less competitive." **The vehicle can no longer lift itself.** The payload bay is not smaller; **the payload bay is a fiction.** The mission does not exist. There is nothing to descope, nothing to trade, nothing to value-engineer. The number went below zero and took the entire programme with it.

X-33 was cancelled in **March 2001**. NASA had spent **\$912 million**; Lockheed Martin about **\$357 million**. Roughly **\$1.3 billion**, for a vehicle that never flew, that was never going to fly, and that a hundred and fifty years of mathematics said could not fly, **and the mathematics fits on the back of an envelope.**

### What to take from this

**Not** "SSTO is stupid." It isn't stupid. Look at the table again — hydrolox at $\varepsilon = 0.05$ gives you $\lambda = 4.3\%$, which is *better than the two-stage vehicle built in the overview*. **If you could build a hydrogen stage at 5% structure, single-stage-to-orbit would be the obviously correct answer and this course would be shorter.**

The lesson is finer, and it is this:

> **SSTO does not fail because it is a bad idea. It fails because it has no margin.**

Look at the sensitivity. $\lambda$ went from $+2\%$ to $-1\%$ — from a viable national programme to a physical impossibility — on a change in $\varepsilon$ of **0.027**. Two point seven percent of the dry mass. **A few tonnes on a thousand-tonne vehicle.**

That is roughly the mass of the paint.

**A two-stage rocket that comes in 3% heavy loses a bit of payload and flies anyway.** Ariane, Falcon, Soyuz, Atlas — all of them have absorbed mass growth over their lives and shrugged. **An SSTO that comes in 3% heavy does not exist.**

And every vehicle ever built has come in heavy. Every single one. Mass growth during development is not a risk; **it is a law of nature**, roughly 20% from first design to first flight, and everyone in this field knows it, and the X-33's business case required it not to happen.

**SSTO isn't a design. It's a bet that engineering will behave, made against a hundred years of evidence that it won't.**

That is what the impossibility theorem actually says. Not *no*. **Not with that little room to be wrong in.**

---

## Why engine teams fight two-year wars over three seconds

Here is a thing that mystifies outsiders. An engine team will spend **two years and forty million dollars** to gain **three seconds** of specific impulse. Three seconds out of three hundred and fifty. **Less than one percent.** People are promoted and fired over it. Careers are made on two seconds.

From outside it looks like a monomania. It isn't. It's arithmetic, and the tools to do it are now in hand.

### The elasticity

What's wanted is the **sensitivity of payload to exhaust velocity**. Not the derivative — the *elasticity*: if $v_e$ goes up 1%, what happens to $\lambda$, in percent?

$$\lambda = \frac{e^{-x} - \varepsilon}{1-\varepsilon}, \qquad x = \frac{\Delta v}{v_e}$$

Differentiate with respect to $v_e$. Note $\dfrac{dx}{dv_e} = -\dfrac{\Delta v}{v_e^2} = -\dfrac{x}{v_e}$:

$$\frac{d\lambda}{dv_e} = \frac{1}{1-\varepsilon}\cdot\left(-e^{-x}\right)\cdot\frac{dx}{dv_e} = \frac{1}{1-\varepsilon}\cdot e^{-x}\cdot\frac{x}{v_e}$$

Now form the elasticity $E = \dfrac{d\lambda/\lambda}{dv_e/v_e} = \dfrac{d\lambda}{dv_e}\cdot\dfrac{v_e}{\lambda}$:

$$E = \frac{e^{-x}\,x}{v_e(1-\varepsilon)}\cdot v_e \cdot \frac{1-\varepsilon}{e^{-x}-\varepsilon} = \frac{x\,e^{-x}}{e^{-x}-\varepsilon}$$

Multiply top and bottom by $e^{x}$:

$$\boxed{\;E = \frac{x}{1 - \varepsilon e^{x}}\;}$$

**One line. Two symbols. It tells you the entire culture of propulsion engineering.**

### Read it

Look at the denominator: $1 - \varepsilon e^x$. Recall the impossibility theorem said $\lambda > 0 \iff R < 1/\varepsilon \iff \varepsilon e^x < 1$.

**So the denominator is exactly the margin.** As your design approaches the impossibility boundary, $\varepsilon e^x \to 1$, the denominator $\to 0$, and **$E \to \infty$**.

> **The closer you are to impossible, the more infinitely valuable one second of $I_{sp}$ becomes.**

That's the whole psychology of the field in one sentence, and it is not a metaphor — it is a pole in a rational function.

### Do it for a real vehicle

Take the two-stage vehicle from the overview: $\varepsilon = 0.08$, $I_{sp} = 350$ s ($v_e = 3{,}432$), Δv split evenly, 4.7 km/s per stage.

Per stage: $x = 4700/3432 = 1.3695$, $e^x = 3.933$, $\varepsilon e^x = 0.3147$.

$$E_{\text{stage}} = \frac{1.3695}{1 - 0.3147} = \frac{1.3695}{0.6853} = \mathbf{2.0}$$

**A 1% gain in $I_{sp}$ buys a 2% gain in that stage's payload fraction.** Already a 2× lever.

But the vehicle has **two** stages, and both improve, and the payload fractions **multiply** (stage 1's payload *is* stage 2's stack). So the effects compound:

$$E_{\text{vehicle}} \approx 2 \times 2.0 = \mathbf{4.0}$$

No need to take that on faith. **Numbers.**

**Baseline, $I_{sp} = 350$:** $x = 1.36945$, $e^{-x} = 0.25424$.
$$\lambda_{\text{stage}} = \frac{0.25424 - 0.08}{0.92} = 0.18939$$
$$\lambda_{\text{vehicle}} = (0.18939)^2 = 0.035869 = \mathbf{3.587\%}$$

✓ (The overview got 3.59% by longhand. Good.)

**Now $I_{sp} = 353.5$ — a gain of exactly 1%, i.e. three and a half seconds:** $v_e = 3466.7$, $x = 1.35558$, $e^{-x} = 0.25777$.
$$\lambda_{\text{stage}} = \frac{0.25777 - 0.08}{0.92} = 0.19323$$
$$\lambda_{\text{vehicle}} = (0.19323)^2 = 0.037338 = \mathbf{3.734\%}$$

**Ratio: $3.734/3.587 = 1.041$.**

> ### **One percent more $I_{sp}$ → four percent more payload.**

**Three and a half seconds of specific impulse — a rounding error, a number you'd have to look twice to notice on a datasheet — is worth 4% of everything the rocket can carry, on every flight, forever.**

For a Falcon 9 at 22.8 t to LEO, that's **900 kg.** For free. On every launch for twenty years. That is worth two years and forty million dollars, and it is worth firing someone over, and now you know why they're like that.

Push it further. **$I_{sp}: 350 \to 380$** (a methalox upgrade, +8.6%): $v_e = 3726.5$, $x = 1.26122$, $e^{-x} = 0.28329$.
$$\lambda_{\text{stage}} = \frac{0.28329-0.08}{0.92} = 0.22097, \qquad \lambda_{\text{vehicle}} = 0.04883 = \mathbf{4.88\%}$$

**+36% payload for +8.6% $I_{sp}$.** Elasticity 4.2, holding steady.

**This is why hydrogen refuses to die** despite being a nightmare to store, insulate, pump, and contain. Its $I_{sp}$ advantage is ~25% over kerosene, which is worth **~100% more payload** — and that is a big enough prize that engineers have spent seventy years wrestling a substance that boils at 20 K, leaks through metal, embrittles what it touches, and has the density of a rumour.

---

### A correction to the overview

A correction is owed here.

The overview's problem comparing $I_{sp} = 350$ and $I_{sp} = 380$ s for a 9.4 km/s mission gave an answer stating that burnout mass rises from 6.45% to 8.0%, that "since structure is roughly fixed, nearly all of that 1.55 percentage points is pure payload," and that therefore **payload roughly doubled.**

**That answer is wrong.**

**Two errors.**

**First: structure is not "roughly fixed."** $m_s = \varepsilon(m_s + m_p)$ — it's a *fraction of the stage*, and when you improve $I_{sp}$ you burn less propellant, so the stage shrinks, so the structure shrinks too. The original answer treated a dependent variable as a constant. That's not a slip of arithmetic; it's a modelling error, and it's the more embarrassing of the two because it's exactly the error warned about in the section on the wrong derivation — **something was quietly held fixed that wasn't.**

**Second, and worse: for that specific case, the payload didn't double, because there wasn't one.** Run the correct formula:

- $I_{sp}=350$: $\lambda = (0.06464 - 0.08)/0.92 = \mathbf{-1.67\%}$
- $I_{sp}=380$: $x = 9400/3726.5 = 2.5225$, $e^{-x} = 0.08026$, $\lambda = (0.08026-0.08)/0.92 = \mathbf{+0.028\%}$

**It went from negative to very slightly positive.** From "this vehicle cannot exist" to "this vehicle can exist and carry approximately a sandwich." **"Roughly doubled" is not merely imprecise — it is meaningless, because you cannot double a negative payload into a positive one.** The original reasoning multiplied a quantity that didn't exist.

**What survives:** the qualitative claim — that payload is a violently amplified lever on $I_{sp}$ — is not just right, it's *understated*. The proper treatment gives elasticity ≈ 4 for a real two-stage vehicle, which is a bigger and more interesting effect than the hand-wave originally offered. **The conclusion was right for the wrong reason, which is the most dangerous way to be right**, because it feels like understanding and isn't.

**Three things worth taking from this, and they're worth more than the correction:**

1. **The overview is a survey, and surveys cheat.** They compress, they hand-wave, they use "roughly" to paper over places where the model doesn't hold. That's a legitimate genre, and it is worth writing the same way again. **But a survey is a promise that the details will hold up, and you should collect on that promise.** Here the details were collected on, and one line didn't pay.
2. **The error was invisible until the algebra was in hand.** With arithmetic alone, "6.45% → 8.0%, most of that is payload" *sounds* fine. It took $\lambda = (1/R - \varepsilon)/(1-\varepsilon)$ to see that the claim was incoherent. **Closed forms are not decoration. They are error-detectors.** This is why one derives instead of computes.
3. **Errors like this will recur.** The single most valuable thing anyone can do with a derivation is the thing that caught this one: check it.

The number stays wrong until it's fixed *properly*. It's fixed now. Moving on.

---

## The thing that confuses everyone: propulsive efficiency

This section is optional in the sense that you can skip it and still do the arithmetic, and essential in the sense that if you don't understand it, the chapter on interplanetary trajectories will feel like a magic trick and you will not trust it.

### The paradox

An engine burns propellant and dumps kinetic energy into the exhaust at a rate:

$$P_{\text{jet}} = \tfrac12 \dot m v_e^2$$

Meanwhile the useful power delivered to the rocket is force times velocity:

$$P_{\text{rocket}} = T v = \dot m\, v_e\, v$$

Now set $v = 2v_e$. The rocket is going twice its own exhaust velocity — perfectly normal; every orbital launch does this.

$$P_{\text{rocket}} = \dot m v_e (2 v_e) = 2\dot m v_e^2 = \mathbf{4}\times P_{\text{jet}}$$

**The rocket is receiving four times as much power as the engine is producing.**

Every year, someone's hand goes up. And they should. **That looks like a perpetual motion machine.** If you can extract more power than you put in, wire it to a generator and let's all retire.

### The resolution

The engine is not the only thing supplying energy. **The propellant brought its own.**

Before it was ejected, that kilogram of propellant was **riding along inside the rocket at velocity $v$**, and therefore carrying kinetic energy $\tfrac12 v^2$ per kilogram — energy that *you* paid for, earlier, when you accelerated it. You've been hauling it around. It's been on the books the whole time.

When the engine throws it backwards, the propellant **surrenders that kinetic energy to the vehicle** on the way out.

Let's audit it. Per kilogram of propellant, in the ground frame:

- **Before ejection:** propellant KE $= \tfrac12 v^2$
- **After ejection:** propellant moves at $v - v_e$, so KE $= \tfrac12 (v-v_e)^2$
- **Change in propellant's KE:** $\tfrac12\left[(v-v_e)^2 - v^2\right] = \tfrac12\left[v_e^2 - 2vv_e\right]$
- **Energy delivered to the rocket:** $v_e v$ (from $P_{\text{rocket}}/\dot m$)

**Total energy the engine had to supply:**

$$\underbrace{\tfrac12 v_e^2 - v v_e}_{\text{propellant's change}} + \underbrace{v v_e}_{\text{rocket's gain}} = \tfrac12 v_e^2 \qquad ✓$$

**Exactly the chemical energy released, and not a joule more.** Books balance. No perpetual motion. The "extra" power delivered to the rocket at high $v$ is the propellant **giving back kinetic energy it was already carrying** — energy you paid for, at some point, at full price.

**Nothing is free. But the *timing* of when you cash it in is yours to choose, and that choice is worth a fortune.**

**That is the Oberth effect.** You will meet it formally in the chapter on interplanetary trajectories and it will look like sorcery — *burn deep in a gravity well and get seven times the energy for the same propellant* — and when it does, come back to this paragraph. **It's not sorcery. It's a redemption schedule.**

### The efficiency, properly

Define **propulsive efficiency** as useful power over (useful + wasted), where "wasted" is the kinetic energy the exhaust still has in the ground frame after the rocket is done with it:

$$\eta_p = \frac{\dot m v_e v}{\dot m v_e v + \tfrac12\dot m (v - v_e)^2}$$

Let $u = v/v_e$. Divide through by $\dot m v_e^2$:

$$\eta_p = \frac{u}{u + \tfrac12(u-1)^2} = \frac{u}{\tfrac12 u^2 + \tfrac12} = \boxed{\;\frac{2u}{1+u^2}\;}$$

Tabulate:

| $u = v/v_e$ | $\eta_p$ | |
|---|---|---|
| 0 | **0%** | on the pad |
| 0.5 | 80% | |
| **1.0** | **100%** | ← perfect |
| 2.0 | 80% | |
| 3.0 | 60% | |
| 5.0 | 38% | |
| 10 | 20% | |

**It peaks at exactly $u = 1$, and the peak is exactly 100%**, and the reason is delicious: when the rocket is flying at precisely its own exhaust velocity, the exhaust leaves the nozzle backwards at $v_e$ while the rocket moves forward at $v_e$, so **the exhaust is left sitting perfectly at rest in the ground frame.** It has zero kinetic energy. It kept nothing. **Every joule went into the vehicle.**

That is a genuinely lovely fact about the universe and it is worth ten seconds of appreciation.

### What it explains

**Why launch is horribly wasteful.** At liftoff $u = 0$ and $\eta_p = 0$. **Every joule goes into the exhaust and none into the rocket.** For the first several seconds you are running a 43-gigawatt engine and heating New Mexico with all of it. This is a second, independent reason (alongside gravity losses, the chapter on ascent) that the first thirty seconds of a launch are so brutally expensive.

**Why chemical rockets are, by pure luck, well matched to launch.** Falcon 9's first stage: $v_e \approx 2.8$ km/s, burnout at ~2.3 km/s. So $u \approx 0.82$ at cutoff, $\eta_p = 1.64/1.67 = \mathbf{98\%}$. **Nearly perfect.** The exhaust velocity of burning kerosene happens to sit near the speed a first stage travels. Nobody arranged this. **Chemistry and orbital mechanics are unrelated, and they happen to match to within 20%.** That is an outrageous coincidence and we live inside it.

**Why ion drives are propulsively terrible.** $v_e = 30$ km/s, probe doing 3 km/s. $u = 0.1$, $\eta_p = 0.2/1.01 = \mathbf{20\%}$. **Eighty percent of the electrical power you generated, at enormous cost in solar panel mass, is thrown away as fast xenon.**

And note the trap this sets — the trap that catches people who half-remember this section: **it doesn't matter.** Ion drives don't care about propulsive efficiency, because **electricity is nearly free and propellant is not.** They're optimizing a completely different quantity. The efficiency that matters for Dawn is *propellant* efficiency, and there it wins by a factor of ten.

> **"Efficiency" is not a quantity. It is a question about what is scarce.**

For a launch vehicle, energy is cheap (chemistry provides) and mass is precious, so you optimize thrust and accept 43 GW of waste heat. For an ion probe, mass is precious *and* power is precious, and you trade thrust away to buy $v_e$. **Same physics. Opposite designs. Because the scarcity changed.**

Anyone who tells you one propulsion system is "more efficient" than another without telling you **what's scarce** is not doing engineering. **They're doing advertising.**

---

```example
rocket-propulsive-efficiency
```

## A note on relativity: it only gets worse

You might hope that at extreme speeds something merciful happens. It does not. Relativity arrives, examines the situation, and **charges you extra.**

The Newtonian derivation added velocities: exhaust at $v - v_e$. Relativity doesn't add velocities; it adds **rapidities**, $\phi = \operatorname{artanh}(\beta)$ where $\beta = v/c$. Rapidity is the quantity that adds linearly under boosts — it's the "real" velocity, in the sense that it's what the mathematics is actually doing.

Redo the derivation in rapidity and it comes out *identical in form*, which is the deep hint:

$$\phi = \frac{v_e}{c}\ln R$$

Translate back:

$$\boxed{\;\frac{\Delta v}{c} = \tanh\!\left(\frac{v_e}{c}\ln R\right)\;}$$

**Two consequences.**

**First: $\tanh$ is bounded by 1.** No matter how large $R$ gets — burn the galaxy — $\Delta v < c$. Always. Not "practically." **Structurally.** The equation cannot produce a superluminal answer even if you feed it infinite propellant. Relativity is not a speed limit painted on the road; **it's built into the shape of the function.**

**Second: the bill explodes.** Invert:

$$R = \left(\frac{1+\beta}{1-\beta}\right)^{c/2v_e}$$

Take a *wildly* optimistic fusion rocket, $v_e = 0.1c$ — a hundred times better than anything humanity can build, and that is generous.

| Target $\Delta v$ | Newtonian $R$ | **Relativistic $R$** | Tax |
|---|---|---|---|
| $0.1c$ | 2.72 | 2.73 | 0.3% |
| $0.5c$ | 148 | 243 | 64% |
| $0.9c$ | 8,103 | **2.5 million** | **300×** |
| $0.99c$ | $2.2\times10^{4}$ | $\sim 3\times10^{11}$ | ~10⁷× |

At $0.9c$, Newton says you need a mass ratio of 8,000. **Relativity says 2.5 million.** Your ship is 2.5 million times heavier than its payload, and it's made of *fusion fuel*, and you've built a small moon to deliver a probe.

And this has been generous twice over, because it assumed a fusion rocket. **The best possible rocket is a photon rocket**: $v_e = c$, perfect matter-antimatter annihilation, 100% conversion, exhaust that is pure light. It is the theoretical ceiling; nothing beats it, ever.

$$\Delta v = 0.9c: \quad R = \left(\frac{1.9}{0.1}\right)^{1/2} = \sqrt{19} = \mathbf{4.36}$$

That looks *fine*! Except: your propellant is **antimatter**. So 77% of your ship's launch mass must be antimatter. Humanity's total antimatter production, ever, across all facilities, over all of history, is on the order of **nanograms**, and it cost more per gram than anything else that has ever existed by many orders of magnitude, and the energy to make it exceeds the energy you get back by a factor of about $10^{10}$.

**The rocket equation permits interstellar travel. It just requires you to build a starship out of the most expensive substance in the universe, and mostly out of it.**

This is why the serious interstellar proposals — Breakthrough Starshot, laser sails — **are not rockets.** They put the engine on the ground and shine it at the ship. **The only way to win at the rocket equation is to refuse to play**, and the way you refuse is to leave the propellant at home and let someone else push.

Sails come properly in the chapter on escaping chemistry.

---

## What Δv is, and what it very much is not

Last piece of conceptual hygiene, and it prevents a specific error that will otherwise wreck the chapter on ascent.

**Δv is not the change in your speed.**

It's called "delta-v." It's spelled like a change in velocity. It is not one.

Δv is what your **engine** delivers:

$$\Delta v \equiv \int \frac{T}{m}\,dt$$

That is: the integral of the acceleration **your engine produces**, over the burn. It is a property of the vehicle and the burn, and of nothing else.

Your **actual** change in velocity is:

$$\Delta v_{\text{actual}} = \int\left(\frac{T}{m} + g + \frac{D}{m}\right)dt$$

— engine, plus gravity, plus drag. **Gravity and drag change your speed, and they are not Δv, because you didn't buy them.**

Why does this matter? Because it's the reason the accounting in this course works at all.

Consider: a launch to LEO needs an orbital speed of **7.67 km/s**, yet the Δv is **9.4 km/s.** Where did the extra 1.7 km/s go?

**It went into gravity, and it bought you nothing.** During ascent, gravity is decelerating you at up to 9.8 m/s². Your engine delivered 9.4 km/s worth of impulse-per-mass. Gravity ate 1.7 of it. **You arrive with 7.67 km/s of actual speed, having paid for 9.4.**

So:

> **Δv is a currency, not a kinematic quantity. It is what you spend. Speed is what you sometimes get for it.**

And this reframing is what lets the whole field work. It's why the overview's Δv map — 9.4 to LEO, 3.9 to GEO, 3.12 to the Moon — is a **price list**, and why the rocket equation is a **cash register**, and why an engineer can say "I have 3.6 km/s in the tank" and mean something precise about a vehicle sitting in a hangar with no velocity at all.

Your rocket has Δv the way your wallet has money. **It has it while sitting still.** It has it in a warehouse. It has it before you have decided where to go. And when you spend it on something stupid — like fighting gravity while going slowly straight up (the chapter on ascent), or a 60° plane change (the chapter on plane changes) — **it is gone, and the universe does not do refunds.**

Every subsequent chapter in this unit is about not spending it stupidly.

---

## Coda: what the derivation gives

Four lines of conservation of momentum, and here is what fell out:

**$T = \dot m_p c$.** Thrust is bought with mass flow, and mass flow only. Frame-independent, because $v_e$ is relative. Thirteen tonnes a second and 43 gigawatts to get one Saturn V off Florida.

**$R = e^{\Delta v/v_e}$.** The exponential, not the logarithm, is the operative object. **Every $v_e$ of mission costs a factor of $e$.** Reaching orbit is $x = 2.74$, which is the number this entire course is about.

**The equation is compound interest**, because every kilogram of propellant must be accelerated by the propellant beneath it, and you are borrowing against a loan you took out to service a loan.

**$\lambda = \dfrac{1/R - \varepsilon}{1-\varepsilon}$.** The payload lives in the sliver, and the exponential eats the sliver, not the fuel fraction. **Never look at propellant fraction. Look at what's left.**

**$\Delta v_{\max} = v_e\ln(1/\varepsilon)$.** The impossibility theorem. Your engine sets the scale; your engineering enters **logarithmically**, so halving the dead weight of the entire rocket — the achievement of a career — buys you 2.4 km/s and no more. And a billion dollars of X-33 died in the gap between $\varepsilon = 0.073$ and $\varepsilon = 0.10$, which is about the mass of the paint.

**$E = \dfrac{x}{1-\varepsilon e^{x}}$.** One percent of $I_{sp}$ is four percent of payload, forever, on every flight. **The denominator is the margin, and as you approach impossible, the value of one more second goes to infinity.** That's not a metaphor. It's a pole.

**And $\eta_p = \dfrac{2u}{1+u^2}$**, which is 100% when you fly at exactly your own exhaust velocity, which is beautiful, and which is a promissory note that the chapter on interplanetary trajectories will cash.

### The one thing

But here's what actually matters most, and it isn't an equation.

**Moore had this in 1813.** All of it. The derivation done here, he did, ninety years before Tsiolkovsky, in a country with a functioning scientific establishment, published in a journal that people read.

**And nothing happened.**

Not because it was wrong. Not because it was hidden. Because he was answering the question he'd been asked, and the question he'd been asked was *how far will the artillery go*, and the answer was two miles, and everyone went home.

The equation didn't change between 1813 and 1903. **The question did.**

You are going to spend a career surrounded by equations that are correct, published, and asleep. The whole trick — the entire trick, the only trick — is **asking one of them something it hasn't been asked.**

Tsiolkovsky was a deaf provincial schoolteacher with no laboratory, no funding, no colleagues, and no institutional standing of any kind. What he had was a hundred-year-old equation that everyone already knew, and **the nerve to ask it about the Moon.**

The next chapter (the thermochemical ceiling): why $v_e$ is stuck between 2.6 and 4.5 km/s, why it's the periodic table's fault and not the engineers', and what happened to the people who tried to do something about it.

---
---

## Problem set

*The first set of problems. Do them in order — 4 through 6 build on each other, and 6 is the one that matters. Full worked answers follow.*

---

**1 — The sandbag, formally.** A cart of mass $m$ carrying sand slides on a frictionless track at velocity $v$. Sand leaks from a hole in the bottom at rate $|\dot m|$, leaving with zero velocity relative to the cart.
**(a)** Using the *correct* differential rocket equation, find the cart's acceleration.
**(b)** Now a fan is mounted on the cart, blowing the leaking sand backwards at 3 m/s relative to the cart. The cart is doing 10 m/s, $m = 50$ kg, $|\dot m| = 0.2$ kg/s. Find the thrust and acceleration.
**(c)** Repeat (b) in a frame moving at 10 m/s alongside the cart. Comment on what would have happened had you used $F = ma + v\dot m$.

**2 — Feeding the F-1.** An F-1 produces 6.77 MN at sea level with $I_{sp} = 263$ s, and 7.77 MN in vacuum with $I_{sp} = 304$ s.
**(a)** Mass flow rate in each case. Are they the same? **Should** they be?
**(b)** The S-IC's five F-1s burn for 168 s. Estimate the propellant mass. Compare to the actual figure of roughly 2,000 t.
**(c)** Use the *difference* between vacuum and sea-level thrust to deduce the nozzle exit area $A_e$, and compare with the actual figure of about 10.7 m². What does this tell you about **where** the altitude variation in thrust comes from? Given that the F-1's exit pressure is about 0.7 bar, is it over- or under-expanded at sea level?

**3 — Six missions.** For each, compute $x = \Delta v/v_e$, mass ratio $R$, and propellant fraction $\zeta$. Then say in one sentence what the number *means*.

| | Mission | Δv (km/s) | $I_{sp}$ (s) |
|---|---|---|---|
| (a) | Falcon 9 → LEO | 9.4 | 340 (avg) |
| (b) | S-IVB → trans-lunar injection | 3.12 | 421 |
| (c) | Apollo LM ascent stage → lunar orbit | 1.87 | 311 |
| (d) | LEO → GEO (Hohmann, both burns) | 3.86 | 320 |
| (e) | Dawn's entire mission | 11.5 | 3,100 |
| (f) | Hypothetical crewed Mars round trip | 12.0 | 350 |

**4 — Derive it yourself.** From $m_0 = m_s + m_p + m_{pl}$, $\lambda = m_{pl}/m_0$, and $\varepsilon = m_s/(m_s+m_p)$, derive $\lambda = (1/R - \varepsilon)/(1-\varepsilon)$ without looking. Then check it against two limits: $\varepsilon \to 0$ and $R \to 1$. Do both make sense?

**5 — The theorem.** Prove $\Delta v_{\max} = v_e\ln(1/\varepsilon)$ and state precisely what it means physically.
**(a)** A kerolox SSTO: $I_{sp}$ (avg) = 320 s, $\varepsilon = 0.06$. Possible?
**(b)** What $\varepsilon$ would it need for $\lambda = 0.01$?
**(c)** Solid-motor SSTO, $I_{sp} = 268$ s, $\varepsilon = 0.09$. Comment.

**6 — The three seconds.** Using $E = x/(1-\varepsilon e^x)$:
**(a)** A single stage with $\varepsilon = 0.06$, $I_{sp} = 320$, Δv = 5.0 km/s. Compute $E$.
**(b)** Now Δv = 7.0 km/s, same stage. Compute $E$. Explain the change in one sentence.
**(c)** Verify (a) numerically by computing $\lambda$ at $I_{sp} = 320$ and $I_{sp} = 323.2$.
**(d)** At what Δv does $E$ become infinite? What is happening physically?

**7 — Propulsive efficiency.**
**(a)** A Falcon 9 first stage, $v_e = 2.8$ km/s, staging at 2.3 km/s. Compute $\eta_p$ at liftoff and at staging.
**(b)** Dawn, $v_e = 30.4$ km/s, cruising at 5 km/s. Compute $\eta_p$.
**(c)** Dawn's efficiency is dreadful and nobody at JPL lost a minute's sleep. Explain, in terms of what is scarce.
**(d)** *Harder.* At $u = 2$, show explicitly that the rocket receives more power than the engine releases, and say precisely where the surplus comes from. Which later chapter does this preview?

**8 — The starship.** A fusion rocket achieves $v_e = 0.08c$.
**(a)** Newtonian mass ratio for $\Delta v = 0.2c$? Relativistic?
**(b)** Same for $\Delta v = 0.8c$. Comment.
**(c)** A photon rocket ($v_e = c$) for $\Delta v = 0.8c$. Mass ratio? Why is this not good news?
**(d)** Breakthrough Starshot proposes a 1-gram sail pushed to 0.2c by a 100 GW ground-based laser. **It has no propellant.** What does the rocket equation say about it, and what does that tell you about the equation?

---

---

## Worked answers

---

### 1 — The sandbag, formally

**(a)** Correct equation: $m\dot v = F_{\text{ext}} - v_e\dot m$. Here $F_{\text{ext}} = 0$ and, critically, **$v_e = 0$** — the sand leaves with zero velocity *relative to the cart*.

$$m\dot v = 0 - 0\cdot\dot m = 0 \quad\Rightarrow\quad \boxed{a = 0}$$

**The cart coasts.** As every one of you knew before you started, and as the wrong formula denies.

**(b)** Now $v_e = 3$ m/s.

$$T = v_e|\dot m| = 3 \times 0.2 = \mathbf{0.6\ N}, \qquad a = \frac{0.6}{50} = \mathbf{0.012\ m/s^2}$$

**(c)** In the co-moving frame: **exactly the same.** $T = 0.6$ N, $a = 0.012$ m/s². Because $v_e$ is a **relative** velocity and relative velocities are invariant under Galilean boosts. The cart's own velocity never appears in the answer, which is precisely why the answer is trustworthy.

**Now the wrong formula, $ma = -v\dot m$:**
- Ground frame: $ma = -(10)(-0.2) = +2$ N → $a = 0.04$ m/s²
- Co-moving frame: $v = 0$ → $a = 0$

**Two frames, two answers, and *neither* is the truth (0.012).** The wrong formula isn't merely inaccurate — it isn't a physical statement at all, because it returns different values for the same experiment depending on where the observer parks. **Frame-dependence in an answer that should be frame-independent is not a small error. It is a diagnosis.**

And note the specific pathology: the wrong formula gave $2$ N where the truth is $0.6$ N — it was **wrong by the ratio $v/v_e = 10/3$.** It will *accidentally agree* with reality exactly when $v = v_e$, which is the sort of coincidence that lets a bad formula survive for years in a textbook.

---

### 2 — Feeding the F-1

**(a)**
$$\dot m_{SL} = \frac{6.77\times10^6}{263\times9.80665} = \frac{6.77\times10^6}{2{,}579} = \mathbf{2{,}625\ kg/s}$$
$$\dot m_{vac} = \frac{7.77\times10^6}{304\times9.80665} = \frac{7.77\times10^6}{2{,}981} = \mathbf{2{,}606\ kg/s}$$

**Are they the same? Essentially yes — within 0.7%, which is the rounding in the published figures.**

**Should they be? *Yes*, and this is the point of the question.** Mass flow is set by the **turbopumps and the injector** — by how fast the pumps spin and how much pressure they develop against the chamber. **The pumps have no idea what the atmosphere outside is doing.** The engine ingests propellant at the same rate on the pad and in vacuum.

So: **thrust changes with altitude. Mass flow does not.** Every bit of the altitude variation lives in the pressure term $(p_e - p_a)A_e$. That's not a detail; it's the whole structure of the pressure-term result above, and it's the reason a single number ("thrust") for an engine is always a lie of omission.

**(b)** $5 \times 2{,}625 \times 168 = 2{,}205{,}000$ kg = **2,205 t**.

Actual: roughly 2,000–2,150 t depending on whose figures. **We're within about 5%.**

The discrepancy is real and knowable: the **centre engine shut down early** (about 26 seconds early on later flights, to limit the pogo oscillations discussed in the chapter on engines), and the outboard engines were throttled during max-Q. So our estimate — five engines at full sea-level flow for the full 168 s — is an **upper bound**, and it lands 5% above the truth, in exactly the direction it should. **A model that's wrong in a predictable direction for a reason you can name is not a broken model. It's a working one.**

**(c)** Subtract the two thrust equations. The $\dot m v_e$ term is identical (same mass flow, same nozzle), so it cancels:

$$T_{vac} - T_{SL} = p_{a,SL}\,A_e \quad\Longrightarrow\quad A_e = \frac{7.77\times10^6 - 6.77\times10^6}{101{,}325} = \frac{1.0\times10^6}{101{,}325} = \mathbf{9.87\ m^2}$$

Actual: **10.7 m²** (exit diameter 3.72 m). **We're 8% low**, entirely from rounding in the published thrust figures.

**What this tells you:** the entire 1 MN difference between vacuum and sea-level thrust — **15% of the engine's output** — is *nothing but atmospheric pressure pushing on the nozzle exit plane.* Not combustion, not the pumps, not the propellant. **The air is simply standing in the way of a 10 m² hole, and it costs a meganewton.** You can compute the nozzle's exit area from two thrust numbers and a barometer, without knowing anything at all about the engine.

**Over- or under-expanded?** $p_e \approx 0.7$ bar $< p_a = 1.013$ bar, so the exhaust exits at *lower* pressure than the ambient air. **The F-1 is over-expanded at sea level.**

And that is **deliberate**. An over-expanded nozzle at liftoff is a modest performance loss for the first thirty seconds, and it buys you a bigger expansion ratio that pays off for the remaining 138 seconds as the air thins. **You optimize for the whole trajectory, not for the photograph.** (Push over-expansion too far and the flow *separates* from the nozzle wall, goes asymmetric, and rips the engine off the vehicle — the Summerfield criterion, and a problem for the next chapter, the thermochemical ceiling.)

---

### 3 — Six missions

| | Mission | Δv | $I_{sp}$ | $v_e$ (m/s) | $x$ | $R$ | $\zeta$ |
|---|---|---|---|---|---|---|---|
| (a) | F9 → LEO | 9.4 | 340 | 3,334 | **2.819** | **16.8** | **94.0%** |
| (b) | S-IVB → TLI | 3.12 | 421 | 4,129 | 0.756 | 2.13 | 53.0% |
| (c) | LM ascent | 1.87 | 311 | 3,050 | 0.613 | 1.85 | 45.8% |
| (d) | LEO → GEO | 3.86 | 320 | 3,138 | 1.230 | 3.42 | 70.8% |
| (e) | Dawn, entire | 11.5 | 3,100 | 30,401 | **0.378** | **1.46** | **31.5%** |
| (f) | Mars round trip | 12.0 | 350 | 3,432 | **3.496** | **33.0** | **97.0%** |

**What the numbers mean:**

**(a) 94% propellant.** Six percent of a Falcon 9 on the pad is *not fuel*, and that six percent must contain nine engines, two stages, all the tankage, the avionics, the fairing, the grid fins, the landing legs — **and the satellite.** This is why launch vehicles look the way they do: they are fuel tanks with a rounding error bolted on top.

**(b) Only 53%!** Compare to (a). **TLI is a *third* the propellant fraction of reaching orbit**, despite being "going to the Moon," which sounds harder. Two reasons: the Δv is small (3.12 vs 9.4), and hydrogen buys you 25% more $v_e$. **This is Heinlein's aphorism made arithmetic** — once you're in LEO you're halfway to anywhere, and here's the receipt.

**(c) 46%.** The LM ascent stage — the thing that had to work or two men died in lunar orbit with the world listening — was, in rocket-equation terms, **a comfortable vehicle.** Under half propellant. Which is *why* it could be built out of foil and hand-crimped aluminium and still close its mass budget with room to spare. Small Δv is forgiving. Small Δv is what LOR *bought* (the chapter on mission architecture).

**(d) 71%.** A commercial satellite arriving in LEO is **nearly three-quarters propellant** just to finish the journey to GEO. This is why electric propulsion has eaten the GEO market alive — trade six months of slow spiralling for half your launch mass back.

**(e) 31.5%, for the *largest Δv on the list but one*.** Dawn did **more Δv than a launch to orbit** while being *less than a third* propellant. That is the ion drive, in one row of a table. And the price is in the fine print of the chapter on escaping chemistry: 90 millinewtons, and 5.9 years of continuous thrusting.

**(f) 97% propellant.** A chemically-propelled Mars round trip is **97% fuel and 3% everything-else** — spacecraft, crew, habitat, food, shielding, lander, and the trip home. **This number is why Mars mission architecture exists as a discipline.** You do not solve it. You **decompose** it: stages, Earth-orbit assembly, aerobraking, and above all **ISRU** — making the return propellant on Mars so it never appears in $m_0$ at all (the chapter on in-situ resource utilisation). And note the shape of the problem: at $x = 3.5$, you're in the region from the compound-interest section where the exponential has eaten the sliver and everything is fragile. **This is where nuclear thermal stops being a hobby and starts being the only sane answer** (the chapter on escaping chemistry, the chapter on nuclear propulsion).

---

### 4 — Derive it yourself

$$m_s + m_p = m_0 - m_{pl} = m_0(1-\lambda) \;\Rightarrow\; m_s = \varepsilon m_0(1-\lambda)$$
$$m_f = m_s + m_{pl} = m_0\left[\varepsilon(1-\lambda) + \lambda\right] = \frac{m_0}{R}$$
$$\frac{1}{R} = \varepsilon + \lambda(1-\varepsilon) \;\Rightarrow\; \boxed{\lambda = \frac{1/R - \varepsilon}{1-\varepsilon}}$$

**Limit 1: $\varepsilon \to 0$** (massless structure — tanks made of wishes).
$$\lambda \to \frac{1/R}{1} = \frac{1}{R} = e^{-\Delta v/v_e}$$
**Correct.** With zero structure, *everything that isn't propellant is payload*, so the payload fraction is just the burnout fraction $m_f/m_0 = 1/R$. And notice what this says: **even with perfect, massless engineering, an SSTO to LEO would carry only 6.5% payload.** The structure isn't the fundamental problem. **The exponential is.** Structure just finishes the job.

**Limit 2: $R \to 1$** (zero Δv — don't go anywhere).
$$\lambda \to \frac{1 - \varepsilon}{1-\varepsilon} = 1$$
**Correct, and honestly a bit degenerate.** A vehicle that performs no Δv needs no propellant, hence no tanks, hence it's all payload. Note the model is straining here: with $m_p = 0$, the definition $\varepsilon = m_s/(m_s + m_p)$ gives $\varepsilon = 1$ unless $m_s = 0$ too, and $0/0$ appears. **The limit is formal; the physics is a point where the model's own definitions collapse.**

**That's worth noticing rather than glossing.** Checking limits is how you audit a formula, but a limit that lands on a degenerate point tells you where your model's *assumptions* live, not just its values. Here it says: **$\varepsilon$ presumes there is propellant to hold.** Take the propellant away and the parameter has nothing to be a fraction of. Every model has a place like this. Find it before someone else does.

---

### 5 — The theorem

**Proof.** $\lambda = \dfrac{1/R - \varepsilon}{1-\varepsilon}$. For any real stage $\varepsilon < 1$, so the denominator is positive and $\operatorname{sign}(\lambda) = \operatorname{sign}(1/R - \varepsilon)$.

$$\lambda > 0 \iff \frac1R > \varepsilon \iff R < \frac1\varepsilon \iff e^{\Delta v/v_e} < \frac1\varepsilon \iff \boxed{\Delta v < v_e\ln\frac1\varepsilon}$$

**Meaning, precisely:** $\Delta v_{\max} = v_e\ln(1/\varepsilon)$ is the Δv a single stage achieves **carrying exactly zero payload** — the stage flinging *only itself*. Any actual payload requires strictly less Δv. It is **not** an estimate, a rule of thumb, or a conservative bound. Given $v_e$ and $\varepsilon$, it is a **wall**.

**(a)** $v_e = 320 \times 9.80665 = 3{,}138$ m/s.
$$\Delta v_{\max} = 3{,}138 \times \ln\frac{1}{0.06} = 3{,}138 \times \ln(16.67) = 3{,}138\times2.813 = \mathbf{8.83\ km/s}$$
**Need 9.4. Impossible** — and note it's *not even close*: short by 0.57 km/s, which at $v_e = 3.14$ is a factor of $e^{0.18} = 1.2$ in mass ratio you simply do not have.

And $\varepsilon = 0.06$ is already an **excellent** kerolox stage. This vehicle is *better engineered than most things that fly*, and it cannot reach orbit while carrying nothing at all.

**(b)** $R = e^{9400/3138} = e^{2.995} = 19.99$, so $1/R = 0.0500$.
$$0.01 = \frac{0.0500 - \varepsilon}{1-\varepsilon} \Rightarrow 0.01 - 0.01\varepsilon = 0.0500 - \varepsilon \Rightarrow 0.99\varepsilon = 0.0400 \Rightarrow \boxed{\varepsilon = 0.040}$$

**Four percent.** For a 1% payload — which is nothing; it's a cubesat and a press release. **No stage in history has achieved $\varepsilon = 0.04$**, and this one must *also* be an SSTO, which means it carries recovery hardware, or it doesn't, in which case you've thrown away the entire vehicle to deliver 1%, and you've reinvented an expendable rocket with terrible payload.

**(c)** $v_e = 268\times9.80665 = 2{,}628$ m/s.
$$\Delta v_{\max} = 2{,}628\times\ln(11.11) = 2{,}628\times2.408 = \mathbf{6.33\ km/s}$$

**Short by 3.07 km/s** — more than a *whole exhaust velocity*, i.e. wrong by more than a factor of $e$ in mass ratio. Solid-motor SSTO isn't marginal; **it's not in the same postcode.** Solids have poor $I_{sp}$ *and* poor $\varepsilon$ (the casing must contain 60 bar), so they lose on both terms simultaneously.

**Which tells you exactly what solids are for.** They're not for going to orbit. They're for **thrust at liftoff** — cheap, dense, enormous, storable thrust, deployed for the ninety seconds when what you desperately need is high thrust-to-weight to cut gravity losses (the chapter on ascent), and then thrown away before their terrible $I_{sp}$ can do real damage to the budget. **Use the bad engine for the part of the job where its badness doesn't count, then drop it.** That's staging (the chapter on staging), and it's the same sentence as everything else here: *never carry anything through a Δv it doesn't need to experience.*

---

### 6 — The three seconds

**(a)** $v_e = 3{,}138$ m/s, $x = 5000/3138 = 1.593$, $e^x = 4.920$, $\varepsilon e^x = 0.295$.
$$E = \frac{1.593}{1 - 0.295} = \frac{1.593}{0.705} = \mathbf{2.26}$$

**(b)** $x = 7000/3138 = 2.231$, $e^x = 9.306$, $\varepsilon e^x = 0.558$.
$$E = \frac{2.231}{1 - 0.558} = \frac{2.231}{0.442} = \mathbf{5.05}$$

**In one sentence:** the harder mission sits closer to the impossibility boundary, so the denominator $(1 - \varepsilon e^x)$ — **which *is* the margin** — has shrunk from 0.71 to 0.44, and the value of a second of $I_{sp}$ has **more than doubled** on the same hardware. Same engine. Same stage. Nothing changed but the destination, and the engine team's bonus structure just tripled.

**(c) Numerical check.**
$I_{sp} = 320$: $1/R = 1/4.920 = 0.20326$. $\lambda = (0.20326 - 0.06)/0.94 = \mathbf{0.15240}$.
$I_{sp} = 323.2$ (+1%): $v_e = 3{,}169.5$, $x = 1.5775$, $e^x = 4.8430$, $1/R = 0.20648$. $\lambda = (0.20648-0.06)/0.94 = \mathbf{0.15583}$.

$$\frac{0.15583}{0.15240} = 1.0225 \Rightarrow \mathbf{+2.25\%}$$

**Predicted 2.26. Measured 2.25.** The elasticity formula works. (And note: this stage is at $x = 1.59$, a *comfortable* mission. A real launch vehicle's stages live nearer $x = 2.5$, where $E$ is far larger, and the whole-vehicle effect compounds across stages — which is how the figure of **4** arose in the elasticity section.)

**(d)** $E \to \infty$ when $\varepsilon e^x = 1$, i.e. $e^x = 1/\varepsilon = 16.67$, so $x = 2.813$:
$$\Delta v = 2.813 \times 3{,}138 = \mathbf{8.83\ km/s}$$

**Which is exactly $\Delta v_{\max}$ from problem 5(a).** Not a coincidence — **the same equation, read twice.**

**Physically:** at $\Delta v_{\max}$, the payload is *exactly zero*. Add one second of $I_{sp}$ and the payload becomes *some positive number*. **Going from zero to something is an infinite fractional increase**, so the elasticity has a genuine pole there. Beyond the wall, $E$ goes negative and stops meaning anything, because $\lambda$ is negative and you are computing the sensitivity of a vehicle that does not exist.

**And this is the whole psychology of propulsion engineering, sitting in a rational function.** Far from the boundary, $I_{sp}$ is a nice-to-have. **Near the boundary, one second is worth any amount of money, because one second is the difference between a programme and a press release.** Every engine team that ever fought a two-year war over three seconds was standing near a pole. They could feel it. Now you can see it.

---

### 7 — Propulsive efficiency

**(a)** Liftoff: $u = 0 \Rightarrow \eta_p = \mathbf{0\%}$. **Every joule into the exhaust, none into the rocket.**
Staging: $u = 2.3/2.8 = 0.821$.
$$\eta_p = \frac{2(0.821)}{1 + 0.675} = \frac{1.643}{1.675} = \mathbf{98.1\%}$$

**A Falcon 9 first stage is, at staging, a 98%-efficient propulsion device.** Nobody designed that. Kerosene's exhaust velocity and the speed of a first stage are **completely unrelated quantities** — one is set by combustion thermochemistry, the other by orbital mechanics and staging optimization — and they happen to match to within 20%. **We live inside a coincidence.** Had chemistry given us $v_e = 800$ m/s, this civilization would not have left the ground.

**(b)** $u = 5/30.4 = 0.164$.
$$\eta_p = \frac{2(0.164)}{1 + 0.027} = \frac{0.329}{1.027} = \mathbf{32.0\%}$$

**(c)** **Because nothing that Dawn wasted was scarce.**

The 68% thrown away is **electrical energy from sunlight**, and sunlight is free. You pay for it *once*, in the mass of the solar arrays — and then it arrives forever, at no marginal cost, for the whole nine-year mission.

What *is* scarce is **xenon**, because every kilogram of xenon had to be launched, and launching costs ~\$2,700/kg, and — far worse — **that kilogram sits inside the launch vehicle's own exponential**, so a kilogram of xenon in deep space cost you perhaps 20 kg on the pad.

So Dawn optimizes **propellant** efficiency and cheerfully throws away energy. And it wins: **11.5 km/s of Δv on 425 kg of xenon**, more Δv than a launch to orbit, from a propellant load you could fit in a wardrobe. Chemical propulsion would have needed $R = 28.5$ for the same job — **the spacecraft would have been 96.5% propellant** and would not have existed.

> **"Efficiency" is not a quantity. It is a question about what is scarce.** Anyone comparing propulsion systems on "efficiency" without naming the scarce resource is selling something.

**(d)** At $u = 2$ (so $v = 2v_e$):

$$P_{\text{rocket}} = \dot m v_e v = \dot m v_e (2v_e) = 2\dot m v_e^2, \qquad P_{\text{engine}} = \tfrac12 \dot m v_e^2$$

$$\frac{P_{\text{rocket}}}{P_{\text{engine}}} = \mathbf{4}$$

**The rocket receives four times the power the engine releases.** Now find the surplus, per kilogram of propellant:

- **Before ejection:** riding along at $v = 2v_e$, so KE $= \tfrac12(2v_e)^2 = 2v_e^2$
- **After ejection:** moving at $v - v_e = v_e$, so KE $= \tfrac12 v_e^2$
- **Surrendered by the propellant:** $2v_e^2 - \tfrac12 v_e^2 = \mathbf{1.5\,v_e^2}$
- **Contributed by the engine:** $\tfrac12 v_e^2$
- **Total to the vehicle:** $1.5v_e^2 + 0.5v_e^2 = \mathbf{2v_e^2}$ ✓ — exactly $P_{\text{rocket}}/\dot m$.

**The books balance to the joule.** Three-quarters of the energy the rocket "gained" was **kinetic energy the propellant was already carrying** — energy you paid for earlier, at full price, when you accelerated that propellant along with everything else. The engine isn't creating it. **The propellant is handing back a deposit.**

**Previews: the chapter on interplanetary trajectories, the Oberth effect.** When you get there and are told that burning at periapsis gives you seven times the energy for the same propellant, and it smells like a swindle — **it isn't.** It's this. You are choosing *when* to cash in kinetic energy you already own, and choosing well. **Nothing is free. But the timing is yours, and the timing is worth a fortune.**

---

### 8 — The starship

**(a)** $v_e = 0.08c$, $\Delta v = 0.2c$.

Newtonian: $R = e^{0.2/0.08} = e^{2.5} = \mathbf{12.2}$
Relativistic: $\operatorname{artanh}(0.2) = \tfrac12\ln\frac{1.2}{0.8} = \tfrac12\ln 1.5 = 0.2027$. So $\ln R = 0.2027/0.08 = 2.534$, giving $R = \mathbf{12.6}$.
**Tax: 3.5%.** Nothing. Relativity shrugs.

**(b)** $\Delta v = 0.8c$.

Newtonian: $R = e^{0.8/0.08} = e^{10} = \mathbf{22{,}026}$
Relativistic: $\operatorname{artanh}(0.8) = \tfrac12\ln 9 = 1.0986$. $\ln R = 1.0986/0.08 = 13.73$, so $R = \mathbf{9.2\times10^5}$.
**Tax: 42×.**

**Comment.** Newton's answer was *already* a catastrophe — mass ratio 22,000 means your ship is twenty-two thousand times its payload and **made of fusion fuel**; you are pushing a probe with a small moon. Relativity then multiplies that by **forty-two**.

But look at the *shape*: **3.5% tax at $0.2c$, 4,180% at $0.8c$.** Relativity is nearly free right up until it isn't, and then it is ruinous, and there is no warning in between. It's the same pathology as the impossibility theorem above — **the function is polite in the region where you're testing and lethal in the region where you want to live.**

**(c)** Photon rocket, $v_e = c$, $\Delta v = 0.8c$:

$$R = \left(\frac{1+\beta}{1-\beta}\right)^{c/2v_e} = \left(\frac{1.8}{0.2}\right)^{1/2} = \sqrt{9} = \mathbf{3.0}$$

**Mass ratio three.** Two-thirds propellant. **That's a Falcon 9 upper stage.** By the standards of everything else in this problem set it's *trivial*.

**Why it isn't good news:** the propellant is **antimatter** (a photon rocket is a 100%-efficient matter-to-collimated-light converter, which is what perfect annihilation is). So **67% of your starship's launch mass must be antimatter.**

Humanity's total antimatter production — every facility, all of history — is on the order of **nanograms**. It costs more per gram than any substance that has ever existed, by many orders of magnitude. **The energy required to make it exceeds the energy you get back by a factor of roughly $10^{10}$**, because production efficiency is appalling and always will be — you're not mining it, you're *paying full freight in energy and then losing most of it*.

> **The rocket equation grants permission. The universe declines to supply the parts.**

That distinction is worth more than the arithmetic. **The equation is necessary, not sufficient.** It tells you what is forbidden. It never tells you what is available. A proposal that clears the rocket equation has cleared the *first* gate, and there are others, and one of them is a stockroom.

**(d) Starshot.** No propellant: $m_0 = m_f$, so $R = 1$, so:

$$\Delta v = v_e \ln(1) = \mathbf{0}$$

**The rocket equation says Starshot achieves exactly zero.**

**And it's right.** Starshot **is not a rocket.** The equation describes vehicles that accelerate by throwing *their own mass*. Starshot throws nothing. It is **pushed**, by momentum delivered from outside the system, by a laser bolted to a planet. Our four-line derivation assumed a closed system with an internal mass flow, and Starshot violates that assumption at the first word. **The conclusion doesn't fail. The hypothesis does.**

**And this is the most important thing in this problem set, and it is worth being blunt about.**

Every constraint in physics has a **domain of applicability**, and the constraint is inescapable *within that domain* and says **nothing whatsoever** outside it. For 120 years the entire field has been fighting the rocket equation from the inside — staging, LOR, gravity assists, Oberth, aerobraking, ISRU — and every one of those is a clever, brilliant, **losing** manoeuvre, because you cannot beat an exponential by being tidy.

**The only winning move is to stop being a rocket.** Leave the propellant at home. Leave the engine at home. **Bolt the power source to a planet and shine it.**

And then — because this course does not let you off — **read the bill.** Starshot's laser is **100 GW, continuous**. That is roughly two and a half Saturn V first stages' worth of jet power, running not for 168 seconds but for **minutes on end**, to push **one gram**.

**You didn't beat physics. You moved the invoice onto the electricity grid** — which can pay it, because it is bolted to a planet and doesn't have to carry itself.

**That's the whole trick. It has always been the whole trick.** Every evasion in this course is the same move in a different costume: *find the thing that doesn't have to be carried, and stop carrying it.*

The next chapter (the thermochemical ceiling): why $v_e$ is stuck, and the people who set themselves on fire finding out.

---


---

## Further reading

- **George P. Sutton & Oscar Biblarz, *Rocket Propulsion Elements*.** The standard reference on how rocket engines work; its opening chapters build the rocket equation and specific impulse from first principles.
- **John D. Clark, *Ignition!: An Informal History of Liquid Rocket Propellants*.** The funniest book ever written about substances that want you dead — and the definitive account of why exhaust velocity refuses to move.
$l1_master$,
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

-- Curated, human-reviewed self-test — same set served at every level.
with q as (
  select $l1_quiz$[{"id": "q1", "type": "mcq", "prompt": "The naive derivation writing F = ma + v(dm/dt) for a rocket is wrong. What is the fatal flaw?", "options": ["It correctly gives the thrust as -v(dm/dt)", "It makes thrust depend on the rocket's absolute velocity, so the same engine gives different thrust in different reference frames", "It leaves out the mass of the exhaust", "It only holds in a vacuum"], "answerIndex": 1, "explanation": "Thrust cannot depend on how fast the rocket already happens to be going. The wrong formula contains an absolute velocity where it should contain the RELATIVE exhaust velocity, so it changes value from one inertial frame to the next \u2014 and even predicts that a sandbag leaking sand at zero relative velocity accelerates, which it does not. The error is applying Newton's law to a system whose particles change from one instant to the next."}, {"id": "q2", "type": "mcq", "prompt": "In the correct treatment, a rocket's thrust equals:", "options": ["the exhaust velocity divided by the mass flow rate", "the mass flow rate times the relative exhaust velocity", "the rocket's velocity times its mass", "the chemical energy released per second"], "answerIndex": 1, "explanation": "T = (mass flow rate) x (exhaust velocity), plus a small pressure term. It depends only on the engine \u2014 how much mass is thrown per second and how fast, relative to the rocket \u2014 which is exactly why the thrust measured on a test stand bolted to the ground is the thrust the engine produces in deep space."}, {"id": "q3", "type": "mcq", "prompt": "A mission needs a delta-v equal to twice the engine's exhaust velocity (x = delta-v / v_e = 2). Roughly what fraction of liftoff mass must be propellant?", "options": ["37%", "63%", "86.5%", "It is impossible"], "answerIndex": 2, "explanation": "The mass ratio is R = e^x = e^2 = 7.39, so the propellant fraction is 1 - 1/R = 86.5%. Every additional exhaust velocity worth of delta-v multiplies the mass ratio by e = 2.72 \u2014 the exponential, not the logarithm, is the object that runs the field."}, {"id": "q4", "type": "mcq", "prompt": "The single-stage impossibility theorem states that a stage with exhaust velocity v_e and structural coefficient e (epsilon) can produce at most a delta-v of:", "options": ["v_e / epsilon", "v_e times ln(1/epsilon)", "v_e times (1 - epsilon)", "epsilon times ln(v_e)"], "answerIndex": 1, "explanation": "delta-v_max = v_e ln(1/epsilon) is the delta-v a single stage reaches carrying exactly zero payload; any real payload requires strictly less. Engineering (epsilon) enters only logarithmically, so even halving a stage's dead weight \u2014 the achievement of a career \u2014 buys only about 0.69 v_e more, roughly 2.4 km/s."}, {"id": "q5", "type": "mcq", "prompt": "Why will an engine team spend two years and tens of millions of dollars to gain 1% in specific impulse?", "options": ["Regulations require the improvement", "Near the impossibility boundary, payload is a hugely amplified function of specific impulse \u2014 about 1% more gives roughly 4% more payload on a two-stage vehicle, on every flight", "It cuts the launch's fuel bill by 1%", "It makes the rocket 1% faster"], "answerIndex": 1, "explanation": "Payload lives in the thin sliver left after propellant and structure, and the elasticity E = x / (1 - epsilon e^x) grows without bound as a design approaches the boundary where payload goes to zero. On a real two-stage vehicle a 1% gain in specific impulse compounds across stages to roughly 4% more payload \u2014 a permanent dividend paid on every launch."}, {"id": "q6", "type": "open", "prompt": "Delta-v is written like a change in velocity, but it is not the change in the vehicle's speed. Explain what delta-v actually is, and why reaching low Earth orbit 'costs' about 9.4 km/s when orbital speed is only about 7.67 km/s.", "rubric": "Delta-v is the velocity change the ENGINE delivers \u2014 the integral of thrust/mass over the burn \u2014 a property of the vehicle and the burn, not the actual change in speed. It behaves like a currency the vehicle carries even while sitting still (like money in a wallet). The ACTUAL speed change also includes gravity and drag, which are not delta-v because you did not buy them. Reaching LEO needs 7.67 km/s of orbital speed, but during the slow climb gravity (and a little drag) eat roughly 1.7 km/s of the engine's delivered impulse for nothing, so the engine must supply about 9.4 km/s even though only 7.67 shows up as speed. That is why the delta-v map is a price list and the rocket equation is a cash register."}, {"id": "q7", "type": "open", "prompt": "William Moore derived the rocket equation in 1813, ninety years before Tsiolkovsky, and nothing came of it. What does that story illustrate about how fields actually advance?", "rubric": "The mathematics was not the achievement: it was already old, correct, and freely published (Moore derived it from Newton's conservation of momentum, and anyone could have). Moore only asked 'how far will an artillery rocket fly?', got the answer ('about two miles'), and stopped. The achievement was asking the SAME equation a different question \u2014 'what would it take to leave the Earth?' \u2014 and being willing to take the answer seriously. Progress here came from a new question, not new mathematics. Correct, published results can sit unused for decades until someone asks them something they were never asked."}]$l1_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/space-exploration/rockets/the-logarithm', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
