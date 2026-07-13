-- Interest Rates — canonical master article, co-written and human-reviewed.
-- economics/introduction/interest-rates @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts). The upsert only touches the row
-- when the body actually differs, and the delete below fires only then —
-- dropping the derived caches so the next request re-distills from the updated
-- master. Replaying an unchanged file is a complete no-op.
--
-- A curated, human-reviewed quiz for this node is inserted at the bottom
-- (generated = true so the app serves it instead of auto-generating).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'economics/introduction/interest-rates',
    'research',
    'advanced',
    'read',
    $ir_master$> **Interest rate (r)** — the price that links money today to money in the future; a rate of return that makes cash flows on different dates comparable.

## What is an interest rate? The time value of money

The **time value of money** is the idea that a sum of cash is worth different amounts depending on *when* it arrives: money in hand today is worth more than the same money promised later, because it can be put to work in the meantime. To compare financial instruments whose cash flows fall on different dates, we therefore need one consistent rate that converts between "now" and "later." That rate is the interest rate (or yield), written r.

Suppose someone is genuinely indifferent between receiving \$2,000 today and \$2,120 a year from now. The \$120 difference is the compensation they require for waiting, and expressing it as a rate of return on the \$2,000 given up gives the interest rate:

$$\$2{,}120 - \$2{,}000 = \$120 \qquad\Longrightarrow\qquad r = \frac{\$120}{\$2{,}000} = 0.06 = 6\%$$

### Required return, discount rate, or opportunity cost

The same number can be read three ways:

1. **A required rate of return** — the minimum return an investor must earn before agreeing to make an investment.
2. **A discount rate** — the rate that pulls a future amount back to its value today. Here, 6% is the rate at which \$2,120 a year out is equivalent to \$2,000 now — which is why "interest rate" and "discount rate" are used almost interchangeably.
3. **An opportunity cost** — the value given up by choosing one course of action over another. Had the person who put up the \$2,000 spent it today instead, they would have surrendered the 6% they could have earned by saving — so 6% is the opportunity cost of consuming now.

## What an interest rate is made of: risk premiums

In a market, interest rates are set where **supply meets demand** — investors supplying funds, borrowers bidding for their use — and the rate that clears the market is the price of that borrowing. Seen from the investor's side, that rate can be *built up* from parts.

> **Real risk-free rate** — the single-period rate on a completely risk-free security in a world where no inflation is expected; in economic theory it reflects people's time preference for consuming now versus later.

Start with that real risk-free rate, then add a stack of premiums, each compensating the lender for a distinct risk:

> **Inflation premium** — compensation for expected inflation, reflecting the average inflation rate anticipated over the life of the debt. (Inflation erodes *purchasing power* — the quantity of goods and services a unit of currency can buy.)

> **Default (credit) risk premium** — compensation for the possibility that the borrower fails to make a promised payment on time and in the full contracted amount.

> **Liquidity premium** — compensation for the risk of having to sell below fair value when an investment must be turned into cash in a hurry.

The most liquid government paper carries essentially no liquidity premium: short-term German government bills (*Bubills*) in the euro area, or Government of India Treasury Bills, can be bought and sold in large size without meaningfully moving their price. The opposite holds for the bonds of small issuers, which often trade only rarely once issued — unloading such a position may mean accepting a discount, so lenders demand a liquidity premium up front to bear that cost.

> **Maturity premium** — extra compensation for holding longer-dated debt, whose market value swings more when interest rates move.

The longer a bond still has to run, the more its price reacts to a change in interest rates — the same rate move costs (or gains) a long bond far more than a short one. Investors want to be paid for taking on that extra price risk, so longer-maturity debt generally yields more. That is why long-term government bonds usually pay more than short-term ones: most of the gap is a maturity premium (with some difference in inflation expectations mixed in).

$$r = \text{(real risk-free rate)} + \text{(inflation + default + liquidity + maturity premiums)}$$

## The nominal risk-free rate

Bundle just the first two and you get the **nominal risk-free rate** — the rate quoted on safe, short-term government debt:

$$\text{Nominal risk-free rate} = \text{Real risk-free rate} + \text{Inflation premium}$$

For example, a 1.5% real risk-free rate plus a 2.5% inflation premium gives a nominal risk-free rate of about 4%.

In practice, a country's short-term government debt stands in for *the* nominal risk-free rate over that horizon. The instrument goes by different names — US Treasury bills, French BTFs (*Bons du Trésor à taux fixe*), German Bubills, short-term Japanese government bills, Indian 91-day Treasury bills — but the role is identical. Because expected inflation and central-bank policy differ from country to country, so do these rates. Around early-to-mid **July 2026**, the three-month (≈90-day) government bill yielded roughly:

