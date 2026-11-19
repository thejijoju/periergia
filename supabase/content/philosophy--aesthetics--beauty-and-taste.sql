-- Beauty and Taste — canonical master article, co-written and human-reviewed.
-- philosophy/aesthetics/beauty-and-taste @ research/advanced/read.
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
    'philosophy/aesthetics/beauty-and-taste',
    'research',
    'advanced',
    'read',
    $beauty_master$> **When you call a sunset beautiful, are you reporting a fact about the sunset or a feeling of your own, and could you be wrong?** This chapter follows the question from the ancient theory of beauty as proportion to the eighteenth-century idea of taste as an inner sense. It sets out Hume's argument for a "standard of taste" and Kant's deduction and antinomy of taste step by step, with objections and replies, then turns to the sublime, to Nietzsche's and Bourdieu's attacks on "disinterested" pleasure, and to current debates about whether beauty is real and whose standards prevail.

## Is Beauty in the Eye of the Beholder?

Crispin Sartwell, in the Stanford Encyclopedia of Philosophy (SEP), calls it "the most familiar basic issue in the theory of beauty": is beauty **subjective**, a matter of how things strike each of us, or **objective**, a feature of things themselves? "A pure version of either of these positions seems implausible."

If whatever anyone finds beautiful is beautiful, the word communicates nothing beyond approval; yet judgements coincide remarkably (it would be "odd or perverse" to deny that a perfect rose is beautiful), and we argue about beauty and give reasons. Pure objectivism implies that a world with no perceivers could be beautiful. "All plausible accounts of beauty connect it to a pleasurable or profound or loving response."

The tension is sometimes called the **antinomy of taste** (an antinomy is a pair of claims that each seem true but contradict each other). Taste is proverbially private, *de gustibus non est disputandum*, "there is no disputing about taste"; yet we do dispute about it, and treat some people as models of good taste. Hume and Kant both tried to show that judgements of beauty are neither purely subjective nor purely objective but **inter-subjective**: grounded in feeling, yet able to claim others' agreement. Definitions of art belong to *What Is Art?*.

## Beauty as Proportion

Until the eighteenth century most accounts treated beauty as objective. The oldest Western one, the SEP's **classical conception**, makes beauty "an arrangement of integral parts into a coherent whole, according to proportion, harmony, symmetry, and similar notions". For Aristotle, "The chief forms of beauty are order and symmetry and definiteness" (*Metaphysics* 1078a36, Barnes edition). The Polish historian Władysław Tatarkiewicz (1886–1980) named this view **the Great Theory** of beauty (in a 1972 article, and again in *A History of Six Ideas*), and argued that it held from classical Greece until its decline in the eighteenth century.

