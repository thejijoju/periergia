-- Ethics — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/ethics @ research/advanced/read.
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
    'philosophy/ethics',
    'research',
    'advanced',
    'read',
    $ethicsov_master$> **Ethics, on this overview's gloss, asks how we should live and what we owe each other.** This overview shows how the section's eight chapters fit together: three approaches in normative ethics, built on outcomes, duties and character; the question whether there are moral facts at all; whether death is bad and life has meaning; and applied ethics in medicine, in our dealings with animals and nature, and in technology. It then follows four questions through them: do outcomes alone matter; who counts; how traditions beyond Europe framed duty, virtue and non-harm; and whether the existence of moral facts makes any difference to the applied debates.

## What Ethics Asks

Someone in need should be helped. Why? *Virtue Ethics, Greek and Confucian* opens with this case, which the Stanford Encyclopedia of Philosophy (SEP) entry by Rosalind Hursthouse and Glen Pettigrove uses to separate the three main approaches in normative ethics. A utilitarian points to the consequences of helping; a deontologist to a rule, such as "Do unto others…"; a virtue ethicist to the fact that helping "would be charitable or benevolent".

Those are **first-order** questions. *Metaethics: Are There Moral Facts?* steps back to ask what moral claims are. Metaethics, in Geoff Sayre-McCord's SEP definition, is "the attempt to understand the metaphysical, epistemological, semantic, and psychological, presuppositions and commitments of moral thought, talk, and practice". *The Meaning of Life and the Fear of Death* asks two further questions: whether death is bad for the one who dies, and whether a life that ends can have a point. The last three chapters take the theories into practice.

On this overview's reading, the section therefore moves from theory to the status of theory itself, then to the frame of a human life, and last to the hard cases of medicine, nature and machines, where the theories meet one another again.

## Outcomes: Consequentialism

*Consequentialism: What Makes Right Acts Right?* starts with Peter Singer's "Famine, Affluence, and Morality" (1972): if you pass a shallow pond where a child is drowning, you ought to wade in, though your clothes get muddy; distance makes no moral difference; so the affluent ought to give far more than they do. **Consequentialism**, in Walter Sinnott-Armstrong's SEP definition, is "the view that normative properties depend only on consequences"; the word was coined by G. E. M. Anscombe in 1958, though for her it first named a view about responsibility; its present meaning came later. A crucial distinction separates a **criterion of rightness** (what makes acts right) from a **decision procedure** (how to decide what to do). It opens room for **rule consequentialism**, which judges acts by rules.

