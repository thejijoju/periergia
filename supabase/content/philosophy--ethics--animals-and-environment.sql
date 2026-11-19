-- Animals and the Environment — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/animals-and-environment @ research/advanced/read.
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
    'philosophy/ethics/animals-and-environment',
    'research',
    'advanced',
    'read',
    $animals_master$> **What do we owe to animals, to nature, and to people not yet born?** This chapter starts with Bentham and Peter Singer's attack on speciesism, sets out the argument from marginal cases step by step with its critics and defenders, and compares rival accounts of animals' status. It traces Indian ethics of non-harm, follows environmental ethics from Leopold's land ethic to deep ecology, ecofeminism and the rights of nature, and ends with climate justice between generations.

## Who Counts?

To say that a being deserves moral consideration, write Lori Gruen and Susana Monsó in the Stanford Encyclopedia of Philosophy (SEP), "is to say that there is a moral claim that this being can make on those who can recognize such claims. A morally considerable being is a being who can be wronged." Gruen separates whether a being is **morally considerable** at all from how much its interests weigh: being considerable "is like showing up on a moral radar screen—how strong the signal is or where it is located on the screen are separate questions."

The Internet Encyclopedia of Philosophy (IEP) sorts the answers into three families. **Indirect** theories (Kant's, and today Peter Carruthers's) hold that animals matter only through their effects on humans. **Direct but unequal** theories, which "most people" accept, give animals moral status because they can feel, but give human interests more weight. **Moral equality** theories, Singer's and Regan's, refuse that extra weight. Kant's indirect view is the classic: in his *Lectures on Ethics* (1784–5, Cambridge translation), a man who shoots his dog because it can no longer serve him "does not fail in his duty to the dog, for the dog cannot judge", but damages his own humanity, since "he who is cruel to animals becomes hard also in his dealings with men." Critics reply that this misses "the independent wrong that is being done" to the dog itself.

The simplest argument for direct status runs: if a being is **sentient** (able to feel pleasure or pain), it has direct moral status; most animals are sentient; so most animals have direct status. Its classic statement is a footnote in Jeremy Bentham's *Introduction to the Principles of Morals and Legislation* (1789). Bentham argued that a grown horse or dog is more rational than a human infant "of a day or a week or even a month, old". Reason and speech are the wrong tests:

```quote
the question is not, Can they reason? nor, Can they talk? but, Can they suffer?
Jeremy Bentham · An Introduction to the Principles of Morals and Legislation, ch. XVII, footnote · 1789
```

Bentham still accepted killing animals for food without unnecessary suffering (his life is told in *Bentham, Mill and Utilitarianism*). The New York Declaration on Animal Consciousness (2024), finding a "realistic possibility" of experience in all vertebrates and many invertebrates, draws a precautionary practical conclusion; its science is discussed in *Consciousness*.

## Singer and Speciesism

The word **speciesism** was coined in 1970 by the British psychologist Richard D. Ryder, in a privately printed leaflet against animal experimentation: "Why then do we make an almost total distinction morally?" Peter Singer, crediting Ryder, made the term famous in *Animal Liberation* (1975), widely regarded within the movement as its founding philosophical statement. He defined speciesism as "a prejudice or attitude of bias in favour of the interests of members of one's own species and against those of members of other species", and drew the parallel with racism: "The pattern is identical in each case."

Singer's principle is the **equal consideration of interests**: "we give equal weight in our moral deliberations to the like interests of all those affected by our actions". It is the impartial principle behind his drowning-child argument in *Consequentialism: What Makes Right Acts Right?*. Singer is **not a rights theorist**: he rejected the framework of rights, and his utilitarian view is, in the SEP's words, "popularly, though erroneously, referred to as an animal rights position".

His conclusions follow from the principle. Factory farming must end and cosmetic testing is condemned. Medical experiments are challenged: if their benefits justified using animals, consistency would permit using orphaned infants with severe cognitive disabilities. Yet Singer "does not unequivocally claim that we must not eat animals": whether painless killing wrongs an animal depends on whether it is self-conscious and so has an interest in going on living.

## The Argument from Marginal Cases

Singer's sharpest weapon is old: Daniel Dombrowski traces it to Porphyry's third-century *On Abstinence from Eating Animals*, and Bentham's horse and infant is a version. The SEP calls its usual name, the **argument from marginal cases**, "unfortunately" chosen; some prefer **argument from species overlap**. The IEP reconstructs Singer's version:

1. To hold that all and only humans have full and equal moral status, there must be some property that all and only humans have and that grounds this status.
2. Any property that *only* humans have (rationality, autonomy, moral agency, complex language) is one that some humans lack: infants, people with severe cognitive disabilities, the comatose.
3. Any property that *all* humans have (such as sentience) is one that many animals have too.
4. So no property grounds the claim: either not all humans are equal, or not only humans are.
5. The first option is too counter-intuitive. So we must extend equal consideration to animals.

As Singer argues, all humans, but not only humans, can feel pain, while only humans can solve complex mathematical problems, yet not all humans can do so. The one property that escapes is *being human* itself, but then one must say species membership matters in itself, which, the IEP observes, few are now willing to say.

**Objections.** R. G. Frey and others attacked step 5: few humans are truly marginal, they argued (infants, for instance, are potentially rational), and denying full status to the rest is not so counter-intuitive, though the IEP notes that few accept this. Carl Cohen, defending animal research in 1986, argued (as summaries report him) that rights belong to beings of a *kind* capable of moral judgment, so humans who lack the capacities keep their rights and animals have none: "Speciesism is not merely plausible, it is essential for right conduct". Tibor Machan's analogy makes the same point: a broken chair is still a chair. Bernard Williams, in "The Human Prejudice" (2006), denied that speciesism is like racism, since "[h]uman beings do not have to deal with any other creature that, in terms of argument, principle, worldview, or whatever, can answer back". Cora Diamond's "Eating Meat and Eating People" (1978) argued that we do not first find a capacity and then infer that humans must be treated well; that requirement is part of the concept "human being". Eva Feder Kittay, whose *Learning from My Daughter* (2019) is about her own daughter, has with Licia Carlson criticised such comparisons, which the SEP summarises as finding them unnecessary and offensive; she doubts that any human is radically cognitively disabled in the sense philosophers assume.

**Replies.** The objectors all grant that the most cognitively limited humans are owed direct concern, so they must find a morally relevant property that is not a mere species label. James Rachels answered the species-norm view: by its logic, a chimpanzee who learned to read and write should still be refused a university place, since reading is not normal for chimpanzees. Jeff McMahan drew out what the view implies: "intelligent and morally sensitive Martians" would have to treat severely impaired humans as they treat us. He agreed with other critics that it requires "moral alchemy", since it makes how one individual is treated depend on facts about *other* individuals. To Kittay he replied that such humans very likely exist.

## Rights, Respect and Capabilities

Tom Regan's *The Case for Animal Rights* (1983) attacked Singer from the other side: what matters is the individual who has interests, not interests as items to be summed, and aggregation could license experiments on humans. **Subjects-of-a-life**, beings with "beliefs and desires; perception, memory, and a sense of the future, including their own future; an emotional life together with feelings of pleasure and pain", and a welfare that matters "logically independently of their utility for others", have **inherent value** and rights that may not be overridden merely to make everyone better off. Regan thought "mentally normal mammals of a year or more" qualify. His conclusion is abolition, not reform: farming animals however well, experimentation, rodeos and hunting all use them merely as means.

For conflicts Regan offered the **worse-off principle**: where harms are not comparable, avoid making the worse-off worse off. His **lifeboat case** tests it. Four normal adult humans and a dog are in a lifeboat that can hold only four; according to secondary summaries, Regan concludes that the dog should go overboard, since death is a greater harm to any of the humans than to the dog. Critics say this sits uneasily with equal inherent value.

Christine Korsgaard argues that Kant's ethics, read correctly, supports duties to animals. In *Fellow Creatures* (2018) she draws on Kant's argument for the value of humanity: rationality commits us to treating every sentient creature as an end in itself, because value is "tethered" to creatures for whom things can go well or badly. Martha Nussbaum extends her **capabilities approach** (justice as securing what each being needs to flourish) to animals in *Frontiers of Justice* (2006) and *Justice for Animals* (2023), criticising utilitarianism for summing welfare instead of guaranteeing entitlements.

