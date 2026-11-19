-- Plato — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/plato @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- {{image: Title | caption}} markers resolve to real Wikipedia images at read
-- time via /api/resolve-images (see src/components/Reader.tsx). A curated,
-- human-reviewed quiz is inserted at the bottom (generated = true).
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts), so when the master body changes
-- those rows are stale. The upsert only touches the row when something actually
-- differs, and the delete below fires only in that case — dropping the derived
-- caches so the next request re-distills from the updated master. Replaying an
-- unchanged file is a complete no-op.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'philosophy/history-of-philosophy/ancient-beginnings/plato',
    'research',
    'advanced',
    'read',
    $plato_master$> **Plato wrote philosophy as drama, and almost everything he wrote survives.** Born into a powerful Athenian family between about 429 and 423 BCE and dead in 348/347, he turned Socrates' questions into dialogues on reality, knowledge, the soul, justice and love. This chapter covers the theory of Forms, knowledge and opinion, the immortal and divided soul, the *Republic*'s justice, ideal city and women rulers, and the *Symposium*'s ladder of love; it reconstructs the "Third Man" objection with which Plato attacked his own theory, and ends with the Academy and his afterlife in Christian and Islamic thought. Throughout it asks a disputed question: did Plato build a system at all?

## A Life Between Politics and Philosophy

The previous chapter, *Socrates and the Sophists*, left Plato as the young man who watched his teacher tried and executed in 399 BCE. His own dates are uncertain. Modern authorities put his birth anywhere from about 429 to 423 BCE; the traditional date, based on ancient calculations by Eratosthenes, is 428/427. So he was somewhere in his mid- to late twenties at the trial. He died in Athens in 348/347.

His family was aristocratic, wealthy and political; through his mother, Perictione, he descended from the lawgiver Solon. His brothers Glaucon and Adeimantus, probably older, appear as Socrates' partners in the *Republic*. His uncle Charmides belonged to the Thirty, the oligarchy that seized Athens in 404 BCE, and Critias, another relative, led it. The ancient story that his real name was Aristocles, "Plato" (from *platos*, "broad") being a nickname, is widely regarded as false.

According to the *Seventh Letter*, one of thirteen letters transmitted under his name, Plato meant to enter politics, was invited to join the Thirty, was repelled by their crimes, and gave up his ambitions after Socrates' prosecution. The same letter tells of three visits to Syracuse in Sicily: the first, when he was "about forty", brought friendship with Dion, brother-in-law of the tyrant Dionysius I; the second, after 367, was meant to turn the young Dionysius II into a philosopher-ruler and ended with Plato effectively under house arrest; from the third, in 361–360, friends of the Pythagorean statesman Archytas of Tarentum helped him escape. But the letter's authenticity is disputed. Some scholars accept it; Myles Burnyeat and Michael Frede argue it is not Plato's, and Julia Annas reads its acceptance as a sign of scholars' "desire to find", behind the detachment of the dialogues, a Plato committed to something. The Sicilian story is tradition, not settled fact.

{{image: Plato | A portrait bust of Plato. Almost everything else about him, from his birth date to his name, is less certain than his surviving works.}}

## Why Dialogues?

Plato is unusual among ancient authors: his complete works are believed to have survived. Nearly all of them are dialogues, conversations in which Plato himself never speaks. As one leading scholar puts it, strictly speaking Plato "does not himself affirm anything in his dialogues"; whatever he wants to communicate comes indirectly. Many speakers are real historical figures, and Socrates leads most conversations, though a visitor from Elea leads the *Sophist* and *Statesman* and an unnamed Athenian the *Laws*. In the *Phaedrus*, Socrates warns against relying on books, which are best used as reminders of discussions already held; Plato seems to have meant his writings as aids to philosophical conversation, not substitutes for it.