- **India** — about **5.3%** (8 Jul 2026)
- **United States** — about **3.8%** (10 Jul 2026)
- **Japan** — about **1.0%** (8 Jul 2026)

One reading convention matters throughout: interest rates are quoted in *annual* terms. A 90-day bill quoted at 3.8% is stating an **annualized** rate — the return actually earned over those 90 days is only about a quarter of it (roughly 0.9%), not 3.8%.

## Why interest rates change

Whichever lens you use — required return, discount rate, or opportunity cost — the number resolves to the same thing: a real risk-free rate plus premia (inflation, default, liquidity, maturity) sized to the particular cash flows. And none of those building blocks stands still. The real risk-free rate drifts and every premium shifts as expectations change, so interest rates are in constant motion. How far a given rate moves depends on the economic fundamentals beneath it — and just as much on how markets *expect* those fundamentals to change.

## Compound interest: compounding more than once a year

Interest doesn't only accrue annually — it can be paid or charged quarterly, monthly, even daily. When it compounds more often than once a year, you can't drop the annual rate straight into a present- or future-value calculation. You scale the rate *down* to the length of a single compounding period and scale the *number* of periods *up* to match, so the two stay consistent.

With an annual rate $r$ compounded $m$ times a year for $n$ years, the future value of an amount $PV$ is:

$$FV = PV\left(1 + \frac{r}{m}\right)^{m n}$$

So a nominal 8% compounded quarterly is really 2% applied over each of $4n$ quarters — and it grows to more than 8%-once-a-year would, because each period's interest itself starts earning interest.

Putting returns on a common annual footing lets you line up investments held for different lengths of time and judge them on one scale — a one-month gain and a three-year gain only become comparable once both are expressed as annual rates.

Push the compounding frequency higher and higher — monthly, daily, every instant — and in the limit, as $m$ grows without bound, interest compounds **continuously**:

$$FV = PV\,e^{rn}$$

---

An interest rate is the price of money over *time*. What an investment actually *earns* — and how that return is measured — is the subject of a companion topic, **Rates of Return**. (A required rate of return, after all, is itself a rate — which is where the two meet.)$ir_master$,
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
  select $ir_quiz$[
    {"id":"q1","type":"mcq","prompt":"An interest rate can be interpreted in several equivalent ways. Which of the following is NOT one of them?","options":["A required rate of return","A discount rate","An opportunity cost","A guaranteed, risk-free profit"],"answerIndex":3},
    {"id":"q2","type":"mcq","prompt":"A market (nominal) interest rate is best described as:","options":["The real risk-free rate minus expected inflation","A real risk-free rate plus premiums for inflation, default, liquidity, and maturity risk","Only a premium for expected inflation","The maturity premium on long-term government debt"],"answerIndex":1},
    {"id":"q3","type":"mcq","prompt":"You pay $4,000 today for a claim that will pay $4,300 in exactly one year, with no other cash flows. The implied one-year interest rate is closest to:","options":["6.5%","7.0%","7.5%","8.0%"],"answerIndex":2},
    {"id":"q4","type":"mcq","prompt":"A 90-day government bill is quoted at 4.0%, an annualized rate. Approximately how much is actually earned over the 90-day holding period?","options":["About 0.3%","About 1.0%","About 4.0%","About 16%"],"answerIndex":1},
    {"id":"q5","type":"open","prompt":"Two 3-year bonds are identical except for liquidity: the highly liquid one yields 2.8% and the illiquid one yields 3.4%. Separately, two 10-year bonds differ in both liquidity and default risk: a liquid, low-default bond yields 4.6%, while an illiquid, high-default bond yields 7.1%. Estimate (a) the liquidity premium and (b) the default-risk premium embedded in these rates.","rubric":"Liquidity premium = 3.4% - 2.8% = 0.6% (the only difference between the two 3-year bonds). For default risk: the two 10-year bonds differ by 7.1% - 4.6% = 2.5%, but the higher-yielding one is also illiquid (+0.6% liquidity premium), so the default-risk premium = 2.5% - 0.6% = 1.9%."},
    {"id":"q6","type":"open","prompt":"A nominal annual rate of 8% is compounded quarterly. What periodic rate and how many compounding periods per year would you use, and why does $10,000 invested this way grow to more than $10,800 after one year?","rubric":"Periodic rate = 8%/4 = 2% per quarter, with 4 periods per year. It beats a simple 8% because each quarter's interest itself earns interest (compounding): 10,000 x (1.02)^4 is about 10,824, an effective annual rate above 8%."}
  ]$ir_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'economics/introduction/interest-rates', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
