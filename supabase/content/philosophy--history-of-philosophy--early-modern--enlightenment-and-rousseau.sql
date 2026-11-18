-- The Enlightenment and Rousseau — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/enlightenment-and-rousseau @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/enlightenment-and-rousseau',
    'research',
    'advanced',
    'read',
    $enlightenment_master$> **The Enlightenment set out to test every authority by reason, and its sharpest critic, Jean-Jacques Rousseau (1712–1778), came from inside it.** This chapter asks what "Enlightenment" meant and whether there was one or several; follows the *philosophes* and their *Encyclopédie*, Voltaire, Montesquieu, the materialists and Condorcet, and the Scottish Enlightenment of Hutcheson, Smith and Reid; sets out step by step Rousseau's case that inequality is made by history, and his answer in *The Social Contract*, with the quarrel over whether the "general will" is a charter of freedom or of tyranny; and ends with the people the Enlightenment left out, those who took part anyway, and its first critics.

## Dare to Be Wise

In December 1784 the *Berlinische Monatsschrift* printed Kant's answer to a question the Reverend Johann Friedrich Zöllner had posed a year earlier: what is enlightenment? Enlightenment, in the Stanford Encyclopedia of Philosophy's rendering, is "humankind's release from its self-incurred immaturity", and "immaturity is the inability to use one's own understanding without the guidance of another". Its motto, *sapere aude*, is usually translated "dare to know"; Kant's translator Gregor glosses it more literally as "dare to be wise", and renders Kant's gloss "Have courage to make use of your own understanding!" (see *Kant*).

For its participants enlightenment was "not an historical period, but a process"; historians have never agreed on its dates, though French ones usually place the *Siècle des Lumières* between 1715 and 1789. Was there one Enlightenment or several? Three answers compete. Jonathan Israel distinguishes a **radical Enlightenment**, founded on a materialism first set out by Spinoza and leaning to religious scepticism and democracy, from a **moderate Enlightenment** (Descartes, Locke, Wolff) that sought accommodation with traditional power and faith; Spinoza and Spinozism, he argues, "were in fact the intellectual backbone of the European Radical Enlightenment everywhere" (see *Spinoza*). His critics, among them Theo Verbeek, Harvey Chisick, Anthony La Vopa, Antoine Lilti, Samuel Moyn and Dan Edelstein, reached what one reviewer called a "strikingly unanimous verdict": that Israel worships a false idol in Spinoza and an unsustainable idea, a direct link between **metaphysical monism** (the view that there is only one substance) and political radicalism. J. G. A. Pocock wrote instead of several **Enlightenments**, national and confessional. John Robertson, comparing Scotland and Naples, argued against that fragmentation for a single Enlightenment, united by its commitment to political economy as the means of improvement. (The History chapter *The Enlightenment* tells the social story.)

## The Philosophes and the Encyclopédie

The Stanford Encyclopedia finds the movement's heart in the "loosely organized activity" of mid-century French thinkers, the **philosophes**: Voltaire, d'Alembert, Diderot, Montesquieu. Their great project began in 1745 as a plan to translate Ephraim Chambers's *Cyclopaedia* and became the *Encyclopédie* ("Systematic Dictionary of the Sciences, Arts and Crafts"), published from 1751 to 1772 in 17 volumes of text and 11 of plates, with over 70,000 articles by more than 140 contributors. It was dedicated to three empiricists, Bacon, Locke and Newton; d'Alembert's *Preliminary Discourse* (1751) mapped the sciences on Bacon's model and put reason above religious authority. Its orientation was, in the Stanford Encyclopedia's words, "decidedly secular and implicitly anti-authoritarian".

Opposition came from the Jesuits and from a run of scandals. D'Alembert withdrew in 1758, leaving Diderot in sole charge, and in 1759 the government revoked the work's privilege. Diderot carried on in secret, protected by Malesherbes and Madame de Pompadour, and the last ten volumes of text appeared together in 1765 under a false imprint. On slavery it was ambivalent: some articles reported or defended it, while Jaucourt attacked the slave trade in "Traite des nègres".

## Voltaire

François-Marie Arouet (1694–1778) took the name Voltaire in 1718, after a spell in the Bastille for a satirical verse. A quarrel with the Chevalier de Rohan sent him to England from 1726 to 1729, and the result was the *Letters on the English*, published first in English in 1733 and in French in 1734. It fused Bacon, Locke and Newton into what the Stanford Encyclopedia calls "an English philosophical complex" set against Descartes. The French edition was burned, and Voltaire fled with Émilie du Châtelet to Cirey.

