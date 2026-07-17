-- Machine Design — authored, human-reviewed master.
-- engineering-and-technology/mechanical-engineering/machine-design @ research/advanced/read.
-- A leaf topic, rendered by the Reader. Applied by db-migrate after seed.sql;
-- idempotent upsert. {{image}} markers resolve to Wikipedia at read time, and
-- the ```example blocks (factor-of-safety, axial-stress, shaft-torsion-stress,
-- shaft-diameter-design, bending-stress-shaft, bolt-tightening-torque) render
-- as interactive "your turn" practice boxes via WorkedExample. Quiz at the end.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'engineering-and-technology/mechanical-engineering/machine-design',
    'research',
    'advanced',
    'read',
    $md_master$## I. What Machine Design Actually Asks

Every machine part is the answer to a question posed by a load. A shaft must carry a torque without twisting apart; a bolt must clamp a joint without stretching loose; a gear tooth must transmit a force thousands of times a minute for years. Machine design is the discipline of turning a required *function* into a specific piece of metal — a diameter, a material, a fillet radius — and it lives or dies on two questions asked of every part: **will it break?** (strength) and **will it move too much?** (stiffness). Almost everything that follows is machinery for answering the first question quantitatively, because a part that is strong enough is usually stiff enough, but not always the reverse.

The method is always the same loop, and it is worth stating plainly because the equations can hide it. You guess a geometry. You compute the **stress** the load produces in that geometry. You compare that stress to the **strength** of the material. If the stress is too close to the strength, you make the part bigger or the material better and go around again. Design is iteration, and the equations below are just the tools that make each lap fast.

## II. Stress and Strength: the Central Comparison

The whole subject rests on separating two things that beginners conflate. **Stress** is what the *load* does inside the part — force spread over area, measured in megapascals (MPa, equal to N/mm²). **Strength** is what the *material* can withstand before it fails — a property you look up in a table. Design is the disciplined comparison of the two.

For a material pulled in tension, the stress–strain curve tells the story: stress rises in proportion to strain (the elastic region, where the part springs back), until the **yield strength** $S_y$, beyond which deformation becomes permanent, and finally the **ultimate strength** $S_u$, where it fractures. Ductile materials (most steels, aluminum) stretch appreciably before breaking and are designed against *yielding*; brittle materials (cast iron, ceramics) snap with little warning and are designed against *fracture*. Which strength you compare against depends on which failure you fear.

{{image: Stress–strain curve | A ductile stress–strain curve: elastic (springs back) up to the yield strength, then permanent deformation, then fracture at the ultimate strength. Machine design compares the working stress to one of these two strengths.}}

The two simplest stresses recur everywhere. A force $F$ pulling straight along a member of cross-section $A$ produces a **normal stress** $\sigma = F/A$. A force acting *across* a section — shearing it, like scissors on a pin — produces a **shear stress** $\tau = V/A$. Get comfortable with these; nearly every complex case is built from them.

## III. The Factor of Safety

No engineer designs a part to fail at exactly the expected load. Loads are uncertain, materials vary batch to batch, and analysis is approximate. The buffer against all of this is the **factor of safety**:

$$n = \frac{\text{strength}}{\text{stress}} = \frac{S_y}{\sigma}$$

A factor of safety of 2 means the part carries twice the stress needed to start failing. Choose it too low and the margin evaporates under a bad day's load; choose it too high and the machine is needlessly heavy and expensive — every kilogram of over-design is paid for in material, shipping, and fuel for the life of the product. Typical static designs with well-known loads and materials use $n$ between about 1.5 and 3; aerospace, weight-critical, trims it close with rigorous analysis, while a cheap bracket under unknown abuse might use 4 or more.

```example
factor-of-safety
```

## IV. Simple Stresses: Axial, Shear, and Bearing

Before the elaborate theories, master the elementary stresses, because most real analysis reduces to them. **Axial stress** is the normal stress $\sigma = F/A$ from a pull or push along the member's axis. For a round rod, $A = \pi d^2/4$, so the stress is set entirely by the load and the diameter — halve the diameter and the area drops fourfold, quadrupling the stress.

```example
axial-stress
```

**Direct shear** is the load divided by the sheared area — the stress in a bolt or pin that a joint tries to slice through, $\tau = F/A$. **Bearing stress** is the contact pressure a fastener presses against the hole it sits in. These three — axial, shear, bearing — are the everyday vocabulary of joint design.

## V. When Does It Actually Fail? Static Failure Theories

A rod in simple tension fails when its one stress reaches the strength. But real parts carry *combinations* — tension and shear at once, in different directions — and the question "how do I compare a messy multiaxial stress state to a single number from a tensile test?" is answered by a **failure theory**.

For ductile materials, two theories dominate. The **maximum-shear-stress theory** (Tresca) says yielding begins when the largest shear stress in the part reaches the shear stress at yield in a tension test — simple and conservative. The **distortion-energy theory**, which produces the **von Mises stress**, is more accurate and is the working standard. It collapses a combined normal-and-shear state into one equivalent stress you compare directly to $S_y$:

$$\sigma' = \sqrt{\sigma^2 + 3\tau^2}$$

Design so that $\sigma' \le S_y / n$. For brittle materials the logic changes — the **maximum-normal-stress theory** governs, because they fracture on the plane of greatest tension rather than yielding in shear. Choosing the right theory for the material is not pedantry; using a ductile theory on cast iron can badly mispredict when it breaks.

{{image: Von Mises yield criterion | The von Mises (distortion-energy) yield surface. Any combined stress state inside the ellipse is safe; the theory reduces a messy multiaxial state to one equivalent stress to compare against the yield strength.}}

## VI. Torsion: Shafts Under Twist

A shaft transmitting power is loaded in **torsion** — a twisting moment, or torque $T$. For a solid circular shaft the shear stress is zero at the center and greatest at the surface, where

$$\tau_{\max} = \frac{16 T}{\pi d^3}$$

The cubic in $d$ is the headline: torsional stress falls off as $1/d^3$, so a shaft that is 20% fatter carries a twist at roughly half the stress. This is why a small diameter increase is such a cheap fix for an over-stressed shaft.

```example
shaft-torsion-stress
```

## VII. Designing a Shaft to a Stress Limit

The analysis formula runs one way — given a diameter, find the stress. Design runs the *other* way — given a torque and an allowable stress, find the diameter. Invert the torsion equation:

$$d = \left(\frac{16 T}{\pi\,\tau_{\text{allow}}}\right)^{1/3}$$

The allowable stress already carries the factor of safety ($\tau_{\text{allow}} = \tau_{\text{yield}}/n$), so the diameter that comes out is the *minimum* safe size. You then round **up** to the next standard shaft diameter, which both eases manufacturing and quietly adds margin.

```example
shaft-diameter-design
```

## VIII. Bending

The other great load on shafts and beams is **bending** — a moment $M$ that puts one face in tension and the opposite face in compression, with a neutral axis of zero stress between. The maximum stress sits at the surface farthest from that axis. For a solid round cross-section it is

$$\sigma = \frac{32 M}{\pi d^3}$$

— again cubic in the diameter, the same lever the designer pulls to tame stress cheaply.

```example
bending-stress-shaft
```

## IX. Combined Loading: Real Shafts Do Both

A real transmission shaft rarely sees pure torsion or pure bending; a gear or pulley loads it with **both at once** — bending from the transverse gear force, torsion from the power it carries. The professional method combines them through the von Mises stress of Section V: compute the bending stress $\sigma$ and the torsional stress $\tau$ at the critical section, then form $\sigma' = \sqrt{\sigma^2 + 3\tau^2}$ and size the shaft so $\sigma' \le S_y/n$. This is the heart of every shaft-design standard, dressed up with correction factors for the reality of the next section.

## X. Bolted Joints and Preload

A bolted joint does not work by the bolt "holding" the load in tension the way intuition suggests. It works by **preload** — the bolt is stretched during tightening so it clamps the members together, and the clamped joint carries the working load largely in friction and compression, with the bolt seeing only a small fraction of the fluctuation. A properly preloaded bolt barely feels the external load; an under-tightened one feels all of it and fails by fatigue. Preload is the single most important — and most often botched — variable in fastener design.

The catch is that we tighten with a wrench, which controls *torque*, not the *tension* we actually want. The two are linked by the approximate relation $T = K F d$, where $F$ is the target preload, $d$ the bolt diameter, and $K$ the **nut factor** (about 0.2 for dry steel) that lumps together thread and head friction.

```example
bolt-tightening-torque
```

The trouble is that $K$ is uncertain — lubrication, plating, and surface finish swing it by tens of percent — so torque is only a rough proxy for preload. Critical joints (engine heads, structural connections) abandon torque control for **angle-of-turn** or **direct tension** methods that measure the stretch itself.

{{image: Bolted joint | A bolted joint carries load through clamping, not by the bolt acting as a hook: tightening stretches the bolt so it squeezes the members together, and the joint resists the working load in friction. Preload is what makes it work — and what fatigue destroys when it is too low.}}

## XI. Fatigue: the Real Enemy

Here is the fact that reorganizes the whole field: the great majority of mechanical failures in service are not from a single overload but from **fatigue** — the slow growth of a crack under loads that fluctuate but never once approach the static strength. A shaft stressed to well below its yield strength, turned millions of times, can crack and snap as if it had been designed with no margin at all. Static analysis alone will happily bless a part that fatigue will kill.

The tool is the **S–N curve**: the stress amplitude a material survives plotted against the number of cycles to failure. For most steels the curve flattens into an **endurance limit** $S_e$ — a stress (roughly $0.5\,S_u$ for a polished lab specimen) below which the part survives essentially forever. Real parts fall short of that ideal, and the **Marin factors** knock $S_e$ down for surface finish, size, load type, temperature, and reliability.

Two effects dominate fatigue and deserve a designer's paranoia. **Stress concentration**: any notch, hole, keyway, or sharp fillet locally multiplies the stress by a factor $K_t$ that can exceed 2 or 3 — which is why fatigue cracks nearly always start at a corner, and why generous fillet radii are among the cheapest strength you can buy. And **mean stress**: a steady tension superimposed on the fluctuation lowers the tolerable amplitude, captured by the **Goodman** and related diagrams. Design a part statically and ignore these, and you have designed a part that works on the test bench and fails in the field.

{{image: Fatigue (material) | Fatigue: repeated loading well below the static strength grows a crack until the part snaps. The failure surface typically shows smooth "beach marks" spreading from an initiation point — almost always a notch, hole, or sharp fillet where stress concentrated.}}

## XII. The Ethic of the Margin

Machine design is where the abstractions of mechanics of materials meet the responsibility of a part that must not fail with someone standing next to it. The equations here — $\sigma = F/A$, $\tau = 16T/\pi d^3$, $\sigma' = \sqrt{\sigma^2 + 3\tau^2}$, $n = S_y/\sigma$ — are simple; the judgment is not. Every choice trades weight and cost against risk, every load estimate hides an uncertainty, and every real part carries a notch the textbook figure omits. The factor of safety is not a fudge factor but an ethic: an honest accounting of what you do not know, made before the machine is built rather than discovered after it breaks. Learn the formulas until they are reflex, and spend the freed attention on the things the formulas cannot tell you.

## Further Reading

- **Richard Budynas and Keith Nisbett, *Shigley's Mechanical Engineering Design*.** The standard textbook of the field — the one most machine designers learned from and still keep on the shelf.
- **Robert Norton, *Machine Design: An Integrated Approach*.** A clear, modern alternative, strong on the design process and worked case studies.
- **Robert Juvinall and Kurt Marshek, *Fundamentals of Machine Component Design*.** Especially good on fatigue and the physical reasoning behind the formulas.
- **Walter Pilkey and Deborah Pilkey, *Peterson's Stress Concentration Factors*.** The reference for the $K_t$ values that govern where fatigue cracks begin.
- **Stephen Timoshenko, *Strength of Materials*.** The classic foundation beneath all of the above — dated in style, unmatched in clarity on why the stress formulas take the form they do.$md_master$,
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

-- Curated, human-reviewed quiz — same set served at every level. Prompts render
-- as plain text, so no math delimiters here.
with q as (
  select $md_quiz$[
    {"id":"q1","type":"mcq","prompt":"The factor of safety is defined as:","options":["Applied stress divided by material strength","Material strength divided by the applied working stress","The ultimate strength minus the yield strength","The stress concentration factor times the load"],"answerIndex":1,"explanation":"n = strength / stress (e.g., S_y / σ). It is the multiple of the working stress the part can carry before it fails. n > 1 is safe; typical static designs use about 1.5–3, higher when loads or materials are uncertain."},
    {"id":"q2","type":"mcq","prompt":"For a ductile metal under a COMBINED state of normal and shear stress, the standard theory used to predict the onset of yielding is:","options":["The maximum-normal-stress theory","The distortion-energy (von Mises) theory","Hooke's law","The Goodman line"],"answerIndex":1,"explanation":"The distortion-energy theory reduces a combined state to one equivalent (von Mises) stress, σ' = sqrt(σ² + 3τ²), compared to the yield strength. Maximum-normal-stress governs brittle materials; the Goodman line is a fatigue mean-stress tool; Hooke's law is elasticity, not a failure theory."},
    {"id":"q3","type":"mcq","prompt":"The torsional shear stress in a solid circular shaft is τ = 16T/(πd³). If the diameter is doubled at constant torque, the maximum shear stress:","options":["Doubles","Halves","Drops to one-eighth","Is unchanged"],"answerIndex":2,"explanation":"Stress goes as 1/d³, so doubling d multiplies the denominator by 2³ = 8 — the stress drops to one-eighth. This strong size dependence is why a small diameter increase is such a cheap fix for an over-stressed shaft."},
    {"id":"q4","type":"mcq","prompt":"Most mechanical parts that fail in service fail by:","options":["A single overload exceeding the ultimate strength","Fatigue — crack growth under fluctuating loads well below the static strength","Melting","Elastic deflection"],"answerIndex":1,"explanation":"Fatigue dominates real-world failures: repeated loads far below the yield strength grow a crack — usually from a notch or fillet where stress concentrates — until the part snaps. This is why static analysis alone is not enough and why endurance limits, stress concentration, and mean stress matter."},
    {"id":"q5","type":"open","prompt":"Explain what the factor of safety is and why an engineer would not simply make it as large as possible. Give at least two distinct reasons a design needs a margin above the expected load in the first place.","rubric":"The factor of safety n = strength / working stress is the multiple of the expected stress a part can carry before failing; design keeps n > 1 with a margin. Reasons a margin is needed (any two): loads are uncertain or vary (overloads, dynamic/impact effects, misuse); material properties vary batch to batch and degrade (corrosion, wear); analysis is approximate (idealized geometry, neglected stress concentrations); and consequences of failure demand conservatism. Why NOT make it huge: every extra margin adds weight, material, and cost, which are paid for over the whole life of the product (heavier, more expensive, less efficient); over-design can also hide poor understanding. So n is a deliberate balance between risk and cost, chosen from how well loads and materials are known and how severe failure would be."},
    {"id":"q6","type":"open","prompt":"A bolted joint is preloaded by tightening. Explain what preload does and why it matters, and explain why tightening to a target TORQUE only roughly controls the actual bolt tension.","rubric":"Preload is the tension induced in the bolt during tightening, which clamps the joined members together. The clamped joint then carries the external working load mainly in friction and compression, so a properly preloaded bolt sees only a small fraction of the fluctuating load — this is what protects it from fatigue and from loosening. An under-preloaded bolt feels the full load fluctuation and fails. Torque is a poor proxy because the relation T = K·F·d depends on the nut factor K (≈0.2 for dry steel), which lumps thread and head FRICTION; most of the applied torque overcomes friction rather than stretching the bolt, and K varies with lubrication, plating, and surface finish by tens of percent. So a given torque yields an uncertain preload — which is why critical joints use angle-of-turn or direct tension-measuring methods instead."}
  ]$md_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'engineering-and-technology/mechanical-engineering/machine-design', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
