-- Justice and Equality — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/justice-and-equality @ research/advanced/read.
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
    'philosophy/political-philosophy/justice-and-equality',
    'research',
    'advanced',
    'read',
    $justice_master$> **If a society's wealth could be shared out in any way at all, which way would be just?** This chapter sets out John Rawls's two principles of justice, in the wordings he gave them at different times, and follows Robert Nozick's libertarian reply step by step through the Wilt Chamberlain argument, with its strongest objection and rejoinder. It then turns to luck egalitarianism and Elizabeth Anderson's relational critique, sufficiency and priority, the capabilities approach of Amartya Sen and Martha Nussbaum, and justice between nations, and ends with Mencius, Islamic almsgiving and the African idea of *ubuntu*.

## What Is a Just Distribution?

Should everyone have the same, or may some have more if that makes everyone better off? Does justice depend only on who ends up with what, or also on how they came to have it? These are questions of **distributive justice**: how the benefits and burdens of social life ought to be divided. Two further questions run through the debate. One is the **currency** question, which Sen put as "equality of what?": welfare, resources, opportunities, or something else? The other is the **pattern** question: should justice aim at a particular shape of distribution at all, or only at fair rules for getting and giving things?

*Consequentialism: What Makes Right Acts Right?* covers the utilitarian answer, and *Marx* the socialist critique of capitalism. The critiques of Rawls by Sandel, Okin and Mills are summarised in *Analytic Philosophy since 1950* and pursued in *Feminist Philosophy* and *Race, Colonialism and Philosophy*.

## Rawls's Two Principles

John Rawls (1921–2002) published *A Theory of Justice* in 1971, revised in 1999. He wanted a "workable and systematic moral conception to oppose" utilitarianism, which in his view fails to "take seriously the distinction between persons". His view, **justice as fairness**, holds that principles are just if they would be agreed in a situation fair to everyone, so that the fairness of the agreement transfers to its results.

The agreement is hypothetical. In the **original position**, the parties choose behind a **veil of ignorance** that hides their class, talents and conceptions of the good, and Rawls argued they would choose by **maximin**: pick the option whose worst outcome is best. *Analytic Philosophy since 1950* sets out that argument step by step, with Harsanyi's objection that rational choosers would maximise average utility and the reply that, with fundamental interests at stake, choosing conservatively is as rational as buying insurance. Rawls later treated maximin only as a rule of thumb for this choice, not a general principle of decision.

Rawls restated his principles several times, so it matters which version one quotes. In the final statement of *A Theory of Justice* (§46), the first principle gives each person an equal right to the most extensive total system of equal basic liberties compatible with a similar system for all. The second reads, in the revised edition: "Social and economic inequalities are to be arranged so that they are both: (a) to the greatest benefit of the least advantaged, consistent with the just savings principle, and (b) attached to offices and positions open to all under conditions of fair equality of opportunity." (Just savings concerns what each generation owes the next; see *Animals and the Environment*.) In 1982 Rawls replaced "most extensive" with "fully adequate", and in *Political Liberalism* (1993) the first principle reads: "Each person has an equal claim to a fully adequate scheme of equal basic rights and liberties, which scheme is compatible with the same scheme for all; and in this scheme the equal political liberties, and only those liberties, are to be guaranteed their fair value." The later versions put fair equality of opportunity first within the second principle.

The parts are ranked by **lexical priority**: "a principle does not come into play until those previous to it are either fully met or do not apply". First come the basic liberties: conscience, thought and speech, association, the integrity of the person and the right to hold personal property, political rights and the rule of law. Ownership of the means of production and laissez-faire freedom of contract are not on the list. Liberty may be restricted only for the sake of liberty, never for more wealth, even for the worst off. The political liberties must also have fair value, equal in substance and not just on paper, with implications for election finance (see *Democracy and Its Critics*). Next comes **fair equality of opportunity**: "roughly the same prospects of culture and achievement for those similarly motivated and endowed". Only then does the **difference principle** apply.

## The Difference Principle

Leif Wenar, in the Stanford Encyclopedia of Philosophy (SEP), illustrates it with four societies and the lifetime incomes of their least, middle and most advantaged members:

| Society | Least advantaged | Middle | Most advantaged |
|---|---|---|---|
| A | 10,000 | 10,000 | 10,000 |
| B | 12,000 | 30,000 | 80,000 |
| C | 30,000 | 90,000 | 150,000 |
| D | 20,000 | 100,000 | 500,000 |

