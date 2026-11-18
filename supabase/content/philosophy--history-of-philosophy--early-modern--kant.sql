-- Kant — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/kant @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/kant',
    'research',
    'advanced',
    'read',
    $kant_master$> **Immanuel Kant (1724–1804) argued that the mind does not passively copy the world but supplies the forms, space, time and the categories, that any experience of it must take, and that the same reason which gives nature its laws gives us the moral law.** This chapter sets out the synthetic a priori, space and time as forms of intuition, the categories, and the limits of knowledge, including the first antinomy; the categorical imperative, worked through the false promise, with its objections, and autonomy; beauty and the sublime; *Toward Perpetual Peace*; and the debate over his writings on race and on women.

## A Harness Maker's Son in Königsberg

Kant was born on 22 April 1724 in Königsberg, the capital of East Prussia (now Kaliningrad, in Russia), a "relatively cosmopolitan university town" in the words of the Stanford Encyclopedia of Philosophy (SEP). He was the fourth of nine children of a master harness maker; both parents were Pietists. At the Pietist Collegium Fridericianum he reacted against its "forced soul-searching" and took refuge in the Latin classics.

From 1740 he studied at the University of Königsberg, where his favourite teacher, Martin Knutzen, introduced him to Newton. His first publication, *Thoughts on the True Estimation of Living Forces*, is dated 1747 by the SEP and was printed in 1749. After some years as a private tutor he returned to Königsberg in August 1754 and from 1755 lectured, unsalaried and paid by his students, about twenty hours a week. His anonymous *Universal Natural History and Theory of the Heavens* (1755) developed what became the nebular hypothesis.

In 1770, aged 46, he finally gained the chair of logic and metaphysics. There followed his "silent decade", as the Internet Encyclopedia of Philosophy (IEP) calls it, spent on the *Critique of Pure Reason*, which appeared in Riga in 1781 (the "A" edition) and, substantially revised, in 1787 (the "B" edition). Then came a torrent: the *Prolegomena* (1783), "What is Enlightenment?" (1784; see *The Enlightenment and Rousseau*), the *Groundwork of the Metaphysics of Morals* (1785), the *Critique of Practical Reason* (1788), the *Critique of the Power of Judgment* (1790), *Religion within the Boundaries of Mere Reason* (1793), which brought a royal reprimand, and *Toward Perpetual Peace* (1795). He never married, retired from teaching in 1796 and died in Königsberg on 12 February 1804, just short of eighty.

Quotations below follow the Cambridge Edition as quoted in the SEP and IEP: Guyer and Wood's translation of the first *Critique* and Gregor's of the *Groundwork*; other translations are named where used.

{{image: Critique of Pure Reason | The title page of the first edition of the Critique of Pure Reason, published in Riga in 1781.}}

## Woken from a Dogmatic Slumber

Knutzen had been influenced by Wolff (1679–1754), whom Kant later called "the greatest of all dogmatic philosophers" (see *Leibniz*). "Dogmatic" here means claiming knowledge of God, the soul and the world by reason alone, without first asking whether reason can reach that far. Something broke that spell, and Kant told the story twice. In the *Prolegomena* (in the SEP translation of Graciela De Pierris and Michael Friedman): "I freely admit that it was the remembrance of David Hume which, many years ago, first interrupted my dogmatic slumber". Hume had raised a problem about the necessity we attribute to causal connections (see *Berkeley and Hume*); Kant, says the IEP, "generalized" the worry to all metaphysical claims about necessity. Scholars dispute whether the waking came between the late 1750s and the mid-1760s, through the German translation (1755) of Hume's *Enquiry*, or in the mid-1770s, through Beattie's *Essay*, which quoted the *Treatise*. But in a letter to Garve in 1798 Kant gave a different account: it was "the antinomy of pure reason", reason's tendency to prove contradictory conclusions about the world, that first aroused him.

His remedy is announced in the preface to the second edition:

```quote
Up to now it has been assumed that all our cognition must conform to the objects; but all attempts to find out something about them a priori through concepts that would extend our cognition have, on this presupposition, come to nothing. Hence let us once try whether we do not get farther with the problems of metaphysics by assuming that the objects must conform to our cognition.
Immanuel Kant · Critique of Pure Reason, B xvi (Guyer and Wood translation, as quoted in the SEP) · 1787
```

