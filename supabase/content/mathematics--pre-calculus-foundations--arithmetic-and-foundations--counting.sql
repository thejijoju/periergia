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
    $preCount_master$> Every mathematical idea that follows — every equation, every function, every limit — rests on one act that a child performs before school and that took civilisations thousands of years to write down properly: putting things in one-to-one correspondence with the counting words. This lesson is about that act, and about the three operations that fall out of it when you count forward, count back, and count in steps.

This is the first lesson of the mathematics sequence and it assumes nothing at all. If you can look at a handful of objects and say how many there are, you already have everything needed to begin.

**Read the short explanations, but spend your time on the exercises.** Each of the eight sections ends with a drill that never runs out: it generates a fresh question every time you answer one, at whichever of three difficulty levels you choose, and it explains every answer. Mathematics is not learned by reading about it. Stay on each drill until the answers come without thinking, then move on. If a level feels easy, step up; if it feels hard, step down. Nobody is watching and there is no score to protect.

## 1. Counting a collection

Put five stones on a table. How do you know there are five?

You point at one and say "one". You point at another — not the same one — and say "two". You continue until every stone has been pointed at exactly once, and the last word you said is the answer. That is the whole of counting, and it has three requirements that are worth naming because breaking any of them is how counting goes wrong:

1. **Every object gets pointed at.** Miss one and the count is short.
2. **No object gets pointed at twice.** Double-count and it is long.
3. **The words are said in the fixed order** one, two, three, four, five, … and never in any other.

This pairing-off of objects with counting words is called a **one-to-one correspondence**, and it is the oldest idea in mathematics. Long before numerals existed, a shepherd could check a flock without being able to count at all: drop one pebble in a bag for each animal that leaves, take one out for each that returns, and if the bag empties exactly, none is missing. The pebbles never needed names. Correspondence alone answered the question.

**The first theorem.** Here is something not at all obvious, which everybody assumes and almost nobody notices assuming: *however you order the objects, the count comes out the same*. Count the stones left to right and you get five. Count them right to left, or in a spiral, or by picking them up at random — still five. This is a genuine mathematical fact, not a convention, and it is what makes "how many" a property of the collection rather than of the counter. It is also what lets you group the objects for speed: count in fives and multiply, or count in tens, and you will land on the same answer as the slow one-at-a-time route.

Forty marks arranged in a row are hard to count singly and easy to count in fives: eight groups of five. Regrouping like this is not a shortcut around the rules above — it is that first theorem being used.

**Now count.** The drill below shows you rows of marks. Do them until you stop losing your place — and then try the harder level, where the rows are long enough that counting in ones becomes genuinely unreliable and grouping stops being optional.

```drill
count-objects
```

## 2. The next number

Counting words do not run out. After five comes six; after six, seven; after ninety-nine, one hundred. Whatever number you name, there is exactly one number that comes immediately after it, obtained by counting on one more. That number is called its **successor**.

Two consequences follow immediately, and they are among the most important facts in mathematics.

**There is no largest number.** Suppose someone claims to have found the largest one. Count on one from it. The result is larger, and it is a perfectly good number. So the claim fails, always. The counting numbers are *infinite* — not "very many", but genuinely without end.

**Every number has exactly one predecessor, except the first.** Counting downward works as well as counting upward: before seven comes six, before one hundred comes ninety-nine. Only the number you start at — one, on the convention used here — has nothing before it.

Infinity is easy to say and hard to feel, so here is a measurement of it. Counting out loud at one number per second, without sleeping, reaching a **million** takes $1{,}000{,}000$ seconds, which is $11.6$ days. Reaching a **billion** takes $1{,}000{,}000{,}000$ seconds — **31.7 years**. And a billion is not remotely near the end; there is no end to be near.

The place where counting on trips people up is not the middle of a run but the **rollover**: the moment a digit runs out of room. After $9$ comes $10$; after $99$ comes $100$; after $999$ comes $1000$. The ones digit was already as large as a digit can be, so it returns to $0$ and the digit to its left climbs by one. Counting down does the same in reverse: before $200$ comes $199$, not $100$-something. Section 3 explains why the digits behave this way; for now, drill it until the rollovers are automatic.

```drill
count-on
```

## 3. Writing numbers down

Counting words are enough to answer "how many". Writing the answer down is a separate problem, and humanity solved it badly several times before solving it well.

