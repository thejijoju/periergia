-- Mathematics · Pre-Calculus Foundations — Arithmetic & Foundations —
-- "Counting".
-- Curated master for
-- mathematics/pre-calculus-foundations/arithmetic-and-foundations/counting
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node added to seed.ts in the same change, ahead of Number Systems.
--
-- The genuine first lesson of the whole mathematics tree. Shape of every
-- section: a rule in plain tutor language, worked examples talked through
-- step by step, then an infinite drill (three difficulty levels; opens on a
-- worked example whose solution is hidden until revealed).
--
-- Thirteen sections / fourteen drills:
--   1 counting (with 1-1 pairing said plainly)   -> count-objects
--   2 the next number                            -> count-on
--   3 how we write numbers (place value)         -> place-value
--   4 the pattern (0-99 grid; naturals vs wholes)-> hundredchart + count-on
--   5 saying numbers                             -> number-word
--   6 which is bigger                            -> compare-numbers
--   7 adding (stars first, number line, names
--     of the laws in a light aside)              -> make-ten, add-count-on
--   8 adding tens                                -> add-tens
--   9 adding big numbers (carrying)              -> column-add
--  10 subtracting (number lines incl. the 4-9
--     wall with steps owed dashed past zero)     -> sub-count-back
--  11 multiplying (interactive dot array)        -> skip-count
--  12 dividing: jumps-that-fit and sharing,
--     remainders, check-by-multiplying, and
--     divide-by-zero forbidden                   -> divide-groups
--  13 all four together                          -> mixed-arithmetic
--
-- Additions from review: division as the fourth pillar; number-line figures
-- for adding and subtracting (```numberline); the 5x3 dot array with a
-- turn-the-tray button (```dotarray); Peano-axioms framing so an adult
-- reader knows why lesson one is counting; crisp natural-vs-whole naming;
-- commutative law and identity elements named in light asides; a "Where
-- this goes" bridge (set theory, Peano, binary, negatives, modular
-- arithmetic). KaTeX output switched to html-only so copied text no longer
-- duplicates every formula.
--
-- ~4,050 words, 14 infinite drills, 7 checkpoint questions, 17 practice
-- problems with answers, 2 figures, 1 interactive grid, 3 number lines,
-- 1 dot array.
--
-- Numbers verified (python3): all practice answers including 15/3=5,
--   12/4=3, 30/5=6, 21/7=3, 40/10=4, 14 = 3x4+2, 54/6=9; column sums
--   32+21=53, 47+38=85, 286+457=743, 2343+3937=6280.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'mathematics/pre-calculus-foundations/arithmetic-and-foundations/counting',
    'research','advanced','read',
    $preCount_master$> Every part of this lesson works the same way: you see one example done for you, then it's your turn. The practice boxes never run out of questions — keep answering until it feels easy, then raise the difficulty, then move on.

And if counting seems too basic to bother with: when mathematicians rebuilt all of arithmetic from scratch (the **Peano axioms**, 1889), the entire foundation turned out to be two ideas — a starting number, and "add one". That is literally this lesson. Everything else is built on it.

## 1. Counting

Counting is pointing at things one at a time while saying "one, two, three, …". The last word you say is how many there are.

Said carefully: counting **pairs** every object with one number name, in order — nothing skipped, nothing counted twice. (That pairing idea seems obvious; it becomes one of the deepest tools in mathematics.)

**Example.** Count these stars:

$$\bigstar \quad \bigstar \quad \bigstar \quad \bigstar \quad \bigstar$$

Point at each one: "one, two, three, four, **five**." There are $5$ stars.

Here is the useful part: **it doesn't matter what order you count in.** Left to right, right to left, jumping around — you always get $5$. That means you can count in groups when there are too many to point at. Twenty marks is hard to count one by one, but easy as four groups of five: "five, ten, fifteen, **twenty**."

{{image: Tally marks | Counting written down: one stroke per thing, every fifth stroke crossing the group — so you read groups of five, not single strokes.}}

**Your turn.** The box below shows you one counted for you, then gives you rows to count yourself.

```drill
count-objects
```

## 2. The next number

Numbers never run out. Whatever number you say, there is always a next one: add $1$.

**Example.** What comes after $7$? Add one: $8$.

The only tricky moment is when a $9$ is involved:

**Example.** What comes after $39$? The $9$ can't go higher, so it flips back to $0$ and the $3$ goes up by one: $40$.