The principle chooses C. Its inequalities benefit everyone compared with A and B; D is ruled out because there the rich gain at the expense of the poor.

Why should the talented accept this? Partly because no one deserves their natural endowments, so citizens should, in Rawls's 1971 words, "regard the distribution of natural talents as a common asset" and "agree to share one another's fate". The worst off are "those to whom reciprocity is owed as a matter of basic justice", not objects of charity, and Rawls favoured a **property-owning democracy** or liberal socialism over welfare-state capitalism.

The principle was also criticised from the left. G. A. Cohen, in Tanner Lectures delivered in 1991 and published in 1992, and *Rescuing Justice and Equality* (2008), attacked incentive pay: extra reward for burdensome work is fair, but citizens with a genuinely egalitarian ethos would work without being bribed, so the difference principle, strictly read, does not require it.

## Political Liberalism, Briefly

*Political Liberalism* (1993) faced **reasonable pluralism**: free citizens will reasonably disagree about religion and the good life. Rawls's answer was that power is legitimate only when exercised under a constitution whose essentials all citizens "may reasonably be expected to endorse". Justice as fairness became a freestanding module that reasonable Catholics, Muslims and atheists can each endorse from within their own doctrines: an **overlapping consensus**. Rawls also added, almost in passing, a prior principle that citizens' basic needs be met. Whether his theory is finally about distributing goods or about relations between equals is debated; it contains "the seeds" of both.

## Nozick's Entitlement Theory

Robert Nozick (1938–2002) replied in *Anarchy, State, and Utopia* (1974), arguing that no state more extensive than a minimal one can be justified (*Authority and the State: the Social Contract and Its Critics* follows that argument; *Liberty and Rights* the debate about rights). Even "distributive justice" is a loaded phrase, he said: there is "no more a distributing or distribution of shares than there is a distributing of mates in a society in which persons choose whom they shall marry".

{{image: Robert Nozick | Robert Nozick, whose *Anarchy, State, and Utopia* (1974) answered Rawls with a historical, entitlement theory of justice.}}

His **entitlement theory** holds that a person who acquires a holding justly, or receives it by a just transfer from someone entitled to it, is entitled to it, and that no one is entitled to a holding except by repeated application of these two principles. A third topic, **rectification**, deals with violations. A distribution is just if everyone is entitled to what they hold. Nozick never spelled out the principles of acquisition and transfer; each is a "complicated truth".

Justice is thus **historical**. Nozick contrasted **end-state** principles, which judge only the snapshot of who has what, and **patterned** ones, which make holdings vary with some feature such as need or merit: "Almost every suggested principle of distributive justice is patterned." Eric Mack, in the SEP, gives his own numbers: holdings of (12, 10, 9) and (4, 22, 13). Utilitarianism prefers the second, equality the first. But if the second is A enslaved to B with C as overseer, the numbers alone cannot show what is wrong; history can.

On acquisition, Nozick teased Locke's idea that we own what we mix our labour with: "if I own a can of tomato juice and spill it in the sea … do I thereby come to own the sea, or have I foolishly dissipated my tomato juice?" He kept Locke's **proviso**, that appropriation leave "enough, and as good" for others, but read it weakly: an acquisition is unjust only if it leaves others worse off than had the thing stayed in common, and compensation can make good the loss.

Rectification is the theory's open flank. Real holdings have histories of murder, plunder and enslavement. Nozick speculated that rectification might mean rough payments to groups likely made worse off by historical injustice, guided by some end-state principle, and conceded that it might in the short run require "a state more extensive than the minimal state", though he thought it "may well be implausible" to use the difference principle. *Race, Colonialism and Philosophy* takes up reparations.

## The Wilt Chamberlain Argument

Nozick's most famous argument, from the section "How Liberty Upsets Patterns", is quoted in *Analytic Philosophy since 1950*; here it is in full:

1. Take any distribution, D1, that your favourite patterned principle (equality, the difference principle, desert) declares just. Nozick lets his opponent choose.
2. Wilt Chamberlain signs a contract with his team giving him 25 cents of each ticket. A million people come to watch; he receives \$250,000, far more than anyone else. Call the result D2.
3. Each fan was entitled to his money under D1 and chose freely to pay; so did Chamberlain and the team. Those who stayed home keep their quarters; no third party's share has changed.
4. Nozick asks: "If the people were entitled to dispose of the resources to which they were entitled (under D1), didn't this include their being entitled to give it to, or exchange it with Wilt Chamberlain?" How could such a transfer give a third party, with no prior claim, a claim of justice on part of it?
5. So D2 is just, though it breaks the pattern. A pattern is not a necessary condition of justice.

