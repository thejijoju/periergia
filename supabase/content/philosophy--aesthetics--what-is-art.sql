-- What Is Art? — canonical master article, co-written and human-reviewed.
-- philosophy/aesthetics/what-is-art @ research/advanced/read.
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
    'philosophy/aesthetics/what-is-art',
    'research',
    'advanced',
    'read',
    $whatisart_master$> **Is a banana taped to a wall art? A child's painting? A urinal signed "R. Mutt"?** This chapter follows three classic answers to what all art has in common: imitation (Plato and Aristotle), expression (Tolstoy and Collingwood) and form (Bell, Fry and Hanslick). It sets out two arguments step by step, Weitz's case that art cannot be defined and Danto's argument from indiscernible objects, then follows the definitions that came after Duchamp and Warhol: institutional, historical, aesthetic and cluster theories. It ends by asking whether "art" is a modern European category.

## What Would a Definition Do?

The Internet Encyclopedia of Philosophy (IEP) opens its entry on the subject with a set of puzzles: video games, a six-year-old's painting, a Christmas tree in a shopping mall, and Cattelan's *Comedian*, "a banana taped to a wall". Which of these are art, and why? In analytic philosophy, a **definition** of art usually means **necessary and sufficient conditions**: features that every artwork has (necessary) and that together guarantee that something is art (sufficient).

George Dickie distinguished the **descriptive** sense of the word from the **evaluative** sense; as the IEP illustrates, "archaeologists found tools, clothes and artworks" describes; "your couscous is a real artwork!" praises. A definition aims at the first sense, so it must include bad art. The IEP adds that it should also include art by people who have no concept of "art", and avant-garde or even extraterrestrial art; exclude natural objects and nicely designed artefacts such as a shoelace; and make sense of borderline cases such as lullabies, rituals and jokes.

Any definition must also fit some facts. The Stanford Encyclopedia of Philosophy (SEP), in Thomas Adajian's entry, notes that artefacts intentionally given aesthetic interest "first appeared hundreds of thousands of years ago and exist in virtually every known human culture", sometimes with ceremonial, religious or propagandistic functions; that only some cultures have institutions for objects with no practical use; and that sunsets and proofs have aesthetic qualities without being art.

## Imitation: Plato's Quarrel with the Poets

The oldest answer is **mimesis**. The Greek *mimêsis* is usually translated "imitation", but also "representation"; Nickolas Pappas, in the SEP, warns that "imitation" does not cover everything the Greek word does.

Plato's *Republic* attacks poetry twice. In Book III the target is **impersonation**. Homer sometimes "makes himself like" a character, speaking "as if he were someone else" (393b–c), and Plato argues that performing base characters breeds the traits imitated (395c–397e). A performer able to "mimic all things" would be crowned with wool and sent "off to another city" (398a). How much this bans is debated. Pappas reads 398a as excluding all mimetic works; Charles Griswold argues that Book III bans only part of imitative poetry, and that when Socrates later claims all of it was banished (595a), he "mischaracterizes the results of the earlier discussion".

