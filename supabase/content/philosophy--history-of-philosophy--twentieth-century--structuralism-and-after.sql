-- Structuralism and After: Foucault, Derrida and Their Critics — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/structuralism-and-after @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/structuralism-and-after',
    'research',
    'advanced',
    'read',
    $structuralism_master$> **How a theory of language became a way of reading everything, and why it provoked some of the fiercest quarrels in modern philosophy.** This chapter starts with Ferdinand de Saussure's idea of language as a system of differences and follows it through Roman Jakobson into Claude Lévi-Strauss's anthropology, Roland Barthes's criticism, Jacques Lacan's psychoanalysis and Louis Althusser's Marxism. It then turns to the so-called "post-structuralists": Michel Foucault on knowledge and power, Jacques Derrida's deconstruction, Gilles Deleuze and Félix Guattari, and Jean-François Lyotard's "postmodern condition". Two arguments are set out step by step with the objections of Nancy Fraser, Jürgen Habermas, John Searle and others, and the replies. It ends with Judith Butler, Gayatri Chakravorty Spivak and Edward Said, who turned these tools to feminist and postcolonial ends.

## Saussure: Language as a System of Differences

Ferdinand de Saussure (1857–1913), a Swiss linguist who taught from 1892 at the University of Geneva, hardly published anything on general linguistics. The book that made him famous, the *Course in General Linguistics* (1916), appeared after his death: two former students, Charles Bally and Albert Sechehaye, with help from Albert Riedlinger, compiled it from students' notes on three courses of lectures given in Geneva before the First World War. Saussure did not write it as a book, and scholars still debate how far editors and interpreters reshaped him; a manuscript of his own notes, found in 1996, appeared in English in 2006.

The *Course* is generally regarded as the starting point of **structural linguistics**. First, Saussure distinguished *la langue*, language as a shared system, from *la parole*, the individual acts of speaking that use it. Second, he treated the linguistic **sign** as two-sided: a **signifier** (a sound-image or written form) joined to a **signified** (a concept). The word "tree" refers not to a physical tree but to the concept of one. Third, the bond between the two is **arbitrary**, a matter of convention, apart from cases such as onomatopoeia: "No one disputes the principle of the arbitrary nature of the sign," in Wade Baskin's translation. Fourth, and most consequentially, signs therefore cannot get their meaning from any natural link to things. They get their **value** by contrast with the other signs in the system: "cat" means what it does because it is not "bat", "cap" or "dog".

```quote
In language there are only differences. Even more important: a difference generally implies positive terms between which the difference is set up; but in language there are only differences without positive terms.
Ferdinand de Saussure · Course in General Linguistics, trans. Wade Baskin · 1916
```

Finally, language can be studied **diachronically**, as it changes through time, or **synchronically**, as a system at one moment. Saussure's analogy was chess: a spectator joining a game in progress needs only the present position of the pieces, not the history of moves. He also imagined a science of "the life of signs within society", semiology. Charles Sanders Peirce had developed a theory of signs independently (see *American Pragmatism: Peirce, James and Dewey*), but it was Saussure's that crossed into the human sciences.

## From Linguistics to Anthropology: Jakobson and Lévi-Strauss

The bridge was the Prague linguistic circle (founded 1926), where the Russian émigrés **Roman Jakobson** (1896–1982) and Nikolai Trubetzkoy in effect founded modern phonology, the study of languages' sound systems. In wartime New York Jakobson worked with Lévi-Strauss, and his "decisive influence on Claude Lévi-Strauss and Roland Barthes" carried structural analysis beyond linguistics.

**Claude Lévi-Strauss** (1908–2009) was born in Brussels to French-Jewish parents. In the 1930s, while teaching in São Paulo, he and his then wife **Dina Lévi-Strauss**, a trained ethnographer and visiting professor of ethnology in her own right, did fieldwork in the Mato Grosso and the Amazon, among peoples including the Bororó and Nambikwara. His memoir of those travels, *Tristes Tropiques* (1955), made him famous.

