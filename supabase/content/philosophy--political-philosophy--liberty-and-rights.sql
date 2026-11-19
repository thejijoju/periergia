-- Liberty and Rights — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/liberty-and-rights @ research/advanced/read.
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
    'philosophy/political-philosophy/liberty-and-rights',
    'research',
    'advanced',
    'read',
    $liberty_master$> **When may a society limit what you do or say, and what is owed to you whoever you are?** This chapter follows Mill's harm principle into the quarrels over offence, morals laws and paternalism, sets out Mill's argument for free speech and the dispute over hate speech, and compares three ideas of freedom: Berlin's negative and positive liberty and the republican ideal of non-domination. It then asks what a right is, how natural rights became human rights, and whether those rights are universal, from the drafting of the Universal Declaration to the Asian values debate and the African and Islamic charters.

## Mill's Harm Principle

Should the law stop you riding without a helmet, or doing in private something your neighbours find disgusting? David Brink, in the Stanford Encyclopedia of Philosophy (SEP), sorts the reasons a society might give into three kinds. If A restricts B's liberty for B's own benefit, the restriction is **paternalistic**; if to make B behave morally, it is **moralistic**; if to prevent harm to someone other than B, it applies the **harm principle**. The classic claim that only the third reason is legitimate comes from John Stuart Mill's *On Liberty* (1859). His life, his utilitarianism and Harriet Taylor Mill's share in the book are told in *Bentham, Mill and Utilitarianism*; this chapter looks at how the principle has been read and attacked.

Mill announced "one very simple principle": "the sole end for which mankind are warranted, individually or collectively, in interfering with the liberty of action of any of their number is self-protection." Power may be used against someone's will only "to prevent harm to others"; a person's own good "is not a sufficient warrant." In short, "Over himself, over his own body and mind, the individual is sovereign." Mill never used the phrase "harm principle"; the label is later.

What counts as harm? On Brink's reading, harm must violate or risk violating others' important interests "in which they have a right". Joel Feinberg defined harms as "those states of set-back interest that are the consequence of wrongful acts or omissions by others"; critics complain that this explains one unclear idea by another. The principle sorts *reasons*, not acts: Mill has no objection to laws against murder, which also express moral disapproval, because harm to others justifies them anyway. And harm is necessary, not sufficient: once conduct "affects prejudicially the interests of others, society has jurisdiction over it", but whether to interfere then depends on whether "the general welfare will or will not be promoted". Brink concludes that the "one very simple principle" is "over-simple"; whether it is consistent, and whether it is really Mill's only principle, is debated.

## Offence and the Enforcement of Morals

Mill says mere offence may not be regulated, yet allows the prohibition of public "offenses against decency". Brink thinks Mill "may not have a consistent view about offense". Joel Feinberg (1926–2004) took up the problem in *Offense to Others* (1985), part of his four-volume *The Moral Limits of the Criminal Law*. Imagine "a ride on the bus" you cannot leave, while passengers do harmless but deeply offensive things. Are there experiences "harmless in themselves yet so unpleasant that we can rightly demand legal protection from them"? Feinberg, a self-described Millian, said yes, on the model of nuisance law: weigh the seriousness of the offence (how intense, how avoidable) against the importance of the offender's interests.

**Legal moralism** goes further: in Feinberg's definition, it may be legitimate to prohibit conduct because it is "inherently immoral, even though it causes neither harm nor offence". The classic dispute followed the Wolfenden Report (1957), which recommended that "homosexual behaviour between consenting adults in private should no longer be a criminal offence". Patrick Devlin replied in his Maccabaean Lecture of 1959, expanded as *The Enforcement of Morals* (1965). Compressed, his argument ran: a society is constituted by a shared morality ("society means a community of ideas"); undermining that morality threatens disintegration, as treason threatens a government; a society may protect its existence; so it has a "prima facie right to legislate" against immorality, limited by "toleration of the maximum individual freedom that is consistent with the integrity of society" and reached only when ordinary feeling rises to "intolerance, indignation and disgust".