Book X attacks imitation as **copy-making**, in three steps (Pappas's summary): poetic mimesis, like painting, imitates appearance only and ranks far below truth; so it corrupts the soul by weakening reason's control; so it should be excluded from the good city. A carpenter makes a bed by looking towards the Form of the bed (the *Plato* chapter explains the Forms); a painter paints only the bed's appearance from one point of view (598a), and can paint a shoemaker without knowing shoemaking. The imitator is "third from the king and the truth" (597e). Popular summaries call a painting "an imitation of an imitation", but Pappas notes that Book X never calls the carpenter's bed an imitation: the painting is an "imitation of appearance".

Why does it matter? An illusion fools one part of us while reason knows better, so the fooled part is not reason. When tragedy shows a hero weeping over a dead son, "the pitying part [of the soul], fed strong on these examples, is not easily held down in one's own sufferings" (606b, in Allan Bloom's translation). Only hymns to the gods and praise of good men are allowed (607a). Plato called this "an old quarrel between philosophy and poetry" (607b), though Glenn Most has asked whether any such quarrel existed before him. Plato grouped painting and poetry as imitation, but, as Adajian notes, art for him yields no knowledge and is not even the main home of beauty.

## Aristotle: the Pleasure of Likeness

The *Poetics* does not name Plato, but "it is difficult not to take Aristotle as responding to Plato's critique", in Pierre Destrée's words. *Poetics* 4 traces poetry to the human instinct for mimesis and our pleasure in its products (1448b4–5). Why do we enjoy pictures of things we dislike seeing? In Destrée's translation: "Seeing a likeness is pleasurable, because in contemplating it, people come to understand (*manthanein*) through inference, what each of its details are: for example, that the man there is so-and-so" (1448b15–17). Is this real learning? On a **cognitivist** reading, the pleasure of art is the pleasure of learning; on a **deflationary** reading (Jonathan Lear, Ferrari), it is only recognising someone you already know. Aristotle also ranked poetry as "more philosophical and more worthy" than history, because it "tends towards a general picture" (1451b5–7).

Aristotle counted music as imitation too, since it imitates emotion and character (*Politics* 1340a); for the ancients, as the IEP puts it, there was no non-representational art. Tragedy's *katharsis* of pity and fear, which he never explains, is discussed in *Aristotle*; readings range from medical purgation (Jakob Bernays, in the late 1850s) to "clarification" (Martha Nussbaum) and simple release of feeling.

## From Imitation to the Fine Arts

Mimesis dominated for "around two millennia" (the IEP's phrase). In 1746 Charles Batteux popularised the term "fine arts" (*beaux-arts*) and made their single principle the imitation of beautiful nature; music that represents nothing, he said, "goes astray". But imitation is not **necessary** for art: Yayoi Kusama's abstract infinity nets represent nothing, and neither, it seems, does instrumental music (Roger Scruton and others reply that all music represents, or is a metaphor for, movement and emotional change). Nor is it **sufficient**: passports and instruction manuals represent things and are not art.

## Expression: Tolstoy

The second answer is that art **expresses** feeling. Tolstoy's *What Is Art?* was completed in Russian in 1897 but, because of the censors, first published in English, in 1898. In Aylmer Maude's translation:

```quote
To evoke in oneself a feeling one has once experienced, and having evoked it in oneself, then, by means of movements, lines, colors, sounds, or forms expressed in words, so to transmit that feeling that others may experience the same feeling—this is the activity of art.
Leo Tolstoy · What Is Art?, chapter V, trans. Aylmer Maude, as quoted in the IEP · 1897–98
```

Tolstoy called the transmission "infection". The definition is generous (jokes and church services can be art) and morally neutral: feelings "very bad and very good, if only they infect the reader … constitute the subject of art" (Pevear–Volokhonsky translation). The IEP calls it a particularly strong expressivism, because "until the audience feels what the artist feels, there is no art". Judging art was another matter: Tolstoy valued it by its moral work in the "evolution of feelings", praising *Uncle Tom's Cabin* and dismissing Wagner, Shakespeare and all his own works but two stories as "bad art".

Expression is not **necessary**, critics reply: "cold" works such as Malevich's *White on White* seem to communicate no feeling, and Poe claimed to have written "The Raven" "with the precision and rigorous logic of a mathematical problem". Nor is it **sufficient**: love letters and insults express feeling and are not art.

## Collingwood: Art Proper

R. G. Collingwood (1889–1943) gave expression theory its most careful form in *The Principles of Art* (1938). He separated **art proper** from things "falsely" called art (representation, magic, amusement), arguing that these are all crafts and art is not. A **craft** distinguishes means from end, planning from execution, raw material from product. **Magic** arouses emotion to be discharged in practical life; **amusement** arouses it by make-believe, to be "earthed" in the experience.

The key contrast is between **arousing** an emotion, a craft with a planned effect, and **expressing** one. Collingwood describes a person who feels a disturbance "of whose nature he is ignorant": "I feel … I don't know what I feel." He frees himself "by doing something which we call expressing himself", and his mind "is somehow lightened and eased". To express an emotion is to become conscious of what it is, so it cannot be planned; the relief is clarity, not catharsis. Unlike Tolstoy, Collingwood did not require the audience to feel anything; Susanne Langer later required only that the artist know the feeling, presented in "symbolic form".

For Collingwood the work of art proper is an **imaginary object**: "the making a tune is an instance of imaginative creation", so artworks are not, strictly, artefacts. Hence the standard objection, pressed by Gary Kemp in the SEP: if the work exists in imaginative experience, how can spectators interpret it correctly or incorrectly, or argue about the same work?

## Significant Form

A third answer looks to **form**: the arrangement of lines, colours or sounds. Its background is Kant's free beauty, like that of flowers or wallpaper patterns, judged with no concept of what the object should be (see *Beauty and Taste*).

Clive Bell (1881–1964), a member of the Bloomsbury Group, set out the theory of **significant form** in *Art* (1914). He asked what quality is common to "Sta. Sophia and the windows at Chartres, Mexican sculpture, a Persian bowl, Chinese carpets, Giotto's frescoes at Padua, and the masterpieces of Poussin, Piero della Francesca, and Cézanne", and answered: "Only one answer seems possible – significant form." To appreciate a work, "we need bring with us nothing from life"; representation is irrelevant. The theory defended abstract and Post-Impressionist painting, and Bell developed it after meeting Roger Fry (1866–1934), who coined "Post-Impressionism" and argued in *Vision and Design* (1920) that our response to art comes from line, mass, colour and design. In music, Eduard Hanslick's *On the Musically Beautiful* (1854) held that music cannot represent a specific feeling, because emotions are defined by concepts, which music cannot convey: "Music can, in fact, whisper, rage, and rustle. But love and anger occur only within our hearts."

Formalism is not necessary (conceptual works such as Beuys's three days caged with a coyote lack relevant formal properties) nor sufficient (many elegant artefacts are not art). Critics have also charged that it is circular, since Bell identifies significant form only through the aesthetic emotion it arouses.

```checkpoint
q: Why, according to Pappas, is "an imitation of an imitation" a misleading summary of Plato's view in Republic X?
a*: Because Book X never calls the carpenter's bed an imitation, so Plato calls the painting an imitation of appearance.
a: Because Plato thought paintings were more truthful than beds.
x: Plato ranked the painter third from the truth, below the carpenter, so paintings are less truthful.
a: Because Plato's critique in Book X was aimed only at music, not painting.
x: Book X takes painting as its model and applies the comparison to poetry.
a: Because the phrase comes from Aristotle's Poetics.
x: The phrase is a popular summary, not Aristotle's; the point is that it is not Plato's own wording.
hint: Ask what the carpenter looks towards when he makes a bed.
why: The carpenter makes a bed by looking towards the Form, and Plato does not call that imitation. The painter copies how the bed appears from one viewpoint, so the imitator is "third from the king and the truth" and makes an imitation of appearance.
---
q: How does Collingwood distinguish expressing an emotion from arousing one?
a: Arousing is done by artists, expressing by audiences.
x: Both are things a maker might do; Collingwood's contrast is between craft and art, not artist and audience.
a: Expressing requires the audience to feel the same emotion as the artist.
x: That is Tolstoy's requirement; Collingwood did not require the audience to feel anything.
a*: Arousing is a craft with a planned effect and chosen means; expressing is becoming conscious of an emotion one could not name in advance.
a: Arousing an emotion clarifies it, while expressing it purges it.
x: Collingwood said the "lightening" of expression is clarity, and denied that it is catharsis.
hint: Remember the person who says "I don't know what I feel".
why: For Collingwood, arousal fits the craft pattern of means and preconceived ends. Expression cannot be planned, because one discovers what the emotion is only in expressing it; that is why art proper is not a craft.
```

## Can Art Be Defined? Weitz's Open Concept

By the 1950s some philosophers thought the search misconceived. Wittgenstein's *Philosophical Investigations* (1953) argued that games share no common feature, only overlapping **family resemblances** (see *Wittgenstein*). Margaret MacDonald, his student, first applied this to art in 1952: artworks are like "a family having different branches rather than … a class united by common properties". Morris Weitz's "The Role of Theory in Aesthetics" (1956) made the case famous, concluding that art, "as the logic of the concept shows, has no set of necessary and sufficient properties, hence a theory of it is logically impossible and not merely factually difficult."

Drawing on Adajian's SEP reconstruction and the IEP's, Weitz's **open concept argument** runs like this:

1. A concept is **open** if we can imagine a case that would call for a decision either to extend the concept to cover it or to close the concept and invent a new one.
2. Open concepts cannot be defined by necessary and sufficient conditions.
3. "Art" is open. Its sub-concepts show this: the concept "novel" has had to be stretched for works like *Finnegans Wake* or Annie Ernaux's *Les Années*, and "art" stretches with them.
4. So art cannot be defined.

Weitz added that a definition would also hinder creativity.

**Objection.** Dickie replied in 1969 that premise 3 does not follow from its evidence: a sub-concept can be open while the concept above it is closed. New species of dragonfly keep appearing, yet "insect" is closed; "game" may be open while "chess" is closed. The SEP adds that extending a concept can follow principles, and a definition could even build in a requirement of novelty.

**A second answer.** Maurice Mandelbaum (1965) complained that Weitz had never analysed the notion of family resemblance. Resemblances may rest on properties that cannot be seen in the object at all: **relational**, "non-exhibited" properties. So failing to find a common *visible* property in all artworks does not show that they share none. Besides, everything resembles everything in some respect: Noël Carroll observed that Duchamp's *In Advance of the Broken Arm* looks more like a shovel than like any artwork. Dickie later used Mandelbaum's idea to justify a relational definition of art.

**Weitz's side.** Scepticism survives in part. Lopes (2014) argues that debates focused on artworks end in stalemate over hard cases such as Duchamp's *Bottlerack* and Cage's *4′33″* (and proposes defining art through the individual arts instead), and some sceptics argue on political grounds: feminist philosophers such as Battersby and Carolyn Korsmeyer argued that the idea of genius excluded women and that domestic "crafts" were pushed to the margins (see *Feminist Philosophy*).

## A Urinal in New York

Mandelbaum's point fits an object made decades earlier. In April 1917 a porcelain urinal, turned ninety degrees and signed "R. Mutt 1917", was submitted to the first exhibition of the Society of Independent Artists in New York, which had no jury: anyone who paid six dollars could show. *Fountain* was not formally rejected but kept out of sight. "No, not rejected," Marcel Duchamp later said. "A work can't be rejected by the Independents. It was simply suppressed." Duchamp, a director of the Society, resigned from its board.

{{image: Fountain (Duchamp) | Stieglitz's 1917 photograph of *Fountain*, the only image of the original urinal, which was lost soon afterwards.}}

The magazine *The Blind Man* published Stieglitz's photograph with an editorial: "Whether Mr Mutt with his own hands made the fountain or not has no importance. He CHOSE it." The original was soon lost; every *Fountain* in a museum is a replica authorised between 1950 and 1964. Duchamp later said he had chosen "the object which has the least chance of being liked".

Who made it is contested. On 11 April 1917 Duchamp wrote to his sister that "one of my female friends under a masculine pseudonym, Richard Mutt, sent in a porcelain urinal as a sculpture". The case that the friend was the German Dada artist and poet Elsa von Freytag-Loringhoven was most fully argued by Irene Gammel (2002), and in 2023 Glyn Thompson and Julian Spalding added further arguments, including that the handwriting on the urinal is hers and that a 1917 Boston newspaper called "Richard Mutt" a Philadelphian (she lived in Philadelphia). Against it, Duchamp wrote "sent", not "made", and Tate notes there is "no documentary or testimonial evidence" that she created it; museums still credit Duchamp. The debate is unresolved. Either way, if *Fountain* is art, neither its form nor its maker's feelings explain why.

## Warhol, Danto and the Indiscernibles

In 1964 Warhol filled the Stable Gallery in New York like a stockroom with plywood boxes silkscreened to replicate grocery cartons, Brillo among them. The same year the philosopher Arthur Danto (1924–2013) published "The Artworld", which coined the word:

```quote
To see something as art requires something the eye cannot descry—an atmosphere of artistic theory, a knowledge of the history of art: an artworld.
Arthur Danto · "The Artworld", Journal of Philosophy · 1964
```

In *The Transfiguration of the Commonplace* (1981) Danto made a method of such cases: objects that look identical, some artworks and some mere things. The argument runs:

1. Warhol's *Brillo Box* is an artwork; the Brillo cartons in the supermarket stockroom are not.
2. The two are (more or less) perceptually indiscernible.
3. If two things are perceptually indiscernible, no perceptual property, nothing formal or visible, can explain why one is art and the other is not.
4. So what makes something art is not a perceptual property.
5. So it must be a relational property: an interpretation made possible by an artworld, a body of theory and the history of art.

Warhol's boxes are plywood, not cardboard, but the argument needs only that such indiscernibles are possible. Danto drew the same lesson about *Fountain*: it and an ordinary urinal "were aesthetically indiscernible". On one standard reconstruction of his view (Noël Carroll's), an artwork is about something, projects an attitude towards it, and needs an art-historical context.

**Objection.** James Shelley, in the SEP, argues that this defeats aesthetic theories only if "aesthetic" means "formal" or "perceptual". For the eighteenth century it did not: Kant ranked poetry highest for its "aesthetic ideas", and Hume required critics to put themselves in the place of a work's original audience. If grasping context can be part of aesthetic judgement, Danto has refuted formalism, not aesthetics.

**Reply.** Danto's defender can answer that "aesthetic" stretched so far no longer does the defining work; history and theory do. A different worry, from the IEP: Danto accepted that the painters of Lascaux were not making art, which seems to exclude most prehistoric and much non-Western art.

## The Institutional Theory

George Dickie (1926–2020) turned the artworld into a social institution. His 1969 definition: "A work of art in the descriptive sense is (1) an artifact (2) upon which some society or some sub-group of a society has conferred the status of candidate for appreciation", much as one is declared a candidate for alderman. In *The Art Circle* (1984) he replaced conferral with presentation: a work of art is "an artifact of a kind created to be presented to an artworld public", with artist, public and artworld defined in terms of one another. Dickie admitted the circle but denied it was vicious, since the artworld can be described historically and sociologically.

The theory covers bad art and readymades, and answers "my five-year-old could do that". But art outside any institution seems possible: Aloïse Corbaz and Judith Scott made art before any curator recognised it, and the Pirahã of the Amazon have sophisticated songs and no artworld. Peg Brand Weiser noted that the artworld's authorities were historically white men, so quilts would not have counted as art until the 1970s.

The best-known objection is **Wollheim's dilemma** (1980). Either members of the artworld have reasons for conferring art status or they do not. If they do, the reasons, not the conferral, make something art, and the institution is redundant. If not, conferral is arbitrary, and we need not take it seriously. Defenders such as Abell and Fokt have offered partial replies.

## History, Experience and Clusters

Levinson's **historical** definition (1979) drops the institution: an artwork is "a thing (item, object, entity) that has been seriously intended for regard-as-a-work-of-art, i.e., regard in any way preexisting artworks are or were correctly regarded" (his 1989 wording). But what made the first artworks art, with nothing before them? And Currie imagined Martian art with no historical tie to ours.

Beardsley's **aesthetic** definition (1982) runs the other way: an artwork is "an arrangement of conditions intended to be capable of affording an experience with marked aesthetic character" (or belongs to a type typically so intended). It fits art in every culture, but Beardsley had to deny that the readymades were art. The SEP sums up the stand-off: conventionalist definitions handle modern art and struggle with art's universality; aesthetic definitions do the reverse.

Gaut's **cluster account** (2000) lists ten properties, none necessary but some groups sufficient, among them aesthetic qualities, expressing emotion, intellectual challenge, originality, skill, belonging to an established art form and the intention to make art. Critics reply that such a list amounts to a long "either … or" definition, and that nothing decides what belongs on it. Stephen Davies (2015) accepts an openly **disjunctive** definition: something is art if it shows excellence of skill in realising significant aesthetic goals as its main function, or falls under a recognised art form in an art tradition, or is intended by its maker to be art. The first clause, he wrote, "does the important work of getting the art-ball rolling".

```checkpoint
q: What did Dickie object to in Weitz's open concept argument?
a: That Wittgenstein never discussed games.
x: Wittgenstein's game example is the source of the family-resemblance idea; Dickie did not dispute it.
a*: That a sub-concept such as "novel" being open does not show that "art" is open, just as new dragonflies leave "insect" closed.
a: That art does have a single visible property shared by all artworks.
x: Dickie's own theory is relational, not a claim that all artworks share a visible feature.
a: That definitions always hinder creativity.
x: That was Weitz's own additional claim in favour of not defining art.
hint: Compare "insect" and "dragonfly", or "game" and "chess".
why: Weitz inferred the openness of "art" from the openness of its sub-concepts. Dickie answered that a broader concept can be closed even when narrower ones keep changing, so the step from sub-concepts to "art" fails.
---
q: What does Wollheim's dilemma say about the institutional theory?
a: That it is circular, because "artworld" and "art" are defined in terms of each other.
x: Dickie himself admitted that circle; Wollheim's dilemma concerns the reasons behind conferral.
a: That it excludes cave paintings made before any artworld.
x: That is a separate objection about art outside institutions.
a: That the artworld has historically been run by white men.
x: That is Peg Brand Weiser's feminist objection, not Wollheim's.
a*: That if the artworld has reasons for conferring art status, the reasons do the work; if it has none, conferral is arbitrary.
hint: Ask whether the people conferring the status have reasons or not.
why: With reasons, those reasons make something art and the institution is redundant; without reasons, conferral is arbitrary and deserves no respect. Either way the institution itself seems not to be what makes art art.
```

## Is "Art" a European Invention?

A different scepticism asks whether the concept itself is local. In 1951–52 Paul Oskar Kristeller argued that the "modern system" of five major arts (painting, sculpture, architecture, poetry, music) "did not assume definite shape before the eighteenth century". Greek *tekhnê* and Latin *ars* covered carpentry too, and the Hindu notion of *kalā* covers sixty-four practices, not all of which we would call artistic. In Japan the word *bijutsu*, "fine art", was coined around 1872–73 for Japan's part in the 1873 Vienna World Exposition. Larry Shiner's *The Invention of Art* argues that fine art in the modern sense is an eighteenth-century invention. (*Aesthetics across Traditions* takes up Indian, Chinese and Japanese aesthetics in their own terms.)

This is debated too. James Porter (2009) argued that the concept of art did not first appear with Kristeller's eighteenth-century "system"; Shiner replied that Porter misreads Kristeller. The IEP adds that lacking a word for "art" is not lacking the concept. Denis Dutton (2006) proposed twelve cross-cultural criteria for recognising art, from direct pleasure, skill and style to emotional saturation and imaginative experience, modelled on a diagnostic manual's symptoms, none necessary; critics ask what unifies the list.

Kendall Walton doubted that "What is art?" expresses "anything like a single question". Imitation, expression and form fail as definitions but each names something much art does; the relational theories explain *Fountain* and struggle with Lascaux. *Interpretation and Meaning in Art* asks the next question: what does a work mean?

## Further exploration

- **Noël Carroll, *Philosophy of Art: A Contemporary Introduction* (1999).** A standard textbook on representation, expression, form and the definition of art.
- **Arthur C. Danto, *What Art Is* (2013).** Danto's late, short statement of his theory of art as embodied meaning.
- **Stephen Davies, *The Artful Species: Aesthetics, Art, and Evolution* (2012).** A careful, sceptical assessment of evolutionary claims about art across cultures.
- **Carolyn Korsmeyer, *Gender and Aesthetics: An Introduction* (2004).** How gender has shaped the concepts of art, genius and taste.
- **Paul C. Taylor, *Black Is Beautiful: A Philosophy of Black Aesthetics* (2016).** A philosophy of Black aesthetics that rethinks what art and its concepts include.$whatisart_master$,
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
  select $whatisart_quiz$[
    {"type": "mcq", "prompt": "According to Pappas, how does Plato describe what a painter of a bed produces in Republic X?", "options": ["An imitation of the Form of the bed, made with knowledge", "An imitation of appearance, by someone \"third from the king and the truth\"", "A copy that is as true as the carpenter's bed", "A craft object made by looking towards the Form"], "answerIndex": 1, "explanation": "The carpenter makes a bed by looking towards the Form; the painter copies only how the bed appears from one viewpoint. Book X never calls the carpenter's bed an imitation, so the painting is an 'imitation of appearance', not, in Plato's words, an 'imitation of an imitation'.", "id": "q1"},
    {"type": "mcq", "prompt": "Which requirement makes Tolstoy's expression theory a 'particularly strong' version, in the IEP's description?", "options": ["The audience must come to feel what the artist felt, or there is no art", "The work must have significant form", "The work must be presented to an artworld public", "The artist must plan the emotional effect in advance"], "answerIndex": 0, "explanation": "Tolstoy required both that the artist feels and that the feeling 'infects' the audience: 'until the audience feels what the artist feels, there is no art'. Collingwood, by contrast, did not require the audience to feel anything.", "id": "q2"},
    {"type": "mcq", "prompt": "Dickie objected to Weitz's open concept argument by pointing out that:", "options": ["Wittgenstein's games do share a common visible feature", "Defining art would encourage artistic creativity", "Every artwork has significant form", "A sub-concept such as 'novel' can be open while the broader concept above it is closed, as 'insect' stays closed though new dragonflies appear"], "answerIndex": 3, "explanation": "Weitz inferred that 'art' is open from the openness of its sub-concepts. Dickie (1969) answered that this step fails: 'game' may be open while 'chess' is closed, and 'insect' is closed even as new species are found.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Wollheim's dilemma claim about the institutional theory of art?", "options": ["That it wrongly excludes readymades such as Fountain", "That it cannot explain why Brillo Box and the supermarket cartons look alike", "That it is either redundant, if the artworld has reasons for conferring art status, or arbitrary, if it has none", "That only formal properties can make something art"], "answerIndex": 2, "explanation": "If artworld members have reasons, those reasons and not the conferral make something art, so the institution is redundant; if they have none, conferral is arbitrary and need not be taken seriously.", "id": "q4"},
    {"type": "open", "prompt": "Set out Danto's argument from indiscernibles (Warhol's Brillo Box and the supermarket cartons) and explain James Shelley's objection to the conclusion that the argument refutes aesthetic theories of art.", "rubric": "A strong answer states the premises: Brillo Box is art and the cartons are not; they are (more or less) perceptually indiscernible; so no perceptual or formal property explains the difference; so what makes something art is a relational property, such as an interpretation made possible by an artworld and art history. It then gives Shelley's objection: this defeats aesthetic theories only if 'aesthetic' means 'formal' or 'perceptual'; on eighteenth-century views such as Kant's (poetry's 'aesthetic ideas') or Hume's (critics placing themselves in the original audience's situation), context can be part of aesthetic judgement, so the argument refutes formalism, not aesthetics. Credit for noting the possible reply that 'aesthetic' stretched so far no longer does the defining work, or the IEP worry about Lascaux.", "id": "q5"},
    {"type": "open", "prompt": "Is 'art' a modern European category? Explain Kristeller's thesis and give evidence and arguments on both sides of the debate.", "rubric": "A strong answer explains Kristeller's claim (1951–52) that the 'modern system' of five major arts did not take definite shape before the eighteenth century, with supporting evidence such as Greek tekhnê and Latin ars covering trades like carpentry, the Hindu kalā covering sixty-four practices, Batteux's 'fine arts', the coining of the Japanese bijutsu around 1872–73 for the Vienna World Exposition, and Shiner's view that fine art in the modern sense is an eighteenth-century invention. It then gives the other side: Porter's argument that the concept of art did not first appear with the eighteenth-century system, the IEP's point that lacking a word is not lacking the concept, and Dutton's cross-cultural criteria (or SEP's observation that aesthetically marked artefacts exist in virtually every culture). Credit for presenting it as a live debate rather than settled.", "id": "q6"}
  ]$whatisart_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/aesthetics/what-is-art', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