Contract theories leave animals out. Carruthers, in *The Animals Issue* (1992), extended Rawls's social contract to all of morality: self-interested contractors know they are not animals, so they protect rational agents only. Torturing a cat for fun is still wrong, he held, because it is cruel, betraying an indifference to suffering that may show in dealings with other rational agents. Regan replied that young children cannot sign contracts yet have rights. Relational views differ: Sue Donaldson and Will Kymlicka's *Zoopolis* (2011) gives domesticated animals citizenship, wild animals sovereignty and "liminal" animals such as squirrels denizenship.

```checkpoint
q: Why is it a mistake to call Peter Singer's *Animal Liberation* an "animal rights" book?
a*: Because Singer is a utilitarian who rejected the framework of rights; his principle is the equal consideration of interests.
a: Because Singer thinks only humans have interests.
x: Singer's principle gives equal weight to the like interests of humans and animals alike.
a: Because Singer coined the word "speciesism", and rights are a separate topic.
x: Richard Ryder coined "speciesism" in 1970; Singer credited him with it.
a: Because Singer holds that killing any animal is always wrong.
x: Singer does not unequivocally claim we must not eat animals; whether painless killing wrongs an animal depends on whether it is self-conscious.
hint: Contrast Singer with Tom Regan.
why: Singer's case rests on giving equal weight to like interests, not on rights. Gruen notes that the utilitarian position is "popularly, though erroneously", called an animal rights position; Regan's *The Case for Animal Rights* is the rights view.
---
q: How does Tom Regan's worse-off principle settle his lifeboat case?
a: The humans should draw lots, since all subjects-of-a-life have equal inherent value.
x: Regan does not use a lottery; he weighs how great a harm death would be to each.
a: One human should go, since the dog is the worse-off party.
x: The principle forbids making the worse-off worse off; Regan judges death a greater harm to a human than to the dog.
a*: The dog goes overboard, because death would be a greater harm to any of the humans than to the dog.
a: The question cannot arise, because Regan's rights are absolute.
x: Regan's rights are not absolute; he gives principles for conflicts like this one.
hint: Ask who would lose more by dying.
why: Where harms are not comparable, Regan says to avoid making the worse-off worse off. Critics argue the verdict sits uneasily with his claim that all subjects-of-a-life have equal inherent value.
```

## Non-Harm in Indian Traditions

Indian traditions made non-harm to animals central to ethics long before Bentham. **Ahiṃsā** (non-violence, non-harm) was already vowed by the community of the Jain teacher Pārśvanātha, traditionally dated to the ninth or eighth century BCE (historians suggest the eighth or seventh). Jain metaphysics and vows are told in *Jains, Ājīvikas and Materialists: India's Other Dissenters*; here two features matter. Jains class living beings by their number of senses, down to one-sensed plants, and their diet forbids even honey, since collecting it harms bees. And Jainism distinguishes the physical act of violence from the intention behind it.

The SEP credits the Buddha, "along with" Mahāvīra, with spreading nonviolence so that "animal sacrifice declined rapidly in frequency and prestige". The first lay precept is to abstain from killing living beings, animal or human. The Dhammapada grounds it in an analogy with oneself: "Everybody fears being struck by a rod. Everybody fears death. Therefore, knowing this, feeling for others as for yourself, Do not kill others or cause others to kill" (trans. Maitreya). Buddhism does not regard humans as fundamentally different from other animals; through rebirth, an animal you meet "may even have been your own mother in a previous life". Yet a human life is more precious, since only in a human body can one attain awakening (see *The Buddha and Early Buddhist Philosophy*).

Whether Buddhists may eat meat is debated within the tradition. Theravāda monks must accept meat put in the alms bowl unless they have seen, heard or suspected that the animal was killed for them, and the Buddha refused Devadatta's proposal to make vegetarianism compulsory. Mahāyāna sūtras condemn it as incompatible with a bodhisattva's compassion, and Emperor Wu of Liang's early sixth-century ban made monastic vegetarianism standard in China.

The emperor Aśoka, called in his edicts "Beloved of the Gods", turned non-harm into policy. Rock Edict 1 (trans. Hultzsch) records that formerly "many hundred thousands of animals were killed daily for the sake of curry" in the royal kitchen; now only two peacocks and a deer, "but even these three animals shall not be killed (in future)". Pillar Edict 5, late in his reign, declares many species inviolable, including "all the quadrupeds which are neither useful nor edible", and forbids burning forests "either uselessly or in order to destroy (living beings)". It is a list of protected species and days, not a general ban on killing, and Pillar Edict 7 calls such restrictions "of little consequence" beside moral conversion.