Nozick generalised: "no end-state principle or distributional patterned principle of justice can be continually realized without continuous interference with people's lives."

How to read the argument is itself debated. Mack holds that it is internal to the patterned theorist's view: if D1 and every step were just, how did injustice enter D2? On another reading, which some of Nozick's wording invites, it simply assumes liberty as the standard and begs the question.

**Objection.** The strongest reply is Rawlsian. Nozick pictures the pattern being reimposed daily, but the difference principle governs the **basic structure**, society's main institutions, and concerns lifetime prospects. What one is entitled to is what one acquires under publicly known rules of tax and transfer; Chamberlain's rights are not violated if the tax authority takes, say, 70 per cent of his windfall. As Rawls put it in 1993: "There are no unannounced and unpredictable interferences with citizens' expectations and acquisitions. Entitlements are earned, and honored as the public system declares."

**Reply.** Mack answers that preferences, needs and opportunities change unpredictably, so sustaining any substantial pattern means changing the rules in ways no one announced. Rawls himself wrote on the next page that "even in a well-ordered society, adjustments in the basic structure are always necessary". Announced entitlements will then be overridden after all. G. A. Cohen's well-known essay "Robert Nozick and Wilt Chamberlain: How Patterns Preserve Liberty" (1977) also set out to refute the argument.

## Self-Ownership and Its Critics

Nozick admitted that he gave no "precise theory of the moral basis of individual rights", and Thomas Nagel titled his 1975 review "Libertarianism without Foundations". Mack argues that Nozick shares Rawls's starting point, the separateness of persons (see *Deontology: Duty and Respect*), and draws a more radical conclusion: treating talents as a common asset uses the talented as means.

Cohen's *Self-Ownership, Freedom, and Equality* (1995) took **self-ownership**, full rights over one's own body and powers, to be Nozick's core idea. He granted its pull: leftists lose confidence, he wrote, when asked whether the state could conscript people into a lottery whose losers must give an eye to someone otherwise blind. His attack fell on the step to owning the world. Nozick's proviso is too weak, since compensation need only beat a low baseline: in an illustration of Cohen's point, someone "acquires" a formerly free beach and charges a dollar admission, compensating bathers with a clean-up service, though a better organiser among them could have charged 50 cents. **Left-libertarians** such as Hillel Steiner, Vallentyne and Otsuka accept self-ownership but hold external resources in common.

```checkpoint
q: What does the Wilt Chamberlain argument claim to show?
a*: That free transfers from any just starting distribution can produce a distribution that breaks the pattern but is still just, so no pattern is a requirement of justice.
a: That taxation is always unjust, whatever rules are announced in advance.
x: The argument targets patterned principles; the claim about announced rules is the subject of the Rawlsian reply and Mack's rejoinder, not a premise.
a: That the difference principle chooses society C over societies A, B and D.
x: That is Wenar's illustration of what the difference principle selects, not an argument against it.
a: That an acquisition is unjust if it leaves others without enough and as good.
x: That is the Lockean proviso, which Nozick accepted only in a weak form.
hint: Start from D1, which the opponent chooses, and ask what fans do with their money.
why: Nozick lets the patterned theorist choose D1; a million fans then freely pay Chamberlain 25 cents each. If D1 and every transfer were just, it is hard to see how D2 became unjust, so patterns can be maintained only by "continuous interference with people's lives".
---
q: How did Mack reply, on Nozick's behalf, to the Rawlsian institutional objection?
a: By saying the basic structure is too large to be governed by principles.
x: Mack accepts that the difference principle governs the basic structure; his point is about how that structure must keep changing.
a: By denying that Chamberlain knew the tax rules when he signed his contract.
x: The objection assumes known rules, and Mack does not dispute it on that point.
a*: By arguing that keeping a pattern in place needs unannounced changes to the rules, as Rawls himself admitted adjustments "are always necessary".
a: By appealing to Cohen's eye lottery.
x: The eye lottery is Cohen's case for the pull of self-ownership, not part of the Wilt Chamberlain debate.
hint: Look at what Rawls wrote on the page after his reply.
why: Because preferences, needs and opportunities change unpredictably, sustaining a pattern requires adjusting the public system in ways no one announced, so previously announced entitlements will be dishonoured. Rawls conceded that adjustments in the basic structure "are always necessary".
```

