-- Political Philosophy — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/political-philosophy @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'philosophy/political-philosophy',
    'research',
    'advanced',
    'read',
    $politicsov_master$> **Political philosophy, on this overview's gloss, asks what could make power over other people rightful and what a just society would owe its members.** This overview shows how the section's six chapters fit together: the authority of the state and the duty to obey it; liberty and rights; the just distribution of goods; democracy and its rivals; and the challenges that race, empire and gender pose to the whole tradition. It then follows four questions through them: what consent can and cannot justify; what equality requires; how traditions beyond Europe framed rule and justice; and whether political philosophy should begin from an ideal society or from the unjust one we have.

## What Political Philosophy Asks

A law forbids you to cross an empty road against a red light at three in the morning. No one is coming. Do you still have a reason to wait, simply because it is the law? *Authority and the State: the Social Contract and Its Critics* opens with this case, the problem of **political obligation**, which Richard Dagger and David Lefkowitz, in the Stanford Encyclopedia of Philosophy (SEP), equate with a moral duty to obey the law of one's own country.

Two distinctions frame the section. **Legitimacy**, the right to rule or to use coercive power, is not the same as justice. For Rawls, institutions can be legitimate yet unjust, since legitimacy "makes weaker demands than justice". Second, as *Democracy and Its Critics* puts it, the **justification** of a form of government (is it better than the alternatives?) is a different question from its **authority** (must citizens obey its decisions?), and the answers can come apart.

The chapters ask, in turn: Why obey at all? What may a society not do to you, and what is owed to you whoever you are? How should the benefits and burdens of social life be divided? Who should decide? The last two chapters turn on the tradition itself and ask who was left out when these questions were first answered: W. E. B. Du Bois's "problem of the color-line", which opens *Race, Colonialism and Philosophy*, and the "gender-based oppression" whose end, in the SEP's definition quoted in *Feminist Philosophy*, feminism seeks.

On this overview's reading, the section therefore moves from the state's claim on us, through what we may claim against the state and from one another, to the question of who has counted as "us" at all.

## Power and Its Limits: Authority, Liberty and Rights

*Authority and the State: the Social Contract and Its Critics* compares the contracts of Hobbes, Locke and Rousseau as rival answers to "why obey?", sets out Hume's case against tacit consent step by step, and weighs the four grounds that replaced consent: fair play, gratitude, natural duty and membership. Robert Paul Wolff argued that autonomy, "the refusal to be ruled", leaves no room for a de jure legitimate state outside a unanimous direct democracy, which could never be realised in an actual state. Joseph Raz replied with a **service conception**: authority is justified when deferring to it helps a subject better comply with reasons that already apply to him. Yet Raz's authority is **piecemeal**, and he denies that any existing state is owed a general duty of obedience. The chapter then meets the classical anarchists, Confucian, *fa* and Islamic thinkers on rightful rule, and the tradition of civil disobedience from Thoreau and Gandhi to Martin Luther King Jr. and Rawls. Its verdict is modest: almost no theory claims more than a *prima facie* duty to obey, one that can be outweighed.

*Liberty and Rights* begins with Mill's "one very simple principle": "the sole end for which mankind are warranted, individually or collectively, in interfering with the liberty of action of any of their number is self-protection." It follows this harm principle into offence, the enforcement of morals and paternalism. It sets out Mill's argument from fallibility for free speech step by step, and leaves open the dispute over hate speech between Jeremy Waldron and critics such as Ronald Dworkin and Nadine Strossen.

The chapter then compares three ideas of freedom. Isaiah Berlin's **negative liberty** is freedom from interference; his **positive liberty** is self-mastery, whose danger he saw in rulers who coerce people in the name of their "true" selves. Philip Pettit and Quentin Skinner revived a third, republican ideal of **non-domination**. The chapter ends with what a right is, how natural rights became human rights, and whether those rights are universal.

{{image: Universal Declaration of Human Rights | Eleanor Roosevelt, who chaired the commission that drafted the Universal Declaration of Human Rights, with a poster of the Declaration, adopted in Paris on 10 December 1948.}}

## Who Gets What: Justice and Equality

*Justice and Equality* asks what a just distribution looks like. John Rawls's **justice as fairness** holds that principles are just if they would be agreed in a situation fair to everyone. Behind a **veil of ignorance** that hides their class, talents and conceptions of the good, the parties would choose, Rawls argued, equal basic liberties first, then fair equality of opportunity, and only then the **difference principle**, which permits inequalities only to the greatest benefit of the least advantaged.

