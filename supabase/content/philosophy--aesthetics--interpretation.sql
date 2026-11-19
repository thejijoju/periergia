-- Interpretation and Meaning in Art — canonical master article, co-written and human-reviewed.
-- philosophy/aesthetics/interpretation @ research/advanced/read.
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
    'philosophy/aesthetics/interpretation',
    'research',
    'advanced',
    'read',
    $interp_master$> **Does a poem mean what its author meant, what its words allow, or whatever its readers make of it?** This chapter follows the quarrel over the author's intention, from Wimsatt and Beardsley's "intentional fallacy" through intentionalism of several kinds to Barthes's "death of the author", and asks whether a work has one right reading. It then turns to sad music, pictures, tears for fictional people, the pleasures of tragedy, and whether a morally flawed work is a worse work of art.

## What Does a Work Mean?

Are the ghosts in Henry James's *The Turn of the Screw* real? Does the conch in Golding's *Lord of the Flies* symbolise civilisation and democracy? The Internet Encyclopedia of Philosophy (IEP), in Szu-Yen Lin's entry on art and interpretation, opens with puzzles like these. **Interpretation**, in its definition, is "the attribution of meaning to a work", and the dispute that keeps returning is "whether the artist's or author's intention is relevant to the interpretation of the work".

A work's **global** meaning is its point; a **local** meaning is what one part conveys. "Attributing" a meaning can mean recovering one already in the work (the **retrieval** view) or imposing one on it (the **impositional** view). And evidence about what an artist intended is either **external** (interviews, diaries, letters) or **internal** (the work itself, which intentionalists regard as the best evidence, and the only evidence for anonymous works).

Michael Wreen, in the Stanford Encyclopedia of Philosophy (SEP), frames the whole debate as a question about two sentences: (1) "The artist intended *x* to mean *p* in work *w*", and (2) "*x* means *p* in work *w*". For E. D. Hirsch, (1) entails (2). For Monroe Beardsley, (1) gives "no direct evidential support" for (2). And "many philosophers, probably the majority", Wreen says, sit in between: intentions carry some weight, but not infinite weight.

## The Intentional Fallacy

The modern debate starts with "The Intentional Fallacy", published in the *Sewanee Review* in 1946 by the Yale professor of English William K. Wimsatt Jr. (1907–1975) and the philosopher Monroe C. Beardsley (1915–1985). The IEP calls it "the first thorough presentation of anti-intentionalism, commonly regarded as starting point of the intention debate". It reacted against biographical criticism and is associated with the **New Criticism**, a school of criticism centred on the text itself. Its most quoted sentence needs care: "the design or intention of the author is neither available nor desirable as a standard for judging the success of a work of literary art". Strictly, that is a claim about *evaluating* a work, about judging whether it succeeds; the authors and later critics applied it to interpretation. Beardsley later extended the view across all the arts.

```quote
[The poem] is detached from the author at birth and goes about the world beyond his power to intend about it or control it. The poem belongs to the public.
W. K. Wimsatt and Monroe C. Beardsley · "The Intentional Fallacy" · 1946
```

The view is also called **conventionalism**: linguistic and literary conventions suffice to fix what a work means, and critical statements must in the end be tested against the work. What a sentence means depends on "public conventions of usage", so an author can be wrong about his own poem. Beardsley's sculpture example makes the point vivid. Suppose a "large, twisted, cruller-shaped object of polished teak" is announced by its maker to symbolise "Human Destiny". The question, Beardsley said, is whether the object *can be made* to mean that; otherwise anything could symbolise anything by fiat, and another copy could just as well be labelled "Spirit of Palm Beach, 1938". Wreen replies that this shows only that the artist's say-so is not absolute.

The IEP reconstructs "the famous argument offered by Wimsatt and Beardsley" as a dilemma:

1. Either the artist's intention is successfully realised in the work, or it is not.
2. If it is realised, appeal to external evidence of the intention is unnecessary: we can detect the intention from the work.
3. If it is not realised, appeal to external evidence is insufficient: the unrealised intention is extraneous to the work, and convention alone fixes what the work means.
4. So appeal to external evidence of intention is either unnecessary or insufficient, and treating it as relevant commits "the intentional fallacy".

A second version is shorter: since artists do not always realise their intentions, the inference "the artist intended *w* to mean *p*, so *w* means *p*" is invalid.