**Tally marks.** One stroke per object, grouped in fives by a diagonal across four. Perfectly correct, completely impractical: writing $3{,}888$ needs $3{,}888$ strokes.

{{image: Tally marks | Strokes grouped in fives, the oldest surviving way of recording a count. Each stroke stands for one object and the diagonal closes a group of five, so the record can be read by counting groups rather than individual marks — the first theorem of section 1 in physical form. The system is exact and has no upper limit, but the effort of writing a number grows in direct proportion to the number itself, which is what positional notation later eliminated.}}

**Roman numerals.** Better: symbols for $1, 5, 10, 50, 100, 500, 1000$, combined by adding, with a smaller symbol before a larger one meaning subtract. So $1944 = \mathrm{MCMXLIV}$ — seven characters, a real improvement on 1,944 strokes. But it is still clumsy: $3888 = \mathrm{MMMDCCCLXXXVIII}$, fifteen characters, against four for $3888$. And try multiplying $\mathrm{XXXVIII}$ by $\mathrm{XIX}$ without converting first. You cannot, in any reasonable way, which is why Roman arithmetic was done on a counting board and not on the page.

**Place value.** The system we use needs only ten symbols — $0, 1, 2, 3, 4, 5, 6, 7, 8, 9$ — because *where* a digit stands tells you what it is worth. Reading from the right, the places are ones, tens, hundreds, thousands, each ten times the one before it. So

$$3888 = 3\times1000 \;+\; 8\times100 \;+\; 8\times10 \;+\; 8\times1,$$

and the three $8$s are worth $800$, $80$ and $8$ respectively. Same symbol, three different values, decided entirely by position.

**Zero is the load-bearing part.** Not as "nothing", but as a *place-holder*. The numbers $37$, $307$ and $3007$ contain the same non-zero digits and are wildly different, and the zeros are what keep the $3$ in the right column. Without a symbol for an empty place the whole scheme collapses, which is exactly why it took so long to invent: zero as a written digit is a far later idea than counting itself.

Everything about arithmetic on paper — carrying, borrowing, long multiplication, decimals — is a consequence of place value. It is worth being fluent in.

```drill
place-value
```

## 4. Saying numbers out loud

Number *words* follow the places, with irregularities that are historical accidents rather than mathematics.

Beyond twelve, English builds names from the parts: "sixty-four" is six tens and four; "three hundred and forty-two" is three hundreds, four tens and two. The teens are the ragged part — "thirteen" is three-and-ten said backwards, "eleven" and "twelve" descend from Old English words meaning "one left over" and "two left over" after ten. Learn them as exceptions and the rest of the system is regular.

The traffic runs in both directions and both are worth practising:

- **numeral to words:** $415 \to$ "four hundred and fifteen";
- **words to numeral:** "six hundred and seven" $\to 607$.

The second direction hides the trap. "Six hundred and seven" says nothing at all about tens — and precisely because nothing is said, a $0$ must be written, or $607$ collapses to $67$. The silent places are the ones that need the zeros.

```drill
number-word
```

## 5. Comparing: which is more?

Counting answers "how many". The moment there are two collections, the next question is which has more — and counting answers that too, in two different ways.

**By correspondence, without counting at all.** Pair the objects of one collection with those of the other, one to one. If the first runs out while the second still has objects left over, the second has more. This is how a small child, or a shepherd with pebbles, compares two flocks without knowing a single number word. It also happens to be the definition that mathematicians later used to compare *infinite* collections, where counting is not available.

**By counting.** Count both and compare the numbers. Which brings up: what does it mean for one number to be bigger than another? Exactly this — **the larger number is the one you reach later when counting upward**. Seven is more than four because you pass four on the way to seven.

Written down, comparison uses three symbols:

$$4 < 7 \quad\text{(four is less than seven)}, \qquad 7 > 4 \quad\text{(seven is greater than four)}, \qquad 5 = 5.$$

The wide end always faces the larger number. And exactly one of the three holds for any pair, never two, never none.

**How to compare two written numbers.** Not by counting up to them — that is hopeless for large numbers — but by place value:

1. More digits wins. $1000 > 999$, no further thought needed.
2. Same number of digits: compare from the **left**, place by place. The first place where they differ decides it, and everything to the right is irrelevant.

