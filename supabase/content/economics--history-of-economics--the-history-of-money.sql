-- The History of Money — canonical master article, co-written and human-reviewed.
-- economics/history-of-economics/the-history-of-money @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts). The upsert only touches the row
-- when the body actually differs, and the delete below fires only then —
-- dropping the derived caches so the next request re-distills from the master.
--
-- A curated, human-reviewed quiz for this node is inserted at the bottom
-- (generated = true so the app serves it instead of auto-generating).

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'economics/history-of-economics/the-history-of-money',
    'research',
    'advanced',
    'read',
    $hm_master$> **Money** — anything widely accepted as payment for goods and services and in the settlement of debts. We take it for granted, but its usefulness is easiest to see by imagining a world that has none.

## Life without money: the barter economy

Picture an economy where the only way to obtain a good or a service is to hand over another good or service in return. Households, firms, even governments would pay for what they want with what they already have.

> **Barter economy** — an economy with no money, in which goods and services are exchanged directly for other goods and services.

It sounds workable, but barter creaks under four problems that quickly make anything beyond the simplest trade almost impossible.

**You both have to want what the other has.** A trade can happen only if each party wants precisely what the other is offering — a **double coincidence of wants**. The baker who needs shoes must find not just any shoemaker but a shoemaker who happens to want bread, right then, in the right quantity. Most days the search alone would cost more than the trade is worth.

**Many goods can't be split.** Suppose you want a neighbour's chicken and all you have to offer is a cow. The cow is worth far more than the chicken, but you cannot hand over a fraction of a living animal. When goods are **indivisible**, exchanges that ought to be easy simply cannot be made.

**Not everything keeps.** You might be content to hold your wealth until you need it — but only if what you are holding survives the wait. Grain, fish, and fruit spoil, and their value leaks away with them. Barter leaves those who deal in perishable goods no reliable way to **store value** for the future.

**There is no common yardstick.** In a barter economy every good is priced in every other good: oranges in pears, pears in loaves, loaves in litres of milk, milk back in oranges. With no single measure of value, comparing prices and planning trades becomes a tangle that grows worse with every extra good in the market.

## What money is for

Each of those problems has the same cure — one good that everyone will accept. That is what money is, and its usefulness is usually described as three jobs it does at once:

- As a **medium of exchange**, money ends the hunt for a double coincidence of wants: you sell your bread for money and spend the money on shoes, and the shoemaker need never want bread at all.
- As a **unit of account**, it supplies the common yardstick barter lacks — every price is quoted in one thing, so values can be compared at a glance.
- As a **store of value**, money that holds its worth lets you carry purchasing power into the future without your wealth rotting on the shelf.

Solve all four frictions of barter at a stroke, and it is no mystery why money took hold everywhere humans traded.

## Commodity money and the gold standard

The earliest monies were simply commodities valuable in their own right — above all, precious metals. A gold coin was worth something whether or not anyone treated it as money, and that intrinsic worth is exactly what made people willing to take it in exchange.

> **Commodity money** — money whose value derives from the valuable material it is made of, or from a commodity it can be redeemed for, such as gold or silver.

Even after state-issued and paper money appeared, that anchor to metal held for centuries. Under a **gold standard**, the money in circulation could be exchanged, on demand, for a fixed quantity of gold.

> **Gold standard** — a monetary system in which a unit of currency is convertible into a pre-specified amount of gold.

The Bank of England's notes were redeemable for gold right up until 1931: a holder could, in principle, present the paper at the bank and receive metal at a stated rate. But Britain — like most major economies in the first half of the twentieth century — eventually cut that tie, abandoning convertibility and, with it, the gold standard.

## Paper money: goldsmiths and promissory notes

How did paper come to stand in for metal in the first place? The path ran, improbably, through goldsmiths. People with more gold than they cared to guard began leaving it with the local goldsmith, who had the vaults to keep it safe, and taking away a written receipt recording how much was theirs to reclaim. Before long they realized the receipts themselves could do the work: rather than fetch the metal and physically hand it over, a buyer could simply pass the receipt to the seller.

> **Promissory note** — a written promise to pay a stated amount to whoever holds it, on demand. Redeemable for the gold behind it, such a note was paper money tied directly to a physical commodity.

This only worked on **trust**: the goldsmith held all the actual gold, while everyone else held slips of paper worth exactly as much as the goldsmith's word. Many of these goldsmiths — taking in wealth and issuing notes against it — grew into the first banks.

## How banks create money: fractional reserve banking

Then came the observation that changed everything. Watching the gold sit in the vault, the early banker noticed that customers almost never came for all of it at once. The notes circulated in the marketplace and ownership of the underlying gold shifted from hand to hand on paper, but the metal itself mostly just stayed put. So the portion unlikely to be withdrawn on any given day could be **lent to others** at interest — and here is the sleight of hand: the depositors still held notes they believed were fully backed, yet the same gold was now also out working as a loan. The bank had, in effect, created money.

