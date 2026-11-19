-- Consequentialism: What Makes Right Acts Right? — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/consequentialism @ research/advanced/read.
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
    'philosophy/ethics/consequentialism',
    'research',
    'advanced',
    'read',
    $conseq_master$> **Is an act right because of what it brings about?** This chapter sets out consequentialism, which judges acts by their outcomes. It starts with Peter Singer's drowning-child argument, explains how the theory is built (the good and the right, maximising and its rivals, act and rule versions), asks whether the ancient Chinese Mohists were consequentialists, works through the trolley problems, weighs the objections from justice, integrity, friendship and demandingness, touches on the repugnant conclusion, and ends with effective altruism and its critics.

## The Child in the Pond

In 1971, as refugees from the war in East Bengal were starving, Peter Singer wrote "Famine, Affluence, and Morality" (published 1972). Its argument can be set out whole:

1. "Suffering and death from lack of food, shelter and medical care are bad."
2. "If it is in our power to prevent something bad from happening, without thereby sacrificing anything of comparable moral importance, we ought, morally, to do it."
3. Test the principle on a case. If you pass a shallow pond where a child is drowning, "I ought to wade in and pull the child out. This will mean getting my clothes muddy, but this is insignificant, while the death of the child would presumably be a very bad thing."
4. Distance does not matter: "It makes no moral difference whether the person I can help is a neighbor's child ten yards from me or a Bengali whose name I shall never know, ten thousand miles away."
5. Nor does the number of others who could help: "The principle makes no distinction between cases in which I am the only person who could possibly do anything and cases in which I am just one among millions in the same position."
6. So the affluent ought to give far more to famine relief than people normally do, and much of what we call "charity" is really duty. The usual line between duty and charity, Singer argued, cannot be drawn where it usually is.

Singer also offered a weaker, "moderate" version, which asks us to prevent something very bad only when doing so sacrifices nothing morally significant; even that, he argued, would require large changes in how the affluent live.

**Objection.** The conclusion asks too much. This **demandingness objection** has been pressed by John Arthur, John Kekes and Kwame Anthony Appiah, who doubt that commonsense morality leads by a straight path to such heavy giving. Appiah, for one, argues that commonsense morality supports rescuing the child in front of us without committing us to Singer's conclusion.

**Reply.** Defenders such as Shelly Kagan and Singer himself bite the bullet: we really are required to do far more, and the intuition that this is too much may simply be unreliable. And the moderate principle still yields large obligations. Whether the conclusion can be resisted depends on the structure of consequentialist theory, to which we now turn.

## What Consequentialism Says

The Stanford Encyclopedia of Philosophy (SEP), in Walter Sinnott-Armstrong's entry, defines **consequentialism** as "the view that normative properties depend only on consequences". Its best-known form concerns the rightness of acts, which may depend on the consequences of the act itself or of something related to it, such as a motive or a general rule. The word was coined by G. E. M. Anscombe in 1958, though for her it first named a view about responsibility; its present meaning came later.

The paradigm is **utilitarianism**, whose classic defenders were Bentham, Mill and Sidgwick; their lives and arguments are told in *Bentham, Mill and Utilitarianism*. Mill's statement was that actions "are right in proportion as they tend to promote happiness, wrong as they tend to produce the reverse of happiness." On the SEP's formulation of **act consequentialism**, an act is right if and only if the total good it produces for everyone, minus the total bad, is greater than for any alternative open to the agent.

A broken promise, on this view, is wrong because of its future effects, not because of the past act of promising. Sinnott-Armstrong separates classic utilitarianism into eleven mostly independent claims, among them that pleasure is the only good (**hedonism**), that we must produce the best outcome (**maximising**), that goods are added up across people (**aggregation**), and that the value of outcomes does not depend on whose point of view one takes (**agent-neutrality**). Dropping one or more yields the many descendants now called "consequentialism"; whether a theory must be agent-neutral to count is itself debated.

Every such theory needs two parts: a **theory of the good** (what makes outcomes better) and a **theory of the right** (how rightness depends on that). The good can be pleasure, the satisfaction of preferences, a plural list (Moore added beauty and knowledge).

