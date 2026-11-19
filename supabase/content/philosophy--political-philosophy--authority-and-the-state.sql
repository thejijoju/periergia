-- Authority and the State: the Social Contract and Its Critics — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/authority-and-the-state @ research/advanced/read.
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
    'philosophy/political-philosophy/authority-and-the-state',
    'research',
    'advanced',
    'read',
    $authority_master$> **Why should anyone obey the state?** This chapter separates political obligation from prudence and legitimacy from justice, compares the contracts of Hobbes, Locke and Rousseau as answers to one question, and sets out Hume's case against tacit consent step by step. It weighs the theories that replaced consent (fair play, gratitude, natural duty and membership), follows Wolff's argument that autonomy rules out authority and Raz's reply, and meets the classical anarchists. It then turns to Confucian and *fa* thinkers in China and to al-Fārābī, Ibn Taymiyya and Ibn Khaldūn, and ends with Thoreau, Gandhi, King and the question of unjust laws.

## The Problem of Political Obligation

A law forbids you to cross an empty road against a red light at three in the morning. No one is coming and crossing would harm nobody. Do you still have a reason to wait, simply because it is the law?

That is the problem of **political obligation**, which Richard Dagger and David Lefkowitz, in the Stanford Encyclopedia of Philosophy (SEP), equate with a moral duty to obey the law of one's own country. The phrase is apparently no older than T. H. Green's Oxford lectures of 1879–80, which set out "to discover the true ground or justification for obedience to law". The question is far older: Sophocles' *Antigone* (first performed around 440 BCE) staged it, and Plato's *Crito* gave Socrates' answer some forty years later.