## From Animals to the Land

Environmental ethics became a distinct field in the 1970s. Its central distinction is between **intrinsic** value (valuable in itself) and **instrumental** value (valuable for something else); views that give intrinsic value to humans alone are **anthropocentric**.

The founding text came earlier. The American forester Aldo Leopold died in 1948, and *A Sand County Almanac* appeared the next year. Its essay "The Land Ethic" enlarges "the boundaries of the community to include soils, waters, plants, and animals, or collectively: the land", changing "the role of *Homo sapiens* from conqueror of the land community to plain member and citizen of it."

```quote
A thing is right when it tends to preserve the integrity, stability, and beauty of the biotic community. It is wrong when it tends otherwise.
Aldo Leopold · "The Land Ethic", A Sand County Almanac · 1949
```

Here animal and environmental ethics part company. Animal ethics is **individualist**, protecting sentient beings one by one; Leopold's ethic is **holist**, valuing wholes such as ecosystems. J. Baird Callicott (1980) read the maxim as making the biotic community the sole bearer of intrinsic value, so that culling deer to protect it is required, and by consistency the same would apply to humans. Regan called this "environmental fascism". Callicott later gave individuals intrinsic value too, and some scholars read Leopold as a pluralist. Whether animal ethics belongs to environmental ethics at all remains disputed.

## The Last Man

At the 1973 World Congress of Philosophy, held in Bulgaria, the New Zealand-born philosopher Richard Routley (later Sylvan) asked "Is There a Need for a New, an Environmental, Ethic?". His thought experiment, as reconstructed from the SEP's summary:

1. The dominant Western ethic holds that only human interests matter morally, which Routley called "human chauvinism".
2. Imagine the last person alive after a world catastrophe, who acts to ensure that every other living thing is eliminated.
3. On that ethic this harms no human interest, since no humans will remain, so it is not wrong.
4. But we judge firmly that it *is* wrong.
5. The best explanation is that the living things destroyed have intrinsic value.
6. So a new, environmental ethic is needed.

Two lines of response have been published. **Virtue** approaches, such as Thomas Hill Jr.'s (1983), locate the wrong in the agent's character rather than in the value of what is destroyed; and Joel Feinberg's **interest principle**, that only beings with interests can have moral standing, raises the question of whether everything the last man destroys could be wronged.

Others built theories of nature's value. Paul W. Taylor's *Respect for Nature* (1986) held that every organism is a "teleological-center-of-life" with a good of its own and equal inherent worth, though critics found his priority rules too demanding. Holmes Rolston III held species intrinsically valuable, usually more than individual specimens.

## Deep Ecology and Its Critics

{{image: Arne Næss | Arne Næss, the Norwegian philosopher and mountaineer whose 1973 paper set "shallow" against "deep" ecology.}}

In 1973 Arne Næss distinguished **shallow ecology**, the fight against pollution and resource depletion aimed at "the health and affluence of people in the developed countries", from **deep ecology**, which endorses "biospheric egalitarianism". In 1984 he and George Sessions drafted an eight-point platform, meant to fit many outlooks from Indigenous to Buddhist. It holds that "The well-being and flourishing of human and non-human life on Earth have value in themselves", and that humans have no right to reduce the richness and diversity of life except "to satisfy vital needs".

Ramachandra Guha, writing from India in 1989, called wilderness-centred deep ecology distinctively American and, exported, a cultural imperialism that could dispossess the poor: "Putting deep ecology in its place is to recognize that the trends it derides as 'shallow' ecology might in fact be varieties of environmentalism that are more apposite, more representative and more popular in the countries of the South."

**Ecofeminism**, a term coined by Françoise d'Eaubonne in 1974, gave another diagnosis. The Australian philosopher Val Plumwood argued that rationalism builds a chain of dualisms (reason and emotion, human and nature, man and woman), each with a superior first term, so that the domination of women and of nature share a source; placing women closer to nature, on her view, simply places them closer to oppression. She called deep ecology's expanded self a disguised colonialism. Karen J. Warren held that dualisms become harmful only within a "logic of domination", which turns difference plus claimed superiority into subordination. In practice, women protected forests in India's Chipko movement (from 1973; the women of Reni acted in 1974), and Wangari Maathai founded Kenya's Green Belt Movement (1977).