Robert Nozick's *Anarchy, State, and Utopia* (1974) replied with an **entitlement theory**: a distribution is just if everyone is entitled to what they hold, through just acquisition and just transfer, so justice is historical rather than a matter of patterns. His Wilt Chamberlain argument claims that free transfers from any starting distribution the opponent calls just can produce one that breaks the pattern yet is still just. The chapter gives the strongest Rawlsian objection, that the difference principle governs society's **basic structure** under publicly known rules of tax and transfer, and Eric Mack's rejoinder on Nozick's behalf, that sustaining a pattern requires changes to the rules that no one announced. It does not settle the dispute.

The chapter then follows egalitarian answers to Sen's question "equality of what?": Ronald Dworkin's equality of resources and the family called **luck egalitarianism**; Elizabeth Anderson's charge that luck egalitarianism is harsh and disrespectful; Harry Frankfurt's **sufficientarianism** and Derek Parfit's **priority view**; the **capabilities approach** of Amartya Sen and Martha Nussbaum; and the unresolved quarrel over justice beyond borders.

## Who Rules: Democracy and Its Critics

*Democracy and Its Critics* asks whether the people should rule, and why. It starts with Athens, where the Assembly was open by right to every citizen and most officials were chosen by **sortition**, selection by lot, though women, slaves, freed slaves and resident foreigners were excluded. Plato's ship of state argues that ruling is a craft that needs knowledge, and that democracy hands the helm to flatterers. Aristotle's suggestion that the many may be better "collectively" than the few, and Condorcet's **jury theorem**, give an epistemic case for it, though the theorem cuts both ways: if each voter is more likely to be wrong than right, adding voters makes the majority more likely to be wrong.

Two live disputes stand side by side. Jason Brennan's *Against Democracy* (2016) argues that if some epistocratic arrangements, forms of rule by the knowledgeable, would decide better, they are presumptively preferable. David Estlund's **demographic objection** replies that any test of competence would likely select a demographically narrow group whose shared biases distort its judgement, and that epistemic authority is not political authority. Tom Christiano's intrinsic **public equality** argument sidesteps the contest over competence: an equal say, amid deep disagreement, is the publicly visible way to treat people as equals. The chapter ends with citizens' assemblies, Confucian meritocracy and Kwasi Wiredu's democracy without parties.

```checkpoint
q: What is the "kindly master" argument for freedom as non-domination, as Liberty and Rights presents it?
a*: That if freedom were only non-interference, a slave whose master never interfered would be free, which is absurd, so domination without interference is still unfreedom.
a: That a master who never interferes is the best guarantee of liberty, so a benevolent ruler is preferable to laws.
x: Republicans want not a better master but none: an "empire of laws and not of men", in Harrington's phrase.
a: That lack of money is itself a lack of negative freedom.
x: That is G. A. Cohen's argument, with the SEP's example of taking a jacket without paying.
a: That every freedom claim relates an agent, a constraint and a goal.
x: That is MacCallum's objection to Berlin's two concepts.
hint: Imagine a slave who learns to flatter a master who never actually interferes.
why: On Pettit's view you are free to the extent that no one has the capacity to interfere in your affairs on an arbitrary basis. Liberal critics such as Kramer and Carter reply that domination matters because it makes interference likely; in the SEP's words, "the jury is still out".
---
q: Why does Condorcet's jury theorem, as Democracy and Its Critics presents it, cut both ways?
a: Because it applies only to elections with exactly three voters.
x: The theorem concerns groups of any odd size, and its conclusion concerns what happens as they grow.
a: Because majority voting always produces cycles, as Arrow showed.
x: Cycles are the paradox of voting and Arrow's theorem, a separate problem about combining preferences.
a*: Because its conclusion depends on each voter being more likely right than wrong; if each is more likely wrong, adding voters makes the majority more likely to be wrong.
a: Because independent voters always cancel out one another's errors.
x: The theorem assumes independence, but whether errors cancel depends on whether voters are more likely right than wrong.
hint: Picture coins biased slightly towards the wrong answer.
why: With competence above one half the majority's reliability rises with numbers; below it the effect reverses, and the most reliable "jury" is a single voter. Estlund's epistemic proceduralism asks far less of democracy than the theorem's strong conclusion.
```

## Who Was Left Out: Race, Colonialism and Feminism