This, Kant says, "would be just like the first thoughts of Copernicus". It is usually called his "Copernican revolution", though Kant never used that phrase. Michael Rohlf in the SEP, following Bird, finds the analogy apt: both factor "contributions from the observer" into explanations of what appears. Critics say it runs backwards: Victor Cousin complained (in the 1854 English edition of his lectures on Kant) that Kant "supposed … that he himself was the centre, and that all moved round him", and the historian of science I. Bernard Cohen called "Kant's alleged Copernican revolution" a myth. The idea itself is plain: "we can cognize of things a priori only what we ourselves have put into them".

## The Synthetic A Priori

Kant's question needs two distinctions. A judgment is **a priori** if it is justified independently of experience, **a posteriori** if it rests on experience. Kant's test for the a priori is necessity and "strict universality": experience can only tell us that all bodies we have weighed are heavy, never that every body must be. A judgment is **analytic** if denying it yields a contradiction ("all bachelors are unmarried") and **synthetic** if it adds something not contained in its subject ("this ball is red").

Analytic judgments are a priori, and most synthetic ones a posteriori. The puzzle is the fourth box: **synthetic a priori** judgments, necessary yet informative. Kant thought mathematics, the foundations of physics and metaphysics all claim to be such, so the *Critique* asks: "how are synthetic a priori judgments possible?" Leibniz had treated necessary truths as analytic; Kant denied that 7 + 5 = 12 is one: "no matter how long I analyze my concept of such a possible sum I will still not find twelve in it." We must go beyond the concepts to intuition, as geometry does in constructing figures. The general debate between reason and experience is traced in *Reason, Experience and Innate Ideas*.

## Space and Time as Forms of Intuition

Knowledge, for Kant, has two sources. **Sensibility** passively receives **intuitions**, singular and immediate representations of particular things; the **understanding** actively applies **concepts**, general representations. Neither works alone: "Thoughts without content are empty, intuitions without concepts are blind." The first part of the *Critique*, the Transcendental Aesthetic, argues that space and time are not features of things as they are in themselves but the forms of our intuition. One argument, from geometry, can be reconstructed in steps, following the IEP:

1. Geometry is known a priori: its truths are necessary.
2. Geometry is synthetic: it goes beyond what is contained in its concepts.
3. Synthetic a priori knowledge of objects requires that the objects be given in a pure, non-empirical intuition.
4. A pure intuition that comes before all objects is possible only if it is a form of our own sensibility.
5. So space is a form of our sensibility.
6. So space is no property of things in themselves.

Kant adds that we cannot represent objects as "outside and alongside one another" unless the representation of space already underlies them, and that we can think of space empty of things but never imagine its absence. He concludes that space has "transcendental ideality" yet "empirical reality": real for everything we could ever encounter, but spoken of "only from the human standpoint". Time is treated in parallel (see *Time*).

The strongest objection is the **neglected alternative**, pressed in the nineteenth century by Adolf Trendelenburg and anticipated by Pistorius in the 1780s. Grant that our representation of space is an a priori form of intuition. Why could things in themselves not also be spatial? As the IEP puts it: "Why can't it be both?" Step 6 does not follow from step 5. Lucy Allais and others reply that Kant's distinctive notion of intuition, as immediate and dependent on our sensibility, closes the gap. And Kant offers an indirect argument: if space and time belonged to things in themselves, reason would be driven into contradictions, the antinomies below. The IEP notes that this second reply may not reach space and time as such.

A second objection, a "long-standard story" perhaps first promoted by Bertrand Russell and Rudolf Carnap, is that **non-Euclidean geometry** and modern logic made Kant's view obsolete; he did assume that we represent space as Euclidean. But commentators today, Lisa Shabel reports, are "broadly united in opposing" the story, reading Kant in the context of the mathematics he knew (as in Michael Friedman's *Kant and the Exact Sciences*); and his philosophy of mathematics later inspired Brouwer's intuitionism.

## The Categories and the "I Think"

If sensibility supplies space and time, the understanding supplies twelve **categories**, pure concepts in four groups of three: quantity (unity, plurality, totality), quality (reality, negation, limitation), relation (substance and accident, cause and effect, community), and modality (possibility, existence, necessity). Kant derived them from the logical forms of judgment: the "if … then" judgment, for example, corresponds to cause and effect.

But what entitles us to apply them to experience? The Transcendental Deduction, which the SEP calls "one of the most complex and difficult texts in the history of philosophy", argues that they are valid because "through them alone is experience possible". Its starting point is the unity of consciousness:

```quote
The I think must be able to accompany all my representations; for otherwise something would be represented in me that could not be thought at all, which is as much as to say that the representation would either be impossible or else at least would be nothing for me.
Immanuel Kant · Critique of Pure Reason, B131–132 (Guyer and Wood translation, as quoted in the SEP) · 1787
```

Against Locke (see *Locke*), Kant held that self-consciousness does not come from accompanying each representation with consciousness but from "adding one representation to the other and being conscious of their synthesis". In the IEP's sketch, unified experience requires this unity of apperception; that requires distinguishing how things merely seem to me from how they objectively are; that requires representing objects by rules; and the rules are the categories. Hence the understanding is, in the SEP's phrase, the law-giver of nature: "we ourselves bring into the appearances that order and regularity that we call nature". Among the results is Kant's answer to Hume: the principle that every event has a cause holds necessarily for every possible experience. A "Refutation of Idealism" added in 1787 argued, against Descartes (see *Descartes*), that knowing my inner states in time requires something permanent outside me.

## Appearances and Things in Themselves

We know only **appearances**; what things are "in themselves" "remains entirely unknown to us". This is transcendental idealism ("transcendental" means concerning the conditions that make experience possible), and the SEP says there is "no such thing as the standard interpretation" of it. On the **two-world** reading, defended by Guyer, Strawson and Van Cleve, appearances and things in themselves are distinct objects; critics, from Jacobi in 1787, ask how we could know that unknowable things exist and affect us. On Henry Allison's **epistemic two-aspect** reading, there is one world considered from two standpoints, the human one and that of an intellect that could intuit things directly; critics say this trivialises Kant. Langton and Allais defend a **metaphysical** dual-aspect reading (the SEP classes it with two-aspect views, though Langton herself opts for a non-identity version): things in themselves have intrinsic properties we cannot know, while appearances are their relational properties. Langton, for whom "Humility" is our ignorance of things' intrinsic properties, rejects Allison's epistemic version, so even the two-aspect readers are divided.

## The Limits of Reason: Soul, World and God

Reason forms three ideas, the soul, the world as a whole and God, and cannot help treating them as known objects: "transcendental illusion". The **paralogisms** expose rational psychology, the would-be science of the soul: from the bare "I think" nothing follows about a soul that is a simple, self-identical substance, because we have no intuition of the self. The **ideal of pure reason** shows that the three possible proofs of God, ontological, cosmological and design, all fail. Against the ontological argument Kant made several objections (sources count them differently), most famously that existence is not a real predicate: it is the mere "positing" of a thing and adds nothing to its concept, as Kant illustrated with a hundred thalers (see *Early Scholasticism: Anselm, Abelard and the Universities* and *God: Arguments For and Against*). Yet he said the design argument "always deserves to be mentioned with respect".

Only the idea of the world produces **antinomies**: pairs of proofs, thesis and antithesis, that seem equally compelling. There are four: on the world's beginning and limits, on simple parts, on freedom, and on a necessary being. The thesis of the first, in paraphrase, runs:

1. Suppose the world had no beginning in time.
2. Then up to the present moment an infinite series of states has elapsed.
3. But an infinite series is one that can never be completed by successive addition.
4. So an infinite series cannot have elapsed.
5. So the world had a beginning in time.

The antithesis argues the opposite: if the world began, an empty time preceded it, and nothing can come to be in empty time. Kant's diagnosis is that the conflict arises only if the world is taken as a thing in itself. For the first two antinomies he held that thesis and antithesis are both false, like contraries rather than contradictories: the world of appearances is neither determinately finite nor infinite but, in his term, "indefinitely" large. For the last two, both may be true, one of appearances and the other of things in themselves. So the antinomies form an indirect proof of transcendental idealism.

The objection, pressed by Broad in 1955, is that step 3 defines infinity by a mental act of running through a series, which begs the question against a realist for whom an infinite past could simply exist. Allison replies that Kant's claims about synthesis are conceptual truths about infinity (see *Paradoxes: the Liar, the Heap and Zeno*).