## Environmental Justice and the Rights of Nature

**Environmental justice** asks who bears environmental harms. After protests against a PCB landfill in Warren County, North Carolina, in 1982, a 1987 report for the United Church of Christ found race the most important factor predicting where hazardous-waste facilities were sited; Robert D. Bullard widened the study of **environmental racism** to the American South.

Law has begun to grant nature rights. Ecuador's 2008 constitution was the first in the world to recognise legally enforceable rights of nature, framed with reference to **Pachamama**. In New Zealand, Te Urewera, in Tūhoe country, became a legal person in 2014, the first natural feature to do so; the Whanganui River followed in 2017, which the 2017 Act declares a legal person with "all the rights, powers, duties, and liabilities of a legal person". Supporters see such laws as aligned with Indigenous understandings of land; critics call that framing partly a myth and warn that one-sided implementation could harm Indigenous communities.

## Climate Justice: A Perfect Moral Storm

According to the Synthesis Report of the IPCC's Sixth Assessment (20 March 2023), "Human activities, principally through emissions of greenhouse gases, have unequivocally caused global warming", with global surface temperature 1.1°C above 1850–1900 in 2011–2020; its 2022 report on impacts found that roughly 3.3 to 3.6 billion people live in contexts "highly vulnerable to climate change". These were the figures as of those reports.

Stephen Gardiner's "A Perfect Moral Storm" (2006) argues that even if the theoretical puzzles were solved, action would remain close to politically impossible, because three storms converge. In the **global storm**, causes and effects are dispersed among many uncoordinated agents without effective institutions, a tragedy of the commons. In the **intergenerational storm**, the worst effects fall on future generations, so the present has little incentive to act. In the **theoretical storm**, our ethical, political and economic theories are not up to the task. Together they invite buck-passing and procrastination, leaving us "extremely vulnerable to moral corruption".

## Future People

Part of the theoretical storm is a puzzle Derek Parfit named the **non-identity problem** (*Reasons and Persons*, 1984; Parfit on personal identity appears in *Self and No-Self: Personal Identity East and West*). It rests on the **person-affecting intuition**: "what is bad must be bad for someone". Parfit's **depletion case**:

1. A community chooses to deplete resources rather than conserve them; for about two centuries life is slightly better, then much worse.
2. The choice changes when and how people conceive children, so the distant people under Depletion are different people from those who would have lived under Conservation.
3. Their lives are still worth living, so Depletion is not worse *for* any of them: without it, they would not exist.
4. An act is wrong only if it is bad for someone.
5. So Depletion is not wrong.

Yet surely the "great lowering of the quality of life must provide some moral reason not to choose Depletion". Since any significant climate policy changes who is born, John Broome uses this to question duties of justice to remote generations. **Impersonal** views drop step 4, but total views lead to the repugnant conclusion (see *Consequentialism: What Makes Right Acts Right?*); David Boonin bites the bullet; others argue that bringing someone into existence below a threshold of decent life harms her; and **sufficientarians**, as Caney reports, hold a generation unjust if those after it fall below a threshold, whoever they turn out to be.

Economists meet the same question as **discounting**: how much less should future harms count? The Stern Review (2006) used a near-zero pure rate of time preference (about 0.1 per cent) and found that unchecked climate change would cost the equivalent of at least 5 per cent of global GDP each year, "now and forever". Earlier studies by William Nordhaus and others used pure rates of up to 3 per cent, which halves the value of a cost 25 years away, and Nordhaus replied that Stern's conclusions would "not survive the substitution of assumptions that are more consistent with today's marketplace real interest rates and savings rates". Many philosophers side with Stern against pure time discounting, which penalises people, in Caney's words, "for a property that lacks any moral significance".