The duty is meant to be **content-independent** (owed to a law because it is the law, not because what it commands is right, as H. L. A. Hart analysed it), **general** (covering all laws and all subjects) and **particular** (owed to one's own state, what A. John Simmons called the "particularity requirement"). A **legal obligation** is not enough, since people under a tyranny have legal obligations but may have no moral duty to obey.

**Legitimacy** has two senses. Weber used it descriptively: a regime is legitimate when its subjects believe in it, on grounds of tradition, charisma or legality. Philosophers usually mean it normatively, tied, as Fabienne Peter explains in the SEP, either to justifying coercive power (Rawls) or to justifying authority, the right to rule (Joseph Raz). Legitimacy is not justice: for Rawls, institutions can be legitimate yet unjust, since legitimacy "makes weaker demands than justice". Simmons separates a state's **justification** (showing that having a state is better than having none) from its **legitimacy** (its right to impose duties on particular people, which he thinks requires their actual consent). Tommie Shelby argues that oppressed minorities may rightly see institutions as lacking legitimacy when the order they uphold is unjust.

The SEP's verdict frames what follows: many answers have been given, "none now commands widespread assent", and some philosophers deny that a satisfactory theory can be devised at all.

## Socrates in Prison

In 399 BCE Socrates was convicted of impiety and corrupting the young. Friends arranged his escape; he refused (see *Socrates and the Sophists*). Escaping, he argued, would break his "agreements and commitments" and mistreat his friends, his country and the laws (*Crito* 54c, in Grube's translation), and it is never right to return a wrong. The personified Laws tell him to persuade or obey them.

Dagger and Lefkowitz find four later theories in seed here. Long residence counts as agreement (**consent**). Socrates owes the laws his birth, nurture and education, as a son owes a father (**membership**, and **gratitude**). Escape would mistreat "people whom we should least mistreat" (50a), an argument from **fairness**. And he asks whether a city can survive if its courts' verdicts are "nullified and set at naught by private individuals" (50b), an argument from **utility**.

How seriously Socrates meant it is debated. In the *Apology* (29c–30c) he says he would not obey a verdict ordering him to stop philosophising. Kraut argues that the Laws' demand presupposes that persuasion is seriously possible, so disobedience may be permitted where it is not; Penner and Woozley read a stricter duty to obey; Gallop suggests Socrates accepts the conclusion without endorsing all the Laws' arguments.

## Three Contracts, One Question

Early modern Europe's classic answer was the **social contract**: we must obey because we agreed, or would agree, to a political order. Each version has its own chapter; here they matter as rival answers to "why obey?".

For **Hobbes** (see *Hobbes*), the state of nature is "a warre of every man against every man". People covenant to obey a sovereign who makes, enforces and interprets the law, and since covenants without the sword behind them are, he held, mere words, the sovereign's power makes the agreement hold. A conqueror gains authority too. Few now accept that agreement at the point of a sword creates a moral rather than prudential obligation, and the SEP doubts that consent is really the key: Hobbes's real view may be that "we have an obligation to obey anyone who can maintain order".

For **Locke** (see *Locke*), free and equal people first form a society and then establish a government, to escape the "inconveniencies" of the state of nature; the two stages let him defend a right of revolution. Full membership requires **express consent**, but **tacit consent** is given by enjoying or inheriting property, or even, in the SEP's paraphrase, by walking along the highways. Simmons asks how walking down a street could be a deliberate, voluntary giving-up of rights, and argues that Locke's logic leads toward **philosophical anarchism**; Pitkin replies that natural law, not consent, fixes what Lockean government may do.

For **Rousseau** (see *The Enlightenment and Rousseau*), the task is "a form of association" in which each would "obey only himself". Obligation comes not from handing rights to a separate ruler but from obeying a law one gives oneself as a member of the sovereign people; whoever refuses will be "forced to be free".

All three face a dilemma. If the contract is historical, few ever made it, and, as Hume objected, one's ancestors' consent does not bind oneself. If it is hypothetical, then in Ronald Dworkin's phrase "a hypothetical contract is no contract at all". Kant accepted Hume's point that states often begin in violence and made the contract a test: each law should be one all could have consented to (see *Kant*). Later critics asked who was allowed to contract at all: Carole Pateman's *The Sexual Contract* (1988) and Mills's *The Racial Contract* (1997), taken up in *Feminist Philosophy* and *Race, Colonialism and Philosophy*.

## Hume against Tacit Consent

The sharpest attack on consent is David Hume's essay "Of the Original Contract", first published in 1748 (see *Berkeley and Hume*). Its target, as the SEP entry on authority reconstructs it, is this: whoever voluntarily lives in a state's territory and benefits from its rule of law knows that obedience is expected, so continued residence is **tacit consent**, consent shown by conduct rather than words, and grounds obligation. Hume's reply, step by step:

1. Consent requires a free choice; even a tacit contract must engage the will.
2. Most subjects do not think they consented; they think they were born to obey, and governments punish disloyalty in people who never promised anything.
3. For most people, leaving their country would be ruinous, so staying is not a free choice.
4. Someone carried on board a ship while asleep, who must "leap into the ocean and perish the moment he leaves her", does not consent to the captain's authority by staying aboard.
5. So residence cannot be read as consent, and the consent theory fails for almost everyone.

Step 3 is the heart of it:

```quote
Can we seriously say that a poor peasant or artisan has a free choice to leave his country, when he knows no foreign language or manners, and lives from day to day by the small wages which he acquires?
David Hume · Of the Original Contract · 1748
```

Hume's sleeper is often called a "press-ganged sailor", but that is a later gloss. His own view was that allegiance rests not on promise but on the general social value of having a government, a duty independent of promise-keeping; history shows governments founded on conquest and usurpation. He still allowed rebellion against a cruel tyranny.

**Objection.** Beran replies that people often make binding commitments to escape terrible costs: we buy insurance, and soldiers lay down their arms on condition of safety. A dreadful alternative does not by itself void consent.

**Reply.** Even so, if residents know obedience is expected, what really binds them is the public benefit of the state and the importance of compliance in producing it; consent is "an idle wheel". Simmons adds the **interpretation problem** (why should staying put *mean* consent?), and Brilmayer and Wellman argue that tacit consent begs the question, since a group without authority cannot demand that people submit or leave a territory it merely claims.

Hume and Simmons do not deny that consent *can* bind; too few people have given the right kind. Defenders persist: Plamenatz and Steinberger, for instance, count voting or calling the police as consent.

```checkpoint
q: What is Hume's point in the example of the man carried on board a ship while asleep?
a*: That staying where leaving would be ruinous does not amount to consenting to the authority one lives under.
a: That subjects are bound to obey because they were born into the state, as sailors are bound to their ship.
x: Hume reports that subjects believe they were born to obey, but uses the ship to attack consent, not to defend a birth-based duty.
a: That press-gangs prove all governments are founded on force.
x: Hume's man is carried aboard while asleep; "press-ganged sailor" is a later label, and the example concerns consent.
a: That citizens, like sailors signing articles, must sign an express contract.
x: Hume does not propose express contracts; his positive view grounds allegiance in the general usefulness of government.
hint: What would the sleeper have to do to escape the captain's authority?
why: He could leave only by leaping into the ocean and perishing, so remaining aboard expresses no free choice. Likewise a poor peasant who cannot leave his country does not consent by staying.
---
q: How does Beran answer Hume?
a: Everyone has given express consent by voting.
x: Counting voting as consent is closer to Plamenatz and Steinberger's view.
a: Hypothetical consent binds just as actual consent does.
x: Beran defends actual consent; Dworkin's "a hypothetical contract is no contract at all" is the standard objection to hypothetical consent.
a*: People often make binding commitments to avoid terrible costs, so a dreadful alternative does not void consent.
a: Consent is unnecessary because states are justified by their usefulness.
x: That is Hume's own positive view, not a defence of consent.
hint: Think of insurance, or soldiers who surrender on condition of safety.
why: Beran argues that a terrible alternative does not make an agreement void. The reply is that consent then becomes "an idle wheel": what obliges is the public benefit of the state.
```

## After Consent: Fairness, Gratitude, Duty and Membership

If consent fails, four other grounds dominate the modern debate.

**Fair play.** Hart (1955) held that when people conduct a joint enterprise by rules and restrict their liberty, "those who have submitted to these restrictions when required have a right to a similar submission from those who have benefited by their submission". Rawls adopted this in 1964 as the "duty of fair play". Since obeying the law is the main form of cooperation in a polity, free riders wrong their fellow citizens. Nozick's counterexample in *Anarchy, State, and Utopia* (1974) is famous: neighbours set up a public address system and assign each adult a day to run it; you never agreed but sometimes enjoy the broadcasts. Must you take your turn? Surely not, yet fair play seems to say yes, letting others oblige us merely by benefiting us. (Nozick's rights as side constraints are in *Deontology: Duty and Respect*.) Simmons added that receiving benefits is not accepting them. George Klosko replies that fair play binds where goods are worth the effort, "presumptively beneficial" and fairly shared.

**Gratitude.** The state benefits us; we owe benefactors gratitude, which includes not harming them; disobedience harms the state; so we should obey. But a state may not be the right kind of benefactor, and, as one objection runs, "Someone who forces benefits on me, and forces me to pay a share for them, may thereby undermine his desert of gratitude." And civil disobedience against unjust laws may help the state.

**Natural duty.** Rawls's *A Theory of Justice* (1971) proposed a natural duty that "requires us to support and to comply with just institutions that exist and apply to us", binding without any voluntary act. Waldron, Christiano, Wellman and Stilz developed it: people reasonably disagree about justice, so only a common legal order can settle in practice what it requires. The objection is particularity: why support just institutions through *my* state rather than one more just or more needy? Waldron answers with proximity, Wellman with the unfairness of free-riding on fellow citizens. (Rawls's theory of justice is the subject of *Justice and Equality*.)

