-- Economics · Introduction — curated chapter OVERVIEW master, human-reviewed.
-- economics/introduction @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- `economics/introduction` is a SECTION node (it has child topics). When a
-- section carries a research/advanced/read master with generated = true, the
-- reader renders THIS article and lists the chapter's topics beneath it,
-- instead of the bare topic-list landing (see src/app/learn/.../page.tsx and
-- the isSection branch in ReaderPage).
--
-- The prose is an original rewrite of the standard introduction to the field:
-- scope; micro vs. macro; scarcity, allocation, and opportunity cost; the
-- ceteris-paribus assumption and the limitations of mathematical models; the
-- two decision-makers; demand and the along-vs-shift distinction; the kinds of
-- goods (normal, inferior, Giffen) and the substitution/income decomposition;
-- supply; and market equilibrium. Three interactive diagrams are embedded as
-- fenced blocks — ```incomegood (a demand curve shifting with income for a
-- normal vs inferior good), ```giffen (a price rise decomposed into its
-- substitution and income effects), and ```supplydemand (the equilibrium
-- diagram) — rendered by src/components/{IncomeGoodChart,GiffenChart,
-- SupplyDemandChart}.tsx via the Reader's pre override. Literal currency is
-- escaped for remark-math; body Postgres dollar-quoted.
--
-- A curated, human-reviewed quiz for this node is inserted at the bottom
-- (generated = true so the app serves it instead of auto-generating).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'economics/introduction',
    'research',
    'advanced',
    'read',
    $ei_master$> **Economics** — the study of how societies produce, share, and consume when there is never quite enough to go around, and of the choices scarcity forces on everyone.

## What the subject studies

Every society runs into the same underlying problem. Human wants are effectively boundless, but the means of satisfying them — labour, land, machinery, time — are finite. Economics is the discipline that studies how people, firms, and whole societies cope with that mismatch. It asks three questions in sequence: *what* gets produced, *how* that output is shared among the people who want it, and how it is finally *consumed*. Because resources are limited, every decision to use them one way is also a decision *not* to use them another — and the study of those trade-offs sits at the centre of everything that follows.

The field looks at the same economy from two distances.

> **Microeconomics** — the study of individual decision-makers — households and firms — and of the particular markets in which they meet.

> **Macroeconomics** — the study of the economy in aggregate: total output, employment, inflation, growth, and the policies that move them.

The macro totals do not float free. National output and national income are each the summed result of millions of separate decisions to buy, sell, hire, and produce. In that sense macroeconomics rests on microeconomics — which is why micro is where we begin, and where nearly everything in this introduction lives.

## Scarcity, choice, and what a choice really costs

Beneath every question the subject asks sits one stubborn fact: time, money, labour, land, raw materials, attention each come in fixed supply, while the uses one could put them to have no natural limit. That gap is not a temporary shortage to be engineered away. It is the permanent condition economics takes as its starting point.

> **Scarcity** — the condition that resources are finite while the wants they could serve are not — so that having more of one thing generally means having less of another.

Scarcity is why choice is unavoidable. If resources were unlimited, nothing would have to be given up to get anything else, and there would be no economic problem at all — everyone could have everything at once. Because they are limited, every choice is fenced in by constraints: a household by its income and the hours in a day, a firm by its budget and its plant, a government by what it can tax and borrow. So at bottom the subject is the study of **allocation** — how scarce resources get parcelled out among the many uses competing for them.

The bite of scarcity is clearest with something almost everyone would take in unlimited supply and no one can conjure on demand. Oil is the obvious case. Roughly a fifth of the world's crude passes through the **Strait of Hormuz**, a channel under 40 kilometres wide at its neck; when conflict flared in 2025 and Iran threatened to close it, prices jumped within hours — not because a single barrel had yet stopped flowing, but because the mere prospect of supply tightening was enough to change what the world would pay. Fresh water tells the same story from the other side: Egypt draws almost all of its from one river, and Ethiopia's filling of the **Grand Ethiopian Renaissance Dam** upstream turned a single shared flow into a decade-long standoff over who is entitled to how much. In each case a thing everyone wants is made precious precisely because the supply is fixed and contested — and in each, the question that follows is the economic one: who gets how much, and on what terms.

And because taking one option uses up resources that can no longer go to another, every choice carries a hidden price — not the money paid, but the best alternative forgone.

> **Opportunity cost** — the value of the next-best option given up when a choice is made. It is the true cost of any decision, whether or not money changes hands.

An hour spent studying is an hour not spent earning; land used for housing is land not used for farming; a government's spending on one programme is spending unavailable for every other. This is the chain the whole subject hangs from: **scarcity forces choices, constraints bound them, and opportunity cost is what each one really costs.** The demand and supply curves ahead are, in the end, a way of drawing how a market makes all these constrained choices at once — settling on a price that decides who gets the scarce good.

## Limitations: the mathematics is only as good as its assumptions

Almost everything that follows — the curves, the equilibrium where they cross, the equations of later chapters — is built from mathematical models, and it is worth being clear from the outset about what that machinery is and is not worth. Expressing its ideas in mathematics is what let economics call itself a science: it gives the field precision, internal consistency, and sharp, testable predictions. Much of the subject's authority in public life rests on that mathematical dress.

That authority has to be handled with care, because the rigour is real but conditional. And one assumption does more quiet work than any other — so much that it deserves a name of its own before the curves arrive.

> **Ceteris paribus — "all else held equal"** — the workhorse assumption that when the effect of one thing is examined, every other influence is frozen in place. It is what makes a clean statement like "a lower price raises quantity demanded" possible at all — and it is a fiction, because in the real world nothing ever holds still.

Every law in this introduction is spoken in the subjunctive of *ceteris paribus*. "The lower the price, the more people buy" is only true *if* incomes, tastes, the prices of other goods, and expectations all stay put while the price moves. They never do. So the phrase is not a footnote; it is a giant, standing limitation baked into the definition of every curve — the modelling equivalent of testing a wing in a windless room. It buys clarity by assuming away the very churn that makes real economies hard, and you will see it doing that work, explicitly, when we distinguish moving *along* a curve from shifting the *whole* curve. A few further limitations are worth keeping in view:

> - **Simplifying assumptions.** The standard models assume people are consistent utility-maximizers and firms single-minded profit-maximizers, and that information is good. Real people are only boundedly rational and information is patchy and unequally held — which is much of what behavioural economics exists to study.

> - **False precision.** A clean equation returns a confident, exact-looking answer even when its inputs were rough guesses. Precision on the page is not the same thing as accuracy about the world, and an elegant model can lend a shaky idea an authority it has not earned.

> - **Context-bound results.** A result derived under one institution, culture, or era can simply be false somewhere else, and the algebra gives no warning when it is being used out of the context it was built for.

> - **Hard to test.** Economics can rarely run controlled experiments, so telling a wrong model from a right one is genuinely difficult, and flawed assumptions can survive unchallenged for a long time.

> - **People react to the model.** Economic actors read the forecasts and respond to the policies, changing the very relationships a model assumed were fixed — a reflexivity physics never contends with. (Goodhart's law is its cousin: once a measure becomes a target, it stops measuring what it did.)

> - **The experts disagree.** On many consequential questions capable economists reach opposing conclusions from the very same evidence, because they begin from different assumptions and traditions. A finding presented as settled is often one position in a live, unresolved argument.

**Macroeconomics is more exposed to all of this than microeconomics.** It sums millions of dissimilar households and firms into a handful of representative numbers, has far fewer clean natural experiments to check itself against, and studies things — expectations, confidence, entire economies — that are hardest of all to hold still. The confident precision of a macro model should therefore be read with *more* suspicion, not less.

None of this is a reason to abandon the mathematics — it is the reason to pair it with judgement. The subjectivity lives *upstream* of the algebra, in the choice of which simplifications to make, which behaviours to assume, and which forces to hold equal. A conclusion is only ever as trustworthy as those choices, and reading them critically — asking whether they fit the case in front of you — is as much a part of economics as the equations.

## Older than its name

The word *economics* is young — it edged out the older phrase *political economy* only in the late nineteenth century — but the questions are ancient. People reasoned about scarcity, prices, and self-interested exchange for thousands of years before any of it was called a science. Around 91 BCE the Chinese historian Sima Qian described a market coordinating itself through prices, with no one in charge:

```quote
img: https://commons.wikimedia.org/wiki/Special:FilePath/Sima%20Qian%20%28painting%29.jpg?width=160
「物賤之徵貴，貴之徵賤……不召而自來，不求而民出之。」
"When a thing is cheap, that is the sign it will grow dear; when it is dear, the sign it will grow cheap. … Unsummoned, the goods come of themselves; unbidden, the people bring them forth."
司馬遷 Sima Qian · Records of the Grand Historian (史記) · c. 91 BCE
```

Some eighteen centuries later, at what is usually taken as the modern subject's starting point, Adam Smith put the same insight — order emerging from self-interest — at the centre of *The Wealth of Nations*:

```quote
img: https://commons.wikimedia.org/wiki/Special:FilePath/Adam%20Smith%20The%20Muir%20portrait.jpg?width=160
"It is not from the benevolence of the butcher, the brewer, or the baker that we expect our dinner, but from their regard to their own interest."
Adam Smith · The Wealth of Nations · 1776
```

Neither writer had the curves and equations of the pages that follow. But both had already seen the thing those tools describe: countless self-interested choices, coordinated by prices, settling into an order no one designed.

## The two decision-makers: households and firms

Microeconomics sorts the private economy into two kinds of actor and builds a "theory" of each.

> **Theory of the consumer** — explains how households decide what to buy. Its guiding assumption is that people are **utility-maximizing**: they choose the bundle of goods and services that yields the most satisfaction, given the income they have and the prices they face, weighing consumption now against consumption later.

> **Theory of the firm** — explains how businesses decide what, and how much, to produce. Its guiding assumption is that firms are **profit-maximizing**: they choose the output and the methods that leave the widest gap between revenue and cost.

Both assumptions are exactly the simplifications the warning above flagged — real households are only roughly utility-maximizing, real firms chase more than profit — but held as working idealizations they are astonishingly productive. Taken together, consumers are the source of **demand** for goods and services, and firms are the source of **supply**. Where the two meet in a market is where prices — and the quantities actually traded — get settled. The rest of this introduction sets out that machinery, one side at a time.

## Demand

> **Demand** — the quantity of a good that buyers are willing and able to purchase at each possible price, over a given period.

The central regularity is the **law of demand**: holding everything else constant, the lower a good's price, the more of it people want to buy; the higher the price, the less. Two forces push in the same direction — but only, as we are about to see, for an ordinary good. A lower price leaves buyers with more real spending power, and it makes the good cheaper *relative* to its substitutes, so buyers switch toward it. Plotting quantity against price traces a **demand curve** that slopes downward.

Here is where *ceteris paribus* stops being an abstraction and becomes a concrete piece of grammar to read carefully. There are two utterly different things a change can do to demand, and confusing them is the most common beginner's error in the subject:

> - **A change in the good's own price moves you *along* a fixed curve.** The curve itself does not move; you simply slide to a different point on it. This is the one influence *ceteris paribus* lets vary.

> - **A change in anything else shifts the *whole* curve.** Income, the prices of related goods, tastes, expectations, the number of buyers — these are the "all else" being held equal. When one of them changes, the entire curve moves left or right, and there is a new quantity demanded at *every* price.

That distinction *is* the ceteris-paribus assumption made visible. And the single most important curve-shifter is **income** — which is where the neat story of a downward-sloping curve meets its most interesting complications, because whether more income shifts demand out or in turns out to depend on what *kind* of good is in view.

```incomegood
```

## Kinds of goods: where the law bends

To see why income behaves so differently for different goods — and why, in one strange case, the demand curve can slope the "wrong" way entirely — a price change has to be split into the two forces it actually contains. Economists call them the substitution effect and the income effect, and every movement along a demand curve is their sum.

> **Substitution effect** — when a good's price rises, it becomes dearer *relative* to its substitutes, so buyers switch away toward them. This effect always pushes against the price: higher price, less bought. Always.

> **Income effect** — a price change also changes buyers' *real* purchasing power; a higher price leaves them effectively poorer. Which way that pushes depends on the good: for some, being poorer means buying less; for others, buying more.

These two effects, and how they add up, sort every good into three families:

> **Normal good** — demand rises with income (and falls when a higher price makes buyers poorer). The income and substitution effects point the *same* way, so the demand curve slopes cleanly downward. Most goods — clothes, restaurant meals, cars.

> **Inferior good** — demand *falls* as income rises, as people trade up and away from it. The income effect now *opposes* the substitution effect, but is the weaker of the two, so the curve still slopes downward. Bus travel, supermarket own-brand staples, instant noodles.

> **Giffen good** — a rare, extreme inferior good where the income effect not only opposes the substitution effect but *overwhelms* it, so that a higher price leads to *more* being bought and the demand curve slopes *upward*. A theoretical curiosity, and empirically contested.

### The Giffen paradox, and why it is so rare

A Giffen good breaks the law of demand outright. Picture a very poor household whose diet is mostly a single cheap staple — say rice — with a little meat on top. Now the price of rice rises. The substitution effect says buy less rice. But rice was so large a share of the budget that the price rise makes the household dramatically poorer in real terms — and, being poorer, it can no longer afford even the little meat it had, and must fill the calorie gap with the only thing cheap enough: *more rice*. The income effect (buy more of the inferior staple) overwhelms the substitution effect (buy less of the dearer good), and rice consumption *rises* as its price rises. The demand curve bends upward.

The conditions are punishing, which is why genuine Giffen goods are so hard to find: the good must be strongly inferior, must dominate the budget, and must have no close substitute. Robert Giffen's own nineteenth-century example — Irish potatoes during the famine — is now doubted by historians. The most careful modern evidence comes from a 2007 field study of rice and wheat among poor households in Hunan and Gansu, China, which found Giffen behaviour under exactly these conditions. It remains, fittingly for a subject this honest about its limits, a contested and much-argued case rather than a settled one — a reminder that even the direction of a demand curve is an empirical question, not a guarantee.

```giffen
```

## Supply

> **Supply** — the quantity of a good that producers are willing and able to offer for sale at each possible price, over a given period.

The mirror-image regularity is the **law of supply**: holding everything else constant, a higher price makes production more profitable, so firms offer more; a lower price, less. The **supply curve** therefore slopes upward. The same ceteris-paribus grammar applies exactly as it did for demand: a change in the good's own price moves you *along* the curve, while changes in input costs, technology, or the number of sellers shift the *whole* curve. Cheaper inputs or better technology shift supply outward — more offered at every price.

## Where they meet: market equilibrium

A market comes to rest at the price where the plans of buyers and sellers are consistent.

> **Equilibrium** — the price at which quantity demanded equals quantity supplied, so there is no pressure for the price to move. The quantity traded at that price is the **equilibrium quantity**.

If the price sits *above* equilibrium, sellers offer more than buyers will take — a **surplus** — and competition among sellers pushes the price down. If the price sits *below* equilibrium, buyers want more than is offered — a **shortage** — and competition among buyers pushes the price up. Only where the two curves cross do the quantities match and the pressure vanish.

The diagram below puts the two curves on one pair of axes: the downward **demand** curve, the upward **supply** curve, and the equilibrium where they cross. Drag the sliders to shift a curve and watch the equilibrium price and quantity move.

```supplydemand
```

A small worked example. Suppose a local market for some good has the following schedule:

| Price | Quantity demanded | Quantity supplied |
| --- | --- | --- |
| \$2 | 500 | 100 |
| \$3 | 400 | 200 |
| \$4 | 300 | 300 |
| \$5 | 200 | 400 |
| \$6 | 100 | 500 |

At \$4 buyers want 300 units and sellers offer 300: quantity demanded equals quantity supplied, so **\$4 is the equilibrium price** and **300 the equilibrium quantity**. At \$5 sellers would offer 400 but buyers take only 200 — a surplus of 200 that drives the price back down toward \$4. At \$3 buyers want 400 but sellers offer only 200 — a shortage of 200 that pushes the price back up. The market has no manager; the price itself does the allocating, exactly as Sima Qian and Adam Smith described long before anyone drew the curves.

This apparatus — two curves and the point where they cross — is the workhorse of microeconomics and the foundation on which almost everything ahead is built. But keep the warning in hand: every curve here is drawn *ceteris paribus*, and the real world never holds still.

---

With the field mapped and the demand–supply engine in hand, the chapters ahead turn to particular prices inside this framework — among them the price of money over time, the **interest rate**, and what an investment actually **earns**.
$ei_master$,
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
  select $ei_quiz$[{"id": "q1", "type": "mcq", "prompt": "Which of these questions belongs to macroeconomics rather than microeconomics?", "options": ["How a single household splits its budget between food and rent", "What price clears the market for coffee in one city", "What determines a country's total output and its overall inflation rate", "How a firm chooses the output that maximizes its profit"], "answerIndex": 2, "explanation": "Macroeconomics deals with economy-wide aggregates such as national output and inflation. The other three are microeconomic \u2014 they concern an individual household, a single market, or one firm."}, {"id": "q2", "type": "mcq", "prompt": "A student spends Saturday afternoon studying instead of working a shift that would have paid $60. In economic terms, the $60 is:", "options": ["irrelevant, because no money actually changed hands", "the opportunity cost of studying \u2014 the value of the next-best option given up", "the equilibrium price of the student's time", "a surplus created by the choice"], "answerIndex": 1, "explanation": "Opportunity cost is the value of the next-best alternative forgone, whether or not money is spent. The forgone wage is the real cost of the afternoon of study. Scarcity \u2014 finite time \u2014 is what forces the choice; opportunity cost is what the choice actually costs."}, {"id": "q3", "type": "mcq", "prompt": "In the theory of the consumer and the theory of the firm, the guiding assumptions are, respectively:", "options": ["Profit maximization and utility maximization", "Utility maximization and profit maximization", "Cost minimization and revenue maximization", "Utility maximization and revenue maximization"], "answerIndex": 1, "explanation": "Households are modelled as utility-maximizing (choosing the most satisfying bundle they can afford); firms are modelled as profit-maximizing (choosing the output that leaves the widest gap between revenue and cost)."}, {"id": "q4", "type": "mcq", "prompt": "The price of a good rises while nothing else changes, and buyers purchase less of it. This is best described as:", "options": ["A leftward shift of the demand curve", "A movement upward along a fixed demand curve", "A rightward shift of the supply curve", "A change in tastes"], "answerIndex": 1, "explanation": "A change in the good's OWN price is a movement along the existing demand curve \u2014 the law of demand. The whole curve only shifts when something other than the good's own price changes (income, tastes, related prices, and so on)."}, {"id": "q5", "type": "mcq", "prompt": "Every law in this introduction \u2014 \"a lower price raises quantity demanded,\" and the rest \u2014 is stated ceteris paribus. What does that assumption do, and why does it matter?", "options": ["It guarantees the laws hold true in the real world", "It freezes every other influence in place while one thing changes \u2014 which is what makes a clean law possible at all, but is a fiction, since in reality nothing ever holds still", "It means the model rests on no assumptions", "It applies only to supply, never to demand"], "answerIndex": 1, "explanation": "Ceteris paribus \u2014 \"all else held equal\" \u2014 lets a single influence vary while everything else (incomes, tastes, the prices of other goods, expectations) is held frozen. That is what makes a statement like \"a lower price raises quantity demanded\" clean and testable. But it is also a standing limitation baked into every curve: the real world never holds still, so each law is true only in the windless room of the assumption. It is exactly this assumption made visible when a change in the good's own price moves you ALONG a curve, while a change in anything else shifts the WHOLE curve."}, {"id": "q6", "type": "mcq", "prompt": "As their income rises, buyers purchase less bus travel and switch to cars. Bus travel is therefore which kind of good \u2014 and does its demand curve still slope downward?", "options": ["A normal good, and its curve slopes upward", "An inferior good, and its curve still slopes downward \u2014 the income effect opposes the substitution effect but does not outweigh it", "A Giffen good, and its curve slopes downward", "A luxury good, and its curve is vertical"], "answerIndex": 1, "explanation": "A good whose demand falls as income rises is an inferior good (bus travel, own-brand staples, instant noodles). Split a price change into a substitution effect (a higher price always pushes buyers to switch away, reducing quantity) and an income effect (a higher price leaves buyers poorer). For an inferior good the income effect opposes substitution but is the weaker of the two, so they still sum to the ordinary downward slope. Only in the rare Giffen case does the income effect not merely oppose but OVERWHELM substitution, flipping the curve upward so a higher price raises quantity demanded \u2014 the one case that breaks the law of demand."}, {"id": "q7", "type": "mcq", "prompt": "A market's equilibrium price is $4. If the good is instead priced at $6, we expect:", "options": ["A shortage, and upward pressure on the price", "A surplus, and downward pressure on the price", "Equilibrium, since any price is stable", "A shortage, and downward pressure on the price"], "answerIndex": 1, "explanation": "Above the equilibrium price, quantity supplied exceeds quantity demanded \u2014 a surplus. Sellers competing to offload unsold goods push the price back down toward equilibrium."}, {"id": "q8", "type": "open", "prompt": "Using the schedule in the article (equilibrium price $4, quantity 300), describe exactly what happens in this market if the price is set at $5, and where the price will tend to move.", "rubric": "At $5, quantity supplied is 400 and quantity demanded is 200, so supply exceeds demand by 200 units \u2014 a surplus of 200. With unsold goods piling up, sellers cut prices to compete, so the price falls back toward the equilibrium of $4, where quantity demanded again equals quantity supplied (300)."}, {"id": "q9", "type": "open", "prompt": "Explain the difference between a movement ALONG a demand curve and a SHIFT of the whole demand curve, and give one cause of each.", "rubric": "A movement along the demand curve is caused by a change in the good's OWN price (e.g. the price falls, so quantity demanded rises) \u2014 you stay on the same curve. A shift of the whole curve is caused by a change in something OTHER than the good's own price \u2014 income, tastes, the prices of related goods, expectations, or the number of buyers (e.g. a rise in income shifts demand for a normal good outward, so buyers want more at every price)."}, {"id": "q10", "type": "open", "prompt": "Economics draws much of its authority from expressing its ideas in mathematics. Give two reasons a mathematically precise economic conclusion can still be unreliable, and explain why macroeconomics is especially exposed to the problem.", "rubric": "A model is only as good as its assumptions, which are deliberate simplifications, so precision on the page is not the same as accuracy about the world. Two reasons (any two): (1) simplifying or wrong assumptions \u2014 real people are only boundedly rational, information is imperfect, and all-else-equal rarely holds, so a result can be false in a given context; (2) oversimplification and false precision \u2014 a clean equation returns an exact-looking answer even from rough inputs, lending a shaky idea unearned authority. Other valid points: conclusions are context-bound and can mislead when applied to a different institution, era, or market structure; economics can rarely run controlled experiments, so a wrong model can survive unchallenged; and people react to models and policies, changing the very relationships assumed fixed (reflexivity, Goodhart's law). Macroeconomics is more exposed because it sums millions of dissimilar households and firms into a handful of aggregate numbers, has fewer clean natural experiments to check itself against, and studies things that are hardest to hold still \u2014 expectations, confidence, whole economies \u2014 so its precise-looking conclusions deserve more critical scrutiny, not less."}]$ei_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'economics/introduction', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