```checkpoint
q: Which statement about the legal rights of nature is correct?
a: The Whanganui River was the first natural feature in the world to become a legal person.
x: Te Urewera became a legal person in 2014; the Whanganui followed in 2017.
a*: Ecuador's 2008 constitution was the first to recognise enforceable rights of nature, and Te Urewera (2014) preceded the Whanganui River (2017) as a legal person.
a: Rights of nature were first recognised in Leopold's *A Sand County Almanac*.
x: Leopold proposed a land ethic, not legal rights; the legal firsts are Ecuador (2008) and New Zealand's settlements.
a: All scholars agree that rights-of-nature laws faithfully express Indigenous worldviews.
x: Some scholars call the Indigenous framing partly a myth and warn of harms to Indigenous communities.
hint: Two dates in New Zealand, one constitution in South America.
why: Ecuador's constitution frames the rights of nature with reference to Pachamama. In New Zealand, Te Urewera came first (2014), the Whanganui second (2017); whether such laws truly reflect Indigenous thought is debated.
---
q: In Parfit's depletion case, why is Depletion not worse for the future people who live under it?
a: Because their lives are not worth living.
x: The case stipulates that their lives are still worth living.
a: Because future people cannot have interests.
x: The argument does not deny that future people will have interests; it turns on who exists.
a: Because the community discounts the future at 3 per cent.
x: Discounting is a separate issue; the depletion case is about identity.
a*: Because the choice changes who is conceived, so those people would not have existed under Conservation.
hint: Who would have been born otherwise?
why: Depletion changes the timing and manner of conceptions, so different people exist. If an act is wrong only when it is bad for someone, Depletion seems not wrong, yet it surely gives some moral reason against it: that is the non-identity problem.
```

## Who Should Pay?

Caney distinguishes treating climate change on its own (**isolationism**) from treating it within a general theory of justice (**integrationism**), and favours the latter. Three principles dominate. The **polluter pays principle** assigns burdens by emissions; critics note that many past emitters were ignorant or are now dead, and defenders reply that ignorance has not been plausible for decades and that states persist. The **beneficiary pays principle** charges those who have benefited from emissions, and the **ability to pay principle** those best able to bear the cost, though it divorces payment from causation. Many theorists combine them.

Henry Shue's "Subsistence Emissions and Luxury Emissions" (1993) added that emissions needed for subsistence take priority over luxury emissions: the poor must not give up the first so that the affluent can keep the second. Anil Agarwal and Sunita Narain argued in 1991 that the atmosphere's carbon sinks are a global common that "should be shared equally on a per capita basis".

## Further exploration