**Example.** What comes after $99$? Both $9$s flip to $0$ and a new $1$ appears in front: $100$.

Going down works the same way in reverse. What comes before $200$? The $0$s can't go lower, so they flip to $9$s and the $2$ drops: $199$.

**Your turn.**

```drill
count-on
```

## 3. How we write numbers

We only have ten digits: $0, 1, 2, 3, 4, 5, 6, 7, 8, 9$. So how do we write a number like three thousand?

The trick: **where a digit stands decides how much it is worth.** The rightmost digit counts ones. The next one left counts tens. Then hundreds, then thousands.

**Example.** Take $327$:

$$327 \;=\; 3 \text{ hundreds} + 2 \text{ tens} + 7 \text{ ones} \;=\; 300 + 20 + 7$$

**Example.** Take $4207$. The digits, from left to right: $4$ thousands, $2$ hundreds, $0$ tens, $7$ ones. So the $2$ here is worth $200$ — not $2$.

**What is the zero doing there?** It says "no tens" — and it *must* be written. Leave it out and $4207$ becomes $427$, a completely different number. The zero holds the other digits in their places.

**Example.** $37$, $307$ and $3007$ use the same non-zero digits, but the zeros make them three very different numbers: thirty-seven, three hundred seven, three thousand seven.

{{image: Abacus | Place value as a machine: one rod per place, one bead per unit. When a rod fills to ten it empties and pushes one bead onto the next rod — the 9 to 10 flip, made of wood.}}

**Your turn.**

```drill
place-value
```

## 4. The pattern in the numbers

Write the numbers ten to a row and something clicks: after $9$ comes a second row — $10, 11, 12, 13, \ldots$ — and it is just $0$ to $9$ again with a $1$ in front. The row after that is $0$ to $9$ with a $2$ in front. Every row, forever.

| | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 |
| 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 |

So there are not a hundred different numerals to learn. There are **ten digits**, reused: going **across** a row, the ones digit counts $0$ to $9$; going **down** a column, the tens digit climbs by one.

Try it yourself below — switch the highlighting and watch the pattern change from columns to rows:

```hundredchart
```

Two things worth noticing on the grid:

- **Adding $1$ moves you one step right.** At the end of a row, you wrap to the start of the next — that's the $9 \to 10$ flip from section 2.
- **Adding $10$ moves you one step straight down.** The ones digit stays put; only the tens digit changes. Remember this — it comes back in section 8.

One more thing, because it trips people up: $47$ is **one number**, not "a $4$ and a $7$". Every cell in that grid is a single number.

And the names, precisely, because both get used later: $1, 2, 3, \ldots$ are the **counting numbers** — mathematicians call them the **natural numbers**. Put $0$ in as well and you have the **whole numbers** $0, 1, 2, 3, \ldots$, also called the non-negative integers. The only difference between the two lists is the zero.

**Your turn.**

```drill
count-on
```

## 5. Saying numbers out loud

To read a number aloud, say the places from biggest to smallest.

**Example.** $342$: "three hundred forty-two" — three hundreds, four tens, two ones.

**Example.** $607$: "six hundred seven." Notice nothing is said for the tens — but when *writing* it, the $0$ must still be there, or it collapses to $67$.

Writing what you hear works the same in reverse:

**Example.** "Two thousand nine" → a $2$ in the thousands, nothing in the hundreds or tens, a $9$ in the ones → $2009$. The silent places become zeros.

The only irregular part of English numbers is the teens: "eleven, twelve, thirteen…" don't follow the pattern and just have to be known.

**Your turn.**

```drill
number-word
```

## 6. More, fewer, or the same?

Which row has more stars?

$$\text{A: } \bigstar\;\bigstar\;\bigstar\;\bigstar\;\bigstar\;\bigstar \qquad\qquad \text{B: } \bigstar\;\bigstar\;\bigstar\;\bigstar$$

You don't even need to count. **Pair them off** — one star from A with one star from B — and see which row runs out first. B runs out with two stars of A left over, so A has more. (This is the pairing idea from section 1, doing its first real job.)

Counting gives the same verdict: A has $6$, B has $4$, and $6$ is bigger because you reach it *later* when counting up. That's what "bigger" means.

We write it with three symbols — and the wide open end always faces the bigger number:

$$4 < 6 \quad (4 \text{ is less than } 6) \qquad 6 > 4 \quad (6 \text{ is greater than } 4) \qquad 5 = 5 \quad (\text{equal})$$

For big written numbers, counting up to them is hopeless — place value does it instead:

**Example.** $999$ or $1000$? The one with more digits is bigger: $1000$.

**Example.** Same number of digits — $4812$ or $4806$? Compare digit by digit **from the left**, and stop at the first difference:

- thousands: $4$ vs $4$ — same, keep going
- hundreds: $8$ vs $8$ — same, keep going
- tens: $1$ vs $0$ — different. Stop.

$1$ beats $0$, so $4812 > 4806$. The ones digits never mattered: a difference in a bigger place always outweighs everything after it.

**Your turn.** The gentle level is star rows — no digits at all. Then written numbers, then long near-ties.

```drill
compare-numbers
```

## 7. Adding

Adding is putting two piles together and counting the result:

$$\bigstar\,\bigstar \;+\; \bigstar\,\bigstar\,\bigstar \;=\; \bigstar\,\bigstar\,\bigstar\,\bigstar\,\bigstar$$

Two stars and three stars make five stars: $2 + 3 = 5$. In practice you don't recount the whole pile — you **count on**: start at the first number and keep counting.

**Example.** $1 + 1$: start at $1$, count on one more: "$2$". So $1 + 1 = 2$.

**Example.** $6 + 3$: start at $6$, count on three: "$7, 8, 9$". So $6 + 3 = 9$. On a number line, that's three hops to the right:

```numberline
6+3
```

**Example.** $2 + 9$: you could count on nine times… or flip it. $2 + 9$ is the same as $9 + 2$: "$10, 11$". Done. **Order never matters in addition**, so always start from the bigger number.

*(The official names, for later: "order never matters" is the **commutative law** of addition, and because $7+0=7$, zero is called the **identity** for addition. You'll meet both again in algebra — here they're just facts about piles.)*

The pairs that add to $10$ are worth knowing by heart, because ten is where our number system turns over:

$$1+9 \qquad 2+8 \qquad 3+7 \qquad 4+6 \qquad 5+5$$

**Your turn — first, complete the ten.**

```drill
make-ten
```

**Bigger numbers, small steps.** $22 + 5$: only the ones digit moves — $2+5=7$, so $22+5=27$.

And when the ones would go past ten, cross in two steps, landing on the round number first:

**Example.** $28 + 7$: from $28$, add $2$ to reach $30$, then the remaining $5$: $35$.

**Example.** $47 + 8$: add $3$ to reach $50$, then $5$ more: $55$.

**Your turn.**

```drill
add-count-on
```

## 8. Adding tens

Remember the grid: adding $10$ is one step straight down. The ones digit doesn't move at all.

**Example.** $10 + 20$. Think in tens: $1$ ten $+$ $2$ tens $= 3$ tens $= 30$. It's just $1+2=3$, shifted one place left.

**Example.** $45 + 30$: the tens are $4+3 = 7$, the $5$ ones ride along untouched: $75$.

**Example.** $70 + 60$: $7+6 = 13$ tens. Ten of those tens make a hundred — so $130$. Ten tens make a hundred exactly the way ten ones make a ten.

**Your turn.**

```drill
add-tens
```

## 9. Adding big numbers

Put the last two sections together and you can add **anything**: add the ones to the ones, the tens to the tens, the hundreds to the hundreds — always starting from the right.

**Example.** $32 + 21$: ones are $2+1=3$, tens are $3+2=5$. So $53$. No column reached ten, so nothing to carry.

**Example.** $47 + 38$: ones are $7+8=15$ — that's ten-and-five, so write the $5$ and **carry** the ten into the tens column. Tens: $4+3$, plus the carried $1$, is $8$. So $85$. A carry is just the $9{\to}10$ flip again: ten in one column becomes one in the next.

**Example.** $2343 + 3937$: ones $3+7=10$, write $0$ carry $1$; tens $4+3+1=8$; hundreds $3+9=12$, write $2$ carry $1$; thousands $2+3+1=6$. Answer: $6280$. The method never changes, however long the numbers get.

**Your turn.** Level one has no carries; level three has numbers in the ten-thousands.

```drill
column-add
```

## 10. Subtracting

Subtracting is counting **back**.

**Example.** $9 - 4$: start at $9$, count back four: "$8, 7, 6, 5$". You land on $5$. So $9 - 4 = 5$. Same hops as addition, pointed the other way:

```numberline
9-4
```

**Check your answer** by adding it back: $5 + 4 = 9$. ✓ If the check fails, the subtraction was wrong. Every subtraction can be checked this way.