**Membership.** Associative theories treat citizenship like family: a role, usually unchosen, that carries obligations. Dworkin's *Law's Empire* (1986) calls political association "in itself pregnant of obligation", but only in a "community of principle" treating members with equal concern and respect; Horton likens the polity to a family into which we are mostly born. Critics reply that citizens lack a family's intimacy and that membership alone would bind the oppressed in unjust polities.

## Autonomy against Authority: Wolff and Raz

Robert Paul Wolff's *In Defense of Anarchism* (1970) defines authority as "the right to command, and correlatively, the right to be obeyed", and argues:

1. To accept authority is to do something *because* one is told to, whatever the content.
2. Every rational agent has a primary obligation of **autonomy**, "the refusal to be ruled": to decide for oneself what is right in each case.
3. Acting on a command because it is commanded, rather than on one's own judgement, violates autonomy.
4. So autonomy and authority are incompatible, except in a unanimous direct democracy, which is too restricted ever to be realised in an actual state.
5. So, in Wolff's words, "the concept of a de jure legitimate state would appear to be vacuous, and philosophical anarchism would seem to be the only reasonable political belief for an enlightened man."

Wolff did not deny that states exist or demand their abolition; the anarchist simply "will never view the commands of the state as legitimate, as having a binding moral force". Critics answer that autonomy need not override every other value (Horton), and that the argument would equally condemn promises and contracts. Hence Simmons, himself a sceptic, calls it "a failed attempt". His own anarchism is **a posteriori**: not deduced from autonomy but concluded because every defence of a general obligation has failed, and it implies no strong imperative to oppose states.

