-- Bentham, Mill and Utilitarianism — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/utilitarianism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/utilitarianism',
    'research',
    'advanced',
    'read',
    $utilitarian_master$> **Utilitarianism holds that the right action is the one that produces the most happiness, and in nineteenth-century Britain it became both a philosophy and a programme of reform.** This chapter follows it from Jeremy Bentham's principle of utility and his campaigns on law, rights, prisons, animals and sexual freedom, to John Stuart Mill's higher pleasures, "proof" of utility, logic, *On Liberty* and *The Subjection of Women*, the part Harriet Taylor Mill played in that work, and Mill's defence of empire. It ends with Henry Sidgwick, who took the tradition to its most rigorous and most troubled form.

## The Greatest Happiness before Bentham

**Utilitarianism** is a form of **consequentialism**, the view that whether an act is right depends only on its results; for utilitarians the result that matters is happiness, counted impartially. The chapter on *Mozi, the Daoists and the Legalists: the Hundred Schools* describes the Mohists of ancient China, whom scholars such as Van Norden call "proto-utilitarian" for their commitments to impartiality and to producing the greatest good; some find a similar strand in the Indian Buddhist Śāntideva.

In Europe Francis Hutcheson (1694–1746), the Irish-born Glasgow professor met in *The Enlightenment and Rousseau*, wrote in 1725 that "that action is best, which procures the greatest happiness for the greatest numbers". Writers such as Susanna Newcome, John Gay and Joseph Priestley were "theological" utilitarians, who held that we must promote happiness because God wills it; William Paley's version (1785) was still a Cambridge set text in Victorian times.

Bentham found the principle of utility in 1769. Reading Hume's *Treatise* (see *Berkeley and Hume*), he "felt as if scales had fallen from my eyes"; he took the word "utility" from Hume, the link between happiness and pleasure from Helvétius, and the formula "the greatest happiness of the greatest number" most plausibly from Beccaria (1764). What he added, the Stanford Encyclopedia of Philosophy (SEP) says, was a "secular and systematic form".

## Bentham's Two Sovereign Masters

Jeremy Bentham (1748–1832), a Londoner who entered Oxford at twelve, was called to the Bar but abandoned practice for legal theory and reform. His anonymous *A Fragment on Government* (1776) stated his "fundamental axiom": "it is the greatest happiness of the greatest number that is the measure of right and wrong". His *Introduction to the Principles of Morals and Legislation* (printed 1780, published 1789) opens with its most famous passage:

```quote
Nature has placed mankind under the governance of two sovereign masters, pain and pleasure. It is for them alone to point out what we ought to do, as well as to determine what we shall do. On the one hand the standard of right and wrong, on the other the chain of causes and effects, are fastened to their throne.
Jeremy Bentham · An Introduction to the Principles of Morals and Legislation, ch. I (Collected Works, ed. Burns and Hart, 1970, p. 11) · 1789
```

It joins **psychological hedonism** (pleasure and pain are what in fact move us) to **ethical hedonism** (pleasure is the only good, so acts are right as they tend to produce it). The principle of utility approves or disapproves of every action "according to the tendency which it appears to have to augment or diminish the happiness of the party whose interest is in question". Bentham admitted it cannot be proved directly: all explanation "must start somewhere".

To apply it he offered a method of calculation, later called the "felicific calculus", though Bentham never used that phrase. A pleasure or pain, he said, has a value that depends on its intensity, duration, certainty and nearness in time; to judge an act we add its fecundity (the chance that it will be followed by more of the same kind) and its purity (the chance that it will not be followed by the opposite kind); and where several people are affected, its extent. These seven dimensions were, for Bentham, a model of ideal reckoning that no individual or legislator could follow strictly.

Only quantity counts. In *The Rationale of Reward* (1825) he wrote: "Prejudice apart, the game of push-pin is of equal value with the arts and sciences of music and poetry. If the game of push-pin furnish more pleasure, it is more valuable than either." (The familiar "push-pin is as good as poetry" is a later paraphrase.) Mill reports "Bentham's dictum": "everybody to count for one, nobody for more than one", a wording known only through Mill. And in 1829 Bentham dropped "of the greatest number" from his slogan, speaking simply of the "greatest happiness principle", because the older formula could seem to justify sacrificing a minority to a majority.