So $4{,}812$ against $4{,}806$: thousands equal, hundreds equal, tens are $1$ against $0$ — done, $4812 > 4806$, and the ones digits never enter into it. That is place value paying for itself: a difference in a higher place outweighs everything below it put together.

```drill
compare-numbers
```

```checkpoint
q: Which of these tells you that one collection has more objects than another *without counting either of them*?
a*: Pairing the objects one to one and seeing which collection runs out first.
a: Looking at which one takes up more space.
x: Space is not quantity. Ten marbles occupy less room than three melons, and a spread-out row of five looks longer than a bunched row of eight. Nothing about arrangement or size answers "how many".
a: There is no way; you must count both.
x: There is, and it predates counting. A shepherd with a bag of pebbles compares a flock against the pebbles without knowing a single number word. Mathematicians later used exactly this method to compare infinite collections, where counting is not available.
a: Comparing the last counting word said for each.
x: That does work, but it is counting — the question asks for the method that needs no counting at all.
hint: What did the shepherd in section 1 do with the pebbles?
why: One-to-one correspondence answers "which has more" directly: pair them off, and whichever still has objects left over is larger. Counting is a refinement of this — it pairs objects against a *standard* collection, the counting words — but the comparison itself never needed numbers.

---

q: Compare $4{,}812$ and $4{,}806$. Which place decides it?
a*: The tens place, where $1$ meets $0$.
a: The ones place, since $2 > 6$ is false so $4{,}806$ is larger.
x: Two errors. Comparison runs from the *left*, not the right, and the first differing place settles it — here the tens, one place before the ones. Once the tens differ, the ones digits are irrelevant no matter how large they are.
a: The thousands place.
x: Both numbers have $4$ in the thousands, so that place is a tie and the comparison must move right to the next place.
a: The hundreds place.
x: Both have $8$ in the hundreds, another tie. Keep moving right until the digits actually differ.
hint: Compare from the left. Stop at the first place where the digits are not the same.
why: Thousands tie at $4$, hundreds tie at $8$, and the tens differ: $1$ against $0$. That settles it, $4812 > 4806$, and the ones digits never enter into it. A difference in a higher place outweighs everything below it put together — which is what place value buys you.
```

## 6. Counting on is addition

Here is the first sum. You have one stone. Someone hands you one more. How many?

You do not need a rule. Count them: one, two. So

$$1 + 1 = 2.$$

That is the entire content of addition. **To add $b$ to $a$, start at $a$ and count on $b$ more.** To work out $6 + 3$, start at six and count on three: seven, eight, nine. So $6 + 3 = 9$. The plus sign is an instruction to keep counting.

Three facts make addition much less work than it first appears.

**Order does not matter.** $3 + 6$ and $6 + 3$ are both $9$. This is the same theorem as in section 1 — combine two collections and count the result, and how you arrange them cannot change the total. Practically, it nearly halves what there is to memorise: of the $10\times10 = 100$ pairs of digits, only $55$ are genuinely different sums once you know that $a+b$ and $b+a$ agree. It also gives a free shortcut: to compute $2 + 9$, turn it round and count on $2$ from $9$ rather than $9$ from $2$.

**The pairs that make ten are worth knowing cold.** $1+9$, $2+8$, $3+7$, $4+6$, $5+5$. Everything about crossing a ten runs through them.

**Adding zero changes nothing.** $7 + 0 = 7$: counting on zero steps leaves you where you were.

**Crossing a ten.** Once sums pass ten, counting on one at a time gets slow and unreliable. Split the journey instead: to compute $28 + 7$, first go up to the round number — $28 + 2 = 30$ — then add what is left of the seven, $30 + 5 = 35$. This is exactly what "carrying" does in a written sum, and doing it in your head first makes the written method obvious rather than magical.

Start the drill at the gentle level, where every sum stays within ten. Move up when those are instant.

```drill
add-count-on
```

## 7. Counting back is subtraction

Subtraction reverses the process. **To compute $a - b$, start at $a$ and count back $b$ steps.** For $9 - 4$: eight, seven, six, five. So $9 - 4 = 5$.

There is a second reading of the same thing, and it is often the easier one:

> $a - b$ is **the number you must add to $b$ to reach $a$**.