H. L. A. Hart's *Law, Liberty and Morality* (1963), first given as three lectures at Stanford in 1962, gave Devlin the label "legal moralist", and it stuck. Hart granted that some shared morality, against violence and dishonesty, is essential to any society, but the harm principle already protects it. Devlin slid from that "acceptable proposition" to "the unacceptable proposition that a society is identical with its morality" at a given moment, so that any moral change would count as destroying society; and he offered no evidence that societies collapse when morals go unenforced.

A common misreading needs correcting. Devlin did not want private homosexual acts to stay criminal: he judged them within the bounds of toleration, and in 1965 signed a letter to *The Times* supporting the Wolfenden reforms. Legal moralism still has defenders, such as Michael Moore and Antony Duff, who claim only that immorality gives a defeasible reason to legislate, and Brink argues that such weak moralism still reaches most liberal conclusions.

## Paternalism and Nudges

The philosopher Gerald Dworkin, not to be confused with the legal philosopher Ronald Dworkin, wrote the standard paper, "Paternalism" (1972). In his SEP definition, X acts paternalistically towards Y when X interferes with Y's liberty or autonomy, without Y's consent, only because X believes this will improve Y's welfare, as with compulsory seat belts.

Mill gave two reasons against paternalism: state power is abused, and each person is the best judge of his own good. Brink notes that neither rules out *successful* paternalism. Mill made one notable exception: no one may sell himself into slavery, because "by selling himself for a slave, he abdicates his liberty". Feinberg's **soft paternalism** interferes only to check that a choice is informed and voluntary; **hard paternalism** may block even a knowing, voluntary one.

Cass Sunstein and Richard Thaler's **libertarian paternalism** (2003; *Nudge*, 2008) works by "choice architecture". A nudge "alters people's behavior in a predictable way without forbidding any options or significantly changing their economic incentive": healthy food at eye level, or automatic enrolment in a pension one may leave. Critics answer that nudges can be hidden, exploit non-rational tendencies (an outcome sounds better as "90% survive" than as "10% die") and shade into manipulation; Sunstein proposes a transparency condition.

## Free Speech: Mill's Argument from Fallibility

Chapter II of *On Liberty* gives the most famous argument for free speech. As Brink and Jeffrey Howard (SEP) reconstruct it:

1. A silenced opinion may be true. Suppressing it assumes infallibility, but we cannot be certain that it is false; and even certainty, Mill adds, would not make silencing it good.
2. A false opinion may contain part of the truth, and on complex matters truth emerges from the collision of partial views.
3. Even a wholly false opinion, by challenging the true one, keeps it from becoming "a dead dogma, not a living truth".
4. So suppressing opinion does epistemic harm whether the opinion is true or false, and opinion should not be suppressed.

**Objection.** Brink notes that this truth-tracking argument condemns only *incompetent* censorship: a perfectly reliable censor would do no epistemic damage, and the argument seems to permit censoring well-established falsehoods. Nor need a censor assume infallibility; he can admit he might be wrong and act on the best evidence.

**Reply.** Properly recognising our fallibility should keep discussion open. And Mill has a deeper reason: free discussion lets people exercise their rational capacities and hold their beliefs as their own, which even a censor who never erred would prevent.

Howard reads the chapter as a partial *qualification* of the harm principle: much harmful speech must still be allowed, and only imminently dangerous speech may be restricted. He also doubts that Mill thought open debate inevitably produces truth; the point was that it beats any arbiter who suppresses what he thinks false.

The idea is often called the "marketplace of ideas", after Justice Oliver Wendell Holmes, who never used that phrase. In *Abrams v. United States* (1919) the Supreme Court upheld, 7–2, the convictions of anarchists who had leafleted against American intervention in Russia; Holmes, who earlier that year had written for a unanimous Court upholding convictions in *Schenck*, dissented:

```quote
…the ultimate good desired is better reached by free trade in ideas — that the best test of truth is the power of the thought to get itself accepted in the competition of the market, and that truth is the only ground upon which their wishes safely can be carried out.
Oliver Wendell Holmes · Dissent, Abrams v. United States · 1919
```

*Brandenburg v. Ohio* (1969) later protected advocacy of violence, punishing only incitement to "imminent lawless action".

## Hate Speech