Must we always do the *best*? Michael Slote's **satisficing** consequentialism (1984) asks only that we produce *enough* good. **Scalar** consequentialism drops the verdicts "right" and "wrong" and ranks acts as better or worse: giving \$1,000 is better than giving \$100 and worse than giving \$10,000. Mill had already loosened the link between "ought" and "wrong": "We do not call anything wrong, unless we mean to imply that a person ought to be punished in some way or other for doing it". So one might fall short of the best without doing wrong.

## Acts, Rules and Decision Procedures

A crucial distinction is between a **criterion of rightness** (what makes acts right) and a **decision procedure** (how to decide what to do). The SEP reports that "most classic and contemporary utilitarians and consequentialists do not propose their principles as decision procedures." Sidgwick wrote that the end which gives the criterion need not always be "the end at which we consciously aim". As the SEP puts it, a golfer need not calculate physical forces while planning a shot. Brad Hooker gives four reasons why calculating case by case would backfire: we lack information; getting it is costly; we miscalculate, especially when biased or rushed; and if everyone calculated, no one could trust anyone.

That opens room for **rule consequentialism**. **Act** consequentialism judges each act by its own outcome; rule consequentialism judges acts by rules, and rules by the consequences of their being generally *accepted*. Hooker's version, in *Ideal Code, Real World* (2000), ranks codes by the expected good of teaching them to a new generation and having them accepted by an overwhelming majority (roughly 90 per cent), counting the cost of teaching. The winning code includes rules against harming innocent others and breaking promises.

**Objection: collapse.** If a rule against stealing is better with an exception wherever stealing would do more good, the ideal rule becomes "don't steal except when…", and rule consequentialism collapses into act consequentialism; David Lyons (1965) argued the two are extensionally equivalent. **Reply.** Hooker answers that codes are ranked by the cost of teaching and accepting them, and a rule cluttered with exceptions is hard to learn and invites self-serving excuses, so the simpler code wins even where following it fails to maximise. J. J. C. Smart pressed a second charge, **rule worship**: why keep a rule when breaking it would do more good? Hooker replies that the code includes a rule to prevent disaster, triggered only when much more is at stake, and that its followers aim not to maximise but to do what is impartially defensible. The debate continues, as does the scholarly dispute over whether Mill was an act or a rule utilitarian.

## The First Consequentialists? Mohism

Long before Bentham, the Mohists of Warring States China argued from benefit. Chris Fraser, in the SEP, says they "advanced the world's earliest form of consequentialism, a remarkably sophisticated version based on a plurality of intrinsic goods taken as constitutive of collective human welfare." Their story is told in *Mozi, the Daoists and the Legalists: the Hundred Schools*; here the question is what kind of theory theirs is.

```quote
Does it benefit people? Then do it. Does it not benefit people? Then stop.
Mozi · Book 32, "Condemning Music", trans. Chris Fraser · Warring States period
```

The standard is *lì* (利), benefit, which Fraser glosses as an objective list of three goods: material wealth, a large population, and social order. Unlike Bentham and Mill, the Mohists aimed not at individual happiness but at goods that are largely public and collective. They judged practices rather than single acts: lavish funerals and prolonged mourning should be kept if they "can really enrich the poor, increase the few, secure the endangered, and bring order to the disordered", and abolished if not. Fraser therefore calls the view "practice" or "*dao* (way) consequentialism", closer to rule than to act consequentialism.

Is "consequentialism" the right label? The SEP's history of utilitarianism calls Mozi "proto-utilitarian", following Van Norden. Ivanhoe and Van Norden speak of "state consequentialism", aimed at the wealth, order and population of the state; Fraser replies that the Mohists sought to benefit all the people of the world, not one state. A different line of scholars (Dennis Ahern, David Soles and others) has read Mohism as a **divine-command** theory, since the Mohists grounded their standard in the intention of Heaven (*Tian*), the wisest moral agent, whose conduct is a reliable model. Hui-chieh Loy thinks the dispute is badly framed in modern categories, though a genuine question remains: how Heaven's will and good consequences relate. Other traditions offer partial parallels: the medieval Indian Buddhist Śāntideva has been read as proto-utilitarian (Charles Goodman), and in 1728 Susanna Newcome argued that our duties are duties to promote happiness, including stringent duties to the needy.

