-- Democracy and Its Critics — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/democracy @ research/advanced/read.
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
    'philosophy/political-philosophy/democracy',
    'research',
    'advanced',
    'read',
    $democracy_master$> **Should the people rule, and why?** This chapter asks what democracy is and how Athens practised it, then weighs the case against it, from Plato's ship of state to today's epistocrats, and the case for it, from Aristotle's wisdom of the multitude to Condorcet's jury theorem. It sets out the jury-theorem argument step by step, with its objections and David Estlund's reply, and Jason Brennan's argument against rule by incompetent voters. It also meets Rousseau and Mill on representation, Arrow's theorem and the Riker–Mackie debate, majority tyranny, citizens' assemblies, the Confucian case for meritocracy and Kwasi Wiredu's democracy without parties.

## What Democracy Is

Tom Christiano and Sameer Bajaj's entry in the Stanford Encyclopedia of Philosophy (SEP) offers a deliberately neutral definition: democracy is "a method of collective decision making characterized by a kind of equality among the participants at an essential stage of the decision-making process." The equality may be shallow (one vote each for representatives) or deep (equal standing in public deliberation), and decisions may be made directly, as in a referendum, or through representatives.

The Greek *dēmokratia* joins *dêmos*, "people", and *krátos*, "force" or "power": literally "people power", where "monarchy" and "oligarchy" use *archē*. An early articulation of the idea is generally found in Aeschylus' *Suppliants* (probably 460s BCE), with its "people's hand of power"; the word itself is attested in Herodotus.

Two questions must be kept apart. **Justification** asks whether democracy is better than the alternatives; **authority** asks whether citizens must obey democratic decisions. The answers can come apart. *Authority and the State: the Social Contract and Its Critics* deals with the second; this chapter deals mainly with the first.

Justifications come in two families. **Instrumental** arguments judge democracy by its outcomes. Sen's is the most quoted: "no substantial famine has ever occurred in any independent country with a democratic form of government and a relatively free press." **Intrinsic** arguments find value in the method itself, whatever it produces: that it expresses liberty, equality or respect. Many of the sharpest disputes below are about which family matters more.

## Athens: Assembly, Lot and Potsherd

Athenian democracy grew through the reforms of Solon (594 BCE), Cleisthenes (508–507 BCE) and Ephialtes (462/1 BCE). Oligarchic coups interrupted it in 411 and 404 BCE, but it was restored and lasted until the Macedonian conquest in the late fourth century BCE (sources give 338 or 322 BCE). The wider story is in the History chapter *Ancient Greece*.

The **Assembly** (*ekklesia*) was open by right to every citizen. It passed decrees on war and citizenship, elected some officials, legislated and tried political crimes, voting usually by show of hands; it met ten fixed times a year in the fifth century and forty in the fourth. The **Council of 500**, chosen by lot every year, set its agenda. **Juries** of at least 200, occasionally up to 6,000, were drawn from an annual pool of 6,000 citizens over thirty. Of about 1,100 officials each year, most were chosen by **sortition** (selection by lot), using allotment machines called *kleroteria*, and, apart from the Council, on which a citizen could serve twice, no allotted office could be held twice by the same person; only about 100 were elected, notably the ten generals. Lot was thought to prevent the buying of office and to give everyone an equal chance, and most Athenians believed sortition, not elections, to be democratic.

Then there was **ostracism**: any citizen could be expelled from Athens for ten years by a vote cast on *ostraka*, potsherds used as ballots. First used in 487 BCE, it claimed about a dozen known victims over the next seventy years, including Aristides "the Just".

{{image: Kleroterion | A kleroterion, one of the allotment machines Athenians used to choose officials by lot.}}

This was direct democracy for a minority. Women, slaves, freed slaves and resident foreigners were excluded, and adult male citizens probably made up no more than 30 per cent of the adult population. Whether it worked is itself an argument about democracy: Josiah Ober has argued that Athens' enlarged decision-making body produced collective epistemic success.

## Plato's Craft Argument

