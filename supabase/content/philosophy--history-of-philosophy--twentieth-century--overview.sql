-- The Twentieth Century and After — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century',
    'research',
    'advanced',
    'read',
    $twentiethoverview_master$> **A century in which philosophy split into rival camps, argued about language, experience and power, and was asked, in country after country, whose thinking counted as philosophy at all.** This overview treats "analytic" and "continental" as labels with a history; compares how the section's twelve chapters handled language, experience, reason and power, and freedom; sets the authenticity debates of Latin America, Africa, India, China and Japan side by side; looks at the politics of philosophers and at the editions, translations and legends behind familiar sources; and ends with a guide to the chapters.

## A Divide with a History

Twentieth-century philosophy is often presented as two camps: an "analytic" tradition of logic and argument, and a "continental" tradition of phenomenology, existentialism and critical theory. The chapters suggest that the line was not there at the start, and that it was drawn, crossed and redrawn.

Take the beginning. In 1894 Gottlob Frege reviewed Edmund Husserl's *Philosophy of Arithmetic* critically and accused him of **psychologism**, the view that logic is a branch of psychology because judging is a mental process. Husserl's *Logical Investigations* (1900–1901) then opened with a celebrated attack on psychologism; whether Frege's review changed his mind is debated, Føllesdal saying it did, Mohanty and others pointing to Husserl's own reading of Bolzano and Lotze. So Frege and Husserl, later claimed by different traditions, both opposed psychologism. The camps also share a teacher: Franz Brentano, who gave phenomenology its idea of **intentionality**, the mind's directedness at objects, taught Husserl and also Alexius Meinong, Russell's target in "On Denoting". Michael Dummett suggested in passing that analytic philosophy be called "Anglo-Austrian" rather than "Anglo-American", tracing its roots to Bolzano, Brentano, Meinong and the early Husserl.

Read together, the chapters suggest a parting through events. Heidegger's 1929 debate with Ernst Cassirer at Davos has been seen by Michael Friedman and Peter Gordon as a turning point. In 1932 Rudolf Carnap made a sentence from Heidegger's 1929 inaugural lecture, "The Nothing itself nothings", the target of his attack on metaphysics as meaningless. In April 1958 Gilbert Ryle, J. L. Austin and others met Maurice Merleau-Ponty and other French philosophers at Royaumont; when Merleau-Ponty reportedly asked "Aren't our programs the same?", Ryle answered "I hope not!", though the received story has since been questioned. In 1992, opposing an honorary degree for Jacques Derrida at Cambridge, Barry Smith and eighteen other philosophers, Quine among them, wrote that his work "does not meet accepted standards of clarity and rigour".

The traffic never stopped. Iris Murdoch's first book was on Sartre; Derrida and John Searle quarrelled over Austin; Lyotard wrote of plural "language games", Wittgenstein's term; Hubert Dreyfus turned Heidegger and Merleau-Ponty against classical artificial intelligence. And many labels were not the participants' own. Only Sartre and Beauvoir, according to the Stanford Encyclopedia, explicitly called themselves existentialists; the Frankfurt School was, in the Stanford Encyclopedia's words, "not really a school at all"; "post-structuralism" was applied largely by English-speaking readers and rejected by most of those it named; and "positivist", Richard Creath notes, "is a term usually applied by opponents". The same pattern runs beyond Europe: the Kyoto School got its lasting name in Tosaka Jun's attack of 1932, John Makeham argues that New Confucianism was created retrospectively, and Paulin Hountondji made "ethnophilosophy" famous as a term of criticism.

## Language and Meaning