He was a **deist**, believing in a creator known by reason rather than revelation, and signed letters "Écrasez l'infâme!", "Crush the infamy!", meaning, the Stanford Encyclopedia stresses, the Church, not religion as such. The Lisbon earthquake of 1 November 1755 drew from him a poem against optimism and then *Candide* (1759), whose tutor Pangloss insists that all is for the best (see *Leibniz*); it ends with the advice "we must cultivate our garden". When Jean Calas, a Protestant merchant of Toulouse, was broken on the wheel on 10 March 1762 after his son was found dead, Voltaire's campaign won the annulment of the sentence in 1764 and a formal exoneration in 1765, and produced the *Treatise on Tolerance* (1763), which asks whether the Turk, the Chinese and the Jew are our brothers, and answers "Yes, without doubt". Yet he also wrote hostile passages about Jews and held that the races had separate origins (**polygenism**). And the line most often quoted as his, "I disapprove of what you say, but I will defend to the death your right to say it", was written by Evelyn Beatrice Hall in 1906 to sum up his attitude.

## Montesquieu

Montesquieu, born near Bordeaux in January 1689, presided over the criminal division of the Bordeaux Parlement. His *Persian Letters* (1721) satirised France through Persian travellers' eyes, though Usbek, enlightened abroad, is a despot in his harem.

*The Spirit of the Laws* (1748) sorted governments into republics, monarchies and despotisms and argued that laws vary with climate, soil and population. Liberty is "a tranquillity of mind arising from the opinion each person has of his safety", and it needs institutions, because "constant experience shows us that every man invested with power is apt to abuse it", so "power should be a check to power". Hence the **separation of powers**, legislative, executive and judicial, taken up by Madison and the United States constitution; Shklar called his liberalism "a liberalism of fear".

On slavery he was mixed. Slavery, he wrote, "is in its own nature bad", and an ironic chapter lists pro-slavery arguments without comment, including that "Sugar would be too dear if the plants which produce it were cultivated by any other than slaves". Yet he also held that in very hot countries slavery is "more reconcilable to reason". Quoting only the irony misses half his position.

## Materialists and the Idea of Progress

Diderot (1713–1784), imprisoned for three months at Vincennes after his *Letter on the Blind* (1749), moved toward a "vital materialism": his "modern Spinozists" hold that "matter is sensitive", as an inert egg becomes a feeling creature by warmth alone. Late in life he became a "passionate abolitionist", writing for the abbé Raynal's *History of the Two Indies* imagined speeches by enslaved Africans against the imperial system. D'Holbach, whose circle included many avowed atheists, published *The System of Nature* anonymously; the Parlement of Paris had it burned.

Condorcet (born 1743), proscribed in 1793 for opposing the Jacobin constitution, wrote in hiding the *Sketch for a Historical Picture of the Progress of the Human Mind*, ten epochs of "the paradigmatically Enlightenment view" of history as continual progress to perfection. He died in his prison cell in late March 1794; his widow, Sophie de Grouchy, published the *Sketch* in 1795.

## The Scottish Enlightenment