The Mohists of Warring States China argued from benefit. Chris Fraser calls their view "practice" or "*dao* (way) consequentialism", since they judged practices such as lavish funerals rather than single acts; other scholars read Mohism as a divine-command theory, because the Mohists grounded their standard in the intention of Heaven. The chapter then works through the trolley problems, the objections from justice and integrity (Bernard Williams's George and Jim), demandingness and Parfit's repugnant conclusion, and ends with **effective altruism**, its critics, and the collapse of FTX: William MacAskill condemned Sam Bankman-Fried's actions and said effective altruism emphasises integrity, while Leif Wenar argued that the case cannot be separated from effective altruism's reasoning about expected value.

## Duties: Deontology

*Deontology: Duty and Respect* asks whether you may do a wrong to stop a greater one. Deontology judges choices by duties and rights rather than by results alone; "the Right is said to have priority over the Good." Its most influential voice is Kant, whose **categorical imperative** binds us whatever we happen to want. The chapter tests his formulas on the lying promise and gives the Formula of Humanity:

```quote
So act that you use humanity, whether in your own person or in the person of any other, always at the same time as an end, never merely as a means.
Kant · Groundwork of the Metaphysics of Morals, 4:429, trans. Mary Gregor · 1785
```

Modern deontologists combine **constraints**, which forbid some acts even when they would produce the most good, with **options**, which permit us not to produce the most good. The chapter sets out the **paradox of deontology** (a constraint may forbid one violation that would prevent several), Ross's prima facie duties, and T. M. Scanlon's **contractualism**, which grounds wrongness in principles that no one could reasonably reject. It ends beyond Europe, with the *Bhagavad Gītā* and Confucian role-duty, where whether "deontology" is the right label is itself disputed.

## Character: Virtue Ethics

*Virtue Ethics, Greek and Confucian* asks what kind of person I should be. Almost every version uses three Greek words: *aretē*, excellence or virtue; *phronēsis*, practical wisdom; and *eudaimonia*, "flourishing". For Aristotle virtue is necessary for flourishing but not sufficient, since flourishing also needs external goods; for Plato and the Stoics it is necessary and sufficient, so the virtuous person on the rack is fully happy. Confucian cultivation runs from the *Analects*' ritual practice to Mencius's moral "sprouts" and Xunzi's reshaping of human nature. Whether Confucian thought is a virtue ethics or a **role ethics**, as Roger Ames and Henry Rosemont Jr. argue, is debated; David Wong's SEP verdict is that the label fits in a broad sense, is doubtful in a narrow one, and should be used "with the appropriate qualifiers".

The modern revival was heralded by Anscombe's "Modern Moral Philosophy" (1958), though she herself "did not advocate" building virtue ethics as a full alternative theory. The chapter follows the revival through Alasdair MacIntyre, Philippa Foot and Rosalind Hursthouse, sets out the **situationist** challenge from social psychology, with the caveats about the experiments, and ends with the **ethics of care**, which puts relationships of dependency and care at the centre of moral life.

```checkpoint
q: What did Samuel Scheffler's The Rejection of Consequentialism (1982) keep and reject, according to the Consequentialism and Deontology chapters?
a*: It kept an agent-centred prerogative to give one's own projects extra weight, but found no comparable rationale for agent-centred restrictions.
a: It kept agent-centred restrictions and rejected agent-centred prerogatives.
x: It is the other way round: Scheffler found no satisfactory rationale for the restrictions, or constraints.
a: It rejected consequentialism entirely in favour of Kant's categorical imperative.
x: Scheffler proposed a hybrid: we are always permitted to produce the best outcome.
a: It argued that rule consequentialism collapses into act consequentialism.
x: That is David Lyons's collapse objection (1965), answered by Brad Hooker.
hint: Constraints and options are Kagan's labels for Scheffler's two ideas.
why: Scheffler's hybrid permits us always to produce the best outcome but gives us an option to favour our own interests and projects. Constraints forbidding, say, killing one to prevent more killings are the deontologist's territory; Scheffler kept options and rejected constraints.
---
q: How does David Wong, in the SEP, answer the question whether Confucian ethics is a virtue ethics?
a: It is plainly not, because Confucians had no word for virtue.
x: Wong accepts the label in a broad sense, and the Analects treats five excellences, such as ren and yi, as central.
a: It is exactly Aristotle's theory in Chinese dress.
x: Even virtue-ethical readers deny "the misguided belief that Aristotle and Confucius were the same" (Van Norden).
a*: Uncontroversial in a broad sense, doubtful in the narrow sense of a rival theory to deontology and consequentialism, and usable with qualifiers that respect the relational character of Confucian virtues.
a: It is a role ethics and nothing else, as Ames and Rosemont hold.
x: Wong accepts the role theorists' relational insight but does not drop virtue language.
hint: Wong distinguishes a broad and a narrow sense of "virtue ethics".
why: Wong takes the narrow sense from Justin Tiwald: a theory giving traits explanatory priority over right action and good consequences. He doubts the texts address those questions, and accepts that Confucian virtues are realised in relationships.
```

## Are There Moral Facts?

*Metaethics: Are There Moral Facts?* draws its map with two questions. Do moral claims purport to report facts? **Cognitivists** say yes; **non-cognitivists**, among them today's expressivists, say they express some other attitude. Are some moral claims actually true? **Moral realists** answer yes twice; **error theorists** answer yes, then no. **Constructivists** say moral truths are whatever a privileged point of view would construct, and **relativists** make them relative to a group's traditions or practices.

The chapter works through the arguments that shaped the map. Hume asked how an "ought" could be "a deduction from" premises about what "is". G. E. Moore's **open question argument** claimed that goodness cannot be defined as any natural property, though most metaethicists now judge that it refutes only analytic naturalism. J. L. Mackie's *Ethics: Inventing Right and Wrong* (1977) began "There are no objective values". Expressivists face the **Frege–Geach problem**, and Sharon Street's **Darwinian dilemma** asks how evolved moral beliefs could track stance-independent truths. In the 2020 PhilPapers survey about six in ten philosophers surveyed accepted or leaned towards moral realism, but, as the chapter warns, an opinion survey is no evidence that realism is true.

## Death and Meaning

*The Meaning of Life and the Fear of Death* begins with Epicurus's argument that death is nothing to us, since "when we are, death is not come, and, when death is come, we are not" (R. D. Hicks's translation). The leading modern reply is the **deprivation account**: death is bad when it deprives us of good life we would otherwise have had, and so, the chapter notes, not bad for everyone who dies. Lucretius's **symmetry argument** holds up the time before birth as a mirror of the time after death, and Bernard Williams argued that endless life would eventually exhaust the desires that give us reason to go on.