One problem runs through the analytic chapters: how words mean, and whether attending to them can dissolve philosophical problems. Frege distinguished a name's **reference**, the object it picks out, from its **sense**, the way the object is presented; Dummett dated philosophy's "linguistic turn" to §62 of Frege's *Foundations of Arithmetic*. The *Tractatus* drew a limit "to the expression of thoughts", and the Vienna Circle took from conversations with Wittgenstein in 1929–30 the principle that a proposition's sense is its method of verification. The chapter on logical positivism argues that the principle did not die by refuting itself, the charge Hilary Putnam pressed and the *History of Philosophy* overview repeats: Carnap offered it as a proposal, Hempel called it "a linguistic proposal" and Ayer "a definition". It failed for technical reasons, when Alonzo Church (1949) showed that Ayer's version let every sentence in and Hempel concluded that significance belongs to whole theories.

The later Wittgenstein turned from the logic beneath language to its use, with a qualification readers often drop:

```quote
For a large class of cases—though not for all—in which we employ the word "meaning" it can be defined thus: the meaning of a word is its use in the language.
Ludwig Wittgenstein · Philosophical Investigations §43, trans. G. E. M. Anscombe · 1953
```

Philosophical confusion, on this view, comes not from ordinary language itself but from misleading analogies between its forms. Quine's "Two Dogmas of Empiricism" (1951) attacked the analytic–synthetic distinction, though scholars now widely hold that he and Carnap were largely talking past each other, and Quine later accepted a modest analyticity. After 1950 Austin showed that some utterances perform acts rather than describe them, and Kripke argued that names are rigid, picking out the same object in every possible world where it exists.

The continental chapters reached language from another direction. Saussure's *Course* held that "in language there are only differences without positive terms", and Derrida pressed the point against the privilege of speech over writing. The chapters outside Europe used language as a test. Kwasi Wiredu proposed trying to state a problem in an African language such as Akan, where, he argued, there is no one word for truth and the Cartesian mind–body problem would not arise in the normal course of things; and B. K. Matilal's *The Word and the World* (1990) presented India's contribution to the philosophy of language.

## The Subject and Experience

A second thread asks what a self is, and how it meets the world and other people. Husserl's **epoché** suspended belief in the world's existence in order to describe how anything is given at all. Heidegger replied that our basic relation to the world is practical engagement, not a belief that could be bracketed; Merleau-Ponty that "the most important lesson of the reduction is the impossibility of a complete reduction", since reflection is always situated in the world it reflects on. Sartre made consciousness a power of negation, and found other minds not by inference but in the shame of being looked at.

The analytic chapters attacked the same picture from outside. Ryle called Descartes' "Ghost in the Machine" a category mistake, and Wittgenstein's private language argument denied that words could get their meaning from inner objects only their owner can know. After behaviourism, Thomas Nagel's bat and Frank Jackson's Mary brought experience back as a problem for physicalism.

Two parallels stand out. Husserl and Nishida Kitarō both moved away from **psychologism**: Nishida dropped his early "pure experience" for fear it was tainted with it, and turned to a logic of "place" whose ultimate ground is absolute nothingness. And Robinson Crusoe appears twice. In the private language debate Crusoe is a test case: if language needs a community, a lifelong solitary speaker would be impossible, yet he seems conceivable. Watsuji Tetsurō, for his part, called Crusoe and Hobbes's state of nature abstractions, since a human being, *ningen*, exists in "betweenness". Ifeanyi Menkiti's claim that personhood "has to be attained" through communal life, and Kwame Gyekye's reply that acquisition presupposes an acquirer, put the same question in African terms. Frantz Fanon's "epidermal racial schema", built from Sartre's look and Merleau-Ponty's body schema, and Iris Marion Young's "inhibited intentionality" carried the description of the lived body to race and gender.

## Reason, Critique and Power

A third thread asks whether reason liberates or dominates. Max Horkheimer's "Traditional and Critical Theory" (1937) set a theory aimed at "emancipation from slavery" against one that takes the social order as given, and *Dialectic of Enlightenment* argued that "myth is already enlightenment, and enlightenment reverts to mythology". Habermas answered that a critique indicting all reason needs "at least one rational criterion intact": a **performative contradiction**. He brought the same charge against Michel Foucault, whose *Discipline and Punish* argued that power and knowledge cannot be separated in the human sciences. Nancy Fraser called Foucault "normatively confused"; defenders reply with his "where there is power, there is always resistance".