**Objection.** Hirsch pressed two. First (1967), convention alone often cannot pick out a single meaning; a work such as *Ulysses* sustains several readings, and only intention can choose between them. Second (1976), irony. Daniel Defoe's pamphlet *The Shortest Way with the Dissenters* was taken by many at publication as a genuine attack on Dissenters. The only ground for calling it ironic seems to be what Defoe intended, which is just the kind of external fact the dilemma rules out.

**Reply.** Beardsley answered the first point (1970) by appeal to coherence: in most cases, working out which reading best holds the whole work together eventually leaves a single correct interpretation. To the second (1982) he replied that irony must offer the possibility of being understood; if the artist cannot imagine anyone taking a work ironically, there is no reason to think it ironic. A third objection, that features such as being revolutionary depend on historical context, is met by Stephen Davies (2005), who argues that Beardsley's position allows such context.

## Actual, Moderate and Hypothetical Intentionalism

Hirsch's *Validity in Interpretation* (1967) defends "the sensible belief that a text means what its author meant". It separates a text's **meaning**, which is fixed, from its **significance**, which changes over time; Sherri Irvin calls the book "the seminal statement of actual intentionalism". The IEP distinguishes three versions of **actual intentionalism**, the view that the author's real intention settles meaning.

{{image: Humpty Dumpty | Humpty Dumpty, whose boast in Lewis Carroll's *Through the Looking-Glass* (1871) that a word "means just what I choose it to mean" gave its name to the most extreme form of intentionalism.}}

**Absolute** intentionalism holds that a work means whatever its creator intends. It has been dubbed "Humpty-Dumptyism", after the character in *Through the Looking-Glass* who claims that when he uses a word, "it means just what I choose it to mean". Its best argument is that marks made in sand by accident are not a poem; but that shows intention is needed for meaning at all, not that it infallibly fixes *which* meaning. Hirsch's own view, which the IEP calls **extreme**, lets convention fix the possible meanings and intention choose one.

**Moderate** intentionalism, defended by Noël Carroll, Robert Stecker and Paisley Livingston, says that when an intention succeeds it fixes meaning; when it fails, convention (and perhaps context) does. Success needs more than compatibility. If Agatha Christie announced that Hercule Poirot was a smart Martian in disguise, nothing in the novels would contradict her, yet we would not accept it; Livingston's "meshing" condition requires real coherence between the intention and the patterns of the work. Carroll's **conversation argument** supports the approach: interpreting art is like conversation, whose aim is to grasp what the speaker means. Critics reply that art is more like a monologue.

**Hypothetical intentionalism**, founded by William Tolhurst (1979) and developed by Jerrold Levinson from the 1990s, says a work means what an appropriate audience would best hypothesise its author intended. For Tolhurst the audience is the *intended* one: given the background of the readers Swift wrote for, the best hypothesis about *A Modest Proposal* is satire, not a real proposal to sell poor children as food. But an esoteric intended audience makes meaning private, close to Humpty-Dumptyism, so Levinson substituted an ideal audience that knows the public facts about artist and work, and added a tie-breaker: of equally good hypotheses, prefer the one that makes the work artistically better. Carroll objects: why keep a hypothesis once a newly found diary proves it false? Levinson's answer is that the best hypothesis constitutes the *utterance's* meaning, not the *utterer's*. Davies objects that the view collapses into **value-maximising** theory, a revived anti-intentionalism on which interpretation should make a work as good as conventions and context allow. (Its own embarrassment is Ed Wood's *Plan 9 from Outer Space*, which becomes a masterpiece if read as postmodern satire; Davies replies that the reading is anachronistic.)

Where does the debate stand? In the IEP's judgement, "actual intentionalism remains the most popular position among all", probably because of Grice's influence, with book-length defences by Stecker, Livingston, Carroll and Kathleen Stock.

## The Death of the Author

A very different attack on intention came from France. *Structuralism and After: Foucault, Derrida and Their Critics* gives the background; here the interest is the argument. Roland Barthes's "The Death of the Author" first appeared in English, in the American magazine *Aspen* (1967), and in French only in 1968; it was collected in *Image-Music-Text* (1977). Barthes argued against criticism that uses the author's intentions and biography to fix a text's "ultimate meaning". To give a text an Author, he wrote, "is to impose a limit on that text". The writer is a "scriptor" who "is born simultaneously with the text", and a text is woven from many cultural sources rather than issuing from one mind. Refusing a final meaning is, he said, "an anti-theological activity".

```quote
the birth of the reader must be at the cost of the death of the Author.
Roland Barthes · "The Death of the Author", translated by Stephen Heath in Image-Music-Text · 1977
```

Michel Foucault's lecture "What Is an Author?" (1969) did not mention Barthes, but is widely read as a response to him. For Foucault the author is a function of discourse, "a classifying principle", which does not apply to all texts equally (a novel and a science textbook, for instance), and he tied the rise of the author to legal liability for transgressive texts. "The author", he concluded, in Josué Harari's translation, "is therefore the ideological figure by which one marks the manner in which we fear the proliferation of meaning."

Wimsatt and Beardsley had also detached the poem from its author, but to make readings *more* authoritative, answerable to the public text; Barthes freed the reader. Critics include Seán Burke and Peter Lamarque, and the IEP finds the analytic dominance of intentionalism an "interesting contrast" with post-structuralism.

## One Right Reading?

Must a work have one correct interpretation? Michael Krausz calls the view that it must **singularism**, and the view that it may answer to more than one *opposed* interpretation **multiplism**; rival readings that are really about different objects are only "innocuous pluralism". Beardsley, with his appeal to coherence, was a monist, and Nehamas defended "critical monism as a regulative ideal" (1981), an aim to steer by. Value-maximisers such as Davies and Goldman explicitly allow several legitimate readings. Joseph Margolis, a "radical historicist", went furthest, elaborating a "robust relativism" in *Interpretation Radical But Not Unruly* (1995).

The question of how much a text can mean beyond what it says was also central to Sanskrit poetics. In the ninth century the Kashmiri critic Ānandavardhana argued in the *Dhvanyāloka* (*Light on Suggestion*) for a third power of language, **suggestion** (*dhvani*), beyond literal meaning and secondary meaning. "The village is on the Ganges" is literally absurd, so secondary meaning repairs it (on the *bank*); suggestion adds purity and coolness, without any failure of literal sense. Its highest aim in poetry, he held, is to suggest *rasa*, aesthetic emotion. Mahima Bhaṭṭa objected that suggestion reduces to inference. *Aesthetics across Traditions* treats *rasa* itself.

```checkpoint
q: In the IEP's reconstruction of Wimsatt and Beardsley's argument, why is external evidence of intention "insufficient" when the intention was not realised?
a*: Because the unrealised intention is extraneous to the work, and convention alone fixes what the work means.
a: Because no one can ever know what an artist intended.
x: The argument does not rest on scepticism about minds; that is a separate epistemic worry, answered by Carroll.
a: Because artists always realise their intentions.
x: The dilemma's second horn assumes that intentions sometimes fail.
a: Because the work's meaning is whatever the reader decides.
x: That is closer to Barthes; Wimsatt and Beardsley made public conventions, not readers, the standard.
hint: What fixes meaning, on the conventionalist view, when the artist's plan misfires?
why: If the intention shows in the work, external evidence is unnecessary; if it does not, the intention is not part of the work and convention decides. Hirsch's cases of ambiguity and of Defoe's irony challenge exactly this step.
---
q: What problem in Tolhurst's hypothetical intentionalism led Levinson to change the relevant audience?
a: The intended audience always reads a work as satire.
x: Satire was the right reading of A Modest Proposal for its intended readers; it was an example, not a problem.
a: The intended audience cannot form hypotheses at all.
x: Tolhurst's view is precisely that the intended audience forms the best hypothesis.
a*: An esoteric intended audience would make meaning private, close to Humpty-Dumptyism.
a: The intended audience makes every work artistically better.
x: The aesthetic tie-breaker is Levinson's addition, not a feature of the intended audience.
hint: Think of an author who writes for a tiny circle of insiders.
why: Levinson substituted an ideal audience who knows the public facts about artist and work, and added that, of equally good hypotheses, one should prefer the one that makes the work better.
```

## Can Music Be Sad?

Music is "standardly said" to be happy or sad, Andrew Kania notes in the SEP, but the paradigm expressers of emotion are psychological agents, and pieces of music are not. So what does "sad music" mean? At one pole, **eliminativists** treat emotional descriptions as shorthand for purely musical features. Eduard Hanslick (1854) is the classic name here: the content of music, he wrote, consists of *tönend bewegte Formen*, "tonally moving forms" in Geoffrey Payzant's translation, "sonically moved forms" in Lee Rothfarb and Christoph Landerer's (2018). How to read Hanslick is itself debated: some take him to sever music from emotion entirely, while others point to his preface, where beauty rests on "the direct evidence of feeling". Critics reply that no workable reduction has been given, and paraphrase loses what matters.

Simpler answers fail: composers need not feel what they express, and some competent listeners are not made sad by sad music. Three richer theories remain in contention.

Peter Kivy's **contour theory**, in *The Corded Shell* (1980), says we hear emotion in music because its shape resembles the shape of human utterance and gesture, as we see sadness in a St Bernard's face; we are "psychologically determined to animate what we perceive". Jerrold Levinson objects that everything resembles everything in some respect, so resemblance cannot be fundamental. His **persona theory** holds that music is expressive because it is "readily hearable as" the expression of emotion by an indeterminate imagined agent, a persona. Stephen Davies's **appearance emotionalism** (*Musical Meaning and Expression*, 1994) says music is sad in a "literal albeit secondary sense", as a weeping willow is sad, "no more metaphorical than a claim that a chair has arms": it presents an appearance of sadness, and we experience the resemblance without imagining anyone.

## How Pictures Depict

How does a painted surface show a horse? The oldest answer, going back to Plato's *Republic*, is **resemblance**. Nelson Goodman's *Languages of Art* (1968) attacked it: resemblance is reflexive and symmetric (everything resembles itself; if A resembles B, B resembles A), but representation is neither, and "resemblance in any degree is no sufficient condition for representation". The SEP notes that the formula Goodman targeted, that A depicts B if and only if A appreciably resembles B, was never actually proposed by anyone. Goodman's alternative is **conventionalism**: depiction is a kind of reference, like description, and "Realism is relative, determined by the system of representation standard for a given culture or person at a given time." Christopher Peacocke and Robert Hopkins have since revived resemblance as *experienced* resemblance in shape.

Richard Wollheim (1923–2003) located depiction in a kind of seeing. In **seeing-in**, "two things happen: I am visually aware of the surface I look at, and I discern something standing out in front of, or (in certain cases) receding behind, something else." This **twofoldness**, one experience with two aspects, is why a trompe l'oeil that fools the eye is, for Wollheim, not a depiction. Kendall Walton's **make-believe** theory, in *Mimesis as Make-Believe* (1990), treats pictures as props in games of imagining: looking at the surface, one imagines one's seeing to be a seeing of the horse. Wollheim and others criticised it for failing to integrate the two aspects of seeing-in.

Photographs raise a special question. Walton argued in 1984 that "Photographs are *transparent*. We see the world *through* them", as through a mirror or a telescope. The SEP calls the claim controversial. Three years earlier, Roger Scruton's "Photography and Representation" (1981) had issued a related sceptical challenge: an "ideal photograph" stands in a merely causal, not intentional, relation to its subject, and so does not represent as a painting does.

## Fearing Fictions

Readers weep for Anna Karenina, knowing she never lived. Colin Radford's paper "How Can We Be Moved by the Fate of Anna Karenina?" (1975) concluded that such emotion is "irrational, incoherent, and inconsistent". Its argument is now usually set out as a triad, a later standard reconstruction; as Katie Tullmann notes in the SEP, the formulation is not found in Radford's original paper:

1. People feel emotions for fictional characters and situations, knowing them to be fictional.
2. People do not believe that fictional characters and situations exist.
3. To feel an emotion for something, one must believe that it exists.
4. The three cannot all be true; Radford kept them all and concluded that our response is irrational.

**Objection.** Walton, in "Fearing Fictions" (1978), denied the first claim. Charles watches a horror film in which the Green Slime turns towards the camera. His heart races, but he does not run from the cinema. "Charles does not believe that he is in danger; so he is not afraid." It is fictional, in his game of make-believe, that he fears the Slime; his real state is **quasi-fear**, and a reader has quasi-pity for Anna.

**Reply.** **Thought theorists** such as Lamarque (1981) and Carroll (1990) deny the third claim instead. The third claim is, the SEP says, "a piece of articulated theory", the cognitive theory of emotion, not common sense. One can be frightened just by entertaining a thought, as Carroll illustrates with thinking about the demon in *The Conjuring*. And Walton's own test from behaviour, they note, is just what explains why few think we *believe* in fictions. The SEP calls this view "possibly the most widely accepted of all".

## Tragedy and Imaginative Resistance

A second paradox is older. David Hume posed it in "Of Tragedy", in his *Four Dissertations* (1757): "It seems an unaccountable pleasure, which the spectators of a well-written tragedy receive from sorrow, terror, anxiety, and other passions, that are in themselves disagreeable and uneasy." Audiences, Hume observed, are "pleased in proportion as they are afflicted". His answer was **conversion**: eloquence and artistry convert the melancholy passions into pleasure, as in Cicero's moving account of the crucified Sicilian captains. Jonathan Gilmore's SEP entry objects that there are not two stages; we only ever respond to content as represented, so nothing is converted. Other answers: Feagin's **meta-response** (we enjoy being the kind of person who is moved), and Walton's suggestion that sadness is not itself negative.

The same volume holds the seed of a third puzzle. In "Of the Standard of Taste" (whose theory of taste *Beauty and Taste* covers) Hume noted that we accept old works' strange customs, kings and heroes "dressing their own victuals", but that where vice is described without blame, "I cannot, nor is it proper that I should, enter into such sentiments". Tamar Szabó Gendler (2000) named this **imaginative resistance**: "the puzzle of explaining our comparative difficulty in imagining fictional worlds that we take to be morally deviant". Authors may make cars fly or mice talk; but faced with Walton's example, "In killing her baby, Giselda did the right thing; after all, it was a girl", we balk. Walton's "cantian" answer is that we *cannot* imagine moral facts depending on natural facts differently. Gendler's "wontian" answer is that we *will not*: she wrote a story in which 12 both is and is not the sum of 5 and 7, so impossibilities can be imagined; resistance arises in realistic fictions, whose truths we import from and export back to the real world, so we will not take on their deviant moral views.

```checkpoint
q: How does Walton's account of Charles and the Green Slime answer Radford's paradox?
a: It denies that people believe fictional characters do not exist.
x: That is the suspension-of-disbelief route; few accept it because we do not behave as believers.
a*: It denies that Charles really fears the Slime: his state is quasi-fear, and it is only fictional that he is afraid.
a: It denies that emotions require any belief about their objects.
x: That is the thought theory of Lamarque and Carroll, which rejects the third claim.
a: It accepts all three claims and concludes that our responses are irrational.
x: That was Radford's own conclusion, which Walton rejected.
hint: Charles's heart races, but what does he not do?
why: Walton keeps the requirement that fear needs a belief in danger, and concludes that what we feel for fictions is quasi-emotion within a game of make-believe. Thought theorists reply that the belief requirement is a piece of theory, not common sense.
---
q: What is the difference between "cantian" and "wontian" explanations of imaginative resistance?
a: Cantians say resistance is aesthetic; wontians say it is about fictional truth.
x: Those are among the different puzzles distinguished by Walton and Weatherson, not the two explanations.
a: Cantians follow Kant; wontians follow Hume.
x: The labels are a pun on "can't" and "won't", not on the names of philosophers.
a: Cantians say we cannot imagine flying cars; wontians say we will not imagine talking mice.
x: Flying cars and talking mice are what authors may freely stipulate; the puzzle concerns morally deviant worlds.
a*: Cantians say we cannot imagine the morally deviant scenario; wontians, like Gendler, say we will not.
hint: Gendler's story about 5 + 7 shows that even impossibilities can be imagined.
why: Walton held that we cannot imagine moral facts depending on natural facts differently. Gendler argued that resistance reflects unwillingness to adopt a perspective in realist fictions whose truths we carry back into the world.
```

## Art and Morality

Is a morally bad work a worse work of art? Plato's *Republic* censored stories in which the gods quarrel, and Tolstoy, who judged art by its purpose in human life, is what Ella Peek's IEP entry calls a **radical moralist** (see *Plato* and *What Is Art?*). At the other extreme stands **radical autonomism**, "art for art's sake", in the spirit of Oscar Wilde's preface to *The Picture of Dorian Gray*: "Life is the solvent that breaks up art, the enemy that lays waste her house." The positions most defended today are milder.

**Moderate autonomism** (J. Anderson and J. Dean, 1998) allows that we may judge art morally, but holds that moral merits and defects are never aesthetic ones. Carroll's **moderate moralism** (1996) holds that "sometimes the moral defects and/or merits of a work may figure in the aesthetic evaluation of the work". His reason is that narratives rely on "activating the moral powers" of their audiences. When a work asks for a response a morally sensitive person cannot give, the same feature is both a moral and an aesthetic flaw; the viewer, in Carroll's image, "can't depress the accelerator because it is jammed". Mary Devereaux's analysis of Leni Riefenstahl's *Triumph of the Will* (1935), the film of the 1934 Nazi Party Congress at Nuremberg, fits this pattern: a morally sensitive viewer can admire its innovative camera work but cannot fully engage with its central vision, the glorification of Hitler. On Carroll's view, its moral and aesthetic defects share a common reason.

Berys Gaut's **ethicism** goes further: whenever a work manifests ethically reprehensible attitudes, it is "to that extent aesthetically defective". This is a *pro tanto* claim, one consideration among many aesthetic values. Gaut's **merited-response argument**, as Peek numbers it, runs:

1. A work's manifesting an attitude is a matter of its prescribing certain responses towards the events it describes.
2. If those responses are unmerited, because unethical, we have reason not to respond as prescribed.
3. Our having reason not to respond as prescribed is a failure of the work.
4. What responses a work prescribes is of aesthetic relevance.
5. So our having reason not to respond as prescribed is an aesthetic defect of the work.
6. So a work's manifesting ethically bad attitudes is an aesthetic defect in it, and likewise, good attitudes are merits; so ethicism is true.

**Objection.** Carroll answers with immoral jokes. If "unmerited" means "unwarranted", it is false that every immoral prescribed response is unwarranted: a joke's structure can warrant amusement that is morally wrong. If it means "morally unmerited", the argument begs the question. So "not all ethically unmerited responses to artworks are unmerited aesthetically".

**Reply.** Peek answers that an ideally moral audience would no more find a racist joke funny than find *Triumph of the Will* engaging; and laughing at a joke is not judging an artwork aesthetically good, as we can enjoy a "bad film" knowing it is bad.

Conolly (2000) argues that moderate moralism, resting on an ideal sensitive audience, collapses into ethicism. On the far side, **immoralists** hold that moral flaws can sometimes be artistic merits. For Matthew Kieran's "cognitive immoralism", a moral defect can be a merit when it yields understanding of a repugnant perspective; for A. W. Eaton (2012), getting an audience *not* to resist a morally deviant scenario can be an aesthetic achievement. The chapter's first question returns here: to judge what attitude a work manifests, one must first decide what it means.

## Further exploration

- **Paisley Livingston, *Art and Intention: A Philosophical Study* (2005).** A defence of moderate intentionalism and the meshing condition, with a critique of hypothetical intentionalism.
- **Robert Stecker, *Interpretation and Construction: Art, Speech, and the Law* (2003).** Moderate intentionalism, incompatible interpretations, and an extension to the law.
- **Stephen Davies, *Musical Meaning and Expression* (1994).** The standard treatment of musical expressiveness and the source of appearance emotionalism.
- **Kendall L. Walton, *Mimesis as Make-Believe: On the Foundations of the Representational Arts* (1990).** The make-believe theory of fiction and pictures, and the home of quasi-emotions.
- **Jenefer Robinson, *Deeper than Reason: Emotion and Its Role in Literature, Music, and Art* (2005).** How emotional responses to art work, with weight on the non-cognitive.
- **Berys Gaut, *Art, Emotion and Ethics* (2007).** The book-length defence of ethicism.
- **Daniel H. H. Ingalls (tr.), *The Dhvanyāloka of Ānandavardhana with the Locana of Abhinavagupta* (1990).** The key Sanskrit text on suggestion, in English.$interp_master$,
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
  select $interp_quiz$[
    {"type": "mcq", "prompt": "Wimsatt and Beardsley wrote that the author's design or intention is \"neither available nor desirable as a standard\" for what?", "options": ["For deciding who owns the copyright in a work", "For judging the success of a work of literary art", "For deciding whether an object counts as art at all", "For choosing which works should be taught in schools"], "answerIndex": 1, "explanation": "The famous sentence from \"The Intentional Fallacy\" (1946) concerns judging a work's success, that is, evaluating it. The authors and later critics applied the same idea to interpretation, and the IEP reconstructs their argument as a dilemma: realised intentions make external evidence unnecessary, unrealised ones make it insufficient.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best describes moderate actual intentionalism, as defended by Carroll, Stecker and Livingston?", "options": ["A work means whatever its creator intends, however odd", "A work means what an ideal audience would best hypothesise its author intended", "A work means whatever reading makes it most valuable", "When an author's intention succeeds it fixes meaning; when it fails, convention and perhaps context do"], "answerIndex": 3, "explanation": "Moderate intentionalism gives successful intentions the final say and falls back on convention when they fail. Success needs more than compatibility: Livingston's meshing condition rules out Agatha Christie declaring Poirot a Martian. The first option is absolute intentionalism (Humpty-Dumptyism), the second hypothetical intentionalism, the third value-maximising theory.", "id": "q2"},
    {"type": "mcq", "prompt": "What does Stephen Davies's appearance emotionalism say about sad music?", "options": ["Music is sad in a literal but secondary sense, presenting an appearance of sadness, as a weeping willow does", "Music is sad only because it makes listeners feel sad", "Music is sad because we imagine a persona expressing sadness through it", "Calling music sad is just shorthand for describing its notes, with no reference to emotion"], "answerIndex": 0, "explanation": "Davies holds that music presents an appearance of sadness, a use of 'sad' no more metaphorical than saying a chair has arms. The persona view is Levinson's; the shorthand view is eliminativism, associated with Hanslick; the arousal view faces the objection that competent listeners can be unmoved.", "id": "q3"},
    {"type": "mcq", "prompt": "In the debate on art and morality, how does Gaut's ethicism differ from Carroll's moderate moralism?", "options": ["Gaut denies that moral flaws ever affect aesthetic value; Carroll says they always do", "Gaut says only that we may judge art morally; Carroll says moral and aesthetic value are identical", "Gaut holds that ethically bad attitudes are always, pro tanto, aesthetic defects; Carroll says moral flaws only sometimes figure in aesthetic evaluation", "Gaut holds that moral flaws are often aesthetic merits; Carroll holds they are always defects"], "answerIndex": 2, "explanation": "Carroll's moderate moralism claims that sometimes moral defects or merits figure in aesthetic evaluation; Gaut's ethicism makes the claim general but pro tanto, one consideration among many aesthetic values. Conolly argued that moderate moralism collapses into ethicism. The view that moral flaws can be merits is immoralism.", "id": "q4"},
    {"type": "open", "prompt": "Set out the paradox of fiction as it is now usually reconstructed, and compare Kendall Walton's solution with the thought theory. Which do you find more convincing, and why?", "rubric": "A strong answer gives the three claims: we feel emotions for fictional characters knowing they are fictional; we do not believe they exist; emotion requires belief that its object exists. It notes that this triad is a later standard reconstruction, not found in Radford's 1975 paper, and that Radford himself concluded our responses are irrational. It explains Walton's denial of the first claim: Charles and the Green Slime, the lack of fleeing, quasi-fear within a game of make-believe. It explains the thought theory (Lamarque, Carroll), which denies the third claim as a piece of theory rather than common sense, with the point that merely entertaining a thought can frighten. Credit for objections on each side (fear at horror films feels real; the thought theory's objects become thought contents) and for a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Explain Gaut's merited-response argument for ethicism, Noël Carroll's objection from immoral jokes, and Ella Peek's reply. Use Triumph of the Will to illustrate the debate.", "rubric": "A strong answer sets out the steps: a work manifests attitudes by prescribing responses; unethical responses are unmerited, giving us reason not to respond as prescribed; that is a failure of the work; prescribed responses are aesthetically relevant; so manifesting bad attitudes is an aesthetic defect (pro tanto). It gives Carroll's dilemma: if 'unmerited' means 'unwarranted', a joke's structure can warrant immoral amusement; if 'morally unmerited', the argument begs the question. It gives Peek's reply: an ideally moral audience would not find a racist joke funny, and laughing is not judging a work good. It uses Devereaux's analysis of Triumph of the Will: a morally sensitive viewer can admire its camera work but cannot fully engage with its glorification of Hitler, so on Carroll's view moral and aesthetic defects share a common reason. Credit for placing the debate between autonomism and immoralism.", "id": "q6"}
  ]$interp_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/aesthetics/interpretation', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