**Raz's reply.** Joseph Raz's *The Morality of Freedom* (1986) gave the most influential account of legitimate authority, the **service conception**. Its **Normal Justification Thesis** holds that one person has authority over another when the subject "is likely to better comply with the reasons which apply to him ... if he accepts the directives of the alleged authority as authoritatively binding and tries to follow them, rather than by trying to follow the reasons which apply to him directly". By the **Dependence Thesis**, directives should rest on reasons that already apply to their subjects (we already owe a fair share; an authority can set a fair tax scheme). By the **Pre-emption Thesis**, a directive replaces some of those reasons rather than joining them on the scales. Against Wolff, Raz argues that insisting on one's own judgement when deferring would make one conform better to reason can be irrational, and that deciding to defer can itself express autonomy.

The surprise is where this leads. Authority is **piecemeal**: it binds only those who would do better by deferring, only in those domains, and never where acting on one's own judgement matters more than getting it right, as in choosing friends. Raz therefore denies that any existing state is owed a general duty of obedience. Darwall objects that a good financial adviser may satisfy the thesis without any standing to *demand* compliance, so it yields no right to rule;

```checkpoint
q: Why does Simmons call Wolff's argument for anarchism "a failed attempt"?
a: Because Wolff admitted that de facto states exist.
x: That admission fits Wolff's view; he denies only that states have a moral right to be obeyed.
a*: Because the same reasoning would condemn promises and contracts, which also bind one's future judgement.
a: Because Simmons believes there is a general duty to obey just states.
x: Simmons denies any general political obligation; he is a philosophical anarchist himself.
a: Because unanimous direct democracy is common in practice.
x: Wolff held that it is too restricted ever to be realised in an actual state.
hint: What else do we do that commits us in advance, whatever we later think?
why: If acting on any prior commitment rather than present judgement violated autonomy, promising would be wrong too. Simmons reaches anarchism a posteriori instead, after finding that each defence of political obligation fails.
---
q: What follows from Raz's service conception of authority?
a: Every reasonably just state has a general right to be obeyed by all its citizens.
x: Raz denies that any existing state is owed a general duty of obedience.
a: Authority requires the actual consent of each subject.
x: Consent plays no part in the Normal Justification Thesis, which asks whether deferring helps one comply with reasons.
a: Autonomy and authority are always incompatible.
x: That is Wolff's thesis; Raz argues that one can autonomously decide to defer.
a*: Authority is piecemeal: it binds only those who would conform better to reason by deferring, and only in those domains.
hint: Who would actually do better by following the directive?
why: The Normal Justification Thesis makes authority depend on whether deferring helps a particular subject comply with reasons that already apply to him, which varies by person and topic.
```

## The Anarchists Who Wanted No State

**Political anarchism** goes beyond denying a duty to obey: it holds that states are immoral and should be abolished. The word comes from the Greek *arché*, ruling power; anarchy is rule by no one. William Godwin (1793) held that "government, even in its best state, is an evil", to be kept as small as "the general peace of human society will permit". Pierre-Joseph Proudhon, among the first writers explicitly to affirm anarchism, wrote in *What Is Property?* (1840):

