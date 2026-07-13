-- Rates of Return — canonical master article, co-written and human-reviewed.
-- economics/introduction/rates-of-return @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts). The upsert only touches the row
-- when the body actually differs, and the delete below fires only then —
-- dropping the derived caches so the next request re-distills from the updated
-- master. Replaying an unchanged file is a complete no-op.
--
-- The article embeds interactive ```example blocks (arithmetic-mean,
-- geometric-mean, harmonic-mean, trimmed-mean, winsorized-mean) which the Reader
-- renders as "Your turn" practice boxes (see src/components/WorkedExample.tsx).
--
-- A curated, human-reviewed quiz for this node is inserted at the bottom
-- (generated = true so the app serves it instead of auto-generating).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'economics/introduction/rates-of-return',
    'research',
    'advanced',
    'read',
    $ror_master$> **Return** — what an investment earns over a period: the income it pays out plus any change in its price. Alongside risk, it is one of the two characteristics used to describe any financial asset.

## What a return is: income and capital gains

Financial assets are usually described by two things — their **return** and their **risk**. On the return side, an asset can generate money in two ways:

- **Periodic income** — cash paid out while you hold it: dividends on a share, coupon interest on a bond.
- **Capital gain (or loss)** — the change in the asset's price between buying it and selling it.

Take a share bought at \$50. Over a year it pays \$2 in dividends and its price rises to \$54. The income piece is the \$2 dividend; the capital gain is \$54 − \$50 = \$4. Together — \$6 earned on a \$50 outlay — they make up the share's **total return**:

$$\text{Total return} = \underbrace{\frac{\$2}{\$50}}_{\text{income yield}} + \underbrace{\frac{\$54 - \$50}{\$50}}_{\text{price return}} = 4\% + 8\% = 12\%$$

(The same return can be written three equivalent ways — as a decimal, 0.12; a fraction, 12/100; or a percent, 12% — they are all the same number.)

Many assets deliver only one of the two. Some return **through price alone**: a non-dividend-paying growth stock, or a **zero-coupon bond** bought below face value and redeemed at par — pay \$920 for one and collect \$1,000 a year later and the whole ≈8.7% return is capital gain, with no income along the way. Others return **through income alone**: a defined-benefit pension or a lifetime annuity pays a stream of cash but leaves you no appreciating asset to sell; a bank deposit of \$1,000 that earns \$30 of interest while the \$1,000 principal stays put returns 3%, all of it income.

## Holding-period return: one period at a time

> **Holding-period return (R)** — the total return from holding an asset over one specified period, whether that period is a day, a week, a month, five years, or any span you choose.

There is nothing exotic in the formula. The price part is just the everyday way of turning any one-period change into a percentage — *how much it moved, divided by where it started*:

$$\text{percentage change} = \frac{\text{ending value} - \text{starting value}}{\text{starting value}}$$

Apply that to the asset's price, then add any income it paid, all measured against the price you started with — where $P_0$ is the price paid at $t=0$, $P_1$ the price sold at $t=1$, and $I_1$ the income received at $t=1$:

$$R = \frac{(P_1 - P_0) + I_1}{P_0}$$

For the share above — bought at \$50, sold at \$54, having paid \$2 in dividends — that is:

$$R = \frac{(\$54 - \$50) + \$2}{\$50} = \frac{\$4 + \$2}{\$50} = \frac{\$6}{\$50} = 12\%$$

The two pieces are easiest to read separately, each divided by the same \$50 you put in: the price rose \$4, a **price return** of \$4/\$50 = 8%; the \$2 dividend is an **income yield** of \$2/\$50 = 4%; together, 8% + 4% = 12%. (Had the dividend been \$4 instead of \$2, the income yield would be 8% and the total 16% — the income moves the total one-for-one.)

One simplification hides in that tidy 12%: we assumed the \$2 dividend arrives right at the *end* of the year. In real life it often lands earlier. If you pocket the \$2 partway through and put it back to work for the rest of the year, it earns a little extra on its own — nudging your true return just above 12%. That bonus is **reinvestment**, better known as compounding: money you earn early starts earning too.

A single-period return like this is unambiguous: there is only one way to compute it. Stretch the horizon across several periods, though, and those single-period returns can be stitched together in more than one way — so being clear about *which* method is in use is what keeps multi-period returns from becoming confusing.

## Returns over multiple periods

A single-period return covers one span. To describe performance across several consecutive periods, you can either **chain** the periods into one cumulative figure or **average** them into a per-period summary.

**Chaining (the cumulative return).** Because returns compound, consecutive returns combine by *multiplying* their growth factors, not by adding them. Three annual returns $R_1, R_2, R_3$ chain into a three-year holding-period return:

$$R = (1 + R_1)(1 + R_2)(1 + R_3) - 1$$

For example, yearly returns of 10%, −5%, and 20% compound to $(1.10)(0.95)(1.20) - 1 = 25.4\%$ over the three years — a touch more than the 25% you'd get by naively adding them, because each year's gain builds on the last.

**Averaging.** Often you want one representative per-period number instead. Returns reported over different spans first have to be put on a common footing (daily, monthly, or annual), and then there is more than one way to average them — the right choice depends on the data.

### Arithmetic mean return

The simplest summary is the plain average: add the per-period returns and divide by how many there are.

$$\bar{R}_i = \frac{R_{i1} + R_{i2} + \dots + R_{iT}}{T} = \frac{1}{T}\sum_{t=1}^{T} R_{it}$$

Here $R_{it}$ is asset $i$'s return in period $t$, and $T$ is the number of periods. For instance, three yearly returns of −40%, 25%, and 30% average to $(-40 + 25 + 30)/3 = 5\%$ per year. The arithmetic mean is easy to compute and has well-understood statistical properties.

One assumption is baked in, though: the arithmetic mean treats every period as if you began it with the **same amount invested**. Real portfolios don't behave that way — a gain leaves you more to put to work next period, a loss leaves you less — so for the growth *actually* achieved on a compounding balance, the geometric mean (below) tells the truer story.

```example
arithmetic-mean
```

### Geometric mean return

Recall the one assumption baked into the arithmetic mean: it treats every period as if you began it with the **same amount invested**. A real portfolio never behaves that way. Even with no money paid in or taken out, the base you start each year with keeps changing — the previous year's earnings are added to the beginning value of the next year's investment, and then earn a return of their own. Those earnings get **compounded** by the return of the year that follows. The arithmetic mean is blind to this, which is exactly why it overstates the growth of a fluctuating investment. The geometric mean return is built to account for that compounding — and since few people outside finance have a firm grip on the word, it's worth being crystal clear:

> **Compounding** — earning a return on your past returns, not just on your original stake. Earnings you leave invested become part of next period's base and go on to earn more themselves.

A quick picture. Put \$100 in at 10% a year. After year one you have \$110 — a \$10 gain. In year two the 10% is applied to the whole \$110, not the original \$100, so you earn \$11 and finish at \$121. That extra \$1 is a return *on last year's return*. Leave it running and the snowball grows: earnings earn earnings.

Rather than adding the returns and dividing, the geometric mean chains their growth factors and takes the $T$-th root. It is written $\bar{R}_{Gi}$ (the *G* for geometric, the *i* for asset $i$), and over $T$ periods it is:

$$\bar{R}_{Gi} = \sqrt[T]{(1 + R_{i1})(1 + R_{i2}) \times \dots \times (1 + R_{i,T-1})(1 + R_{iT})} - 1 = \sqrt[T]{\prod_{t=1}^{T} (1 + R_{it})} - 1$$

where $R_{it}$ is the return in period $t$, $T$ is the total number of periods, and the subscript $i$ simply labels *which* asset the return belongs to — so $R_{it}$ reads "asset $i$'s return in period $t$." (When only one investment is on the table, the $i$ is often dropped and you'll see plain $R_t$.) The $\prod$ (capital pi) is just shorthand for "multiply them all together," the product-operator twin of the $\sum$ we used for the arithmetic mean — the same formula written the long way and the short way.

It answers a precise question: *what single, steady annual return would have grown my money to the same ending amount?* Take the same three years as before — −40%, 25%, and 30%. Chained, one dollar grows by $(0.60)(1.25)(1.30) = 0.975$ — actually a small overall **loss**. The geometric mean is therefore:

$$\bar{R}_{Gi} = \sqrt[3]{(0.60)(1.25)(1.30)} - 1 = \sqrt[3]{0.975} - 1 \approx -0.8\%\ \text{per year}$$

against the arithmetic mean's $(-40 + 25 + 30)/3 = +5\%$. The gap is no fluke: the −40% year shrinks the base that every later gain compounds on, so the money genuinely earned less than the simple average implied. Whenever returns vary from period to period the geometric mean sits **at or below** the arithmetic mean, and the more they swing, the wider that gap grows.

This is why the geometric mean is the standard for reporting investment performance: it gives a more accurate representation of the growth in a portfolio's value over a given period than the arithmetic mean does. The arithmetic mean answers "what was a typical year's return?"; the geometric mean answers the question an investor actually cares about — "what rate did my money truly compound at?"

```example
geometric-mean
```

### Harmonic mean

The arithmetic and geometric means summarize *returns*. When what you're averaging is a set of **rates or ratios** — prices paid per share, say — a third mean fits better. The **harmonic mean** divides the number of observations by the sum of their reciprocals:

$$\bar{X}_H = \frac{n}{\dfrac{1}{X_1} + \dfrac{1}{X_2} + \dots + \dfrac{1}{X_n}} = \frac{n}{\sum_{i=1}^{n} \frac{1}{X_i}}$$

where $X_i$ is the $i$-th value being averaged (here, a share price), $n$ is how many there are, and $\frac{1}{X_i}$ is its reciprocal. Its natural home is **fixed-dollar investing** (dollar-cost averaging): buy the same dollar amount each period and your *average cost per share* is exactly the harmonic mean of the prices you paid — never the simple average. Because a fixed sum buys more shares when prices are low and fewer when they're high, the harmonic mean always comes in at or below the arithmetic mean, which is precisely the cost advantage the strategy is after.

```example
harmonic-mean
```

### Trimmed and winsorized means

Both of these tame **outliers** — a single freak observation that would otherwise drag an average around. Say returns are sorted from lowest to highest. A **trimmed mean** simply *removes* a set fraction from each end before averaging: a 20% trimmed mean of five numbers drops the lowest and the highest, then averages the middle three. A **winsorized mean** keeps every observation but *caps* the extremes — it replaces the lowest with the next value up and the highest with the next value down, then averages all of them. The difference in one line: trimming **discards** the extremes; winsorizing **pulls them in** to the nearest value it keeps.

```example
trimmed-mean
```

```example
winsorized-mean
```

Which mean to reach for turns on the shape of the data: whether extreme outliers are present, whether those outliers are ones you actually want to keep or discard, whether you're averaging returns (geometric) or ratios (harmonic), and whether the quantities compound.

## Money-weighted and time-weighted return

> **Money-weighted return** — the return an investment actually delivers once the size and timing of every cash flow moving into and out of it are taken into account.

> **Time-weighted return** — the compound growth rate of a single unit of currency left invested in a portfolio over a stated measurement period.

Because it ignores *when* money enters or leaves, the time-weighted return isn't distorted by the size or timing of cash flows. That is exactly why it's the preferred yardstick for judging portfolio managers: deposits and withdrawals are usually the client's decisions, not the manager's, so a manager should be measured on the growth of the money actually at work — not on flows outside their control.

## Gross return vs. net return

> **Gross return** — an investment's return before management and administrative fees (the costs not tied directly to generating the return) are deducted.

Because those fees differ from one firm to the next, stripping them out puts managers on a level footing — which makes gross return the fairer basis for comparing one asset manager against another.

> **Net return** — the gross return with management and administrative fees subtracted; what the investor is actually left holding.

If gross return is the fairest way to compare *managers*, net return is the truest picture of the *investor's* own experience — the fees a gross figure sets aside are money that never reaches their pocket.

## After-tax and real returns

> **After-tax nominal return** — the total return once taxes on dividends, interest, and realized gains have been deducted.

Tax is the next bite after fees: the income an investment throws off and the gains you actually realize are generally taxable, so what you keep shrinks again below the net figure.

> **Real return** — a nominal return with the effect of inflation stripped out, leaving the true gain in purchasing power.

Removing inflation is what makes real returns so useful for comparison. Because inflation runs at different rates from one year to the next, only after stripping it out can returns from different periods be judged on equal terms — and it likewise helps when weighing asset classes that are taxed differently, by putting their after-inflation performance on a common footing.

## Leveraged return

> **Leveraged return** — the return on a position built with borrowed money or derivatives such as futures, so that gains and losses are both amplified relative to the capital actually put up.

Leverage cuts both ways. Because you're controlling more than your own cash, a favourable market move is magnified into a larger gain — and an adverse move into a correspondingly larger loss. The upside and the downside scale together, which is what makes leverage powerful and dangerous in equal measure.

---

Return is what an investment *earns*; an [interest rate](/learn/economics/introduction/interest-rates) is the price of money over *time*. A required rate of return is itself an interest rate — which is where these two companion topics meet.$ror_master$,
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
  select $ror_quiz$[
    {"id":"q1","type":"mcq","prompt":"An asset can earn a return through periodic income, through capital gains, or through both. Which of the following earns its return through PRICE CHANGE ALONE?","options":["A non-dividend-paying growth stock","A savings account paying monthly interest","A bond that pays regular coupons","A share that pays a quarterly dividend"],"answerIndex":0,"explanation":"A non-dividend growth stock pays no cash while you hold it, so its entire return is the change in its price. The other three all throw off periodic income (interest, coupons, dividends)."},
    {"id":"q2","type":"mcq","prompt":"You buy a share for $40, collect a $1 dividend during the year, and sell it for $45. Your holding-period return is closest to:","options":["10.0%","12.5%","15.0%","2.5%"],"answerIndex":2,"explanation":"HPR = ((P1 - P0) + income) / P0 = ((45 - 40) + 1) / 40 = 6 / 40 = 15%. That splits into a 12.5% price return and a 2.5% income yield."},
    {"id":"q3","type":"mcq","prompt":"When a series of annual returns varies from year to year, how does the geometric mean return compare with the arithmetic mean?","options":["Always higher","Always exactly equal","At or below the arithmetic mean","Unrelated to the arithmetic mean"],"answerIndex":2,"explanation":"Whenever returns vary, the geometric mean is at or below the arithmetic mean (they are equal only if every period's return is identical). The geometric mean reflects the actual compounded growth; the wider the swings, the bigger the gap."},
    {"id":"q4","type":"mcq","prompt":"An investment returns +50% in year one and −50% in year two. Its geometric mean (compound annual) return is closest to:","options":["0%","-13.4%","-25%","+13.4%"],"answerIndex":1,"explanation":"Chain the growth factors: (1.50)(0.50) = 0.75, so $1 becomes $0.75 — a real loss. The geometric mean is sqrt(0.75) - 1 is about -13.4% per year, even though the arithmetic mean is (50 - 50)/2 = 0%."},
    {"id":"q5","type":"open","prompt":"A client moves large sums into and out of a fund at times the manager doesn't control. To judge the MANAGER's skill, would you use the time-weighted or the money-weighted return, and why?","rubric":"Time-weighted return. It measures the compound growth of one unit of currency left invested and ignores the size and timing of cash flows. Since deposits and withdrawals are the client's decisions, not the manager's, the manager should be judged on the growth of money actually at work — which is exactly what the time-weighted return isolates. The money-weighted return would be distorted by the client's flows."},
    {"id":"q6","type":"open","prompt":"Starting from an investment's gross return, name in order the three deductions/adjustments that take you down to the real return an investor keeps, and say what each one strips out.","rubric":"(1) Net return = gross return minus management and administrative fees. (2) After-tax nominal return = net return minus taxes on dividends, interest, and realized gains. (3) Real return = after-tax nominal return with inflation stripped out, leaving the gain in purchasing power. Order: fees, then taxes, then inflation."}
  ]$ror_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'economics/introduction/rates-of-return', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