```checkpoint
q: What is the difference between a criterion of rightness and a decision procedure?
a*: A criterion says what makes acts right; a decision procedure is a method for deciding what to do, and the two can come apart.
a: A criterion applies to rules, while a decision procedure applies to acts.
x: Both concern acts; the difference is between what makes an act right and how we decide what to do.
a: A decision procedure is the theory of the good, and a criterion is the theory of the right.
x: The good/right distinction is a different one, about what is valuable and how rightness depends on it.
a: Only rule consequentialists accept a criterion of rightness.
x: Act consequentialists also offer a criterion; most of them deny it should be used as a constant decision procedure.
hint: Think of the golfer and the laws of physics.
why: Most consequentialists, from Bentham and Sidgwick on, do not propose their principle as something to calculate with before every act. Hooker lists missing information, its cost, calculation errors and the loss of trust as reasons why calculating case by case would backfire.
---
q: Why does Chris Fraser call Mohist ethics "dao consequentialism"?
a: Because the Mohists measured benefit by the happiness of each individual.
x: Mohist benefit is an objective list of largely collective goods, not individual happiness.
a: Because the Mohists rejected any appeal to Heaven.
x: The Mohists grounded their standard in Heaven's intention; that is why some read them as divine-command theorists.
a*: Because they judged ways and practices, such as burial customs, by their benefit rather than evaluating single acts.
a: Because they judged each single act by its own outcome.
x: That would be act consequentialism; the Mohists judged ways and practices.
hint: Consider the burial argument.
why: The Mohists asked whether practices such as lavish funerals enrich the poor, increase the population and bring order. Fraser thinks this resembles rule consequentialism but is better called practice or dao consequentialism; whether "consequentialism" fits at all is debated.
```

## The Trolley Problems

{{image: Trolley problem | The switch case: a runaway trolley heads for five people, and pulling a lever would divert it onto a side track where it would kill one.}}

The trolley cases began in a paper about abortion. In "The Problem of Abortion and the Doctrine of the Double Effect" (1967), Philippa Foot compared a judge who could stop rioters killing five hostages only by framing and executing an innocent man with the driver of a runaway tram who "can only steer from one narrow track on to another; five men are working on one track and one man on the other". Foot judged that the judge must not frame the man but that the driver may steer, and explained the difference not by double effect but by **doing versus allowing**: the judge chooses between killing one and letting five die, the driver between killing one and killing five.

Judith Jarvis Thomson named "the trolley problem" in 1976 and returned to it in 1985. Her **bystander** at a switch clearly chooses between killing one and letting five die, yet turning the trolley still seems permissible, which undermines Foot's explanation. In the **footbridge** case the only way to stop the trolley is to push a large man off a bridge into its path; most people approve of switching but not of pushing, though each saves a net four lives. The **doctrine of double effect** offers an explanation: in the switch case the one's death is a foreseen side effect, in the footbridge case a means. (*Deontology: Duty and Respect* examines that doctrine.) In the **transplant** case, a surgeon could cut up a healthy patient to save five who need organs; classical utilitarianism, with the right unrealistic details, seems to permit or even require it, and "Most people find this result abominable," the SEP observes.

In Thomson's **loop** case the side track loops back, so the trolley would hit the five from behind but for the one person's body stopping it. Now his death is a means, yet many still find turning permissible, a problem for double effect. Frances Kamm's **doctrine of triple effect** (first proposed in 2000 and developed in *Intricate Ethics*, 2007) distinguishes acting *in order that* an evil occur from acting *because* it will occur: in the loop one turns the trolley because the one will be hit, not in order that he be hit. S. Matthew Liao and Michael Otsuka are among its critics.

Then, in "Turning the Trolley" (2008), Thomson changed her mind and argued that the bystander may *not* turn the trolley. Give him a third option, turning it onto himself, and few would take it. If you would not pay the cost yourself, you may not impose it on a stranger; that would be like stealing someone's wallet to give to charity. William FitzPatrick (2009) replied that turning remains permissible: morality cannot demand such self-sacrifice, yet the reasons to minimise deaths remain compelling. What explains the cases thus remains disputed: doing and allowing, double effect, triple effect, or nothing, because switching is wrong too. Professional philosophers mostly keep the original verdict: in the 2009 PhilPapers survey, 68 per cent would switch, 8 per cent would not and 24 per cent gave other answers.