**Chronology.** The order of composition is uncertain. **Stylometry**, the statistical study of an author's prose habits, clearly separates a late group: *Sophist*, *Statesman*, *Timaeus*, *Critias*, *Philebus* and *Laws*. The usual teaching divides the rest into "early" Socratic dialogues, which end without positive doctrine, and "middle" dialogues (*Phaedo*, *Symposium*, *Republic*, *Phaedrus*) that present the Forms, the soul's immortality and its three parts. But stylometry actually groups the *Phaedo* and *Symposium* with the early works, and whether the three-period scheme reflects the real order, or is even useful, is disputed; Plato may have written puzzle-raising dialogues alongside doctrinal ones all his life.

**A system?** The History of Philosophy overview calls Plato the builder of "the first complete philosophical system", and it is easy to see why: the middle dialogues link metaphysics, knowledge, the soul, ethics and politics into one interconnected picture. Yet the latest Stanford Encyclopedia account stresses that he is "far more exploratory, incompletely systematic, elusive, and playful" than Aristotle, Aquinas or Kant, offering "a few key ideas together with a series of suggestions and problems". Readers divide. **Unitarians** find one philosophy throughout; **developmentalists** think Plato's views changed; others read each dialogue on its own. Richard Kraut argues that dialogues in which one speaker persuades the rest are best read as vehicles for views Plato recommends, the work of "a single mind", perhaps one that changes.

## The Theory of Forms

Nearly every major work of Plato depends on one distinction: between the many things that *appear* beautiful, just, equal or large, and the one thing that beauty, justice or equality *really is*. That one thing is a **Form**: eternal, changeless, outside space and time, grasped by thought rather than the senses, and in some way the pattern that sensible things copy. Plato never gives a full account; "the theory of Forms" is a scholarly reconstruction. The *Phaedo* states its explanatory role: "if anything else is beautiful besides Beauty Itself, it is beautiful on account of nothing else than because it partakes of Beauty Itself."

The Forms answer two predecessors whom the chapter *The Presocratics: from Myth to Argument* introduced. Parmenides demanded that what truly is be one and unchanging; Heraclitus' followers taught that the sensible world is always in flux. Plato granted both: the world we see changes, but the Forms satisfy Parmenides' demand.

Why believe in them? In the *Phaedo*, equal sticks and stones sometimes appear equal and sometimes unequal, while the Equal itself never appears unequal; so the Equal is not any equal stick, and since we judge the sticks to fall short of it, we must have known it before birth. Critics reply that the comparison presupposes our grasp of the Form rather than explaining it. Plato may have begun with Forms for a few properties (equal, large, beautiful, just) and widened the range; *Republic* X even has a Form of Bed.

## Knowledge and Opinion

In the *Meno*, Meno raises, and Socrates sharpens, a paradox: if you know something, you need not inquire into it; if you do not, you cannot recognise it when found; so inquiry is impossible. Socrates replies that learning is **recollection** of what the soul knew before birth, and questions an untaught slave boy until he finds the side of a square twice the area of a given one. The questions are leading, and the lesson exposes the paradox's false choice without proving a previous life. Later in the dialogue he distinguishes true belief from knowledge, which is true belief "tied down" by an account of the reason why, perhaps the first attempt at the modern idea of knowledge as justified true belief traced in *What Is Knowledge? From Plato to the Gettier Problem*.

The *Republic* sharpens the contrast. Knowledge is set over what completely is, ignorance over what is not, and **opinion** (*doxa*) over what both is and is not. Interpreters divide over what that means. On the "Two Worlds" reading, there is knowledge only of Forms and opinion only of sensible things; on Fine's reading, knowledge is a set of true claims and opinion covers all claims, so the same things can be known and believed.

Three images follow. In the **sun**, the Form of the Good is to the intelligible world as the sun is to the visible: "What gives truth to the things known and the power to know to the knower is the Form of the Good", and the Good is "beyond" being in rank and power. In the **divided line**, the visible splits into images and physical things, the intelligible into mathematical reasoning from assumptions and the understanding of Forms. In the **cave**, perhaps the most famous analogy in philosophy, prisoners chained from childhood see only shadows thrown by objects carried before a fire; one is freed, dragged into daylight, and at last sees the sun. The image, Plato says, concerns the effect of education and its lack on our nature, and the freed prisoner must go back down.

