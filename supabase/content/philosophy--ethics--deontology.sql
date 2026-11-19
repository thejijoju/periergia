-- Deontology: Duty and Respect — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/deontology @ research/advanced/read.
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
    'philosophy/ethics/deontology',
    'research',
    'advanced',
    'read',
    $deont_master$> **May you do a wrong to stop a greater one?** This chapter explains deontology, which judges choices by duties and rights rather than by results alone. It states Kant's formulas and runs his tests, follows the murderer at the door and the classic objections, and sets out the modern toolkit: constraints and options, the paradox of deontology, doing and allowing, double effect, Ross's prima facie duties and Scanlon's contractualism. It ends with the *Bhagavad Gītā* and Confucian role-duty, where the label itself is disputed.

## What Deontology Says

A surgeon has five patients who will die without transplants, and one healthy visitor whose organs would save them all. Almost everyone condemns killing the visitor, though five lives outnumber one. Deontology tries to explain why.

The word joins the Greek *deon*, duty, and *logos*, study. It was coined by Bentham, the great utilitarian, in a different sense (that which is fit or proper); its modern meaning is credited to C. D. Broad's *Five Types of Ethical Theory* (1930). For Larry Alexander and Michael Moore, in the Stanford Encyclopedia of Philosophy (SEP), it is a family of theories about which choices are required, forbidden or permitted: it assesses choices, while virtue ethics assesses character (see *Virtue Ethics, Greek and Confucian*).

Its rival is **consequentialism**, a word coined by a deontological critic, Anscombe, in "Modern Moral Philosophy" (1958). Consequentialists rank states of affairs and call right whatever produces the most good. Deontologists hold that some choices cannot be justified by their effects: "the Right is said to have priority over the Good." Two complaints drive them. Consequentialism seems **too demanding**, leaving no room to pursue one's own projects, to go beyond duty or to favour one's own children. And it seems **too permissive**, requiring us to kill, lie to or rob innocent people whenever that brings greater benefit. *Consequentialism: What Makes Right Acts Right?* gives the other side, including the trolley problems in full.

## Kant's Formulas

The most influential deontologist is Kant, whose life and system are told in *Kant*. His supreme principle is the **categorical imperative**, a command that binds us whatever we happen to want, unlike a hypothetical imperative ("if you want to be trusted, be honest"). The *Groundwork of the Metaphysics of Morals* (1785) gives several formulas, cited by the pages of the Akademie edition ("4:421" is volume 4, page 421); the translations are Gregor's.

The **Formula of Universal Law**: "act only in accordance with that maxim through which you can at the same time will that it become a universal law" (4:421). A **maxim** is the personal principle on which you act. The **Formula of Humanity** turns from form to persons:

```quote
So act that you use humanity, whether in your own person or in the person of any other, always at the same time as an end, never merely as a means.
Kant · Groundwork of the Metaphysics of Morals, 4:429, trans. Mary Gregor · 1785
```

The **Formula of Autonomy** presents every rational will as giving universal law (4:432), and the **Formula of the Kingdom of Ends** says: "act in accordance with the maxims of a member giving universal laws for a merely possible kingdom of ends" (4:439), a kingdom being a systematic union of rational beings under common laws.

Kant called these formulations of one and the same law. Whether they are equivalent is a debate: O'Neill, Engstrom and Sensen read them as equivalent in meaning, Allen Wood and Adam Cureton doubt it, and on Allison's reading they generate the same duties.

## Testing Maxims

The SEP, following O'Neill and Rawls, sets out the universal-law test in four steps: formulate your maxim; recast it as a universal law of nature; ask whether you could even *conceive* of a world governed by that law; if so, ask whether you could rationally *will* to act on your maxim in such a world.

Failing the third step, a **contradiction in conception**, reveals a **perfect duty**, which admits no exception for inclination. Failing only the fourth, a **contradiction in the will**, reveals an **imperfect duty**, which we must fulfil sometimes and to some extent. The *Groundwork* gives one example of each kind: suicide from self-love, the lying promise, neglecting one's talents, and refusing to help others. A world where no one helps anyone could exist, but no one could will it, since we all sometimes need others' help.