Who decides what counts as knowledge was argued elsewhere too. In 1923 Zhang Junmai lectured in Beijing that "outlooks on life" lie beyond science, and the geologist Ding Wenjiang replied that science is, in the IEP's words, "all-sufficient". Other critics turned critique on Europe itself. Enrique Dussel held that before the Cartesian "I think" came an "I conquer"; Edward Said noted the Frankfurt School's silence on colonialism; and Amy Allen argues that Habermas and Honneth rest critique on a Eurocentric idea of progress.

```checkpoint
q: Why does this overview call the analytic–continental split "a label with a history"?
a*: Because the chapters show it emerging through events such as Davos (1929), Carnap's attack on Heidegger (1932) and Royaumont (1958), after a start in which Frege and Husserl both opposed psychologism.
a: Because Frege and Husserl founded the two camps by quarrelling at Davos.
x: Davos was Heidegger's debate with Cassirer in 1929; Frege's quarrel with Husserl was a review of 1894.
a: Because Dummett proved that analytic philosophy began in America.
x: Dummett suggested "Anglo-Austrian" rather than "Anglo-American", tracing roots to Bolzano, Brentano, Meinong and the early Husserl.
a: Because the participants all accepted the labels from the start.
x: Many did not: only Sartre and Beauvoir explicitly called themselves existentialists, and "post-structuralism" was rejected by most of those it named.
hint: Think of what the camps shared before 1900 and when the parting is dated.
why: Read together, the chapters suggest a parting through events, Davos (seen by Friedman and Gordon as a turning point), Carnap's attack on Heidegger and Royaumont, and stress the shared roots and continuing traffic; the Royaumont story itself has been questioned.
---
q: Why does the chapter on logical positivism dispute the claim that the verification principle "failed its own test"?
a: Because the principle was in fact verified by experiment.
x: The principle was neither analytic nor empirically verifiable; the reply turns on what kind of claim it was.
a: Because Wittgenstein showed it was analytic.
x: Wittgenstein's conversations introduced the principle to the Circle.
a*: Because Carnap, Hempel and Ayer offered it as a proposal or definition, which is neither true nor false; it failed for technical reasons instead.
a: Because Quine's "Two Dogmas" rescued it.
x: Quine attacked the analytic–synthetic distinction on which the principle relied.
hint: Can a proposal be false?
why: Church (1949) showed Ayer's criterion admitted everything, and Hempel found that significance belongs to whole theories; the self-refutation charge is disputed.
```

## Authenticity and Freedom

"Authenticity" means two different things in this section. In the European chapters it is a personal achievement. For Heidegger, *Eigentlichkeit* is owning one's existence instead of drifting with "the they", and anticipating death individualises us. Sartre held that we are "condemned to be free" and that **bad faith** is a lie to oneself about our mix of facticity and freedom; Merleau-Ponty, in the SEP's summary, rejected the view that freedom is "either total or null". Beauvoir argued that I cannot will my own freedom without willing others'. Camus answered the absurd with revolt, and Fanon described a "zone of non-being" where Black people are locked into blackness.

Other chapters tie freedom to transformation. Nishitani Keiji sought to overcome nihilism "by way of passing through nihilism" into emptiness; Tanabe Hajime held that reason must die to its own power and be reborn through "Other-power", though Heisig finds no admission of guilt in that work. Gandhi grounded **satyagraha** in the claim that no one possesses the whole truth, so we may not make an opponent suffer, though Orwell doubted it could work against a totalitarian state. Paulo Freire held that liberation cannot be handed down. In Latin America, finally, "authenticity" names a property of a philosophy rather than a person, which brings us to the section's most persistent question.

## Whose Philosophy Counts

As *Latin American Philosophy and the Philosophy of Liberation* notes, African philosophers fought a parallel battle over authenticity, and Chinese and Indian thinkers asked whether their traditions counted as "philosophy". Set side by side:

1. **Latin America.** Augusto Salazar Bondy (1968) argued that dependence produces a "defective culture" that mistakes imitation for creation, so an authentic philosophy requires liberation. Leopoldo Zea replied that every philosophy is authentic in expressing its circumstances, that philosophy needs no qualifier, and asked why the question was posed only of Latin America.
2. **Africa.** Placide Tempels' *Bantu Philosophy* claimed that for the Bantu "force" takes the place of "being", but that it took a European to extract their philosophy. Hountondji answered that philosophy is the explicit, criticisable discourse of individuals, so a supposedly unanimous world-view is ethnology; H. Odera Oruka sought "philosophic sages" in the villages; Wiredu called for conceptual decolonisation.
3. **India.** Sarvepalli Radhakrishnan called Vedānta "religion itself". Daya Krishna's "Three Myths about Indian Philosophy" (1966) rejected the claims that it is essentially spiritual, bound to the Vedas and divided into fixed schools, and Matilal defended a realism close to Nyāya–Vaiśeṣika while engaging modern sense-data theorists.
4. **China.** Feng Youlan's *History of Chinese Philosophy* set Chinese and Western thought under the common category of "philosophy"; the 1958 Manifesto charged Western sinology with misreading China; Mou Zongsan read Kant closely to defend Mencius, calling Kant's denial of intellectual intuition to human beings his greatest mistake.
5. **Japan.** The Kyoto School's contrast of Western being with Eastern nothingness divides its readers: Heisig calls its "East" "something of an invention", Maraldo holds that Nishida's problems are universal, and Bret Davis presents the School as a contribution to "world philosophy".
6. **Conclusion (this overview's own synthesis).** Set side by side, the debates show the question "is there an X philosophy?" turning into a question about who sets the standards. Mou, Matilal and Daya Krishna, in a phrase from *Modern Chinese and Indian Philosophy*, treated their traditions as "partners in argument", neither museum pieces nor preparations for Western thought; this overview suggests that Zea, Wiredu and Oruka can be read the same way, refusing both a collective world-view to be dug up and a foreign model to be imitated.

**The objection** is that the standards themselves are borrowed: Hountondji's criterion has been called "inadequate, incorrect and exclusivist", Salazar Bondy's argument draws on Marxism and existentialism, and Vargas finds Dussel's philosophy Eurocentric despite itself. **The reply** is that the debaters revised their views in argument: Hountondji conceded in 2002 that his "earlier rejection of collective thought was excessive", and the Stanford Encyclopedia now judges that the question whether Africans can do philosophy has been "resolved—or [is] no longer taken seriously". Even analytic philosophy's intuitions may be local: given Kripke's Gödel case, 56.5% of Western but 31.5% of East Asian participants gave Kripke's answer, though replications are mixed. The debate is open.

Women's place was another version of the question. Edith Stein was refused habilitation in 1919, when it was denied to women; Susan Stebbing became the first woman in the United Kingdom appointed to a full professorship in philosophy in 1933; Beauvoir refused to call herself a philosopher and was long treated as Sartre's disciple. T. Denean Sharpley-Whiting criticised the "masculinist genealogy" that erased the Nardal sisters from Négritude, and Sally Haslanger's figures of 2008 on women in leading American departments turned the question on the profession itself.

## Philosophers and Politics

The chapters on phenomenology and the Kyoto School establish the record, then treat as a debate how far it reaches the philosophy; the Frege chapter simply records the diary. Frege's diary for a few weeks of 1924 shows, in the Stanford Encyclopedia's words, "sympathies for fascism and anti-Semitism"; Dummett, who read it in 1954, was deeply shocked. Heidegger joined the Nazi Party in 1933, as rector of Freiburg, and remained a member until 1945, and the *Black Notebooks*, published in 2014, reopened the debate. Julian Young argued that the philosophy can be "de-Nazified" and Emmanuel Faye that it is not philosophy at all; Mark Wrathall's *Stanford Encyclopedia* entry takes a middle line. The chapter also retires a story: Heidegger did not bar Husserl from the library. *The Kyoto School and Modern Japanese Philosophy* sets out its controversy as a structured debate among critics, careful critics such as Yoko Arisaka, and defenders and contextualisers; the "Principles for a New World Order" that Nishida agreed to write in 1943 was "edited and 'simplified'" by a go-between. When Bret Davis reports that many philosophers now treat the politics as "lamentable footnotes to the main text", the chapter marks this as his view, and the debate as far from closed.

The century's violence also fell on philosophers: Husserl lost his right to teach, Stein was murdered at Auschwitz, Schlick was shot by a former student, Benjamin died at Portbou, and Miki Kiyoshi and Tosaka Jun died in prison in 1945.

```checkpoint
q: How did Leopoldo Zea answer Salazar Bondy's claim that Latin American philosophy was inauthentic?
a: He agreed that authentic philosophy must wait for liberation from dependence.
x: That is Salazar Bondy's conclusion, not Zea's.
a*: He held that every philosophy is authentic in expressing its circumstances, and asked why the question was posed only of Latin America.
a: He argued that only Nahua thought counted as authentically Latin American.
x: Zea's argument concerned the authenticity of all philosophy produced in its circumstances.
a: He replied that philosophy should be judged by the standards of the Vienna Circle.
x: Zea's reply turned on circumstance and situated answers, not on a criterion of meaning.
hint: Think of his title "filosofía sin más".
why: Zea held that universal problems receive situated answers, and that philosophy needs no qualifier.
---
q: How does the chapter on the Kyoto School handle the School's wartime politics?
a: It declares the philosophy fascist and closes the question.
x: It presents critics, careful critics and defenders, and calls the debate far from closed.
a: It treats the politics as "lamentable footnotes", as the settled verdict.
x: That phrase is Davis's view, presented as his.
a: It shows that Nishida refused every request from the military.
x: Nishida agreed to write "Principles for a New World Order" for the Center for National Strategy.
a*: It sets out the record, then presents critics, careful critics such as Arisaka, and defenders and contextualisers as a structured debate.
hint: The chapter's own heading calls it "a structured debate".
why: The chapter weighs both the record and the readings, from Najita and Harootunian to Heisig, Maraldo and Ōhashi.
```

## Sources: Editions, Translations and Legends

Many of the section's central texts were not published by their authors. The *Philosophical Investigations* appeared in 1953, after Wittgenstein's death, edited by Anscombe and Rhees; Part I had been withdrawn from his publisher in 1946. Saussure's *Course* was compiled by two former students from students' notes on his lectures. Husserl left tens of thousands of pages of shorthand manuscripts, which Herman Van Breda smuggled to Leuven; Stein edited parts of them "with major interventions".

Translations change meanings. The 2009 revision of *Investigations* §43 says meaning "can be explained" rather than "defined"; Parshley's "One is not born, but rather becomes, a woman" lost its article in 2009–10; Fanon's chapter title, "The Fact of Blackness" in Markmann's translation, speaks of "lived experience" in Philcox's (2008); Derrida later glossed "there is nothing outside the text" as "there is nothing outside context". Anecdotes harden into history: the Royaumont exchange; Wittgenstein's "wonderful life", which the Stanford Encyclopedia introduces with "Legend has it"; Camus's words about his mother, whose exact wording is disputed. Kripke presented his sceptic as "Wittgenstein's argument as it struck Kripke"; critics nicknamed the figure "Kripkenstein", and the chapter treats it as a reading, not as Wittgenstein. Finally, encyclopedia paraphrases can pass for quotations: the chapters credit "a pragmatist flavour" to the Stanford Encyclopedia, mark a formula for *teotl* as "Maffie's formulation, not a Nahua quotation", and warn that Tutu's line on ubuntu reaches us through secondary quotation.

## The Chapters

- *Frege, Russell and the Birth of Analytic Philosophy*: the new logic, sense and reference, the paradox, descriptions and Moore.
- *Wittgenstein*: the *Tractatus*, meaning and use, rule-following and private language.
- *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*: verification, falsifiability and "Two Dogmas".
- *Phenomenology: Husserl, Heidegger and Merleau-Ponty*: the reduction, Stein, *Being and Time*, Nazism and the lived body.
- *Existentialism: Sartre, Beauvoir and Camus*: freedom and bad faith, *The Second Sex*, the absurd, and Fanon.
- *Critical Theory: the Frankfurt School and Habermas*: instrumental reason, Benjamin, discourse ethics and recognition.
- *Structuralism and After: Foucault, Derrida and Their Critics*: Saussure, power/knowledge, deconstruction and their critics.
- *The Kyoto School and Modern Japanese Philosophy*: Nishida's logic of place, Tanabe, Nishitani, Watsuji, and the war.
- *Modern Chinese and Indian Philosophy*: the 1923 debate, New Confucianism, Gandhi and Ambedkar, and Matilal.
- *African Philosophy: the Ethnophilosophy Debate and Beyond*: Négritude, Hountondji, Wiredu, personhood and ubuntu.
- *Latin American Philosophy and the Philosophy of Liberation*: Valladolid, Sor Juana, the authenticity debate, Dussel and Freire.
- *Analytic Philosophy since 1950*: ordinary language, Rawls, Kripke, metaphysics and minds.

The problems themselves continue in the branches of philosophy, from *Meaning and Reference* and *Consciousness* to *Feminist Philosophy* and *Race, Colonialism and Philosophy*.

## Further exploration

- **Michael Dummett, *The Origins of Analytical Philosophy* (1993).** The "linguistic turn" and "Anglo-Austrian" theses.
- **Sarah Bakewell, *At the Existentialist Café: Freedom, Being, and Apricot Cocktails* (2016).** A lively narrative history of Husserl, Heidegger, Merleau-Ponty, Sartre and Beauvoir for general readers.
- **Gary Gutting, *French Philosophy in the Twentieth Century* (2001).** A survey from Bergson to Derrida.
- **James W. Heisig and John C. Maraldo (eds.), *Rude Awakenings: Zen, the Kyoto School, and the Question of Nationalism* (1994).** The landmark collection on the political controversy.
- **John Makeham (ed.), *New Confucianism: A Critical Examination* (2003).** Critical essays, including on the movement's retrospective creation.
- **Kwasi Wiredu (ed.), *A Companion to African Philosophy* (2004).** The standard reference volume.
- **Susana Nuccetelli, Ofelia Schutte and Otávio Bueno (eds), *A Companion to Latin American Philosophy* (2010).** A broad survey by leading scholars.$twentiethoverview_master$,
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
  select $twentiethoverview_quiz$[
    {"type": "mcq", "prompt": "Who reviewed Husserl's Philosophy of Arithmetic critically in 1894, accusing him of psychologism?", "options": ["Bertrand Russell", "Franz Brentano", "Gottlob Frege", "Rudolf Carnap"], "answerIndex": 2, "explanation": "Frege's 1894 review charged Husserl with psychologism, the view that logic is a branch of psychology. Whether it changed Husserl's mind is debated (Føllesdal against Mohanty and others), but the Logical Investigations opened with an attack on psychologism, so Frege and Husserl, later claimed by different traditions, both opposed psychologism. Brentano was Husserl's teacher; Carnap attacked Heidegger in 1932.", "id": "q1"},
    {"type": "mcq", "prompt": "What qualification does Philosophical Investigations §43 attach to the idea that meaning is use?", "options": ["It applies 'for a large class of cases—though not for all' in which we employ the word 'meaning'", "It applies only to the names of physical objects", "It applies only to the words of ideal logical languages", "It applies only to sensation words, such as 'pain'"], "answerIndex": 0, "explanation": "In Anscombe's translation, §43 says that 'for a large class of cases—though not for all' the meaning of a word is its use in the language. The Wittgenstein chapter, following the IEP, stresses that this is not a general theory that 'meaning is use' but a warning against taking meaning to be an object named or a feeling in the mind.", "id": "q2"},
    {"type": "mcq", "prompt": "Which claims did Daya Krishna's 'Three Myths about Indian Philosophy' (1966) reject?", "options": ["That Indian philosophy is argumentative, secular and individual", "That Indian philosophy began with the Buddha, ended with Śaṅkara and was unknown in Europe", "That Indian philosophy is inferior to Greek, Chinese and German philosophy", "That Indian philosophy is essentially spiritual, bound to the authority of the Vedas, and divided into fixed schools"], "answerIndex": 3, "explanation": "Daya Krishna attacked the picture Radhakrishnan had made famous: that Indian philosophy is essentially spiritual and aimed at liberation (mokṣa), bound to Vedic authority, and made up of fixed 'schools'. He also organised dialogues between Sanskrit pandits and English-writing philosophers.", "id": "q3"},
    {"type": "mcq", "prompt": "How was Saussure's Course in General Linguistics (1916) produced?", "options": ["Saussure wrote it as his final book and saw it through the press", "Two former students compiled it after his death from students' notes on his Geneva lectures", "Jakobson translated it from Saussure's Russian manuscripts", "Lévi-Strauss reconstructed it from Saussure's letters"], "answerIndex": 1, "explanation": "Charles Bally and Albert Sechehaye, with help from Albert Riedlinger, compiled the Course from students' notes on three lecture courses; Saussure did not write it as a book, and scholars still debate how far editors reshaped him. Like the posthumous Philosophical Investigations and Husserl's manuscripts, it shows how much of the century's canon reached readers through other hands.", "id": "q4"},
    {"type": "open", "prompt": "Compare how the 'is there an X philosophy?' question was framed in at least three of these places: Latin America, Africa, India, China and Japan. What did the debates have in common, and how did the participants answer the charge that their standards were borrowed?", "rubric": "A strong answer sets out Salazar Bondy's argument (dependence produces a 'defective culture'; authentic philosophy requires liberation) and Zea's reply (every philosophy is authentic in expressing its circumstances; why ask only of Latin America?); Tempels' Bantu Philosophy and Hountondji's critique of ethnophilosophy and unanimism, with Oruka's sage philosophy and Wiredu's conceptual decolonisation; Radhakrishnan's spiritual Vedānta against Daya Krishna's 'Three Myths' and Matilal's analytic work; Feng Youlan placing Chinese thought under 'philosophy', the 1958 Manifesto and Mou Zongsan's reading of Kant; and the Kyoto School's 'East' (Heisig, Maraldo, Davis). It notes the common turn from whether people think to who sets the standards, cites objections (Hountondji's criterion called 'exclusivist'; Salazar Bondy's Marxist and existentialist borrowings; Vargas on Dussel) and replies (Hountondji's 2002 concession; the SEP's judgement that the old question is resolved or no longer taken seriously), and keeps the overview's own synthesis distinct from the chapters' claims.", "id": "q5"},
    {"type": "open", "prompt": "Explain why this overview treats the division between 'analytic' and 'continental' philosophy as a label with a history rather than a natural division, and assess whether that is persuasive.", "rubric": "A strong answer uses the chapters' evidence: Frege's 1894 review of Husserl and Husserl's own attack on psychologism; Brentano as teacher of Husserl and Meinong; Dummett's passing suggestion of 'Anglo-Austrian'; Davos (1929) as a turning point (Friedman, Gordon); Carnap's 1932 attack on Heidegger's 'The Nothing itself nothings'; the Royaumont colloquium of 1958 and Ryle's 'I hope not!', noting that the received story has been questioned; and the 1992 Cambridge letter against Derrida. It notes continuing traffic (Murdoch on Sartre, Searle and Derrida on Austin, Dreyfus) and that many labels were not the participants' own ('existentialism', 'post-structuralism', 'positivist', the Frankfurt 'School'). It may weigh real differences of style and method against this, without inventing facts.", "id": "q6"}
  ]$twentiethoverview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