## Luck Egalitarianism

Egalitarians next tried to absorb Nozick's stress on choice. Ronald Dworkin's "What Is Equality?" (1981) rejected **equality of welfare**, which rewards expensive tastes (why give more to someone who needs oysters and fine wine?) and is distorted by adaptive and offensive preferences. He proposed **equality of resources**. Shipwreck survivors each receive the same number of clamshells to bid for the island's resources; the result is equal when it passes the **envy test**, no one preferring anyone else's bundle.

Dworkin then distinguished **option luck**, "how deliberate and calculated gambles turn out", from **brute luck**, risks that are not deliberate gambles (for example, going blind from a genetic condition). People should bear their option luck, not their brute luck; a **hypothetical insurance market** asks whether they would have insured against a misfortune. Distribution should be "ambition-sensitive" but "endowment-insensitive".

Arneson (1989) proposed **equal opportunity for welfare**, and Cohen (1989) **equal access to advantage**, praising Dworkin for absorbing "the most powerful idea in the arsenal of the anti-egalitarian right: the idea of choice and responsibility". The family is called **luck egalitarianism**: in Temkin's formula, it is unfair for some to be worse off "through no fault or choice of their own".

## Anderson and Relational Equality

Elizabeth Anderson's "What Is the Point of Equality?" (1999) asked whether this egalitarianism would look much different had conservatives secretly devised it. Luck egalitarianism, she argued, is **harsh**, abandoning people whose misery stems from their own choices; **disrespectful**, since it helps victims of brute luck out of pity; and intrusive, since the state must scrutinise choices to classify misfortunes.

The point of equality, Anderson held, is a community whose members stand in relations of equality, with institutions that "express equal respect and concern for all citizens". Everyone must be able to function as an equal in civil society and politics, her **democratic equality**; distribution matters as a means and sets a threshold. Iris Marion Young's *Justice and the Politics of Difference* (1990) had criticised treating justice as "an ensemble of possessive relations" and named five faces of oppression: exploitation, marginalisation, powerlessness, violence and cultural imperialism (see also *Feminist Philosophy*).

Luck egalitarians reply that social standing can itself be distributed, or that the camps answer different questions. Anderson's critics object that above her threshold she is indifferent between helping the worse off and the best off.

## Enough, or Priority?

Harry Frankfurt challenged equality from another side:

```quote
With respect to the distribution of economic assets, what is important from the point of view of morality is not that everyone should have the same but that each should have enough. If everyone had enough, it would be of no moral consequence whether some had more than others.
Harry Frankfurt · "Equality as a Moral Ideal", Ethics 98, p. 21 · 1987
```

**Sufficientarianism** says getting people above a threshold matters especially, and above it inequality does not matter to justice. Critics find the threshold arbitrary and the indifference above it implausible. Ingrid Robeyns has since defended **limitarianism**, a ceiling on holdings, as a companion principle.

Parfit's Lindley Lecture, "Equality or Priority?" (University of Kansas, 1991), opened another route. He distinguished **telic** egalitarianism, on which inequality is bad in itself, from **deontic** egalitarianism, which concerns unfair treatment, and pressed the Levelling Down Objection:

1. Telic egalitarianism holds that inequality is in itself bad.
2. So any removal of inequality is in one respect good, however it happens.
3. Suppose the better off suffer a misfortune that makes them as badly off as everyone else. The inequality is gone.
4. So these events must be in one way welcome, "even though they would be worse for some people, and better for no one". This "seems to many to be quite absurd".
5. So the concern for the worse off is better expressed by the **Priority View**: "Benefitting people matters more the worse off these people are."

For the prioritarian, what is bad is not that some are worse off than others but that they are worse off than they might have been. Parfit's analogy: people high on a mountain find it harder to breathe, but would do so even if no one were lower down. The standard illustration of levelling down is blinding the sighted so that the blind are no longer worse off, which the SEP calls "morally perverse".