## Law, Rights, Prisons and Bodies

Bentham's main concern was law. Against the French declarations of rights he wrote *Anarchical Fallacies* (written 1791–95), insisting that rights are created by law: "Natural rights is simple nonsense: natural and imprescriptible rights, rhetorical nonsense,—nonsense upon stilts." Such talk was, for him, a "perversion of language". He also distinguished "the law as it is" from "the law as it ought to be". That distinction stands at the foundation of **legal positivism**, the view that whether a rule is law depends on social facts, such as being commanded by a sovereign, rather than on its moral merit. An evil law is still law. John Austin carried the idea into jurisprudence, though Rosen argues that Bentham's account of sovereignty is subtler than the command-and-obedience model usually pinned on him.

The **Panopticon** came from an idea of his brother Samuel's, developed while Bentham visited him in Krichev, in the Russian Empire (1785–87). Set out in 1791, it was a circular building in which a central inspector could watch every inmate, best known as a prison for "grinding rogues honest and idle men industrious". ("The more strictly we are watched, the better we behave", he wrote in poor-law papers of 1797.) Authorised in 1794, the scheme failed; in 1812 the government paid Bentham £23,000 in compensation. Michel Foucault's *Discipline and Punish* (1975) made the panopticon, "that cruel, ingenious cage", the symbol of a modern "society of surveillance" (see *Structuralism and After: Foucault, Derrida and Their Critics*); historians of the project, following Semple (1993), reply that Foucault "hardly does justice to the intricacies" of Bentham's plan.