Most liberal democracies, including Canada, Germany, France and India, restrict hate speech; the United States is the outlier. The International Covenant on Civil and Political Rights (1966) requires states to prohibit "advocacy of national, racial or religious hatred that constitutes incitement to discrimination, hostility or violence".

The leading philosophical case for restriction is Jeremy Waldron's *The Harm in Hate Speech* (2012). Waldron treats hate speech as group defamation that attacks its targets' standing as "social equals and as bearers of human rights and constitutional entitlements". It undermines the public assurance of their dignity, working as "a slow-acting poison, accumulating here and there, word by word". Bhikhu Parekh adds that the "imminent danger" test is short-sighted, since danger becomes imminent against a social climate built up beforehand.

Critics reply that bans chill legitimate speech, hand the state too much power over content and drive extremists underground, where they feel persecuted. Ronald Dworkin offered what James Weinstein called the most powerful argument against regulation: silencing opponents of anti-discrimination laws during public debate weakens the democratic legitimacy of those laws, since the losers were denied a voice. Brian Leiter doubted that the line between an injury to dignity and mere offence is stable, and Nadine Strossen's *Hate* (2018) defends counter-speech instead. The debate is open.

```checkpoint
q: In Brink's three-way classification, a law forbidding an adult to do something solely because it is bad for that adult is:
a*: paternalistic.
a: an application of the harm principle.
x: The harm principle concerns preventing harm to people other than the one restricted.
a: moralistic.
x: Moralistic restrictions aim to make someone act morally, not to benefit them.
a: an application of the offence principle.
x: Offence concerns the unpleasant effect of conduct on others, not the agent's own good.
hint: Whose good is the restriction meant to serve?
why: Restricting someone's liberty for their own benefit is paternalism, which Mill's principle rules out: a person's own good "is not a sufficient warrant".
---
q: Which of these was Patrick Devlin's actual view of private consensual homosexual sex?
a: It should remain a crime because it threatened society's shared morality.
x: This is the widespread misreading the SEP corrects; Devlin judged it within the bounds of toleration.
a: It was not immoral at all, so the law had no business with it.
x: Both sides in the 1960s largely conceded the conduct was immoral; Devlin's point was that it still fell within toleration.
a*: It fell within the bounds of toleration and should not be criminalised.
a: The question should be settled by the harm principle alone.
x: Devlin rejected the idea that harm is the only ground for law; he defended legal moralism.
hint: What did he sign in 1965?
why: Devlin defended society's right to legislate against immorality in principle, but judged that this conduct did not reach "intolerance, indignation and disgust", and he signed a 1965 letter to The Times backing the Wolfenden reforms.
```

## Two Concepts of Liberty

Isaiah Berlin's "Two Concepts of Liberty", his inaugural lecture as Chichele Professor of Social and Political Theory at Oxford on 31 October 1958, argued that "liberty" answers two questions. **Negative liberty** answers: "What is the area within which the subject—a person or group of persons—is or should be left to do or be what he is able to do or be, without interference by other persons?" **Positive liberty** answers: "What, or who, is the source of control or interference that can determine someone to do, or be, this rather than that?"

{{image: Isaiah Berlin | Isaiah Berlin, whose 1958 Oxford lecture "Two Concepts of Liberty" set the terms of the modern debate about freedom.}}

```quote
I am normally said to be free to the degree to which no man or body of men interferes with my activity. Political liberty in this sense is simply the area within which a man can act unobstructed by others.
Isaiah Berlin · Two Concepts of Liberty (revised text, Four Essays on Liberty, 1969) · 1958
```

On the negative view, inability is not unfreedom: "Coercion implies the deliberate interference of other human beings within the area in which I could otherwise act." Berlin linked negative liberty with Hobbes, Bentham and Mill, and positive liberty, rooted in the wish to be in control of one's own life, with Rousseau, Fichte and Hegel. Liberty has costs: "'Freedom for the pike is death for the minnows'; the liberty of some must depend on the restraint of others." Berlin put the line in quotation marks; it appears earlier in R. H. Tawney's *Equality*.

Berlin's worry about positive liberty is often called its paradox. Ian Carter and Ilkin Huseynli's SEP reconstruction runs:

1. To be free in the positive sense is to be master of oneself.
2. The self divides into a "higher", rational, "true" self and a lower self of passing desires; freedom is rule by the higher self.
3. Some people are more rational and know better what others' true selves would choose.
4. So coercing people to act as their true selves would choose does not violate their freedom: it "liberates" them.
5. The true self can be identified with "a tribe, a race, a church, a state".
6. So, in freedom's name, rulers may "ignore the actual wishes of men or societies, to bully, oppress, torture in the name, and on behalf, of their 'real' selves".

Berlin called this a "monstrous impersonation" of freedom. He also distrusted, in the SEP's quotation, the "retreat into an inner citadel", freedom by extinguishing desires, like curing a wounded leg by "cutting off my leg".

**Objection.** Gerald MacCallum Jr. argued in 1967 that there is one concept, not two. Every freedom claim has three parts: an agent (x) is free from preventing conditions (y) to do or become something (z). Every freedom is both "from" and "to"; disputes are really about what counts as the agent, the constraint and the goal. Berlin's danger comes from filling in the agent as a "true self" or a collective, not from positive liberty as such.

**Reply.** Joshua Cherniss and Henry Hardy, in the SEP, stress that Berlin treated both liberties as genuine values, though his account was "less than fully even-handed"; his targets were **monism**, the belief that every genuine question, moral ones included, has one true answer and that all true answers fit together into a single harmonious whole, and collective selves. On this reading, which fits MacCallum's diagnosis, his quarrel was with these, not with positive liberty as such. Charles Taylor (1979) defended a distinction that, some argue, MacCallum's formula misses (Eric Nelson replies that it can accommodate it), between an **opportunity concept** of freedom (having options) and an **exercise concept** (actually governing oneself). G. A. Cohen, among others, argued that lack of money is itself a lack of negative freedom: to borrow the SEP's example, take a jacket without paying and others, backed by the state, will stop you.

## Freedom as Non-Domination

A third view claims to be older than both. In 1819 Benjamin Constant contrasted ancient liberty, active participation in collective power, with modern liberty: "The aim of the moderns is the enjoyment of security in private pleasures; and they call liberty the guarantees accorded by institutions to these pleasures." He warned against ever sacrificing individual liberty to obtain political freedom.

Republicanism names both a tradition, from Cicero and Machiavelli through Harrington to the American founders, and a contemporary theory. Quentin Skinner's *Liberty before Liberalism* (1998) recovered its "neo-Roman" idea of freedom; Philip Pettit's *Republicanism* (1997) made **non-domination** its central value: you are free to the extent that no one has "the capacity to interfere in [your] affairs on an arbitrary basis". The argument is the **kindly master**. If freedom were only non-interference, a slave whose master never interfered would be free, and one who learned to flatter would grow freer. That is absurd; as Frederick Douglass wrote, "it was slavery—not its mere incidents—that I hated". Domination without interference is possible, and so is interference without domination, by laws that track the interests of those they govern. Republicans want not a better master but none: an "empire of laws and not of men", in Harrington's phrase.

Liberal critics such as Kramer and Carter reply that domination matters because it makes interference *likely*; republicans have given good arguments for institutions, not a new concept. Republicans answer that a kind husband in a patriarchal legal order still dominates his wife, however unlikely he is to interfere. In the SEP's words, "the jury is still out".

## What Is a Right?

The American legal scholar Wesley Newcomb Hohfeld (1879–1918) distinguished four elements of rights. You have a **privilege** to pick up a shell on a beach if you have no duty not to; a **claim** to your wages if your employer has a duty to you to pay them; a **power** if you can change your own or others' rights and duties, as by promising or waiving; an **immunity** if others lack the power to change yours. Most rights are combinations of these.