**Objection.** Pluralist egalitarians reply that equality is one value among several, so levelling down is better only "in one respect" and worse overall; no egalitarian need recommend it. **Reply.** Matthew Adler and Nils Holtug, in the SEP, note that this does not escape the objection in Parfit's sense, which targets exactly that "one respect". Other replies remain: for goods such as votes, levelling down loses nothing (if some have two votes and others one, giving everyone one is fine). Prioritarianism has its own difficulties, for example with risks within one life rather than across lives.

## Capabilities: Sen and Nussbaum

Sen's Tanner Lecture "Equality of What?" (Stanford, 22 May 1979) proposed a new currency. Two people with the same resources, one disabled, are not equally placed: she can do less and has extra costs, such as a wheelchair. Rawls's **primary goods** (liberties, opportunities, income and wealth, the social bases of self-respect), Sen argued, take too little account of the diversity of human beings.

**Functionings** are "doings and beings", such as being nourished or literate; **capabilities** are the real freedoms to achieve them. **Conversion factors**, personal, social and environmental, decide how resources become functionings: a bicycle is little use to someone never taught to ride, or to a woman forbidden to cycle. Sen's work underlies the UN's Human Development Reports, launched by Mahbub ul Haq, with Sen, in 1990, and the Human Development Index.

Martha Nussbaum built a partial theory of justice on ten **central human capabilities**: life; bodily health; bodily integrity; senses, imagination and thought; emotions; practical reason; affiliation; other species; play; and control over one's environment. Each is needed for a life "not so impoverished that it is not worthy of the dignity of a human being", up to a threshold constitutions should guarantee. Sen rejects "one pre-determined canonical list of capabilities, chosen by theorists without any general social discussion or public reasoning", and other critics agree that a fixed list leaves too little to democratic deliberation. In *The Idea of Justice* (2009) Sen abandoned the search for perfectly just institutions for comparing actual lives: justice comes in degrees.

```checkpoint
q: What is Parfit's Levelling Down Objection aimed at?
a: The priority view, which says benefits matter more the worse off the recipient is.
x: The priority view is Parfit's alternative; the objection is aimed at its rival.
a*: Telic egalitarianism, which holds that inequality is bad in itself.
a: Sufficientarianism, which says only having enough matters.
x: Sufficiency is Frankfurt's alternative; Parfit's target is the claim that inequality itself is bad.
a: Luck egalitarianism's distinction between brute and option luck.
x: The objection concerns any view on which inequality is bad in itself, not the role of choice.
hint: What view implies that making the better off worse off is "in one way" good?
why: If inequality is bad in itself, then removing it by harming the better off, while helping no one, must be in one respect good. Parfit found this absurd and proposed giving priority to the worse off instead.
---
q: What is a "conversion factor" in the capabilities approach?
a: The rate at which Dworkin's clamshells are exchanged for resources in the island auction.
x: The clamshells belong to Dworkin's equality of resources, not to Sen's approach.
a: Nussbaum's threshold for each of her ten capabilities.
x: Thresholds are part of Nussbaum's theory; conversion factors explain how resources become functionings.
a: A rule for converting income into utility in welfare economics.
x: Sen rejected utility as the currency of justice; conversion factors concern real freedoms, not utility.
a*: A personal, social or environmental feature that decides how far resources become functionings.
hint: Think of the bicycle.
why: A bicycle enables travel only if one has been taught to ride and is socially allowed to. Because people convert the same resources differently, Sen argued that justice should look at capabilities rather than resources alone.
```

## Justice beyond Borders

Do these principles stop at borders? Peter Singer's drowning-child argument, which stresses our capacity to help, is covered in *Consequentialism: What Makes Right Acts Right?*.

Charles Beitz (1975; *Political Theory and International Relations*, 1979) argued that global trade and institutions form a scheme of cooperation, so "The veil of ignorance must extend to all matters of national citizenship, and the principles chosen will therefore apply globally." Brian Barry objected that trade is not cooperation of the relevant kind, or the Beaker Folk would have formed one cooperative enterprise with their trading partners. Thomas Pogge's *World Poverty and Human Rights* (2002) argued that rich countries impose a coercive global order that foreseeably produces massive deprivation, so they harm the poor rather than merely failing to help. Pogge proposed a **Global Resources Dividend**, a small tax on resource extraction.

