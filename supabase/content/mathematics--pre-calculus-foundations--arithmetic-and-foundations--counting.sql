-- Mathematics · Pre-Calculus Foundations — Arithmetic & Foundations —
-- "Counting".
-- Curated master for
-- mathematics/pre-calculus-foundations/arithmetic-and-foundations/counting
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node added to seed.ts in the same change, ahead of Number Systems.
--
-- The genuine first lesson of the whole mathematics tree: what a number is,
-- how to count a collection, and how counting turns into addition,
-- subtraction and multiplication. It assumes literally nothing.
--
-- Built exercise-first per review: mathematics is practised, not read, so
-- EVERY section ends with an infinite drill on exactly what that section
-- taught - eight sections, eight drills, each regenerating forever at three
-- difficulty levels. The prose is the shortest honest account of each idea
-- and then gets out of the way.
--
-- Eight sections / eight drills:
--   1 counting a collection            -> count-objects
--   2 the next number                  -> count-on
--   3 writing numbers: place value     -> place-value
--   4 saying numbers: number words     -> number-word
--   5 comparing                        -> compare-numbers
--   6 counting on = addition (1+1=2)   -> add-count-on
--   7 counting back = subtraction      -> sub-count-back
--   8 counting in steps = multiplying  -> skip-count
--
-- ~5,200 words, 8 infinite drills, 8 checkpoint questions across 3
-- blocks, 9 worked problems, 2 figures. Half the length of the standard
-- chapter, on purpose: there is no honest way to write ten thousand words
-- about counting, and padding it would bury the exercises that are the
-- point. The word count is not the deliverable here; the eight drills are.
--
-- Numbers verified before drafting (python3):
--   Roman numerals: 1944 = MCMXLIV (7 characters); 3888 =
--     MMMDCCCLXXXVIII (15 characters, against 4 for "3888"); 38 =
--     XXXVIII (7); 2024 = MMXXIV (6);
--   counting to a million at one number per second takes 1,000,000 s =
--     11.57 days; to a billion, 31.69 years;
--   the addition facts for digits 0-9 number 10 x 10 = 100 ordered
--     pairs, but only 10 x 11 / 2 = 55 once commutativity is used;
--   40 marks make 8 groups of five.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'mathematics/pre-calculus-foundations/arithmetic-and-foundations/counting',
    'research','advanced','read',
    $preCount_master$> Every part of this lesson works the same way: you see one example done for you, then it's your turn. The practice boxes never run out of questions — keep answering until it feels easy, then raise the difficulty, then move on.

## 1. Counting

Counting is pointing at things one at a time while saying "one, two, three, …". The last word you say is how many there are.

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

One more thing, because it trips people up: $47$ is **one number**, not "a $4$ and a $7$". Every cell in that grid is a single number. Numbers written with $0$ included — $0, 1, 2, 3, \ldots$ — are called **whole numbers**.

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

## 6. Which number is bigger?

**Example.** $999$ or $1000$? The one with more digits is bigger: $1000$.

**Example.** Same number of digits — $4812$ or $4806$? Compare digit by digit **from the left**, and stop at the first difference:

- thousands: $4$ vs $4$ — same, keep going
- hundreds: $8$ vs $8$ — same, keep going
- tens: $1$ vs $0$ — different. Stop.

$1$ beats $0$, so $4812 > 4806$. The ones digits never mattered: a difference in a bigger place always outweighs everything after it.

We write "bigger" and "smaller" with symbols: $4 < 7$ means $4$ is less than $7$, and $7 > 4$ means $7$ is greater than $4$. The wide open end always faces the bigger number.

**Your turn.**

```drill
compare-numbers
```

## 7. Adding

Adding is counting on. That's all it is.

**Example.** $1 + 1$: start at $1$, count on one more: "$2$". So $1 + 1 = 2$.

**Example.** $6 + 3$: start at $6$, count on three: "$7, 8, 9$". So $6 + 3 = 9$.

**Example.** $2 + 9$: you could count on nine times… or flip it. $2 + 9$ is the same as $9 + 2$: "$10, 11$". Done. **Order never matters in addition**, so always start from the bigger number.

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

**Example.** $9 - 4$: start at $9$, count back four: "$8, 7, 6, 5$". You land on $5$. So $9 - 4 = 5$.

**Check your answer** by adding it back: $5 + 4 = 9$. ✓ If the check fails, the subtraction was wrong. Every subtraction can be checked this way.

Sometimes counting back is the slow way round:

**Example.** $52 - 48$. Counting back $48$ steps? No. Ask instead: *how far is it from $48$ up to $52$?* "$49, 50, 51, 52$" — four steps. So $52 - 48 = 4$. Same answer, four steps instead of forty-eight. **Count back or count up — take whichever is shorter.**

One warning: in addition, order didn't matter. Here it does. $9 - 4 = 5$, but $4 - 9$ is a different question — start at $4$, count back nine — and after four steps you hit… nothing. You've run out of numbers with five steps still to go. Among the counting numbers, $4 - 9$ simply **has no answer**. Hold that thought; it is exactly where the next lesson begins.

**Your turn.**

```drill
sub-count-back
```

## 11. Multiplying

Multiplying is counting in equal jumps.

**Example.** $5 \times 3$ means five jumps of three: "$3, 6, 9, 12, 15$". So $5 \times 3 = 15$. (It's the same as $3+3+3+3+3$ — just faster to say.)

**Example.** Why is $3 \times 5$ also $15$? Picture $5$ rows of $3$ dots. Turn the page sideways: now it's $3$ rows of $5$ — same dots, nothing added, nothing removed. **Order never matters in multiplication either.**

Two easy special cases: $7 \times 1 = 7$ (one jump of seven), and $7 \times 0 = 0$ (no jumps at all).

**Your turn.**

```drill
skip-count
```

## 12. All three together

Everything in this lesson is counting, walked three different ways:

| operation | what you do | example |
|---|---|---|
| add | count on | $6+3=9$ |
| subtract | count back | $9-4=5$ |
| multiply | count in jumps | $5\times3=15$ |

This last practice box mixes all three, so you must first recognise which one you're looking at. Stay on it the longest.

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

**15.** Mixed: $12+9$, $20-8$, $8\times7$, $63-9$, $6\times9$, $45+7$.

**16.** In one sentence: why does $4-9$ have no answer in this lesson?

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
**15.** $21,\ 12,\ 56,\ 54,\ 54,\ 52$.
**16.** Counting back nine from four runs out of numbers after four steps — no counting number is the answer. (The next lesson fixes this.)

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