For $9 - 4$, ask what must be added to $4$ to make $9$. Five. Same answer, less counting — and for something like $52 - 48$, counting up from $48$ takes four steps while counting back from $52$ takes forty-eight. Choose whichever direction is shorter.

This second reading also makes every subtraction self-checking. If $9 - 4 = 5$, then $5 + 4$ had better be $9$ — and it is. Check every subtraction that way until you stop needing to.

Two warnings, both important later.

**Order matters here.** $9 - 4 = 5$ but $4 - 9$ is not $5$. Addition does not care about order; subtraction very much does.

**You can run out of numbers.** $4 - 9$ asks you to count back nine steps from four, and after four steps you are at zero with five steps still to take. Within the counting numbers there is simply no answer — the objects to count are not there. This is not a gap in your arithmetic; it is a gap in the number system, and repairing it is what the *next* lesson is about. Hold on to the question.

```drill
sub-count-back
```

## 8. Counting in steps is multiplication

The last thing counting gives you is the beginning of multiplication.

Count, but skip: $3, 6, 9, 12, 15, \ldots$ — going up by three each time. This is called **skip counting**, and each number in the list is a count of *groups* rather than of single objects. Five groups of three is fifteen, which is written

$$5 \times 3 = 15,$$

and which you could also get by adding: $3 + 3 + 3 + 3 + 3 = 15$. **Multiplication is repeated addition, which is itself repeated counting.** It is quicker for the same reason that counting in fives is quicker than counting in ones — the whole of arithmetic is built on finding faster routes to a number that slow counting would eventually reach anyway.

Two things carry over from addition:

**Order does not matter.** $5\times3 = 3\times5 = 15$. Picture the objects in a rectangle, five rows of three: turn it a quarter turn and it is three rows of five, with not a single object added or removed. That picture is the proof.

**Multiplying by one changes nothing**, and **multiplying by zero gives zero** — zero groups of anything is nothing at all.

Skip counting in twos, fives and tens is the easy start. Threes, fours and sixes are the working middle. Sevens, eights and nines are the ones nearly everybody finds hardest, and they are on the hard level of the drill for exactly that reason.

```drill
skip-count
```

```checkpoint
q: Why does knowing $6 + 3 = 9$ mean you also know $3 + 6$?
a*: Because combining two collections and counting the result cannot depend on which one you count first.
a: Because $6$ and $3$ are both single digits.
x: The number of digits has nothing to do with it. $148 + 27$ and $27 + 148$ agree for exactly the same reason, and so does any other pair.
a: It is a separate fact that happens to have the same answer.
x: It is not a coincidence but a theorem, and it is the same theorem as in section 1: the count of a collection does not depend on the order in which it is counted. Put six stones and three stones together and count the pile — the pile does not know which handful arrived first.
a: Because subtraction reverses addition.
x: True but unrelated. The fact here is about the *order of the two numbers being added*, not about undoing the addition. Note that subtraction itself does not have this property: $9 - 4$ and $4 - 9$ are not the same.
hint: Think of the two numbers as two handfuls of stones being poured into one pile.
why: Addition is counting the combined collection, and by section 1 that count is independent of order. So $a + b = b + a$ always. Practically it nearly halves the work: of the $10 \times 10 = 100$ ordered pairs of digits, only $55$ are genuinely distinct sums. It also gives a free shortcut — compute $2 + 9$ by counting on $2$ from $9$ rather than $9$ from $2$.

---

q: What is $4 - 9$?
a*: It has no answer among the counting numbers.
a: $5$
x: That is $9 - 4$. Subtraction is not like addition here: order matters, and reversing it does not leave the answer unchanged.
a: $0$, because you cannot go below nothing.
x: Counting back from $4$ does reach $0$ after four steps — but five steps still remain to be taken, and stopping early is not an answer, it is abandoning the question. The honest response is that the system has no number for it.
a: $-5$, obviously.
x: That is the right answer in a *larger* system, and it is where the next lesson goes. Within the counting numbers $1, 2, 3, \ldots$ there is no such object, so the question genuinely has no answer here.
hint: Count back nine steps from four and see where you end up.
why: Counting back from $4$ gives $3, 2, 1$ — and then the objects are gone with five steps still owed. Within $\{1, 2, 3, \ldots\}$ the equation $9 + x = 4$ has no solution. This is not a flaw in your arithmetic but a gap in the number system, and repairing it is exactly what the next lesson does.

---

q: A rectangle of objects has $5$ rows of $3$. What does turning it a quarter turn show?
a*: That $5 \times 3 = 3 \times 5$, since no object was added or removed.
a: That multiplication is repeated addition.
x: True, and stated in section 8 — but it is not what the *rotation* shows. Turning the rectangle demonstrates something about the order of the two factors, not about the relationship between multiplying and adding.
a: That $5 + 3 = 3 + 5$.
x: That is addition's version of the same idea, and it is also true, but the rectangle is showing the multiplication version: the same objects counted as $5$ groups of $3$ or as $3$ groups of $5$.
a: Nothing — the two arrangements are simply different problems.
x: They are the same objects. A rotation moves nothing, adds nothing and removes nothing, so the count is unchanged; only the description of it changes, from "$5$ rows of $3$" to "$3$ rows of $5$".
hint: Does turning a tray of objects change how many are on the tray?
why: Rotating the array reinterprets $5$ rows of $3$ as $3$ rows of $5$ without disturbing a single object, so both descriptions count the same $15$ things. That picture is the proof that $a \times b = b \times a$, and it is worth carrying: many facts about multiplication are easiest to see as facts about rectangles.
```