- **Lori Gruen, *Ethics and Animals: An Introduction* (2011).** A clear survey by a co-author of the SEP entry, with feminist and relational perspectives.
- **Christine M. Korsgaard, *Fellow Creatures: Our Obligations to the Other Animals* (2018).** A Kantian case that all sentient animals are ends in themselves.
- **Martha C. Nussbaum, *Justice for Animals: Our Collective Responsibility* (2023).** The capabilities approach extended to all sentient creatures.
- **Sue Donaldson and Will Kymlicka, *Zoopolis: A Political Theory of Animal Rights* (2011).** Citizenship, sovereignty and denizenship for animals.
- **Ramachandra Guha and Joan Martínez-Alier, *Varieties of Environmentalism: Essays North and South* (1997).** The environmentalism of the poor, with Guha's critique of deep ecology.
- **Stephen M. Gardiner, *A Perfect Moral Storm: The Ethical Tragedy of Climate Change* (2011).** Why climate change tempts us to moral corruption.
- **Henry Shue, *The Pivotal Generation: Why We Have a Moral Responsibility to Slow Climate Change Right Now* (2021).** A short, accessible case by the author of the subsistence/luxury distinction.$animals_master$,
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
  select $animals_quiz$[
    {"type": "mcq", "prompt": "Who coined the word 'speciesism', and when?", "options": ["Peter Singer, in Animal Liberation (1975)", "Jeremy Bentham, in a footnote of 1789", "Richard D. Ryder, in a privately printed leaflet of 1970", "Tom Regan, in The Case for Animal Rights (1983)"], "answerIndex": 2, "explanation": "The British psychologist Richard D. Ryder coined 'speciesism' in 1970 in a leaflet against animal experimentation. Singer credited Ryder and made the term famous in Animal Liberation (1975), defining it as a bias in favour of the interests of one's own species.", "id": "q1"},
    {"type": "mcq", "prompt": "Which objection to the argument from marginal cases holds that humans who lack moral capacities keep their rights because of the kind of being they are?", "options": ["Carl Cohen's 'kind' argument, echoed by Tibor Machan's broken chair", "James Rachels's chimpanzee who learns to read", "Jeff McMahan's 'moral alchemy' objection", "Bentham's comparison of a grown horse or dog with an infant"], "answerIndex": 0, "explanation": "Cohen argued that rights belong to beings of a kind capable of moral judgment, and Machan's analogy says a broken chair is still a chair. Rachels's chimpanzee and the 'moral alchemy' objection McMahan shares with other critics are replies to this species-norm view: it makes an individual's treatment depend on facts about other individuals.", "id": "q2"},
    {"type": "mcq", "prompt": "What does Aśoka's Pillar Edict 5 do?", "options": ["It bans the killing of all animals throughout the empire", "It makes vegetarianism compulsory for Buddhist monks", "It records the conquest of Kalinga", "It declares a list of species inviolable, protects some animals on certain days and forbids burning forests uselessly or to destroy living beings"], "answerIndex": 3, "explanation": "Pillar Edict 5, late in Aśoka's reign, lists protected species (including 'all the quadrupeds which are neither useful nor edible') and days, and forbids burning forests 'either uselessly or in order to destroy (living beings)'. It is not a general ban on killing; Pillar Edict 7 even calls such restrictions 'of little consequence' beside moral conversion.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about discounting the future is correct?", "options": ["Stern and Nordhaus agreed on a pure rate of time preference of about 3 per cent", "The Stern Review used a pure rate of time preference of about 0.1 per cent, while earlier studies by Nordhaus and others used rates of up to 3 per cent", "Philosophers generally defend pure time discounting as fair to future generations", "A 3 per cent rate doubles the value of a cost 25 years away"], "answerIndex": 1, "explanation": "Stern judged pure time preference much above zero ethically inappropriate and used about 0.1 per cent; earlier studies used up to 3 per cent, which halves the value of a cost 25 years away. Nordhaus replied that Stern's conclusions would not survive assumptions consistent with market interest and savings rates. Many philosophers, including Caney, reject pure time discounting.", "id": "q4"},
    {"type": "open", "prompt": "Set out the argument from marginal cases (the argument from species overlap) step by step. Describe two objections to it and the best reply on its behalf.", "rubric": "A strong answer gives the premises: full and equal status for all and only humans needs a property that all and only humans have; any property only humans have (rationality, language, moral agency) some humans lack (infants, people with severe cognitive disabilities, the comatose); any property all humans have (such as sentience) many animals share; so either not all humans are equal or not only humans are; since the first is too counter-intuitive, equal consideration must extend to animals. It describes at least two objections, e.g. Frey (few humans are truly marginal; denying status to the rest is not so counter-intuitive), Cohen and Machan (rights belong to a kind; a broken chair is still a chair), Williams (speciesism is not like racism; no other creature can 'answer back'), Diamond (how we treat humans is part of the concept 'human being'), Kittay and Carlson (criticising the comparisons; Kittay doubts any human is radically cognitively disabled in the assumed sense). It gives the reply: objectors grant that the most limited humans deserve direct concern and must find a relevant property beyond a species label; Rachels's reading chimpanzee and the 'moral alchemy' objection show species-norm views make treatment depend on facts about other individuals. Credit for noting the argument's history (Porphyry, Bentham) and that it is still debated.", "id": "q5"},
    {"type": "open", "prompt": "Explain Stephen Gardiner's 'perfect moral storm' and how the non-identity problem adds to it. Then compare two principles for sharing the burdens of climate change.", "rubric": "A strong answer describes Gardiner's three converging storms: global (dispersed causes and effects, many uncoordinated agents, weak institutions, a tragedy of the commons), intergenerational (the worst effects fall on future generations, so the present lacks incentive) and theoretical (existing ethical, political and economic theories are inadequate), which together make us 'extremely vulnerable to moral corruption'. It explains the non-identity problem through Parfit's depletion case: the policy changes who is born, so it is not worse for those future people, yet it seems wrong; climate policy has the same structure (Broome). It mentions at least one response (impersonal views and the repugnant conclusion, threshold harm, sufficientarianism, Boonin's bullet-biting). It compares at least two burden-sharing principles: polluter pays (objections from ignorance and dead emitters, with replies), beneficiary pays, ability to pay (detached from causation), Shue's priority of subsistence over luxury emissions, or Agarwal and Narain's equal per capita shares. Credit for dating any climate figures to the IPCC's 2023 synthesis.", "id": "q6"}
  ]$animals_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/animals-and-environment', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