Rawls's *The Law of Peoples* (1999) rejected a global difference principle. Its parties are peoples, and its last principle is a **duty to assist** "burdened societies", with a cut-off once all are well-ordered; Rawls located the causes of wealth "in their political culture", against Pogge's institutional account. Nagel's "The Problem of Global Justice" (2005) defended **statism**: justice, including egalitarian distributive justice, holds only within a state that coerces its members in their name, and beyond it we owe humanitarian duties such as preventing starvation. David Miller's nationalism holds that compatriots owe special duties, and that principles right within a nation need not be right globally. Cosmopolitans, statists, nationalists and Rawlsians still disagree.

## Other Traditions

In the *Mengzi* (1A7), Mencius told a king that people without a constant means of livelihood lack a constant mind and fall into crime; to punish them then is to entrap them, so the ruler bears much of the blame. Elsewhere (1A3, 1A5) he urged light taxes and limits on fishing and tree-felling. Passage 3A3, "a detailed treatise on tax policy" in Bryan Van Norden's words, describes the **well-field system**: land divided into nine squares like the character 井 (*jǐng*, "well"), eight families each keeping an outer square's produce and jointly working the centre for the government. Its historicity is debated, but Song Neo-Confucians wanted it restored (see *Confucius, Mencius and Xunzi*).

In Islam, **zakat**, obligatory almsgiving, is one of the Five Pillars: those with wealth above a threshold (*nisab*) customarily give 2.5 per cent of capital assets held for a lunar year, though the Qur'an gives no percentages and scholars disagree on details. Qur'an 9:60 names eight categories of recipient, among them the poor, the needy, debtors, the freeing of slaves and stranded travellers. In the twentieth century Muhammad Baqir al-Sadr's *Iqtisaduna* ("Our Economics", 1961) and Mahmoud Taleghani presented Islam as committed to social justice and the equitable distribution of wealth, with a large role for the state.

The Zulu saying *Umuntu ngumuntu ngabantu*, "a person is a person through people", expresses **ubuntu**. Thaddeus Metz has built an analytic moral theory on it, on which actions are right, in the words of Metz and Gaie, "roughly insofar as they are a matter of living harmoniously with others or honouring communal relationships"; his *A Relational Theory of Justice* (2026) grounds economic and political justice on our capacity to commune with others. This is one philosopher's reconstruction, not the tradition itself: critics call normative definitions of ubuntu fuzzy, and some African feminists note patriarchal elements (see *African Philosophy: the Ethnophilosophy Debate and Beyond*).

## Further exploration