The chapter then turns to practice rather than proof: Ecclesiastes and its refrain of *hevel*, the Stoics' rehearsal of death, Buddhist mindfulness of death (*maraṇasati*), Zhuangzi singing after his wife's death, and the Japanese aesthetics of transience. It follows Tolstoy's crisis and Camus's absurd, maps today's theories of meaning, including African communal views, and ends with David Benatar's pessimism.

## Applied Ethics: Medicine

*Bioethics: Life, Death and Medicine* covers the four principles of Beauchamp and Childress (respect for autonomy, beneficence, nonmaleficence and justice), informed consent, and the research scandals, such as Tuskegee, behind modern rules. It sets out the strongest arguments on both sides of abortion and euthanasia without taking sides. On abortion, Judith Jarvis Thomson's violinist grants, for the sake of argument, that the fetus is a person and argues that abortion can still be permissible; Don Marquis argues that killing is wrong because it deprives the victim of a valuable future, so that abortion is wrong unless justified. The two arguments, the chapter observes, are less opposed than they look. Catholic, Islamic, Jewish and Buddhist views are described in their own terms.

On euthanasia, Robert Young rests the case for legalisation on autonomy together with well-being, while Finnis and Keown locate the difference between withdrawing treatment and euthanasia in intention. Young reads Dutch studies as showing no slippery slope and Keown reads the same experience as showing that the slope is real; the evidence remains disputed. The chapter dates the law "as of late 2026". It ends with genetic enhancement and the allocation of scarce care.

## Applied Ethics: Animals and the Environment

{{image: Peter Singer | Peter Singer, whose drowning-child argument and *Animal Liberation* (1975) recur across this section, from effective altruism to the moral status of animals.}}

*Animals and the Environment* asks what we owe to animals, to nature and to people not yet born. It starts with Bentham's question whether animals can suffer and Singer's attack on **speciesism**, sets out the argument from marginal cases with its critics and defenders, and compares Tom Regan's rights view, Christine Korsgaard's Kantian case and Martha Nussbaum's capabilities approach. It traces Indian ethics of non-harm, follows environmental ethics from Aldo Leopold's land ethic to deep ecology, ecofeminism and the legal rights of nature, and ends with climate justice: Stephen Gardiner's "perfect moral storm", future people, and who should pay.

## Applied Ethics: Technology

*Ethics of Technology and AI* asks whether technology is ever neutral, then turns to privacy, surveillance, algorithmic fairness, automation and work, and responsibility for autonomous systems. The COMPAS dispute shows that two measures of fairness, calibration and balanced error rates, cannot both be met when base rates differ and prediction is imperfect. Robert Sparrow's argument against killer robots asks who answers when a learning machine decides.

On the long-term risks of AI, the chapter presents a live dispute. On one side stand Nick Bostrom's orthogonality thesis, Stuart Russell's critique of the "standard model" of AI, which frames the alignment problem, and the Center for AI Safety's statement of 30 May 2023; on the other, Müller and Cannon argue that the premises rely on incompatible notions of intelligence, and Gebru, Bender, Mitchell and McMillan-Major that a focus on hypothetical risks draws attention from present harms. Others refuse the choice: the Center's Dan Hendrycks said "it's not 'either/or' but 'yes/and'". The SEP (revised March 2026) observes that even philosophers who reject the arguments for existential risk "should acknowledge that they might be wrong". The chapter ends with AI regulation, as of November 2026.

## Questions That Run Through the Section

### Do outcomes alone matter?

This overview notes that three distinctions which outcomes alone leave out recur across the section's chapters.

The first is **doing versus allowing**. The trolley cases began, as *Consequentialism: What Makes Right Acts Right?* tells it, in a paper about abortion: Philippa Foot (1967) explained why a tram driver may steer onto one man but a judge may not frame an innocent one by the difference between killing and letting die. Judith Jarvis Thomson's bystander at a switch undermined that explanation. James Rachels's bathtub cases (1975), in which Smith drowns his cousin and Jones merely lets him drown, appear twice: in *Deontology: Duty and Respect* as the classic challenge to the distinction, and in *Bioethics: Life, Death and Medicine* as an argument that active euthanasia is no worse than passive. Both chapters give the replies of Shelly Kagan and Frances Kamm.