```checkpoint
q: Why does the label "first complete philosophical system" sit uneasily with current scholarship on Plato?
a*: Because his ideas interconnect, but he wrote exploratory dialogues offering key ideas alongside open problems rather than a finished doctrine.
a: Because Plato wrote treatises setting out each doctrine in order, which later scholars found incomplete.
x: Plato never wrote treatises; he wrote dialogues in which he never speaks in his own voice.
a: Because Aristotle, not Plato, wrote the Republic and Timaeus.
x: Both are Plato's; the authorship of the Laws was once doubted, but almost no serious scholar doubts it now.
a: Because scholars agree he abandoned the Forms after the Parmenides.
x: Whether he changed his mind about the Forms is an open question; the Eleatic visitor in later dialogues still takes them for granted.
hint: Think about the form in which Plato wrote.
why: The middle dialogues link metaphysics, knowledge, soul and politics, but they do so through open-ended conversation, which is why the Stanford Encyclopedia calls Plato "incompletely systematic".
---
q: In the Meno, what is the difference between true belief and knowledge?
a: True belief concerns Forms; knowledge concerns sensible things.
x: This reverses the "Two Worlds" reading of the Republic, and the Meno draws its distinction differently.
a: There is none; Socrates says they are the same.
x: Socrates insists they differ, though both guide action correctly.
a*: Knowledge is true belief tied down by an account of the reason why.
a: Knowledge is any belief taught by a philosopher.
x: The source of a belief does not make it knowledge in the Meno; what matters is an account of why it is true.
hint: Think of what keeps a belief from "running away".
why: Socrates says true beliefs become knowledge when tied down by reasoning about their cause, an early version of knowledge as justified true belief.
```

## The Immortal and Divided Soul

In the *Apology*, Socrates says no one knows what happens after death. In the *Phaedo*, set on his last day, Plato's Socrates argues that the soul is distinct from the body, grasps the Forms best when free of it, and is immortal. His arguments run from cycles of opposites, from recollection, from the soul's likeness to the invisible and unchanging, and finally from the claim that the soul, which brings life, cannot admit death. Cebes objects that outlasting the body is not the same as lasting for ever.

The *Republic* adds that the soul has three parts: **reason**, which loves truth and should rule; **spirit** (*thumos*), which loves honour and victory; and **appetite**, which wants food, drink and sex, and money as their means. Plato argued for the division from inner conflict:

1. The same thing cannot do or undergo opposites in the same respect, in relation to the same thing, at the same time.
2. A thirsty person can at once desire to drink and, judging it bad, refuse.
3. So the desire and the refusal belong to different parts: appetite and reason.
4. A man called Leontius wanted to look at corpses and was angry with himself for wanting to.
5. So spirit is distinct from appetite, and, by further argument, from reason.

The consequence is large. In the *Protagoras*, Socrates had denied **akrasia**, weakness of will; a divided soul makes it possible. Critics ask whether the "parts" are just ways of describing conflict or something like inner agents, and whether one case such as Leontius' really warrants a third part. Plato himself hints that the soul, freed from the body, may be simple.

## Justice in the Soul and in the City

The *Republic* opens with failed definitions of justice. Thrasymachus then argues that justice is a convention set up by the strong, and that the strong do better ignoring it. In Book II Glaucon and Adeimantus raise the stakes. Glaucon tells of a shepherd, ancestor of Gyges of Lydia, who finds a ring of invisibility and uses it to seduce the queen, kill the king and take power. With such a ring, he says in Benjamin Jowett's translation, "no man would keep his hands off what was not his own". The brothers demand proof that justice is worth choosing for its own sake, so that a perfectly just man thought unjust is better off than a perfectly unjust man thought just.