*Race, Colonialism and Philosophy* asks whether race is real, whether the social contract was a racial one, and whether anything is owed for slavery and empire. It traces how the modern idea of race took shape and how scholars judge Kant and Hume. Philosophers and scientists, the SEP reports, "have reached the consensus against racial naturalism", the view that races have biobehavioural essences, but racial sceptics, constructionists and population naturalists still disagree about what, if anything, races are. The chapter reads Aimé Césaire's *Discourse on Colonialism* and the open debate over whether Frantz Fanon justified violence, sets out Charles Mills's Racial Contract with its objections, and introduces the postcolonial and decolonial thought of Said, Spivak, Bhabha, Quijano and Mignolo.

*Feminist Philosophy* asks what a woman is, who knows best about oppression, and what the great philosophers got wrong about half of humanity. It follows the distinction between **sex** and **gender** from Simone de Beauvoir and Judith Butler to Sally Haslanger's **ameliorative** proposal to define women by their subordination, set out with its four main objections. On what it calls one of the most publicly contested questions in the field, it presents gender-critical philosophers such as Alex Byrne, Kathleen Stock and Holly Lawford-Smith, and trans-inclusive ones such as Talia Mae Bettcher, Katharine Jenkins and Robin Dembroff, each in their own terms, and notes Saul's exploration of a third position. Its verdict is that neither side has persuaded the other, and the empirical claims on both sides are disputed. It also covers standpoint epistemology, intersectionality, justice in the family, critiques of the canon, and the pornography debate, in which Catharine MacKinnon and Andrea Dworkin's ordinance was opposed by other feminists, among them the Feminist Anti-Censorship Taskforce; the questions of harm, speech and consent, it concludes, remain open.

## Questions That Run Through the Section

### What can consent justify?

The social contract is, on this overview's reading, the section's most persistent idea, and it runs through five of the six chapters. Dagger and Lefkowitz find consent already in seed in Plato's *Crito*: Socrates' long residence in Athens counts as agreement to its laws. Early modern Europe's classic answer was the social contract of Hobbes, Locke and Rousseau, and all three, as *Authority and the State: the Social Contract and Its Critics* shows, face a dilemma. If the contract is historical, few ever made it, and one's ancestors' consent does not bind oneself. If it is hypothetical, then a hypothetical contract, Ronald Dworkin said, "is no contract at all". Locke added **tacit consent**, given by enjoying property or even, in the SEP's paraphrase, by walking along the highways. Hume's reply in "Of the Original Contract" (1748) is the sharpest:

```quote
Can we seriously say that a poor peasant or artisan has a free choice to leave his country, when he knows no foreign language or manners, and lives from day to day by the small wages which he acquires?
David Hume · Of the Original Contract · 1748
```

Rawls's agreement in *Justice and Equality* is avowedly hypothetical: its force comes from the fairness of the original position, which transfers to the principles chosen. His natural duty to support just institutions, in *Authority and the State*, binds without any voluntary act at all. In *Political Liberalism* (1993) he grounded legitimacy in a constitution whose essentials all citizens "may reasonably be expected to endorse". Others put the veil of ignorance to new work: Susan Moller Okin argued that parties who did not know their sex would not accept roles assigned by sex.

Later critics asked who was allowed to contract at all. Carole Pateman's *The Sexual Contract* (1988) asked who could be a party to the social contract at all, and Mills took his model from her. His Racial Contract is, the Internet Encyclopedia of Philosophy stresses, "not hypothetical" but "an actual contract, or series of contracts, made by real men of history", which first fixed who counted as a full person. Its consent, Ann Cudd and Seena Eftekhari note, is "sometimes explicit, though often only implicit"; Bat-Ami BarOn asked how anyone consents to such an agreement at all. The critics then divide. Contractarians answer that excluding people who could cooperate and reciprocate is irrational by contractarianism's own standard; Pateman argued that contract theory inherently permits domination; Mills held that it can be saved by a realistic non-ideal starting point.

Two further turns, on this overview's reading, close the circle. In the reparations debate, Boxill and Corlett argue, after Locke, that claims attach to the estates of those who assisted, concurred or consented, which on their argument included the tacit consent of nearly all white citizens; the chapter notes that the premise is contestable, since abolitionists dissented. Tacit consent, which Hume attacked as a ground of obligation, thus returns as a ground of liability, and faces a version of the same question: whether staying put and acquiescing can count as consenting. And Wiredu, in *Democracy and Its Critics*, charges majoritarian systems with resting on "consent without consensus", proposing instead that consent be negotiated by seeking agreement.