- **Samuel Freeman, *Rawls* (2007).** An authoritative introduction to justice as fairness and its later development.
- **Will Kymlicka, *Contemporary Political Philosophy: An Introduction* (2nd ed., 2002).** The standard survey: utilitarianism, Rawls, Nozick, Marxism, communitarianism and feminism.
- **G. A. Cohen, *Self-Ownership, Freedom, and Equality* (1995).** A sustained critique of Nozick and self-ownership, opening with the essay on Wilt Chamberlain.
- **Ingrid Robeyns, *Wellbeing, Freedom and Social Justice: The Capability Approach Re-Examined* (2017).** An open-access guide to the capability approach.
- **Amartya Sen, *The Idea of Justice* (2009).** Sen's comparative alternative to Rawls, drawing on Indian as well as European thought.
- **Gillian Brock, *Global Justice: A Cosmopolitan Account* (2009).** An accessible cosmopolitan theory engaging Rawls, Pogge and the nationalists.
- **Thaddeus Metz, *A Relational Moral Theory: African Ethics in and Beyond the Continent* (2022).** An ubuntu-based moral theory, with a sequel on justice.$justice_master$,
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
  select $justice_quiz$[
    {"type": "mcq", "prompt": "In Wenar's illustration, the least, middle and most advantaged earn 10,000/10,000/10,000 in society A; 12,000/30,000/80,000 in B; 30,000/90,000/150,000 in C; and 20,000/100,000/500,000 in D. Which does the difference principle select?", "options": ["A, because only strict equality is just", "B, because its inequalities are smallest", "C, because its inequalities make the least advantaged best off", "D, because it has the highest total income"], "answerIndex": 2, "explanation": "The difference principle permits inequalities only when they are to the greatest benefit of the least advantaged. C gives the worst off 30,000, more than any alternative; D is ruled out because the rich gain at the expense of the poor, and A's equality leaves everyone worse off than C.", "id": "q1"},
    {"type": "mcq", "prompt": "Which concession did Nozick make about the rectification of past injustice?", "options": ["That rectification might need some end-state principle and, in the short run, a state more extensive than the minimal state", "That past injustices should be ignored once property has changed hands", "That the difference principle is plainly the right principle of rectification", "That the Lockean proviso makes rectification unnecessary"], "answerIndex": 0, "explanation": "Nozick speculated that rectification might take the form of rough payments to groups likely made worse off by historical injustice, guided by some end-state principle, and might require 'a state more extensive than the minimal state' (230). He thought it 'may well be implausible' to use the difference principle for this.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these is an objection Elizabeth Anderson pressed against luck egalitarianism in 'What Is the Point of Equality?' (1999)?", "options": ["That it gives too little weight to people's choices", "That it would make the state measure everyone's welfare by a single list of ten capabilities", "That it ignores Rawls's priority of liberty", "That it is harsh to people whose misfortunes stem from their own choices, and disrespectful to the victims of bad luck it helps"], "answerIndex": 3, "explanation": "Anderson charged luck egalitarianism with harshness (abandoning those responsible for their own misery), with basing aid to brute-luck victims on pity, and with inviting intrusive scrutiny of citizens' choices. She held that the point of equality is relations of equality, which she called democratic equality.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Nagel's 'The Problem of Global Justice' (2005) argue?", "options": ["That affluent countries harm the global poor by imposing a coercive global order", "That justice, including egalitarian justice, applies only within a sovereign state that coerces its members in their name, with only humanitarian duties beyond it", "That the veil of ignorance should hide nationality, so Rawls's principles apply globally", "That the duty to assist burdened societies ends once all societies are well-ordered"], "answerIndex": 1, "explanation": "Nagel's statism confines justice, including egalitarian distributive justice, to the coercive state; beyond it lie humanitarian duties such as preventing starvation. The harm thesis is Pogge's, the global veil Beitz's, and the duty of assistance with a cut-off is Rawls's in The Law of Peoples.", "id": "q4"},
    {"type": "open", "prompt": "Set out Nozick's Wilt Chamberlain argument step by step. Then give the Rawlsian institutional objection and Mack's rejoinder, and say how the argument can be read in two different ways.", "rubric": "A strong answer explains that the opponent chooses any patterned distribution D1 (equality, the difference principle, desert); Chamberlain contracts for 25 cents a ticket, a million people pay, and he receives $250,000 (D2); each fan was entitled to his share and chose freely, and third parties' shares are unchanged; Nozick asks whether entitlement to resources did not include entitlement to give them to Chamberlain, and how a third party could gain a claim on them; so D2 is just and patterns are not required by justice, since they cannot be maintained without 'continuous interference with people's lives'. It distinguishes patterned and end-state from historical principles. The objection: the difference principle governs the basic structure and lifetime prospects, and entitlements arise under known tax and transfer rules, so taxing Chamberlain violates nothing (Rawls 1993: 'no unannounced and unpredictable interferences'). The rejoinder: changing needs and preferences make unannounced adjustments necessary, which Rawls conceded ('adjustments in the basic structure are always necessary'). The two readings: Mack's internal reading (how did injustice enter D2?) versus a reading on which Nozick begs the question by assuming liberty is the standard. Credit for mentioning Cohen's 1977 essay on the argument without inventing its content, or the debate over self-ownership.", "id": "q5"},
    {"type": "open", "prompt": "Compare three answers to the question of what justice requires us to care about in a distribution: equality, priority and sufficiency. Use Parfit's Levelling Down Objection and Frankfurt's view, and give one objection to each answer.", "rubric": "A strong answer distinguishes telic egalitarianism (inequality is bad in itself) from deontic egalitarianism; sets out the Levelling Down Objection from Parfit's 1991 Lindley Lecture (removing inequality by making the better off worse off, benefiting no one, would be 'in one way' good, which seems absurd) and the Priority View ('Benefitting people matters more the worse off these people are'), an absolute rather than comparative concern, with the altitude analogy. It explains Frankfurt's sufficientarianism ('not that everyone should have the same but that each should have enough') with its positive and negative theses. Objections: for equality, levelling down (with replies: pluralism, which Adler says does not escape the objection; goods such as votes, where levelling down loses nothing); for priority, difficulties with risk within one life versus across lives; for sufficiency, an arbitrary threshold and indifference to inequalities above it. Credit for mentioning Robeyns's limitarianism or Anderson's threshold of democratic equality.", "id": "q6"}
  ]$justice_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/justice-and-equality', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