{{image: Panopticon | A plan of Bentham's panopticon prison, drawn in 1791.}}

Two arguments look far ahead of their time. In a footnote to chapter XVII of the *Introduction* he compared the treatment of animals with that of slaves, observed that a grown horse or dog is more rational than a newborn infant, and concluded: "the question is not, Can they reason? nor, Can they talk? but, Can they suffer?" The SEP places this at the beginning of utilitarian arguments for animals, continued by Peter Singer (see *Animals and the Environment*). Second, classifying offences only by harm, he rejected punishing consensual sex. His essay "Paederasty" (c. 1785), arguing for reform of the laws against homosexual acts, stayed unpublished in his lifetime, apparently for fear of offending public morality, and appeared only in 1978; the SEP calls his writings on the subject "the first systematic defence of sexual liberty in the English language". By his will his body was publicly dissected; his skeleton, dressed in his clothes and topped with a wax head, is still displayed as the "auto-icon" at University College London.

## The Education and Crisis of John Stuart Mill

James Mill, a Scottish shoemaker's son in Bentham's circle, educated his son John Stuart Mill (born in London on 20 May 1806) himself: Greek at three, Latin at eight, most of the classical canon by twelve, then logic and political economy. The boy never went to university. At seventeen, in 1823, he joined his father at the East India Company, where he served until 1858.

At twenty he asked himself whether achieving all his reforming goals would make him happy, and, he wrote in his *Autobiography*, "an irrepressible self-consciousness distinctly answered, 'No!'" The depression ran through 1826–27. Recovery came through Romantic poetry, Wordsworth above all. Mill concluded that his upbringing had held only "one side of the truth" and that the "culture of the feelings" mattered too. In 1830 he met Harriet Taylor, then married to John Taylor; after Taylor's death they married in 1851.

## Higher and Lower Pleasures

Mill's *Utilitarianism* (1861; book 1863; Mill is quoted here from the *Collected Works*, ed. J. M. Robson) holds that "actions are right in proportion as they tend to promote happiness, wrong as they tend to produce the reverse of happiness. By happiness is intended pleasure, and the absence of pain." So far this is Bentham. But Mill added that pleasures differ in **quality** as well as quantity: those "of the intellect, of the feelings and imagination, and of the moral sentiments" are higher.

The test is the verdict of **competent judges**, people "competently acquainted with both". If they place one pleasure "so far above the other that they prefer it, even though knowing it to be attended with a greater amount of discontent", and would not give it up for any amount of the other, it is superior in quality. Their preference reflects "a sense of dignity"; hence "It is better to be a human being dissatisfied than a pig satisfied; better to be Socrates dissatisfied than a fool satisfied."

The standard objection, pressed by Sidgwick, F. H. Bradley, T. H. Green and G. E. Moore, is that this abandons hedonism: if one pleasure beats another of equal quantity, some value besides pleasure is doing the work. Defenders reply in two ways. Mill may treat the judges' preferences as *evidence* of a pleasure's value rather than what makes it valuable. Or he may be read as a **perfectionist**, someone who values the development of human capacities as such. Some recent commentators also narrow the gap with Bentham, since Bentham's intensity and purity are themselves qualities that could in principle be measured.

## The "Proof" of Utility

Chapter IV of *Utilitarianism* offers Mill's "proof" of the principle. Its key passage reads: "The only proof that a sound is audible, is that people hear it ... In like manner, I apprehend, the sole evidence it is possible to produce that anything is desirable, is that people do actually desire it." David Brink, in the SEP, reconstructs the argument like this:

1. Utilitarianism is true if and only if happiness is the only thing desirable for its own sake.
2. The only proof that something is desirable is that people desire it.
3. Each person desires his or her own happiness.
4. So happiness is desired by the aggregate of all persons.
5. So happiness is desirable.
6. Other things people desire, such as virtue, money or music, are desired as parts of happiness.
7. So happiness is the only thing desirable for its own sake, and utilitarianism is true.

Step 2 seems to trade on an ambiguity: "audible" means *able* to be heard, but "desirable" means *worthy* of being desired. G. E. Moore, in *Principia Ethica* (1903), wrote that "the fallacy in this step is so obvious, that it is quite wonderful how Mill failed to see it": "desired" is not related to "desirable" as "heard" is to "audible". Moore also charged hedonists, Bentham included, with the **naturalistic fallacy**, his name for identifying goodness with a natural property such as pleasure (see *Metaethics: Are There Moral Facts?*). Step 4 seems to commit a fallacy of composition: from each person's desiring his own happiness it does not follow that anyone desires everyone's. And even if the argument showed what is good, it would not show what is right.

Christopher Macleod replies that Mill offers desire only as *evidence* of desirability: evidence that can be overridden but is real, as befits an empiricist who denied any special faculty of moral intuition. Brink, following Hall (1949), reads step 4 as a point about impartiality: prudence aims at one's own happiness, but morality takes up no one's point of view in particular and so aims at happiness as such.

An **act utilitarian** judges each act by its results; a **rule utilitarian** judges acts by rules whose general observance would be best. J. O. Urmson (1953) read Mill as a rule utilitarian, since he speaks of "tendencies" and "secondary principles". Michael Schefczyk notes that the distinction "had not yet been introduced in Mill's days" and reads Mill as an act utilitarian about what is objectively right but a rule utilitarian about moral obligation. Justice, Mill added, concerns what "some individual person can claim from us as his moral right" (see *Justice and Equality*).

```checkpoint
q: Why did Mill's critics say his higher and lower pleasures abandoned hedonism?
a*: Because ranking one pleasure above another of the same quantity seems to appeal to a value besides pleasure.
a: Because Mill denied that pleasure has any value at all.
x: Mill kept pleasure and the absence of pain as the definition of happiness.
a: Because Mill measured pleasures only by intensity and duration.
x: That is Bentham's quantitative approach; Mill added quality.
a: Because Mill said a pig's pleasures are worth more than Socrates's.
x: He said the reverse: "better to be Socrates dissatisfied than a fool satisfied".
hint: Think about what makes a pleasure "higher" if not its amount.
why: Sidgwick, Bradley, Green and Moore all argued that quality is a second value; defenders read the competent judges as giving evidence of value, or Mill as a perfectionist.
---
q: What did Moore mean by comparing "desirable" with "audible"?
a: That desires are perceived through the senses, like sounds.
x: Moore's point concerned the meaning of the words, not perception.
a: That Mill should have used hearing rather than seeing as his example.
x: Mill used both; the problem lies in the analogy itself.
a*: That "audible" means able to be heard, while "desirable" means worthy of desire, so the analogy breaks down.
a: That desirability can be measured, like loudness.
x: Measurement is not the issue; Moore attacked the step from "desired" to "desirable".
hint: What does the "-able" ending mean in each word?
why: Moore held that Mill's step from what people desire to what is desirable equivocated; Macleod replies that Mill offered desire only as defeasible evidence.
```

## A System of Logic

Mill's first great book was *A System of Logic* (1843). **Induction** is inference from observed cases to general conclusions, and Mill gave it pride of place. Nothing, he argued, "ever was, or can be proved by syllogism which was not known, or assumed to be known, before", a point he illustrated with "All men are mortal; Socrates is a man; Socrates is mortal" (on the syllogism itself see *Aristotle*). Mathematics too is inductive, and here, his *Autobiography* says, he aimed to drive intuitionism from its "stronghold". That 2 + 1 = 3 is a generalisation from experience of pebbles and horses: "All numbers must be numbers of something: there are no such things as numbers in the abstract."

The *Logic* also set out methods for finding causes, among them Agreement (what the cases of an effect share) and Difference (what is present when the effect occurs and absent when it does not); they are counted as four or five depending on whether a Joint Method combining these two is counted separately (see *Induction, Probability and Inference to the Best Explanation*).

## On Liberty: One Very Simple Principle

*On Liberty* (1859) confronts the "tyranny of the majority", a phrase from Tocqueville, exercised as much through social pressure as through law. Its remedy is announced in chapter I:

```quote
The object of this Essay is to assert one very simple principle, as entitled to govern absolutely the dealings of society with the individual in the way of compulsion and control, whether the means used be physical force in the form of legal penalties, or the moral coercion of public opinion. That principle is, that the sole end for which mankind are warranted, individually or collectively, in interfering with the liberty of action of any of their number, is self-protection. That the only purpose for which power can be rightfully exercised over any member of a civilized community, against his will, is to prevent harm to others. His own good, either physical or moral, is not a sufficient warrant.
John Stuart Mill · On Liberty, ch. I (Collected Works, ed. Robson, vol. XVIII, p. 223) · 1859
```

Mill never called this the "harm principle"; that name came later. He grounded it in utility, not in natural rights, but "utility in the largest sense, grounded on the permanent interests of man as a progressive being". 

The free-speech argument of chapter II is not simply an application of that principle; the SEP's entry on freedom of speech reads it as partly qualifying it. Mill reasons from every possible case:

1. A silenced opinion may be true; to silence it assumes we are infallible, and no one is.
2. Even if it is false, it may contain part of the truth, since on complex questions truth usually emerges by "the reconciling and combining of opposites".
3. Even if it is wholly false, challenging it keeps a true opinion from becoming "a dead dogma, not a living truth".
4. Unchallenged, a doctrine loses its meaning and is held as "phrases retained by rote".
5. So whatever the truth of an opinion, suppressing it does damage to knowledge, and expression should not be controlled.

The strongest objection is that reasons 1 to 4 tell only against unreliable censors: a perfectly reliable one would silence only falsehoods, such as flat-earthism. Brink replies with Mill's deeper, perfectionist rationale: free discussion is how people exercise the capacities that make them "progressive beings" and hold beliefs as their own, which even accurate censorship destroys; and fallibility counsels keeping discussion open even on improbable views. Mill allowed limits: calling corn dealers "starvers of the poor" may circulate in the press but "may justly incur punishment when delivered orally to an excited mob assembled before the house of a corn dealer".

**Paternalism**, interfering with people for their own good, is ruled out, but Mill made an exception: no one may sell himself into slavery, for "he abdicates his liberty". On offence he may not, as Brink judges, have a consistent view: merely offensive conduct is not to be regulated, yet public "offences against decency" may be. And **legal moralism**, the view that law may enforce morality as such, found champions. James Fitzjames Stephen's *Liberty, Equality, Fraternity* (1873) defended restraint in the interests of morality and religion. Nearly a century later Patrick Devlin, answering the Wolfenden Report on homosexuality in his 1959 lecture, argued that "society means a community of ideas" whose shared morality law may protect; H. L. A. Hart replied in *Law, Liberty and Morality* (1963). These debates continue in *Liberty and Rights*.

## Harriet Taylor Mill and The Subjection of Women

Harriet Taylor Mill (1807–1858) published "The Enfranchisement of Women" in the *Westminster Review* in 1851, prompted by American women's rights conventions. It argued for "equality in all rights, political, civil, and social", and, unlike the later *Subjection*, defended married women's working outside the home. Mill called his share "little more than that of an editor and amanuensis"; as Lucretia Mott put it in 1851, "she says, he wrote it—he says, she wrote it".

How much of Mill's work was hers is a live debate. He called *On Liberty* "more directly and literally our joint production than anything else which bears my name". Minimalists such as Pappe ("Mill without Harriet would still have been Mill") and Richard Reeves discount this; Jo Ellen Jacobs takes Mill at his word. A 2022 stylometric study (a statistical analysis of writing style) concluded that several passages of *On Liberty* were written by her or jointly, and Hackett's 2026 edition is the first to name her as co-author. The SEP's entry on her, revised in 2022, judges the evidence "equivocal".

*The Subjection of Women*, written by 1861 and published in 1869, argued that "the legal subordination of one sex to the other" is "wrong in itself" and should give way to "a principle of perfect equality". Mill said "all that is most striking and profound" in it belonged to his wife. Its argument, following Brink and Macleod, runs:

1. Defenders of subordination say women are naturally unfit for equal rights.
2. But women have always been kept in so "unnatural a state" that their nature has been "greatly distorted and disguised"; character is formed by upbringing.
3. So no one can know women's nature under present conditions, and incapacities produced by discrimination cannot justify that discrimination.
4. So equality is the presumption, and the only test is the "experiment" of equality.
5. Marriage law, which took away a wife's property and legal personality, is a form of slavery: "Marriage is the only actual bondage known to our law. There remain no legal slaves, except the mistress of every house." Consent cannot make it legitimate, any more than one may contract into slavery.

One objection is that wives were treated far better than slaves; Brink replies that gilded cages are still cages, and often not gilded, since husbands could be as violent as masters. A sharper objection, from Annas (1977) and Okin (1979), is internal: Mill assumes that most women, freely choosing, would keep the domestic division of labour, which he calls "in general the most suitable". Brink calls this "a significant blemish", but notes that Mill's own experimental method supplies the means to correct it. Mary Wollstonecraft's earlier case is told in *Women Philosophers of the Early Modern Era*; the later story belongs to *Feminist Philosophy*.

Mill also acted. Elected MP for Westminster in 1865 without canvassing, he presented a women's suffrage petition on 7 June 1866, and on 20 May 1867 moved to replace "man" with "person" in the Reform Bill. The amendment failed, most often reported as by 196 votes to 73 (other counts differ slightly); the chapter on *The Victorian Era* gives the setting. He lost his seat in 1868.

## India and Empire

The same Mill served the East India Company for almost thirty-five years and wrote its defence when the Crown proposed to take over. *On Liberty*'s principle, he wrote, applies only to "human beings in the maturity of their faculties", not to children nor to "backward states of society in which the race itself may be considered as in its nonage"; for such peoples "there is nothing for them but implicit obedience to an Akbar or a Charlemagne, if they are so fortunate as to find one". Colonial rule, he wrote in 1861, is legitimate only as a trust easing a people's "transition to a higher stage of development"; rulers who do not even aim at that are "selfish usurpers". Brink argues the scope limit need not be read as racist, since the test is social and cultural, though questions remain about which societies Mill counted as backward. Uday Singh Mehta argues instead that liberal assumptions about reason and progress themselves fed empire, and Jennifer Pitts traces how Bentham's anti-imperialism gave way to Mill's liberal imperialism. Mill also led the Jamaica Committee's unsuccessful campaign to prosecute Governor Eyre after Morant Bay (see *Scandals in History: Moral Panics, Repression, and Reform* and *Race, Colonialism and Philosophy*).

## Sidgwick and the Point of View of the Universe

Henry Sidgwick (1838–1900) resigned his Cambridge fellowship in 1869 because he could no longer subscribe to the Thirty-Nine Articles, and played what the SEP calls "a guiding role" in founding Newnham, one of the first women's colleges. His *Methods of Ethics* (1874; seventh edition 1907) compares three methods: **egoism** (each should seek his own greatest happiness), **intuitionism** (we know moral rules directly) and utilitarianism. It "marked the culmination of the classical utilitarian tradition".

Sidgwick derived utilitarianism from two "rational intuitions", notably that "the good of any one individual is of no more importance, from the point of view (if I may say so) of the Universe, than the good of any other". But egoism seemed equally rational, and he could not reconcile the two. This **dualism of practical reason** left a "fundamental contradiction", so that "the 'Cosmos' of Duty is thus really reduced to a Chaos". Sidgwick considered escaping by weakening the standards of proof or by postulating a moral government of the universe.

Most controversial is his **esoteric morality**: "it may be right to do and privately recommend, under certain circumstances, what it would not be right to advocate openly", and even this doctrine "should itself be kept esoteric". Bernard Williams called it "Government House" utilitarianism, a label that ties it to colonial rule: one morality for the enlightened few who govern, another for everyone else. Katarzyna de Lazari-Radek and Peter Singer defend it, drawing on Parfit's point that a theory can be self-effacing (advising against its own wide acceptance) without being false. The SEP adds that Sidgwick did not rise above the imperialist and racist tendencies of his era.

```checkpoint
q: What is the strongest objection to the truth-tracking reasons in Mill's free-speech argument?
a: That no opinion is ever partly true.
x: Mill's second reason, that truth is often shared between rival doctrines, is not the target of this objection.
a*: That they condemn only unreliable censors, not a perfectly reliable censor who silences only falsehoods.
a: That Mill wanted to ban all speech that offends.
x: Mill held that merely offensive conduct should not be regulated.
a: That Mill allowed no limits at all on speech.
x: He allowed punishment for inciting an excited mob outside a corn dealer's house.
hint: Ask what would follow if the censor never made mistakes.
why: Reasons about infallibility and partial truth tell only against mistaken censorship; Brink answers with Mill's perfectionist reason, that free discussion develops the capacities of "progressive beings".
---
q: What did Sidgwick call the "dualism of practical reason"?
a: The conflict between Bentham's quantity of pleasure and Mill's quality.
x: That dispute concerns how to measure pleasure, not two rival principles of reason.
a: The gap between what society permits and what the law forbids.
x: That is closer to Mill's distinction between law and social pressure.
a: The difference between public and esoteric morality.
x: Esoteric morality is a separate doctrine about what may be advocated openly.
a*: The standoff between rational egoism and utilitarianism, both of which seemed reasonable.
hint: Think of the three methods he compared and which two he could not reconcile.
why: Sidgwick found both egoism and the "point of view of the Universe" rational, so that "the 'Cosmos' of Duty is thus really reduced to a Chaos".
```

## After the Classical Utilitarians

John Rawls later objected that utilitarianism "does not take seriously the distinction between persons", and Williams that it neglects our integrity; those debates belong to *Consequentialism: What Makes Right Acts Right?*, *Deontology: Duty and Respect* and *Analytic Philosophy since 1950*. Other nineteenth-century answers to the question of how to live are traced in *Marx* and *Nietzsche*.

## Further exploration

- **Richard Reeves, *John Stuart Mill: Victorian Firebrand* (2007).** A lively full biography.
- **Bart Schultz, *The Happiness Philosophers: The Lives and Works of the Great Utilitarians* (2017).** Godwin, Bentham, the Mills and Sidgwick, including their views on empire.
- **Philip Schofield, *Utility and Democracy: The Political Thought of Jeremy Bentham* (2006).** By the long-time director of UCL's Bentham Project.
- **Jo Ellen Jacobs, *The Voice of Harriet Taylor Mill* (2002).** The leading case for her large share in the Mills' work.
- **Katarzyna de Lazari-Radek and Peter Singer, *The Point of View of the Universe: Sidgwick and Contemporary Ethics* (2014).** A defence of Sidgwick, esoteric morality included.
- **Jennifer Pitts, *A Turn to Empire: The Rise of Imperial Liberalism in Britain and France* (2005).** How Bentham's anti-imperialism gave way to Mill's liberal imperialism.
- **Uday Singh Mehta, *Liberalism and Empire: A Study in Nineteenth-Century British Liberal Thought* (1999).** Argues that imperialism followed from liberal premises.$utilitarian_master$,
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
  select $utilitarian_quiz$[
    {"type": "mcq", "prompt": "Which statement about the \"felicific calculus\" is accurate?", "options": ["It is a later label for Bentham's method of weighing pleasures and pains by dimensions such as intensity, duration, fecundity and extent", "It is Bentham's own name for his method, introduced in A Fragment on Government", "It is Mill's method of ranking higher and lower pleasures by competent judges", "It is Sidgwick's term for the dualism of practical reason"], "answerIndex": 0, "explanation": "Bentham set out seven dimensions of value in the Introduction (1789), but he never used the phrase \"felicific calculus\"; it is a later label. He saw the method as a model of ideal reckoning, not something anyone could follow strictly.", "id": "q1"},
    {"type": "mcq", "prompt": "Why did Bentham in 1829 drop \"of the greatest number\" from his formula?", "options": ["Because Mill persuaded him that pleasures differ in quality", "Because the older formula could seem to justify sacrificing a minority to a majority", "Because he had discovered that the phrase came from Hutcheson", "Because he had abandoned the principle of utility"], "answerIndex": 1, "explanation": "In his \"Article on Utilitarianism\" (1829) Bentham spoke simply of the \"greatest happiness principle\", since \"the greatest happiness of the greatest number\" could appear to license sacrificing the few to the many.", "id": "q2"},
    {"type": "mcq", "prompt": "What did G. E. Moore object to in Mill's \"proof\" of utility?", "options": ["That Mill relied on a priori moral intuition", "That Mill counted animals' pleasures", "That Mill moved from what is desired to what is desirable, as if \"desirable\" meant \"able to be desired\" like \"audible\"", "That Mill denied that people desire their own happiness"], "answerIndex": 2, "explanation": "Moore wrote that \"the fallacy in this step is so obvious, that it is quite wonderful how Mill failed to see it\": \"desirable\" means worthy of desire, not capable of being desired. Macleod replies that Mill offered desire only as defeasible evidence.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the current state of the debate over Harriet Taylor Mill's part in On Liberty?", "options": ["Scholars agree that J. S. Mill wrote it alone", "Scholars agree that she wrote the whole of it", "Mill never mentioned her contribution", "It is contested: a 2022 stylometric study and a 2026 edition credit her as co-author, while the SEP finds the evidence \"equivocal\""], "answerIndex": 3, "explanation": "Mill called the book \"more directly and literally our joint production than anything else which bears my name\". Minimalists such as Pappe and Reeves discount her role; Jacobs takes Mill at his word; stylometry supports joint authorship of parts; the SEP (2022) judges the evidence equivocal.", "id": "q4"},
    {"type": "open", "prompt": "Set out Mill's argument in The Subjection of Women that women's supposed natural incapacities cannot justify their legal subordination, and assess the internal objection raised by Annas and Okin.", "rubric": "A strong answer explains that women have been kept in an \"unnatural\" state, so their nature is distorted and unknown; incapacities caused by discrimination cannot justify it; equality is the presumption, tested only by the \"experiment\" of equality; and marriage law is a form of slavery (\"the only actual bondage known to our law\"). It then presents the objection that Mill assumes most women would freely choose the domestic division of labour, which he calls \"in general the most suitable\", and notes Brink's view that this is \"a significant blemish\" that Mill's own experimental method can correct. Credit mention of Harriet Taylor Mill's role and her \"Enfranchisement of Women\" defending married women's work outside the home.", "id": "q5"},
    {"type": "open", "prompt": "Was Mill's limitation of On Liberty's principle to \"human beings in the maturity of their faculties\" a reasonable qualification or an expression of imperialism? Use the chapter's evidence.", "rubric": "A strong answer quotes or describes the scope limitation (\"backward states of society\"; \"implicit obedience to an Akbar or a Charlemagne\"), Mill's career at the East India Company (1823–1858) and his view of colonial rule as a trust whose rulers are \"selfish usurpers\" if they do not aim at the subject people's development. It weighs Brink's reading (the test is social and cultural, so not necessarily racist, though questions remain) against Mehta's argument that liberal assumptions fed empire and Pitts's account of the turn to liberal imperialism, and may note Mill's campaign against Governor Eyre and Williams's \"Government House\" charge against Sidgwick.", "id": "q6"}
  ]$utilitarian_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/utilitarianism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
