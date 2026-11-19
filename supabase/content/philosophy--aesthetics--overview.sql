-- Art and Beauty (Aesthetics) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/aesthetics @ research/advanced/read.
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
    'philosophy/aesthetics',
    'research',
    'advanced',
    'read',
    $aesov_master$> **Aesthetics, on this overview's gloss, asks what art is, what beauty is, how a judgement of taste can be right or wrong, and how artworks mean.** This overview shows how the section's four chapters fit together: the attempt to define art; beauty and the judgement of taste; interpretation, meaning and the moral standing of artworks; and aesthetic theory in India, China, Japan, the Islamic world and among the Yoruba. It then follows five questions through them: whether "art" and "aesthetics" are European categories; how art relates to what it shows; why painful emotions please in art; who has the authority to say what art is, what it means and whether it is good; and what art has to do with how we live.

## What Aesthetics Asks

Is Cattelan's *Comedian*, "a banana taped to a wall", art? *What Is Art?* opens with puzzles like this one from the Internet Encyclopedia of Philosophy (IEP). *Beauty and Taste* opens with a different question: when you call a sunset beautiful, are you reporting a fact about the sunset or a feeling of your own, and could you be wrong? *Interpretation and Meaning in Art* asks whether a poem means what its author meant, what its words allow, or whatever its readers make of it. And *Aesthetics across Traditions* asks why audiences enjoy a tragedy that makes them weep, a puzzle that the Indian theory of *rasa* faces in sharper form than European philosophy does.

Two distinctions frame the section. The first, in *What Is Art?*, is George Dickie's distinction between the **descriptive** and the **evaluative** senses of the word "art". As the IEP illustrates, "archaeologists found tools, clothes and artworks" describes; "your couscous is a real artwork!" praises. A definition aims at the descriptive sense, so it must include bad art. The second, in *Beauty and Taste*, is the contrast between beauty as **subjective**, a matter of how things strike each of us, and beauty as **objective**, a feature of things themselves. Crispin Sartwell, in the Stanford Encyclopedia of Philosophy (SEP), calls this "the most familiar basic issue in the theory of beauty", and adds: "A pure version of either of these positions seems implausible."

## Defining Art: Imitation, Expression, Form and the Artworld

*What Is Art?* follows three classic answers to what all art has in common. In analytic philosophy a **definition** usually means **necessary and sufficient conditions**: features that every artwork has, and that together guarantee that something is art.

The oldest answer is **imitation**, the Greek *mimêsis*. Plato's *Republic* attacks poetry twice: in Book III as impersonation, which breeds the traits imitated, and in Book X as copy-making. A carpenter makes a bed by looking towards the Form of the bed; a painter paints only its appearance from one point of view, and so is "third from the king and the truth". Aristotle's *Poetics* traces poetry instead to the human instinct for mimesis and our pleasure in its products.