```quote
The government of man by man (under whatever name it be disguised) is oppression. Society finds its highest perfection in the union of order with anarchy.
Pierre-Joseph Proudhon · What Is Property? · 1840
```

Bakunin argued in 1873 that wherever there is a state, one class dominates another. Peter Kropotkin's *Mutual Aid* (1902) argued that cooperation is as much a factor in evolution as competition. Emma Goldman, jailed in 1917 for opposing the draft and deported to Russia in 1919, called anarchism "the only philosophy of peace" and wrote that "Every institution today rests on violence". Gandhi said in 1916, "I myself am an anarchist, but of another type".

## Virtue, Standards and the Mandate of Heaven

Classical Chinese thinkers asked what makes rule rightful and what makes it work, without framing either as consent. The Zhou justified conquering the Shang by claiming that Heaven had transferred its **mandate** (*tianming*) because of Shang misrule, making Heaven a moral judge of rulers. Confucians held that people follow a ruler with *de* (virtue) willingly; as *Confucius, Mencius and Xunzi* tells, Confucius contrasted rule by punishments, which leaves people evasive and shameless, with rule by virtue and ritual.

Mencius sharpened this. Asked by King Xuan of Qi whether a vassal may murder his lord, he answered, in the Internet Encyclopedia of Philosophy (IEP) translation: "One who robs co-humanity [ren] you call a 'robber'; one who robs the right [yi] you call a 'wrecker'; and one who robs and wrecks you call an 'outlaw.' I have heard that [Wu] punished the outlaw Zhou – I have not heard that he murdered his lord." A ruler who destroys benevolence and rightness is no ruler. He also ranked the people first and the ruler last. Was he a democrat? Bai Tongdong reads him as a foundation for limited democracy; Justin Tiwald warns against overestimating his championing of the popular will, stressing his "essentially procedural requirement that the ruler be properly designated for the task". Loubna El Amine argues that political order, not moral edification, is the Confucian goal.

The rival tradition, told in *Mozi, the Daoists and the Legalists: the Hundred Schools*, grounded order in *fa*, standards or laws. Yuri Pines, who finds the label "Legalism" "quite inaccurate", stresses that *fa* was meant to be public and impartial, binding even the ruler: "not a tool of intimidation and suppression as is often imagined", despite its notorious advocacy of harsh punishments. Those were real: the *Book of Lord Shang* declares, in Pines's translation, "When the people are weak, the state is strong". Whether the *fa* thinkers were totalitarians is debated; Pines and Stephen Angle warn against that caricature, and against reading the Confucians as simply opposed to law.

## Just Rule in Islamic Thought

Islamic philosophers asked what rule is *for*. For al-Fārābī (died c. 950; see *Falsafa: al-Kindī, al-Fārābī and Avicenna*), the excellent city is one whose people co-operate "for the things by which felicity in its real and true sense can be attained". Its ideal ruler is philosopher, prophet, supreme ruler, lawgiver and imam at once. Legitimacy here is perfectionist: rule is rightful insofar as it leads citizens to happiness.

Ibn Taymiyya (1263–1328), writing *Law-Guided Public Policy* (*al-Siyāsa al-Sharʿiyya*) in Damascus around 1310, held that religion cannot do without temporal power, whose purpose is to reform the people's religion. He drew no blueprint for an ideal state, urging officials to reform within existing structures.

Ibn Khaldūn (1332–1406) took an empirical turn in the *Muqaddimah* (1377). Group feeling (*ʿaṣabiyya*), strongest among nomads, carries a group to royal power, which decays in settled luxury, so dynasties have something like a natural life span. He defined government as "an institution which prevents injustice other than such as it commits itself", a definition Gellner called the best in political philosophy, and dismissed al-Fārābī's virtuous city as useless.

## Civil Disobedience

What should one do when a law is unjust? Henry David Thoreau refused his poll tax for years in protest at slavery, the extermination of Native Americans and the Mexican War, and spent a night in jail in 1846. His essay appeared in 1849 as "Resistance to Civil Government"; the title "Civil Disobedience" dates from 1866, after his death, and his "civil" meant "of citizens", not "polite". The essay accepts the motto "That government is best which governs least" (often misattributed to Jefferson) and pushes it to "governs not at all". It declares: "Under a government which imprisons any unjustly, the true place for a just man is also a prison."