### What does equality require?

Almost every chapter appeals to equality, but, on this overview's reading, the word does four different jobs, and the disputes often turn on which one is meant.

The first is **moral equality**, the equal standing of persons. Hansa Mehta changed Article 1 of the Universal Declaration from "all men are born free and equal" to "All human beings are born free and equal in dignity and rights." Rawls rejected utilitarianism because it fails to "take seriously the distinction between persons"; Mills's positive theory, Cudd notes, is contractualist, beginning "with the premise of moral equality".

The second is **political equality**. *Democracy and Its Critics* defines democracy by "a kind of equality among the participants at an essential stage of the decision-making process". Athens used lot partly to give everyone an equal chance; Mill proposed plural votes for the educated, which David Brink judges shows "something of a tin ear for egalitarian concerns"; Rawls required that the equal political liberties have fair value, with implications for election finance; and the quarrel between Brennan, Estlund and Christiano is a quarrel over whether an equal say is required by justice or should yield to competence.

The third is **distributive equality**, the subject of *Justice and Equality*: whether goods should be shared out equally, by the difference principle, by entitlement, by luck, up to a sufficient threshold, or with priority to the worse off. Parfit's Levelling Down Objection presses those for whom inequality is bad in itself: making the better off worse off, while helping no one, would then be in one way good. *Liberty and Rights* adds a bridge: G. A. Cohen, among others, argued that lack of money is itself a lack of negative freedom.

The fourth is **relational equality**. Anderson held that the point of equality is a community whose members stand in relations of equality, and Iris Marion Young named five faces of oppression. This overview suggests that the same idea runs through chapters that do not use the term. Waldron's case against hate speech defends its targets' standing as "social equals". The republicans' kindly master and kind husband show that domination is a relation, not a distribution. Okin argued that families built on "dependence and domination" cannot teach justice, and Haslanger defines both gender and race as positions in a social hierarchy. Whether Rawls's own theory is finally about distributing goods or about relations between equals, *Justice and Equality* reports, is debated; it contains "the seeds" of both.

### How traditions beyond Europe framed rule and justice

The chapters treat thinkers beyond Europe as philosophers working on the same questions, and repeatedly ask whether Western labels fit them.

In China, the Zhou made Heaven a moral judge of rulers through the **mandate of Heaven**, and Confucians held that people follow a ruler with virtue willingly. Mencius ranked the people first and the ruler last, and called a ruler who destroys benevolence and rightness an "outlaw" rather than a lord. Was he a democrat? Bai Tongdong reads him as a potential foundation for democracy; Justin Tiwald warns against overestimating his championing of the popular will. The rival tradition of *fa*, standards or laws, was, on Yuri Pines's account, meant to be public and impartial, binding even the ruler, though its harsh punishments were real; Pines finds the label "Legalism" "quite inaccurate".

Today the debate continues as the Confucian case for **meritocracy**. Daniel A. Bell defends "democracy at the bottom, experimentation in the middle, and meritocracy at the top"; Joseph Chan proposes a legislature with one elected and one meritocratic chamber, and treats human rights as an instrumental "fallback". Thomas Mulligan's SEP entry insists these thinkers are not apologists for the Chinese Communist Party; Confucian democrats answer from inside the tradition that participation is essential to cultivating virtue; and Andrew Nathan is reported to argue that actual leadership selection is far from what Bell describes. The **Asian values** debate of the 1990s set Lee Kuan Yew and others, who stressed family, community and harmony, against critics such as Kim Dae-jung and Amartya Sen. Western delegates tended to see such claims as excuses for repression; their proponents saw a defence of community, development and non-interference. Asian states meeting at Bangkok in 1993 themselves reaffirmed the Universal Declaration and said that, "while human rights are universal in nature", they must be considered bearing in mind national and regional particularities.

Islamic thinkers asked what rule is for. For al-Fārābī legitimacy is perfectionist: rule is rightful insofar as it leads citizens to happiness. **Zakat**, obligatory almsgiving, is one of the Five Pillars, and in the twentieth century Muhammad Baqir al-Sadr presented Islam as committed to the equitable distribution of wealth. The Cairo Declaration of 1990 made its rights "subject to the Islamic Sharia", but *Liberty and Rights* adds, for balance, that most Muslim-majority members voted for the Universal Declaration in 1948 and that reformist scholars such as Abdullahi Ahmed An-Na'im argue for human rights from within Islamic jurisprudence.