In *The Elementary Structures of Kinship* (1949) kinship, he argued, rests not on descent but on **alliance**: groups bind themselves together by exchanging women in marriage, and the incest taboo is the rule that forces this exchange outside one's own line. Simone de Beauvoir reviewed it favourably. According to the *Stanford Encyclopedia of Philosophy*, the book "helped launch the French structuralist movement", which "challenged the theoretical primacy of existentialism in France".

In "The Structural Study of Myth" (1955) he broke myths into minimal units, "mythemes", built on **binary oppositions**; in the Oedipus story he paired "the overrating of blood relations" with "the underrating of blood relations". A myth's work is to link an opposition that cannot be resolved to one that can, giving the illusion that the first is solved, and there is no one "authentic" version. His *Mythologiques* (1964–1971) traced such structures from South America to the Arctic.

*The Savage Mind* (1962) concerns mind "in its untamed state", not "the mind of savages". Such thinking is like the *bricoleur*, who makes do with "whatever materials are at hand", rather than the engineer who designs tools for each project. Its second half drew Lévi-Strauss into "a heated debate with Jean-Paul Sartre over the nature of human freedom": against Sartre's free, choosing subject (see *Existentialism: Sartre, Beauvoir and Camus*) he set a structuralist account of agency. Structuralism rose in France in existentialism's wake.

## Structuralism Spreads: Barthes, Lacan, Althusser

In the *Stanford Encyclopedia*'s phrase, Lévi-Strauss "structuralized" anthropology, "as Roland Barthes did for literary-cultural studies and Louis Althusser for Marxism", while Jacques Lacan did the same for psychoanalysis.

**Roland Barthes** (1915–1980) showed in *Mythologies* (1957), short essays on subjects from wrestling to a *Paris Match* cover of a young Black soldier saluting in French uniform, how bourgeois culture makes its values look natural. His essay "The Death of the Author" (1967) argued against explaining a text by its author's intentions and life: the death of the author is "the birth of the reader".

**Jacques Lacan** (1901–1981) took up Saussure, Lévi-Strauss and Jakobson in a "return to Freud" whose most famous dictum is that "the unconscious is structured like a language". **Louis Althusser** (1918–1990), in *For Marx* and *Reading Capital* (both 1965), read Marx structurally, as the chapter on *Marx* describes, and later argued that ideology "interpellates", or hails, individuals as subjects through institutions such as the family, schools and churches. In 1980 he strangled his wife, Hélène Rytmann-Légotien, and was judged unfit to stand trial. At the École Normale Supérieure (ENS) in Paris he taught Foucault and later helped bring Derrida to teach.

## "Post-structuralism": A Label Most Refused

By the mid-1960s some were turning structuralism's tools against it. A landmark was a colloquium at Johns Hopkins University, Baltimore, in October 1966, where Barthes, Lacan and Derrida spoke. Thinkers who worked with structuralist concepts while questioning their ambitions are often called **post-structuralists**, a label applied largely by English-speaking readers, which most of those so labelled rejected; Foucault always refused even "structuralist". Several of them cited May 1968 as a watershed (see *Power and Protest in the Long 1960s: the May 1968 Movement*).

## Foucault: Archaeologies of Knowledge

{{image: Michel Foucault | Michel Foucault around 1970, the year he gave his inaugural lecture at the Collège de France.}}

**Michel Foucault** (1926–1984) was born in Poitiers, the son of a surgeon. At the ENS, from 1946, he was taught by Maurice Merleau-Ponty (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*) and briefly joined the Communist Party under Althusser's influence; a suicide attempt there is generally linked to his difficulty in coming to terms with his homosexuality. After posts in Uppsala, Warsaw, Hamburg and Tunis (where he missed most of May 1968), he was elected to the Collège de France in 1969, and in 1971 co-founded the Prison Information Group (GIP).