Gandhi published a synopsis of Thoreau in 1907 but denied taking civil disobedience from him: the South African resistance "was well advanced before I got the essay". His word, *satyagraha*, coined in 1906 from *satya* (truth) and *āgraha* (holding firmly), means, he said, "holding on to truth, hence truth-force". The Salt March of 1930 is its best-known use; *Modern Chinese and Indian Philosophy* follows Gandhi further.

{{image: Letter from Birmingham Jail | A recreation of the Birmingham jail cell where Martin Luther King Jr. began his letter of 16 April 1963 in the margins of a newspaper, at the National Civil Rights Museum in Memphis.}}

Martin Luther King Jr.'s "Letter from Birmingham Jail" replied to "A Call for Unity", a statement by eight white Alabama clergymen. One has "a moral responsibility to disobey unjust laws", he wrote, agreeing with Augustine that "an unjust law is no law at all"; a law is unjust, for instance, if imposed on a minority that, denied the vote, had no part in making it. Such a law should be broken openly and with love, by someone willing to accept the penalty, for one who does so "in order to arouse the conscience of the community over its injustice, is in reality expressing the highest respect for law."

Rawls's account is the usual starting point. He defined civil disobedience as a public, non-violent, conscientious yet political breach of law, usually aimed at changing a law or policy and addressed to the majority's sense of justice. It is justified, he held, against serious, long-standing injustice to equal basic liberties (segregation, not economic inequality), as a last resort. Is this too narrow? Broader accounts, from Brownlee, Delmas and Scheuerman, note that Gandhi and King tolerated some coercion: King wanted direct action "to create a situation so crisis packed that it will inevitably open the door to negotiation". Candice Delmas's *A Duty to Resist* (2018) argues for duties to resist injustice, sometimes uncivilly.

## Must We Obey Unjust Laws?

The theories converge on a modest answer: almost none claims more than a *prima facie* duty, one that can be outweighed; for Raz it is never conclusive. For Rawls one unjust law within a nearly just constitution does not by itself license disobedience; fair-play theorists allow civil disobedience aimed at reforming the scheme. Hume allowed rebellion against a cruel tyranny, Locke a right of revolution, Mencius the punishment of an outlaw who had ceased to be king. What still divides philosophers is whether ordinary, decent laws carry any moral weight beyond their content.

## Further exploration