Democracy's most famous early critic was Plato. His *Republic* (whose wider politics is in *Plato*) pictures the city as a ship. Its owner is strong but near-sighted and somewhat deaf; the sailors quarrel over the helm, each believing, in Jowett's translation, "he has a right to steer, though he has never learned the art of navigation", and insisting that navigation cannot be taught. They flatter and drug the owner and seize the ship, while the true navigator, who studies "the year and seasons and sky and stars and winds", is dismissed as "a star-gazer" (*Republic* VI, 488a–489d). The argument underneath:

1. Ruling is a craft that requires knowledge, like navigation.
2. A craft should be practised by those with the knowledge, not those who are popular.
3. Most citizens lack political knowledge.
4. To win office in a democracy, politicians must appeal to these citizens, so the skilled flatterer beats the expert.
5. So democracy hands the helm to demagogues; those who know should rule.

His answer, rule by philosopher-kings, is in the SEP's words a version of what Estlund would call **epistocracy**, rule by the knowledgeable. The replies come below: that the many may judge better together than the few, and that knowing more does not entitle anyone to rule.

## Aristotle: Polity and the Wisdom of the Multitude

Aristotle's six constitutions, told in *Aristotle*, class democracy as a deviant form, rule by the poor in their own interest. Yet his practical recommendation was a **polity** or **mixed constitution**, combining features of democracy, oligarchy and, where possible, aristocracy, "so that no group of citizens is in a position to abuse its rights" (Fred Miller's SEP summary); for most cities the best is one controlled by a numerous middle class.

In *Politics* III.11 he floats an argument now central to defences of democracy. Individually the many may be inferior to the virtuous few, but each has some portion of virtue and practical wisdom, which they can pool. In one translation, the many "when they come together may be better, not individually but collectively, than those who are so, just as public dinners to which many contribute are better than those supplied at one man's cost." Aristotle allows only that this "perhaps also involves some truth". How much he meant it is debated: Jeremy Waldron, in an essay of the 1990s, read the chapter as a deliberative argument anticipating modern epistemic democracy, while Daniela Cammack and Melissa Lane (both 2013) contest that reading.

## Rousseau: the People Cannot Be Represented

For Rousseau, whose general will is told in *The Enlightenment and Rousseau*, handing over one's right of ruling oneself to another is a form of slavery, even when representatives face re-election. Of the English people he wrote, in G. D. H. Cole's 1913 translation of *The Social Contract* (III.15), that it "is free only during the election of members of parliament. As soon as they are elected, slavery overtakes it, and it is nothing." Yet he separated the sovereign people, which makes general laws, from the government, which executes them; how democratic his republic was is disputed (Fralin; Cohen).