Socrates looks first at justice in a city, as the "bigger" case, then in the soul. Wisdom is reason's knowledge of what benefits each part and the whole; courage is spirit holding to reason's judgment; moderation is the parts' agreement that reason should rule; and **justice** is each part doing its own work. Books VIII–IX then argue that the just soul is healthy and happy, the tyrant's soul miserable.

**The strongest objection**, pressed by David Sachs in 1963, is that Socrates changes the subject. He was asked about *doing* just acts, such as not stealing, and answered with an account of a harmonious soul. He must still show that a harmonious soul never acts unjustly. **The best reply** looks ahead to Books V–VII: a person whose reason knows the Form of the Good will be moved by it to act justly; others point to the early education that shapes character.

## Kallipolis, Women Guardians and the Critique of Democracy

Plato's city begins as a simple "healthy city", which Glaucon mocks as a "city of pigs". The purified city, later called *Kallipolis* ("beautiful city"), has three classes: rulers, auxiliaries who defend it (together, the guardians), and producers. Each does the work for which he or she is best suited; the guardians have no private property or families; citizens are told a "noble lie" that they contain gold, silver, or iron and bronze. And the city cannot be ideal without philosopher-rulers:

```quote
"Until philosophers are kings, or the kings and princes of this world have the spirit and power of philosophy ... cities will never have rest from their evils."
Socrates, as written by Plato · Republic V 473c–d, trans. Benjamin Jowett · c. 375 BCE
```

Socrates insists repeatedly that philosophers must be compelled to rule: they make the best rulers because they would rather not.

Book V also argues that women may be guardians and rulers, with the same education as men, because sex is as irrelevant to the work as having long or short hair. Was this **feminism**? Some scholars have said so; Julia Annas replied that Plato shows no interest in actual women, makes disparaging remarks about them (men are better at almost everything), and argues from the city's needs, not women's; Susan Okin linked the proposal to the abolition of the family. The Stanford Encyclopedia concludes that the broad claim that the *Republic* is feminist "cannot be sustained", but that two features can reasonably be called feminist: sex is irrelevant to qualification, and abolishing the private family frees women for education and work. Plato may have been prejudiced against women yet committed to some feminist principles. In the later *Laws*, families return and, Okin argued, women's roles shrink, though they remain citizens with the same education and military training and, on some passages, may hold office.

Books VIII–IX trace a decline from the ideal through rule by honour, then wealth, then democracy, to tyranny. Democracy honours all pursuits equally; without shared standards of value it falls into strife, and a demagogue leads it to tyranny. In Book VI, the "ship of state" likens democracy to sailors without navigational skill fighting for the helm. (The later *Statesman*, though, ranks democracy above oligarchy.) In 1945 Karl Popper charged the *Republic* with totalitarianism; Gregory Vlastos replied that the city aims at its citizens' good. The Stanford Encyclopedia's middle view is that Kallipolis has clearly totalitarian features but not obviously totalitarian aims. *Democracy and Its Critics* takes the argument forward.

## Love and Beauty: the Symposium

The *Symposium* is set in 416 BCE at a party for the poet Agathon's first dramatic victory, where the guests make speeches in praise of Eros, love. Aristophanes gives the image of lovers as each other's "other half". Socrates credits his own account to Diotima of Mantinea, whom most scholars think Plato invented, though Mary Ellen Waithe has argued she may have been real. Love, Diotima teaches, is not a god but a spirit between mortal and divine. We love the good and want it to be ours for ever, and mortals approach that by "giving birth in beauty".

Her **ladder of love** rises from love of one beautiful body to all beautiful bodies, then beautiful souls, laws and practices, kinds of knowledge, and finally the beautiful itself, unchanging and unmixed. The setting is explicitly erotic love of boys. Does the ladder treat the people we love as rungs, to be climbed and kicked away? One reply is that the lover learns to value the beloved appropriately rather than discard him; Martha Nussbaum suggests that Plato may himself be criticising such abstraction through the speech of the drunken Alcibiades that closes the dialogue. The *Phaedrus* adds a different picture: love as a "divine madness" by which the soul's wings grow again.

