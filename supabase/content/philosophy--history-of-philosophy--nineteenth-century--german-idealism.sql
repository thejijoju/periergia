-- German Idealism: Fichte, Schelling and Hegel — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/german-idealism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/german-idealism',
    'research',
    'advanced',
    'read',
    $idealism_master$> **In the forty years after Kant's *Critique of Pure Reason*, a handful of German thinkers tried to turn his critical philosophy into a complete system of freedom, nature and history.** This chapter follows the first critics of Kant (Reinhold, Jacobi, Schulze and Maimon); Fichte's argument from the self-positing I to the not-I, and the atheism dispute that cost him his post; Schelling's philosophy of nature and his quarrel with Hegel; and Hegel himself: the *Phenomenology of Spirit*, the lord and bondsman, what his dialectic really is (and why "thesis–antithesis–synthesis" is not it), history as the progress of freedom and the debate over its Eurocentrism, Absolute Spirit, the rival ways of reading him today, and the split of his followers into Right and Left.

## After Kant: the First Critics

Kant (see *Kant*) argued that we know only appearances, shaped by our own minds, while things "in themselves" stay unknown. His first readers soon asked whether the system held together, and the movement that grew out of their answers is called **German Idealism**: "idealism" because it explains the world of experience from the activity of mind, "German" because its home was a few small universities, above all Jena, Berlin and Tübingen.

Karl Leonhard Reinhold, who made Kant famous with his *Letters on the Kantian Philosophy* (from 1786), became the first holder of Jena's chair of Critical Philosophy in 1787. He wanted the whole system to rest on one self-evident **first principle**, his "Principle of Consciousness": in consciousness, the subject distinguishes a representation from both subject and object and relates it to both. Few accepted it, but the demand stuck.

Friedrich Heinrich Jacobi aimed at the "thing in itself". Kant needs it to cause our sensations, yet his own rules forbid applying causality beyond experience. In 1787 Jacobi wrote: "Without that presupposition, I could not enter into [Kant's] system, but with it I could not stay within it." Gottlob Ernst Schulze pressed the same point in *Aenesidemus* (1792), an anonymous sceptical attack on Kant and Reinhold. Salomon Maimon, a Talmud-trained Jew from Lithuania who joined Moses Mendelssohn's circle in Berlin, doubted that Kant had shown his categories apply to experience at all, giving "Hume's skepticism ... its complete power". Kant himself replied that "none of my critics understood me and the main questions as well as Herr Maimon does".

## Fichte: from Weaver's Son to the Atheism Dispute

Johann Gottlieb Fichte was born in 1762 in Saxony, the son of poor ribbon weavers. Teaching Kant in 1790 produced what he called a "revolution" in his thinking, reconciling "head" and "heart". After a disappointing visit to Kant he wrote *Attempt at a Critique of All Revelation*, which Kant had his own publisher print in 1792. Appearing without the author's name, it was hailed as Kant's own; when the truth came out, Fichte was famous. In 1793 he also published, anonymously, a defence of the French Revolution, which earned him a reputation, "not wholly deserved", as a radical "Jacobin".

In 1794 he took Reinhold's old chair at Jena. His system, the *Wissenschaftslehre* ("doctrine of science", a theory of all knowledge), went through more than a dozen versions; as the Stanford Encyclopedia of Philosophy (SEP) puts it, it "is not the name of a book; it is the name of a system."

In 1798 an essay of his identified God with the moral order of the world. An anonymous pamphlet accused him of atheism, princes threatened to keep students away from Jena, and Fichte, who had threatened to resign if reprimanded, was forced out in 1799. "It is not my atheism which they are persecuting," he said, "it is my democratism." The same year Jacobi branded his philosophy "nihilism", a word Jacobi gave its philosophical meaning, and Kant publicly disowned it.

## Fichte's I and Not-I

Fichte's task was to show how free, responsible agents can also belong to a world of necessary causes. Taking Jacobi, Schulze and Maimon to heart, he dropped the thing in itself. Philosophy, he said in 1797, must start either from the free self ("idealism") or from the thing in itself ("dogmatism", which leads to determinism). Neither can refute the other, but only idealism can explain experience; hence "the kind of philosophy one chooses depends upon the kind of person one is". His argument in the *Foundation of the Entire Wissenschaftslehre* (1794/95) runs, in Daniel Breazeale's reconstruction:

1. **The I posits itself.** "Posit" here means to be aware of, not to create. All consciousness of objects presupposes self-consciousness, and the original act is a *Tathandlung*, a "fact/act": deed and product at once. The I is not a thing but "what it posits itself to be".
2. Among its representations the I finds some accompanied by a feeling of freedom and others by a feeling of necessity. To recognise this is to posit a distinction between the I and the **not-I**: whatever exists independently of the self.
3. The I cannot be the source of its own limitation. It simply meets a "check" (*Anstoß*) on its activity, and posits the not-I in order to explain that check, as sensation, then as a perceived thing, then as a concept.
4. So the "absolute I" is only an abstraction. The real I is "a finite, empirical, embodied, individual self", free yet limited, whose freedom takes the form of endless striving.
5. And it cannot even be an individual alone: it must find itself "summoned" by another free being who asks it to limit its freedom out of respect for theirs. Mutual recognition is a condition of being a self.

**Conclusion:** freedom and necessity are two sides of one finite, striving, social self. The last step, from Fichte's *Foundations of Natural Right* (1796–97), is the root of Hegel's theory of recognition.

**Objection:** this is solipsism, an ego spinning the world out of itself. **Reply:** Breazeale insists that "the Wissenschaftslehre is not a theory of the absolute I". The check cannot be deduced; philosophy cannot say why objects have the particular properties they do; and Fichte held that "there is no conflict between transcendental idealism and the commonsense realism of everyday life". ("Transcendental" philosophy, in Kant's sense, studies the conditions that make experience possible.) A different objection, from Schelling and Hegel, was that his idealism stayed one-sidedly subjective. For a long time Fichte was treated as "a superseded rung on the ladder 'from Kant to Hegel'", a picture Breazeale calls Hegel's "self-serving" history.

## Fichte and the Nation

Fichte gave his *Addresses to the German Nation* in occupied Berlin in the winter of 1807–08. They later gained "a place of dubious honor" as founding documents of German nationalism; Russell (1945) said Fichte laid its theoretical foundations, the Nazis claimed him, and the chapter *Nationalism and the Making of Nation-States* notes the reading that he pushed nationalism in an ethnic direction. Breazeale and Allen Wood answer that the *Addresses* are about language and national education, meant as means to a cosmopolitan end. His record on Jews cuts both ways: his anonymously published 1793 defence of the French Revolution opposed civil rights for Jews as "a state within a state", yet as the first elected rector of the new University of Berlin (1810) he resigned when colleagues refused to punish harassment of Jewish students. He died in 1814 of an infection caught from his wife, a volunteer military nurse.

## Schelling: Nature as Unconscious Mind

Friedrich Wilhelm Joseph Schelling, born in 1775, was a prodigy: a friend of Hegel and Hölderlin at the Tübingen seminary, and a professor at Jena at twenty-three. He began as a Fichtean, but from 1797 he built a **Naturphilosophie** ("philosophy of nature"), which Fichte thought transcendental philosophy could not allow. Nature, Schelling argued, is pure "productivity" that appears only in "products", the productivity holding itself back "like the eddies in a stream". It rises through a series of levels, each with an inner polarity on the model of a magnet; "universal duality" is the principle of all explanation of nature. Nature is a kind of "super-subject" that produces the very minds by which it comes to know itself. Many of its empirical claims, the SEP concedes, "are now indefensible".

His *System of Transcendental Idealism* (1800) told a "history of self-consciousness" whose early stages are unconscious, a model Hegel would adopt in the *Phenomenology*, and crowned it with art, which Schelling called "the sole document and the eternal organ of philosophy". In his **identity philosophy**, from 1801, the I became a result rather than a starting point: subject and object must already in some way be the same, grounded in an Absolute prior to the distinction between them, a move towards Spinoza (see *Spinoza*).

Schelling's Jena was also the Jena of the early Romantics, with two women at its centre. Caroline Böhmer, imprisoned by the Prussians after the fall of the revolutionary Republic of Mainz in 1793, married the critic August Wilhelm Schlegel in 1796, made their house a centre of Romanticism, is credited with a share of his reviews, and was "an important influence" on his brother Friedrich; in 1803 she married Schelling. Dorothea Mendelssohn, daughter of Moses Mendelssohn, left her husband for Friedrich Schlegel and published a novel, *Florentin* (1801). The sources treat them as writers, critics and hosts rather than system-builders.

In 1807 Hegel's *Phenomenology* mocked an Absolute in which all differences vanish as "the night in which all cows are black". It is often read as aimed at Schelling. Andrew Bowie argues that this "is not a valid interpretation": Schelling had himself complained that most people see in the Absolute "nothing but pure night" and promised to turn that night "into day for knowledge". Hegel never named him. Schelling wrote to ask whether he or his followers were meant; Hegel never replied, and the friendship ended.

## Hegel: a Life

Georg Wilhelm Friedrich Hegel was born in Stuttgart on 27 August 1770. At the Tübingen Stift, a Protestant seminary (1788–93), his roommates included Hölderlin and Schelling; he is reported to have toasted the storming of the Bastille every 14 July. After years as a house tutor he came to Jena in 1801, where his first book took Schelling's side against Fichte.

He finished the *Phenomenology of Spirit* in haste in October 1806, the main body the night before the battle of Jena, and sent it through French lines to the printer. On 13 October, the day the French occupied the town, he wrote to his friend Niethammer:

```quote
I saw the Emperor – this world-soul – riding out of the city on reconnaissance. It is indeed a wonderful sensation to see such an individual, who, concentrated here at a single point, astride a horse, reaches out over the world and masters it.
G. W. F. Hegel · Letter to Niethammer, trans. Clark Butler and Christiane Seiler · 1806
```

The famous "world-soul on horseback" (often "world spirit on horseback") is a later paraphrase of this letter (see *Napoleon and the Remaking of Europe*).

{{image: The Phenomenology of Spirit | Title page of the first edition of Hegel's Phenomenology of Spirit, published in 1807.}}

Hegel then edited a newspaper in Bamberg and ran a school in Nuremberg (from 1808 until 1815 or 1816; sources differ), publishing the *Science of Logic* (1812–16). The *Encyclopaedia of the Philosophical Sciences* (1817) came from Heidelberg, and in 1818 he took Fichte's old chair in Berlin. The *Philosophy of Right* was published in 1820, though its title page says 1821; his lectures on art, religion and history were published after his death from his and his students' notes. He died in Berlin on 14 November 1831, officially of cholera, though his biographer Terry Pinkard thinks another stomach illness more likely, and was buried beside Fichte.

## The Phenomenology and the Lord and Bondsman

The *Phenomenology* is a kind of education novel of the mind. It tests one "shape of consciousness" after another, from bare sense-certainty upwards; each collapses through its own inner contradiction into a new one, until the later chapters trace forms of social life from the Greeks to Hegel's own time and end in "Absolute Knowing".

Its most famous passage, "Lordship and Bondage" (Pinkard translates it "Mastery and Servitude"), can be set out as follows:

1. Self-consciousness cannot be certain of itself by consuming objects; it needs **recognition** (*Anerkennung*) from another self-consciousness, which it in turn recognises. (Here Hegel follows Fichte.)
2. Two self-consciousnesses meet. Each wants the other to acknowledge it, while treating the other as an inessential object.
3. Each must prove that it values its freedom more than any animal desire, even the desire to live: a **life-and-death struggle**. If one dies, recognition fails, for the dead recognise no one.
4. One side, fearing death, submits. The one who risked life becomes **lord**; the other becomes **bondsman**.
5. But the lord's victory is hollow: recognition from someone he does not count as free is worthless, and he comes to depend on the bondsman and on what the bondsman makes.
6. The bondsman, disciplined by fear and work, shapes the world and in doing so sees himself in it; he gains a mastery the lord lacks.

**Conclusion:** one-sided recognition cannot satisfy either party; only genuinely mutual recognition, secured in a shared order of rights and ethical life, can. Brandom sums up the failure as "authority without responsibility, on the side of the Master, and responsibility without authority, on the side of the Slave".

**Objection:** real masters do not want recognition from their slaves at all, so the story misdescribes servitude; Fanon's critique, described below, presses this. **Reply:** on the recognition reading (Williams, Honneth) the passage is not a chronicle but an argument about what a self needs, and its conclusion is precisely that domination cannot deliver recognition; one reader, Bird-Pollan, takes Fanon to show how racism distorts recognition rather than refuting Hegel. Hegel's history lectures add that humanity has liberated itself not *from* servitude but *by means of* it.

The passage was made famous by Alexandre Kojève's lectures in Paris (1933–39), heard by Bataille, Merleau-Ponty and Lacan. Kojève read it as the story of human history itself, from the first struggle to its end in a "universal and homogeneous state" foreshadowed by Napoleon; Fukuyama's "end of history" drew on him (see *The Post-Cold War Era*). Recognition theorists such as Honneth, Williams and Pippin read it instead as an analysis of freedom's social conditions; Renault has argued that the text does not even describe a slave revolt.

Susan Buck-Morss ("Hegel and Haiti", 2000; *Hegel, Haiti, and Universal History*, 2009) argued that Hegel must have known of the Saint-Domingue revolution (1791–1804) through the German journal *Minerva*, and that the passage reflects it (see *The Enlightenment and Rousseau*). Pierre-Franklin Tavarès had made a similar case in 1992, as she acknowledged; critics such as Anders Stephanson reply that the *Minerva* evidence needs more argument. Beauvoir's *The Second Sex* used the relation, via Kojève, to think about women (see *Existentialism: Sartre, Beauvoir and Camus* and *Feminist Philosophy*). Fanon, in a footnote to *Black Skin, White Masks*, observed that the colonial master differs from Hegel's: what he wants from the slave is work, not recognition. Scholars dispute whether Fanon thereby rejects Hegelian recognition or, as Bird-Pollan argues, accepts it (see *Race, Colonialism and Philosophy*).

```checkpoint
q: What does Fichte mean when he says that "the I posits itself"?
a*: That all consciousness rests on an original act of self-awareness, in which the I is both deed and product.
a: That the self creates the physical world out of nothing.
x: Breazeale stresses that "to posit" means to be aware of, not to create, and that Fichte was no solipsist.
a: That the self is a substance existing before any act of thought.
x: For Fichte the I is not a thing or substance but "what it posits itself to be".
a: That the self is known only through the thing in itself.
x: Fichte rejected the thing in itself as indefensible on critical grounds.
hint: Think of the word *Tathandlung*, "fact/act".
why: The self-positing I is an act of self-consciousness presupposed by all consciousness of objects; the not-I is posited to explain the "check" the I meets.
---
q: In Hegel's lord and bondsman passage, why does the lord's victory fail?
a: Because the bondsman immediately kills him.
x: If either dies, recognition fails altogether; the passage turns on both surviving.
a: Because the lord refuses to let the bondsman work.
x: The lord depends on the bondsman's work and its products.
a*: Because recognition from someone he does not regard as free is worthless, and he becomes dependent on the bondsman.
a: Because the lord loses the life-and-death struggle.
x: The lord is the one who risked his life and won.
hint: Ask what kind of recognition can actually satisfy a self.
why: Asymmetric recognition is "authority without responsibility"; only mutual recognition among free equals satisfies, while the bondsman, through work, comes to see himself in the world he shapes.
```

## What Hegel's Dialectic Actually Is

Hegel is often said to have reasoned in triads of "thesis, antithesis, synthesis". He did not. As the philosopher Walter Kaufmann put it, "Fichte introduced into German philosophy the three-step of thesis, antithesis, and synthesis ... Hegel did not": he never once used the three terms together for stages of an argument. The label was spread by Heinrich Moritz Chalybäus's 1837 history of philosophy from Kant to Hegel, and Hegel himself warned against turning dialectic into a "lifeless schema".

What he did describe, in the *Encyclopaedia Logic*, are **three moments** of thought. First, the **understanding** fixes stable, clear-cut concepts. Second, the **dialectical** moment shows each such concept to be one-sided, so that it "passes into its opposite". Third, the **speculative** moment grasps the unity of the opposed concepts. The key word is *aufheben*, usually translated "sublate", which has "a doubled meaning": to cancel and to preserve at once. A sublated concept is replaced, but lives on inside its successor.

The textbook example opens the *Logic*. Think of pure **Being**, with no qualities at all. Thought about carefully, it "is really no different from" pure **Nothing**. Yet Nothing, thought about, is just as empty as Being, so each turns into the other. The truth of both is **Becoming**, "the immediate vanishing of the one in the other": a new, richer concept, not a dead end. The method's claim to necessity rests on **determinate negation**. Scepticism finds only "pure nothingness" in a refuted position; Hegel finds a specific lesson:

"the result is conceived as it is in truth, namely, as a determinate negation; a new form has thereby immediately arisen" (*Phenomenology* §79, Miller's translation).

Because nothing is brought in from outside, Hegel calls this logic. Where Kant saw reason's contradictions, the antinomies, as a warning, Hegel took them as the engine of thought. Julie Maybee adds a caution: Being–Nothing–Becoming fits a triadic pattern, but many later sections do not, so the example should not be applied "too dogmatically".

## Freedom in the State and in History

Hegel's Philosophy of Spirit runs from the individual mind ("subjective spirit") through social institutions ("objective spirit") to "Absolute Spirit". The *Philosophy of Right* treats objective spirit: property as reciprocal recognition, then morality, then **ethical life** (*Sittlichkeit*): family, civil society and state. Hegel saw that an unfettered market "produces a class caught in a spiral of poverty". Its preface claims, in the usual translation, that "what is rational is actual and what is actual is rational", where "actual" means not whatever exists but what lives up to its rational concept, and that philosophy is "its own time comprehended in thoughts":

```quote
When philosophy paints its grey in grey, one form of life has become old, and by means of grey it cannot be rejuvenated, but only known. The owl of Minerva takes its flight only when the shades of night are gathering.
G. W. F. Hegel · Philosophy of Right, Preface, trans. S. W. Dyde · 1820
```

Haym (1857) and later Popper, who called Hegel "the father of modern historicism and totalitarianism", read the book as a defence of the Prussian state. Popper leaned on the phrase "the march of God in the world", which comes from a student's lecture note (the Addition to §258), not Hegel's own text. Avineri and Knox defended a liberal Hegel, and most commentators now agree that Popper was wrong. Hegel's claim that women belong to the family rather than to civil society and the state has been "rightly" criticised by feminists (see *Women Philosophers of the Early Modern Era*, which quotes the notorious lecture addition to §166).

The history lectures, given five times between 1822 and 1831 and first edited by Eduard Gans in 1837, treat world history as, in one modern translation, "the development of the spirit's consciousness of its own freedom and of the consequent realization of this freedom". In the same translation, the Orientals "only know that One is free", the Greeks and Romans that "Some" are free, and the Germanic peoples, with Christianity, that "All men are by nature free"; the Reformation, the Enlightenment and the French Revolution mark the way. History is a "slaughter-bench", yet Hegel presents it as a theodicy, a justification of God's ways, steered by a "cunning of reason".

The SEP calls this "a clearly Eurocentric account". The lectures shut Africa out of history altogether (the old English translation, as commonly quoted, calls it "no historical part of the World"), and his *Encyclopaedia* contains remarks now widely recognised as racist. Robert Bernasconi argues that Hegel pushed already biased travellers' reports further in a negative direction; Joseph McCarney replied, and Bernasconi notes that the composite editions make some sayings hard to attribute. The Ethiopian-born historian Teshale Tibebu argues that Hegel ranks Africans at the stage of sense, Asians at that of understanding and Europeans at that of reason. Defenders such as Pinkard and Fritzman hold that the prejudice can be separated from the core idea of freedom. See *Philosophy in an Age of Empire* and *Modern African History since 1860*.

## Absolute Spirit: Art, Religion, Philosophy

At the summit, spirit knows itself in three ways. In **art** the absolute takes sensuous form, passing from symbolic art (Persia, India, Egypt) through classical Greek art to the romantic art of the Christian world. Hegel's remark that art, "considered in its highest vocation, is and remains for us a thing of the past" (Knox's translation) does not announce the "death of art", a phrase he never used; it means that art no longer has the last word on truth (see *Beauty and Taste*). **Religion** has the same content as philosophy, God, but in the form of images and stories. **Philosophy** grasps that content in concepts, as "the unity of Art and Religion". Hence the charges of pantheism and atheism that followed him.

## Two Ways of Reading Hegel

What does "Absolute Spirit" refer to? On the **traditional metaphysical** reading, dominant until the mid-twentieth century and defended by Taylor and Frederick Beiser, it is God coming to know himself through finite minds; Hegel did say that philosophy "has no other object but God". From 1989, Pippin and Terry Pinkard developed a **post-Kantian** reading (once called "non-metaphysical"): Hegel completes Kant by showing that reason and freedom are social and historical achievements, "deindividualizing and historicizing Kant's idea of freedom". Critics say this projects modern views onto Hegel; "revised metaphysical" readers such as Stephen Houlgate hold that the *Logic* is an ontology, a theory of being, that accepts Kant's critique of old rationalist metaphysics without giving up metaphysics as such. Pippin now speaks of a metaphysics "in a new sense".

## After Hegel: Right and Left

The quarrel began over religion. Strauss's *The Life of Jesus* (1835–36) read the Gospel stories as myths of the early Christian community. Strauss himself divided Hegel's followers, borrowing the seating of the French parliament: a Right, for whom the Gospels fit Hegel; a Centre; and a Left, for whom they did not. The labels were polemical: no one then called himself a "Right Hegelian". The Left, or Young Hegelians, flourished in Berlin from the late 1830s until 1844. Ludwig Feuerbach's *The Essence of Christianity* (1841) made God a projection of human nature: "the richer is God, the poorer is man". Bruno Bauer was dismissed from Bonn in 1842 for his writings on the New Testament; Arnold Ruge edited the *Hallische Jahrbücher*; Cieszkowski coined the term *praxis* (action) and turned Hegel's owl of Minerva into an "Eagle of Apollo"; Max Stirner published *The Ego and Its Own* (1844); and Marx broke with Bauer in "On the Jewish Question" (1843) and went on to turn Hegel's history into a materialist one (see *Marx*, and later *Critical Theory: the Frankfurt School and Habermas*).

Meanwhile Schelling, after Hegel's death an open critic of Hegelianism, was called to Hegel's Berlin chair in 1841, reputedly to counter Hegel's influence. Against a "negative" philosophy of pure reason he set a "positive" philosophy of existence, since existence does not follow from any concept. Kierkegaard, Engels, Bakunin, Ranke and Alexander von Humboldt came to listen; Kierkegaard complained of "quite insufferable nonsense", and Schelling was largely ignored. Yet his critique fed Kierkegaard (see *Schopenhauer and Kierkegaard*), Nietzsche (see *Nietzsche*) and Heidegger.

```checkpoint
q: What does Hegel mean by *aufheben* ("sublate")?
a: To refute a concept so completely that nothing of it remains.
x: That is closer to what Hegel says scepticism does, seeing "only pure nothingness" in a result.
a*: To cancel and preserve at the same time, as Becoming replaces Being and Nothing yet depends on them.
a: To combine a thesis and an antithesis into a synthesis.
x: Kaufmann notes that Hegel never used those three terms together; the formula is Fichte's, popularised by Chalybäus.
a: To raise a concept to the level of religious images.
x: Religion uses images, but sublation is a general feature of dialectical thought.
hint: Hegel stressed that the word has "a doubled meaning".
why: A sublated concept is overcome but kept within its successor; this is why determinate negation yields a new, specific concept rather than mere emptiness.
---
q: Who coined the labels "Right", "Centre" and "Left" Hegelians, and over what?
a: Marx, over economics.
x: Marx came later and was himself counted among the Left; the split began over religion.
a: Hegel, over the Prussian constitution.
x: The split came after Hegel's death in 1831.
a: Kojève, over the end of history.
x: Kojève lectured in the 1930s, a century later.
a*: Strauss, over whether the Gospel narratives are compatible with Hegel's philosophy.
hint: Think of the author of *The Life of Jesus* (1835–36).
why: Strauss borrowed the French parliament's seating to sort Hegel's followers by their view of the Gospels; nobody called himself a "Right Hegelian".
```

## Further exploration

- **Terry Pinkard, *Hegel: A Biography* (2000).** The standard life, from Stuttgart to Berlin.
- **Frederick C. Beiser, *German Idealism: The Struggle Against Subjectivism, 1781–1801* (2002).** How Kant's first readers became Fichte and Schelling.
- **Frederick C. Beiser, *Hegel* (2005).** A clear introduction defending a metaphysical reading.
- **Stephen Houlgate, *An Introduction to Hegel: Freedom, Truth and History* (1991; 2nd edn 2005).** An accessible guide from a "revised metaphysical" standpoint.
- **Andrew Bowie, *Schelling and Modern European Philosophy: An Introduction* (1993).** The first full-length account of Schelling in English.
- **Susan Buck-Morss, *Hegel, Haiti, and Universal History* (2009).** The contested case that the Haitian Revolution lies behind the lord and bondsman.
- **Teshale Tibebu, *Hegel and the Third World: The Making of Eurocentrism in World History* (2011).** A critique of Hegel's philosophy of history from outside Europe.$idealism_master$,
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
  select $idealism_quiz$[
    {"type": "mcq", "prompt": "Which objection to Kant did Jacobi, Schulze and Maimon press in different forms, leading Fichte to abandon the thing in itself?", "options": ["That Kant's thing in itself, as the cause of our sensations, uses causality beyond the limits of experience that Kant himself set", "That Kant had ignored mathematics entirely", "That Kant's ethics was too religious", "That Kant had plagiarised Reinhold's Principle of Consciousness"], "answerIndex": 0, "explanation": "Jacobi said that without the thing in itself he could not enter Kant's system, but with it he could not stay within it; Schulze's Aenesidemus (1792) charged that Kant applies causality beyond its limits; Maimon pushed Hume's scepticism against the Deduction. Fichte took these criticisms to heart.", "id": "q1"},
    {"type": "mcq", "prompt": "Where does the formula 'thesis, antithesis, synthesis' come from?", "options": ["Hegel's own Science of Logic, where he uses it for every transition", "Fichte introduced it; Chalybäus's 1837 history popularised it as a description of Hegel, though Hegel never used the three terms together", "Marx invented it to describe class struggle", "Kojève coined it in his Paris lectures of the 1930s"], "answerIndex": 1, "explanation": "Kaufmann notes that Fichte introduced the three-step and that Hegel never used the three terms together; Chalybäus spread the label in 1837. Hegel himself spoke of the moments of understanding, dialectic and speculation, and of sublation and determinate negation.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the verified wording of Hegel's 1806 description of Napoleon, in Butler and Seiler's translation?", "options": ["'I have seen the world spirit on horseback'", "'The world-soul on horseback has conquered Germany'", "'I saw the Emperor – this world-soul – riding out of the city on reconnaissance'", "'Napoleon is the march of God in the world'"], "answerIndex": 2, "explanation": "In his letter to Niethammer of 13 October 1806 Hegel wrote of seeing 'the Emperor – this world-soul – riding out of the city on reconnaissance'. 'World-soul (or world spirit) on horseback' is a later paraphrase, and 'the march of God in the world' comes from a student's note on the Philosophy of Right, not about Napoleon.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Hegel mean by saying art 'is and remains for us a thing of the past'?", "options": ["That no more art would be made after his time", "That art is inferior to nature", "That only Greek art counts as art", "That art no longer has ultimate authority as the highest way of grasping truth, which has passed to religion and philosophy"], "answerIndex": 3, "explanation": "Houlgate and others stress that Hegel did not announce a 'death of art', a phrase he never used; art 'considered in its highest vocation' no longer has the last word, since religion and above all philosophy grasp the same content more adequately.", "id": "q4"},
    {"type": "open", "prompt": "Set out Hegel's argument in the lord and bondsman passage of the Phenomenology of Spirit step by step. Then compare two ways of interpreting it (for example Kojève's, the recognition-theoretic reading, Buck-Morss's Haiti thesis, or Fanon's critique).", "rubric": "A strong answer explains that self-consciousness needs recognition from another; the encounter and the life-and-death struggle; one submits from fear of death and becomes bondsman; the lord's recognition is hollow because it comes from one he does not count as free, and he depends on the bondsman; the bondsman through fear and work shapes the world and sees himself in it; the conclusion that only mutual recognition satisfies (Brandom's 'authority without responsibility'). It then compares at least two readings accurately: Kojève's anthropological history ending in the universal and homogeneous state; Honneth, Williams and Pippin on recognition; Buck-Morss's claim that Hegel knew of the Saint-Domingue revolution through Minerva, with Tavarès's priority and critics such as Stephanson; Fanon's point that the colonial master wants work, not recognition, and the dispute over whether he rejects or accepts Hegel's recognition.", "id": "q5"},
    {"type": "open", "prompt": "Hegel presented world history as the progress of the consciousness of freedom. Explain this view and assess the charge that it is Eurocentric.", "rubric": "A strong answer explains the One/Some/All scheme (Orientals, Greeks and Romans, Germanic peoples with Christianity), the milestones of Reformation, Enlightenment and French Revolution, history as a 'slaughter-bench' and theodicy, and the lectures' status (given five times, first edited by Gans in 1837). It assesses the charge: the SEP calls the account 'clearly Eurocentric'; Africa was excluded from history ('no historical part of the World' in the old translation as commonly quoted); Bernasconi argues Hegel worsened biased sources, with McCarney's reply and the problem of composite editions; Tibebu on the making of Eurocentrism; defenders such as Pinkard and Fritzman say the prejudice can be separated from the idea of freedom. It reaches a reasoned judgement.", "id": "q6"}
  ]$idealism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/german-idealism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