He also bequeathed a puzzle. Does voting *create* the general will or *discover* it? On the **constitutive** reading, whatever a properly organised procedure produces simply is the general will. On the **epistemic** reading, the vote tracks a common good that exists independently of it. One passage (*Social Contract* II.3) seems to support the second: if a sufficiently informed people deliberated without communicating among themselves, "the general will would always result from the large number of small differences" (in the SEP's translation). Grofman and Feld (1988) read this through Condorcet's theorem; Wyckoff (2011) is sceptical.

## Mill: Participation and Plural Votes

Mill's *Considerations on Representative Government* (1861), set in context in *Bentham, Mill and Utilitarianism*, gives two arguments for democracy. The protective one: universal suffrage best ensures that the interests of the governed are understood, against the bias and failure of imagination of any ruling group. The educative one: taking part teaches citizens to gather information, deliberate, exchange reasons and form a conception of the common good. He favoured representatives who vote their own considered view of the common good, elected by Thomas Hare's proportional representation, which protects minority opinion.

Yet Mill also proposed **plural voting** (*Considerations*, ch. VIII): everyone a vote, the educated more, weighted by education rather than property and capped so that the educated could not form a class majority. The SEP calls this a form of epistocracy. Mill's defence:

```quote
Everyone has a right to feel insulted by being made a nobody, and stamped as of no account at all. No one but a fool … feels offended by the acknowledgment that there are others whose opinion … is entitled to a greater amount of consideration than his.
Mill · Considerations on Representative Government · 1861
```

David Brink judges in the SEP that Mill shows "something of a tin ear for egalitarian concerns": extra votes brand others second-class citizens.

## The Jury Theorem

The most influential argument that numbers bring wisdom was published in 1785 by the Marquis de Condorcet. As Franz Dietrich and Kai Spiekermann state it in the SEP, **Condorcet's jury theorem** concerns a choice between two alternatives, exactly one correct, decided by majority vote. It assumes **independence** (whether one voter is right is independent of whether any other is) and **competence** (each voter has the same probability, greater than one half, of being right); Christiano adds **sincerity**, voting for what one believes correct. Its conclusion: the probability that the majority is right increases with the size of the (odd-numbered) group and tends to 1.

Three voters each right 80 per cent of the time give a correct majority 89.6 per cent of the time; ten thousand voters each right 51 per cent of the time, about 97.7 per cent (a figure the SEP's democracy entry misprints as 99.97). But the theorem cuts both ways: if each voter is more likely to be *wrong* than right, adding voters makes the majority more likely to be wrong, and the most reliable "jury" is a single voter. Here is the argument it supports:

1. On many political questions there is a correct answer that does not depend on the vote.
2. Each voter is more likely than not to answer such a question correctly, and votes sincerely and independently.
3. By the jury theorem, the probability that the majority is right then rises with the number of voters and approaches certainty.
4. A whole electorate is far larger than any body of experts.
5. So majority rule by the whole people is more reliable than rule by the few, and its verdicts deserve deference.

**Objections.** Premise 2 bears the weight. Votes are not independent: people persuade one another, follow the same parties and media, and share ideological biases, and information is segmented by class, race and religion. Dietrich and Spiekermann treat shared evidence as a common cause that undermines independence, and names unequal competence as the main threat: if new voters are less competent than existing ones, a larger majority can become *less* reliable, even sliding towards a coin toss. When competence differs, the theorem's own mathematics favours weighting the votes of the more competent, which is what meritocrats ask for. A further worry, raised in the SEP's democracy entry, is that the theorem would "prove too much": the losing minority should conclude it was wrong and change its mind, leaving no room for a loyal opposition. And the claim that a vast electorate becomes, in the limit, infallible is in Dietrich and Spiekermann's verdict untenable; theorems that reach it "might be seen as arguments against their own premises".

**Reply.** Versions with weaker, more realistic premises still support **increasing reliability** (larger bodies tend to do better) without promising infallibility. And Estlund's **epistemic proceduralism** asks far less. If fairness alone mattered, he argues, a coin flip would do as well as an election, so democratic authority needs an epistemic element. But it needs only that democracy be better than random and close to the best procedure that all "qualified" (reasonable) points of view could accept. That requires no one to abandon their views, and gives no licence for epistocracy, since any test of expertise is open to reasonable objection.

```checkpoint
q: According to Condorcet's jury theorem, what happens as more voters join if each voter is more likely to be wrong than right?
a*: The majority becomes more likely to be wrong, so the most reliable decision-maker is a single voter.
a: The majority still becomes more reliable, only more slowly.
x: The theorem's conclusion depends on competence above one half; below it the effect reverses.
a: Nothing changes, because the errors cancel out.
x: When every voter leans towards the wrong answer, more votes reinforce the error rather than cancelling it.
a: The majority becomes infallible in the limit.
x: Infallibility in the limit would need competence above one half, and even then Dietrich and Spiekermann judge the infallibility hypothesis untenable.
hint: Picture coins biased slightly towards the wrong answer.
why: With competence below one half, adding voters raises the probability that the majority errs, so the theorem can argue against mass democracy as easily as for it.
---
q: How does Estlund's epistemic proceduralism answer the objection that the jury theorem "proves too much"?
a: It insists that a sufficiently large electorate is infallible.
x: Estlund needs no infallibility, and Dietrich and Spiekermann regard that claim as untenable.
a: It holds that democratic decisions are legitimate only when they are correct.
x: Estlund explicitly distinguishes his view from such a "correctness theory".
a*: It claims only that democracy is better than random and close to the best procedure acceptable to all reasonable points of view, so no one must abandon their views.
a: It concludes that the most competent citizens should have extra votes.
x: That is the meritocrat's use of weighted majority; Estlund rejects epistocracy because any expertise test is open to reasonable objection.
hint: How much epistemic quality does Estlund actually require of a procedure?
why: Because he claims only a modest epistemic edge plus acceptability to all qualified points of view, losing a vote is no proof that one was wrong, and the opposition keeps its place.
```

## Is There a Will of the People?

Condorcet also found the **paradox of voting**. If a third of voters rank A over B over C, a third B over C over A, and a third C over A over B, majorities prefer A to B, B to C and C to A: the collective preference goes round in a circle. Kenneth Arrow's **impossibility theorem** (*Social Choice and Individual Values*, 1951) generalised the problem: with three or more options, in its standard form, no method of combining preferences satisfies five plausible conditions at once, namely that it work for any pattern of preferences, have no dictator, produce a consistent ranking without cycles, rank two options independently of irrelevant third ones, and follow unanimous preferences.

William Riker's *Liberalism Against Populism* (1982) read this as proof that "populist" democracy, the idea that voting reveals a collective will, is untenable: whoever controls the agenda can steer the outcome. What survives is the "liberal" view that elections let voters remove officials, which Riker thought good instrumental reason to keep democracy. Gerry Mackie's *Democracy Defended* (2003) replied that real societies usually avoid cycles and, according to summaries of the book, that nearly every published example of a political cycle, Riker's included, falls apart on re-examination. Mackie also argued that the independence condition equivocates on "irrelevance": in the 2000 US election Nader, being on the ballot, was relevant to how voters ranked Gore and Bush in a way Lincoln was not. How common cycles are remains disputed.

## Tyranny of the Majority

Even a reliable majority can be wrong about someone. Madison's *Federalist* No. 10 (November 1787) defined a **faction** as "a number of citizens, whether amounting to a minority or majority of the whole, who are united and actuated by some common impulse of passion, or of interest, adverse to the rights of other citizens …". Its causes are "sown in the nature of man", above all in unequal property, and since "liberty is to faction what air is to fire", the remedy is to control its effects. A small "pure democracy" cannot; a large republic can, because representatives may "refine and enlarge" public opinion and many interests make a factious majority harder to form. (The founding is in the History chapter *Declarations of Independence: the American Revolution*.) Tocqueville's *Democracy in America* (1835–40) put the danger starkly:

```quote
So what is a majority taken as a whole, if not an individual who has opinions and, most often, interests contrary to another individual called the minority. … the power to do everything that I refuse to any one of my fellows, I will never grant to several.
Tocqueville · Democracy in America, vol. 1, trans. James T. Schleifer · 1835
```

Christiano adds a subtler problem, the **persistent minority**, such as an indigenous people, that loses every vote; its subjection can be oppressive even if the majority means no harm.

## Epistocracy: Brennan's Challenge

The evidence about voters is unflattering. Since Converse's pioneering work in 1964, political scientists have found citizens poorly informed, reliant on cues and given to motivated reasoning. Downs (1957) explained why: the chance of casting the deciding vote is tiny (in a US presidential election, often put at about 1 in 100 million), so ignorance is rational.

Jason Brennan's *Against Democracy* (2016) sorts citizens into **hobbits**, indifferent and ignorant; **hooligans**, "the rabid sports fans of politics", with fixed opinions and a biased diet of information, which describes most regular voters; and **vulcans**, who reason scientifically and can state opposing views to their holders' satisfaction. No one, he concedes, is a true vulcan. His argument:

1. People have a right not to be subjected to high-stakes decisions made by incompetent or morally unreasonable decision-makers, as a defendant has a right not to be tried by an ignorant or prejudiced jury.
2. An electorate makes high-stakes decisions, and much of it is ignorant, misinformed or biased.
3. So universal suffrage violates that right.
4. Some epistocratic arrangements, such as a voting exam, plural voting or an epistocratic veto, would plausibly decide better.
5. So, if they would, epistocracy is presumptively preferable.

**Objection.** Estlund, who coined the word "epistocracy", raised the **demographic objection** (2003): any test of political competence is likely to select a demographically narrow group whose shared biases distort its judgement of the general welfare. Moreover, knowing more does not make anyone the boss: epistemic authority is not political authority. Other critics doubt the survey evidence (Kevin J. Elliott), warn that epistocracy could restore hierarchies like Jim Crow (Nathan J. Robinson), or doubt that the knowledgeable are more likely to be just (Valerie Soon).

**Reply.** Brennan answered the demographic objection in a 2018 article in *Res Publica*. His general stance is that epistocratic institutions should be judged by their expected institutional performance, an empirical bet, and that democracy's supposed educative and intrinsic benefits do not outweigh the harm of incompetent rule.

There is also a rival epistemic case. Hélène Landemore's *Democratic Reason* draws on Lu Hong and Scott Page's theorem (2004) that a random group of limited problem-solvers "typically outperforms a collection of the very best agents", since the best tend to think alike; inclusive democracy, she argues, gains from cognitive diversity. Abigail Thompson (2014) replied that the mathematics dresses up a trivial result, and that, on her account, under realistic assumptions ability can beat diversity.

## Equality as the Point

Christiano's intrinsic **public equality** argument sidesteps these contests over competence. People's interests ought to be advanced equally; everyone's understanding of interests is "highly fallible and biased"; people have a fundamental interest in being able to *see* that they are treated as equals; amid deep disagreement, an equal say is the publicly visible way to do that; so democracy is required by justice, and refusing to obey suitably egalitarian decisions treats one's fellow citizens as inferiors. The argument limits itself: a democracy may not abolish anyone's democratic or basic liberal rights, and persistent minorities undercut its authority over them. Critics ask whether such equality is coherent in large, complex states, and whether it protects minorities from majority tyranny.

```checkpoint
q: What is Estlund's "demographic objection" to epistocracy?
a: Most voters belong to the poorest demographic, so democracy is rule by the poor.
x: That is closer to Aristotle's description of democracy, not Estlund's objection.
a*: Any test of competence will likely select a demographically narrow group whose shared biases distort its judgement of the common good.
a: Hobbits and hooligans outnumber vulcans in every demographic group.
x: That is Brennan's description of voters, which the objection is meant to answer.
a: Knowledge tests are too expensive to give a whole population.
x: The objection is not about cost but about whose biases the test would empower.
hint: Ask who would tend to pass the exam, and what they might fail to see.
why: Even if the selected group knows more on average, it may be blind in systematic ways, and no criterion of expertise is beyond reasonable objection. Brennan replied in 2018.
---
q: Which of these is part of Christiano's public-equality argument for democracy?
a: Majorities are more likely than individuals to be right.
x: That is the jury-theorem argument, an instrumental case; Christiano's is intrinsic.
a: A democracy may abolish the rights of a minority if the majority votes for it.
x: Christiano holds that a democracy cannot legitimately abolish anyone's democratic or basic liberal rights.
a: Voting is valuable because it educates citizens in deliberation.
x: That is Mill's educative argument.
a*: People have a fundamental interest in being able to see that they are treated as equals, and an equal say is the publicly visible way to do that.
hint: The key word is "public".
why: Because everyone's judgement is fallible and biased, equality must be visible to all; an equal say amid disagreement is the uniquely public way to treat people as equals.
```

## Deliberation and the Lottery

From the 1990s many theorists turned from voting to reasoning together. The term **deliberative democracy** was coined by Joseph Bessette in 1980; Joshua Cohen (1989) made deliberation among free and equal citizens the source of legitimacy; Gutmann and Thompson define it as citizens and representatives giving "one another reasons that are mutually acceptable and generally accessible". Habermas's version is told in *Critical Theory: the Frankfurt School and Habermas*; critics such as Estlund reply that consensus is unrealistic in diverse societies.

Practice followed. James S. Fishkin, who first described the **deliberative poll** in 1988, has a random sample polled, briefed with balanced materials, set to deliberate with one another and with experts, and polled again. A Chinese township used them for budgeting in the 2000s. Ireland's **Citizens' Assembly** (2016–18) brought together 99 randomly selected citizens under a chair, the Supreme Court judge Mary Laffoy; its work on abortion preceded the referendum of 25 May 2018, approved with 66.4 per cent of the vote. Alex Guerrero's "lottocracy" (2014) would go further and replace elections with bodies chosen by lot, as in Athens. Cristina Lafont objects that citizens have an interest in governing themselves, not merely an equal chance of being picked; Brennan, that deliberation works only among vulcans.

## The Confucian Case for Meritocracy

The strongest contemporary alternative comes from a revived Confucianism, recalling the imperial examinations that began under the Sui (581–618 CE). Daniel A. Bell's *The China Model* (2015) defends "democracy at the bottom, experimentation in the middle, and meritocracy at the top", and argues that China lies outside a binary of good democracy and bad authoritarianism. Joseph Chan's *Confucian Perfectionism* (2014) proposes a two-chamber legislature, one elected and one meritocratic, and treats human rights as an instrumental "fallback". Tongdong Bai (2020) defends government "for the people, of the people, but not by the people".

Thomas Mulligan's SEP entry insists these thinkers are not apologists for the Chinese Communist Party: they reject one person, one vote, but are best read as hybrids of classical Confucianism and contemporary democratic theory. **Confucian democrats** answer from inside the tradition: Angle, Tan, and Hall and Ames hold that participation is essential to cultivating Confucian virtue, Sungmoon Kim that democracy copes better with pluralism. Some reviewers of Bell went further: Andrew Nathan's 2015 essay "Beijing Bull: The Bogus China Model" (*The National Interest*) is reported to argue that actual leadership selection is far from what Bell describes. Whether Mencius leaned towards democracy is a separate debate, covered in *Authority and the State: the Social Contract and Its Critics*; the classical sources are in *Confucius, Mencius and Xunzi*.

## Consensus without Parties

Kwasi Wiredu, whose wider work is told in *African Philosophy: the Ethnophilosophy Debate and Beyond*, argued in the mid-1990s that the traditional Ashanti system "was a consensual democracy": democratic because government was by the consent and under the control of the people through their representatives, consensual because that consent was negotiated by seeking agreement. Majoritarian systems, by contrast, rest on "consent without consensus". Among the Akan, consensus came through often protracted disputation among elders; in the SEP's words it "was not imposed, but relentlessly pursued". Wiredu's modern proposal was a **non-party polity**, distinct from the one-party states whose rulers appealed to a myth of African unanimity, a myth Oruka and Hountondji attacked.

The proposal provoked a debate, known here mainly through summaries. Emmanuel Chukwudi Eze's "Democracy or Consensus? A Response to Wiredu" (1997) is reported to raise three objections; T. Carlos Jacques reportedly argued that the line between non-party and one-party rule is largely semantic; and Bernard Matolino, after first defending consensual democracy against Eze, later concluded that abolishing parties is not compelling. Sen's essay "Democracy as a Universal Value" (1999) offers one way to frame the whole chapter: democracy, Sen argued, is more than majority rule taken in isolation.

## Further exploration

- **David Estlund, *Democratic Authority: A Philosophical Framework* (2008).** Epistemic proceduralism, the coin-flip argument and the demographic objection to epistocracy.
- **Jason Brennan, *Against Democracy* (2016).** Hobbits, hooligans and vulcans, and the case for epistocracy.
- **Gerry Mackie, *Democracy Defended* (2003).** A reply to Riker's argument that social choice theory makes the popular will meaningless.
- **Josiah Ober, *Democracy and Knowledge: Innovation and Learning in Classical Athens* (2008).** Athens as a democracy that pooled knowledge.
- **Daniel A. Bell, *The China Model: Political Meritocracy and the Limits of Democracy* (2015).** The leading contemporary case for political meritocracy.
- **Joseph Chan, *Confucian Perfectionism: A Political Philosophy for Modern Times* (2014).** A Confucian case for a mixed democratic and meritocratic order.
- **Kwasi Wiredu, *Cultural Universals and Particulars: An African Perspective* (1996).** Includes his account of consensus democracy and the non-party polity.$democracy_master$,
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
  select $democracy_quiz$[
    {"type": "mcq", "prompt": "How were most of the roughly 1,100 office-holders of democratic Athens chosen each year?", "options": ["By election in the Assembly", "By lot (sortition)", "By inheritance within the ten tribes", "By examination of their knowledge of the laws"], "answerIndex": 1, "explanation": "Most offices were filled by lot, using allotment machines (kleroteria), and, apart from the Council, no allotted office could be held twice by the same person; only about 100 offices, notably the ten generals, were elected. Most Athenians believed sortition, not elections, to be democratic.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these is an assumption of Condorcet's jury theorem in its classical form?", "options": ["Each voter has the same probability, greater than one half, of choosing the correct one of two alternatives, and votes independently", "Voters deliberate together before voting so that their errors cancel out", "At least one voter is an expert who is always right", "There are three or more alternatives and voters rank them all"], "answerIndex": 0, "explanation": "The theorem assumes two alternatives, one correct, decided by majority, with independent voters of equal competence above one half (and, Christiano adds, sincere). Deliberation and shared information threaten independence; three or more alternatives belong to Arrow's theorem and Condorcet's paradox.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Gerry Mackie argue in Democracy Defended (2003)?", "options": ["That Arrow's theorem contains a mathematical error", "That deliberation always produces consensus", "That voting cycles are rare in real societies, and that Riker's claim that social choice theory refutes 'populist' democracy fails", "That majority rule should be replaced by sortition"], "answerIndex": 2, "explanation": "Mackie accepted the theorem but argued that modern societies normally avoid cycles, re-examined Riker's examples of cycles, and argued that the independence condition equivocates on 'irrelevance', as the Nader–Gore–Bush example shows.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the New Confucian meritocrats (Bell, Chan, Bai and others) matches the SEP's account?", "options": ["They are apologists for the Chinese Communist Party", "They support one person, one vote but reject representative government", "They reject meritocracy as un-Confucian", "They are not Party apologists, but they deny that citizens should be treated as equals when it comes to voting"], "answerIndex": 3, "explanation": "Mulligan's SEP entry says these theorists are not CCP apologists and are best read as hybrids of classical Confucianism and contemporary democratic theory; all deny the truth and usefulness of regarding citizens as equals in voting. Bell, for instance, defends democracy at the bottom and meritocracy at the top.", "id": "q4"},
    {"type": "open", "prompt": "Set out Jason Brennan's competence argument for epistocracy step by step. Then give Estlund's demographic objection and assess whether it defeats the argument.", "rubric": "A strong answer gives the premises: a right not to be subjected to high-stakes decisions by incompetent or morally unreasonable decision-makers (the jury analogy); electorates make high-stakes decisions and are largely ignorant, misinformed or biased (hobbits and hooligans, with the evidence from Converse onwards and Downs's rational ignorance); so universal suffrage violates the right; some epistocratic arrangement (voting exam, plural voting, epistocratic veto) would plausibly do better; so epistocracy is presumptively preferable. It notes that premise 1 is a rights claim rather than a purely consequentialist one. It explains the demographic objection: any competence test will likely select a demographically narrow group whose biases distort its judgement of the general welfare, together with Estlund's point that epistemic authority is not political authority and any expertise criterion is open to reasonable rejection. Assessment should note that Brennan replied (2018) and treats the question as an empirical one of expected institutional performance; credit for other critics (Elliott on the survey data, Robinson on Jim Crow, Soon on knowledge and justice) and for Landemore's diversity argument with Thompson's criticism.", "id": "q5"},
    {"type": "open", "prompt": "Does the size of a group make its judgements wiser? Discuss with reference to Aristotle's Politics III.11, Condorcet's jury theorem and Hong and Page's diversity theorem, and say what each implies for democracy.", "rubric": "A strong answer explains Aristotle's suggestion that the many, each with a portion of virtue and practical wisdom, may judge better collectively than the virtuous few (the public-dinners image), noting that he allows only that it 'perhaps also involves some truth' and that its reading is debated (Waldron versus Cammack and Lane). It states the jury theorem precisely (two options, majority voting, independence, equal competence above one half; reliability rises with group size towards 1), notes the reversal when competence is below one half, the threats from common causes and competence heterogeneity, and Dietrich and Spiekermann's verdict that infallibility is untenable while increasing reliability can survive with weaker premises. It explains Hong and Page's claim that a random group of limited problem-solvers can outperform the best, as used by Landemore, and Thompson's criticism. It draws conclusions, for instance via Estlund's modest claim that democracy need only be better than random and acceptable to all qualified points of view, or the meritocrat's use of weighted majority.", "id": "q6"}
  ]$democracy_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/democracy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