## Self-Criticism: the Parmenides

In the *Parmenides*, an aged Parmenides cross-examines a young Socrates and attacks the theory of Forms. The most famous objection was later named the **Third Man** by Aristotle; Plato's own example is largeness. Scholars reconstruct it from three principles: **One-over-Many** (for any group of large things there is a Form of largeness by which they are large), **Self-Predication** (that Form is itself large) and **Non-Identity** (no Form is identical with what partakes of it).

1. Some things, A, B and C, are large.
2. By One-over-Many, there is a Form, Largeness 1, by which they are large.
3. By Self-Predication, Largeness 1 is itself large.
4. So A, B, C and Largeness 1 form a new group of large things, and by One-over-Many there is a Form, Largeness 2, over them.
5. By Non-Identity, Largeness 2 is not Largeness 1.
6. The steps repeat without end, so each Form, which was meant to be one, is "infinitely many".

The regress is vicious because an endless series explains nothing, because it breaks the rule of one Form per property, and, as Samuel Rickless stresses, because it makes each Form many. Aristotle used it against the theory. Whether Plato did is a long controversy.

**The strongest objection**, then, is the argument itself: all three principles seem central to Plato's theory, and Gregory Vlastos, whose 1954 analysis began the modern debate, read the dialogue as "a record of honest perplexity", Plato seeing the problem without an answer. **The best replies** take two forms. Constance Meinwald distinguishes two senses of "X is large": true of X "in relation to itself", by definition, or "in relation to others", by X displaying largeness. Largeness is large only in the first sense, so the regress trades on an ambiguity. Rickless accepts the arguments as valid and holds that Plato saved the Forms by giving up some of their supposed features while keeping One-over-Many and their separation from things. Scholars remain deeply divided. Plato's Parmenides himself says a "very gifted man" could still defend the Forms; and if the *Timaeus*, which uses them, was written later, Plato did not think the objection fatal. The wider question of what Forms or universals could be returns in *What Exists? Ontology and Universals*.

```checkpoint
q: Which three principles do most commentators think the Third Man argument relies on?
a: Recollection, Immortality and Tripartition.
x: These belong to Plato's theory of the soul, not to the regress about Forms.
a*: One-over-Many, Self-Predication and Non-Identity.
a: Non-opposition, Specialisation and Compulsion.
x: Non-opposition grounds the divided soul; specialisation and compelling philosophers to rule belong to the Republic's city.
a: Unwritten doctrine, the One and the Indefinite Dyad.
x: These belong to the reconstructed oral teaching of the Tübingen School, not to the Parmenides' argument.
hint: The argument needs a Form over each group, a Form with its own property, and a Form distinct from its group.
why: Together they generate Largeness 1, 2, 3 and so on; replies work either by reinterpreting one of the commitments (Meinwald) or by giving up other assumed features of the Forms while keeping One-over-Many and Separation (Rickless).
---
q: In Republic V, why does Socrates hold that women may be guardians?
a: Because women and men are equal in every capacity.
x: Socrates says men are better at almost everything; his claim is narrower.
a: Because the city needed more soldiers than men alone could supply.
x: Plato's argument concerns qualification for the work, not numbers.
a: Because Diotima had taught Socrates to do so.
x: Diotima appears in the Symposium and teaches about love, not about the city's offices.
a*: Because sex is as irrelevant to the guardians' work as having long or short hair.
hint: Think about what Plato thinks qualifies anyone for a job in Kallipolis.
why: The argument from the irrelevance of sex is one of two features the Stanford Encyclopedia calls feminist, alongside the abolition of the private family.
```

## The Academy and the Later Plato