```checkpoint
q: What makes a judgment "synthetic a priori" for Kant?
a*: It is necessary and knowable independently of experience, yet adds something not contained in its concepts.
a: It is true by definition, so denying it is a contradiction.
x: That describes an analytic judgment, such as "all bachelors are unmarried".
a: It is learned from repeated experience and so holds generally.
x: Experience gives only "comparative universality"; necessity and strict universality mark the a priori.
a: It concerns things in themselves rather than appearances.
x: Kant held that synthetic a priori knowledge is possible only of appearances, not of things in themselves.
hint: Think of Kant's example, 7 + 5 = 12.
why: Kant held that "twelve" is not found by analysing "seven plus five", yet the sum is necessary; mathematics, physics and metaphysics all claim such judgments.
---
q: What is the "neglected alternative" objection to Kant's argument about space?
a: That space is learned from experience after all.
x: The objection grants that our representation of space is a priori.
a: That non-Euclidean geometry shows space is not Euclidean.
x: That is a separate objection, associated with Russell and Carnap.
a*: That space could be both a form of our intuition and a property of things in themselves.
a: That Kant forgot time and dealt only with space.
x: Kant treats time in parallel with space.
hint: The IEP sums it up as "Why can't it be both?"
why: Trendelenburg (anticipated by Pistorius) argued that Kant's conclusion that things in themselves are not spatial does not follow; Allais and Allison reply from Kant's account of intuition, and Kant from the antinomies.
```

## The Categorical Imperative

The *Groundwork* begins with the **good will**, the only thing good without qualification: even if it achieved nothing, "like a jewel, it would still shine by itself". An act has moral worth when done from duty, out of respect for the moral law. We act on **maxims**, personal principles such as "to increase my wealth by every safe means". **Hypothetical imperatives** bind us only if we want some end; morality commands **categorically**, whatever we want. Kant gave the categorical imperative several formulas. The Formula of Universal Law: "act only in accordance with that maxim through which you can at the same time will that it become a universal law". The Formula of Humanity: "So act that you use humanity, whether in your own person or in the person of any other, always at the same time as an end, never merely as a means". There are also formulas of autonomy and of a "kingdom of ends". Kant called them "so many formulations of precisely the same law"; how is disputed.

His second example, the false promise, shows the test at work. Following the SEP, which adapts Onora O'Neill's and John Rawls's four-step procedure, the test runs:

1. Maxim: I will make a lying promise (say, to get money I need) whenever that gets me what I want.
2. Universalise it as a law of nature: everyone makes lying promises whenever it gets them what they want.
3. In such a world no practice of giving one's word could exist, and everyone would know it.
4. But my maxim needs that practice: lying promises work only where promises are trusted.
5. So I cannot even conceive my maxim as universal law without contradiction: a world with promises and a world without them.
6. So there is a strict, or "perfect", duty never to act on it.

The contradiction lies not in the maxim but in its universalisation. Where a maxim can be conceived universally but not consistently willed, as with never helping others, the duty is "imperfect", leaving latitude in how to fulfil it.

The deepest objection is Hegel's charge of **empty formalism** (*Philosophy of Right* §135): a purely formal test cannot generate content, and seems to work only by presupposing institutions, such as property in Kant's example of a deposit, that it should be justifying. Kantians reply that the test does generate contradictions, so it is not empty, and that the Formula of Humanity supplies content of its own; Freyenhagen judges the exchange a "stand-off". A related worry is **false positives and negatives**: wrong maxims seem to pass if worded narrowly enough (a false promise to one named person on one date), and harmless ones to fail. Allison replies that such rules are not genuine maxims.