Not everyone was satisfied. In the *Hippias Major*, Socrates asks the sophist Hippias what *to kalon* is, a word broader than "beautiful" that Paul Woodruff translates "the fine". Hippias offers examples (a beautiful young woman, gold); Socrates tries the appropriate, the useful, the beneficial and "pleasure through hearing and sight"; all fail, and the dialogue ends with the proverb "beautiful things are difficult". Its authorship has been disputed: accepted in antiquity, it was doubted in the nineteenth and twentieth centuries (Dorothy Tarrant's 1928 edition called it spurious; G. M. A. Grube defended it), though most scholars now accept it as Plato's.

Plato's own answer looked past any arrangement of parts to the Form of beauty, reached by the ascent of love in the *Symposium*, which the chapter on *Plato* follows. Sartwell calls this the **idealist conception**: beauty as perfect unity. Its great heir, Plotinus, attacked the proportion theory head on in "On Beauty" (*Ennead* I.6). "Almost everyone declares", he wrote, in MacKenna and Page's translation, "that the symmetry of parts towards each other and towards a whole, with, besides, a certain charm of colour, constitutes the beauty recognized by the eye. … But think what this means. Only a compound can be beautiful, never anything devoid of parts." His argument has two prongs. Simple things, a colour, sunlight, gold, the stars, are beautiful but have no parts to proportion. And a beautiful whole cannot be "constructed out of ugliness", so its parts must be beautiful too, which proportion cannot explain. Beauty, he concluded, is "communion in Ideal-Form" (see *Plotinus and Neoplatonism*).

The medieval tradition combined the strands. Augustine, asking whether things are beautiful because they delight or delight because they are beautiful, "emphatically opts for the second", as Sartwell puts it. Thomas Aquinas listed "three requirements for beauty. Firstly, integrity or perfection—for if something is impaired it is ugly. Then there is due proportion or consonance. And also clarity: whence things that are brightly coloured are called beautiful" (*Summa Theologiae* I, q. 39, a. 8, in the English quoted by the SEP), in a passage on attributing beauty to the Son within the Trinity (see *Thomas Aquinas*). Elsewhere in the *Summa* he says beautiful things are those "which please when seen", where "seen", the Internet Encyclopedia of Philosophy (IEP) stresses, means contemplation by the intellect.

## Taste as an Inner Sense

The eighteenth century turned the question round. Influenced by Locke's distinction between **primary qualities** such as shape, really in bodies, and **secondary qualities** such as colour, which depend on perceivers (see *Locke*), British writers made pleasure "not the effect but the origin of beauty".

Anthony Ashley Cooper, third Earl of Shaftesbury (1671–1713), set out his views mainly in the dialogue *The Moralists*, part of his *Characteristicks* (1711). The enjoyment of beauty, he held, must be "of the rational kind", unlike **interested** enjoyments aimed at use or possession: desire at a human form, a coin valued for what it buys rather than its design, a valley seen as real estate. Shaftesbury remained a realist: an "inward EYE" perceives beauty, and all beauty finally "resolves it-self" into the divine mind.

Francis Hutcheson (1694–1746), in his *Inquiry into the Original of Our Ideas of Beauty and Virtue* (1725), turned this into a theory of an internal **sense of beauty**. Beauty, "to speak in the Mathematical Style, seems to be in a compound Ratio of Uniformity and Variety", in short **uniformity amidst variety**: a square beats an equilateral triangle, and Newton's gravitation is beautiful too. It is a sense because the pleasure is immediate, not from "any Knowledge of Principles, Proportions, Causes, or the Usefulness of the Object". Hutcheson treated beauty like a secondary quality: "were there no Mind with a Sense of Beauty to contemplate Objects, I see not how they could be call'd beautiful."

Edmund Burke (1729–1797), in *A Philosophical Enquiry into the Origin of our Ideas of the Sublime and Beautiful* (1757), an imagination theorist rather than an internal-sense theorist, defined beauty as "that quality or those qualities in bodies, by which they cause love, or some passion similar to it". He demolished the proportion theory with examples: the rose is large on a small shrub, the apple blossom small on a large tree, and both are beautiful. "You may assign any proportions you please to every part of the … human body; and I undertake, that a painter shall observe them all, and notwithstanding produce, if he pleases, a very ugly figure."

{{image: A Philosophical Enquiry into the Origin of Our Ideas of the Sublime and Beautiful | Edmund Burke's *Philosophical Enquiry* (1757), which tied beauty to love and the sublime to astonishment.}}

## Hume's Standard of Taste

Hume had written in his *Treatise* (1739–40) that pleasure and pain, as the "necessary attendants of beauty and deformity", "constitute their very essence". His essay "Of the Standard of Taste" appeared in *Four Dissertations* (1757), written "in some haste", Theodore Gracyk reports, to fill out a volume; Kant read it in translation. (*Berkeley and Hume* covers Hume's wider philosophy.)

Hume starts from a subjectivist "species of philosophy": "Beauty is no quality in things themselves: It exists merely in the mind which contemplates them; and each mind perceives a different beauty." A **sentiment**, a feeling, refers to nothing beyond itself, so that, in Hume's words, "All sentiment is right"; only judgements of the understanding are true or false. Yet some judgements of taste are absurd: "Whoever would assert an equality of genius and elegance between Ogilby and Milton, or Bunyan and Addison, would be thought to defend no less an extravagance, than if he had maintained a mole-hill to be as high as Teneriffe, or a pond as extensive as the ocean." (Ogilby was a seventeenth-century translator mocked by Dryden and Pope.) So Hume sought a standard, a rule for "confirming one sentiment, and condemning another". Assembled from the SEP and IEP accounts, the argument runs:

1. Beauty is not a quality in objects; a judgement of beauty expresses a sentiment of pleasure that certain qualities of objects are fitted to cause in us.
2. Yet some judgements of taste are plainly wrong: Ogilby is not Milton's equal.
3. There are general principles of taste: certain qualities naturally please the human mind when properly perceived, as their lasting appeal across ages and nations shows.
4. These principles work reliably only in good conditions, as an object's true colour is its appearance "in day-light to the eye of a man in health"; most people notice only "the grosser and more palpable qualities".
5. The conditions are met by a judge with the qualities named below.
6. So the joint verdict of such judges is the standard of taste, and departures from it, beyond blameless variation, are defects in the judge.

```quote
Strong sense, united to delicate sentiment, improved by practice, perfected by comparison, and cleared of all prejudice, can alone entitle critics to this valuable character; and the joint verdict of such, wherever they are to be found, is the true standard of taste and beauty.
David Hume · "Of the Standard of Taste" · 1757
```

Hume illustrates **delicacy** with a story from *Don Quixote*: two of Sancho Panza's kinsmen, judging a cask of wine, detect faint tastes of leather and of iron and are mocked, until the emptied cask reveals an old key on a leather thong. Producing general rules of art, Hume says, is like finding the key: it vindicates the true critic. Since true judges are rare, the standard shows itself in practice in the verdict of qualified judges across ages and cultures, the "test of time" that explains, in Sartwell's words, "the enduring veneration of the works of Homer or Milton".

**Objection.** The classic objection is circularity (Brown 1938, Noxon 1961). We recognise true critics by their approving the best works; but the best works are those that true critics approve.

**Reply.** The five qualities can be identified without reference to any particular verdict: delicacy is shown by detecting the iron and leather, confirmed by the key, and prejudice or a lack of comparison can be detected too. Many later commentators, Gracyk reports, follow Peter Kivy (1967) in thinking the real difficulty is not a circle but a **regress**: deciding whether a judge's responses are "sufficiently delicate, grounded in the right comparisons" raises new evaluative questions, which seem to need further judges.

Two problems remain open. Jerrold Levinson, in "Hume's Standard of Taste: The Real Problem" (2002), argued, roughly, that even granting the standard, it is unclear why ordinary appreciators should value what the best judges prefer; J. Wieand replied in 2003, and Levinson answered. And Hume admits **blameless variation**: even the best judges differ through "innocent and unavoidable" preferences rooted in age, temperament or culture, so in many cases there may be no single joint verdict. Interpreters also dispute whether Hume's judges are idealised figures (the "ideal critic" is the commentators' phrase, not Hume's) or real people with some fixed biases. Nor is it agreed whether Hume stayed a subjectivist: Gracyk finds "no direct endorsements of realism", while Savile and Mothersill read him as giving a **dispositional** analysis, on which beauty is an object's power to please qualified observers.

```checkpoint
q: In Hume's argument, what role do the five qualities of the true judge play?
a*: They describe the conditions under which the principles of taste work reliably, as daylight and a healthy eye do for colour.
a: They define beauty as whatever a majority of ordinary people enjoy.
x: Hume thought most people notice only "the grosser and more palpable qualities"; the standard is the verdict of rare, qualified judges.
a: They are rules of composition, such as Hutcheson's uniformity amidst variety, that a work must obey.
x: The qualities belong to the judge, not the work; Gracyk notes that Hume never states a clear rule of art.
a: They prove that beauty is a quality in objects, independent of any sentiment.
x: Hume's first premise is that beauty is not a quality in things but a sentiment certain qualities are fitted to cause.
hint: Think of the colour analogy.
why: For Hume, beauty is a matter of sentiment, but the sentiment is reliable only in good conditions. Strong sense, delicacy, practice, comparison and freedom from prejudice supply those conditions, so the joint verdict of such judges is the standard.
---
q: Why do many commentators since Kivy speak of a regress rather than a circle in Hume's argument?
a: Because Hume defined true critics as those who approve Milton.
x: That would indeed be circular; the reply is that the qualities can be identified without reference to particular verdicts.
a: Because Levinson showed that the best judges never disagree.
x: Levinson's 2002 paper asked why ordinary people should care what the best judges prefer; whether Hume's judges can disagree is a separate debate.
a*: Because judging whether a critic's responses are delicate enough or rightly compared raises new evaluative questions, apparently calling for further judges.
a: Because Hume admitted that even the best judges sometimes blamelessly disagree.
x: Blameless variation is a separate problem: it threatens a single joint verdict, not the way judges are identified.
hint: What would you need in order to decide whether someone's taste is "sufficiently delicate"?
why: The five qualities can be identified independently, so there is no strict circle. But assessing them requires further acts of evaluation, which seem to need qualified assessors in turn: a regress rather than a circle.
```

## Kant: Disinterested and Universal

Kant's *Critique of the Power of Judgment* (1790) asked how a judgement resting wholly on feeling can demand everyone's agreement. The chapter on *Kant* summarises his four "moments": pleasure in beauty is **disinterested**, neither depending on nor producing a desire for the object; it claims universal validity without a concept; it finds in the object "the form of purposiveness" (commentators' shorthand is "purposiveness without a purpose"); and it claims necessity. Here the focus is the argument. (Phrases from Kant below follow the Cambridge translation by Paul Guyer and Eric Matthews, as the SEP gives it.)

The **agreeable**, like Canary wine, pleases only "to me". Someone who calls a thing beautiful, by contrast, "judges not merely for himself, but for everyone, and speaks of beauty as if it were a property of things", demanding others' agreement. Kant also distinguished **free beauty**, which presupposes no concept of what the object should be (flowers, foliage on wallpaper, music without words), from **adherent** beauty, judged as beauty in a thing of its kind; Sartwell illustrates the latter with his own example, "A beautiful ox would be an ugly horse." Critics complain that this seems to rank wallpaper above the Sistine Chapel.

Kant's question (§36) is how a judgement made "merely from one's own feeling of pleasure in an object, independent of its concept", can claim that pleasure for everyone a priori. His answer, the **deduction of taste** (§§31–39), runs as Hannah Ginsborg reconstructs it in the SEP:

1. Pleasure in beauty is the felt **free play**, or free harmony, of imagination and understanding: imagination working in step with understanding without being bound by any particular concept.
2. This harmony is the subjective condition of all cognition.
3. We are entitled to demand that everyone share our cognitions, for instance that this object is green or square.
4. So we are entitled to demand that everyone share the subjective condition of such cognition.
5. So we may demand that everyone share our disinterested pleasure: the judgement of taste rightly claims universal validity.

**Objection.** The dilemma is set out by Guyer (1979), Meerbote, Allison and Rind. Either free play belongs to all perception, so that everything should be beautiful, or it does not, in which case step 4 does not license step 5. Guyer (1979) and Meerbote judged it fatal, though Guyer later took a more positive view.

**Reply.** Allison holds that the deduction shows only that such claims can in general be legitimate, not that any particular one is; Savile and Chignell require entitlement case by case; others ground it in morality. Gracyk, Ginsborg and Breitenbach take the first horn and accept that anything can legitimately be judged beautiful.

Kant also faced the antinomy of taste head on (§§55–57). We cannot **dispute** about taste, settling it by proofs, yet we can **quarrel** about it, claiming others' agreement. The thesis, in paraphrase, says the judgement of taste is not based on concepts, or proofs could decide it; the antithesis says it is, or we could not even quarrel. Kant's resolution distinguishes two senses of "concept". The thesis is true of determinate concepts, usable in proofs; the antithesis is true of an "indeterminate concept", that of the supersensible ground of nature and humanity. Both are true, and the contradiction is only apparent. Critics find this concept obscure, and in tension with §38's "beauty is not a concept of the object". A sympathetic reading takes Kant to mean only that the claim rests on something every judge shares, the same cognitive faculties, which no rule can specify. Nick Zangwill suggests separating "Kant's problem from his solution": how a feeling-based judgement can claim correctness, "the Big Question in aesthetics", remains even if the solution fails.

## The Sublime

Beside beauty stood the **sublime**: the overwhelming or terrifying, enjoyed. The classic text is *On the Sublime*, a Greek treatise of literary criticism dated to the first century CE, by an unknown author called "Longinus" or "Pseudo-Longinus". Great thoughts, strong emotions, figures of speech, noble diction and dignified arrangement are its five sources, and it leads hearers "not to persuasion, but to ecstasy". Boileau's French translation (1674) launched its modern career.

Addison wrote that "The Alps fill the mind with an agreeable kind of horror"; Burke gave such experience a psychology. Beauty excites love; the sublime excites **astonishment**, when pain or danger threatens from a relatively safe distance, and its pleasure is "delight", which Burke calls a "relative pleasure" that comes when pain or danger is removed or held off. Beautiful things tend to be small, smooth and delicate, sublime ones vast, rugged and obscure, and Burke sharply opposed the two.

Kant separated the **mathematical sublime**, where sheer magnitude defeats imagination and reveals reason's demand for totality, from the **dynamical sublime**, where cliffs, thunder clouds and hurricanes show nature as a power with no dominion over us (see *Kant*). Sublimity lies not in nature but in our mind. Whether art can be sublime for Kant is debated (Abaci says no, Clewis yes).

## Against Disinterestedness: Nietzsche and Bourdieu

In *On the Genealogy of Morality* (1887), Third Treatise, §6, Nietzsche attacked aestheticians, Kant and Schopenhauer above all, who approach beauty "purely from the standpoint of the 'spectator'" rather than from the experience of the artist. Against Kant he set Stendhal's phrase, as he quotes it in the *Genealogy*, "the beautiful is a promise of happiness" (*une promesse de bonheur*). What exactly he rejected is debated. Zangwill reads the target as the universality of taste, since higher beauty may be graspable only by a few; Reginster, Soll and Ridley read Nietzsche as rejecting the passive spectator, with beauty as what impels new creation (see *Nietzsche*). Zangwill puts the choice starkly: "Do we want aristocratic or democratic aesthetics?" He adds that Kant allowed empirical and intellectual interests in beauty without abandoning disinterestedness, a point "Critics of Kant sometimes miss".

Pierre Bourdieu (1930–2002) attacked from sociology. *La Distinction* (1979), in English *Distinction: A Social Critique of the Judgement of Taste* (1984), answers Kant in its very subtitle. Drawing on surveys made between 1963 and 1968, Bourdieu argued that judgements of taste are acts of social positioning, formed by **habitus**, the ingrained dispositions acquired within a social class. Working-class people expect objects to fulfil a function; the dominant classes prize a disinterested gaze that values things for their own sake and impose their taste as legitimate. Kant's disinterested judge, on this view, is not a universal human but a class-trained one.

```checkpoint
q: What is the main objection to Kant's deduction of taste?
a: That Kant borrowed the argument from Hume's essay on taste.
x: Kant read Hume, but the objection concerns the deduction's internal logic, not its sources.
a*: That free play either belongs to all perception, so everything would be beautiful, or does not, so the step from shared cognition to shared pleasure fails.
a: That free beauty and adherent beauty cannot be told apart.
x: That distinction raises a separate worry about representational art, not about the deduction.
a: That Kant made the judgement of taste depend on a determinate concept.
x: Kant denied that taste rests on determinate concepts; the "indeterminate concept" belongs to the antinomy, not this objection.
hint: Ask what follows if the harmony of imagination and understanding is part of every cognition.
why: If free play is the subjective condition of all cognition, every object should please; if it is not, demanding agreement in cognition does not license demanding agreement in pleasure. Guyer and Meerbote thought this dilemma fatal; some defenders accept that anything can be judged beautiful.
---
q: How does Bourdieu's *Distinction* challenge Kant?
a: By arguing that beauty is an objective property detected by trained critics.
x: That is closer to a realist view; Bourdieu traced taste to class, not to properties of objects.
a: By showing that the sublime and the beautiful are mutually exclusive.
x: That was Burke's claim in 1757, not Bourdieu's.
a: By defending the spectator against the artist.
x: The spectator/artist contrast is Nietzsche's, and Nietzsche criticised the spectator's standpoint.
a*: By arguing that the gaze of disinterested appreciation is a class disposition imposed as legitimate taste.
hint: Look at the book's subtitle.
why: Bourdieu, drawing on surveys of the 1960s, argued that taste is formed by habitus within a class; the dominant class's taste for appreciating things for their own sake is learned early in the family and presented as universal.
```

## Is Beauty Real?

For much of the twentieth century beauty almost vanished from English-language philosophy. George Santayana's *The Sense of Beauty* (1896) called it "pleasure regarded as the quality of a thing", and A. J. Ayer gave "beautiful" no "objective validity". A revival came in the 1990s. Earlier, Frank Sibley's "Aesthetic Concepts" (1959) had argued that terms such as balanced, delicate or tragic are not "condition-governed": no list of non-aesthetic features guarantees that they apply; one must perceive them.

Zangwill lists what any theory must explain: judgements of beauty rest on pleasure, yet claim that "some are correct, others incorrect"; "Thinking it so does not make it so". **Realists** such as Zangwill (*The Metaphysics of Beauty*, 2001), and more radically Eddy Zemach (*Real Beauty*, 1997), hold that the feeling of beauty can be "more or less veridical", answering to a genuine property of the world; a Humean sentimentalist says we "somehow construct" that normativity; a middle course, sometimes called response-dependence, is the dispositional reading of Hume. Zangwill concedes that realism "might seem metaphysically extravagant", but notes that sceptics about taste "do not practice what they preach".

Sartwell, in *Six Names of Beauty* (2004), places beauty in the relation between subject, object and situation. Alexander Nehamas's *Only a Promise of Happiness* (2007), titled after Stendhal, treats beauty as an invitation to explore further rather than a verdict, and rejects Kant's universality:

```quote
Aesthetic judgment, I believe, never commands universal agreement... Beauty creates smaller societies, no less important or serious because they are partial.
Alexander Nehamas · Only a Promise of Happiness, pp. 80–81 · 2007
```

Roger Scruton's *Beauty* (2009) defended a modified Kantianism: "We call something beautiful when we gain pleasure from contemplating it as an individual object, for its own sake, and in its presented form." Elaine Scarry's *On Beauty and Being Just* (1999) argued that the links between justice and aesthetic ideas such as balance, symmetry and "fairness" are "more than analogies".

## Whose Beauty?

Political critics asked who sets the standard. Wollstonecraft (1792) and Grimké (1837) saw beauty norms as a means of controlling women's bodies, and Laura Mulvey, in a 1975 essay on film, noted the saying that analysing pleasure or beauty destroys it: "That is the intention of this article." Since around 1990 feminist philosophers have studied norms of appearance tied to race, disability and age (see *Feminist Philosophy*). Marcus Garvey criticised white standards of beauty and colourism in 1925, and around 1970 the slogan "Black is beautiful" took hold. Paul C. Taylor's *Black Is Beautiful: A Philosophy of Black Aesthetics* (2016), which won the American Society for Aesthetics' monograph prize, examines the complexities of that phrase (see *Race, Colonialism and Philosophy*).

**Evolutionary aesthetics** proposes instead that basic aesthetic preferences evolved because they aided survival and reproduction: a reported preference for savanna-like landscapes, say, or sexual-selection explanations of art. Denis Dutton's *The Art Instinct* is its best-known philosophical defence. These remain contested hypotheses: one study's cross-cultural "preference" for realistic landscape painting was put down by its own authors to the influence of Western calendar art.

## Beyond the Gallery

Western aesthetics, Yuriko Saito argues, narrowed to the fine arts from the nineteenth century; her *Everyday Aesthetics* (2007) developed the field, and in the SEP she describes attention to daily life as "restoring the scope of aesthetics rather than opening a new arena", and notes that many traditions, Inuit and Navajo, Japanese and Chinese, build aesthetic care into ordinary life (see *Aesthetics across Traditions*). For nature, Allen Carlson rejected the "landscape model", which looks at nature as if it were a painting, for a "natural environmental model": appreciate an environment as the kind of environment natural science says it is. His **positive aesthetics**, on which nature properly understood is aesthetically good, is debated; critics say it rules out judging one place better than another (see *Animals and the Environment*). The old question returns: if beauty can be found almost anywhere we look properly, is that a fact about the world or about the looking?

## Further exploration

- **Roger Scruton, *Beauty* (2009).** An accessible, broadly Kantian account of beauty.
- **Alexander Nehamas, *Only a Promise of Happiness: The Place of Beauty in a World of Art* (2007).** Beauty as an invitation and a basis for partial communities, in dialogue with Plato, Kant and Stendhal.
- **Elaine Scarry, *On Beauty and Being Just* (1999).** A short, eloquent defence linking beauty and justice.
- **Crispin Sartwell, *Six Names of Beauty* (2004).** Beauty through words from several languages, defending a relational view.
- **Paul C. Taylor, *Black Is Beautiful: A Philosophy of Black Aesthetics* (2016).** Race, beauty standards and Black aesthetic practice.
- **Yuriko Saito, *Everyday Aesthetics* (2007).** The aesthetics of daily life, drawing on Japanese as well as Western thought.
- **Paul Guyer, *Values of Beauty: Historical Essays in Aesthetics* (2005).** Scholarly essays on the history of aesthetics from Hutcheson to Kant and after.$beauty_master$,
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
  select $beauty_quiz$[
    {"type": "mcq", "prompt": "What was Plotinus's main objection to the theory that beauty consists in the proportion of parts?", "options": ["Simple things without parts, such as colours, sunlight and gold, are beautiful, and a beautiful whole cannot be built out of ugly parts", "Proportions cannot be measured precisely enough to explain beauty", "Beauty is merely a pleasure in the mind of the beholder", "Proportion explains natural beauty but not the beauty of art"], "answerIndex": 0, "explanation": "In Ennead I.6 Plotinus argued that if beauty were symmetry, only compounds could be beautiful, yet colours, sunlight, gold and the stars are beautiful; and the parts of a beautiful whole must themselves be beautiful, which proportion cannot explain.", "id": "q1"},
    {"type": "mcq", "prompt": "Which phrase sums up Francis Hutcheson's account of what we find beautiful?", "options": ["Purposiveness without a purpose", "Integrity, proportion and clarity", "Uniformity amidst variety", "The echo of a great soul"], "answerIndex": 2, "explanation": "Hutcheson's Inquiry (1725) put beauty 'in a compound Ratio of Uniformity and Variety', usually shortened to 'uniformity amidst variety'. Integrity, proportion and clarity are Aquinas's three requirements; 'the echo of a great soul' is Longinus on the sublime; 'purposiveness without a purpose' is commentators' shorthand for Kant.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Kant resolve the antinomy of taste?", "options": ["By siding with the thesis: judgements of taste are mere feelings and cannot be disputed or quarrelled about", "By distinguishing two senses of 'concept': taste rests on no determinate concept usable in proofs, but on an indeterminate concept of the supersensible", "By appealing to the joint verdict of qualified critics over time", "By showing that judgements of taste are really judgements about the agreeable"], "answerIndex": 1, "explanation": "Kant held that the thesis (taste is not based on concepts, or it could be proved) is true of determinate concepts, while the antithesis (it is based on concepts, or we could not even quarrel about it) is true of an indeterminate concept, that of the supersensible. Both are true, so the contradiction is only apparent.", "id": "q3"},
    {"type": "mcq", "prompt": "Which writer argued, in a book published in 1757, that the sublime arises from astonishment when pain or danger threatens from a relatively safe distance?", "options": ["Longinus", "Shaftesbury", "Kant", "Edmund Burke"], "answerIndex": 3, "explanation": "Burke's Philosophical Enquiry (1757) tied beauty to love and the sublime to astonishment, a 'delight' in danger held at a distance, and sharply opposed the two. Longinus's treatise concerns sublimity in speech; Kant wrote in 1790.", "id": "q4"},
    {"type": "open", "prompt": "Set out Hume's argument for a standard of taste and explain how a defender of Hume can answer the charge that it is circular.", "rubric": "A good answer: (1) states Hume's starting point that beauty is a sentiment, not a quality in things, yet that some verdicts (Ogilby equal to Milton) are absurd; (2) explains that principles of taste work reliably only in good conditions, as colours appear truly in daylight to a healthy eye; (3) lists the five qualities of the true judge (strong sense, delicacy, practice, comparison, freedom from prejudice) and says their joint verdict is the standard; (4) states the circularity objection (true critics identified by approving the best works, the best works defined by critics' approval); (5) replies that the qualities can be identified independently, e.g. delicacy proven by the key in the wine cask; (6) for extra credit, notes the view of many commentators following Kivy that the real problem is a regress, or mentions blameless variation or Levinson's 2002 'real problem'.", "id": "q5"},
    {"type": "open", "prompt": "Is the pleasure we take in beauty 'disinterested'? Explain Kant's view and assess it in the light of either Nietzsche's or Bourdieu's criticism.", "rubric": "A good answer: (1) explains Kant's claim that pleasure in beauty neither depends on nor produces a desire for the object, distinguishing it from the agreeable and the good, and notes Shaftesbury as a source of the idea; (2) explains why disinterestedness matters to Kant's claim that a judgement of beauty demands everyone's agreement; (3) presents Nietzsche's criticism of the 'spectator' standpoint in Genealogy III.6, with Stendhal's 'promise of happiness', and/or Bourdieu's argument that the disinterested gaze is a class disposition formed by habitus; (4) notes that Nietzsche's target is debated (universality, per Zangwill, or the passive spectator, per Reginster and others) or that Kant admitted interests in beauty that do not refute disinterestedness; (5) reaches a reasoned verdict.", "id": "q6"}
  ]$beauty_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/aesthetics/beauty-and-taste', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