The lying promise is the central case. In the SEP's reconstruction:

1. My maxim: to make a deceptive promise of repayment in order to get money I need.
2. Universalised as a law of nature: everyone makes deceptive promises whenever that gets them what they want, and everyone knows it.
3. In such a world no practice of giving one's word could exist, since no one's word could be taken.
4. But my maxim needs that practice: someone has to take my word.
5. So I am trying to conceive of a world that both has and lacks a practice of promising. The maxim cannot be conceived as a universal law.
6. So I have a perfect duty never to act on it.

The maxim on its own is coherent; the contradiction appears only when it is combined with its universal version.

**Objection.** J. S. Mill, in *Utilitarianism* (articles 1861, book 1863), denied that any contradiction is involved:

```quote
he fails, almost grotesquely, to show that there would be any contradiction, any logical (not to say physical) impossibility, in the adoption by all rational beings of the most outrageously immoral rules of conduct. All he shows is that the consequences of their universal adoption would be such as no one would choose to incur.
J. S. Mill · Utilitarianism, ch. 1 · 1861
```

On this reading Kant is a consequentialist in disguise.

**Reply.** Step 5 does not say that a world of lying promises would be unpleasant. It says that the liar's own purpose could not be achieved there, because the practice his plan relies on could not exist. On Christine Korsgaard's reading this is a **practical** contradiction, not a merely logical one: the maxim defeats itself.

MacIntyre added that cleverly worded maxims seem to pass, such as "keep all your promises throughout your entire life except one"; Kantians reply that the test applies only to genuine maxims, not gerrymandered descriptions.

## Never Merely as a Means

The Formula of Humanity does not forbid using people. The SEP's example: we may use a horse and a taxi driver alike to cross town, but the driver must at the same time be treated as an end, for instance by paying an agreed price he could consent to. What must be respected is **humanity**: the capacity to act rationally and set one's own ends. Negatively, humanity is a limit we must not act against, the source of perfect duties; positively, it is something to further, the source of imperfect duties such as helping others pursue their ends. The lying promise fails here too, since it treats the lender's rational nature as a mere means.

The respect owed is what Darwall called **recognition respect**, due to every person as such, not **appraisal respect**, earned by merit; persons cannot lose their humanity by their misdeeds. Later deontologists turned the formula into what the SEP calls the **Means Principle**: a right against being used, without one's consent, as a means of producing good consequences.

## The Murderer at the Door