{{image: Abacus | Beads on rods, each rod standing for one place in the number and each bead for one unit of that place. Moving a bead is counting on by one; a rod that fills up empties and adds one to the rod beside it, which is a rollover made physical. The device works because of place value rather than in spite of it, and it is how arithmetic was actually performed for most of recorded history — including by cultures whose written numerals, like the Roman, were hopeless for calculation.}}

## What you have

Everything in this lesson came from one act — pairing objects with counting words — and three directions to walk in from it:

| walk | operation | example |
|---|---|---|
| forward | addition | $6 + 3 = 9$ |
| backward | subtraction | $9 - 4 = 5$ |
| forward in equal steps | multiplication | $5 \times 3 = 15$ |

And one question was left deliberately unanswered: what is $4 - 9$? Counting back runs out of numbers, so within the counting numbers the question has no answer at all. That failure is not a flaw in the arithmetic — it is the reason the next lesson exists, and the pattern of the whole subject. Every enlargement of the number system, right up to the ones used in calculus, happens because some perfectly reasonable question had no answer in the system available.

```checkpoint
q: You count a row of stones left to right and get 12. A friend counts the same row right to left. What will they get?
a*: 12 — the count does not depend on the order.
a: It depends which stone they start from.
x: It genuinely does not. Whichever stone is first, every stone still gets pointed at exactly once, so the last counting word said is the same. This is the first theorem of the lesson, and it is what makes "how many" a property of the collection rather than of the person counting.
a: 11, because they started from a different end.
x: Changing direction does not add or remove a stone. Each of the twelve stones is still counted exactly once; only the order in which they are visited changes.
a: You cannot know without counting again.
x: You can know, and knowing it is the whole point. Because the count is independent of order, one correct count settles the question for every possible order.
hint: Are all the same objects still being counted, exactly once each?
why: A count pairs each object with one counting word, in order, until the objects run out. Reordering the objects changes which word lands on which stone but not how many words are used, so the final word — the answer — is unchanged. This is also what makes grouping legitimate: counting forty marks as eight groups of five gives the same answer as counting them singly.

---

q: What number comes immediately after 999?
a*: 1000
a: 9910
x: This writes "nine hundred and ninety-nine, plus one" as if the digits were separate labels. They are not: the ones digit rolls from $9$ to $0$ and passes one on to the tens, which is also at $9$ and does the same, and so on.
a: 9100
x: A rollover has been mishandled. Work it through: $999 + 1$ makes the ones digit $0$ and carries; the tens then also roll to $0$ and carry; the hundreds too; and a new digit $1$ appears in front, giving $1000$.
a: There is no next number, since 999 uses up the three-digit numbers.
x: Running out of three-digit numbers does not mean running out of numbers — a fourth digit opens. Counting never stops: whatever number you name, counting on one gives a larger one.
hint: What happens to a digit that is already as large as a digit can be?
why: $999 + 1 = 1000$. Each $9$ is already at its largest, so it returns to $0$ and passes one to the place on its left; when the leftmost place does this, a new digit appears. The same event happens at $9 \to 10$ and $99 \to 100$, which is why those are the places worth drilling.

---

q: In the number 4,207, what is the digit 2 worth?
a*: 200
a: 2
x: That is the digit itself, not its value. A digit's worth is the digit multiplied by the value of the place it stands in, and this $2$ stands in the hundreds place.
a: 20
x: That would be its worth in the tens place. Count the places from the right: $7$ is ones, $0$ is tens, $2$ is hundreds, $4$ is thousands.
a: 2,000
x: That is the thousands place, occupied here by the $4$. The $2$ sits one place to its right.
hint: Read the places from the right: ones, tens, hundreds, thousands.
why: $4207 = 4\times1000 + 2\times100 + 0\times10 + 7\times1$, so the $2$ is worth $200$. Note also what the $0$ is doing: nothing is said aloud for the tens, but the symbol must be written, or the number would collapse to $427$.
```