In Scotland, philosophy was "at the core" of the Enlightenment. Francis Hutcheson (1694–1746), Irish-born professor at Glasgow, was with Shaftesbury a founder of **moral sense theory**: we perceive virtue and vice through a sense, rather as we perceive beauty (see *Beauty and Taste*). His pupil Adam Smith (1723–1790) published *The Theory of Moral Sentiments* in 1759, seventeen years before *The Wealth of Nations* (taken up in the Economics subject's *Introduction*). It opens: "How selfish soever man may be supposed, there are evidently some principles in his nature, which interest him in the fortune of others, and render their happiness necessary to him."

Smith's **sympathy** works by imagination: we imagine how we would feel in another's place, a "projective" account, in Samuel Fleischacker's terms, against Hume's "contagion" of feeling (see *Berkeley and Hume*). A feeling deserves approval if a well-informed **impartial spectator** would sympathise with it; internalised, that spectator is conscience, and so a person desires "not only praise, but praiseworthiness". Smith reviewed Rousseau's *Discourse on Inequality*; whether he endorsed commercial society or shared Rousseau's fears about it is still argued.

Thomas Reid (1710–1796), Smith's successor at Glasgow, attacked the "way of ideas" from Locke to Hume, the theory that we perceive only mental representations, as a doctrine leading straight to scepticism (one of its claims, about how perception begins, he called "all fiction, without any foundation in nature"). We perceive external things directly, and first principles of **common sense**, with "the consent of ages and nations, of the learned and unlearned", need no proof; to deny them is "not only false but absurd". Adam Ferguson's *Essay on the History of Civil Society* (1767) doubted that progress had made people happier.

## Rousseau: the Insider Who Turned

{{image: Jean-Jacques Rousseau | Portrait of Jean-Jacques Rousseau, c. 1753}}

Rousseau was born in Geneva on 28 June 1712, a watchmaker's son. He came to Paris in 1742, met Diderot and wrote music articles for the *Encyclopédie*. In 1749, walking to visit Diderot in prison, he read the Dijon Academy's prize question, whether the restoration of the sciences and arts had tended to purify morals, and had an illumination: that humankind is good by nature and corrupted by society. His answer, no, won the prize in 1750. His five children by Thérèse Levasseur were all left at the foundling hospital, "an almost certain sentence of death in eighteenth-century France", in the Stanford Encyclopedia's words.

He came to regard philosophers as rationalisers of self-interest, and the *Letter to d'Alembert* (1758) sealed his break with the *philosophes*. In 1762 *The Social Contract* and *Emile* were both condemned in Geneva, and *Emile* in Paris, for religious heterodoxy. In England with Hume in 1766, he became wrongly convinced that Hume was at the centre of a plot against him. He died at Ermenonville on 2 July 1778 (the IEP gives 3 July); his posthumous *Confessions* made him the pioneer of modern autobiography. Rousseau is quoted below in G. D. H. Cole's translation (1913) or, where marked, in the *Collected Writings* edited by Roger Masters and Christopher Kelly.

## The Discourse on Inequality

In 1754 Rousseau answered a second Dijon question (his reply was published in 1755), on the origin of inequality and whether natural law authorises it. He did not win. Following the Stanford and Internet Encyclopedias of Philosophy, the argument runs:

1. **Method.** To judge society, strip away what socialisation has added and look at natural human beings.
2. **Against Hobbes.** Earlier theorists, in the IEP's summary, took civilised people and simply removed laws and government. A war of all against all needs property, foresight and seeing others as threats, which develop only in history. Natural man, in the IEP's summary, is isolated, timid, peaceful and mute (see *Hobbes*).
3. **Two natural principles.** He has *amour de soi*, self-love aimed at self-preservation, and pity, "an innate repugnance to see his fellow suffer" (Masters–Kelly). Neither is yet moral.
4. **Freedom and perfectibility.** Humans can resist appetite, and have **perfectibility**, the capacity to learn and change. These make development, and the fall, possible.
5. **Comparison.** Settled communities bring comparison, and with it ***amour-propre***: self-love that depends on others' opinion, a need for recognition that can become pride or vanity. Agriculture, metallurgy and the division of labour follow, and property divides owners from the rest.
6. **Property.** "The first man who, having enclosed a piece of ground, bethought himself of saying This is mine, and found people simple enough to believe him, was the real founder of civil society."
7. **Dependence.** Mutual need joined to inflamed *amour-propre* breeds domination, flattery and pretence.
8. **The fraudulent contract.** A war of rich and poor leads the rich to propose a political order that protects their property: "All ran to meet their chains thinking they secured their freedom" (Masters–Kelly). **Conclusion:** inequality is not natural; history made it, and a rigged contract fixed it in place.

The Stanford Encyclopedia hears in the last step "an echo of Locke and an anticipation of Marx".

**First objection: natural goodness is incoherent.** If everyone is good by nature, how does evil get a foothold? And if morality is not natural, "good" cannot mean morally good. *Reply:* natural goodness is negative, the absence of evil; corruption comes from the structure of dependence and comparison, not from wicked individuals.

**Second objection: there never was such a state.** Adam Ferguson replied in 1767 that there are no records of a pre-social condition; people have always lived in society, so the state of nature is a social state, and history and travellers' reports should replace conjecture. *Reply:* Rousseau himself said the state of nature may never have existed. On Frederick Neuhouser's reading (2014) the story is a philosophical device separating what is natural in us from what is artificial, not a history; Kelly (2006) contests that reading.

**Third objection: *amour-propre* is simply evil,** so the story leaves no way out. Older readings (Charvet) took it as wholly bad. *Reply:* Dent and Neuhouser read it as both the cause of the fall and the promise of redemption, capable of healthy forms under the right education and institutions, the programme of *Emile* and *The Social Contract*; McLendon (2019) pushes back.

```checkpoint
q: What role does amour-propre play in Rousseau's Discourse on Inequality?
a*: It is a self-love that depends on others' opinion, born of comparison in settled communities, and with dependence it drives domination and inequality.
a: It is the instinct for self-preservation that natural man shares with animals.
x: That is amour de soi; amour-propre arises only once people live together and compare themselves.
a: It is the natural pity that restrains self-interest in the state of nature.
x: Pity, "an innate repugnance to see his fellow suffer", is the second natural principle, not amour-propre.
a: It is Hobbes's term for the desire for glory, which Rousseau accepts unchanged.
x: Rousseau's point against Hobbes is that such passions develop historically; they are not part of natural man.
hint: It appears at the stage when people begin to live in settled communities.
why: Amour-propre is comparative self-love, the need for recognition. In the Second Discourse it turns interdependence into domination; some readers (Dent, Neuhouser) think it can also take healthy forms.
---
q: What was Adam Ferguson's objection to the state-of-nature stories of Hobbes and Rousseau?
a: That the state of nature was a war of all against all, as Hobbes said, not a peaceful one.
x: Ferguson rejected Hobbes's version as well as Rousseau's.
a: That it was contrary to scripture.
x: His objection was empirical: the lack of any evidence of pre-social people.
a*: That there are no records of a pre-social condition; people have always lived in society, so the state of nature is a social state.
a: That humans were naturally solitary, so no contract could ever have been made.
x: Ferguson held the opposite: humans have always lived in society.
hint: Ferguson is often credited as a founder of sociology.
why: In his Essay on the History of Civil Society (1767) Ferguson proposed history, travellers' accounts and myths in place of conjectures about a pre-social condition.
```

## The Social Contract

```quote
Man is born free; and everywhere he is in chains. One thinks himself the master of others, and still remains a greater slave than they.
Jean-Jacques Rousseau · The Social Contract I.1 (trans. G. D. H. Cole) · 1762
```

Rousseau does not promise to break the chains; he asks what could make them legitimate. The problem is to find a form of association in which each, uniting with all, still obeys only himself and remains as free as before. His solution:

1. Each member gives himself and all his rights to the whole community. Because each gives everything, conditions are equal for all, and no one has an interest in making them burdensome.
2. The **general will**, the will of the citizen body directed to the common good, is the source of law. Law must come from all and apply to all, and may not single out individuals.
3. The general will is not the **will of all**: "There is often a great deal of difference between the will of all and the general will. The latter looks only to the common interest; the former considers private interest and is only a sum of private wills" (II.3, Masters–Kelly).
4. In obeying law, each obeys a will that is his own, and so remains free. He trades natural freedom, an unlimited right to everything, for civil freedom under law, and gains **moral freedom**, "obedience to a law that one has prescribed to oneself". An outvoted citizen learns that he was mistaken about what the general will required.
5. Hence the notorious sentence: whoever refuses to obey the general will "shall be compelled to do so by the whole body. This means nothing less than that he will be forced to be free" (Cole), which secures him "against all personal dependence".

Sovereignty, the right to make law, belongs to the people and cannot be represented; to hand it over is a form of slavery. Here Rousseau breaks with Hobbes's representative sovereign, though, like Hobbes, he leaves individuals no natural rights against the community. Government, the executive, is distinct, and he favoured an elective aristocracy for it, while fearing that governments will usurp the sovereign. A founding **legislator**, on the model of Lycurgus, must shape citizens able to will good laws, which looks circular, since good laws seem to need good citizens first. A civil religion excludes those who say there is no salvation outside their church. And the citizens are all men: women, the Stanford Encyclopedia notes, "have no voice in the determination of the general will".

## Freedom or Tyranny?

Hegel and Benjamin Constant blamed the general will for the Terror. J. L. Talmon's *The Origins of Totalitarian Democracy* (1952) traced "totalitarian democracy" to it; Popper and Russell read Rousseau similarly; Isaiah Berlin's 1952 lectures, published in 2002 as *Freedom and Its Betrayal*, counted him among six enemies of human liberty, and "Two Concepts of Liberty" (1958) listed him among thinkers who identified freedom with rational action that an elite claims to know. Lester Crocker pressed it in 1968. On this reading, "forced to be free" licenses coercion in the name of people's own "true" will.

Ralph Leigh (1963) and Maurice Cranston rejected Talmon's thesis, and J. S. Maloy wrote in 2005 that it "has, by now, been discredited as an attribution of real historical influence". The Stanford Encyclopedia reads "forced to be free" as **republican freedom**: general law protects me from subjection to any particular person's will. Rawls called his principles of justice an effort to "spell out the content of the general will", and Joshua Cohen reads the general will democratically. Interpreters still divide between a "democratic" general will (what citizens decide) and a "transcendent" one (the common interest whatever anyone wants); the worry lives in the second. The argument continues in *Authority and the State: the Social Contract and Its Critics*.

```checkpoint
q: How does Rousseau distinguish the general will from the will of all?
a: The general will is what the majority votes for; the will of all requires unanimity.
x: The two are distinguished by their object, not by a counting rule.
a*: The general will looks only to the common interest; the will of all considers private interests and is only their sum.
a: The general will is the king's will; the will of all is the people's.
x: For Rousseau sovereignty belongs to the people and cannot be handed to a king or represented.
a: There is no difference; Rousseau uses the terms interchangeably.
x: In Book II chapter 3 he says there is "often a great deal of difference" between them.
hint: Look at what each will is directed towards.
why: In The Social Contract II.3 the will of all is a sum of private wills; the general will looks only to the common interest. Hegel's reading of the general will as an overlap of private wills misrepresents this.
---
q: Which reading of "forced to be free" does the Stanford Encyclopedia of Philosophy favour?
a: That it shows Rousseau to be the direct ancestor of twentieth-century totalitarianism.
x: That is close to Talmon's thesis, which Maloy calls discredited as a claim of historical influence.
a: That it is a joke Rousseau did not mean seriously.
x: The passage is central to his account of law; no source treats it as a joke.
a: That it means people must be forced to join the contract in the first place.
x: The passage concerns members who refuse to obey the general will, not entry into the association.
a*: That compelling obedience to law secures each citizen against dependence on any particular person's will, a republican idea of freedom.
hint: Rousseau adds that this secures the citizen "against all personal dependence".
why: On the republican reading freedom means not being subject to another person's will; general laws, equally binding on all, protect it.
```

## Emile, Sophie and Wollstonecraft

*Emile* (1762) describes a child-centred **negative education**, in which a tutor teaches mostly by arranging the pupil's surroundings. Its fifth book turns to Sophie, educated to be Emile's submissive wife, made, he says, to please man, though man ought to please her in turn. The IEP notes that Rousseau thought women cleverer in practical reason; the Stanford Encyclopedia still finds "a rather extreme misogyny", since he never applied to women his own insight that apparent servility results from unjust subjection.

Mary Wollstonecraft did. *A Vindication of the Rights of Woman* (1792) attacks *Emile*; of one passage she says only "that it is the philosophy of lasciviousness". Taught from infancy that "beauty is woman's sceptre", she argued, the mind, "roaming round its gilt cage, only seeks to adorn its prison". She proposed civil and political rights for women, with their own elected representatives (see *Women Philosophers of the Early Modern Era* and *Feminist Philosophy*).

## Who Was Left Out, and Who Took Part Anyway

"It is striking", the Stanford Encyclopedia observes, "how unenlightened many of the Enlightenment's celebrated thinkers are concerning issues of race and of gender"; the rights of women were generally overlooked, with Wollstonecraft's *Vindication* "a noteworthy exception", and its writings are "rife with rank ethno- and Eurocentrism".

Women were present. Émilie du Châtelet (1706–1749) wrote *Institutions de physique* (1740), wedding Newton's mechanics to Leibniz's metaphysics, and translated Newton's *Principia*, still the leading French version. Salonnières such as Madame Geoffrin and Mademoiselle de Lespinasse chose guests and steered discussion; Dena Goodman calls them "intelligent, self-educated, and educating women" who carried out the values of the Republic of Letters, a reading Pekacz has criticised. Condorcet in 1790 challenged anyone to show "a natural difference between men and women on which the exclusion could legitimately be based". Olympe de Gouges's *Declaration of the Rights of Woman* (1791) declared in its first article, "Woman is born free and remains equal to man in rights"; she was guillotined in 1793, for seditious writings rather than explicitly for her feminism.

On race the record divides. In the 1753–54 edition of his essays Hume added a footnote suspecting non-white peoples to be "naturally inferior to whites", later narrowing it to Black people; whether it is polygenist is disputed. Kant built a racial hierarchy; whether he became "more egalitarian" by 1795 (Kleingeld) or stayed consistently inegalitarian (Lu-Adler) is debated (see *Kant*). Against them stood Jaucourt, Diderot, Gouges and Condorcet, who wrote against slavery in 1781 and presided over the Society of the Friends of the Blacks. Raynal's *History of the Two Indies* predicted a slave revolt and, according to C. L. R. James, inspired Toussaint Louverture. Yet Michèle Duchet argued that Enlightenment anti-colonialism was largely a myth serving European rule. Susan Buck-Morss's contested *Hegel, Haiti, and Universal History* (2009) reads Hegel's master–slave dialectic against the Haitian Revolution (see *German Idealism: Fichte, Schelling and Hegel* and the History chapter *French and Haitian Revolutions*).

Africans took part too. Anton Wilhelm Amo, born around 1703 at Axim on the Gold Coast, now Ghana, was taken to Amsterdam as a small child (whether enslaved is unknown) and given to the dukes of Brunswick-Wolfenbüttel. At Halle he defended a disputation, now lost, "On the Rights of Moors in Europe" (1729); his Wittenberg dissertation of 1734 argued that sensation belongs to the living body, not the immaterial mind. He lectured at Halle and Jena and, after a public lampoon, returned to the Gold Coast around 1747. For philosophy beyond Europe in these years, see *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* and *Race, Colonialism and Philosophy*.

## The First Critics

Hamann (1730–1788), "the Magus of the North", who introduced Kant to Hume and Rousseau, answered Kant's first *Critique* with an unpublished "Metacritique": a proper view of language, he argued, makes the supposed "purity" of reason untenable. Herder (1744–1803), Kant's former student, stressed individuality and the particular, helping Romanticism and historicism supplant the Enlightenment; Michael Forster argues that Herder's rejection of the concept of race and of colonial exploitation made his cosmopolitanism "a good deal purer than Kant's". Berlin's essay "The Counter-Enlightenment" (1973) popularised the term.

Where Rousseau himself belongs is debated: the IEP calls the First Discourse perhaps the greatest example of Rousseau as a "counter-Enlightenment" thinker; Berlin treated him as an erratic philosophe; Everdell, Melzer and Garrard make him the Counter-Enlightenment's founder. In 1947 Horkheimer and Adorno's *Dialectic of Enlightenment* turned the critique on reason itself, "Myth is already enlightenment, and enlightenment reverts to mythology" (trans. Jephcott), and read the Nazi death camps as an outcome of the supremacy of instrumental reason (see *Critical Theory: the Frankfurt School and Habermas*). Defenders reply that later movements of emancipation express the Enlightenment's own ideals; critics see its tensions as symptoms of disorder at its core. (See also the *History of Philosophy* overview.)

## Further exploration

- **Ritchie Robertson, *The Enlightenment: The Pursuit of Happiness, 1680–1790* (2020).** A large recent survey reading the Enlightenment as the pursuit of happiness in this world.
- **John Robertson, *The Case for the Enlightenment: Scotland and Naples 1680–1760* (2005).** Argues for one Enlightenment against Pocock's many.
- **Frederick Neuhouser, *Rousseau's Critique of Inequality: Reconstructing the Second Discourse* (2014).** A step-by-step reconstruction of the Second Discourse, with *amour-propre* at its centre.
- **Joshua Cohen, *Rousseau: A Free Community of Equals* (2010).** A democratic reading of the general will.
- **Leo Damrosch, *Jean-Jacques Rousseau: Restless Genius* (2005).** The standard recent biography.
- **Emmanuel Chukwudi Eze (ed.), *Race and the Enlightenment: A Reader* (1997).** Primary texts on race by Enlightenment philosophers.
- **Stephen Menn and Justin E. H. Smith (trans. and eds), *Anton Wilhelm Amo's Philosophical Dissertations on Mind and Body* (2020).** Amo's Latin works in English.$enlightenment_master$,
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
  select $enlightenment_quiz$[
    {"type": "mcq", "prompt": "In which language and year did Voltaire's Letters on the English first appear?", "options": ["In English, in 1733", "In French, in 1734", "In Latin, in 1726", "In French, in 1759"], "answerIndex": 0, "explanation": "The book was published first in English as Letters Concerning the English Nation (1733); the French Lettres philosophiques followed in 1734 and was burned by the hangman.", "id": "q1"},
    {"type": "mcq", "prompt": "Who wrote the line 'I disapprove of what you say, but I will defend to the death your right to say it'?", "options": ["Voltaire, in the Treatise on Tolerance", "Rousseau, in The Social Contract", "Evelyn Beatrice Hall, in 1906, summing up Voltaire's attitude", "Montesquieu, in The Spirit of the Laws"], "answerIndex": 2, "explanation": "The line is commonly misattributed to Voltaire; Evelyn Beatrice Hall wrote it in 1906 to sum up his attitude.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement best describes Montesquieu's position on slavery in The Spirit of the Laws?", "options": ["He defended slavery everywhere as natural.", "He condemned slavery as bad in its own nature and mocked its defenders ironically, yet said that in very hot countries it is 'more reconcilable to reason'.", "He did not discuss slavery.", "He called for an immediate slave revolt, inspiring Toussaint Louverture."], "answerIndex": 1, "explanation": "Montesquieu called slavery 'in its own nature bad' and listed pro-slavery arguments ironically, but also wrote that in very hot climates it is 'more reconcilable to reason'. The prediction of revolt that inspired Toussaint was in Raynal's History of the Two Indies.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Thomas Reid attack under the name of the 'way of ideas'?", "options": ["The view that we perceive external things directly", "Smith's theory of the impartial spectator", "Rousseau's account of the general will", "The theory, from Locke to Hume, that we perceive only mental representations, which Reid said leads to scepticism"], "answerIndex": 3, "explanation": "Reid argued that the theory of ideas leads to scepticism and defended direct perception of external things and the first principles of common sense.", "id": "q4"},
    {"type": "open", "prompt": "Set out Rousseau's argument in the Discourse on Inequality that inequality is not natural. Then state one objection and the best reply to it.", "rubric": "A strong answer gives the main steps: the method of stripping away what society added; the charge that Hobbes described civilised people minus government, since war needs property, foresight and seeing others as threats; natural man as isolated, timid and peaceful, moved by amour de soi and pity; freedom and perfectibility making development possible; settled life producing comparison and amour-propre; agriculture, metallurgy, division of labour and property ('This is mine'); dependence and domination; the rich proposing a contract that protects their property ('All ran to meet their chains'); conclusion that inequality is a product of history entrenched by a fraudulent contract. It states an objection with its reply: the incoherence of natural goodness (reply: goodness is negative, corruption comes from structures of dependence); Ferguson's charge that there are no records of a pre-social condition (reply: Rousseau said the state may never have existed; Neuhouser reads it as a device, contested by Kelly); or that amour-propre is simply evil (reply: Dent and Neuhouser see it as capable of healthy forms; McLendon dissents).", "id": "q5"},
    {"type": "open", "prompt": "Explain what Rousseau means by the general will and by 'forced to be free'. Why have some read The Social Contract as a source of totalitarianism, and how have others replied?", "rubric": "A strong answer explains the problem of finding an association in which each obeys only himself; total alienation of rights to the community on equal terms; the general will as the citizen body's will for the common good, distinguished from the will of all as a sum of private wills; law as general; moral freedom as obedience to a self-prescribed law; and 'forced to be free' as compelling obedience to the general will, which secures against personal dependence. It presents the totalitarian reading (Hegel and Constant on the Terror; Talmon, Popper, Russell, Berlin, Crocker) and the replies (Leigh, Cranston; Maloy calling the thesis discredited as historical influence; the Stanford Encyclopedia's republican-freedom reading; Neuhouser; Rawls; Cohen's democratic reading), and may note the democratic versus transcendent interpretations. Credit noting that sovereignty cannot be represented and that women had no voice in the general will.", "id": "q6"}
  ]$enlightenment_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/enlightenment-and-rousseau', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