Plato founded his school in the 380s BCE (traditionally c. 387) in a grove sacred to the hero Academus, outside the walls of Athens; from it comes our word "academic". It charged no fees and probably had no fixed doctrine or curriculum: Plato and others set problems, dialectic was the usual method, and mathematics flourished. The inscription "Let no one untrained in geometry enter", supposedly over its door, is first reported many centuries later, by late-antique commentators, and is best treated as legend. Two women, Axiothea of Phlius and Lasthenia of Mantinea, are recorded as studying there. Aristotle arrived in 367 and stayed twenty years, until Plato's death. Aristotle mentions Plato's "so-called unwritten doctrines", and a lecture "On the Good" is reported; from these the Tübingen School reconstructs an oral theory of the One and the "Indefinite Dyad", which critics such as Harold Cherniss doubt and moderate sceptics call speculative.

The late dialogues turn elsewhere. The *Timaeus* describes a divine Craftsman who, copying an eternal model, imposes mathematical order on pre-existing chaos, a "likely story" whose literal or metaphorical meaning is still debated. The *Laws*, Plato's longest work, designs a "second-best" city, Magnesia, whose laws come with persuasive preludes. Whether Plato's politics softened between the *Republic* and the *Laws* is another open question. He was buried, ancient tradition says, at the Academy, and his nephew Speusippus succeeded him.

## Plato's Afterlife

Aristotle criticised the Forms and the *Republic*'s communism, as the chapter on *Aristotle* will show; later the Academy itself became a sceptical school. In late antiquity Plotinus and his successors, who called themselves simply "Platonists", rebuilt Plato's thought, the subject of *Plotinus and Neoplatonism*. In the *Parmenides*, the young Socrates had suggested that Forms might be thoughts in minds; that idea grew into the tradition of Forms as ideas in God's mind. Augustine knew Plotinus intimately. In the Latin West, Calcidius' partial translation of the *Timaeus* was the only substantial Plato available until the twelfth century.

In the Islamic world, al-Fārābī drew inspiration from the *Republic* and *Laws*, though it is unclear whether he had full Arabic translations or only summaries, perhaps Galen's synopsis; he wrote a *Summary of Plato's Laws* covering only the dialogue's opening books, and turned the philosopher-king into a philosopher-prophet-ruler suited to a multi-ethnic, multi-religious empire. Averroes wrote a commentary of sorts on the *Republic*, which *Al-Ghazālī, Averroes and the Quarrel over Reason* discusses, and Jewish authors also adapted the philosopher-king. About 250 Byzantine manuscripts of Plato survive; Gemistos Plethon's lectures at the Council of Florence (1438–39) revived interest in Plato, Cosimo de' Medici supplied the manuscript for Marsilio Ficino's translation in 1462, and Ficino's Latin translation was printed in 1484. Alfred North Whitehead wrote in 1929 that the European tradition "consists of a series of footnotes to Plato", meaning, he explained, not a system scholars had extracted but the wealth of ideas scattered through the dialogues. That may be the fairest verdict on the system question too.

## Further exploration