## What the Trolley Cases Show: Greene and His Critics

In 2001 Joshua Greene and colleagues reported in *Science* that "personal" dilemmas such as the footbridge engaged emotion-related brain regions more than "impersonal" ones such as the switch. Greene went on to propose a **dual-process** model: characteristically deontological judgments rest mainly on fast, automatic emotional responses, characteristically consequentialist ones on conscious reasoning and cognitive control. In "The Secret Joke of Kant's Soul" (2008) he argued that deontology is largely rationalisation after the fact. He suggested that we have reasons to be suspicious of our deontological judgments, sparking what the SEP calls a heated debate, which exposed a tendency to draw normative conclusions from purely descriptive data. Selim Berker's "The Normative Insignificance of Neuroscience" (2009) argued, as its title says, that the brain findings carry no normative weight by themselves. Guy Kahane and colleagues (2018) argued that sacrificial dilemmas measure a permissive attitude to instrumental harm, not impartial concern for the greater good, and Thomas Nagel objected that impartiality need not mean utilitarianism, since Kant and Rawls offer impartial theories too. Whether such thought experiments are trustworthy evidence at all is now part of the debate.

## Justice, Separateness and Integrity

The transplant and the framed innocent press the **objection from justice**: consequentialism seems to permit terrible acts against individuals when the numbers favour them. Utilitarians have several replies. Some bite the bullet, arguing that intuitions formed for normal life misfire in such unrealistic cases. Others go indirect: a publicly known rule permitting such transplants would make patients fear doctors and wreck trust in medicine, so rule consequentialism forbids it. Direct consequentialists, Smart among them, find it convoluted to judge one doctor's act by other doctors' mistakes.

A deeper charge came from Rawls in *A Theory of Justice* (1971): utilitarianism "does not take seriously the distinction between persons". Bernard Williams put it in a phrase: "if Kantianism abstracts in moral thought from the identity of persons, utilitarianism strikingly abstracts from their separateness." *Self and No-Self: Personal Identity East and West* discusses this objection in relation to Parfit's view of persons, and *Justice and Equality* sets out Rawls's alternative.

Williams's "A Critique of Utilitarianism", in *Utilitarianism: For and Against* (1973), written with Smart, adds the **integrity objection**, through two stories. George, a chemist, is offered a job in chemical and biological weapons research; if he refuses, he and his family will suffer poverty, and someone else, who would do more harm, will take the job anyway. Jim, a visitor whom the captain treats as an honoured guest in a small South American town, is offered by an army captain the chance to shoot one of twenty captives; if he refuses, all twenty will be killed. Utilitarianism tells George to take the job and Jim to shoot.

The SEP entry on Williams, by Sophie-Grace Chappell and Nicholas Smyth, cautions that these are not simple counterexamples. Williams even suggested, in the SEP's words "rather grudgingly", that utilitarianism may give Jim the right answer. His point concerned what sort of considerations enter into finding the answer, or as he later put it, "If the stories of George and Jim have a resonance, it is not the sound of a principle being dented by an intuition." Utilitarianism's **negative responsibility** makes it indifferent whether something is done by me or merely results from what I do. Asking a man to step aside from his own project whenever the sums require it, Williams wrote, alienates him from his actions and their source in his own convictions:

```quote
It is thus, in the most literal sense, an attack on his integrity.
Bernard Williams · "A Critique of Utilitarianism", in Utilitarianism: For and Against · 1973
```

"Integrity" here means wholeness: acting from one's own deepest commitments, or **ground projects**, rather than the virtue of honesty. Williams rejected in advance the reply that losing a project is just a large cost to be counted.

## Alienation, Friendship and Demandingness

Williams also imagined a man who could save either his wife or a stranger. It might have been hoped, he wrote, "(for instance, by his wife) that his motivating thought, fully spelled out, would be the thought that it was his wife", not that she was his wife and that saving one's wife is permissible. William Godwin had argued in 1793 that if Archbishop Fénelon and his chambermaid were trapped in a fire, we should save Fénelon, because "that life ought to be preferred which will be most conducive to the general good."