The second is **double effect**, the doctrine traced to Aquinas that a foreseen side effect may be permissible where the same harm, intended, would not be. *Deontology: Duty and Respect* gives its four conditions and the contrast between the terror bomber and the tactical bomber; *Consequentialism: What Makes Right Acts Right?* reports it as one proposed explanation of why most people approve of switching the trolley but not of pushing a man off a footbridge, though Thomson's loop case troubles it and the explanation remains disputed. In *Bioethics: Life, Death and Medicine* the doctrine permits "indirect abortion" in Catholic teaching, and is usually illustrated by morphine given to relieve pain while foreseeing that it hastens death. That chapter adds a caution: palliative-care specialists hold that properly titrated opioids rarely hasten death, so the stock example rests on a myth.

The third is **constraints**: acts forbidden even when they would produce more good. Scheffler's hybrid kept an option to favour one's own projects but found no rationale for constraints; the paradox of deontology asks why I may not commit one violation to prevent several. On this overview's reading, *Ethics of Technology and AI* extends the question to machines. The first premise of Sparrow's argument, that a weapon may be used only if someone can justly be held responsible for the deaths it causes, is a constraint of this kind; and the German ethics commission's rule against distinctions based on personal features in unavoidable accidents rejects some popular preferences recorded by the Moral Machine in the name of equal dignity. As that chapter puts it, an experiment records preferences, not what is right.

Behind all three, this overview adds, lie intuitions about cases. Joshua Greene suggested that we have reasons to be suspicious of our deontological judgments, which he tied to fast emotional responses; Selim Berker replied that brain findings carry no normative weight by themselves.

### Who counts?

*Animals and the Environment* begins with Lori Gruen and Susana Monsó's account of moral considerability: a morally considerable being "is a being who can be wronged". This overview suggests that the same question, who shows up on the moral radar and with what weight, runs through every applied chapter.

For Kant, as that chapter reports, animals matter only indirectly: the man who shoots his dog damages his own humanity. Bentham asked instead, "Can they suffer?", and Singer's **equal consideration of interests** gives equal weight to the like interests of all affected. The **argument from marginal cases**, or from species overlap, presses the point: any property that only humans have, some humans lack, and any property that all humans have, many animals share. Eva Feder Kittay, the care ethicist of *Virtue Ethics, Greek and Confucian*, reappears in *Animals and the Environment* as a critic, with Licia Carlson, of the comparisons the argument relies on. Contract theories, *Animals and the Environment* notes, leave animals out: Peter Carruthers's self-interested contractors protect rational agents only.

At the edges of life the question returns. The abortion arguments in *Bioethics: Life, Death and Medicine* ask whether the fetus is a person, whether Mary Anne Warren's five traits mark personhood, or, in Marquis's attempt to avoid the personhood question entirely, what makes killing us wrong: the loss of a valuable future. This overview notes that Marquis's account resembles the deprivation account of the badness of death in *The Meaning of Life and the Fear of Death*, which likewise locates the harm of death in what it takes away; the chapters do not draw this link themselves.

Future people raise the hardest version. Parfit's **non-identity problem**, set out in *Animals and the Environment* through his depletion case, starts from the intuition that "what is bad must be bad for someone": a policy that changes who is born is not worse for those who are born, yet seems wrong. Dropping that intuition for impersonal views leads, on total views, to the **repugnant conclusion** discussed in *Consequentialism: What Makes Right Acts Right?*, where **longtermism** also appears: the view, defended in MacAskill's *What We Owe the Future* (2022), that positively influencing the long-term future is a key moral priority, which critics question for the difficulty of prediction and its reliance on tiny probabilities of enormous payoffs.

### How the traditions framed duty, virtue and non-harm

The chapters bring in thinkers beyond Europe as philosophers working on the same questions, and repeatedly ask whether Western labels fit them.

