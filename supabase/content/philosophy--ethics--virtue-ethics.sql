-- Virtue Ethics, Greek and Confucian — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/virtue-ethics @ research/advanced/read.
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
    'philosophy/ethics/virtue-ethics',
    'research',
    'advanced',
    'read',
    $virtue_master$> **What kind of person should I be?** Virtue ethics answers moral questions by asking about character rather than rules or results. This chapter explains its core ideas (virtue, practical wisdom and flourishing) in Aristotle, the Stoics, Confucius, Mencius and Xunzi, and the debate over whether Confucian thought is a virtue ethics or a "role ethics". It follows the modern revival through Anscombe, MacIntyre, Foot and Hursthouse, sets out step by step the strongest modern challenge, the situationist argument from social psychology, with its replies and the caveats about the experiments, and ends with the ethics of care.

## Character before Rules

Someone in need should be helped. Why? The Stanford Encyclopedia of Philosophy (SEP), in Rosalind Hursthouse and Glen Pettigrove's entry, uses this case to separate the three main approaches in normative ethics. A utilitarian points to the consequences of helping; a deontologist to a rule, such as "Do unto others…"; a virtue ethicist to the fact that helping "would be charitable or benevolent". *Consequentialism: What Makes Right Acts Right?* and *Deontology: Duty and Respect* tell the first two stories.

Every approach finds some room for virtue. A consequentialist defines a virtue as a trait that tends to produce good results, a deontologist as the trait of someone who reliably does their duty. What marks out virtue ethics is "the centrality of virtue within the theory": virtues and vices are "foundational", and other moral notions are "grounded in them".

Almost every version uses three Greek words: *aretē*, excellence or virtue; *phronēsis*, practical wisdom; and *eudaimonia*, "happiness" or, better, "flourishing". Better, the SEP argues, because happiness in ordinary speech is subjective (if I think I am happy, I am), whereas I can be wrong about whether I am flourishing. A virtue is "an excellent trait of character": a disposition "well entrenched in its possessor—something that, as we say, goes all the way down, unlike a habit such as being a tea-drinker—to notice, expect, value, feel, desire, choose, act, and react in certain characteristic ways." Because it is a **multi-track disposition**, showing in perception, feeling and choice, it is "reckless" to credit someone with a virtue on the strength of one act. The honest person tells the truth not because honesty pays, but because "To do otherwise would be dishonest".

## Aristotle: the Mean and Practical Wisdom

The SEP names Plato and Aristotle as the founders of virtue ethics in the West, Confucius and Mencius in the East. Aristotle's **function argument** (*Nicomachean Ethics* I.7) concludes that the human good, *eudaimonia*, is activity of the rational part of the soul in accordance with virtue over a full life; the chapter on *Aristotle* sets it out step by step, with its objection and reply. Two consequences matter here. Happiness is virtuous *activity*, not just having virtue; and it also needs external goods such as friends and some wealth. For Aristotle, virtue is necessary for flourishing but not sufficient.

Virtues of character grow in two stages. In childhood we are repeatedly placed in situations that call for the right actions and feelings, and a "low-grade form" of virtue emerges; once reason matures, practical wisdom completes it. Aristotle advises us, in the Internet Encyclopedia of Philosophy's (IEP) summary, to perform just acts "because this way we become just"; yet "Virtue is not itself a habit", for "true virtue requires choice, understanding, and knowledge".

Book II defines this kind of virtue, in the IEP's paraphrase, as a purposive disposition lying in a **mean** and determined by right reason, as the practically wise person would determine it. The mean is "relative to us": a ration too small for Milo the wrestler is too much for a beginner, and sometimes great anger is right, if proportionate to the situation. Is the mean empty for choices that are not matters of more and less, such as whether to attend a wedding? Richard Kraut replies with a juror who aims at a verdict "neither overly credulous nor unduly skeptical": aiming at the mean is giving each consideration its proper weight.

