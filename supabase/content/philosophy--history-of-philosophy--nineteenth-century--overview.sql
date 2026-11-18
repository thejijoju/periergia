-- The Nineteenth Century — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century',
    'research',
    'advanced',
    'read',
    $nineteenthoverview_master$> **A century in which philosophers took up Kant's questions, and others pursued their own, from Jena and Copenhagen to Calcutta, Tokyo, Mexico City and Atlanta.** This overview takes Kant as the shared starting point; compares how the section's seven chapters handled the system and the individual, the direction of history, God and suffering, happiness and liberty, truth and practice, and who counted; looks at how traditions read one another; flags the labels and legends that came later; and ends with a guide to the chapters.

## Philosophy after Kant

As *German Idealism: Fichte, Schelling and Hegel* puts it, Kant argued that we know only appearances, shaped by our own minds, while things "in themselves" stay unknown (see *Kant*). Much of what follows can be read as a set of replies to that claim. In 1787 Jacobi pressed the difficulty: Kant needs the thing in itself to cause our sensations, yet his own rules forbid applying causality beyond experience.

The chapters show how differently the problem was taken up. Fichte dropped the thing in itself and started from the free, self-positing I. Hegel took the contradictions that Kant had treated as a warning, the antinomies, as the engine of thought. Schopenhauer accepted Kant's distinction between appearance and thing in itself, counting it Kant's greatest merit, but claimed to reach the thing in itself by another route: through the double knowledge each of us has of our own body, seen from outside and felt from within as will. Kierkegaard's readers still dispute whether the "ethical" that Abraham suspends in *Fear and Trembling* is Hegel's customary morality, as most read it, or Kantian or Fichtean ethics, as others do; and Nietzsche's critique of morality took Christian and Kantian ethics as its main examples.

Kant reached further than Germany. Peirce spent three years on the *Critique of Pure Reason* as a teenager, and Dewey wrote his doctoral thesis on Kant's psychology. In Meiji Japan, through Tokyo Imperial University's ties with Germany, Kant came to dominate, and the Buddhist priest Inoue Enryō honoured him as one of "Four Sages". Not every line began with him, though. Bentham found the principle of utility in 1769, reading Hume, and drew on Helvétius and Beccaria. Mill's *System of Logic* argued that even mathematics is inductive, a generalisation from experience, and so aimed to drive intuitionism from its "stronghold".

## The System and the Single Individual

Hegel's *Phenomenology of Spirit* tests one "shape of consciousness" after another until it ends in "Absolute Knowing", and his Philosophy of Spirit runs from the individual mind through social institutions to Absolute Spirit. The century's rebels set the existing individual against this. When Schelling was called to Hegel's Berlin chair in 1841 he opposed a "negative" philosophy of pure reason with a "positive" philosophy of existence, since existence does not follow from any concept; Kierkegaard came to listen and complained of "quite insufferable nonsense", yet the critique fed him. Kierkegaard's pseudonym Johannes Climacus argued that a logical system is possible but an existential system is not. Nietzsche declared that he mistrusted all systematisers.

The opposition can be overdrawn. *Schopenhauer and Kierkegaard* reports that Kierkegaard's main targets were the Danish Hegelians of Copenhagen rather than Hegel, and that Jon Stewart's revisionist study narrowed the gap between them. And the system-builders were not indifferent to individuals. Fichte held that a self must find itself "summoned" by another free being, so that mutual recognition is a condition of being a self; Hegel's lord and bondsman turned that idea into an argument that only mutual recognition among free equals can satisfy anyone. Even Marx, whose name became attached to a system, is judged by the Stanford Encyclopedia "less systematic than sometimes thought". Peirce, in 1868, attacked the "Cartesian" idea that certainty is tested in the individual consciousness. And in "The Fixation of Belief" what defeats the tenacious believer is the "social impulse": meeting others whose opinions seem as good as one's own.

## Does History Have a Direction?

Hegel claimed that it does, and the chapters can be read as a series of answers to him. Set side by side:

1. **Hegel.** World history is the development of spirit's consciousness of its own freedom: in H. B. Nisbet's translation, the Orientals "only know that One is free", the Greeks and Romans that "Some" are free, and the Germanic peoples, with Christianity, that "All men are by nature free". History is a "slaughter-bench", yet it is steered by a "cunning of reason".
2. **The Young Hegelians.** Hegel's followers split over religion: Strauss read the Gospel stories as myths of the early Christian community, and Feuerbach made God a projection of human nature. Cieszkowski coined the term *praxis*, action.
3. **Marx.** History keeps its direction, but the engine moves from consciousness to production: "it is not the consciousness of men that determines their existence, but their social existence that determines their consciousness." G. A. Cohen rebuilt the theory as a functional explanation; Jon Elster objected that without a mechanism it appeals to purposes in history that are no one's purposes. Late in life Marx himself wrote that the "historical inevitability" described in *Capital* was "expressly restricted to the countries of Western Europe".
4. **Kierkegaard.** The spheres of existence are not stages that everyone passes through but rival views of what makes life worth living, between which one moves by choice and passion.
5. **Nietzsche.** History is used not to show progress but to assess values: the *Genealogy* traces modern morality to a "slave revolt" driven by resentment, though the Stanford Encyclopedia calls the Second Treatise "conjectural history".
6. **The positivists and the liberal imperialists.** Comte held that thought passes through theological, metaphysical and positive stages, and Gabino Barreda read Mexico's civil wars through them. Liberal imperialism, as Margaret Kohn and Kavita Reddy describe it, joined universal principles to a "developmental history" in which peoples became fit for self-government only at a certain "stage of civilization"; Mill excluded "backward states of society" from *On Liberty*'s principle.
7. **Conclusion (this overview's own synthesis).** Set side by side, these chapters suggest that the claim that history has a direction had become a political argument as much as a metaphysical one: depending on who used it, it could justify revolution, reform or colonial rule, and so the question of who decides where a people stands in history became as pressing as the question of where history goes.

**The objection** is that the direction can be kept and the prejudice dropped: defenders of Hegel such as Terry Pinkard hold that his Eurocentrism can be separated from the core idea of freedom. **The reply** is that the lectures shut Africa out of history altogether: Robert Bernasconi argues that Hegel pushed already biased travellers' reports further in a negative direction, and Teshale Tibebu that he ranks Africans at the stage of sense, Asians at that of understanding and Europeans at that of reason; and the chapters on *Marx* and *Philosophy in an Age of Empire* show the developmental scheme being narrowed from within, by late Marx's letter to Vera Zasulich, and challenged from outside, as when José Martí, against the positivists, blamed "backwardness" not on race but on international policies. The debate is open.

## God, Suffering and the Critique of Religion

Schopenhauer drew pessimism from his metaphysics: everything is a striving with no final goal, striving springs from lack, satisfaction does not last, and life swings between pain and boredom. Nietzsche discovered Schopenhauer's book in 1865, and Bernard Reginster reads the will to power as a reply to Schopenhauer's will to live. Nietzsche's madman announces that God is dead to a crowd of unbelievers: the point is not that atheism is true but that everything built on the belief, "the whole of our European morality", must eventually collapse. The danger he named was nihilism, a word Jacobi had given its philosophical meaning in 1799 when he attacked Fichte.

The critique of religion took many forms. Fichte lost his Jena post in an atheism dispute. Feuerbach made God a projection of human powers, and Marx answered that religion responds to alienation in material life: "the sigh of the oppressed creature" and "the opium of the people", in which Avineri hears "empathy, not scorn". Kierkegaard attacked the Danish state church in the name of New Testament Christianity, a critique from within. William James defended a "right to believe" where a genuine option cannot be settled by evidence. Outside Europe, critique often meant reform: Rammohun Roy campaigned against widow-burning, and the argument that carried the day held that scripture did not enjoin it as a duty; Dayananda Saraswati sought a revival of Vedic authority while opposing idol worship and birth-based caste, and Sayyid Ahmad Khan, on one secondary account, held that nature and revelation, both God's, cannot contradict each other.

## Happiness, Liberty and Modern Morality

Bentham founded morality on "two sovereign masters, pain and pleasure", and counted only quantity; Mill added that pleasures differ in quality, which critics said abandoned hedonism. Henry Sidgwick found both rational egoism and the "point of view of the Universe" reasonable and could not reconcile them. Marx never said directly that exploitation was unjust, and Cohen quipped that he believed capitalism unjust without believing that he believed it. Nietzsche attacked "morality in the pejorative sense", Christian and Kantian above all and utilitarian hedonism too, for stunting the highest human types.

On liberty the chapters disagree as sharply. Mill's *On Liberty* held that power may rightly be used over anyone against their will only "to prevent harm to others"; Mill did not himself call this the "harm principle", and his free-speech argument partly qualifies it. Harriet Taylor Mill's share in that book and in *The Subjection of Women* is a live debate. Marx called liberal rights "rights of separation", which protect each person from the others. Hegel located freedom in an order of rights and ethical life, and Dewey defined democracy as "primarily a mode of associated living". Gandhi argued that self-rule is not a change of rulers.

```checkpoint
q: Why does this overview suggest that Schopenhauer's route to the thing in itself is a reply to Kant?
a*: Because he kept Kant's distinction between appearance and thing in itself but claimed to reach the latter through inner knowledge of his own body as will, since causal inference beyond experience is ruled out.
a: Because he rejected Kant's distinction between appearance and thing in itself altogether.
x: He counted that distinction Kant's greatest merit.
a: Because he inferred the thing in itself as the cause of our sensations, as Kant had done.
x: That is the route Jacobi and Schulze showed to be blocked, since causality applies only within experience.
a: Because he found the thing in itself described in the Upanishads and simply adopted it.
x: He claimed that the Upanishads agreed with his philosophy, not that he derived his argument from them.
hint: Which object does each of us know in two ways?
why: Schopenhauer treated willing and bodily movement as one act seen from two sides and took that inner view as the key to everything else, while later saying that the thing in itself is will only "to us".
---
q: How did late Marx qualify the direction of history described in Capital?
a: He said history has no direction at all.
x: He kept a theory of history; he restricted the scope of its "inevitability".
a: He said the Russian commune must first pass through capitalism.
x: He suggested the commune could be "the fulcrum of social regeneration in Russia".
a*: He told Vera Zasulich that its "historical inevitability" was "expressly restricted to the countries of Western Europe".
a: He adopted Comte's three stages.
x: Comte's stages belong to the positivists, such as Barreda in Mexico, not to Marx.
hint: Think of his letter of 1881 about the Russian peasant commune.
why: Kevin B. Anderson reads such late writings as a move from a single-track to a "multilinear and nonreductionist" view of history.
```

## Truth and Practice

The young Marx put the turn towards practice sharply:

```quote
The philosophers have only interpreted the world in various ways; the point is to change it.
Karl Marx · Theses on Feuerbach, XI (Collected Works, vol. 5, pp. 3–5) · 1845
```

The pragmatists turned practice into a theory of meaning and truth. Peirce's maxim made our conception of an object's conceivable practical effects "the whole of our conception of the object", and he called truth the opinion "fated to be ultimately agreed to by all who investigate". James called the true "only the expedient in the way of our thinking", which Russell and Moore attacked; Dewey preferred "warranted assertibility". Others moved the other way. Nietzsche ended the *Genealogy* by questioning the value of the unconditional will to truth itself, and his perspectivism denied any "view from nowhere"; whether it refutes itself is debated. For Kierkegaard's Climacus, subjective truth is "the highest truth attainable".

## Who Counted

The chapters do not spare their subjects. Hegel held that women belong to the family rather than to civil society and the state; Schopenhauer's "On Women", in a widely circulated nineteenth-century translation, called women "big children all their life long" and his aesthetics denied that women could be geniuses; Nietzsche's remarks in *Beyond Good and Evil* divide feminist readers. Women argued back: Harriet Taylor Mill in "The Enfranchisement of Women", Jane Addams at Hull House, Pandita Ramabai and Savitribai Phule in Pune, and Anna Julia Cooper, whose *A Voice from the South* is called the first book-length Black feminist text.

Race and empire run through the section. Hegel shut Africa out of history; Mill applied his principle of liberty only to "human beings in the maturity of their faculties" and served the East India Company for almost thirty-five years; Marx's 1853 articles called England "the unconscious tool of history" in India; the Stanford Encyclopedia judges that Sidgwick did not rise above the imperialist and racist tendencies of his era; Schopenhauer placed the highest civilisation, "apart from the ancient Hindus and Egyptians", among "the white races". Anténor Firmin rebutted Gobineau's ranking of races, Frederick Douglass showed that slaveholders' own laws revealed their "guilty knowledge" of the slave's humanity, and Du Bois named "the problem of the color-line" and gave "double-consciousness", a term already in use, his own sense: seeing oneself through a contemptuous world's eyes. On caste, Jotirao Phule's *Gulamgiri* recast the Aryan-invasion theory, and Ambedkar argued that caste is "not merely a division of labour but a division of labourers".

## Reading and Being Read

When European philosophers read other traditions they sometimes read them through intermediaries. Schopenhauer read the Upanishads in a Latin version of a Persian version; whether Indian thought shaped his metaphysics, confirmed it or merely runs parallel to it is still argued by Urs App, Douglas Berger and Stephen Cross, and in 1844 he insisted that Buddhism had not influenced the work he published in 1818. A separate charge concerns what was made of the material: Said took Marx's India articles to reproduce Orientalist assumptions, a reading Aijaz Ahmad and Irfan Habib contested.

The traffic also ran the other way, and on the readers' own terms. Japanese scholars coined *tetsugaku* for Western philosophy rather than reuse an old word for sages. Nishida Kitarō's "pure experience" shows the influence of William James. Iqbal replied that his idea of the Perfect Man predated his reading of Nietzsche, Lu Xun translated part of *Zarathustra*, and Nishitani Keiji read Nietzsche through Buddhism. Dewey lectured in China from 1919 to 1921, with Hu Shih rendering "pragmatism" as "experimentalism". Du Bois took Jamesian pragmatism into "all human action", and Ambedkar studied at Columbia under Dewey's influence.

## Labels Given Afterwards

Several of the section's familiar names came later or were polemical. Ricoeur later grouped Marx, Nietzsche and Freud as "masters of suspicion", thinkers who taught readers to ask what interests lie behind beliefs. "Right", "Centre" and "Left" Hegelians were Strauss's own polemical labels, borrowed from the French parliament, and recent scholars question how neatly they fit. Ayon Maharaj argues that "Neo-Vedānta" misleadingly implies novelty and is coloured by Paul Hacker's polemical use; Wilhelm Halbfass noted the "obvious" polemical undertone of "Neo-Hinduism". The Stanford Encyclopedia warns that calling Kierkegaard the "father of existentialism" "obscures at least as much as it reveals". Hegel never reasoned by "thesis, antithesis, synthesis"; Bentham never used the phrase "felicific calculus"; "false consciousness" is not Marx's phrase; Engels used it (and Destutt de Tracy before him).

## Compilations, Legends and Translations

The section's sources need the same care. *The Will to Power* was compiled from the notebooks by Elisabeth Förster-Nietzsche and Peter Gast under a title Nietzsche had abandoned; Mazzino Montinari called it a forgery. *The German Ideology* was left to "the gnawing criticism of the mice" and published only in 1932, and most scholars now think it was meant as a series of articles. Hegel's lectures on art, religion and history were published from his and his students' notes, and the "march of God in the world" on which Popper leaned comes from a student's note. The Turin horse is best treated as legend. Searches of Kierkegaard's collected works found no "leap of faith", and "there are no facts, only interpretations" comes from an unpublished notebook. Attributions are disputed: the *Communist Manifesto*'s drafting, the unsigned "Leaving Asia" editorial probably by Fukuzawa Yukichi, and passages of *On Liberty* that a 2022 stylometric study assigned to Harriet Taylor Mill or to both Mills jointly. Translation shapes meaning too: *aufheben* both cancels and preserves, and *Übermensch* became "Superman" or "overman".

```checkpoint
q: Which of these labels does the section describe as the participants' own?
a: "Masters of suspicion", which Marx and Nietzsche used of themselves.
x: Ricoeur grouped Marx, Nietzsche and Freud under that name later.
a*: "Right", "Centre" and "Left" Hegelians, which Strauss coined, though polemically.
a: "Neo-Vedānta", which Vivekananda used to describe his teaching.
x: Maharaj finds the label coloured by Paul Hacker's polemical use.
a: "Felicific calculus", which Bentham used for his method.
x: Bentham never used that phrase; it was applied to his method later.
hint: Who wrote The Life of Jesus (1835–36)?
why: Strauss borrowed the French parliament's seating to sort Hegel's followers by their view of the Gospels; recent scholars question how neatly the labels fit.
---
q: What do the chapters say about The Will to Power?
a: It is Nietzsche's last finished book, published in 1888.
x: His 1888 books include Twilight of the Idols and The Antichrist, not The Will to Power.
a: It was compiled by Walter Kaufmann after the Second World War.
x: Kaufmann helped rescue Nietzsche's reputation; he did not compile this book.
a: It was a forgery written by the Nazi ideologue Alfred Baeumler.
x: Baeumler presented Nietzsche as a political thinker; he did not compile the notebooks.
a*: It was compiled from the notebooks by Elisabeth Förster-Nietzsche and Peter Gast under a title Nietzsche had abandoned.
hint: Who controlled the Nietzsche Archive?
why: The SEP calls it "not well founded in Nietzsche's surviving plans"; Montinari called it a forgery.
```

## The Chapters

- *German Idealism: Fichte, Schelling and Hegel*: Kant's first critics, Fichte's I and not-I, Schelling's philosophy of nature, and Hegel's *Phenomenology*, dialectic, history, Absolute Spirit and heirs.
- *Schopenhauer and Kierkegaard*: will and representation, pessimism, art, compassion and India; the pseudonyms, spheres, Abraham, anxiety and despair.
- *Bentham, Mill and Utilitarianism*: Bentham's principle, law and Panopticon; Mill's pleasures, proof, logic, liberty and empire; Harriet Taylor Mill; Sidgwick.
- *Marx*: alienation, historical materialism, ideology, class, *Capital*, Engels, India and Russia, and the Marxisms.
- *Nietzsche*: the death of God, the *Genealogy*, perspectivism, will to power, recurrence, the sister and the Nazis, and readers abroad.
- *American Pragmatism: Peirce, James and Dewey*: inquiry and signs, the will to believe and truth, experience, education and democracy, Addams, Du Bois and the revival.
- *Philosophy in an Age of Empire*: Indian and Muslim reformers, Meiji Japan, Latin American positivism, and the Black Atlantic to Du Bois.

The story continues in *The Twentieth Century and After*.

## Further exploration

- **Frederick C. Beiser, *German Idealism: The Struggle Against Subjectivism, 1781–1801* (2002).** How Kant's first readers became Fichte and Schelling.
- **Clare Carlisle, *Philosopher of the Heart: The Restless Life of Søren Kierkegaard* (2019).** A biography that doubles as an introduction to the works.
- **Jennifer Pitts, *A Turn to Empire: The Rise of Imperial Liberalism in Britain and France* (2005).** How Bentham's anti-imperialism gave way to Mill's liberal imperialism.
- **Gareth Stedman Jones, *Karl Marx: Greatness and Illusion* (2016).** A major biography that sets Marx firmly in his own century.
- **Walter Kaufmann, *Nietzsche: Philosopher, Psychologist, Antichrist* (1950).** The book that rescued Nietzsche for post-war readers.
- **Cheryl Misak, *The American Pragmatists* (2013).** The tradition from the Metaphysical Club to the present, told from a Peircean standpoint.
- **Nalini Bhushan and Jay L. Garfield, *Minds Without Fear: Philosophy in the Indian Renaissance* (2017).** Indian philosophers writing in English under the Raj.$nineteenthoverview_master$,
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
  select $nineteenthoverview_quiz$[
    {"type": "mcq", "prompt": "Which thinker in this section claimed to reach Kant's thing in itself through the double knowledge each of us has of our own body?", "options": ["Fichte", "Hegel", "Schopenhauer", "Peirce"], "answerIndex": 2, "explanation": "Schopenhauer held that we know our body from outside as an object and from inside as will, and took this as the key to the inner nature of everything. Fichte dropped the thing in itself and started from the self-positing I; Hegel treated Kant's antinomies as the engine of thought; Peirce attacked 'Cartesian' doubt and developed a theory of inquiry.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these labels was coined by a participant in the debates it describes?", "options": ["'Right', 'Centre' and 'Left' Hegelians", "'Masters of suspicion'", "'Neo-Vedānta'", "'Felicific calculus'"], "answerIndex": 0, "explanation": "Strauss sorted Hegel's followers by their view of the Gospels, borrowing the French parliament's seating; the labels were polemical, and recent scholars question how neatly they fit. Ricoeur grouped Marx, Nietzsche and Freud as 'masters of suspicion' later; Maharaj finds 'Neo-Vedānta' coloured by Paul Hacker's polemical use; Bentham never used the phrase 'felicific calculus'.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Ambedkar argue in Annihilation of Caste (1936)?", "options": ["That caste is an efficient division of labour that should be reformed, not abolished", "That caste is the work of British colonial census-takers", "That caste is a matter of private belief that the law should ignore", "That caste is 'not merely a division of labour but a division of labourers', resting on religious teaching"], "answerIndex": 3, "explanation": "Ambedkar argued that a division of labour is efficient only when work follows choice and aptitude, whereas caste assigns work by birth and grades labourers in a hierarchy; since it rests on religious teaching, 'the enemy, you must grapple with, is not the people who observe Caste, but the Shastras'.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about Nietzsche's announcement that 'God is dead' fits the chapter on Nietzsche?", "options": ["It is an argument that atheism is true, addressed to believers", "It warns unbelievers that everything built on the dying belief, including European morality, must eventually collapse", "It celebrates a cheerful liberation from all values", "It first appeared in The Will to Power, compiled after his death"], "answerIndex": 1, "explanation": "In The Gay Science §125 the madman's listeners are already atheists; his point, spelled out in §343, is that 'the whole of our European morality' rests on the belief and has not yet been seen to fall with it. Anderson stresses that the fitting response is mourning, not cheerful liberation, and the passage is in a book Nietzsche published in 1882.", "id": "q4"},
    {"type": "open", "prompt": "Compare how Hegel, Marx and Nietzsche each treat history, and explain what the positivists and liberal imperialists in this section added to the question of whether history has a direction.", "rubric": "A strong answer explains Hegel's history as the development of spirit's consciousness of its own freedom (One, Some, All; 'slaughter-bench'; 'cunning of reason') and the debate over its Eurocentrism (Bernasconi, Tibebu against Pinkard). It explains Marx's move from consciousness to production (the 1859 Preface), Cohen's functional reconstruction and Elster's objection that it lacks a mechanism, and late Marx's restriction of 'historical inevitability' to Western Europe in the Zasulich letter. It explains Nietzsche's genealogy as history used to assess values rather than to show progress, noting the SEP's 'conjectural history'. It then describes Comte's three stages and Barreda's use of them in Mexico, and the 'developmental history' of liberal imperialism (Kohn and Reddy) in which Mill excluded 'backward states of society' from On Liberty's principle; credit for Martí's reply that 'backwardness' reflects international policies, not race.", "id": "q5"},
    {"type": "open", "prompt": "Using at least three chapters, explain why readers of nineteenth-century philosophy need to be careful about their sources, and give examples of posthumous compilations, legends, disputed attributions and translation choices.", "rubric": "A strong answer gives accurate examples: The Will to Power compiled by Elisabeth Förster-Nietzsche and Peter Gast under an abandoned title (Montinari called it a forgery); The German Ideology left to 'the gnawing criticism of the mice', published in 1932 and probably meant as articles; Hegel's lectures published from notes, with 'the march of God in the world' from a student's note; the Turin horse as legend; no 'leap of faith' in Kierkegaard's collected works and 'truth is subjectivity' as the pseudonym Climacus's; 'there are no facts, only interpretations' from an unpublished notebook; disputed attributions such as the Manifesto's drafting, the unsigned 'Leaving Asia' editorial, and Harriet Taylor Mill's share in On Liberty; translation choices such as aufheben (cancel and preserve), Übermensch ('Superman' or 'overman'), and Schopenhauer reading the Upanishads in a Latin version of a Persian version. It explains why such cases matter for interpretation.", "id": "q6"}
  ]$nineteenthoverview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