- **Julia Annas, *Plato: A Very Short Introduction* (2003).** A brief, lively overview by a leading scholar.
- **Constance Meinwald, *Plato* (2016).** An introduction by the leading defender of the "in relation to itself" reading of the *Parmenides*.
- **Robin Waterfield, *Plato of Athens: A Life in Philosophy* (2023).** A recent biography, careful about what can be known.
- **Rachana Kamtekar, *Plato's Moral Psychology: Intellectualism, the Divided Soul, and the Desire for Good* (2017).** The soul and motivation across the dialogues.
- **Cinzia Arruzza, *A Wolf in the City: Tyranny and the Tyrant in Plato's Republic* (2019).** The *Republic*'s politics read through its account of tyranny.
- **Myles Burnyeat and Michael Frede, *The Pseudo-Platonic Seventh Letter* (2015).** The case against the letter on which Plato's biography largely rests.
- **Al-Fārābī, *The Political Writings*, vol. II, trans. Charles E. Butterworth (2015).** Includes his *Summary of Plato's Laws*: Plato read in Islamic philosophy.$plato_master$,
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
  select $plato_quiz$[
    {"type": "mcq", "prompt": "What does stylometry suggest about the Phaedo and the Symposium, usually called 'middle' dialogues?", "options": ["It groups them with the early dialogues, unlike the usual content-based classification", "It shows they were written after the Laws", "It proves they are forgeries by Plato's students", "It places them in the late group with the Sophist and Timaeus"], "answerIndex": 0, "explanation": "Stylometry clearly separates a late group (Sophist, Statesman, Timaeus, Critias, Philebus, Laws) but puts the Phaedo and Symposium with the early group, while content analysis usually makes them 'middle'. Whether the three-period scheme is reliable is disputed.", "id": "q1"},
    {"type": "mcq", "prompt": "In the Republic's divided line, which kind of thinking reasons from assumptions with the help of images, as in mathematics?", "options": ["Imagination (eikasia)", "Belief (pistis)", "Reasoning (dianoia)", "Understanding (noēsis)"], "answerIndex": 2, "explanation": "The visible section divides into images and physical objects; the intelligible into dianoia, mathematical reasoning from hypotheses using images, and noēsis, understanding of the Forms rising to an unhypothetical first principle.", "id": "q2"},
    {"type": "mcq", "prompt": "What was David Sachs's famous objection to the Republic's account of justice?", "options": ["That justice cannot be defined at all", "That the city–soul analogy makes the city more important than the individual", "That Thrasymachus had already proved justice is the advantage of the stronger", "That Socrates answers a question about doing just acts with an account of a harmonious soul, without showing that such a soul never acts unjustly"], "answerIndex": 3, "explanation": "Sachs (1963) argued that Socrates changes the subject. Replies look to knowledge of the Form of the Good in Books V–VII, or to early education, to connect inner harmony with just action.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about al-Fārābī and Plato is best supported?", "options": ["He translated the whole Republic into Arabic", "He drew inspiration from the Republic and Laws, though full Arabic translations may never have existed, and recast the philosopher-king as a philosopher-prophet-ruler", "He rejected Plato in favour of Aristotle's Politics, which he knew well", "He founded a new Academy in Damascus"], "answerIndex": 1, "explanation": "Al-Fārābī wrote a Summary of Plato's Laws (covering only its opening books) and The Philosophy of Plato, but his access to the dialogues may have been limited; Averroes complained that Aristotle's Politics had not reached him in al-Andalus.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Third Man argument of the Parmenides step by step, then explain one reply to it.", "rubric": "A strong answer names the three principles (One-over-Many, Self-Predication, Non-Identity) and shows how they generate an infinite series of Forms of largeness, so that each Form is 'infinitely many'. It explains why the regress is vicious (an endless series explains nothing; it breaks one Form per property; Rickless: it makes each Form many). It then gives one reply: Vlastos's 'record of honest perplexity'; Meinwald's distinction between being large 'in relation to itself' and 'in relation to others', which makes the regress equivocate; or Rickless's view that Plato kept the Forms by dropping some of their features. It may note that Aristotle thought the argument decisive and that scholars remain divided.", "id": "q5"},
    {"type": "open", "prompt": "Was Plato's Republic feminist? Use the arguments of Book V and the debate among scholars.", "rubric": "A strong answer explains Book V's claim that women may be guardians and rulers with the same education because sex is as irrelevant to the work as long or short hair. It gives the case against (Annas: indifference to actual women, disparaging remarks such as men being better at almost everything, reasoning from the city's needs; Okin linking the proposal to abolishing the family) and the balanced verdict that the broad claim cannot be sustained while two features (irrelevance of sex to qualification; abolition of the private family) can reasonably be called feminist. Credit for mentioning the Laws' return of families and Okin's view that women's roles shrink there.", "id": "q6"}
  ]$plato_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/plato', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