## Practice

*Answers use only what is above. Verified values: $1944 = \mathrm{MCMXLIV}$ (7 characters); $3888 = \mathrm{MMMDCCCLXXXVIII}$ (15 characters, against 4 for the numeral $3888$); counting to a million at one per second takes $11.6$ days, to a billion $31.7$ years; the $100$ ordered pairs of digits reduce to $55$ distinct sums under commutativity; $40$ marks make $8$ groups of five.*

**1.** *(What counting is.)* **(a)** State the three requirements of a correct count. **(b)** For each, describe the error that results from breaking it. **(c)** Explain how a shepherd with a bag of pebbles can tell that no sheep is missing without counting.

**2.** *(Order does not matter.)* **(a)** State the theorem of section 1 in one sentence. **(b)** Explain why it makes counting in fives legitimate rather than a mere approximation. **(c)** Count $40$ marks in fives and in tens, and state what the two routes have in common.

**3.** *(Successors.)* **(a)** Give the number immediately after $9$, $99$, $999$ and $9999$, and say what all four have in common. **(b)** Give the number immediately before $100$, $200$ and $1000$. **(c)** Explain in two sentences why there is no largest counting number.

**4.** *(Writing numbers.)* **(a)** Write $1944$ and $3888$ in Roman numerals and count the characters each needs. **(b)** Compare with the number of characters in the ordinary numerals. **(c)** State the one idea that makes the difference, and explain the role of zero in it.

**5.** *(Place value.)* **(a)** Write $5{,}073$ as a sum of the form $\square\times1000 + \square\times100 + \square\times10 + \square\times1$. **(b)** Give the value of each digit in $8{,}888$. **(c)** Explain what goes wrong if the zero is dropped from $5{,}073$.

**6.** *(Comparing.)* **(a)** Insert $<$, $>$ or $=$ between $4{,}812$ and $4{,}806$, and name the place that decides it. **(b)** State the two-step rule for comparing written numbers. **(c)** Explain how two collections can be compared without counting either.

**7.** *(Addition.)* **(a)** Compute $6+3$ by counting on, listing the words you say. **(b)** State why knowing $6+3$ means you also know $3+6$, and how many of the $100$ digit sums this leaves genuinely distinct. **(c)** Compute $28+7$ by first going up to the round number, showing both steps.

**8.** *(Subtraction.)* **(a)** Compute $9-4$ by counting back, listing the words. **(b)** Compute it again as "what must be added to $4$ to reach $9$", and say which method you would use for $52-48$ and why. **(c)** Explain why $4-9$ has no answer among the counting numbers.

**9.** *(Multiplication.)* **(a)** Write $5\times3$ as a repeated addition and evaluate it. **(b)** Explain, using a rectangle of objects, why $5\times3 = 3\times5$. **(c)** State what $7\times0$ is and why.

## Further reading

{{book: Georges Ifrah | The Universal History of Numbers | 2000}} traces counting from tally bones through every written numeral system to the positional notation used today, and is the fullest account of why zero took so long to appear.

{{book: Karl Menninger | Number Words and Number Symbols | 1969}} is the classic study of how number *words* developed alongside number symbols, and explains the irregularities of the teens and of "eleven" and "twelve" that section 4 treats as exceptions.

{{book: Denise Schmandt-Besserat | How Writing Came About | 1996}} argues that written numerals — and writing itself — began with clay counting tokens used exactly as the shepherd's pebbles in section 1, which makes the one-to-one correspondence the oldest recorded mathematical idea there is.
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