> **Fractional reserve banking** — holding only a fraction of customers' deposits in reserve and lending out the rest, on the reasoning that not all customers will want their money back at the same time.

> **Money creation** — the expansion of the money supply that occurs when banks lend out deposits: the original depositor keeps their claim and the borrower gains spendable funds, so the money in circulation grows beyond the reserves that back it.

Just how much money the banking system can conjure this way turns on a single number: the share of deposits banks keep in reserve rather than lend. The smaller that reserve fraction, the more each deposit can be lent, re-deposited, and lent again — and the more money the system creates. It is a powerful engine, and a fragile one. It works only as long as customers' confidence that they can get their money back holds; let that confidence snap and everyone rushes for the vault at once — a **bank run** — and a bank that has lent out most of its reserves cannot pay them all.

## Fiat money and central banks

Today the goldsmith's role belongs to the state. In law, a single institution — usually a country's **central bank** — is granted a monopoly on issuing the currency.

> **Central bank** — the public institution (such as the Bank of England or the Federal Reserve) that holds the legal monopoly on issuing a nation's currency and stands behind its banking system.

At first these monopolists still promised metal: their notes could be converted into gold. Once convertibility was abandoned, money became something new — valuable not because it can be swapped for a commodity, but because the state declares it legal tender and everyone trusts that everyone else will go on accepting it.

> **Fiat money** — money that is not backed by, or convertible into, a commodity; its value rests instead on government decree and on the shared confidence that it will be accepted.

The fragility of fractional reserve banking is also why the central bank matters so much. Standing behind the ordinary banks as a **lender of last resort**, it can supply cash in a panic and keep a single bank run from cascading into a collapse of the whole system. Money's long journey — from bartered goods, to gold, to paper promises, to state-issued fiat — is, in the end, the story of an ever more efficient technology of *trust*.$hm_master$,
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
  select $hm_quiz$[
    {"id":"q1","type":"mcq","prompt":"In a barter economy, a trade can happen only if each party wants exactly what the other is offering. What is this requirement called?","options":["A double coincidence of wants","A common measure of value","The division of labor","A store of value"],"answerIndex":0,"explanation":"Barter needs a double coincidence of wants — the baker who wants shoes must find a shoemaker who also wants bread. Money removes this: you sell for money and spend it on anything, so no matching of wants is required."},
    {"id":"q2","type":"mcq","prompt":"Money serves as a unit of account. Which problem of a barter economy does that role directly solve?","options":["Some goods are indivisible","There is no common measure of value","Perishable goods do not store value","Buyers and sellers must want each other's goods"],"answerIndex":1,"explanation":"As a unit of account, money gives every good a price in one common thing, replacing the barter tangle of pricing each good in every other good. (The other options are solved by divisible money, money as a store of value, and money as a medium of exchange.)"},
    {"id":"q3","type":"mcq","prompt":"Under a gold standard, a nation's currency is:","options":["Printed only in strictly limited quantities","Convertible on demand into a fixed amount of gold","Backed by nothing but government decree","Issued only by private goldsmiths"],"answerIndex":1,"explanation":"A gold standard means the currency can be exchanged for a pre-specified amount of gold. The Bank of England's notes were redeemable for gold until Britain abandoned convertibility in 1931. Money backed by decree alone is fiat money."},
    {"id":"q4","type":"mcq","prompt":"Fractional reserve banking is best described as:","options":["Keeping 100% of deposits in the vault at all times","Holding only part of deposits in reserve and lending out the rest","Issuing bank notes fully backed by gold","Lending out only the bank's own capital, never deposits"],"answerIndex":1,"explanation":"Banks keep only a fraction of deposits on hand and lend the rest, betting that not everyone withdraws at once. That is what lets banks create money — and what makes a bank run dangerous if confidence breaks."},
    {"id":"q5","type":"open","prompt":"Explain how a bank 'creates money' when it takes in deposits and makes loans, and identify what limits how much money the banking system can create.","rubric":"When a bank lends out part of a deposit, the original depositor still holds a claim on their money while the borrower now has spendable funds too — so the total money in circulation grows beyond the reserves backing it (money creation). The limit is the reserve fraction: the share of deposits banks hold back rather than lend. The smaller that fraction, the more each deposit can be lent, re-deposited, and lent again, and the more money the system creates."},
    {"id":"q6","type":"open","prompt":"What is fiat money, and where does its value come from? How does that differ from commodity money and from money under a gold standard?","rubric":"Fiat money is not backed by or convertible into any commodity; its value comes from government decree (legal tender) plus the shared confidence that others will accept it. Commodity money (e.g., gold or silver coin) has intrinsic value from the material it is made of. Under a gold standard, paper money is convertible into a fixed amount of gold. Fiat money is what remains once that convertibility is cut — as Britain and other economies did in the early twentieth century."}
  ]$hm_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'economics/history-of-economics/the-history-of-money', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