In Africa, Wiredu argued that the traditional Ashanti system "was a consensual democracy" and proposed a **non-party polity**, distinct from one-party states; in a debate known mainly through summaries, Emmanuel Chukwudi Eze is reported to have raised three objections, and Bernard Matolino, after first defending consensual democracy, later concluded that abolishing parties is not compelling. *Ubuntu*, "a person is a person through people", grounds Thaddeus Metz's relational theory of justice, though *Justice and Equality* stresses that this is one philosopher's reconstruction, not the tradition itself.

On this overview's reading, two findings recur. The first is a persistent question whether rule should be judged by what it does for the people or by the people's own say: Mencius ranked the people first, yet his readers dispute how far he championed the popular will, and Tongdong Bai defends government "for the people, of the people, but not by the people". The second is that these traditions sit only partly on the modern map, whether of rights, of democracy or of feminism, which is why the chapters keep their own terms.

### Ideal theory or the world as it is?

Rawls asked which principles would be agreed in a situation fair to everyone, and *Justice and Equality* counts Mills among his critics. Mills's argument, in *Race, Colonialism and Philosophy*, is that **idealised** contract theory, which abstracts from the history of conquest and slavery, works as ideology, sustained by an **epistemology of ignorance**, and that political philosophy must begin from the actual, non-ideal contract. Tommie Shelby (2013) replies that rectifying injustice presupposes an ideal theory saying what justice is, so ideal theory remains indispensable. Sen, in *The Idea of Justice* (2009), took what this overview counts as a third route, abandoning the search for perfectly just institutions for comparing actual lives.

The non-ideal world surfaces across the section. Shelby argues in *Authority and the State: the Social Contract and Its Critics* that oppressed minorities may rightly see institutions as lacking legitimacy when the order they uphold is unjust. For Rawls, one unjust law within a nearly just constitution does not by itself license disobedience; Candice Delmas argues for duties to resist injustice, sometimes uncivilly. Nozick's theory meets the world at **rectification**, which *Justice and Equality* calls its open flank: real holdings have histories of murder, plunder and enslavement, and Nozick conceded that rectifying them might require a state more extensive than the minimal one.

On this overview's reading, reparations are where the question is most contested. The harm argument, as the chapter states it, holds that slavery wrongfully harmed the enslaved and, through them, their descendants. The **non-identity objection** replies that without slavery present-day descendants would not exist, so slavery cannot have made them worse off. Replies relocate the wrong to government failures after 1865, or argue that rights to reparation pass to heirs; opponents such as Nigel Biggar and Stephen Kershnar argue against reparations, and the chapter concludes that whether the replies succeed remains disputed. As of late 2026, the developments the chapter records include CARICOM's Ten Point Plan of 2014, with a revised plan under review in 2026, and the final report of California's Reparations Task Force, delivered on 29 June 2023.

*Feminist Philosophy* supplies an epistemology for starting from where we are. **Standpoint theory** holds that inquiry beginning from marginalised lives gives less partial accounts of everyone, though a standpoint, Sandra Harding wrote, "is not something that anyone can have simply by claiming it. It is an achievement." This overview notes that Mills's epistemology of ignorance and standpoint theory make mirror-image claims, one about what the dominant are placed to miss and the other about what the marginalised are placed to notice; the chapters do not draw the link themselves.

```checkpoint
q: How does Mills's Racial Contract differ from the contracts of Hobbes, Locke and Rousseau, according to Race, Colonialism and Philosophy?
a: It is a hypothetical agreement that rational parties behind a veil of ignorance would choose.
x: That describes Rawls's original position; Mills's contract is "not hypothetical".
a*: It is an actual contract, or series of contracts, made by real men of history, which first fixed who counted as a full person.
a: It is an agreement among all races to share power equally.
x: Mills's contract fixed who counted as a full person: white Europeans as persons, non-whites as sub-persons.
a: It is a contract between men and women about the family.
x: That is closer to Pateman's sexual contract, which Mills took as his model.
hint: The Internet Encyclopedia of Philosophy stresses the word "actual".
why: Mills cites papal bulls, voyages of discovery, Locke's claim that Native Americans who did not farm land did not own it, colonisation and slavery. On his view white supremacy is "itself a political system", not an accidental deviation from a just liberal order.
---
q: What is Tommie Shelby's objection to Mills's call to begin from non-ideal theory?
a: That racial injustice has ended, so non-ideal theory is unnecessary.
x: Shelby does not deny present injustice; in Authority and the State he argues that oppressed minorities may rightly see institutions as lacking legitimacy.
a: That the racial contract was never made, since racial worldviews came first.
x: That is Lucius Outlaw's historical objection.
a: That contract theory inherently permits domination and must be abandoned.
x: That is Pateman's objection, made from the left.
a*: That rectifying injustice presupposes an ideal theory saying what justice is, so ideal theory remains indispensable.
hint: To correct an injustice, what must one already know?
why: Shelby argues that a politics of reparations must sooner or later confront the questions of ideal theory. The chapter's reply on Mills's behalf is that his contract is a "naturalized" explanation told so that liberal societies might someday live up to their own norms.
```