Ethics supplies no decision procedure. **Practical wisdom** is what "the virtuous morally mature adult has that nice children, including nice adolescents, lack": good intentions joined to knowledge of how to secure real benefits, which "characteristically comes only with experience of life". Without it a kind or brave temperament can do harm; Aristotle calls such traits "natural virtue", in the SEP's gloss "a proto version of full virtue awaiting perfection by phronesis". Because full virtue needs practical wisdom, the virtues hang together, a thesis known as the **unity of the virtues**.

## The Stoics: Virtue Is Enough

The Stoics, whose ethics *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* covers in full, went further. Virtue, which Seneca treats as perfected reason, is a form of knowledge and all-or-nothing: whoever has one virtue has them all. What is good necessarily benefits, as heat necessarily warms; wealth and health no more benefit than harm, so they are not goods but "indifferent", though "preferred". Hence the virtuous person on the rack is fully happy, a conclusion Aristotle had thought absurd. This is the first great divide inside virtue ethics: for Aristotle virtue is necessary for flourishing; for Plato and the Stoics it is necessary and sufficient.

## Confucian Cultivation

The *Analects* treats five excellences as central: benevolence (*ren* 仁), righteousness (*yi* 義), ritual propriety (*li* 禮), wisdom (*zhi* 智) and trustworthiness (*xin* 信). Only by the Han period were they treated as a complete set; before that, Mark Csikszentmihalyi notes, "it is unclear whether the possession of a particular virtue entailed having all the others". *Ren*, "caring for others" (12.22), is both one virtue and the name for complete excellence; before Confucius it meant an aristocrat's strong, handsome bearing, but in the *Analects* it is open to anyone, though Confucius never claimed it for himself. Jiyuan Yu argued, as Wong summarises him, that the Way (*dao*) plays a role in Chinese ethics analogous to that of eudaimonia.