What do rights *do*? The **will theory** says a right gives its holder control over another's duty, making him, in Hart's phrase, "a small scale sovereign"; Kant and Hart are among its defenders. The **interest theory**, held by Bentham and Raz among others, says a right exists when an aspect of someone's well-being is sufficient reason to hold others under a duty. Will theorists struggle with unwaivable rights, such as the right not to be enslaved, and with infants, animals and people in comas, who can control nothing. Interest theorists struggle with third parties who benefit from others' duties without having rights, and with office-holders such as judges, whose rights do not serve their own interests. The SEP calls this a dispute of hundreds of years. (*Deontology: Duty and Respect* covers Nozick's rights as side constraints.)

## Natural Rights and Their Critics

The Latin *ius* first meant what is objectively just; scholars dispute when its **subjective** sense, a right someone holds, arose: with Locke and Hobbes, Grotius, Gerson in the fifteenth century, Ockham in the fourteenth, perhaps Gratian in the twelfth, or even earlier. Hugo Grotius's *De iure belli ac pacis* (1625) defined a right as "a moral quality of a person, making it possible to have or to do something correctly", and held that natural law would have validity "even if we should concede … that there is no God". Natural rights theory peaked with Grotius, Hobbes, Pufendorf and Locke (see *Locke*), and was echoed in the American Declaration of Independence (1776).

Its critics were fierce. Bentham, in *Anarchical Fallacies*, written in the 1790s, called natural rights "simple nonsense: natural and imprescriptible rights, rhetorical nonsense,—nonsense upon stilts". Marx, in "On the Jewish Question" (1844), said the "rights of man" proclaimed in the French declarations and American state constitutions belonged to the egoistic member of civil society, an "isolated monad … withdrawn behind his private interests and whims and separated from the community" (see *Marx*; whether the essay is antisemitic is debated). Other traditions raise related doubts. Menkiti wrote that "as far as Africans are concerned, the reality of the communal world takes precedence over the relative individual life histories", and scholars of Confucianism debate whether rights fit an ethics of roles and ritual at all, or serve, in Joseph Chan's phrase, as a "fallback apparatus".

## The Universal Declaration

The UN General Assembly adopted the Universal Declaration of Human Rights in Paris on 10 December 1948: 48 votes in favour, none against, and eight abstentions (the Soviet Union, the Byelorussian and Ukrainian republics, Czechoslovakia, Poland, Yugoslavia, Saudi Arabia and South Africa); Honduras and Yemen did not vote. The Soviet bloc said it did not condemn fascism enough; South Africa was protecting apartheid; Saudi Arabia objected chiefly to the right to change one's religion and to equal marriage rights.

Eleanor Roosevelt chaired the drafting commission. John Peters Humphrey of Canada prepared the first draft and René Cassin of France the second. The philosophical debate centred on two men. P. C. Chang of China, a student of John Dewey, used Confucianism to break deadlocks and pressed to remove references to religion; he is widely credited with bringing the Confucian *ren*, humane fellow-feeling, into Article 1's appeal to conscience, though sources differ on how much of his framing survived. Charles Malik of Lebanon, a Thomist philosopher, proposed what became Article 28, on an order in which the rights can be realised. Hansa Mehta of India, one of only two women on the commission, changed Article 1 from "all men are born free and equal" to "All human beings are born free and equal in dignity and rights."

Could such different people agree? Maritain, reporting on a UNESCO inquiry, said "we agree about the rights but on condition no one asks us why". The American Anthropological Association had warned in 1947 against rights "conceived only in terms of the values prevalent in Western Europe and America".

## Universal or Particular?

The warning returned in the 1990s. Singapore's Lee Kuan Yew and others argued that UN human rights neglected "Asian values": family and community over individualism, harmony over personal freedom, respect for leaders. In 1993 Asian states meeting at Bangkok for a UN regional conference reaffirmed the Universal Declaration and said that, "while human rights are universal in nature", they must be considered bearing in mind national and regional particularities and different cultural and religious backgrounds, stressing sovereignty and development; over a hundred Asian NGOs rejected cultural exemptions. The Vienna Declaration later that year, while also keeping a clause on particularities, insisted that "All human rights are universal, indivisible and interdependent and interrelated", to be protected by all states "regardless of their political, economic and cultural systems". Western delegates tended to see Asian-values claims as excuses for repression; their proponents saw a defence of community, development and non-interference.

Asian critics replied. Kim Dae-jung's "Is Culture Destiny?" (1994) drew on Mencius and Buddhism, and Amartya Sen's lecture *Human Rights and Asian Values* (1997) argued that Asia is too diverse to share one set of values; that Confucius allowed dissent against mistaken rulers; that Ashoka urged tolerance and Akbar's court discussed religious difference while the Inquisition raged in Europe; and that authoritarianism has not been shown to aid development.

The African Charter on Human and Peoples' Rights, approved by the Organisation of African Unity in 1981 and in force from 1986, adds **peoples'** rights, to self-determination, development and "a generally satisfactory environment", and individual *duties*: to family and community, to work and pay taxes, and to preserve "positive African cultural values". The Cairo Declaration on Human Rights in Islam, adopted in 1990 by the foreign ministers of the Organisation of the Islamic Conference (now the Organisation of Islamic Cooperation), an intergovernmental body of mostly Muslim-majority states, makes all its rights "subject to the Islamic Sharia"; the International Commission of Jurists condemned it, critics focus on apostasy and freedom of religion and expression, and a 2020 revision no longer specifically invokes Sharia. Evenhandedness requires two further facts: in 1948 most Muslim-majority members, including Egypt, Iran, Pakistan and Turkey, voted for the Universal Declaration, Saudi Arabia being the only Muslim-majority abstainer; and reformist Muslim scholars such as Abdullahi Ahmed An-Na'im argue for human rights from within Islamic jurisprudence. Whether human rights are a universal minimum, a Western export, or something each tradition can reach by its own route remains a live debate (see also *Race, Colonialism and Philosophy*).

```checkpoint
q: What was MacCallum's main objection to Berlin's two concepts of liberty?
a: That negative liberty leads to tyranny more easily than positive liberty.
x: MacCallum did not rank the concepts; he denied that there were two.
a*: That every freedom claim relates an agent, a constraint and a goal, so there is one concept, not two.
a: That freedom is the absence of domination rather than of interference.
x: That is the republican view of Pettit and Skinner.
a: That lack of money is a lack of negative freedom.
x: That is G. A. Cohen's argument.
hint: Count the parts of a freedom claim.
why: For MacCallum, an agent x is free from y to do or become z. Every freedom is both "from" and "to"; the disputes are about how to fill in the three variables.
---
q: Which statement about the Universal Declaration vote in 1948 is correct?
a: Most Muslim-majority members abstained.
x: Most voted in favour; Saudi Arabia was the only Muslim-majority abstainer.
a: Several states voted against it.
x: No state voted against; there were eight abstentions.
a: It was adopted unanimously, with no abstentions.
x: Eight states abstained, and Honduras and Yemen did not vote.
a*: There were 48 votes in favour, none against and eight abstentions.
hint: Who abstained, and why?
why: The abstainers were the Soviet bloc (six votes), Saudi Arabia (chiefly over changing one's religion and marriage rights) and South Africa (protecting apartheid).
```

## Further exploration

- **Isaiah Berlin, *Liberty*, ed. Henry Hardy (2002).** Contains "Two Concepts of Liberty" and the other essays first collected in *Four Essays on Liberty* (1969).
- **Philip Pettit, *Republicanism: A Theory of Freedom and Government* (1997).** The theory of freedom as non-domination.
- **Quentin Skinner, *Liberty before Liberalism* (1998).** A short history of the neo-Roman idea of liberty.
- **Jeremy Waldron, *The Harm in Hate Speech* (2012).** The case for hate-speech laws as protecting dignity and equal standing.
- **Nadine Strossen, *Hate: Why We Should Resist It With Free Speech, Not Censorship* (2018).** The counter-speech reply.
- **Mary Ann Glendon, *A World Made New: Eleanor Roosevelt and the Universal Declaration of Human Rights* (2001).** The drafting, with Chang, Malik, Cassin and Humphrey.
- **Joanne R. Bauer and Daniel A. Bell (eds), *The East Asian Challenge for Human Rights* (1999).** Essays testing the claims of the Asian values debate.$liberty_master$,
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
  select $liberty_quiz$[
    {"type": "mcq", "prompt": "Which phrase did Justice Holmes actually use in his dissent in Abrams v. United States (1919)?", "options": ["\"free trade in ideas\"", "\"marketplace of ideas\"", "\"freedom for the pike is death for the minnows\"", "\"imminent lawless action\""], "answerIndex": 0, "explanation": "Holmes wrote of \"free trade in ideas\" and \"the competition of the market\"; he never used the phrase \"marketplace of ideas\". The pike line is one Berlin quoted (it appears earlier in Tawney), and \"imminent lawless action\" is the test of Brandenburg v. Ohio (1969).", "id": "q1"},
    {"type": "mcq", "prompt": "According to Gerald MacCallum (1967), every claim about freedom has the form:", "options": ["an agent is free when no one interferes with them at all", "an agent is free when governed by their higher, rational self", "an agent x is free from preventing conditions y to do or become z", "an agent is free when no one has the capacity to interfere arbitrarily"], "answerIndex": 2, "explanation": "MacCallum's triadic analysis makes every freedom both 'from' and 'to', so the contrast between freedom from and freedom to is false; disputes concern how to fill in the three variables. The last option is Pettit's republican definition.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the 'kindly master' argument meant to show?", "options": ["That paternalism is justified when the master is benevolent", "That positive liberty leads to tyranny", "That harm to others is the only ground for restricting liberty", "That freedom requires not being subject to another's power to interfere at will, not merely the absence of interference"], "answerIndex": 3, "explanation": "If freedom were only non-interference, a slave whose master never interfered would be free. Republicans such as Pettit and Skinner conclude that freedom is non-domination; as Douglass put it, 'it was slavery—not its mere incidents—that I hated'.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these is a distinctive feature of the African Charter on Human and Peoples' Rights?", "options": ["It makes all rights subject to the Sharia", "It includes peoples' rights, such as to development and a satisfactory environment, and individual duties", "It was adopted by the UN General Assembly in 1948", "It contains no rights to self-determination"], "answerIndex": 1, "explanation": "The Charter, approved by the OAU in 1981 and in force from 1986, adds peoples' rights (self-determination, development, 'a generally satisfactory environment') and duties to family, community and 'positive African cultural values'. Subjecting rights to the Sharia is the Cairo Declaration (1990).", "id": "q4"},
    {"type": "open", "prompt": "Set out Berlin's argument that positive liberty can be turned into a justification for tyranny, and assess MacCallum's objection and the reply made on Berlin's behalf.", "rubric": "A strong answer distinguishes Berlin's two questions (the area of non-interference vs the source of control) and reconstructs the paradox in steps: freedom as self-mastery; the divided self, higher 'true' self versus lower empirical self; some know others' true interests; coercion then 'liberates'; the true self identified with a collective ('a tribe, a race, a church, a state'); so rulers may oppress people in the name of their 'real' selves. It mentions the 'retreat into an inner citadel'. It presents MacCallum's triadic analysis (x free from y to do z), on which there is one concept and the danger comes from how the agent and constraint are filled in. It gives the reply drawn from Cherniss and Hardy's SEP account: Berlin valued both liberties and his targets were monism and collective selves, though his treatment was 'less than fully even-handed'. Credit for Taylor's opportunity/exercise distinction or Cohen's point that poverty limits negative freedom.", "id": "q5"},
    {"type": "open", "prompt": "Are human rights universal? Discuss the Asian values debate and at least one regional or religious declaration evenhandedly.", "rubric": "A strong answer starts from the Universal Declaration (1948: 48 for, none against, eight abstentions) and the pluralism of its drafting (Chang's Confucianism, Malik's Thomism, Mehta's change to 'All human beings'), with Maritain's 'agree about the rights but on condition no one asks us why' and the 1947 AAA warning. It presents the Asian values case (Lee Kuan Yew; the Bangkok Declaration's call to consider national and regional particularities; sovereignty and development) and the replies (the Vienna Declaration's 'universal, indivisible'; Sen's argument that Asia is diverse and has traditions of tolerance and dissent; Kim Dae-jung), noting that Western delegates saw these claims as excuses for repression while proponents stressed community. It discusses the African Charter's peoples' rights and duties and/or the Cairo Declaration's subjection of rights to the Sharia, with the facts that most Muslim-majority states voted for the UDHR and that reformers such as An-Na'im argue for rights from within Islam. Credit for Bentham's and Marx's critiques or Menkiti and the Confucianism-and-rights debate.", "id": "q6"}
  ]$liberty_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/liberty-and-rights', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