- **A. John Simmons, *Moral Principles and Political Obligations* (1979).** The classic sceptical survey of consent, fairness, gratitude and natural duty.
- **Robert Paul Wolff, *In Defense of Anarchism* (1970).** The short, sharp case that autonomy and authority cannot be reconciled.
- **John Horton, *Political Obligation* (1992; 2nd edn 2010).** A balanced introduction that defends an associative view.
- **Candice Delmas, *A Duty to Resist: When Disobedience Should Be Uncivil* (2018).** Argues for duties to resist injustice beyond Rawls's model of civility.
- **Tommie Shelby, *Dark Ghettos: Injustice, Dissent, and Reform* (2016).** The obligations and dissent of the oppressed in an unjust state.
- **Loubna El Amine, *Classical Confucian Political Thought: A New Interpretation* (2015).** Reads early Confucianism as centred on political order.
- **Ovamir Anjum, *Politics, Law and Community in Islamic Thought: The Taymiyyan Moment* (2012).** Ibn Taymiyya's political thought in its setting.$authority_master$,
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
  select $authority_quiz$[
    {"type": "mcq", "prompt": "Which three features are usually taken to define political obligation?", "options": ["It is content-independent, general and particular", "It is voluntary, conditional and universal", "It is prudential, legal and descriptive", "It is absolute, hypothetical and owed to any just state"], "answerIndex": 0, "explanation": "Political obligation is a duty to obey the law because it is the law (content-independent), covering all laws and subjects (general), and owed to one's own state (particular: Simmons's 'particularity requirement'). Prudential reasons and merely legal obligations are not what the debate is about.", "id": "q1"},
    {"type": "mcq", "prompt": "What was Nozick's public address system example meant to show?", "options": ["That tacit consent is given by residence", "That the principle of fair play would let others put us under obligation just by conferring benefits on us", "That gratitude is owed only to benevolent benefactors", "That authority is piecemeal"], "answerIndex": 1, "explanation": "Neighbours run a public address system and assign you a day; you never agreed but sometimes enjoy the broadcasts. Fair play seems to say you must take your turn, but surely you need not. Simmons added that receiving benefits is not the same as accepting them.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement best describes Yuri Pines's account of fa (standards or laws) in the so-called Legalist tradition?", "options": ["Fa was a secret code used only by the ruler to terrorise officials", "Fa was the Confucian ideal of ritual propriety", "Fa was meant to be public and impartial, binding even the ruler, though the tradition also advocated harsh punishments", "Fa was a theory of popular consent to government"], "answerIndex": 2, "explanation": "Pines, who calls the label 'Legalism' quite inaccurate, stresses that fa was to be public and applied impartially, even to the ruler, and was 'not a tool of intimidation and suppression as is often imagined', despite the notorious advocacy of harsh punishments in texts like the Book of Lord Shang.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of the following is correct about Thoreau's essay on civil disobedience?", "options": ["Thoreau took the motto 'That government is best which governs least' from Jefferson", "Gandhi said he took the idea of civil disobedience from Thoreau", "Thoreau used 'civil' to mean polite and courteous", "It was first published in 1849 as 'Resistance to Civil Government' and given the title 'Civil Disobedience' in 1866"], "answerIndex": 3, "explanation": "The 1866 title was given after Thoreau's death; his 'civil' meant relating to citizens. The 'governs least' motto is often misattributed to Jefferson, and Gandhi denied deriving civil disobedience from Thoreau, saying the South African resistance was well advanced before he read the essay.", "id": "q4"},
    {"type": "open", "prompt": "Set out Hume's argument against tacit consent step by step. Then state Beran's objection and explain how a defender of Hume could reply.", "rubric": "A strong answer explains tacit consent (consent shown by conduct, such as continued residence) and the argument it targets: whoever voluntarily lives in a state and benefits from it knows obedience is expected, so residence counts as consent. It gives Hume's steps: consent requires a free choice that engages the will; most subjects think they were born to obey and never promised; leaving is ruinous for most people (the poor peasant or artisan who knows no foreign language and lives on daily wages); the man carried on board a ship while asleep does not consent to the captain by staying; so residence is not consent. It notes the essay was first published in 1748, that 'press-ganged' is a later label, and Hume's positive view that allegiance rests on the usefulness of government. Beran's objection: people make binding commitments to avoid terrible costs (insurance, surrender on condition of safety). The reply: if residents should know obedience is expected, what binds them is the public benefit of compliance, so consent is 'an idle wheel'; credit for Simmons's interpretation problem and Brilmayer and Wellman's charge that tacit consent begs the question.", "id": "q5"},
    {"type": "open", "prompt": "Explain Wolff's argument that autonomy and authority are incompatible, and assess Raz's service conception as a reply. Does Raz's view restore a general duty to obey the state?", "rubric": "A strong answer gives Wolff's definition of authority as the right to command and be obeyed, his claim that autonomy ('the refusal to be ruled') is a primary obligation, and the inference that acting on commands because they are commanded violates autonomy, so no de jure legitimate state is possible outside unanimous direct democracy. It notes that Wolff's philosophical anarchism does not deny de facto states or demand their abolition, and gives objections: autonomy need not override all values; the argument would condemn promises too, so Simmons calls it a failed attempt and argues for anarchism a posteriori. It explains Raz's Normal Justification Thesis (authority is justified when deferring helps the subject better comply with reasons that already apply), the Dependence and Pre-emption Theses, and the reply that deferring can be a rational exercise of autonomy. It concludes that Raz's authority is piecemeal and that he denies any existing state a general duty of obedience; credit for Darwall's financial-adviser objection.", "id": "q6"}
  ]$authority_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/authority-and-the-state', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