Kant's reputation for rigidity rests largely on an essay of 1797, "On a Supposed Right to Tell Lies from Benevolent Motives" (in Abbott's translation). Benjamin Constant had cited "a German philosopher" who held it a crime to lie even to a murderer asking whether your friend was hiding in your house. Kant defended the position. A lie, he argued, "always harms another; if not some human being, then it nevertheless does harm to humanity in general, inasmuch as it vitiates the very source of right" (Abbott's translation), and principles of right admit no exceptions.

{{image: Benjamin Constant | Benjamin Constant, whose remark about "a German philosopher" who would not lie even to a murderer at the door drew Kant's reply of 1797.}}

After the Second World War, with a Nazi officer substituted for the murderer, it became, in Helga Varden's words, "a cherished source of scorn". Augustine, Aquinas, Newman and Geach are absolutists about lying too; Constant, Mill, Sidgwick and Bok permit the lie.

Interpretations divide. Korsgaard ("The Right to Lie", 1986) argued, surprisingly, that the universal-law test *permits* this lie: the murderer himself hides his intent, and a universal practice of lying to deceivers would still work, so long as he does not know that you know what he is. It is the Formula of Humanity that seems to forbid it, since deception is the paradigm of treating someone merely as a means. Her solution had two levels: Humanity sets the ideal for a world of full compliance, while Universal Law sets a floor for dealing with evil. Varden argues that the essay concerns right, that is, legal philosophy, not the wrong done to the person deceived. Jens Timmermann has written the first book-length study.

## Empty Formalism and Rigorism

Hegel (see *German Idealism: Fichte, Schelling and Hegel*) charged that Kant's law is a mere principle of non-contradiction with no content. Take Kant's example of a deposit entrusted to you: the test cannot say whether a system of property is good, since a world with property and one without it are each consistent. Kantians reply that the test does yield real contradictions and that the Formula of Humanity supplies content; Freyenhagen judges the exchange a stand-off.

The charge of **rigorism** has Kant's own support. He endorsed *fiat iustitia, pereat mundus*, "do justice though the world perish", in *Toward Perpetual Peace* (1795), and held that a genuine conflict of duties is inconceivable. The SEP calls absolutism "the Kantian response" to catastrophe. Anscombe argued that talk of moral obligation makes no sense without a divine lawgiver.

```checkpoint
q: In the SEP's reconstruction, why does the maxim of making lying promises fail the Formula of Universal Law?
a*: Because the maxim needs a practice of taking people's word, which universal lying promises would make impossible.
a: Because a world of lying promises would make everyone unhappy.
x: That is how Mill read the test; Kantians deny that it turns on bad consequences.
a: Because the maxim contradicts itself even before it is universalised.
x: The maxim on its own is coherent; the contradiction appears only when it is combined with its universal version.
a: Because lying produces a contradiction in the will and so breaks an imperfect duty.
x: The lying promise fails at the earlier step, a contradiction in conception, which marks a perfect duty.
hint: What does the liar rely on in order to get the money?
why: Where everyone made deceptive promises whenever it suited them, no one's word could be taken, so the practice the liar exploits could not exist. The maxim cannot even be conceived as a universal law, which marks a perfect duty.
---
q: What did Korsgaard argue in "The Right to Lie" (1986)?
a: That Kant was right that one may never lie, even to a murderer.
x: Korsgaard argued that a lie to the murderer can be permitted.
a: That the essay is about legal right, not the wrong done to the person deceived.
x: That is Helga Varden's reading.
a*: That the lie passes the universal-law test, while the Formula of Humanity seems to forbid it, so a two-level theory is needed.
a: That the Formula of Humanity permits the lie and the Formula of Universal Law forbids it.
x: It is the other way round on her reading.
hint: Which formula does the murderer's own deception help?
why: Because the murderer hides his intent, a practice of lying to deceivers would still work, so Universal Law allows the lie; but deception seems to treat him merely as a means. Korsgaard made Humanity the ideal and Universal Law a floor for dealing with evil.
```

## Constraints and Options

Modern deontologists combine two things consequentialism lacks. **Constraints** forbid certain acts, such as killing the innocent, even when they would produce the most good. **Options** permit us not to produce the most good, for instance in order to pursue our own projects. The terms come from Samuel Scheffler's *The Rejection of Consequentialism* (1982). Both rest on **agent-relative reasons**, which Nagel made central: reasons for a particular agent that need not be reasons for anyone else, as a parent may save his own child rather than two strangers' children. In the SEP's phrase, "We are each enjoined to keep our own moral house in order."

**Agent-centred** deontologies focus on the agent's intentions (leading to double effect) or causal role (leading to doing and allowing). **Patient-centred** ones start from the rights of those affected. Nozick's *Anarchy, State, and Utopia* (1974) put it bluntly: "Individuals have rights, and there are things no person or group may do to them (without violating their rights)." Rights, for Nozick, are **side constraints** on everyone's pursuit of goals, grounded in Kant's ban on using people merely as means; he rejected a "utilitarianism of rights" that would violate one right to minimise total violations. (*Liberty and Rights* takes up rights in politics.) **Contractualist** deontologies, below, start from what we can justify to one another.

## The Paradox of Deontology

The deepest challenge to constraints is a puzzle that, the SEP says, arises for every deontology:

1. Violating a constraint, such as killing an innocent person, is wrong, and so bad.
2. If violations are bad, more violations are worse than fewer, whether committed by others or by my own future self.
3. Sometimes one violation by me would prevent several comparable violations by others.
4. Deontology forbids my one violation even then.
5. So deontology requires me to leave the world with more of the very wrongs it condemns.

Scheffler, finding no satisfactory rationale for constraints, kept options but rejected constraints.

**Objection.** Deontologists answer that constraints are **agent-relative**: each of us is told not to kill, not to minimise killings. My using John now cannot be traded against other people's usings of him. Alternatively, wrongs cannot be added up at all, because of the **separateness of persons**: no one suffers the combined losses of five people.

**Reply.** The second answer proves too much. If wrongs cannot be summed, neither can harms, so five deaths would be no worse than one and there would be no reason to save the five: "If the numbers don't count, they seemingly don't count either way." A third proposal treats constraints as reasons that exclude the competing reasons to maximise, but it needs much defence. Even Nagel, who grounds rights in our inviolable status, admits that some evils would justify killing an innocent person to prevent them. Alexander and Moore conclude that accounting for numbers without collapsing into consequentialism "will remain a huge thorn in the deontologist's side."

What of catastrophes? **Absolutists** bite the bullet. **Threshold** deontologists let constraints hold until consequences cross a threshold: you may not torture someone to save two lives, but may to save a thousand, if the threshold lies in between.

## Doing and Allowing

Is doing harm worse than allowing it? If not, notes Fiona Woollard in the SEP, active euthanasia is no worse than passive, and our failure to prevent millions of children's deaths from malnutrition, dehydration and measles is an outrage. Consequentialists deny the difference; their opponents almost universally affirm it.

Rachels's bathtub cases (1975) are the classic challenge. Smith drowns his young cousin for an inheritance; Jones plans to, finds the boy has slipped under, and lets him drown. Smith seems no worse than Jones, so killing is not in itself worse than letting die. Kagan replied that a factor need not make the same difference in every case; Kamm, that it would be permissible to kill Smith, but not Jones, to bring the child back, so the cases differ morally after all.

The trolley problem began here. Foot's paper of 1967 contrasted a judge who could frame and execute an innocent man to stop a riot that would kill five with a trolley *driver* who must choose between killing one and killing five, and explained the difference by doing and allowing. Judith Jarvis Thomson then imagined a *bystander* at a switch, choosing between killing one and letting five die; switching still seemed permissible, undermining Foot's explanation. In 2008 Thomson argued that the bystander may not switch after all. *Consequentialism: What Makes Right Acts Right?* follows the variants.

## Double Effect

The **doctrine of double effect** looks at intention. It goes back to Aquinas (see *Thomas Aquinas*) on self-defence, in the English quoted by the SEP: "Nothing hinders one act from having two effects, only one of which is intended, while the other is beside the intention." Defending yourself may save your life and kill the attacker; it is lawful because you intend the first, though not if you use more violence than necessary. It became a long-established Catholic doctrine, standardly stated in four conditions: the act itself is good or indifferent; the bad effect is not intended, only permitted; the good is not produced by means of the bad; and the good outweighs the bad (**proportionality**).

The classic illustration contrasts the **terror bomber**, who kills civilians to weaken the enemy's resolve, with the **tactical bomber**, who strikes a military target foreseeing that civilians will die. Even with the same certainty and the same deaths, the doctrine forbids the first and may permit the second. It is also applied to pain relief that might hasten death, though the SEP notes that properly given opioids do not typically do so.

Foresight without intention is never enough, since proportionality is always required. Critics press hard. Bennett argued that foreseeing a death with certainty hardly differs from intending it. The **problem of closeness** asks how to tell a side effect from a harm so close to one's means that it must count as intended; the SEP finds no clear resolution. Knobe's **side-effect effect** shows that people call a harmful side effect "intentional" more readily when they disapprove of it, so our classifications may follow our moral judgements rather than grounding them. Scanlon argues that intentions bear on how well an agent deliberated, not on whether the act is permissible.

## Ross's Prima Facie Duties

W. D. Ross (1877–1971) offered a pluralist deontology in *The Right and the Good* (1930). His first list had seven basic duties: **fidelity** (keeping promises), **reparation** (making up for a past wrong), **gratitude**, **justice**, **beneficence** (promoting the general good), **self-improvement** and **non-maleficence** (not injuring others). Ross later folded justice and self-improvement into beneficence, so the list is now often counted as five. Our neighbours, he argued, stand to us not only as possible beneficiaries but as promisees, creditors, children or friends, and each relationship grounds a duty.

These are **prima facie** duties: not merely apparent duties but considerations with real weight that can be outweighed. Which wins in a given case "rests with perception", a phrase Ross borrowed from Aristotle, though some generally weigh more: "We think the principle 'do evil to no one' more pressing than the principle 'do good to every one', except when the evil is very substantially outweighed by the good" (*Foundations of Ethics*, 1939). Rawls objected that without a rule for weighing them an intuitionist theory is only half a theory.

## Contractualism and the Numbers

The third branch grounds right and wrong in what we can justify to one another. T. M. Scanlon's *What We Owe to Each Other* (1998) states: "An act is wrong if its performance under the circumstances would be disallowed by any set of principles for the general regulation of behaviour that no one could reasonably reject as a basis for informed, unforced, general agreement." This reads Kant's demand to treat persons as ends as a demand to treat them by principles they could not reasonably reject. It differs from **contractarianism** (Hobbes, David Gauthier), on which morality is a bargain for mutual advantage (see *Authority and the State: the Social Contract and Its Critics*; Rawls's theory of justice is in *Justice and Equality*).

Scanlon's **individualist restriction** counts only individuals' reasons for objecting to a principle; complaints are not added up across people. This explains constraints: principles licensing others to kill us for the greater good can be reasonably rejected.

Refusing to add up complaints creates the **numbers problem**. In "Should the Numbers Count?" (1977) John Taurek imagined a drug that one person needs entirely while five others need a fifth each. He argued that one need not save the five, and that a coin toss gives each person an equal chance, since five people's losses are not a loss suffered by anyone; how far he doubted the numbers is debated. The SEP's version puts five people on one rock and one on another. Each complaint is the same ("you left me to die"), so contractualism seems to deadlock. Scanlon's **tie-breaker argument** replies that tossing a coin between five and one treats the extra four as if they were not there, so the five should be saved; Otsuka criticises it. Parfit pressed the opposite worry: if one person faces a hundred years of agony and a million face agony a day shorter, the restriction seems to favour the million suffering.

```checkpoint
q: What is the paradox of deontology?
a: That deontologists cannot agree on how many duties there are.
x: That is the question of whether Ross's list has seven duties or five.
a*: That a constraint may forbid one violation even when it would prevent several similar violations by others.
a: That deontology permits too much self-interest.
x: That is a worry about options; the paradox concerns constraints.
a: That intending and foreseeing a harm cannot be told apart.
x: That is the problem of closeness for the doctrine of double effect.
hint: Think of killing one innocent to stop several others from being killed.
why: If violations are bad, more are worse than fewer; yet deontology forbids my one violation even when it would prevent more. Replies make constraints agent-relative, deny that wrongs can be summed, or treat constraints as excluding the reasons to maximise.
---
q: How does Scanlon's tie-breaker argument handle a choice between saving five people and saving one?
a: It adds up the five complaints, which outweigh the one.
x: Contractualism's individualist restriction forbids adding complaints across people.
a: It recommends a fair coin toss, as Taurek did.
x: The coin toss is Taurek's proposal; the tie-breaker argument is meant to avoid it.
a: It leaves the choice to the rescuer's own preference.
x: The argument aims to show what the rescuer owes the people at risk.
a*: A coin toss would treat the extra four as if they were not there, so the five should be saved.
hint: In a one-against-one case a coin toss seems fair. What changes when there are five?
why: If one person's claim balances another's, the remaining four claims are untouched; ignoring them fails to respect each of them. Otsuka, among others, questions the argument.
```

## Duty beyond Europe

Whether "deontology" fits other traditions' ethics of duty is itself a debate. The **Bhagavad Gītā**, a dialogue between the warrior Arjuna and his charioteer Kṛṣṇa, an avatar of Viṣṇu, opens the sixth book of the *Mahābhārata*, formulated around the start of the Common Era. Arjuna refuses to fight his kin, and Kṛṣṇa answers with **karma yoga**, which Shyam Ranganathan, in the Internet Encyclopedia of Philosophy (IEP), calls deontology formulated as doing one's duty without the motive of consequence. One teaching is **svadharma**, one's own duty: "Better is one's own law of works, swadharma, though in itself faulty than an alien law well-wrought out" (3.35, trans. Sri Aurobindo). Another is **niṣkāma karma**, desireless action, glossed as duty for duty's sake: "To action alone hast thou a right and never at all to its fruits; let not the fruits of action be thy motive" (2.47, trans. S. Radhakrishnan). In the text, the duty "suited to one's nature" is caste (*varṇa*) duty, a point critics and defenders both stress. Kṛṣṇa also teaches **bhakti**, devotion to him, and near the end urges abandoning all dharmas to seek him, which Rāmānuja found troubling.

Is Kṛṣṇa a deontologist? Amartya Sen (*The Idea of Justice*, 2009) cast Arjuna as the voice of consequences and Kṛṣṇa as an archetypal deontologist; Joshua Anderson (2012) criticised the reading, and others read Kṛṣṇa's assurance that duty brings good outcomes as rule-consequentialist. Ranganathan argues that the Western trio of virtue, consequences and duty distorts the poem, which criticises conventional morality of every kind and defends two procedural theories of its own, karma yoga and bhakti. India also had an explicitly duty-centred school, Pūrva Mīmāṃsā (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*).

In China the comparable idea is ***li*** (禮): originally religious sacrifice, then rite, ritual and propriety, from ancestral rites to everyday courtesy. Practising *li* lets people fulfil their roles as parent, child, ruler or subject; in the IEP's rendering of *Analects* 12.11, "Let the ruler be a ruler, the subject a subject, a father a father, and a son a son." Role-duty can pull against impartial rules: told of a man who reported his father for stealing a sheep, Confucius replied that in his village uprightness lay in fathers and sons covering for one another (13.18).

Is this deontology? Roger Ames, Henry Rosemont and Robert Neville read Confucian ethics as a **role ethics**; others read it as virtue ethics. David Wong, in the SEP, notes that the texts say too little about the questions Western theories answer, and that *li* is relational rather than grounded in individual autonomy. Calling it deontological is at best an analogy: its duties belong to roles, not to universal rules derived from reason. *Virtue Ethics, Greek and Confucian* and *Confucius, Mencius and Xunzi* tell the rest.

## Further exploration

- **Christine M. Korsgaard, *Creating the Kingdom of Ends* (1996).** Essays on the formulas of the categorical imperative, including "The Right to Lie".
- **W. D. Ross, *The Right and the Good* (1930; new edition ed. Philip Stratton-Lake, 2002).** The classic statement of prima facie duties.
- **T. M. Scanlon, *What We Owe to Each Other* (1998).** The fullest defence of contractualism.
- **Fiona Woollard, *Doing and Allowing Harm* (2015).** A defence of the moral difference between doing and allowing, by the author of the SEP entry.
- **Roger T. Ames, *Confucian Role Ethics: A Vocabulary* (2011).** The case for reading Confucian ethics as an ethics of roles.
- **Shyam Ranganathan (ed.), *The Bloomsbury Research Handbook of Indian Ethics* (2017).** Indian ethical theories, including Mīmāṃsā and the Gītā.$deont_master$,
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
  select $deont_quiz$[
    {"type": "mcq", "prompt": "What does Kant's Formula of Humanity forbid?", "options": ["Using other people as means in any way at all", "Acting on any maxim that has bad consequences", "Treating humanity, in oneself or others, merely as a means rather than also as an end", "Breaking the Golden Rule"], "answerIndex": 2, "explanation": "We use people as means constantly, as when we take a taxi; what the formula forbids is treating their humanity (their capacity to set and pursue ends) merely as a means, for instance by deceiving or coercing them. Kant explicitly distinguished his principle from the Golden Rule, which he called 'trite'.", "id": "q1"},
    {"type": "mcq", "prompt": "In the original 1967 version of the trolley case, who faced the choice, and why does this matter?", "options": ["A trolley driver choosing between killing one and killing five; Foot used the case to explain the difference between doing and allowing", "A bystander at a switch; Foot used the case to defend saving the greater number", "A surgeon with five patients; Thomson used the case to attack double effect", "A man on a footbridge; Foot used the case to show that numbers do not count"], "answerIndex": 0, "explanation": "Foot's driver kills whichever way he goes, unlike her judge who would frame an innocent man rather than allow a riot. The bystander, who chooses between killing one and letting five die, is Thomson's later variant, which undermined Foot's explanation; Thomson herself later argued the bystander may not switch.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of the following is NOT one of the conditions of the doctrine of double effect in its standard Catholic statement?", "options": ["The act itself must be good or at least morally indifferent", "The agent must not intend the bad effect, only permit it", "The good effect must not be produced by means of the bad effect", "The agent must be certain that the bad effect will not occur"], "answerIndex": 3, "explanation": "The four conditions are: the act is good or indifferent; the bad effect is not intended; the good is not produced by means of the bad; and the good outweighs the bad (proportionality). The doctrine expressly covers bad effects that are foreseen, even with certainty, as in the tactical bomber case.", "id": "q3"},
    {"type": "mcq", "prompt": "How many prima facie duties did W. D. Ross recognise?", "options": ["Exactly one, the duty to promote the good", "Seven in his first list, which he himself later reduced to five by folding justice and self-improvement into beneficence", "Ten, as he set out in The Right and the Good", "Four, matching the four conditions of double effect"], "answerIndex": 1, "explanation": "The Right and the Good (1930) lists fidelity, reparation, gratitude, justice, beneficence, self-improvement and non-maleficence. Ross subsumed justice and self-improvement under beneficence, so the SEP counts five foundational duties, though textbooks still often give seven.", "id": "q4"},
    {"type": "open", "prompt": "Set out the paradox of deontology step by step. Then explain two ways deontologists have replied to it, and the main difficulty each reply faces.", "rubric": "A strong answer defines a constraint (a prohibition, such as on killing the innocent, that holds even when violating it would produce better results) and gives the steps: violating a constraint is wrong and so bad; more violations are worse than fewer; sometimes one violation by me would prevent several by others; deontology still forbids mine; so it requires me to leave the world with more of the wrongs it condemns. Replies: (1) constraints are agent-relative, telling each of us not to violate them rather than to minimise violations, which answers the version on which everyone's rights simply add up (but invites the 'narcissism' or clean-hands charge); (2) wrongs cannot be summed, appealing to the separateness of persons (but then harms cannot be summed either, so there would be no reason to save five rather than one: 'if the numbers don't count, they seemingly don't count either way'); credit for (3) protected or exclusionary reasons. Credit for mentioning Scheffler's acceptance of options but rejection of constraints, Nagel's admission that some evils would justify killing an innocent, and the absolutist versus threshold responses to catastrophes.", "id": "q5"},
    {"type": "open", "prompt": "Is it illuminating to call the ethics of the Bhagavad Gītā, or Confucian ethics of li, 'deontological'? Explain the case for and against, naming the scholars involved.", "rubric": "A strong answer describes the Gītā's setting (Arjuna and Kṛṣṇa at the opening of the sixth book of the Mahābhārata), Arjuna's arguments against fighting, and Kṛṣṇa's teaching of svadharma (one's own duty, tied in the text to caste duty) and niṣkāma karma (action without attachment to its fruits, glossed as duty for duty's sake, 2.47). It presents Sen's reading of Kṛṣṇa as an archetypal deontologist and Anderson's criticism; rule-consequentialist readings; and Ranganathan's view that the Western trio distorts the poem, which defends karma yoga and bhakti as procedural theories. For Confucianism it explains li as rites and propriety that let people fulfil roles (Analects 12.11; the sheep-stealing father, 13.18), and the debate between virtue-ethical and role-ethical readings (Ames, Rosemont, Neville), with Wong's point that the texts do not address the questions Western theories answer and that li is relational rather than autonomy-based. It concludes that 'deontological' is at best an analogy: role-specific duties rather than universal rules derived from reason. Credit for mentioning Mīmāṃsā as an explicitly duty-centred Indian tradition and for treating the religious material evenhandedly.", "id": "q6"}
  ]$deont_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/deontology', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