Peter Railton's reply, in "Alienation, Consequentialism, and the Demands of Morality" (1984), was **sophisticated consequentialism**. Since consequentialism is a criterion of rightness, not a decision procedure, a sophisticated consequentialist, as the SEP summarises him, will develop patterns of decision-making that rarely refer explicitly to consequentialist aims, so that her psychology and behaviour resemble those of a typical non-consequentialist, friendships included. The SEP's verdict is balanced: it remains controversial whether any form of consequentialism can adequately accommodate common intuitions about friendship.

Demandingness returns here in general form. Classic utilitarianism seems to forbid buying \$100 shoes rather than giving the money to a charity that would save a life. Kagan's *The Limits of Morality* (1989) takes the hard line, attacking ordinary morality's assumption that we need not do as much good as we possibly can. Samuel Scheffler's *The Rejection of Consequentialism* (1982) proposes a hybrid: we are always *permitted* to produce the best outcome, but we have an **agent-centred prerogative** to give our own interests and projects more weight than impartial value would, out of respect for the independence of the personal point of view. Scheffler found no comparable rationale for **agent-centred restrictions**, constraints forbidding, say, killing one to prevent more killings; those constraints are the subject of *Deontology: Duty and Respect*. Murphy's *Moral Demands in Nonideal Theory* (2000) defends a **collective principle of beneficence** with a **compliance condition**: no one should be required to sacrifice more than they would have to if everyone did their share. Hooker answers that internalising very demanding rules costs too much, so rule consequentialism would not require them; satisficing and scalar views offer other escapes.

## Too Many People? The Repugnant Conclusion

Total utilitarianism faces a puzzle that Parfit made famous in *Reasons and Persons* (1984): "For any possible population of at least ten billion people, all with a very high quality of life, there must be some much larger imaginable population whose existence, if other things are equal, would be better even though its members have lives that are barely worth living."

Parfit's **mere addition paradox** reaches this by innocent-looking steps: adding people whose lives are worth living does not seem to make things worse; then making everyone equal, with a higher total and average, seems better; repeat, and the conclusion follows. Averaging welfare blocks the result but implies, implausibly, that adding very good lives below the average makes things worse. A few philosophers, Tännsjö and Huemer among them, accept the conclusion. The SEP entry, by Gustaf Arrhenius, Jesper Ryberg and Tännsjö, judges that escaping it without equally counterintuitive results has proved surprisingly difficult.

```checkpoint
q: What did Judith Jarvis Thomson argue in "Turning the Trolley" (2008)?
a: That the footbridge case shows double effect is correct.
x: Thomson's 2008 argument concerned whether the bystander may turn the trolley at all.
a*: That the bystander may not turn the trolley, because he would be imposing on a stranger a cost he would not accept himself.
a: That the doctrine of triple effect solves the loop case.
x: The doctrine of triple effect is Frances Kamm's, not Thomson's.
a: That 68 per cent of philosophers are wrong to switch.
x: The figure is from the 2009 PhilPapers survey; Thomson's argument rested on the self-sacrifice option, not on surveys.
hint: Imagine a third track, on which the bystander himself stands.
why: Few would turn the trolley onto themselves; Thomson concluded that imposing the cost on someone else would be like stealing a wallet to give to charity. William FitzPatrick (2009) replied that turning remains permissible: morality cannot demand such self-sacrifice, yet the reasons to minimise deaths remain compelling.
---
q: According to the SEP's reading, what was Williams's point in the stories of George and Jim?
a: That utilitarianism plainly gives the wrong answer in both cases.
x: Williams grudgingly granted that utilitarianism may tell Jim to do the right thing.
a: That integrity means honesty, which utilitarianism does not value.
x: For Williams integrity means wholeness, acting from one's ground projects.
a: That losing a project is just a large cost to be counted in the sum.
x: Williams rejected exactly this reply: once you look at it like that, the argument is over.
a*: That utilitarianism cannot properly describe the relation between a person's projects and actions, whatever answer it gives.
hint: "Not the sound of a principle being dented by an intuition."
why: The SEP stresses that the cases are not simple counterexamples. Williams's objection is that negative responsibility treats an agent as a channel for outcomes, alienating him from his own convictions.
```