Mencius rooted the virtues in the family: "The core of benevolence is serving one's parents. The core of righteousness is obeying one's elder brother. The core of wisdom is knowing these two and not abandoning them" (4A27, in Bryan Van Norden's translation). Mencian wisdom is "somewhat like Aristotelian phronēsis", only partly bound by rules. Ritual forbids a man to touch his sister-in-law, but he should rescue her if she is drowning (4A17); sages acted differently, but "had [they] exchanged places, each would have done as the other" (4B31).

How is virtue acquired? Three pictures stand side by side. For Aristotle, habituation completed by practical wisdom. The *Analects* (1.15) likens self-cultivation to cutting bone, carving horn and polishing jade, and gives ritual practice a central place; as David Wong observes, "there is no comparable emphasis in Aristotle on the role of ritual performance". For Mencius, cultivation is growth: his child about to fall into a well (2A6), reconstructed step by step in *Confucius, Mencius and Xunzi*, argues that everyone feels alarm and compassion at the sight, and not from self-interest, so all have the "sprouts" of the virtues, which must be extended. For Xunzi it is reshaping: "Human xing is evil; what is good is artifice" (23.1a, in Paul R. Goldin's translation), and nature needs ritual and teachers as "crooked wood must await steaming and straightening on the shaping frame" (in Ivanhoe and Van Norden's translation).

{{image: Mencius | Mencius (Meng Ke), from the album *Half Portraits of the Great Sage and Virtuous Men of Old*. Whether his ethics of moral "sprouts" counts as a virtue ethics is debated.}}

## Is Confucian Ethics a Virtue Ethics?

In Wong's words: "For some scholars this will be an obvious, uncontroversial truth. For others, it is a misconstrual that imposes contentious Western assumptions."

Virtue-ethical readings of Mencius began with Lee H. Yearley's *Mencius and Aquinas* (1990). Van Norden (2007) read Confucius and Mencius as virtue ethicists against the Mohists; Yu (2007) treated *eudaimonia* and *dao* as parallel starting points from which both traditions turn to virtue (*aretē*, *de*); May Sim (2007) compared Aristotle and Confucius at length. The similarities are real: flexible practical wisdom, cultivation rather than rules, and a line between genuine virtues and their counterfeits.

The leading dissent is **role ethics**, developed by Roger T. Ames and Henry Rosemont Jr. (*Confucian Role Ethics: A Vocabulary*, Ames, 2011; *Confucian Role Ethics: A Moral Vision for the 21st Century?*, 2016). In "Were the Early Confucians Virtuous?" (2011) they argue that early Confucianism is a distinctive ethics grounded in family relations: "Confucian normativity is defined by living one's family roles to maximum effect." Prescribed roles, such as being a son or a parent, are themselves the guides to conduct. Robert Neville and A. T. Nuyen share the scepticism about the "virtue" label.

Defenders reply that no virtue-ethical reader holds "the misguided belief that Aristotle and Confucius were the same" (Van Norden). To the charge of projecting an alien vocabulary onto the texts, Van Norden answers that every interpreter brings some vocabulary to a text; the real question is which reading best explains them. Sim argues that a looser definition, centred on dispositions, character and motivation, fits the *Analects*.

Wong's SEP verdict sorts out the senses of "virtue ethics". In a broad sense, virtues as traits worth aspiring to that make up an ideal of the person, the label is uncontroversial. In a narrow sense, a theory giving traits "explanatory priority over right action and promoting good consequences", a distinction Wong takes from Justin Tiwald (2018), Wong doubts that it fits: "There simply is not enough discussion in the Confucian texts … addressed to the kind of questions these Western theories seek to answer." And it is plainly wrong if virtues are taken as atomistic, possessed in isolation from others, or context-invariant. His own view: use virtue language "with the appropriate qualifiers", accepting the critics' insight that Confucian virtues are realised in relationships, and that being someone's son or mother can be part of who one is. The differences remain striking. Van Norden notes that Confucians treat family life as an intrinsic part of living well, while Aristotelians (arguably) see the family as at best a means, and that Aristotle prized theoretical contemplation, which Confucians typically saw as lacking value in itself.

```checkpoint
q: On what question did Aristotle and the Stoics most clearly disagree?
a*: Whether virtue is sufficient for flourishing, or also needs external goods such as friends and wealth.
a: Whether virtue is a trait of character at all.
x: Both treated virtue as an excellent state of the person; the Stoics called it a form of knowledge.
a: Whether the virtues are connected to one another.
x: Both linked the virtues; the Stoics held an even stronger unity thesis than Aristotle.
a: Whether flourishing is the highest human good.
x: Both took eudaimonia as the goal; the dispute was over what it requires.
hint: Think of the virtuous person on the rack.
why: For Aristotle virtue is necessary but not sufficient, since flourishing also needs external goods; for Plato and the Stoics it is necessary and sufficient, so the virtuous person on the rack is fully happy.
---
q: What is the central claim of Ames and Rosemont's "role ethics"?
a: That Confucian ethics is a rule-based deontology like Kant's.
x: Role ethics locates norms in particular family and social roles, not in universal rules derived from reason.
a: That Confucius and Aristotle held the same theory of virtue.
x: That is the view Van Norden says no virtue-ethical reader actually holds; Ames and Rosemont stress the differences.
a*: That Confucian norms come from living one's family roles well, not from individual traits applied by calculation.
a: That Confucian ethics judges acts only by their consequences.
x: Neither side reads Confucianism as consequentialist; Van Norden contrasts it with the Mohists.
hint: "Living one's family roles to maximum effect."
why: Ames and Rosemont hold that prescribed roles are the normative core and that "virtue ethics" imports a false Western view of the self. Wong replies that virtue language can be used with qualifiers that respect this relational insight.
```

## The Revival: Anscombe's Challenge

Virtue ethics dominated Western moral philosophy "until at least the Enlightenment" and was eclipsed in the nineteenth century. Its revival in the late 1950s was "heralded by" "Modern Moral Philosophy" (1958), by G. E. M. (Elizabeth) Anscombe (1919–2001). It opens with three theses.

```quote
The first is that it is not profitable for us at present to do moral philosophy; that should be laid aside at any rate until we have an adequate philosophy of psychology, in which we are conspicuously lacking.
G. E. M. Anscombe · "Modern Moral Philosophy" · 1958
```

The second is that the concepts of moral obligation and duty, and the moral sense of "ought", should be dropped "if this is psychologically possible", being survivals from an earlier conception of ethics, "only harmful without it". The third is that English moral philosophers since Sidgwick differ little: all allow that killing the innocent might be right if the consequences of refraining were catastrophic. She coined the word "consequentialism", in a sense different from today's.

Her reasoning: the moral "ought" has its point only within a **law conception of ethics**, with a legislator, such as God, who commands. Modern secular philosophy has dropped the legislator, and a concept used outside the framework that gives it sense becomes empty, like asking what is "criminal" in a society with no criminal law or courts. Such talk is not false but senseless. Better to describe actions with **thick concepts**, such as truthful, just or cowardly: "And here we see the superiority of the term 'unjust' over the terms 'morally right' and 'morally wrong'." One can debate whether punishing a man for what he is known not to have done might be "morally right", "but it cannot be argued that the procedure would in any circumstances be just." Using such concepts properly, though, needs an account of action, intention, wanting and flourishing that philosophy lacked.

Thomas Pink objects that obligation need not presuppose a divine lawgiver; Roger Crisp (2004) argues that her own strategy leads somewhere nearer the consequentialism she attacked. The best reply on her behalf is that the turn to thick concepts survives even if her history is doubted, and that Foot and Hursthouse later found a non-theistic source of moral standards in human nature.

One surprise: Anscombe herself, as the SEP entry by Eric Wiland and Julia Driver stresses, "did not advocate" building virtue ethics as a full alternative theory; her first thesis told philosophers to wait. Yet Onora O'Neill observes that "many exponents of virtue ethics take Anscombe's essay as a founding text", and its influence ran above all through Alasdair MacIntyre.

## MacIntyre: Practices, Narratives and Traditions

Alasdair MacIntyre, born in Glasgow in 1929, died on 21 May 2025, aged 96. *After Virtue* (1981; third edition 2007) opens with an allegory of the natural sciences destroyed and reassembled from fragments, and proposes that "the language of morality is in the same state of grave disorder". We live in a "culture of emotivism", using moral words to manipulate; the Enlightenment's project of justifying morality failed because it discarded teleology, the idea that human life has a purpose. The book ends with the choice "Nietzsche or Aristotle", and with the remark that we are waiting for "another—doubtless very different—St. Benedict."

MacIntyre rebuilt virtue in three stages. First comes the **practice**, "a complex social activity" such as chess, medicine, architecture or football, with **goods internal** to it, unlike external goods such as wealth, fame and power. A child paid in sweets to play chess has every reason to cheat; once he values the goods of chess itself, cheating defeats his own purpose.

```quote
A virtue is an acquired human quality the possession and exercise of which tends to enable us to achieve those goods which are internal to practices and the lack of which effectively prevents us from achieving any such goods.
Alasdair MacIntyre · After Virtue, p. 191 (2nd ed.) · 1984
```

Second, virtues sustain the **narrative unity** of a life, a lifelong quest for the good. Third, they sustain the **traditions** that give practices and lives their context: "I am born with a past." MacIntyre dismissed Aristotle's "metaphysical biology", became a Thomist (see *Thomas Aquinas*), and denied belonging to any school called virtue ethics. The SEP cites his point that different cultures embody different virtues when it states the relativity objection, which Nussbaum (1993) answers by arguing that the virtues are shared and only local understandings of them vary.

## Foot, Hursthouse and Natural Goodness

Philippa Foot (1920–2010), also known for introducing the trolley problem in 1967, did not dismiss biology. In *Natural Goodness* (2001), building on her student Michael Thompson, she argued that to recognise something as a living thing is already to judge it against its life form: a blue tit lacking its blue patch is not defective, since the lack does not hinder its life. Humans are judged the same way, with a "sea change" brought by reason: "[W]hile [non-human] animals go for the good (thing) that they see, human beings go for what they see as good." Vices are defects of the will. (Whether such goodness is a moral fact is a question for *Metaethics: Are There Moral Facts?*)

Rosalind Hursthouse (born 1943), a student of Anscombe and Foot, gave the revival its systematic statement in *On Virtue Ethics* (1999). Her criterion of right action says, roughly, that an act is right if and only if it is what a virtuous person would characteristically do in the circumstances. Critics object that "do what a virtuous person would do" leaves a student choosing between music and engineering asking what Socrates would study. The reply is that **v-rules**, framed in virtue and vice terms, give guidance ("Do what is honest/charitable; do not do what is dishonest/uncharitable"), and our list of vice terms is, the SEP notes, "remarkably, and usefully, long". Like Foot, she holds that virtues benefit their possessor and make her a good specimen of a rational, social kind, "like elephants and wolves and unlike polar bears". As the IEP puts it, "Virtue ethics cannot give us an easy, instant answer. This is because these answers do not exist."

Not all virtue ethicists are neo-Aristotelians: Linda Zagzebski starts from admirable exemplars, and a Platonistic strand descends from Iris Murdoch, for whom "In the moral life the enemy is the fat relentless ego".

## The Situationist Challenge

The strongest modern challenge comes from psychology. Gilbert Harman wrote in 1999 that "it may even be the case that there is no such thing as character"; John M. Doris, in *Lack of Character* (2002), that "people typically lack character". Doris targets **global traits**: consistent across situations that call for them and stable over time. Christian Miller's SEP entry reconstructs the argument.

1. If most people had the traditional virtues and vices as global traits, suitable experiments would show most people behaving consistently well (or badly) across situations relevant to each trait.
2. The experiments do not show this: trivial features of situations, such as finding a coin, being in a hurry or an authority's insistence, change behaviour drastically.
3. So most people do not have the traditional virtues or vices, such as compassion.
4. Aristotelian virtue ethics "presupposes that there are character traits of the relevant sort" (Harman).
5. So Aristotelian virtue ethics is in trouble, or, for Doris, practically irrelevant for most people.

The evidence needs care. In Isen and Levin's study (1972), people who had just found a dime in a phone booth helped a stranger pick up dropped papers 88 per cent of the time, against 4 per cent of others. The SEP notes "replication problems" (a later study by Weyant and Clark, using a lost-letter measure, found no effect), though many other studies found a similar link between good mood and helping. In Darley and Batson's study (1973), seminary students on their way to give a talk, some on the Good Samaritan, passed a man slumped in apparent need: about 63 per cent of those in no hurry helped, against 10 per cent of those in a great hurry. In one of Milgram's obedience experiments, 65 per cent went to the maximum 450 volts; Gina Perry (2012) argued that his published accounts did not match what happened, though defenders point to many replications. The SEP reports serious concerns about Zimbardo's Stanford Prison Experiment, with calls to remove it from psychology textbooks. And evidence runs the other way: Philpot and colleagues (2019), studying 219 CCTV recordings of public aggression in three countries, found that at least one bystander intervened in 90.9 per cent of them.

**The objection** to steps 1–3 is that the experiments may not test virtue at all (Miller, Sreenivasan, Annas). Milgram's subjects may have had compassion outweighed by obedience or trust; Sabini and Silver (2005) explain many results by fear of embarrassment. And since virtues are multi-track dispositions, crediting people with charity on the strength of conventional decency would itself be "a fundamental attribution error", the very error situationists diagnose.

**The reply most often given** targets step 4. Virtue ethics never claimed that most people are virtuous: Aristotle thought most people avoid wrongdoing from fear of penalties, not from shame. Kamtekar (2004) adds that situationists attack traits with "very little to do with character as it is conceived of in traditional virtue ethics", which includes practical wisdom. The situationist presses on: if virtue is that rare, can it guide ordinary people? Miller concludes that most of us have "mixed traits", neither virtues nor vices.

Wong argues that Confucians were ready for this. They never doubted that situations shape people; they prescribed "a long and arduous program of ethical training" through the classics and ritual; and Mencius held that people cannot cultivate virtue without material security (1A7), so widespread lack of virtue is partly a political failure. The SEP entry on virtue ethics judges that the challenge "has left traditional virtue ethicists unmoved" but produced "healthy engagement" with psychology; the SEP entry on moral character adds that by the 1980s many psychologists had parted ways with situationism.

```checkpoint
q: Why did Anscombe compare talk of the moral "ought" to talk of what is "criminal"?
a: To show that moral rules should be enforced by the courts.
x: Her point was about meaning, not enforcement.
a*: Because both make sense only within a framework of law, and modern secular ethics has dropped the divine lawgiver.
a: To argue that obligation is the most basic moral concept.
x: She argued the opposite: obligation should be dropped if psychologically possible.
a: To defend the consequentialism of Sidgwick and his successors.
x: She coined "consequentialism" to criticise their shared view, not to defend it.
hint: Imagine a society with no criminal law or courts.
why: Without a legislator, "morally ought" is like "criminal" without criminal law. She proposed thick concepts such as "unjust" instead, while holding that ethics should wait for a philosophy of psychology. She did not herself advocate building a virtue ethics.
---
q: What is the "rarity" reply to the situationist argument?
a: That the famous experiments have all failed to replicate.
x: Some caveats are real, but the rarity reply grants the findings and targets a different premise.
a: That people's behaviour is entirely determined by their situation.
x: That is closer to the situationist's own conclusion.
a: That character traits can be measured only by questionnaires.
x: The reply concerns what virtue ethics claims, not how traits are measured.
a*: That virtue ethics never claimed most people are virtuous, so the findings fit the view that full virtue is rare.
hint: What did Aristotle think about "the many"?
why: The reply accepts that most people lack global virtues and denies that virtue ethics presupposes they have them. Aristotle held that most people avoid wrongdoing from fear of penalties, not from shame.
```

## The Ethics of Care

The IEP counts the **ethics of care** as a third branch of the revival. It puts relationships of dependency and care at the centre of moral life (*Feminist Philosophy* takes up its politics). It is "most often attributed to" the psychologist Carol Gilligan (born 1936) and the philosopher Nel Noddings, though Virginia Held credited Sara Ruddick's "Maternal Thinking" (1980) with the first statement.

Gilligan's *In a Different Voice* (1982) argued that the six-stage theory of her mentor Lawrence Kohlberg, in which moral reasoning develops towards universal principles and in which girls scored lower than boys, wrongly ranked a "morality of rights" above, rather than beside, a "morality of responsibility". Faced with Kohlberg's "Heinz dilemma", which sets a wife's life against a druggist's property, one subject, Jake, treats it as "a math problem with people"; another, Amy, looks for ways to talk to the druggist. Gilligan characterised the difference as one of theme rather than of gender, and, the SEP notes, women in her studies were "as likely to express the perspective of justice" as that of care. Her samples were narrow, and reviews by Jaffee and Hyde (2000) and Walker (2006) found that her theory was not supported by empirical studies.

Noddings (1929–2022), in *Caring* (1984), rooted ethics in the relation between the "one-caring" and the "cared-for" and rejected universal principles. Held (1929–2026), in *The Ethics of Care* (2006), made care, in the IEP's phrase, the most basic moral value: a practice and value rather than an individual disposition. Eva Feder Kittay, the mother of a multiply disabled daughter, proposed in *Love's Labor* (1999) a principle of justice: "To each according to his or her need, from each to his or her capacity for care, and such support from social institutions as to make available resources and opportunities to those providing care."

Is care a virtue? Michael Slote, who treats care as empathy, and others fold care ethics into virtue ethics, which can supply a standard and the idea of flourishing. Held, Kittay and Maureen Sander-Staudt resist: calling care a virtue risks, in Held's words, "losing sight of it as work", and dilutes care ethics' attention to power and dependency.

The comparison with Confucianism is lively. Chenyang Li (1994) found deep similarities between *ren* and care ethics: relationships are basic, parent and child come first, and responses are graded rather than derived from principles. Li-Hsiang Lisa Rosenlee defends filial care and asks why women should stop caring rather than insist that men share it. Ranjoo Seodu Herr locates a clash between Confucian ritual and care ethics' resistance to subjugation, and Daniel Star argues that Confucian ethics is a virtue ethics with a different moral focus from care ethics: the role-ethics debate in a new form. The question the Greeks and Mencius asked, how good character is formed, remains open.

## Further exploration

- **Julia Annas, *Intelligent Virtue* (2011).** What the SEP calls a short, clear and authoritative account of virtue, practical wisdom and flourishing.
- **Rosalind Hursthouse, *On Virtue Ethics* (1999).** The classic neo-Aristotelian statement, including the criterion of right action and v-rules.
- **Alasdair MacIntyre, *After Virtue: A Study in Moral Theory* (1981; 3rd ed. 2007).** The diagnosis of modern morality and the account of practices, narratives and traditions.
- **Bryan W. Van Norden, *Virtue Ethics and Consequentialism in Early Chinese Philosophy* (2007).** Reads Confucius and Mencius as virtue ethicists, set against the Mohists.
- **Jiyuan Yu, *The Ethics of Confucius and Aristotle: Mirrors of Virtue* (2007).** A side-by-side study taking *dao* and *eudaimonia* as parallel starting points.
- **Roger T. Ames, *Confucian Role Ethics: A Vocabulary* (2011).** The main case against reading Confucianism as a virtue ethics.
- **Virginia Held, *The Ethics of Care: Personal, Political, and Global* (2006).** The standard philosophical statement of care ethics.$virtue_master$,
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
  select $virtue_quiz$[
    {"type": "mcq", "prompt": "In Philippa Foot's Natural Goodness, how are human beings evaluated?", "options": ["By how much pleasure their actions produce for the greatest number", "By whether they obey commands issued by a divine legislator", "Against their life form, as other living things are, but with reason bringing a 'sea change': humans go for what they see as good", "By whether their culture's traditions approve of their conduct"], "answerIndex": 2, "explanation": "Building on Michael Thompson, Foot argued that recognising something as an organism already judges it against its life form (a blue tit lacking its blue patch is not defective). Humans are judged in the same way, but rationality changes things: animals go for the good they see, while humans go for what they see as good. Vices are defects of the will.", "id": "q1"},
    {"type": "mcq", "prompt": "What does MacIntyre's example of the child paid in sweets to play chess illustrate?", "options": ["The difference between goods internal to a practice and external goods: once the child values the goods of chess itself, cheating defeats his own purpose", "That moral education must always use rewards and punishments", "That games are a waste of time compared with contemplation", "That emotivism is a correct theory of the meaning of moral words"], "answerIndex": 0, "explanation": "While the child plays only for the sweets, an external good, he has every reason to cheat. Once he values the excellences internal to chess, cheating would deprive him of what he wants. MacIntyre defines a virtue as a quality that enables us to achieve the goods internal to practices.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about Carol Gilligan's In a Different Voice is supported by the chapter?", "options": ["Gilligan showed that women always reason in terms of care and men in terms of justice", "Later reviews confirmed large gender differences in moral reasoning", "Gilligan argued that Kohlberg's stages should be ranked with care at the top", "Gilligan described the difference between the 'care' and 'justice' voices as one of theme rather than gender, and reviews by Jaffee and Hyde and by Walker found her theory unsupported by empirical studies"], "answerIndex": 3, "explanation": "Gilligan characterised the difference as one of theme, not gender, and in her studies women were, the SEP notes, as likely to express the perspective of justice as that of care. Her samples were narrow, and reviews by Jaffee and Hyde (2000) and Walker (2006) found her theory was not supported empirically. She criticised Kohlberg for ranking the morality of rights above, rather than beside, the morality of responsibility.", "id": "q3"},
    {"type": "mcq", "prompt": "How do Mencius and Xunzi picture moral cultivation?", "options": ["Both think virtue comes only from obeying the law", "Mencius likens it to tending sprouts that are innate in human nature; Xunzi likens it to steaming and straightening crooked wood, transforming a nature that is bad", "Mencius thinks human nature is bad and Xunzi thinks it is good", "Both deny that ritual has any role in becoming good"], "answerIndex": 1, "explanation": "For Mencius the four 'sprouts' of the virtues are innate and must be extended and filled out. For Xunzi 'Human xing is evil; what is good is artifice': ritual and teachers reshape nature as a frame straightens wood. Aristotle's habituation completed by practical wisdom is a third model; the Analects stresses ritual, with no comparable emphasis in Aristotle.", "id": "q4"},
    {"type": "open", "prompt": "Set out the situationist argument against virtue ethics step by step. Describe the evidence it uses, including the caveats, and explain the strongest replies.", "rubric": "A strong answer explains global traits (consistent across trait-relevant situations and stable over time; Doris) and gives the steps: if most people had the traditional virtues as global traits, experiments would show consistent behaviour; they show trivial situational factors swinging behaviour; so most people lack the traditional virtues; Aristotelian virtue ethics presupposes such traits (Harman); so it is in trouble or practically irrelevant (Doris). It describes studies such as the dime and helping (88 per cent against 4 per cent, with replication problems noted by the SEP, though other mood studies found a similar pattern), Darley and Batson's hurrying seminarians (about 63 against 10 per cent), and Milgram's obedience experiments (with Perry's criticisms and the replications), and notes that the Stanford Prison Experiment should not be relied on and that naturalistic CCTV evidence (Philpot et al. 2019) shows frequent bystander intervention. It gives replies to the first stage (the experiments do not test virtue; competing virtues; fear of embarrassment, Sabini and Silver; virtues as multi-track dispositions, so judging people virtuous from mere decency is itself an attribution error) and the second (rarity: virtue ethics never claimed most people are virtuous, as Aristotle thought most obey fear rather than shame; Kamtekar on character including practical wisdom). Credit for Miller's 'mixed traits' and Wong's Confucian reply (long training, ritual, material security per Mencius 1A7).", "id": "q5"},
    {"type": "open", "prompt": "Is Confucian ethics a virtue ethics? Explain the role-ethics case made by Ames and Rosemont, the replies of virtue-ethical interpreters, and David Wong's assessment.", "rubric": "A strong answer explains the Confucian virtues (ren, yi, li, zhi, xin), Mencian wisdom's resemblance to phronesis, and the virtue-ethical readings of Yearley, Van Norden, Yu and Sim, with the similarities (flexible wisdom, cultivation over rules, genuine versus counterfeit virtue). It presents role ethics: Confucian normativity is 'living one's family roles to maximum effect'; prescribed roles are normative guides; It gives the replies: Van Norden says no one thinks Aristotle and Confucius were the same, and every interpreter brings some vocabulary to a text, so the question is which reading explains the texts best; Sim argues a looser definition fits. It explains Wong's distinction: uncontroversial in the broad sense, doubtful in the narrow sense of a rival to deontology and consequentialism (Tiwald), wrong if virtues are taken as atomistic or context-invariant; usable with qualifiers that respect the relational insight. Credit for the differences (ritual, the centrality of family life, Aristotle's valuing of contemplation) and for linking the debate to the Confucian-care comparison (Li; Herr; Star).", "id": "q6"}
  ]$virtue_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/virtue-ethics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