Most notorious is the **murderer at the door**. In "On a Supposed Right to Tell Lies from Benevolent Motives" (1797), replying to Benjamin Constant, Kant refused to permit a lie even to a would-be murderer: a lie "does harm to humanity in general, inasmuch as it vitiates the very source of right" (Abbott's translation). Korsgaard (1986) argued that lying to a deceiver passes the universal-law test; Varden reads the essay as legal philosophy; Jens Timmermann (2025) rejects Kant's legal argument against Constant but upholds an ethical duty of truthfulness. The Formula of Humanity forbids treating people as *mere* means, not as means at all: we use a taxi driver, but not as we use a horse. These debates continue in *Deontology: Duty and Respect*.

## Autonomy and Freedom

The moral law, Kant insisted, is not imposed from outside but given by reason to itself: **autonomy**, self-legislation, which the SEP calls the "fundamental idea" of his philosophy. Freedom and the moral law "reciprocally imply each other". Yet every event in nature has a cause. The third antinomy resolves the clash: as appearances, our actions are causally determined; as things in themselves we may be free, though we cannot know it theoretically. Practically, we know the moral law as a "fact of reason", and through it our freedom. Kant's example is a man ordered by his prince, under threat of immediate execution, to give false testimony: he "judges … that he can do something because he is aware that he ought to do it". Critics ask how a free self beyond appearances could answer for deeds in the determined world (see *Free Will and Determinism*). Practical reason also "postulates" God and immortality as conditions of the highest good. This is what Kant meant in the first *Critique*: "I had to deny knowledge in order to make room for faith".

## Beauty and the Sublime

The *Critique of the Power of Judgment* (1790) analyses the **judgment of taste**, the judgment that something is beautiful, in four "moments". Its pleasure is **disinterested**, independent of any desire for the object, unlike pleasure in the agreeable or the good. It claims **universal** agreement, yet not on the basis of concepts, so it cannot be proved: "beauty is not a concept of the object" (Guyer and Matthews's Cambridge translation, as quoted in the SEP). It finds in the object a merely formal purposiveness, a design-like order serving no definite purpose, which commentators summarise as "purposiveness without a purpose". And it claims **necessity**, resting on a "common sense" shared by all. Beauty arises from the free play of imagination and understanding.

The **sublime** is pleasure mixed with displeasure. In the mathematical sublime, imagination fails to take in something vast, revealing a faculty of mind that "surpasses every standard of sense"; in the dynamical sublime, overhanging cliffs, thunder clouds, volcanoes and hurricanes show nature as a power with "no dominion over us". Beauty becomes the "symbol of morality", and judgment bridges what Kant called the "great gulf" between nature and freedom (see *Beauty and Taste*).

## Toward Perpetual Peace

Kant's principle of right holds an action right if it "can coexist with everyone's freedom in accordance with a universal law". *Toward Perpetual Peace* (1795) applies it between states. Six **preliminary articles** forbid peace treaties with secret reservations for future war, the acquisition of one state by another, standing armies (to be abolished gradually), national debt for foreign affairs, forcible interference in another state's constitution, and acts of war that would make later peace impossible. Three **definitive articles** require that every state's constitution be republican, so that the people who bear the costs of war decide whether to wage it; that states form a federation of free states; and that cosmopolitan right be limited to "universal hospitality", a right to visit, not to settle. A world republic remained an "idea"; the voluntary league is its "negative surrogate", and scholars still dispute which Kant preferred. Doyle linked the first article to the democratic peace thesis (see *History of Peace and Peacemaking*). In the 1790s Kant also strongly criticised European colonisation.

## Race, Women and Citizenship

Kant was also a theorist of race. In "Of the Different Races of Human Beings" (1775, revised 1777) he argued that all humans descend from a common root, with climate triggering "seeds" that produced four races; in 1785 he defined the concept further, and in 1788 he defended it against Georg Forster's criticism, arguing for the unity of the human species. Earlier, in *Observations on the Feeling of the Beautiful and Sublime* (1764), he drew on a footnote to Hume's "Of National Characters" (see *Berkeley and Hume*); in Guyer's Cambridge translation: "The Negroes of Africa have by nature no feeling that rises above the ridiculous. Mr. Hume challenges anyone to adduce a single example where a Negro has demonstrated talents …".

How this bears on his philosophy is debated. Emmanuel Chukwudi Eze's "The Color of Reason" (1995) brought the issue to Western philosophers' attention; Robert Bernasconi argues that Kant "supplied the first scientific definition of race"; Charles Mills pressed the case in "Kant's *Untermenschen*" (2005) and argued in 2017 that Kant has been "sanitized for public consumption". Pauline Kleingeld ("Kant's Second Thoughts on Race", 2007) accepts that Kant defended a racial hierarchy until at least the late 1780s but argues that by 1795 he became "more egalitarian", condemning colonialism, chattel slavery and the slave trade; Frederick Rauscher likewise finds that by the mid-1790s Kant "appears to have given up" beliefs in racial inferiority. Huaping Lu-Adler replies (2022, 2023) that Kant's late remarks treat slavery and colonialism as obstacles to progress and perpetual peace, viewed as a "disinterested philosopher of history" rather than as a moral problem, and that he held "a consistent inegalitarian position" throughout. Allais ("Kant's Racism", 2016) is among those who confront it while defending the wider philosophy. The debate continues in *Race, Colonialism and Philosophy*.

Women fare no better in Kant. The *Observations* assigns women a feeling for the beautiful, men for the sublime, and says a woman who disputes about mechanics like the Marquise du Châtelet "might as well even have a beard" (Goldthwait's translation; see *Women Philosophers of the Early Modern Era*). In his political writings voting requires being "one's own master". Women, children and economic dependants are "passive citizens" with freedom and equality but no vote; others might work their way up, while women were excluded on supposedly "natural" grounds. Kant himself admitted, in the SEP's rendering, that "It is, I admit, somewhat difficult to determine what is required in order to be able to claim the rank of a human being who is his own master." Rauscher notes that his views are "considered sexist and racist universally today", and "out of step with some of his more progressive colleagues". Scholars such as Herman and Varden have sifted his views on marriage, which left husbands in legal rule over wives (see *Feminist Philosophy*).

```checkpoint
q: In the false-promise example, where does the contradiction appear?
a: In the maxim itself, which contradicts itself as soon as it is stated.
x: The SEP stresses there is no self-contradiction in the maxim; it appears only on universalisation.
a*: When the maxim is universalised: a world of universal lying promises could contain no practice of promising, which the maxim needs.
a: In the bad consequences of lying for the person deceived.
x: The test is not about consequences but about whether the maxim can be conceived as universal law.
a: In the conflict between the promise and the promiser's desires.
x: Desires do not enter the test; the issue is whether the maxim can be universal law.
hint: Imagine everyone acting on the maxim.
why: Universalised, the maxim destroys the practice of taking others' word that it relies on, so it cannot even be conceived as law; hence a perfect duty.
---
q: What is Kleingeld's "second thoughts" thesis about Kant on race, and who disputes it?
a: That Kant was never a racist; Eze disputes it.
x: Kleingeld accepts that Kant defended a racial hierarchy until at least the late 1780s.
a: That Kant became more racist late in life; Rauscher disputes it.
x: Kleingeld argues the opposite, and Rauscher broadly agrees with her.
a: That Kant's race theory was invented by Hume; Bernasconi disputes it.
x: Kant drew on Hume, but Bernasconi credits Kant with the first scientific definition of race.
a*: That Kant became more egalitarian by the mid-1790s; Lu-Adler argues he held a consistent inegalitarian position.
hint: Think of Toward Perpetual Peace (1795).
why: Kleingeld (2007) argues Kant rejected colonialism, chattel slavery and the slave trade by 1795; Lu-Adler (2022, 2023) reads the late remarks as concern for progress, not a change of moral view.
```

## Kant's Legacy

Reinhold, Fichte, Schelling and Hegel built on and against Kant (see *German Idealism: Fichte, Schelling and Hegel*), though Kant publicly repudiated Fichte in 1799. Schopenhauer read the thing in itself as Will. His philosophy of mathematics provoked Frege, Russell and Husserl; his ethics shaped Rawls and Habermas. The SEP calls him "the central figure in modern philosophy", who "set the terms for much of nineteenth and twentieth century philosophy".

## Further exploration

- **Manfred Kuehn, *Kant: A Biography* (2001).** The standard biography.
- **Henry E. Allison, *Kant's Transcendental Idealism: An Interpretation and Defense* (2004).** The revised edition of the classic (1983) two-aspect, epistemic reading.
- **Lucy Allais, *Manifest Reality: Kant's Idealism and His Realism* (2015).** A metaphysical one-world reading, with a reply to the neglected alternative.
- **Christine M. Korsgaard, *Creating the Kingdom of Ends* (1996).** Essays on the formulas of the categorical imperative, including "The Right to Lie".
- **Pauline Kleingeld, *Kant and Cosmopolitanism* (2012).** Perpetual peace and cosmopolitan right.
- **Huaping Lu-Adler, *Kant, Race, and Racism: Views from Somewhere* (2023).** The case for a consistently inegalitarian Kant.
- **Charles W. Mills, *Black Rights/White Wrongs: The Critique of Racial Liberalism* (2017).** Includes his critique of Kant.$kant_master$,
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
  select $kant_quiz$[
    {"type": "mcq", "prompt": "What did Kant say first woke him from his 'dogmatic slumber'?", "options": ["In the Prolegomena (1783), the remembrance of Hume; in a 1798 letter to Garve, the antinomy of pure reason", "Only Rousseau's Emile, as he said in every account", "Only Leibniz's monadology, as he said in the Critique of Pure Reason", "Copernicus's astronomy, which he said had launched his 'Copernican revolution'"], "answerIndex": 0, "explanation": "Kant gave two accounts: the Prolegomena credits 'the remembrance of David Hume', while the 1798 letter to Garve credits 'the antinomy of pure reason'. Kant never used the phrase 'Copernican revolution'; he compared his idea to Copernicus's 'first thoughts'.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these does Kant treat as a synthetic a priori judgment?", "options": ["All bachelors are unmarried", "This ball right here is red", "7 + 5 = 12", "All bodies we have weighed so far are heavy"], "answerIndex": 2, "explanation": "Kant argued that no analysis of 'seven plus five' yields 'twelve', yet the sum is necessary, so it is synthetic a priori. The bachelor judgment is analytic; the ball and the weighed bodies are a posteriori.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about readings of Kant's transcendental idealism is correct?", "options": ["Allison and Langton both defend the two-world reading against Guyer", "Guyer defends a two-world reading, Allison an epistemic two-aspect reading, and Langton a metaphysical dual-aspect reading of intrinsic and relational properties that rejects Allison's", "All scholars now agree on a single standard interpretation", "Langton defends the two-world reading, while Guyer and Allison defend two aspects"], "answerIndex": 1, "explanation": "The positions are two worlds (Guyer, Strawson, Van Cleve), epistemic two aspects (Allison), and a metaphysical dual-aspect reading of intrinsic and relational properties (Langton, Allais). The SEP says there is 'no such thing as the standard interpretation'.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these is one of the three definitive articles of Toward Perpetual Peace (1795)?", "options": ["Standing armies shall be abolished", "No state shall acquire another state", "There shall be a single world government with a common army", "Cosmopolitan right shall be limited to conditions of universal hospitality"], "answerIndex": 3, "explanation": "The definitive articles require republican constitutions, a federation of free states, and cosmopolitan right limited to 'universal hospitality' (a right to visit, not to settle). Gradually abolishing standing armies and forbidding acquisition of states are preliminary articles; a world republic remained an 'idea', with the league as its 'negative surrogate'.", "id": "q4"},
    {"type": "open", "prompt": "Set out Kant's argument that space is a form of our intuition, step by step. Then state the 'neglected alternative' objection and the best replies to it.", "rubric": "A strong answer defines intuition (singular, immediate, from sensibility) and concept (general, from the understanding), and gives the steps: geometry is known a priori (necessary); geometry is synthetic; synthetic a priori knowledge of objects requires that they be given in a pure intuition; a pure intuition prior to objects is possible only as a form of our sensibility; so space is a form of our sensibility; so it is no property of things in themselves. It may add the metaphysical exposition (space must already underlie representing things 'outside and alongside one another'; we cannot imagine the absence of space). It states the objection associated with Trendelenburg (anticipated by Pistorius): even if our representation of space is a priori, things in themselves might also be spatial ('Why can't it be both?'), so the last step does not follow. Replies: Allais and Allison appeal to Kant's account of intuition as immediate and sensibility-dependent; Kant's indirect argument from the antinomies (though the IEP notes it may not address space as such). Credit mention of the non-Euclidean geometry objection (Russell, Carnap) and the commentators' historical reply (Friedman, Shabel).", "id": "q5"},
    {"type": "open", "prompt": "Using the false promise, explain how Kant's Formula of Universal Law is meant to work. Then assess one major objection to it (Hegel's 'empty formalism', false positives and negatives, or the murderer at the door) and a Kantian reply.", "rubric": "A strong answer quotes or paraphrases the formula ('act only in accordance with that maxim through which you can at the same time will that it become a universal law', Gregor), explains maxims and the hypothetical/categorical distinction, and works the steps: the maxim of making lying promises when it gets me what I want; universalised, no practice of giving one's word could exist; but the maxim needs that practice; so it cannot be conceived as universal law (contradiction in conception, perfect duty), the contradiction appearing only on universalisation. It contrasts perfect and imperfect duties. For the objection: Hegel's charge that a formal test yields no content or presupposes institutions such as property (reply: the test does generate contradictions, and the Formula of Humanity supplies content; Freyenhagen calls it a stand-off); or narrow maxims that pass and harmless ones that fail (Allison: not genuine maxims); or Kant's refusal to allow a lie to a would-be murderer (Korsgaard: lying to a deceiver passes the universal-law test; Varden: a legal reading; Timmermann: rejects the legal argument but keeps an ethical duty of truthfulness). Credit mention of the Formula of Humanity's 'merely as a means'.", "id": "q6"}
  ]$kant_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/kant', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