Inverting Kant, Foucault asked "what, in the apparently necessary, might be contingent". *History of Madness* (1961) argued that the "liberation" of the mad by the reformers Pinel and Tuke, and the idea that madness is mental illness, were not simple progress but a cover for new forms of moral control.

The bestselling *The Order of Things* (1966), "An Archaeology of the Human Sciences", introduced the **episteme**, the stable set of unspoken rules that governs what counts as knowledge in a period (see *Intellectual History*). Renaissance knowledge worked by resemblance, Classical knowledge by representation, and only with Kant did "man" appear as both knowing subject and known object. "Man" is thus recent, and the book ends by imagining him erased "like a face drawn in sand at the edge of the sea" (in Alan Sheridan's translation). **Archaeology**, as *The Archaeology of Knowledge* (1969) explained, studies the rules of "discursive formations" that operate beneath individual consciousness. From Nietzsche (see *Nietzsche*) he then took **genealogy**, showing that a system of thought was "the result of contingent turns of history, not the outcome of rationally inevitable trends", first used in *Discipline and Punish* (1975).

## Discipline and Punish: The Argument

The book contrasts the public torture and dismemberment in 1757 of Robert-François Damiens, who had stabbed Louis XV, with a regimented early-nineteenth-century prison timetable. Foucault's argument, reconstructed from the *Stanford* and *Internet Encyclopedia* accounts, runs:

1. Standard histories present the move from public torture to imprisonment as humane reform.
2. But the new penal practices aim not at vengeance but at correcting deviance by norms: they observe, rank people against norms ("normalising judgement") and examine them.
3. These techniques also produce knowledge (records, case files, criminology, psychiatry). The examination joins "the deployment of force and the establishment of truth". So in the human sciences power and knowledge cannot be separated: Foucault calls this **power/knowledge**.
4. The same techniques spread from the prison to the army, factory, hospital and school, producing **docile bodies**, more useful and at the same time easier to control. Their model is Jeremy Bentham's **Panopticon**, a prison in which each inmate can always be seen from a central tower but never knows when he is watched, and so behaves as if always seen.
5. No central agency designed this; techniques developed for innocent purposes converged. Power is therefore dispersed, relational and productive: it makes kinds of subject, such as "the delinquent", rather than only repressing.
6. Therefore what presents itself as gentler, scientific treatment is also a more effective form of control, "to punish less, perhaps; but certainly to punish better" (Sheridan's translation), and since this arrangement is contingent, it is open to change.

Unlike Bacon's "knowledge is power", where knowledge is a tool of an independent power, here "in knowing we control and in controlling we know". Two corrections: the Panopticon was never built, and Janet Semple argued that Foucault hardly did justice to Bentham's plan (see *Bentham, Mill and Utilitarianism*); and the *Internet Encyclopedia* insists that panopticism "is not the central claim of the book", which is rather that the prison's objective purpose is to produce criminality and recidivism, with reform part of the system.

**Objection: normative confusion.** The strongest objection, pressed by **Nancy Fraser** in "Foucault on Modern Power: Empirical Insights and Normative Confusions" (1981), is that Foucault describes domination without saying why it is wrong. His work is "normatively confused": "Only with the introduction of normative notions could he begin to tell us what is wrong with the modern power/knowledge regime and why we ought to oppose it." **Jürgen Habermas** (1929–2026) called Foucault "crypto-normativist", covertly relying on the Enlightenment ideals he unmasked, and charged him with a **performative contradiction**: using the tools of modern reason to deny reason's authority (see *Critical Theory: the Frankfurt School and Habermas*). **Charles Taylor** (1984) is usually summarised as arguing that power cannot be understood without freedom and truth, since domination imposes on something.

**Objection: agency.** Feminist critics, among them Linda Martín Alcoff and Seyla Benhabib, argued that if the subject is an effect of power, there is no agent left to resist, which feminism needs. Nancy Hartsock added that Foucault sees power "from above", and that "domination, viewed from above, is more likely to look like equality". Historians such as David Garland noted his "overestimation of the political dimension".

**Replies.** For Foucault, "where there is power, there is always resistance": questioning the reasons given for how we are governed is itself resistance, and his later work adds a subject who shapes itself. Amy Allen (2008) and Johanna Oksala (2005) contest the reading on which autonomy and other normative ideas are mere effects of power, and Allen answers the agency objection directly.

```checkpoint
q: What does Foucault mean by "power/knowledge"?
a*: That in the human sciences practices of control and the production of knowledge are bound together, so that "in knowing we control and in controlling we know".
a: That knowledge is a neutral tool which an independent power can pick up and use, as in Bacon's "knowledge is power".
x: Foucault distinguished his idea from Bacon's: knowledge is not an instrument of a power that exists independently of it.
a: That only those who hold state power are able to produce true knowledge.
x: Foucault's power is dispersed and has no central agent; the point is not that rulers monopolise truth.
a: That knowledge always frees people from power.
x: His example of the examination shows knowledge and control working together, not knowledge liberating people.
hint: Think of the examination, which combines "the deployment of force and the establishment of truth".
why: The examination, records and case files both control people and produce knowledge about them, so Foucault treats power and knowledge as inseparable.
---
q: What is Nancy Fraser's main objection to Foucault's account of power?
a: That his historical evidence about prisons is fabricated.
x: Her essay's title grants him "empirical insights"; her complaint is not about his facts.
a: That he ignores the Panopticon.
x: The Panopticon is central to Discipline and Punish; Fraser's point concerns norms.
a*: That without normative notions he cannot say what is wrong with modern power or why we should resist it.
a: That he is too optimistic about modern reason.
x: Foucault is usually charged with the opposite, suspicion of modern reason.
hint: Her verdict was that his work is "normatively confused".
why: Fraser argued that only with normative notions could Foucault "tell us what is wrong with the modern power/knowledge regime and why we ought to oppose it".
```

## Sexuality, Biopower and the Self

*The History of Sexuality*, volume 1 (1976; translated by Robert Hurley), rejected the **repressive hypothesis** that the Victorians silenced sex: talk about sex multiplied in medicine, law and psychology. Alongside the old sovereign power to kill grew **biopower**, a power over life "that endeavors to administer, optimize, and multiply it, subjecting it to precise controls and comprehensive regulations" (Hurley's translation): statistics, public health, insurance. His last books (1984) turned to ancient ethics as an "aesthetics of existence", in which subjects "are not just docile bodies" but actively refuse, adopt and alter ways of being a subject.

In a 1971 televised debate Noam Chomsky defended an innate human nature and justice grounded in reason; Foucault rejected any universal basis for justice, and Chomsky later said, "He struck me as completely amoral." Reporting from Tehran in 1978, Foucault wrote with awe of Khomeini's movement and was widely criticised in the French press, including by Iranian exiles; the historian Behrooz Ghamari-Tabrizi has since reassessed those writings. Foucault died in Paris of an AIDS-related illness on 25 June 1984; his partner Daniel Defert founded the charity AIDES.

## Derrida: Deconstruction

**Jacques Derrida** (1930–2004) was born in El-Biar, Algiers, into a Sephardic Jewish family; Vichy's anti-Jewish laws interrupted his schooling. He entered the ENS in 1952, after failing twice. His 1963 critique of Foucault's reading of Descartes opened a rift that never fully healed. At Baltimore in 1966 he argued that structuralism still clung to a "center", such as God, being or man, exempt from play, and that we are all *bricoleurs*. In 1967 he published three books, including *Of Grammatology* (translated by Gayatri Chakravorty Spivak, 1976).

His word **deconstruction** probably adapts Heidegger's *Destruktion*. Its target is the **metaphysics of presence** or **logocentrism**, which privileges presence, speech and origins. In his own words, all metaphysicians "from Plato to Rousseau, Descartes to Husserl" conceive "good to be before evil, the positive before the negative, the pure before the impure". His coinage **différance** combines differing and deferring; the "a" cannot be heard in French, only written. His reading of Husserl in *Voice and Phenomenon* (1967) belongs to the same project, though phenomenologists such as Dan Zahavi have contested it.

## The Argument against the Priority of Speech

Plato, Rousseau, Saussure and Lévi-Strauss treat writing as secondary; for Saussure it exists "for the sole purpose of representing" speech. Derrida's case runs:

1. Western metaphysics organises things by oppositions that are really hierarchies: intelligible over sensible, soul over body, speech over writing.
2. Speech is privileged because speakers seem present to their own meaning as they hear themselves speak; writing is demoted as a "sign of a sign" that works in its author's absence.
3. But every feature used to demote writing holds of speech too. Any sign must be repeatable in the absence of its author and any particular hearer, refers to other signs, and has its meaning deferred.
4. Even present experience contains repetition, through memory and anticipation, so pure presence is never given.
5. So deconstruction proceeds in two phases: first reverse the hierarchy (writing is as original as speech), then re-inscribe the demoted term as the resource of the opposition itself, under old names such as "arche-writing", "trace", "supplement" and *différance*.
6. Therefore the opposition cannot stand as a pure hierarchy, and meaning is never fully present. As he put it, "writing is not a sign of a sign, except if one says it of all signs, which would be more profoundly true."

Deconstruction is not mere negation: it works faithfully within a text, finding its tensions. *Of Grammatology* reads Rousseau's *Essay on the Origin of Languages* (see *The Enlightenment and Rousseau*), where writing is "the supplement par excellence since it proposes itself as the supplement of the supplement, sign of a sign". There Derrida wrote "*il n'y a pas de hors-texte*", literally "there is no outside-text", usually cited from Spivak's translation as "there is nothing outside the text". Often read as claiming that nothing but words exists, it meant, Derrida said in 1988, "there is nothing outside context"; in this form, he added, the formula "would doubtless have been less shocking".

**Objection: Searle.** In 1977 John Searle answered Derrida's essay on J. L. Austin's speech-act theory (see *Language, Thought and Speech Acts*): Derrida had misread Austin, whose narrow aims justified setting aside "parasitic" uses of language, and had confused types with tokens, though Searle agreed that intentionality presupposes repeatability. Derrida's reply mocked him as "Sarl". In 1984 Searle condemned "the low level of philosophical argumentation, the deliberate obscurantism of the prose, the wildly exaggerated claims"; and in 1994 he parodied the "context" gloss as a retreat to a truism.

**Objection: Habermas.** In *The Philosophical Discourse of Modernity* (1985; translated by Frederick Lawrence), Habermas charged Derrida with dissolving philosophy into literature to escape self-reference: "Whoever transposes the radical critique of reason into the domain of rhetoric in order to blunt the paradox of self-referentiality, also dulls the sword of the critique of reason itself."

**Objection: Cambridge, 1992.** When Cambridge academics, mostly not philosophers, proposed Derrida for an honorary degree, eighteen philosophers, including Quine and Ruth Barcan Marcus, wrote that his work "does not meet accepted standards of clarity and rigour" and amounted to "little more than semi-intelligible attacks upon the values of reason, truth, and scholarship". The university voted 336 to 204 to award the degree.

**Replies.** Derrida answered (*Limited Inc*, 1988) that what Austin set aside as parasitic, such as citation and non-serious use, is an "essential possibility" of all language, which theory cannot exclude. Commentators still dispute whether the exchange was a real disagreement or "a series of elaborate misunderstandings". Habermas and Derrida were later reconciled.

```checkpoint
q: What are the two phases of deconstruction as Derrida described them?
a: First prove the higher term true, then discard the lower term altogether.
x: Deconstruction does not abolish the demoted term; it re-inscribes it as a condition of the whole opposition.
a*: First reverse the hierarchy, then re-inscribe the demoted term as the resource of the opposition itself, as with "arche-writing".
a: First translate the text, then find out the author's intentions.
x: Derrida's method works within a text's own oppositions; recovering the author's intentions is not its aim.
a: First collect every version of a myth, then sort them into binary oppositions.
x: That describes Lévi-Strauss's structural study of myth, not deconstruction.
hint: Think of what happens to "writing" in the argument against the priority of speech.
why: Derrida first reverses the hierarchy (writing is as original as speech) and then re-inscribes the formerly inferior term under old names such as "trace", "supplement" and différance.
---
q: How did Derrida himself gloss "il n'y a pas de hors-texte" in 1988?
a: There is nothing but words; the world does not exist.
x: That is the linguistic-idealist reading that Derrida rejected.
a: Texts can mean anything readers wish.
x: Deconstruction claims to read texts faithfully, from within.
a: Only literary texts matter to philosophy.
x: The formula concerns all signs and meaning, not a ranking of literature.
a*: There is nothing outside context.
hint: Look for the word he said would have been "less shocking".
why: In the Afterword to Limited Inc he wrote that the formula means "there is nothing outside context".
```

## Derrida's Later Ethics and Politics

Derrida's later work turned to politics and religion. "Force of Law" (1989–90) argues that "A decision that did not go through the ordeal of the undecidable would not be a free decision"; justice is always "to come". *Specters of Marx* (1993) answered Francis Fukuyama's triumphalism with a "democracy to come" (see *Marx*); later work treated hospitality and, in *Rogues* (2003), "roguish" democracies. He died of pancreatic cancer in Paris in October 2004.

## Deleuze and Guattari

**Gilles Deleuze** (1925–1995) began with Hume while his peers studied "the three 'H's" (Hegel, Husserl, Heidegger). *Nietzsche and Philosophy* (1962) read Nietzsche as an anti-Hegelian thinker of active forces, and *Difference and Repetition* (1968) built a "philosophy of difference". In 1968–69 he met **Félix Guattari** (1930–1992), a radical psychoanalyst. Their *Anti-Oedipus* (1972), crossing Marx with Freud, was a *succès de scandale*; Foucault wrote a preface to its English edition. *A Thousand Plateaus* (1980) was written as a **rhizome**, a form "allowing immediate connections between any of its points", against the "tree" of filiation: "The tree imposes the verb 'to be,' but the fabric of the rhizome is the conjunction, 'and... and... and...'" (Brian Massumi's translation). Critics included Alice Jardine and Luce Irigaray on "becoming-woman", and Alain Badiou, for whom Deleuze was a philosopher of the One.

## Lyotard and the Postmodern Condition

**Jean-François Lyotard** (1924–1998) taught in Constantine, Algeria, and wrote on the Algerian war for Socialisme ou Barbarie. With *The Postmodern Condition: A Report on Knowledge* (1979), written for Quebec's Council of Universities, "postmodern" entered philosophy.

```quote
I define postmodern as incredulity toward metanarratives.
Jean-François Lyotard · The Postmodern Condition, trans. Geoff Bennington and Brian Massumi · 1979
```

The "metanarratives" or grand narratives are stories that legitimate knowledge: "the dialectics of Spirit, the hermeneutics of meaning, the emancipation of the rational or working subject, or the creation of wealth". In computerised societies knowledge becomes information, legitimated by efficiency; Lyotard preferred plural "language games" (see *Wittgenstein*) and rejected consensus as the goal of discourse, against Habermas. Critics later used "postmodernism" as a pejorative umbrella for supposed nihilism, but the *Stanford Encyclopedia* argues that Lyotard offers "not an 'anything goes' relativism".

## Critics and Heirs

Habermas remained the most comprehensive critic, defending "argumentative reason in inter-subjective communication". Analytic philosophers, heirs to the ideal of clarity in *Frege, Russell and the Birth of Analytic Philosophy*, were blunter: Searle (1990) called "poststructuralist" literary theory "a silly but non-catastrophic phenomenon". After his 1996 hoax article in *Social Text*, the physicist Alan Sokal, in *Intellectual Impostures* (1997; in the United States *Fashionable Nonsense*, 1998) with Jean Bricmont, attacked the misuse of mathematics and physics by Lacan, Kristeva, Irigaray, Bruno Latour, Jean Baudrillard, Deleuze and Guattari, and Paul Virilio. Foucault was not among their targets and Derrida appeared only for one remark; Derrida replied that "Sokal and Bricmont Aren't Serious".

Others put the tools to work. **Judith Butler**'s *Gender Trouble* (1990) argued that gender is performative, sustained by repeated acts, drawing on Foucault: "juridical systems of power produce the subjects they subsequently come to represent" (see *Feminist Philosophy*). **Gayatri Chakravorty Spivak**, born in Calcutta, in "Can the Subaltern Speak?" (1988) criticised a Foucault–Deleuze exchange for assuming the oppressed can speak and know their conditions, ignoring the "epistemic violence of imperialism", and argued through the British ban on sati that "the subaltern as female is even more deeply in shadow". **Edward Said**'s *Orientalism* (1978), drawing on Foucault and Derrida, analysed Western images of the "Orient" as a discourse bound up with power, and helped found postcolonial studies (see *Race, Colonialism and Philosophy*). Julia Kristeva, Hélène Cixous, Luce Irigaray and Sarah Kofman belonged to the movement from the start.

Structuralism promised a science of signs; its successors doubted that any system could stand outside the play of power and difference. Whether that doubt is a deeper rigour or a loss of nerve is the question their critics still press (see the *History of Philosophy* overview and *Analytic Philosophy since 1950*).

## Further exploration

- **Gary Gutting, *French Philosophy in the Twentieth Century* (2001).** A survey from Bergson to Derrida by the co-author of the Stanford Encyclopedia's Foucault entry.
- **Patrick Wilcken, *Claude Lévi-Strauss: The Poet in the Laboratory* (2010).** A life of Lévi-Strauss and the making of structuralism.
- **David Macey, *The Lives of Michel Foucault* (1993).** A detailed biography of Foucault.
- **Johanna Oksala, *Foucault on Freedom* (2005).** Argues that Foucault offers a coherent account of freedom, against the charge of normative confusion.
- **Benoît Peeters, *Derrida: A Biography* (tr. Andrew Brown, 2013).** A full biography of Derrida.
- **François Dosse, *Gilles Deleuze and Félix Guattari: Intersecting Lives* (tr. Deborah Glassman, 2010).** A double biography of the authors of *Anti-Oedipus*.
- **Behrooz Ghamari-Tabrizi, *Foucault in Iran: Islamic Revolution after the Enlightenment* (2016).** A reassessment of Foucault's Iranian writings.$structuralism_master$,
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
  select $structuralism_quiz$[
    {"type": "mcq", "prompt": "How did Saussure's Course in General Linguistics (1916) come to be published?", "options": ["Former students, Charles Bally and Albert Sechehaye (with Albert Riedlinger), compiled it after his death from notes on his Geneva lectures.", "Saussure wrote and revised it himself in the last years of his life.", "Roman Jakobson translated it from Saussure's Russian manuscripts.", "Lévi-Strauss edited it from Saussure's letters in wartime New York."], "answerIndex": 0, "explanation": "Saussure published almost nothing on general linguistics; the Course was compiled posthumously by Bally and Sechehaye, with Riedlinger's help, from students' notes on three courses of lectures, so he did not write it as a book.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Lévi-Strauss's The Elementary Structures of Kinship (1949), what is kinship fundamentally based on?", "options": ["Descent from a common ancestor.", "Alliance between groups, formed through the exchange of women in marriage.", "Economic contracts between individual households.", "The free choices of individual partners."], "answerIndex": 1, "explanation": "Against descent-based models, Lévi-Strauss argued that kinship rests on alliance formed through marriage exchange, with the incest taboo as the rule that requires exchange outside one's own line.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these does the Internet Encyclopedia of Philosophy identify as the central claim of Foucault's Discipline and Punish?", "options": ["That Bentham's Panopticon was built across Europe.", "That torture is more humane than imprisonment.", "That the prison's objective purpose is to produce criminality and recidivism, with reform part of the system.", "That knowledge is a neutral instrument of state power."], "answerIndex": 2, "explanation": "The IEP stresses that although Foucault is often presented as a theorist of panopticism, that is not the book's central claim; the main conclusion concerns the prison's production of delinquency.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Gayatri Chakravorty Spivak criticise in \"Can the Subaltern Speak?\" (1988)?", "options": ["Derrida's reading of Rousseau.", "Lévi-Strauss's analysis of myth.", "Habermas's theory of communicative reason.", "An exchange between Foucault and Deleuze that assumed the oppressed can speak and know their conditions, ignoring the epistemic violence of imperialism."], "answerIndex": 3, "explanation": "Spivak opened by criticising Foucault and Deleuze for claiming the oppressed can speak for themselves, and argued, through the British ban on sati, that the female subaltern is even more deeply in shadow.", "id": "q4"},
    {"type": "open", "prompt": "Reconstruct Foucault's genealogical argument in Discipline and Punish that modern punishment is a more effective form of control rather than simple humanitarian progress. Then assess the objection that his account is normatively confused, with the best replies.", "rubric": "A strong answer sets out the steps: the contrast between Damiens's execution (1757) and the regimented prison; correction by norms through hierarchical observation, normalising judgement and the examination; the production of knowledge, so that power and knowledge are inseparable (power/knowledge, distinguished from Bacon's 'knowledge is power'); the spread of discipline to army, factory, hospital and school, producing docile bodies, with the Panopticon as model; dispersed, productive power with no central designer; and the conclusion 'to punish less, perhaps; but certainly to punish better', so the arrangement is contingent. It notes the IEP's caveat that panopticism is not the central claim and Semple's point about Bentham. It presents Fraser's charge ('normatively confused'), Habermas's 'crypto-normativism' and performative contradiction, Taylor's point that power implies freedom and truth, and the feminist agency objection (Alcoff, Benhabib, Hartsock). It weighs replies: resistance as part of power, critique as resistance, the late Foucault's self-forming subject, and Allen's and Oksala's defences.", "id": "q5"},
    {"type": "open", "prompt": "Explain Derrida's deconstruction of the priority of speech over writing, including the meaning of 'il n'y a pas de hors-texte'. Then evaluate the criticisms of Searle, Habermas and the 1992 Cambridge letter, and the replies.", "rubric": "A strong answer explains logocentrism and the metaphysics of presence; the claim that speech is privileged as present to the speaker's meaning and writing demoted as a sign of a sign; the argument that the features used to demote writing (repeatability in absence, reference to other signs, deferral) hold of all signs, and that even present experience contains repetition; the two phases of reversal and re-inscription (arche-writing, trace, supplement, différance); the reading of Rousseau; and the hors-texte formula, its literal rendering and Derrida's 1988 gloss 'nothing outside context'. It evaluates Searle (misreading Austin on 'parasitic' uses, type and token, 'deliberate obscurantism'), Habermas ('dulls the sword of the critique of reason'), and the Cambridge letter ('does not meet accepted standards of clarity and rigour') with the 336–204 vote, against Derrida's reply that parasitic uses are an essential possibility of language and the view that the exchange was partly misunderstanding.", "id": "q6"}
  ]$structuralism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/structuralism-and-after', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