Sometimes counting back is the slow way round:

**Example.** $52 - 48$. Counting back $48$ steps? No. Ask instead: *how far is it from $48$ up to $52$?* "$49, 50, 51, 52$" — four steps. So $52 - 48 = 4$. Same answer, four steps instead of forty-eight. **Count back or count up — take whichever is shorter.**

One warning: in addition, order didn't matter. Here it does. $9 - 4 = 5$, but $4 - 9$ is a different question — start at $4$, count back nine — and after four steps you hit the wall:

```numberline
4-9
```

You've run out of numbers with five steps still to go. Among the counting numbers, $4 - 9$ simply **has no answer**. The picture almost begs the fix: *let the line keep going past zero.* That is exactly what the next lesson does.

**Your turn.**

```drill
sub-count-back
```

## 11. Multiplying

Multiplying is counting in equal jumps.

**Example.** $5 \times 3$ means five jumps of three: "$3, 6, 9, 12, 15$". So $5 \times 3 = 15$. (It's the same as $3+3+3+3+3$ — just faster to say.)

**Example.** Why is $3 \times 5$ also $15$? Don't picture it — do it:

```dotarray
5x3
```

Same dots, nothing added, nothing removed. **Order never matters in multiplication either** *(the commutative law again)*.

Two easy special cases: $7 \times 1 = 7$ (one jump of seven — which makes $1$ the identity for multiplication, as $0$ was for addition), and $7 \times 0 = 0$ (no jumps at all).

**Your turn.**

```drill
skip-count
```

## 12. Dividing

One question remains: multiplication in reverse. $5 \times 3 = 15$ says five jumps of three reach fifteen. Division asks it backwards: **how many jumps of three does it take to reach fifteen?**

**Example.** $15 \div 3$: count jumps of three — "$3, 6, 9, 12, 15$" — that's $5$ jumps. So $15 \div 3 = 5$.

There is a second way to read the same question: **sharing**. Deal $15$ things into $3$ equal piles and each pile gets $5$. Both readings give the same answer, and both are counting.

**Example.** $30 \div 5$: jumps of five — "$5, 10, 15, 20, 25, 30$" — six jumps. So $30 \div 5 = 6$.

**Check by multiplying back**, the way subtraction checks by adding back: $6 \times 5 = 30$. ✓

Sometimes the jumps don't land exactly:

**Example.** $14 \div 4$: jumps of four — "$4, 8, 12$" — three jumps, and the next one would overshoot. Three whole jumps with $2$ left over: $14 \div 4 = 3$ **remainder** $2$. Check: $3 \times 4 + 2 = 14$. ✓

And one question is forbidden: $15 \div 0$ asks "how many jumps of size zero reach fifteen?" — no number of zero-jumps gets anywhere, so **dividing by zero has no answer**. Ever.

**Your turn.**

```drill
divide-groups
```

## 13. All four together

Everything in this lesson is counting, walked four different ways:

| operation | what you do | example |
|---|---|---|
| add | count on | $6+3=9$ |
| subtract | count back | $9-4=5$ |
| multiply | count in jumps | $5\times3=15$ |
| divide | count how many jumps fit | $15\div3=5$ |

This last practice box mixes all four, so you must first recognise which one you're looking at. Stay on it the longest.

```drill
mixed-arithmetic
```

```checkpoint
q: You count a row of stones left to right and get 12. A friend counts the same row right to left. What will they get?
a*: 12 — the count doesn't depend on the order.
a: It depends which stone they start from.
x: It doesn't. Whichever stone is first, every stone still gets counted exactly once, so the last counting word said is the same.
a: 11, because they started from a different end.
x: Changing direction doesn't add or remove a stone. Each of the twelve is still counted exactly once.
a: You can't know without counting again.
x: You can. Because the count doesn't depend on order, one correct count settles it for every order — that's also why counting in groups of five works.
hint: Are the same stones still being counted, exactly once each?
why: Counting in a different order changes which word lands on which stone, not how many words get used. The final word — the answer — is the same.

---

q: What number comes immediately after 999?
a*: 1000
a: 9910
x: The digits aren't separate labels. Each 9 flips to 0 and passes one to the left, and a new 1 appears in front.
a: 9100
x: Work the flips through: ones 9→0 carry, tens 9→0 carry, hundreds 9→0 carry, new digit in front: 1000.
a: There is no next number — 999 is the last three-digit number.
x: Running out of three-digit numbers just opens a fourth digit. Numbers never run out.
hint: What happens to a digit that is already at 9?
why: 999 + 1 = 1000. Every 9 flips to 0 and carries left; when the leftmost does it, a new digit appears in front.

---

q: In the number 4,207, what is the digit 2 worth?
a*: 200
a: 2
x: That's the digit itself, not its value. A digit is worth itself times its place — and this 2 stands in the hundreds place.
a: 20
x: That would be the tens place. From the right: 7 is ones, 0 is tens, 2 is hundreds, 4 is thousands.
a: 2,000
x: That's the thousands place, where the 4 stands. The 2 is one place to its right.
hint: Count the places from the right: ones, tens, hundreds, thousands.
why: 4207 = 4 thousands + 2 hundreds + 0 tens + 7 ones, so the 2 is worth 200. The 0 says "no tens" — and must be written, or the number collapses to 427.

---

q: Why does knowing $6 + 3 = 9$ mean you also know $3 + 6$?
a*: Combining two piles and counting the result can't depend on which pile you count first.
a: Because 6 and 3 are both single digits.
x: Size has nothing to do with it — $148 + 27$ and $27 + 148$ agree for exactly the same reason.
a: It's a separate fact that happens to have the same answer.
x: It's not luck. Pour two handfuls of stones into one pile: the pile doesn't know which handful arrived first, so the total is the same either way.
a: Because subtraction reverses addition.
x: True but beside the point — and note subtraction does NOT share this property: $9-4$ and $4-9$ are not the same.
hint: Two handfuls of stones poured into one pile.
why: Addition is counting a combined pile, and a count doesn't depend on order. So a + b = b + a, always — which is why you may always start from the bigger number.

---

q: What is $4 - 9$?
a*: It has no answer among the counting numbers.
a: 5
x: That's $9 - 4$. In subtraction, order matters.
a: 0, because you can't go below nothing.
x: Counting back from 4 does reach 0 after four steps — but five steps are still owed. Stopping early isn't an answer.
a: −5, obviously.
x: That's the right answer in a bigger number system — which is exactly where the next lesson goes. Among the counting numbers, no such number exists.
hint: Start at 4 and try to count back nine steps.
why: You run out of numbers with five steps still to go. The question has no answer HERE — and repairing that gap is what the next lesson is about.

---

q: A tray has 5 rows of 3 cups. Turn the tray a quarter turn. What do you see, and what does it prove?
a*: 3 rows of 5 — proving $5 \times 3 = 3 \times 5$, since no cup was added or removed.
a: The same 5 rows of 3.
x: Turn it: the rows become columns. What was 5 rows of 3 reads as 3 rows of 5.
a: It proves multiplication is repeated addition.
x: That's true, but it's not what the turn shows. The turn is about the ORDER of the two numbers being multiplied.
a: Nothing — the two arrangements are different problems.
x: They're the same cups. Turning a tray adds nothing and removes nothing, so both descriptions count the same 15.
hint: Does turning a tray change how many cups are on it?
why: Rotating turns "5 rows of 3" into "3 rows of 5" without touching a cup, so both count the same 15. That picture is the whole proof that order doesn't matter in multiplication.

---

q: What question does $15 \div 3$ ask?
a*: How many jumps of 3 it takes to reach 15.
a: What is left when 3 is taken from 15.
x: That's subtraction — $15 - 3 = 12$, one step back. Division asks about repeated jumps, not a single one.
a: What 15 jumps of 3 add up to.
x: That's multiplication — $15 \times 3 = 45$. Division runs that question in reverse: the total is known, the number of jumps is not.
a: Nothing — 15 and 3 can't be divided.
x: They can, exactly: jumps of 3 land on 3, 6, 9, 12, 15 — five jumps, no leftover. So $15 \div 3 = 5$.
hint: Division is multiplication read backwards.
why: $15 \div 3$ asks how many jumps of 3 reach 15: "3, 6, 9, 12, 15" — five. Equivalently, 15 shared into 3 equal piles puts 5 in each. Check by multiplying back: $5 \times 3 = 15$. ✓
```

## Practice

Do these on paper, then check against the answers below.

**1.** Count in fives: how many full groups of five are in $17$ marks, and how many are left over?

**2.** What comes just after each: $8$, $19$, $59$, $99$, $149$, $999$, $4999$?

**3.** What comes just before each: $30$, $100$, $210$, $700$, $1000$, $5000$?

**4.** Break into place values (like $327 = 300 + 20 + 7$): **(a)** $726$ **(b)** $5073$ **(c)** $90210$.

**5.** What is the $6$ worth in: **(a)** $613$ **(b)** $4269$ **(c)** $60142$?

**6.** Write in words: $19$, $70$, $305$, $1040$. Write as numerals: "four hundred six", "two thousand nine".

**7.** Put $<$, $=$ or $>$ between: **(a)** $88$ and $91$ **(b)** $4812$ and $4806$ **(c)** $999$ and $1000$ **(d)** $370$ and $307$.

**8.** Add: $1+1$, $6+3$, $9+4$, $7+0$, $8+8$, $28+7$, $47+8$, $66+9$.

**9.** What must be added to make $10$: $3$, $7$, $1$? To make $100$: $40$, $65$, $92$?

**10.** Add tens: $10+20$, $30+40$, $50+50$, $45+30$, $62+20$, $70+60$.

**11.** Column addition: $32+21$, $47+38$, $286+457$, $2343+3937$.

**12.** Subtract, and say for each whether counting back or counting up is quicker: $9-4$, $10-6$, $15-7$, $52-48$, $100-97$.

**13.** Multiply: $5\times3$, $3\times5$, $7\times1$, $7\times0$, $6\times4$, $9\times8$.

**14.** Continue each pattern three more steps: **(a)** $4, 8, 12, \ldots$ **(b)** $7, 14, 21, \ldots$ **(c)** $25, 50, 75, \ldots$

**15.** Divide: $15\div3$, $12\div4$, $30\div5$, $21\div7$, $40\div10$, and $14\div4$ (give the remainder).

**16.** Mixed: $12+9$, $20-8$, $8\times7$, $63-9$, $54\div6$, $45+7$.

**17.** In one sentence: why does $4-9$ have no answer in this lesson?

### Answers

**1.** $3$ groups, $2$ left over.
**2.** $9,\ 20,\ 60,\ 100,\ 150,\ 1000,\ 5000$.
**3.** $29,\ 99,\ 209,\ 699,\ 999,\ 4999$.
**4.** (a) $700+20+6$ (b) $5000+0+70+3$ (c) $90000+200+10+0$.
**5.** (a) $600$ (b) $60$ (c) $60000$.
**6.** nineteen; seventy; three hundred five; one thousand forty. $406$; $2009$.
**7.** (a) $<$ (b) $>$ (c) $<$ (d) $>$.
**8.** $2,\ 9,\ 13,\ 7,\ 16,\ 35,\ 55,\ 75$.
**9.** $7,\ 3,\ 9$; then $60,\ 35,\ 8$.
**10.** $30,\ 70,\ 100,\ 75,\ 82,\ 130$.
**11.** $53,\ 85,\ 743,\ 6280$.
**12.** $5,\ 4,\ 8,\ 4,\ 3$ — counting up is quicker for $52-48$ and $100-97$, counting back for the rest.
**13.** $15,\ 15,\ 7,\ 0,\ 24,\ 72$.
**14.** (a) $16, 20, 24$ (b) $28, 35, 42$ (c) $100, 125, 150$.
**15.** $5,\ 3,\ 6,\ 3,\ 4$; and $3$ remainder $2$.
**16.** $21,\ 12,\ 56,\ 54,\ 9,\ 52$.
**17.** Counting back nine from four runs out of numbers after four steps — no counting number is the answer. (The next lesson fixes this.)

## Where this goes

Every idea in this lesson grows into a whole field. For the curious — nothing here is needed yet:

- **Counting as pairing** becomes *set theory*, where the same pairing trick compares infinite collections — and proves some infinities are bigger than others.
- **"Add one" and a starting point** are the *Peano axioms* — the official foundation all of arithmetic is rebuilt from.
- **Carrying** is base-ten positional notation; computers run the identical system with two digits instead of ten (*binary*).
- **$4 - 9$ has no answer** forces the negative numbers — the next lesson, and the first step on a ladder that ends at the complex numbers.
- **Remainders** become *modular arithmetic*, the mathematics behind clocks, calendars and internet cryptography.

## Further reading

{{book: Georges Ifrah | The Universal History of Numbers | 2000}} — how every civilisation wrote numbers, and why zero took so long.

{{book: Karl Menninger | Number Words and Number Symbols | 1969}} — where "eleven" and "twelve" come from.

{{book: Denise Schmandt-Besserat | How Writing Came About | 1996}} — counting with clay tokens came before writing itself.
$preCount_master$,
    true, true
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