The second answer is **expression**. Tolstoy defined art as the activity of evoking a feeling one has once experienced and transmitting it "that others may experience the same feeling" (in Aylmer Maude's translation, as quoted in the IEP). R. G. Collingwood separated **art proper** from crafts that arouse a planned effect: to express an emotion is to become conscious of what it is, so it cannot be planned. The third answer is **form**: Clive Bell's **significant form**, Roger Fry's argument that our response to art comes from line, mass, colour and design, and Eduard Hanslick's case that music cannot represent a specific feeling. The chapter tests each against counter-examples, and each, it finds, is neither necessary nor sufficient for art, though each names something much art does.

By the 1950s some philosophers thought the search misconceived. Building on Wittgenstein's **family resemblances**, Morris Weitz argued in 1956 that "art" is an **open concept** and so cannot be defined. Dickie replied that a sub-concept such as "novel" can be open while the concept above it is closed, as new species of dragonfly leave "insect" closed. Maurice Mandelbaum added that artworks may share relational, "non-exhibited" properties that cannot be seen in the object at all.

Mandelbaum's point fits *Fountain*, a porcelain urinal signed "R. Mutt 1917" and submitted in April 1917 to the Society of Independent Artists in New York, which kept it out of sight. Whether Duchamp or the Dada artist Elsa von Freytag-Loringhoven made it is, the chapter finds, unresolved. In 1964, the year Warhol showed boxes replicating grocery cartons, Brillo among them, Arthur Danto published the essay that coined a word:

```quote
To see something as art requires something the eye cannot descry—an atmosphere of artistic theory, a knowledge of the history of art: an artworld.
Arthur Danto · "The Artworld", Journal of Philosophy · 1964
```

Danto's argument from **indiscernibles**, which the chapter sets out step by step, runs: Warhol's *Brillo Box* is an artwork and the cartons in the supermarket stockroom are not; the two are (more or less) perceptually indiscernible; so no perceptual property can explain why one is art and the other is not; so what makes something art must be a relational property, an interpretation made possible by an artworld. James Shelley, in the SEP, objects that this defeats aesthetic theories only if "aesthetic" means "formal" or "perceptual"; Danto's defender can answer that "aesthetic" stretched so far no longer does the defining work.

Dickie then turned the artworld into a social institution: in his 1969 definition, an artwork is an artefact on which a society or sub-group has conferred "the status of candidate for appreciation". The **institutional theory** covers bad art and readymades. But art outside any institution seems possible: Aloïse Corbaz and Judith Scott made art before any curator recognised it. Peg Brand Weiser noted that the artworld's authorities were historically white men, so quilts would not have counted as art until the 1970s. And **Wollheim's dilemma** asks whether the artworld has reasons for conferring art status: if it does, the reasons, not the conferral, make something art; if it does not, conferral is arbitrary. Defenders such as Abell and Fokt have offered partial replies. Historical, aesthetic and cluster definitions follow, and the chapter ends by asking whether "art" is a modern European category.

## Beauty and the Judgement of Taste

*Beauty and Taste* follows its question from the ancient theory of beauty as proportion to the eighteenth-century idea of taste as an inner sense. The SEP's **classical conception** makes beauty "an arrangement of integral parts into a coherent whole, according to proportion, harmony, symmetry, and similar notions"; Władysław Tatarkiewicz named it the Great Theory of beauty. In the eighteenth century British writers made pleasure "not the effect but the origin of beauty": Francis Hutcheson's internal **sense of beauty** responds to **uniformity amidst variety**, and Edmund Burke demolished the proportion theory with counter-examples.

David Hume's "Of the Standard of Taste" (1757) starts from sentiment, yet holds that some judgements of taste are absurd: to rank Ogilby with Milton is like maintaining "a mole-hill to be as high as Teneriffe". The standard he proposes is the verdict of rare judges:

```quote
Strong sense, united to delicate sentiment, improved by practice, perfected by comparison, and cleared of all prejudice, can alone entitle critics to this valuable character; and the joint verdict of such, wherever they are to be found, is the true standard of taste and beauty.
David Hume · "Of the Standard of Taste" · 1757
```

The classic objection is circularity: we recognise true critics by their approving the best works, and the best works are those that true critics approve. The reply is that the qualities can be identified without reference to any particular verdict. Hume's story of Sancho Panza's kinsmen and the key in the wine cask shows that delicacy can be checked. Many later commentators, Gracyk reports, follow Peter Kivy in thinking the real difficulty is a **regress**, since judging whether a critic's responses are delicate enough raises new evaluative questions.

Kant's *Critique of the Power of Judgment* (1790) asked how a judgement resting wholly on feeling can demand everyone's agreement. Pleasure in beauty is **disinterested**, neither depending on nor producing a desire for the object, and someone who calls a thing beautiful "judges not merely for himself, but for everyone" (in the Cambridge translation by Paul Guyer and Eric Matthews, as the SEP gives it). The chapter sets out his **deduction of taste**, as Hannah Ginsborg reconstructs it, with the objections and replies, and his resolution of the **antinomy of taste**. Nick Zangwill suggests separating "Kant's problem from his solution": how a feeling-based judgement can claim correctness, "the Big Question in aesthetics", remains even if the solution fails.

The chapter then turns to the **sublime**, from "Longinus" to Burke and Kant; to Nietzsche's attack on the spectator's standpoint; and to Pierre Bourdieu's argument, in *Distinction*, that the disinterested gaze prized by the dominant classes is a class disposition, imposed as legitimate taste. It ends with current debates. Realists such as Zangwill hold that the feeling of beauty can be "more or less veridical"; Alexander Nehamas holds that aesthetic judgement "never commands universal agreement"; and from Wollstonecraft and Grimké to Marcus Garvey and Paul C. Taylor, critics have asked whose standards of beauty prevail.

## Meaning, Interpretation and Morality

*Interpretation and Meaning in Art* follows the quarrel over the author's intention. W. K. Wimsatt and Monroe C. Beardsley's "The Intentional Fallacy" (1946), which the IEP calls "the first thorough presentation of anti-intentionalism", held that the poem "belongs to the public". The IEP reconstructs their argument as a dilemma: if the artist's intention is realised in the work, appeal to external evidence of it is unnecessary; if it is not, such evidence is insufficient, because convention alone fixes what the work means. E. D. Hirsch replied that convention often cannot pick out a single meaning, and that irony, as in Defoe's *The Shortest Way with the Dissenters*, seems to depend on what the author intended. Between the poles stand **moderate intentionalism** (Noël Carroll, Robert Stecker, Paisley Livingston), a form of actual intentionalism on which a successful intention fixes meaning, and **hypothetical intentionalism** (William Tolhurst, Jerrold Levinson), on which a work means what an appropriate audience would best hypothesise its author intended. In the IEP's judgement, "actual intentionalism remains the most popular position among all".

Roland Barthes attacked intention from another side. To give a text an Author, he wrote in "The Death of the Author", "is to impose a limit on that text"; and, in Stephen Heath's translation, "the birth of the reader must be at the cost of the death of the Author". The chapter marks the contrast: Wimsatt and Beardsley had detached the poem from its author to make readings more authoritative, answerable to the public text, whereas Barthes freed the reader. It also meets the Kashmiri critic Ānandavardhana's theory of **suggestion** (*dhvani*), a third power of language beyond literal and secondary meaning.

The chapter's second half turns to sad music, depiction, emotions for fictions, tragedy and imaginative resistance, and ends with art and morality. Carroll's **moderate moralism** holds that "sometimes the moral defects and/or merits of a work may figure in the aesthetic evaluation of the work"; Berys Gaut's **ethicism**, set out step by step as his merited-response argument, holds that a work manifesting ethically reprehensible attitudes is "to that extent aesthetically defective"; **immoralists** hold that moral flaws can sometimes be artistic merits. Mary Devereaux's analysis of Leni Riefenstahl's *Triumph of the Will* (1935) is the test case: a morally sensitive viewer can admire its innovative camera work but cannot fully engage with its central vision, the glorification of Hitler.

```checkpoint
q: What does Danto's argument from indiscernibles, as What Is Art? sets it out, conclude?
a*: That what makes something art is not a perceptual property but a relational one, an interpretation made possible by an artworld.
a: That Warhol's Brillo Box is not really art, because it looks like a supermarket carton.
x: The first premise is that Brillo Box is an artwork; the puzzle is why it is art when the cartons are not.
a: That art is whatever expresses its maker's feeling to an audience.
x: That is Tolstoy's expression theory; the chapter notes that if Fountain is art, neither its form nor its maker's feelings explain why.
a: That only formal properties such as line and colour make something art.
x: That is formalism, which the argument is meant to refute: if two things look the same, no visible feature can separate them.
hint: If a work and a mere thing look the same, where must the difference lie?
why: Danto's premises are that Brillo Box is art, the cartons are not, and the two are more or less perceptually indiscernible. So the difference cannot be anything seen; it must lie in a relation to a body of theory and the history of art. Shelley objects that, if grasping context can be part of aesthetic judgement, this refutes formalism rather than aesthetics.
---
q: How does the IEP reconstruct Wimsatt and Beardsley's argument against appealing to the author's intention?
a: As the claim that authors never have intentions when they write.
x: The argument grants that authors have intentions; it asks what evidence of them can add.
a: As the claim that a text means whatever its reader decides.
x: That is closer to Barthes; Wimsatt and Beardsley made public conventions, not readers, the standard.
a*: As a dilemma: if the intention is realised in the work, external evidence is unnecessary; if not, it is insufficient, because convention alone fixes meaning.
a: As the claim that meaning is what an ideal audience would hypothesise the author intended.
x: That is Levinson's hypothetical intentionalism, a later position in the debate.
hint: Consider the two cases: the intention shows in the work, or it does not.
why: Either way, on this argument, appeal to external evidence of intention adds nothing that settles meaning. Hirsch's cases of ambiguity and of Defoe's irony challenge exactly this, and Beardsley replied by appeal to coherence and to the possibility of being understood.
```

## Aesthetics beyond Europe

*Aesthetics across Traditions* treats aesthetic theory beyond Europe as a set of arguments. It begins with the Sanskrit *Nāṭyaśāstra*, attributed to the sage Bharata, whose first complete version most scholars put between 200 BCE and 200 CE. Its theory of *rasa*, a word that literally means "juice, essence or taste", names the distinctive emotional flavour a work offers its audience. The commentators disputed how rasa arises, and the chapter cautions that the earlier ones are known mainly through Abhinavagupta, who quotes them in order to criticise them.

The first Chinese theoretical texts on painting and calligraphy, from the second to fourth centuries CE, return to one theme: a work must be alive. Xie He's **Six Laws** begin with *qiyun shengdong*, often rendered "spirit resonance", though every period has read the laws its own way and scholars have offered competing translations.

In Japan the chapter follows **yūgen**, "mysterious grace" or profundity, which the Nō actor and playwright Zeami called "the highest principle"; **wabi**, a "subdued, austere beauty", first praised in poetry and developed most fully in tea and Zen, whose great practitioner was Sen no Rikyū; and **sabi**, "rustic patina". It then gives the modern history of "wabi-sabi". Leonard Koren popularised the phrase in the West in 1994, but conceded in 2015 that, though both words are ancient, they had been used together as a set phrase only very recently; Paul Atkins argues that the compound is "of recent, not ancient, vintage". The two ideals share an outlook, the chapter allows, but the history tells against presenting wabi-sabi as a timeless Japanese essence.

{{image: Sen no Rikyū | Sen no Rikyū (1522–1591), the tea master whose crawl-in tea-room entrance made samurai leave their swords outside, so that all guests entered alike.}}

On Islamic aesthetics the chapter rejects both simple claims, that Islam bans images and that there was never any restriction. The Qur'ān condemns idolatry but does not prohibit representing living beings; prohibitions occur in the hadith, which from the ninth century Sunni scholars increasingly read as categorical, while Shia and Sufi traditions were less stringent, and practice varied by period, place and school. Mosques and copies of the Qur'ān are consistently without figures, yet secular figural art "historically flourished in nearly all Islamic cultures". Calligraphy holds the place of honour, and what geometric ornament means is disputed.

The chapter ends with Yoruba ideas of beauty and character, and with the ethnophilosophy problem: whose theory is being reported, the people's or the researcher's? The art historian Robert Farris Thompson reportedly asked Yoruba critics to judge sculptures and recorded nineteen criteria; scholars such as Rowland Abiodun have treated the saying "character is beauty" as central to Yoruba aesthetics. Since the evidence is still being sifted, the chapter advises, these ideas are best read as proposals rather than a settled system.

## Questions That Run Through the Section

### Are "art" and "aesthetics" European categories?

Two chapters ask whether the section's own concepts are local. In *What Is Art?*, Paul Oskar Kristeller argued in 1951–52 that the "modern system" of five major arts "did not assume definite shape before the eighteenth century". Greek *tekhnê* and Latin *ars* covered carpentry too, and in Japan the word *bijutsu*, "fine art", was coined around 1872–73 for Japan's part in the 1873 Vienna World Exposition. Larry Shiner argues that fine art in the modern sense is an eighteenth-century invention. James Porter argued that the concept of art did not first appear with Kristeller's eighteenth-century "system", and Shiner replied that Porter misreads Kristeller.

On this overview's reading, the two chapters meet the worry with the same move from opposite sides, though *What Is Art?* leaves the debate open. *What Is Art?* reports the IEP's point that lacking a word for "art" is not lacking the concept. *Aesthetics across Traditions* opens with Yolaine Escande's version of the same move for China: although there is no word such as "aesthetics" in Chinese philosophy, "if we understand it not in the restrictive sense of the science of beauty but in the broader sense of reflection on the theory of art, then aesthetics does indeed exist in Chinese philosophy." *Aesthetics across Traditions* also stresses that the questions differ. In China, Escande observes, "only artists may theorize", and the focus falls on the creative process; in Japan, the SEP entry on Japanese aesthetics notes, the arts are "ways", such as *chadō*, the way of tea.

 The Yoruba case raises a related worry, the one *African Philosophy: the Ethnophilosophy Debate and Beyond* discusses: whether criteria gathered from informants report the people's own theory or the researcher's. None of the chapters concludes from these cautions that there is nothing to compare. *Aesthetics across Traditions* ends by finding "no single universal aesthetics" but shared problems met with different arguments.

### How does art relate to what it shows?

Imitation is the oldest answer in the section, and Plato's painter, in *What Is Art?*, copies only appearance. *Aesthetics across Traditions* calls Chinese painting theory "a real rival to the Greek theory of art as imitation". Sikong Tu held that "the resemblance is obtained by leaving the form behind", distinguishing formal likeness (*xingsi*) from spiritual likeness (*shensi*); and Shen Zongqian, in a treatise of 1781, held that paintings arise from "animated breaths" as heaven and earth create living things, so that painting is not imitation of nature but analogous to nature's own creating. Jing Hao distinguished formal resemblance, which obtains the apparent form but leaves out its breath (*qi*), from truth, which renders breath as well as substance; truth, Escande comments, "goes beyond resemblance" but "does encompass it".

Western aesthetics has its own critics of resemblance, which this overview sets beside the Chinese ones; the chapters do not compare them. In *Interpretation and Meaning in Art*, Goodman argued that "resemblance in any degree is no sufficient condition for representation", since resemblance is symmetric and representation is not, though Christopher Peacocke and Robert Hopkins have since revived resemblance as experienced resemblance in shape. On this overview's reading, the Chinese theorists and Goodman agree that outward likeness is not enough, but they answer different questions: the Chinese theorists asked what makes a painting true to its subject, Goodman how a picture represents at all.

### Why do painful emotions please?

On this overview's reading, a problem that runs, in some form, through all four chapters is why painful feeling can please, in art and, with Burke's sublime, beyond it. In *What Is Art?*, Aristotle asks why we enjoy pictures of things we dislike seeing, and answers that seeing a likeness is pleasurable because in contemplating it we come to understand; his *katharsis* of pity and fear, which he never explains, has been read as purgation, as "clarification" (Martha Nussbaum) and as simple release of feeling. In *Beauty and Taste*, Burke's sublime excites astonishment when pain or danger threatens from a relatively safe distance, and its pleasure is "delight", which Burke calls a "relative pleasure" that comes when pain or danger is removed or held off.

*Interpretation and Meaning in Art* gives Hume's statement of the puzzle in "Of Tragedy" (1757): "It seems an unaccountable pleasure, which the spectators of a well-written tragedy receive from sorrow, terror, anxiety, and other passions, that are in themselves disagreeable and uneasy." Hume's answer was **conversion**: eloquence and artistry convert the melancholy passions into pleasure. Jonathan Gilmore's SEP entry objects that there are not two stages, since we only ever respond to content as represented. The same chapter's paradox of fiction is a close relative: Colin Radford concluded that weeping for Anna Karenina is irrational, and Walton replied that what we feel for fictions is **quasi-emotion** within a game of make-believe. Thought theorists such as Lamarque and Carroll deny instead that emotion requires belief, a solution the SEP's Fiction entry calls "possibly the most widely accepted of all".

*Aesthetics across Traditions* shows rasa theory facing the puzzle in sharper form, because pathos, terror and disgust are themselves rasas, and a rasa is something relished. Abhinavagupta's answer, set out step by step, is that poetry presents the causes and effects of emotion in universal form, so that the spectator "transcends the limitations of one's limited self"; what is relished is a transformed, non-worldly state, pleasurable even when its material is sorrow. The chapter applies Gilmore's worry to him, marking this as its own step: such a theory "doesn't explain how we can take pleasure in a displeasing emotion, it just implicitly denies that we experience the displeasing emotion in question". The reply on his behalf is that grief can persist inside an overall relish, which places him near what Gilmore calls conversionary accounts, Hume's among them.

On this overview's reading, the answers fall into five families: pleasure in learning or understanding (Aristotle, on the cognitivist reading); distance from the danger (Burke); conversion or transformation of the painful feeling (Hume, Abhinavagupta); denial that the painful feeling is fully real or fully negative (Walton's quasi-emotions, offered for the paradox of fiction, and his suggestion that sadness is not itself negative); and pleasure in our own response (Feagin's meta-response). Whether the sorrow survives the conversion is, as *Aesthetics across Traditions* puts it of Abhinavagupta's case, the point both sides still dispute.

### Who decides what art is, what it means and whether it is good?

On this overview's reading, the section keeps asking where authority lies: over what counts as art, over whether a judgement of beauty is correct, and over what a work means.

For Dickie, art status depends on an artworld; for Hume, the standard of taste is the joint verdict of qualified judges. On this overview's reading, the two theories meet parallel objections. Dickie admitted that artist, public and artworld are defined in terms of one another, but denied that the circle is vicious; Hume's critics charge that true critics and the best works are defined in terms of each other, and his defenders reply that the judges' qualities can be identified independently. On this reading, critics in the section also ask who has belonged to the authoritative group, though most of them target the artworld or Kant rather than Hume's judges. Weiser pointed out that the artworld's authorities were historically white men. Bourdieu argued that Kant's disinterested judge is not a universal human but a class-trained one. Nehamas holds that beauty "creates smaller societies, no less important or serious because they are partial."

Over meaning, the candidates are the author, the public conventions of the work, and the reader. *Interpretation and Meaning in Art* notes that evidence of intention is either external (interviews, diaries, letters) or internal (the work itself, which intentionalists regard as the best evidence, and the only evidence for anonymous works). On this overview's reading, the dispute in *Aesthetics across Traditions* over Islamic ornament is in part an intention debate: what is in dispute is whether any evidence of the makers' intentions survives. Keith Critchlow and others argue that geometric patterns lead "the viewer to an understanding of the underlying reality, rather than being mere decoration"; art historians reply that claims about the arabesque's theological meaning are "without support from written historical sources", since the medieval Islamic world left no record of its makers' intentions.

### What does art have to do with how we live?

The debate in *Interpretation and Meaning in Art* is chiefly about evaluation: whether a work's moral flaws are also aesthetic flaws, with radical autonomism ("art for art's sake") and Tolstoy's radical moralism at the extremes. *Interpretation and Meaning in Art* sets Plato's censorship beside Tolstoy at that extreme; but the worry *What Is Art?* reports from Book III is, on this overview's reading, of a different kind: that performing base characters breeds the traits imitated.

On this overview's reading, several of the traditions in *Aesthetics across Traditions* share Plato's question, what art does to those who make and enjoy it, more than the modern question of whether moral flaws lower aesthetic value. The chapter itself observes that Rikyū's tea room and Xunzi's music both treat art as shaping how people live together. For Xunzi, "When music is centered and balanced, the people are harmonious and not dissipated". Rikyū's crawl-in entrance, part of a recasting of wabi that Dennis Hirota describes as "non-hierarchical awareness of the real", leads the chapter to say that the aesthetic "carries an argument about equality". The Yoruba saying "character is beauty", as scholars such as Abiodun read it, makes the connection run the other way: outward beauty without good character is hollow. *Beauty and Taste* adds a modern Western voice: Elaine Scarry argued that the links between justice and aesthetic ideas such as balance, symmetry and "fairness" are "more than analogies".

```checkpoint
q: What is the objection, adapted in Aesthetics across Traditions from Jonathan Gilmore's SEP entry, to Abhinavagupta's account of why sorrow in drama pleases?
a: That the Nāṭyaśāstra lists only pleasant rasas.
x: Pathos, terror and disgust are among its eight rasas; that is what makes the puzzle sharper for rasa theory.
a*: That an account which transforms or distances the painful feeling does not explain pleasure in a displeasing emotion but denies that we feel one.
a: That Abhinavagupta copied his answer from Aristotle's catharsis.
x: Abhinavagupta did not compare rasa with catharsis; such comparisons are modern.
a: That universalisation makes drama impossible to understand.
x: The objection concerns pain and pleasure, not understanding.
hint: If rasa is wholly pleasurable, is the spectator still sad?
why: Gilmore does not discuss Abhinavagupta; applying the worry to him is the chapter's own step. The reply on his behalf is that grief can persist inside an overall relish, close to the conversionary accounts, Hume's among them, on which painful passions are converted into pleasure.
---
q: What do art historians reply to the claim that Islamic geometric patterns and arabesques lead the viewer to an understanding of an underlying reality?
a: That Islamic patterns were invented only in the twentieth century.
x: The chapter dates the arabesque probably to Baghdad around the tenth century, and girih designs appear in the Jameh Mosque of Isfahan (1086).
a: That the Qur'ān explicitly forbids all ornament.
x: The chapter says the Qur'ān condemns idolatry but does not prohibit representing living beings; it reports no ban on ornament.
a: That the patterns are copies of Chinese painting.
x: Nothing in the chapter connects Islamic ornament with Chinese painting.
a*: That such theological claims are without support from written historical sources, since the medieval Islamic world left no record of its makers' intentions.
hint: What kind of evidence would show what the makers meant?
why: Keith Critchlow and others read the patterns as more than decoration; art historians answer that the documents needed to show what the makers intended do not exist. The chapter presents both sides, and notes that Valérie Gonzalez's reconstruction of a classical Arabic theory of beauty has been criticised for a universalising method.
```

## The Chapters

- *What Is Art?*: imitation, expression, form, Weitz, *Fountain*, Danto, the institutional theory, later definitions, and whether "art" is a European invention.
- *Beauty and Taste*: proportion, taste as an inner sense, Hume, Kant, the sublime, Nietzsche and Bourdieu, realism, whose beauty, everyday aesthetics.
- *Interpretation and Meaning in Art*: the intentional fallacy, intentionalisms, the death of the author, *dhvani*, music, pictures, fiction, tragedy, art and morality.
- *Aesthetics across Traditions*: rasa, Abhinavagupta, Chinese painting and music, Japanese ideals and "wabi-sabi", Islamic aesthetics, Yoruba aesthetics.

The questions continue in *Plato*, *Aristotle*, *Kant*, *Berkeley and Hume*, *Structuralism and After: Foucault, Derrida and Their Critics*, *Feminist Philosophy* and *African Philosophy: the Ethnophilosophy Debate and Beyond*.

## Further exploration

- **Noël Carroll, *Philosophy of Art: A Contemporary Introduction* (1999).** A standard textbook on representation, expression, form and the definition of art.
- **Roger Scruton, *Beauty* (2009).** An accessible, broadly Kantian account of beauty.
- **Paisley Livingston, *Art and Intention: A Philosophical Study* (2005).** A defence of moderate intentionalism and the meshing condition, with a critique of hypothetical intentionalism.
- **Kendall L. Walton, *Mimesis as Make-Believe: On the Foundations of the Representational Arts* (1990).** The make-believe theory of fiction and pictures, and the home of quasi-emotions.
- **Sheldon Pollock (ed. and tr.), *A Rasa Reader: Classical Indian Aesthetics* (2016).** The rasa debates in translation, with analysis.
- **Yuriko Saito, *Everyday Aesthetics* (2007).** The aesthetics of daily life, drawing on Japanese as well as Western thought.
- **Paul C. Taylor, *Black Is Beautiful: A Philosophy of Black Aesthetics* (2016).** Race, beauty standards and Black aesthetic practice.$aesov_master$,
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
  select $aesov_quiz$[
    {"type": "mcq", "prompt": "What does Wollheim's dilemma, as What Is Art? presents it, claim about the institutional theory of art?", "options": ["That it wrongly excludes readymades such as Fountain", "That it cannot explain why Brillo Box and the supermarket cartons look alike", "That if the artworld has reasons for conferring art status, the reasons do the work, and if it has none, conferral is arbitrary", "That the artworld's authorities were historically white men"], "answerIndex": 2, "explanation": "With reasons, the reasons and not the conferral make something art, so the institution is redundant; without them, conferral is arbitrary. The point about the artworld's authorities being historically white men is Peg Brand Weiser's separate objection, and the institutional theory in fact covers readymades. Abell and Fokt have offered partial replies.", "id": "q1"},
    {"type": "mcq", "prompt": "Why do many later commentators, following Peter Kivy, speak of a regress rather than a circle in Hume's argument for a standard of taste, as Beauty and Taste reports?", "options": ["Because judging whether a critic's responses are delicate enough raises new evaluative questions, which seem to need further judges", "Because Hume defined true critics simply as those who approve Milton", "Because Hume denied that any judgement of taste can be wrong", "Because Kant showed that the standard depends on an indeterminate concept"], "answerIndex": 0, "explanation": "The qualities of the true judge can be identified without reference to particular verdicts, as delicacy is shown by Sancho Panza's kinsmen and the key in the cask, so there is no strict circle. But assessing those qualities calls for further acts of evaluation, and so, apparently, for further qualified assessors.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement best matches Aesthetics across Traditions on images in Islam?", "options": ["The Qur'ān explicitly bans all pictures of living beings, so figural art never existed in Islamic lands", "There were never any religious objections to images in Islam", "Only Shia scholars objected to images, while Sunni scholars permitted them", "The Qur'ān condemns idolatry but does not prohibit images; some hadith condemn image-makers; mosques and Qur'āns are without figures, yet secular figural art flourished"], "answerIndex": 3, "explanation": "The chapter rejects both simple claims. From the ninth century Sunni scholars increasingly read the hadith as categorical, while Shia and Sufi traditions were less stringent; secular figural art 'historically flourished in nearly all Islamic cultures', and the human figure is central to Persian, Ottoman and Mughal painting.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the main historical point about 'wabi-sabi' in Aesthetics across Traditions?", "options": ["That wabi and sabi are both twentieth-century words", "That the two ancient words were used together as a set phrase only very recently, and the compound is far more common outside Japan than in it", "That Sen no Rikyū first joined the two words in the Nampōroku", "That sabi comes from tea and wabi from poetry"], "answerIndex": 1, "explanation": "Leonard Koren conceded in 2015 that the two ancient words had only recently been used as a set phrase, and Paul Atkins argues the compound is 'of recent, not ancient, vintage'; sabi comes chiefly from poetry and wabi from tea. The history tells against presenting wabi-sabi as a timeless Japanese essence.", "id": "q4"},
    {"type": "open", "prompt": "Why do painful emotions please in art? Compare at least three answers drawn from different chapters of the section, including Hume's and Abhinavagupta's, and assess the objection from Jonathan Gilmore's SEP entry.", "rubric": "A strong answer states Hume's puzzle in 'Of Tragedy' and his conversion answer, with Gilmore's objection that there are not two stages, since we only ever respond to content as represented. It explains why rasa theory faces the puzzle in sharper form (pathos, terror and disgust are themselves rasas, and rasa is relished) and sets out Abhinavagupta's answer: poetry generalises its situations, the spectator's latent dispositions are manifested and the limited self transcended, so what is relished is a transformed, non-worldly state. It gives the worry the chapter adapts from Gilmore, that such a theory denies rather than explains pleasure in a displeasing emotion, and the reply that grief can persist inside an overall relish, near conversionary accounts like Hume's; it notes that applying the worry to Abhinavagupta is the chapter's own step and that comparisons with Aristotle's catharsis are modern. Credit for bringing in Aristotle's pleasure in likeness, Burke's 'delight' in danger held off, or Walton's quasi-emotions in the paradox of fiction, and for recognising that grouping these answers into families is the overview's own reading.", "id": "q5"},
    {"type": "open", "prompt": "Who has the authority to say what art is, what a work means and whether a judgement of taste is correct? Discuss the artworld, Hume's qualified judges and the debate over the author's intention, with at least one critic of each.", "rubric": "A strong answer explains Danto's artworld and Dickie's institutional theory (conferral of 'the status of candidate for appreciation'), with Wollheim's dilemma, art outside institutions (Corbaz, Judith Scott) and Peg Brand Weiser's point about white men. It explains Hume's standard as the joint verdict of judges with strong sense, delicacy, practice, comparison and freedom from prejudice, the circularity objection and reply, the regress (Kivy), and Levinson's 'real problem' or blameless variation. Credit for Bourdieu's argument that Kant's disinterested judge is class-trained as a related challenge to taste's authority. It sets out Wimsatt and Beardsley's anti-intentionalism and the IEP's dilemma, Hirsch's objections, moderate and hypothetical intentionalism, and Barthes's death of the author. Credit for using cross-cultural material, such as the art historians' point that no record survives of the intentions behind Islamic ornament, or the ethnophilosophy question in Yoruba aesthetics, and for recognising which parallels are the overview's own reading rather than the chapters' claims.", "id": "q6"}
  ]$aesov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/aesthetics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