## Effective Altruism

Singer's argument helped inspire **effective altruism** (EA), which its proponents describe as using evidence and reason to work out how to benefit others as much as possible, and acting on the answer. In Singer's words, "Effective altruism is based on a very simple idea: we should do the most good we can." Several communities converged from the late 2000s: GiveWell, founded in 2007 by Holden Karnofsky and Elie Hassenfeld, evaluated charities; Giving What We Can, founded at Oxford in 2009 by Toby Ord and William MacAskill (who had met Singer's essay as an undergraduate), asks members to pledge at least 10 per cent of their income to effective charities. The name "effective altruism" was chosen in 2011.

Is EA just utilitarianism? MacAskill says not: EA does not claim that we must always maximise the good regardless of means, or that well-being is the only value, and he writes that "naive calculations that justify some harmful action because it has good consequences are, in practice, almost never correct." Critics reply that EA keeps utilitarianism's impartiality, welfarism and maximising. **Longtermism**, defended in MacAskill's *What We Owe the Future* (2022), holds that positively influencing the long-term future is a key moral priority, since future people count, there could be very many of them, and we can make their lives better. Critics doubt that we can predict effects so far ahead and question reliance on tiny probabilities of enormous payoffs.

Amia Srinivasan, Judith Lichtenberg and Timnit Gebru have argued that EA neglects systemic and political change; Susan Dwyer, Joshua Stein and Olúfẹ́mi O. Táíwò worry about concentrating influence in wealthy donors; others note that justice and fairness are hard to measure. Carol J. Adams, Alice Crary and Lori Gruen collected such critiques in *The Good It Promises, the Harm It Does* (2023).

The sharpest test came from Sam Bankman-Fried, whom MacAskill had encouraged in 2012 to earn money and give it away. FTX, the company he founded in 2019, filed for bankruptcy on 11 November 2022, together with his earlier firm Alameda Research and over 100 affiliated entities. On 2 November 2023 a jury found him guilty on all seven counts, including fraud and conspiracy, and on 28 March 2024 he was sentenced to 25 years in prison. MacAskill condemned his actions and said EA emphasises integrity; Leif Wenar argued that the case cannot be separated from EA's reasoning about expected value. *Animals and the Environment* follows Singer's argument about animals.

## Further exploration

- **J. J. C. Smart and Bernard Williams, *Utilitarianism: For and Against* (1973).** The classic two-sided debate, including George, Jim and the integrity objection.
- **Katarzyna de Lazari-Radek and Peter Singer, *Utilitarianism: A Very Short Introduction* (2017).** A short modern introduction, from origins to extinction risk and well-being policy.
- **Brad Hooker, *Ideal Code, Real World: A Rule-consequentialist Theory of Morality* (2000).** The leading modern defence of rule consequentialism.
- **Chris Fraser, *The Philosophy of the Mozi: The First Consequentialists* (2016).** Mohist ethics read as the earliest consequentialism.
- **David Edmonds, *Would You Kill the Fat Man? The Trolley Problem and What Your Answer Tells Us about Right and Wrong* (2013).** An accessible history of the trolley problem.
- **Frances M. Kamm, *The Trolley Problem Mysteries* (2015).** Trolley cases analysed by their leading non-consequentialist student.
- **Carol J. Adams, Alice Crary and Lori Gruen (eds), *The Good It Promises, the Harm It Does: Critical Essays on Effective Altruism* (2023).** Critical essays, many from animal and feminist ethics.$conseq_master$,
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
  select $conseq_quiz$[
    {"type": "mcq", "prompt": "How did Philippa Foot explain why the tram driver may steer onto the one but the judge may not frame the innocent man?", "options": ["By the doctrine of double effect", "By the difference between doing and allowing: the judge chooses between killing one and letting five die, the driver between killing one and killing five", "By the number of lives at stake, which differs between the cases", "By the doctrine of triple effect"], "answerIndex": 1, "explanation": "Foot explained the pair by doing versus allowing, not by double effect. Thomson's bystander, who chooses between killing one and letting five die yet seems permitted to turn the trolley, undermined that explanation. The doctrine of triple effect is Kamm's later proposal.", "id": "q1"},
    {"type": "mcq", "prompt": "What is the 'collapse' objection to rule consequentialism, and how does Brad Hooker reply?", "options": ["That rules cannot be taught; Hooker replies that only 10 per cent of people need accept them", "That rule consequentialism forbids all exceptions; Hooker replies that it has none", "That rule consequentialism ignores consequences; Hooker replies that rules are judged by intuition alone", "That the ideal rules would absorb every useful exception and so give the same verdicts as act consequentialism; Hooker replies that rules cluttered with exceptions are costly to teach and invite self-serving excuses"], "answerIndex": 3, "explanation": "David Lyons argued that rule and act consequentialism are extensionally equivalent. Hooker ranks codes by the expected good of teaching them to and having them accepted by an overwhelming majority (roughly 90 per cent), counting the costs of teaching, so a simpler code wins even where following it does not maximise.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about Mohist consequentialism is supported by the chapter?", "options": ["Its standard of benefit covers material wealth, a large population and social order, and it judges practices rather than single acts", "It aims, like Bentham's theory, at maximising individual pleasure", "All scholars agree it is a form of utilitarianism", "The Mohists rejected any appeal to Heaven"], "answerIndex": 0, "explanation": "Fraser describes benefit (li) as an objective list of three largely collective goods and calls the view 'practice' or 'dao consequentialism'. The label is debated: some read Mohism as a divine-command theory, since its standard rests on Heaven's intention, and Ivanhoe and Van Norden's 'state consequentialism' is disputed by Fraser.", "id": "q3"},
    {"type": "mcq", "prompt": "Which dates are correct for the FTX collapse and its aftermath?", "options": ["Bankruptcy in November 2021, conviction in November 2022, sentence in March 2023", "Bankruptcy in March 2024, conviction in November 2024", "Bankruptcy on 11 November 2022, conviction on 2 November 2023, sentence of 25 years on 28 March 2024", "Bankruptcy in 2019, the year FTX was founded"], "answerIndex": 2, "explanation": "FTX filed for bankruptcy on 11 November 2022; a jury found Sam Bankman-Fried guilty on all seven counts on 2 November 2023, and he was sentenced to 25 years in prison on 28 March 2024. The case prompted debate about effective altruism's reasoning about expected value.", "id": "q4"},
    {"type": "open", "prompt": "Set out Peter Singer's drowning-child argument from 'Famine, Affluence, and Morality' step by step. What is the strongest objection to it, and how might a defender reply?", "rubric": "A strong answer gives the premises: suffering and death from lack of food, shelter and medical care are bad; if we can prevent something bad without sacrificing anything of comparable moral importance, we ought to do it; the drowning child shows the principle's force (muddy clothes are insignificant beside a child's death); distance makes no moral difference; nor does the number of others who could help; so the affluent ought to give far more, and much of what is called charity is duty. It explains the demandingness objection (Arthur, Kekes, Appiah), and may add Murphy's point about partial compliance. It gives replies: the hard line that we really are required to do more and that contrary intuitions may be unreliable (Kagan, Singer), and Singer's moderate version, which still requires large changes. Credit for linking the argument to effective altruism.", "id": "q5"},
    {"type": "open", "prompt": "Explain Bernard Williams's integrity objection to utilitarianism using the cases of George and Jim. Why does the Stanford Encyclopedia warn against reading the cases as simple counterexamples, and how does Railton's sophisticated consequentialism respond to the related charge of alienation?", "rubric": "A strong answer describes George (the chemist offered weapons research that someone more harmful would otherwise do) and Jim (who can shoot one captive so that the other nineteen go free). It explains that Williams even suggested, grudgingly, that utilitarianism may give Jim the right answer; his point is about what considerations enter into finding the answer: negative responsibility makes no difference between what I do and what results from what I do, alienating an agent from actions rooted in his own convictions and ground projects ('integrity' as wholeness, not honesty). It notes Williams rejected treating the loss of a project as just a cost. It explains Railton's reply: consequentialism is a criterion of rightness, not a decision procedure, so a sophisticated consequentialist can develop habits of decision that rarely refer to consequentialist aims, as in friendship; and it notes that whether this succeeds remains controversial.", "id": "q6"}
  ]$conseq_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/consequentialism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