## The Chapters

- *Authority and the State: the Social Contract and Its Critics*: obligation and legitimacy, the three contracts, Hume, Wolff and Raz, the anarchists, Chinese and Islamic thought on rule, civil disobedience.
- *Liberty and Rights*: the harm principle, paternalism, free speech and hate speech, Berlin, non-domination, rights, the Universal Declaration and its critics.
- *Justice and Equality*: Rawls, Nozick, luck and relational equality, sufficiency and priority, capabilities, global justice, Mencius, zakat and *ubuntu*.
- *Democracy and Its Critics*: Athens, Plato, Aristotle, the jury theorem, Arrow, majority tyranny, epistocracy, deliberation, Confucian meritocracy, Wiredu.
- *Race, Colonialism and Philosophy*: the invention of race, whether race exists, Césaire, Fanon, the Racial Contract, postcolonial thought, reparations.
- *Feminist Philosophy*: sex and gender, Haslanger, trans inclusion, standpoint, intersectionality, the family, pornography, the canon, feminisms worldwide.

The questions continue in *Analytic Philosophy since 1950*, *Bentham, Mill and Utilitarianism*, *Consequentialism: What Makes Right Acts Right?* and *African Philosophy: the Ethnophilosophy Debate and Beyond*.

## Further exploration

- **A. John Simmons, *Moral Principles and Political Obligations* (1979).** The classic sceptical survey of consent, fairness, gratitude and natural duty.
- **Isaiah Berlin, *Liberty*, ed. Henry Hardy (2002).** Contains "Two Concepts of Liberty" and the other essays first collected in *Four Essays on Liberty* (1969).
- **Will Kymlicka, *Contemporary Political Philosophy: An Introduction* (2nd ed., 2002).** The standard survey: utilitarianism, Rawls, Nozick, Marxism, communitarianism and feminism.
- **David Estlund, *Democratic Authority: A Philosophical Framework* (2008).** Epistemic proceduralism and the demographic objection to epistocracy.
- **Jason Brennan, *Against Democracy* (2016).** Hobbits, hooligans and vulcans, and the case for epistocracy; read with Estlund.
- **Charles W. Mills, *The Racial Contract* (1997).** The short, provocative classic on the contract as a racial one.
- **Susan Moller Okin, *Justice, Gender, and the Family* (1989).** The liberal-egalitarian case that justice must reach into the family.$politicsov_master$,
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
  select $politicsov_quiz$[
    {"type": "mcq", "prompt": "According to the Political Philosophy overview, what is Joseph Raz's surprising conclusion about authority, as Authority and the State: the Social Contract and Its Critics presents it?", "options": ["Authority is piecemeal, and no existing state is owed a general duty of obedience", "Every reasonably just state has a general right to be obeyed", "Authority requires the actual express consent of each subject", "Autonomy and authority are always incompatible"], "answerIndex": 0, "explanation": "Raz's service conception holds that authority is justified when deferring helps a subject better comply with reasons that already apply to him. Because that varies by person and domain, authority is piecemeal, and Raz denies any existing state a general duty of obedience. The incompatibility of autonomy and authority is Wolff's thesis, which Raz rejects.", "id": "q1"},
    {"type": "mcq", "prompt": "What is David Estlund's 'demographic objection' to epistocracy, as the overview reports it from Democracy and Its Critics?", "options": ["Most voters are poor, so democracy is rule by the poor", "Knowledge tests would be too costly to give to a whole population", "Any test of competence would likely select a demographically narrow group whose shared biases distort its judgement", "Hobbits and hooligans outnumber vulcans in every group"], "answerIndex": 2, "explanation": "Estlund argues that a competence test would likely pick out a narrow group with shared biases, and that epistemic authority is not political authority. Hobbits, hooligans and vulcans are Brennan's categories, which the objection answers.", "id": "q2"},
    {"type": "mcq", "prompt": "How do Boxill and Corlett, as reported in Race, Colonialism and Philosophy, extend reparations claims beyond the slaveholders themselves?", "options": ["By arguing that slavery made present-day descendants worse off than they would otherwise have been", "By arguing that changed circumstances supersede historic injustice", "By appealing to Nozick's principle that a pattern is not a requirement of justice", "By arguing, after Locke, that claims attach to the estates of those who assisted, concurred or consented, including the tacit consent of nearly all white citizens"], "answerIndex": 3, "explanation": "Boxill and Corlett appeal to Locke on those who assisted, concurred or consented; the chapter notes the premise is contestable, since abolitionists dissented. The overview's own reading is that tacit consent, which Hume attacked as a ground of obligation, returns here as a ground of liability. Supersession is Waldron's objection, which they answer.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the Asian values debate and the Bangkok meeting of 1993 matches the overview?", "options": ["The Asian states at Bangkok rejected the Universal Declaration outright", "Asian states at Bangkok reaffirmed the Universal Declaration and said that, while human rights are universal in nature, they must be considered bearing in mind national and regional particularities", "Kim Dae-jung and Amartya Sen defended Asian values against the Universal Declaration", "Western delegates and Asian-values proponents agreed that the claims were a defence of community"], "answerIndex": 1, "explanation": "The Bangkok states reaffirmed the Universal Declaration while stressing particularities. Kim Dae-jung and Sen were critics of the Asian-values position, and Western delegates tended to see such claims as excuses for repression while their proponents saw a defence of community, development and non-interference.", "id": "q4"},
    {"type": "open", "prompt": "Trace the idea of consent and the social contract through the Political Philosophy section, from the Crito to Mills and Pateman. What can consent justify, and what are its limits?", "rubric": "A strong answer notes that Dagger and Lefkowitz find consent in the Crito (long residence as agreement), and gives the dilemma facing Hobbes, Locke and Rousseau: a historical contract was seldom made and ancestors' consent does not bind; a hypothetical contract, Dworkin said, 'is no contract at all'. It explains Locke's tacit consent and Hume's reply (the poor peasant or artisan who cannot leave). It explains that Rawls's agreement is hypothetical, its force coming from the fairness of the original position, that his natural duty binds without any voluntary act, and that Political Liberalism grounds legitimacy in what all citizens 'may reasonably be expected to endorse'; credit for Okin's use of the veil for sex. It explains Pateman's question of who could be a party and Mills's actual, not hypothetical, racial contract, with the responses (BarOn on consent, the contractarian reply, Pateman's view that contract permits domination, Mills's view that it can be saved). Better answers note the overview's own reading that tacit consent returns in the reparations debate as a ground of liability, and mention Wiredu's 'consent without consensus'.", "id": "q5"},
    {"type": "open", "prompt": "The overview distinguishes four kinds of equality: moral, political, distributive and relational. Explain each with examples from the section's chapters, and say which disputes turn on which kind.", "rubric": "A strong answer recognises that the fourfold scheme is the overview's own reading. Moral equality: Hansa Mehta's change to Article 1 ('All human beings are born free and equal in dignity and rights'), Rawls's charge that utilitarianism ignores the distinction between persons, Mills's contractualism beginning from moral equality. Political equality: democracy defined by equality among participants, Athenian lot, Mill's plural voting and Brink's 'tin ear' verdict, Rawls's fair value of political liberties, and the Brennan–Estlund–Christiano dispute over whether an equal say must yield to competence. Distributive equality: Rawls's difference principle, Nozick's entitlement theory, luck egalitarianism, sufficiency, priority and Parfit's Levelling Down Objection, and Cohen's point that lack of money is a lack of freedom. Relational equality: Anderson's democratic equality and Young's five faces of oppression, with the overview's suggestion that Waldron on hate speech, the republican kindly master and kind husband, Okin on the family and Haslanger on gender and race share the idea. Credit for noting that Rawls's theory contains 'the seeds' of both distributive and relational readings, and for presenting the libertarian and egalitarian positions evenhandedly.", "id": "q6"}
  ]$politicsov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
