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
-- The prose is an original rewrite — no copied text — of the standard
-- introduction to the field (scope, micro vs. macro, the two decision-makers)
-- extended with the basic mechanics of demand, supply, and market equilibrium.
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
    $ei_master$> **Economics** — the study of how societies produce, distribute, and consume goods and services, and of the choices people make when resources are scarce.

## What economics studies

Every society runs into the same underlying problem: human wants are effectively boundless, but the means of satisfying them — labour, land, machinery, time — are finite. Economics is the discipline that studies how people, firms, and whole societies cope with that mismatch. Broadly, it asks what gets **produced**, how output is **distributed** among the people who want it, and how it is ultimately **consumed**. Because resources are limited, every decision to use them one way is also a decision *not* to use them another; the study of those trade-offs sits at the heart of the subject.

The field divides into two branches that examine the same economy from different distances.

> **Macroeconomics** — the study of the economy in aggregate: total output, employment, inflation, growth, and the policies that move them.

> **Microeconomics** — the study of individual decision-makers — households and firms — and of the particular markets in which they meet.

Macroeconomics works with economy-wide totals such as national output and national income. But those totals do not float free: each is the summed result of millions of separate decisions to buy, sell, hire, and produce. In that sense macroeconomics is grounded in microeconomics — which is why microeconomics is the natural place to begin the study of economics.

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

Taken together, consumers are the source of **demand** for goods and services, and firms are the source of **supply**. Where the two meet in a market is where prices — and the quantities actually traded — get settled. The rest of this introduction sets out that machinery.

## Demand

> **Demand** — the quantity of a good that buyers are willing and able to purchase at each possible price, over a given period.

The central regularity is the **law of demand**: holding everything else constant, the lower a good's price, the more of it people want to buy; the higher the price, the less. Two forces push in the same direction. A lower price leaves buyers with more real spending power, and it makes the good cheaper *relative* to its substitutes, so buyers switch toward it.

Plotting quantity demanded against price traces a **demand curve** that slopes downward. A change in the good's *own* price moves you *along* that fixed curve. Everything else — income, the prices of related goods, tastes, expectations, the number of buyers — shifts the *whole curve*: a rise in income, for example, normally shifts demand for an ordinary good outward, so buyers want more of it at every price.

## Supply

> **Supply** — the quantity of a good that producers are willing and able to offer for sale at each possible price, over a given period.

The mirror-image regularity is the **law of supply**: holding everything else constant, a higher price makes production more profitable, so firms offer more; a lower price, less. The **supply curve** therefore slopes upward. As with demand, a change in the good's own price moves you along the curve, while changes in input costs, technology, or the number of sellers shift the entire curve.

## Where they meet: market equilibrium

A market comes to rest at the price where the plans of buyers and sellers are consistent.

> **Equilibrium** — the price at which quantity demanded equals quantity supplied, so there is no pressure for the price to move. The quantity traded at that price is the **equilibrium quantity**.

If the price sits *above* equilibrium, sellers offer more than buyers will take — a **surplus** — and competition among sellers pushes the price down. If the price sits *below* equilibrium, buyers want more than is offered — a **shortage** — and competition among buyers pushes the price up. Only at the equilibrium price do the two quantities match and the pressure disappear.

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

At \$4 buyers want 300 units and sellers offer 300: quantity demanded equals quantity supplied, so **\$4 is the equilibrium price** and **300 the equilibrium quantity**. At \$5 sellers would offer 400 but buyers take only 200 — a surplus of 200 that drives the price back down toward \$4. At \$3 buyers want 400 but sellers offer only 200 — a shortage of 200 that pushes the price back up.

When demand or supply shifts, the equilibrium moves in a predictable direction: an outward shift in demand (say, higher income) raises both the equilibrium price and quantity, while an outward shift in supply (say, a cheaper input) lowers the price but raises the quantity. This apparatus — two curves and the point where they cross — is the workhorse of microeconomics, and the foundation on which almost everything that follows is built.

---

With the field mapped and the demand–supply engine in hand, the chapter's topics look at particular prices in this framework — among them the price of money over time, the **interest rate**, and what an investment actually **earns**.$ei_master$,
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

-- Curated, human-reviewed quiz — same set served at every level.
with q as (
  select $ei_quiz$[
    {"id":"q1","type":"mcq","prompt":"Which of these questions belongs to macroeconomics rather than microeconomics?","options":["How a single household splits its budget between food and rent","What price clears the market for coffee in one city","What determines a country's total output and its overall inflation rate","How a firm chooses the output that maximizes its profit"],"answerIndex":2,"explanation":"Macroeconomics deals with economy-wide aggregates such as national output and inflation. The other three are microeconomic — they concern an individual household, a single market, or one firm."},
    {"id":"q2","type":"mcq","prompt":"In the theory of the consumer and the theory of the firm, the guiding assumptions are, respectively:","options":["Profit maximization and utility maximization","Utility maximization and profit maximization","Cost minimization and revenue maximization","Utility maximization and revenue maximization"],"answerIndex":1,"explanation":"Households are modelled as utility-maximizing (choosing the most satisfying bundle they can afford); firms are modelled as profit-maximizing (choosing the output that leaves the widest gap between revenue and cost)."},
    {"id":"q3","type":"mcq","prompt":"The price of a good rises while nothing else changes, and buyers purchase less of it. This is best described as:","options":["A leftward shift of the demand curve","A movement upward along a fixed demand curve","A rightward shift of the supply curve","A change in tastes"],"answerIndex":1,"explanation":"A change in the good's OWN price is a movement along the existing demand curve — the law of demand. The whole curve only shifts when something other than the good's own price changes (income, tastes, related prices, and so on)."},
    {"id":"q4","type":"mcq","prompt":"A market's equilibrium price is $4. If the good is instead priced at $6, we expect:","options":["A shortage, and upward pressure on the price","A surplus, and downward pressure on the price","Equilibrium, since any price is stable","A shortage, and downward pressure on the price"],"answerIndex":1,"explanation":"Above the equilibrium price, quantity supplied exceeds quantity demanded — a surplus. Sellers competing to offload unsold goods push the price back down toward equilibrium."},
    {"id":"q5","type":"open","prompt":"Using the schedule in the article (equilibrium price $4, quantity 300), describe exactly what happens in this market if the price is set at $5, and where the price will tend to move.","rubric":"At $5, quantity supplied is 400 and quantity demanded is 200, so supply exceeds demand by 200 units — a surplus of 200. With unsold goods piling up, sellers cut prices to compete, so the price falls back toward the equilibrium of $4, where quantity demanded again equals quantity supplied (300)."},
    {"id":"q6","type":"open","prompt":"Explain the difference between a movement ALONG a demand curve and a SHIFT of the whole demand curve, and give one cause of each.","rubric":"A movement along the demand curve is caused by a change in the good's OWN price (e.g. the price falls, so quantity demanded rises) — you stay on the same curve. A shift of the whole curve is caused by a change in something OTHER than the good's own price — income, tastes, the prices of related goods, expectations, or the number of buyers (e.g. a rise in income shifts demand for a normal good outward, so buyers want more at every price)."}
  ]$ei_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'economics/introduction', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