**Mohism** is called "the world's earliest form of consequentialism" by Fraser, but Dennis Ahern, David Soles and others read it as a divine-command theory. **Confucian roles** appear in two chapters. *Deontology: Duty and Respect* presents *li*, rite and propriety, through which people fulfil their roles: "Let the ruler be a ruler, the subject a subject, a father a father, and a son a son" (*Analects* 12.11, in the IEP's rendering). Calling this deontological is, the chapter concludes, at best an analogy, and *Virtue Ethics, Greek and Confucian* gives the parallel debate about virtue.

The **Bhagavad Gītā**, a dialogue between the warrior Arjuna and his charioteer Kṛṣṇa, teaches *svadharma*, one's own duty, and *niṣkāma karma*, action without attachment to its fruits: "To action alone hast thou a right and never at all to its fruits" (2.47, trans. S. Radhakrishnan). In the text, the duty "suited to one's nature" is caste duty, a point critics and defenders both stress. Amartya Sen cast Kṛṣṇa as an archetypal deontologist; Joshua Anderson criticised the reading, others read it as rule-consequentialist, and Shyam Ranganathan argues that the Western trio of virtue, consequences and duty distorts the poem.

**Ahiṃsā**, non-harm, appears in *Animals and the Environment*. The Jains class living beings by their number of senses and distinguish the physical act of violence from the intention behind it; the first Buddhist lay precept is to abstain from killing living beings, and Aśoka turned non-harm into policy, though his Pillar Edict 5 is a list of protected species and days, not a general ban on killing.

In *Metaethics: Are There Moral Facts?*, **Mīmāṃsā** holds that dharma is known only through Vedic injunctions, held to have no author; in our terms, not the school's, it is objective and not human-made, yet unlike divine command theory there is no divine commander. In Islamic theology the **Muʿtazila** held that human reason can know the basics of morality before revelation, and that a just and wise God cannot command what is contrary to reason; the **Ashʿarites** held that good is what God commands. The chapter reads this as a version of the *Euthyphro* question, rational objectivism against theological voluntarism, moved on one side by divine justice and on the other by divine omnipotence.

On this overview's reading, the recurring finding is that each tradition fits the modern map only partly: duties tied to roles, to caste or to revelation do not sort neatly into consequences, rules derived from reason, or character. *Ethics of Technology and AI* adds that AI-ethics guidelines are criticised for neglecting African and Asian perspectives.

### Do moral facts matter for the applied debates?

The applied chapters, this overview observes, mostly proceed without first settling whether moral facts exist. *Bioethics: Life, Death and Medicine* reports that Beauchamp and Childress wanted a framework for a pluralist, secular society that presupposed no single moral theory, and that Stephen Toulmin noted that members of the US National Commission agreed about hard cases while disagreeing about theory. Practical agreement, on this overview's reading, can outrun theoretical agreement.

Yet, on this overview's reading, metaethical questions surface across the section all the same. Nicholas Sturgeon argued, in *Metaethics: Are There Moral Facts?*, that the oppressiveness of slavery figures in the best explanation of the growth of the anti-slavery movement; relativism seems unable to call abolishing slavery progress, though relativists reply that progress can mean drawing out values a society already holds. Green and Hu's reply in *Ethics of Technology and AI*, that fairness is a moral notion, not a statistic, echoes Hume's gap between "is" and "ought", a link the chapters do not themselves make. Greene's debunking of deontological intuitions in *Consequentialism: What Makes Right Acts Right?* has, on this overview's reading, the same shape as Street's evolutionary debunking of moral beliefs in general, though neither chapter draws the comparison. And the *Euthyphro* problem returns again and again: for theological voluntarism, for constructivism in Shafer-Landau's dilemma, for the Muʿtazila and Ashʿarites, and, in *The Meaning of Life and the Fear of Death*, for the view that life is meaningful insofar as it fulfils a purpose God assigned.

Metaethics bears on meaning too. Thaddeus Metz lists Mackie's error theory as one route to nihilism about meaning, and Camus, on Metz's classification, is a nihilist who held that only God or a soul could give life meaning, and that neither exists. David Lewis may be right, as *Metaethics: Are There Moral Facts?* concludes, that part of the choice is temperament, but the arguments decide which positions remain open.

```checkpoint
q: How do the Deontology and Bioethics chapters use James Rachels's Smith and Jones cases?
a: Both use them to defend the doctrine of double effect.
x: Rachels's cases concern doing and allowing; double effect turns on intention, a separate distinction.
a*: As a challenge to the moral difference between killing and letting die, which Rachels applied to argue that active euthanasia is no worse than passive.
a: As proof that killing is always worse than letting die.
x: Rachels argued the reverse: Smith seems no worse than Jones.
a: As evidence about the slippery slope in the Netherlands.
x: The slippery-slope debate rests on Dutch studies since the Remmelink Report, not on Rachels's thought experiment.
hint: Smith drowns the child; Jones watches him drown.
why: If the cases differ only as killing versus letting die and Smith is no worse than Jones, the distinction carries no weight in itself. Both chapters give the replies of Kagan, on the method of contrasting matched cases, and Kamm, who argued one could kill Smith but not Jones to bring the child back.
---
q: What is the non-identity problem, as Animals and the Environment presents it?
a: The problem that future people cannot have interests.
x: The argument does not deny future people interests; it turns on who exists.
a: The problem that we cannot know which people will exist in two centuries.
x: The depletion case stipulates the outcome; the puzzle is moral, not predictive.
a: The problem that a pure discount rate of 3 per cent halves the value of a cost 25 years away.
x: Discounting, how much less future harms should count, is a separate question, debated by Stern and Nordhaus.
a*: A policy that changes who is born is not worse for the people who then exist, yet seems wrong, which conflicts with the intuition that what is bad must be bad for someone.
hint: Under Conservation, would the same people have been born?
why: In Parfit's depletion case the choice changes when and how people conceive children, so the later people would not otherwise have existed and their lives are worth living. Impersonal views escape the problem but, on total views, meet the repugnant conclusion.
```

## The Chapters

- *Consequentialism: What Makes Right Acts Right?*: the drowning child, acts and rules, the Mohists, the trolley problems, integrity, demandingness, effective altruism.
- *Deontology: Duty and Respect*: Kant's formulas, the murderer at the door, constraints and options, double effect, Ross, Scanlon, the *Gītā* and *li*.
- *Virtue Ethics, Greek and Confucian*: Aristotle, the Stoics, Confucian cultivation, role ethics, the modern revival, situationism, care.
- *Metaethics: Are There Moral Facts?*: Hume's gap, Moore, Mackie, expressivism, constructivism, relativism, the Darwinian dilemma, Mīmāṃsā and kalām.
- *The Meaning of Life and the Fear of Death*: Epicurus and the deprivation account, symmetry, immortality, Ecclesiastes, Stoic and Buddhist practice, Tolstoy, Camus, theories of meaning.
- *Bioethics: Life, Death and Medicine*: principles, consent, research scandals, abortion, euthanasia, enhancement, allocation.
- *Animals and the Environment*: speciesism, marginal cases, rights and capabilities, ahiṃsā, the land ethic, deep ecology, climate justice.
- *Ethics of Technology and AI*: neutrality, privacy, surveillance, fairness, work, responsibility gaps, existential risk, regulation.

The questions continue in *Justice and Equality*, *Liberty and Rights*, *Self and No-Self: Personal Identity East and West* and *Minds and Machines: Could AI Think?*.

## Further exploration

- **Christine M. Korsgaard, *Creating the Kingdom of Ends* (1996).** Essays on Kant's formulas of the categorical imperative, including "The Right to Lie".
- **Bryan W. Van Norden, *Virtue Ethics and Consequentialism in Early Chinese Philosophy* (2007).** Confucius and Mencius read as virtue ethicists, set against the Mohists.
- **J. L. Mackie, *Ethics: Inventing Right and Wrong* (1977).** The classic case for error theory, written for the general reader as well as for professionals.
- **Shelly Kagan, *Death* (2012).** Whether death is bad for us and whether living forever would be desirable.
- **Emily Jackson and John Keown, *Debating Euthanasia* (2011).** The case for and against legalisation, argued in one volume.
- **Lori Gruen, *Ethics and Animals: An Introduction* (2011).** A clear survey by a co-author of the SEP entry, with feminist and relational perspectives.
- **Mark Coeckelbergh, *AI Ethics* (2020).** A short introduction to the main questions.$ethicsov_master$,
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
  select $ethicsov_quiz$[
    {"type": "mcq", "prompt": "What caution does Bioethics: Life, Death and Medicine add about the stock example of the doctrine of double effect, morphine given to relieve pain while foreseeing that it hastens death?", "options": ["Palliative-care specialists hold that properly titrated opioids rarely hasten death, so the example rests on a myth", "Morphine is never used in end-of-life care", "The doctrine of double effect was invented to justify morphine use", "Catholic teaching rejects the doctrine of double effect"], "answerIndex": 0, "explanation": "The doctrine, traced to Aquinas, permits some foreseen side effects that may not be intended. The Bioethics chapter notes that palliative-care specialists hold that properly titrated opioids rarely hasten death, so the usual illustration rests on a myth; Catholic teaching uses the doctrine, for instance to permit 'indirect abortion'.", "id": "q1"},
    {"type": "mcq", "prompt": "How does the Mīmāṃsā view of dharma, as Metaethics: Are There Moral Facts? presents it, differ from divine command theory?", "options": ["Mīmāṃsā holds that dharma is known by perception and inference", "Mīmāṃsā holds that dharma is a human convention", "Dharma is known through Vedic injunctions held to have no author, so there is no divine commander", "Mīmāṃsā holds that God's will makes acts right"], "answerIndex": 2, "explanation": "For Mīmāṃsā, dharma is known only through Vedic injunctions, held to have no author. In our terms, not the school's, it is objective and not human-made; unlike divine command theory, there is no divine commander.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement correctly describes the Islamic debate presented in Metaethics: Are There Moral Facts?", "options": ["Both the Muʿtazila and the Ashʿarites held that reason alone determines what God commands", "The Ashʿarites held that reason can know morality before revelation, and the Muʿtazila that good is whatever God commands", "Both schools rejected revelation as a source of moral knowledge", "The Muʿtazila held that reason can know the basics of morality before revelation and that a just and wise God cannot command what is contrary to reason; the Ashʿarites held that good is what God commands"], "answerIndex": 3, "explanation": "The Muʿtazila were moved by divine justice, the Ashʿarites by divine omnipotence. The chapter reads the dispute as a version of the Euthyphro question: rational objectivism against theological voluntarism.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Judith Jarvis Thomson's violinist argument assume about the fetus, as Bioethics: Life, Death and Medicine presents it?", "options": ["That the fetus is not a person at any stage", "That the fetus is a person from conception, granted for the sake of argument", "That the fetus has none of Mary Anne Warren's five traits", "That the fetus has a valuable future like ours"], "answerIndex": 1, "explanation": "Thomson grants, for the sake of argument, that the fetus is a person and argues that abortion can still be permissible. The 'future like ours' argument is Don Marquis's, which concludes that abortion is wrong unless justified; the chapter observes that the two arguments are less opposed than they look, and takes no side.", "id": "q4"},
    {"type": "open", "prompt": "'Who counts?' Trace this question through at least three chapters of the Ethics section, using the views and arguments the overview names.", "rubric": "A strong answer starts from Gruen and Monsó's account of moral considerability (a being who can be wronged). It contrasts Kant's indirect view of animals (the man who shoots his dog damages his own humanity) with Bentham's 'Can they suffer?' and Singer's equal consideration of interests; explains the argument from marginal cases (properties only humans have some humans lack; properties all humans have many animals share) and notes Kittay and Carlson's criticism of the comparisons; and mentions that contract theories such as Carruthers's leave animals out. It brings in the abortion debate (personhood, Warren's traits, Marquis's future-like-ours argument) evenhandedly, and future people: Parfit's non-identity problem through the depletion case, the person-affecting intuition, impersonal views and the repugnant conclusion, and longtermism with its critics. Better answers note that linking Marquis's argument to the deprivation account of death is the overview's own observation, not the chapters'.", "id": "q5"},
    {"type": "open", "prompt": "Do outcomes alone matter? Explain how doing and allowing, double effect and constraints recur across the Consequentialism, Deontology, Bioethics and Technology chapters.", "rubric": "A strong answer explains doing versus allowing through Foot's tram driver and judge (1967) and Thomson's bystander, and Rachels's Smith and Jones cases, which appear in Deontology as a challenge to the distinction and in Bioethics as an argument that active euthanasia is no worse than passive, with the replies of Kagan and Kamm. It explains double effect (traced to Aquinas; terror versus tactical bomber; switch versus footbridge; indirect abortion in Catholic teaching; the morphine example and the palliative-care caution). It explains constraints and options, Scheffler's hybrid and the paradox of deontology, and notes the overview's own reading that Sparrow's argument against autonomous weapons and the German commission's rule against distinctions by personal features extend the question to technology, with the point that an experiment such as the Moral Machine records preferences, not what is right. Credit for Greene's dual-process challenge and Berker's reply, and for presenting euthanasia evenhandedly.", "id": "q6"}
  ]$ethicsov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
