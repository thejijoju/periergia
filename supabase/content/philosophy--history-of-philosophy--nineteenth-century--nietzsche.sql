-- Nietzsche — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/nietzsche @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/nietzsche',
    'research',
    'advanced',
    'read',
    $nietzsche_master$> **Friedrich Nietzsche (1844–1900) turned philosophy's most searching questions on morality and truth themselves.** This chapter follows his life from a pastor's household to a chair at Basel, years of wandering and a collapse in Turin; explains the death of God, the argument of *On the Genealogy of Morality* with its objections and replies, perspectivism, the will to power, eternal recurrence and the *Übermensch*; and tells how his sister, his editors and the Nazis bent his work, how scholars recovered it, and how readers in France, South Asia, China and Japan made it their own.

## A Pastor's Son and a Prodigy

Friedrich Nietzsche was born on 15 October 1844 in Röcken, in Prussian Saxony. His father, a Lutheran pastor like both his grandfathers, died in 1849 of a brain ailment. The family moved to Naumburg, where the boy grew up among women: his mother, grandmother, two aunts and his sister Elisabeth (1846–1935), who would later shape his posthumous fame.

After the boarding school of Schulpforta (1858–64) he went to Bonn to study theology and classical philology, the scholarly study of ancient texts, but abandoned theology after one semester and lost his faith. In 1865 he followed the philologist Friedrich Wilhelm Ritschl to Leipzig. That year, aged 21, he found Arthur Schopenhauer's *The World as Will and Representation* by chance in a Leipzig bookshop (see *Schopenhauer and Kierkegaard*). In November 1868 he met Richard Wagner, who shared his enthusiasm for Schopenhauer.

On Ritschl's recommendation, Basel appointed him to its chair of classical philology, and he began teaching in May 1869 at the age of 24, without a completed doctorate; Leipzig then awarded him an honorary one. At Basel his friends included the theologian Franz Overbeck and the historian Jacob Burckhardt, and he lectured on the pre-Platonic philosophers (see *The Presocratics: from Myth to Argument*).

His first book, *The Birth of Tragedy* (1872), contrasted the Apollonian in Greek culture, standing for order, form and individuation, with the Dionysian, wild, instinctual and creative. Greek tragedy fused the two; since Socrates, European culture had become one-sidedly Apollonian, and Nietzsche hoped for a rebirth through Wagner's music. The young philologist Ulrich von Wilamowitz-Möllendorff replied that Nietzsche should "gather tigers and panthers about his knees, but not the youth of Germany" (in the SEP's English). Enrolments in his courses fell.

Wagner's first Bayreuth festival in 1876 repelled Nietzsche, and *Human, All Too Human* (1878), a turn to aphorisms and naturalistic "historical philosophy", effectively ended the friendship. Plagued by migraines, eye trouble and vomiting, he resigned his chair in June 1879, aged 34, with a pension.

## The Wanderer and the Collapse

For the next decade he moved with the seasons: summers mostly at Sils-Maria in the Upper Engadine, winters in Nice, Genoa, Rapallo or Turin. His former pupil Heinrich Köselitz ("Peter Gast") copied and proofread almost all his later work. In 1882 he met Lou Salomé, a Russian student of philosophy, and planned an intellectual commune with her and his friend Paul Rée; she refused his proposal of marriage, Elisabeth intrigued against the plan, and by November both had left him. In 1886 he broke with his publisher Ernst Schmeitzner over Schmeitzner's antisemitism and printed *Beyond Good and Evil* at his own expense.

On 3 January 1889 he broke down in a street in Turin. An often-repeated tale, first told after his death, says that he threw his arms round the neck of a horse being flogged and then collapsed; it is best treated as legend, resting on a third-hand newspaper report and later embellishment. He sent out "madness notes" signed "Dionysus" or "the Crucified One"; Overbeck brought him back to a Basel clinic, and after a spell in a clinic in Jena he lived from 1890 in his mother's care at Naumburg. After her death in 1897 Elisabeth moved him to the Villa Silberblick in Weimar, where he died on 25 August 1900 of pneumonia and a stroke. His illness was long attributed to syphilis. Many scholars now doubt that diagnosis: alternatives include a hereditary stroke disorder and dementias, and R. Lanier Anderson, in the Stanford Encyclopedia of Philosophy (SEP), judges that Huenemann (2013) "convincingly argued" for a slow-growing brain tumour, a retro-orbital meningioma. The cause remains contested.

## Works, Periods and Style

Salomé's book on him (1894) first proposed the division into periods most scholars still use (the IEP's dates): early (1869–76), with *The Birth of Tragedy* and four *Untimely Meditations*; middle (1877/78–82), with *Human, All Too Human*, *Daybreak* (1881) and *The Gay Science* (1882; enlarged 1887); and late (1883–88), with *Thus Spoke Zarathustra* (1883–85), *Beyond Good and Evil* (1886), *On the Genealogy of Morality* (1887) and the books of 1888, among them *Twilight of the Idols*, *The Antichrist* (published 1895) and *Ecce Homo* (published 1908).

He wrote mostly in short numbered sections ("I approach deep problems like cold baths: quickly into them and quickly out again", *The Gay Science* §381, tr. Walter Kaufmann) and declared that he mistrusted all systematisers, one reason readers still disagree about what he meant.

## The Death of God

The most famous passage in Nietzsche is a parable. In *The Gay Science* §125 a madman runs into the marketplace one morning with a lantern, crying "I seek God!" The crowd, who do not believe in God, laugh at him. He answers:

```quote
God is dead. God remains dead. And we have killed him. How shall we comfort ourselves, the murderers of all murderers?
Friedrich Nietzsche · The Gay Science §125 (tr. Walter Kaufmann) · 1882
```

Then he smashes his lantern: he has come too early. He is not arguing that atheism is true; his listeners are already atheists. His point, spelled out in §343, is that because "the belief in the Christian God has become unbelievable" (Kaufmann's translation), everything built on that belief, including "the whole of our European morality", must eventually collapse, and the unbelievers have not yet noticed. The phrase had precedents, among them Hegel (see *German Idealism: Fichte, Schelling and Hegel*). The fitting response, Anderson stresses, is mourning, not cheerful liberation. The danger is nihilism, which an 1887 notebook defines as the highest values devaluing themselves: "The aim is lacking; 'Why?' finds no answer" (tr. Kaufmann and R. J. Hollingdale).

## The Genealogy of Morality: The Argument

If morality rested on a dying faith, what is it worth? *On the Genealogy of Morality* (1887) answers with a "genealogy": a history of how our values came to be, used to assess them. Brian Leiter stresses that the target is not every code of conduct but "morality in the pejorative sense", which assumes that agents have free will, know their own motives and are essentially alike, and whose norms harm "the 'highest men'" while benefiting "the 'lowest'". Its main examples are Christian and Kantian ethics (see *Deontology: Duty and Respect* and *Free Will and Determinism*); elsewhere he attacked utilitarian hedonism too (see *Bentham, Mill and Utilitarianism*). The First Treatise argues, roughly:

1. There are two basic patterns of evaluation. In **good/bad** ("master" or noble morality), "good" first meant the socially high and then their excellences, such as courage and magnanimity; "bad" simply means low or common. This pattern dominated Homeric, Greek and Roman culture.
2. In **good/evil**, the negative term comes first: "evil" condemns harm to others, and "good" is derived from it as humility, patience and concern for others. This pattern is universal and egalitarian.
3. We now treat good/evil as morality as such, but it is a historical innovation. So how did it win?
4. Through a "slave revolt in morality". The oppressed, powerless to strike back at their masters, developed ***ressentiment***, a lasting, corrosive, resentful hatred, and invented "evil" to condemn the masters' qualities. "Good" came by negation, and as the new values spread, even the nobles came to accept them.
5. So our morality of selflessness is, at root, not dispassionate rational concern but, in the SEP's paraphrase, "a vindictive effort to poison the happiness of the fortunate".

The Second Treatise traces guilt. The German *Schuld* (guilt) is linked to *Schulden* (debts): guilt began between creditor and debtor, where a defaulting debtor could be made to pay in pain, and was later internalised as a judgement on the guilty person's worth, while instincts denied outward discharge turned inward as "bad conscience". Christianity deepened the debt: God pays it by sacrificing his Son, so that the sinner owes even more. The Third Treatise asks what ascetic ideals, ideals of self-denial, mean. The ascetic priest tells sufferers they are to blame for their suffering, a cure that makes the sick sicker; yet such ideals survive because the human will "needs a goal,—and it would rather will nothingness than not will" (§1, tr. Maudemarie Clark and Alan Swensen). The book ends by turning on the unconditional will to truth itself, a late form of asceticism, and raises the question of the value of truth.

Two cautions belong here. Nietzsche locates the start of the slave revolt with the Jews as a priestly people, continued by Christianity, and the SEP notes that the *Genealogy* "freely deploys offensive anti-Semitic tropes", turned ironically against antisemitic Christians. And scholars still dispute what exactly the revolt was and how deliberate it was meant to be.

## Objections and Replies

The first and most obvious objection is the **genetic fallacy**: discrediting a claim by its origin when the origin is irrelevant (see *Informal Fallacies and Everyday Reasoning*). Even if compassion grew from resentful slaves, it might still be good. The replies are strong. Nietzsche's preface calls for a critique of moral values in which the value of those values is itself put in question; the history is evidence, not the whole case. For Leiter, what Nietzsche objects to is morality's present effect, that it stunts the highest human types: "it is not error as error" (*Ecce Homo*, as Leiter quotes it). For Anderson, Nietzsche aims less to refute moral views than to diagnose them, showing what psychological needs a value serves and whether it defeats itself. Bernard Williams drew on the account of guilt to analyse blame, and Bernard Reginster has developed its argument about self-punishment.

A second objection asks whether this is **history or hypothesis**. Nietzsche dismissed his friend Rée's genealogy as hypotheses and claimed to offer real history, yet the SEP calls the Second Treatise "conjectural history" and finds the slave revolt "hard to accept" as an account of origins, and even more as an explanation of altruism today. The Internet Encyclopedia of Philosophy (IEP), discussing his portraits of the early Greeks, suggests that historical accuracy in such narratives matters no more to him than an actual signed document does to social-contract theory. The reply is that even as a hypothesis it explains a good deal, such as the relish of hellfire in Christian writing (Nietzsche quotes Tertullian) and how easily moral indignation turns into free-floating vengefulness, enough, Anderson argues, to give an open-minded reader pause.

A third objection is that Nietzsche has **no standard** by which to condemn morality. If values are created rather than discovered, his own are no better grounded than those he attacks. Leiter accepts the point: Nietzsche gave his own vision no special epistemic status, which explains his rhetorical, persuasive style. Others read him as treating values as useful fictions, or as constructed by us yet still binding on us (see *Metaethics: Are There Moral Facts?*).

```checkpoint
q: In the Genealogy, what distinguishes "good/evil" morality from "good/bad" morality?
a*: In good/evil the negative term "evil" comes first and "good" is derived from it; in good/bad, "good" first named the noble and "bad" just meant low.
a: Good/evil is the older pattern, dominant in Homeric and Roman culture.
x: Nietzsche assigns good/bad to Homeric, Greek and Roman culture; good/evil is the later innovation.
a: Good/bad is egalitarian and universal, good/evil exclusive.
x: It is the reverse: noble good/bad is exclusive, while good/evil is universal and egalitarian.
a: Nietzsche held that good/evil is morality as such and good/bad a corruption.
x: He argues that we mistake good/evil for morality as such, when it is a historical innovation.
hint: Which term in each pair is primary?
why: The slave revolt, driven by ressentiment, invented "evil" to condemn the masters; "good" then meant whatever was not that.
---
q: What is the strongest reply to the charge that the Genealogy commits the genetic fallacy?
a: Nietzsche shows that the origins of morality were noble, so it must be good.
x: He finds the origins of modern morality in resentment, not nobility.
a: Origins always settle the value of a belief, so there is no fallacy.
x: The replies do not deny that origins can be irrelevant; they deny that the critique rests on origins alone.
a*: The history serves as evidence for a critique of morality's present function, for example that it harms the highest human types.
a: Nietzsche admitted his genealogy was fiction, so the objection does not apply.
x: He claimed to offer real history, though critics call it conjectural.
hint: Ask what Leiter and Anderson think the genealogy is for.
why: Leiter stresses morality's effects ("not error as error"); Anderson calls the method diagnosis rather than refutation.
```

## Perspectivism and Truth

"Perspectivism", a label for a cluster of claims rather than one doctrine, can be reconstructed like this:

1. All knowing happens from some perspective, shaped by our senses, concepts, drives and feelings.
2. There is no "view from nowhere", no God's-eye standpoint free of all of these.
3. So objectivity cannot mean disinterested contemplation; it must be the ability to use many perspectives.
4. On stronger versions, there are no facts independent of interpretation, and truth itself is impossible.

Step 3 is Nietzsche's own (*Genealogy* III §12): objectivity understood "not as 'disinterested contemplation' (which is a non-concept and absurdity), but rather as the capacity to have one's Pro and Contra in one's power" (tr. Clark and Swensen). The famous slogan "there are no facts, only interpretations" is not from a published book but from an unpublished notebook of late 1886 to 1887.

The obvious objection is **self-refutation**. If "there is no truth" is true, it refutes itself; and Nietzsche asserts his own views as true and prizes honesty, "our virtue, the last one left to us" (*Beyond Good and Evil* §227, tr. Kaufmann). Scholars offer several replies. Schacht and Anderson distinguish senses of "truth": Nietzsche rejects a metaphysical truth that would describe things as they are in themselves, while keeping ordinary truth. Maudemarie Clark's influential reading is developmental: late in his career he gave up the thesis that our knowledge falsifies reality, so his mature perspectivism rejects only God's-eye truth, not truth as such. Gemes reads perspectivism as psychology, a claim about drives, rather than a theory of knowledge. And Nietzsche anticipated the objection himself: in *Beyond Good and Evil* §22 he calls physics an interpretation and, imagining the reply that this too is only interpretation, answers "so much the better". The IEP notes that Clark's coherent picture requires stressing some passages over others (see *Truth*).

## The Will to Power

The will to power is named in *Zarathustra*, who finds it wherever he finds life, even in the servant's will to be master. In *The Antichrist* (§2, tr. Kaufmann) Nietzsche writes: "What is good? Everything that heightens the feeling of power in man, the will to power, power itself."

What the idea amounts to is one of the main debates. Heidegger read it as metaphysics, a claim about what everything is; Kaufmann as a psychological hypothesis about human motivation; Schacht and Anderson as a quasi-scientific conjecture; Clark as no claim about the world at all but an expression of Nietzsche's values. Reginster reads it as a drive to overcome resistance, a reply to Schopenhauer's will to live. Much depends on the notebooks, where the most sweeping, cosmic statements are found. Should the published works take precedence, as the classical view holds, or are the notes more authentic, as Heidegger thought? Kaufmann stressed self-overcoming over domination of others; Anderson thinks this "threatens to sanitize" a view meant to disturb.

## Eternal Recurrence and Amor Fati

In August 1881, by a pyramid-shaped rock at Lake Silvaplana near Sils-Maria, Nietzsche conceived the thought he later called the "fundamental conception" of *Zarathustra*. It was first published as a thought experiment:

```quote
What, if some day or night a demon were to steal after you into your loneliest loneliness and say to you: "This life as you now live it and have lived it, you will have to live once more and innumerable times more; and there will be nothing new in it, but every pain and every joy and every thought and sigh and everything unutterably small or great in your life will have to return to you, all in the same succession and sequence …"
Friedrich Nietzsche · The Gay Science §341, "The greatest weight" (tr. Walter Kaufmann) · 1882
```

Would you curse the demon, or crave "nothing more fervently than this ultimate eternal confirmation and seal"? Simmel, Löwith, Heidegger and, recently, Paul Loeb read it as a claim about the cosmos, that time is a circle; critics reply that the notebook attempts at proof, in the IEP's words, "present no serious challenge to a linear conception of time". Most recent scholars, among them Alexander Nehamas, Clark, Reginster and Anderson, read it instead as a practical test: could you affirm your life so completely that you would will it again, unchanged? Clark compares it to a spouse asking "would you marry me again?" Anderson explains its three features: recurrence of the past defeats our bias towards the future; sameness in every detail blocks affirming only the good parts; eternity, Anderson suggests more tentatively, may rule out treating earthly life as a mere test redeemed in heaven. This is the life-affirmation Nietzsche named *amor fati*, love of fate: "I want to learn more and more to see as beautiful what is necessary in things" (*The Gay Science* §276, tr. Kaufmann). The question returns in *The Meaning of Life and the Fear of Death*.

## The Übermensch and the Last Man

{{image: Thus Spoke Zarathustra | Title page of the first three-book edition of Thus Spoke Zarathustra, the work in which the Übermensch is chiefly discussed.}}

The *Übermensch* is discussed at length only in *Zarathustra*: announced with fanfare early on, it then fades from the book. *Mensch* means human being, not man as male. Thomas Common rendered it "Superman" in 1909, after Shaw's *Man and Superman*; Kaufmann preferred "overman", blaming "Superman" for confusion with the comic-book hero. Whether it is central to his thought, whether it names a transition or a state, and whether an individual or a community, are all debated. Its foil is clearer. In the Prologue Zarathustra describes the "last man", comfort-seeking, risk-averse and egalitarian; offered him as a warning, the crowd cheers for him instead.

```checkpoint
q: How do most recent scholars interpret eternal recurrence?
a: As a proven law of physics that time is circular.
x: Nietzsche never published a proof, and the IEP judges the notebook proofs no challenge to linear time.
a*: As a practical test of whether one could affirm one's life so fully as to will it again unchanged.
a: As a Buddhist doctrine of rebirth that Nietzsche adopted.
x: The texts present a thought experiment about the same life recurring, not karmic rebirth.
a: As a doctrine Nietzsche rejected in Zarathustra.
x: He called it the "fundamental conception" of Zarathustra.
hint: Think of Clark's "would you marry me again?"
why: Nehamas, Clark, Reginster and Anderson read it as a test of affirmation, while Loeb and older readers defend a cosmological reading.
---
q: Which statement about "there are no facts, only interpretations" is correct?
a: It is the opening line of Beyond Good and Evil.
x: It does not appear in Beyond Good and Evil; §22 makes a related point about physics.
a: Elisabeth Förster-Nietzsche invented it.
x: It is in Nietzsche's own notebooks, though it later appeared in her compilation.
a: It is from The Birth of Tragedy.
x: It is a late notebook remark, not part of any published book.
a*: It comes from an unpublished notebook of late 1886 to 1887.
hint: Published or unpublished?
why: Because the slogan is unpublished, how much weight it deserves is part of the wider debate over the notebooks.
```

## The Sister and The Will to Power

In 1885 Elisabeth married Bernhard Förster, a schoolteacher and leading antisemitic agitator; Nietzsche did not attend the wedding on 22 May. On 15 February 1887 fourteen families of colonists left Hamburg for Nueva Germania, the Försters' colony in Paraguay, meant to be "Aryan". It failed; Förster killed himself on 3 June 1889, and Elisabeth returned to Germany in 1893. As Förster-Nietzsche she founded the Nietzsche Archive in 1894, later in Weimar, and took control of her brother's papers, pushing Overbeck aside.

With Peter Gast she compiled *The Will to Power* from the notebooks, using a title Nietzsche had announced for a work he later abandoned: 483 sections in 1901, 1,067 in 1906. The SEP calls it "not well founded in Nietzsche's surviving plans" and "marred by Elisabeth's strong anti-Semitic commitments"; the scholar Mazzino Montinari called it a forgery, in an essay titled "'The Will to Power' Does Not Exist". She also suppressed passages. How guilty she was is now debated. The 1950s account, Kaufmann's among others, had her deliberately bending the work towards racist nationalism; more recent scholarship suggests her editing aimed mainly to protect her brother and present herself as close to him, and places more of the distortion with the Nazis themselves. She joined the conservative German National People's Party in 1918, never the Nazi Party.

## Antisemitism and the Nazis

Nietzsche despised the antisemites of his day. Besides the break with Schmeitzner, in 1887 he asked the antisemitic publisher Theodor Fritsch to stop sending him his writings, and one of the madness notes declares the antisemites, with the Kaiser and Bismarck, abolished. Yirmiyahu Yovel calls his mature attitude "anti-anti-Semitism". That does not make him simply a friend of the Jews: the *Genealogy*'s tropes noted above remain.

In the 1930s, the SEP reports, aspects of his thought were espoused by the Nazis and Italian Fascists, "partly due to the encouragement" of Elisabeth through her associations with Hitler and Mussolini, and Nazi readers assembled passages "quite selectively". The Nazi ideologue Alfred Baeumler presented him as a political thinker in *Nietzsche, the Philosopher and Politician* (1931), and gave his inaugural Berlin lecture on the night of the book burning of 10 May 1933. Hitler visited the Archive several times in 1932–34 and attended Elisabeth's funeral in 1935 (see *Hitler and the Death of Democracy in Germany, 1918-1945*). Against this, Karl Jaspers and Karl Löwith in their work of the 1930s, and Georges Bataille in his essay "Nietzsche and the Fascists" (1937), resisted the Nazi reading. The IEP judges the claim that his thought leads to National Socialism "even more problematic" than the claim that the Nazis used it.

## Recovery and Rival Readings

Walter Kaufmann's *Nietzsche: Philosopher, Psychologist, Antichrist* (1950) reopened serious English-language discussion, and Kaufmann translated most of the works. From 1967 Giorgio Colli and Montinari published a critical edition from the Weimar manuscripts, in chronological order and including all the notebooks, so that readers could at last see the notes as Nietzsche left them.

Interpretation divided. Heidegger, who lectured on Nietzsche in Nazi Germany from 1936 to 1940, read him as "the last metaphysician", drawing heavily on the notebooks (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*). In France from the 1960s Deleuze read him as an anti-Hegelian thinker of active and reactive forces, Foucault took up "genealogy" to uncover "the play of dominations" (see *Structuralism and After: Foucault, Derrida and Their Critics* and *Intellectual History*), and Derrida and Sarah Kofman studied his style and metaphors. Analytic and naturalist readers such as Clark, Leiter and Reginster reconstructed his arguments. Ricoeur grouped him with Marx and Freud as a master of suspicion (see *Marx*). His politics remain contested: Brandes's label "aristocratic radicalism", which Nietzsche approved, has its defenders, while Leiter finds "no grounds for ascribing to him a political philosophy" and Nussbaum decries his "baneful influence".

## Women and Feminist Readings

Nietzsche's remarks about women, especially in *Beyond Good and Evil* §§231–239, are notorious, though he prefaced his claims about woman as such by calling them only his own truths. Feminist readers are divided. Kelly Oliver and Marilyn Pearsall's collection (1998) finds his attacks on the hierarchies of mind over body and reason over unreason useful, though his remarks "confound attempts simply to proclaim Nietzsche a champion of feminism". Frances Nesbitt Oppel reads the misogyny as a rhetorical strategy exposing "woman-as-such" as a male construct; Cornelia Klinger counts him, like Schopenhauer, a hater of women who at least relativises his statements (see *Feminist Philosophy*).

## Nietzsche beyond Europe

His reception was global early. Muhammad Iqbal read him in Germany, and R. A. Nicholson, translating Iqbal's Persian poem *Asrar-i Khudi* (*The Secrets of the Self*, 1915) in 1920, said its philosophy owed much to Nietzsche and Bergson; Iqbal replied that his idea of the Perfect Man predated his reading of Nietzsche (see *Philosophy in an Age of Empire*). The Chinese writer Lu Xun read him in Tokyo, translated part of *Zarathustra*'s Prologue and, scholars such as Arena say, felt both attraction and repulsion (see *Modern Chinese and Indian Philosophy*). Japan had a "Nietzsche boom" around 1901, set off by Takayama Chogyū's essay "On the Aesthetic Life", and Nishitani Keiji's *Nihilism* (1949; in English *The Self-Overcoming of Nihilism*, 1990) read him through Buddhism (see *The Kyoto School and Modern Japanese Philosophy*). Zionists, Bolsheviks and anarchists claimed him too.

## Further exploration

- **Walter Kaufmann, *Nietzsche: Philosopher, Psychologist, Antichrist* (1950).** The book that rescued Nietzsche for post-war readers.
- **Alexander Nehamas, *Nietzsche: Life as Literature* (1985).** On style, perspectivism and self-creation.
- **Maudemarie Clark, *Nietzsche on Truth and Philosophy* (1990).** The influential analytic reading of truth, perspectivism and recurrence.
- **Brian Leiter, *Nietzsche on Morality* (2002; 2nd ed. 2015).** The naturalist reconstruction of the critique of morality.
- **Christopher Janaway, *Beyond Selflessness: Reading Nietzsche's Genealogy* (2007).** A close reading of the *Genealogy*.
- **Sue Prideaux, *I Am Dynamite! A Life of Nietzsche* (2018).** A readable recent biography.
- **Graham Parkes (ed.), *Nietzsche and Asian Thought* (1991).** Essays on Nietzsche's reception and parallels in Asia.$nietzsche_master$,
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
  select $nietzsche_quiz$[
    {"type": "mcq", "prompt": "In The Gay Science §125, why is it significant that the madman announces the death of God to a crowd of unbelievers?", "options": ["Because Nietzsche wanted to prove to atheists that God exists after all", "Because the point is not that atheism is true but that the unbelievers have not grasped that European morality, built on Christian faith, must now collapse", "Because the crowd are Christians who are about to lose their faith", "Because Nietzsche thought the death of God should be celebrated as a cheerful liberation"], "answerIndex": 1, "explanation": "The crowd already disbelieve in God. As §343 explains, once 'the belief in the Christian God has become unbelievable', everything built on it, including 'the whole of our European morality', is destined to collapse; the madman has 'come too early'. Anderson (SEP) stresses that the fitting response is mourning and disorientation, not cheerful liberation.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about The Will to Power is accurate?", "options": ["Nietzsche completed it in 1888 and sent it to his publisher just before his collapse", "It was a forgery by the Nazi philosopher Alfred Baeumler in 1931", "It was compiled from Nietzsche's notebooks by Elisabeth Förster-Nietzsche and Peter Gast, in 483 sections in 1901 and 1,067 in 1906", "It was the critical edition published by Colli and Montinari from 1967"], "answerIndex": 2, "explanation": "Elisabeth and Köselitz (Peter Gast) compiled it under a title Nietzsche had announced and later abandoned. The SEP calls it 'not well founded in Nietzsche's surviving plans'; Montinari called it a forgery ('The Will to Power Does Not Exist'). The Colli–Montinari edition printed the notebooks in chronological order instead.", "id": "q2"},
    {"type": "mcq", "prompt": "How do most recent scholars, such as Nehamas, Clark, Reginster and Anderson, read the doctrine of eternal recurrence?", "options": ["As a practical test: could one affirm one's life so fully as to will it again, unchanged, eternally?", "As a cosmological proof that time is circular", "As an adaptation of the Hindu doctrine of karma", "As a doctrine Nietzsche invented only in his madness notes of 1889"], "answerIndex": 0, "explanation": "GS 341 presents recurrence hypothetically, through a demon's question. The practical reading treats it as a test of affirmation (Clark's analogy: 'would you marry me again?'), while Loeb and older readers such as Löwith and Heidegger defend a cosmological reading; the IEP judges the notebook proofs no serious challenge to linear time.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the cause of Nietzsche's illness reflects current scholarship?", "options": ["It was certainly tertiary syphilis, as his doctors proved", "It was caused by witnessing a horse being beaten in Turin", "It was a hereditary disease that killed him at the age of 34", "It was long attributed to syphilis, but this is now widely doubted; a slow-growing brain tumour (a retro-orbital meningioma) is one leading alternative"], "answerIndex": 3, "explanation": "The Basel and Jena doctors diagnosed syphilis, but alternatives include a hereditary stroke disorder and forms of dementia, and Anderson (SEP) judges that Huenemann (2013) 'convincingly argued' for a meningioma. The cause remains contested. The horse story is a later legend, and Nietzsche died in 1900 aged 55.", "id": "q4"},
    {"type": "open", "prompt": "Set out the argument of the First Treatise of On the Genealogy of Morality step by step. Then explain the genetic-fallacy objection and assess the best replies to it.", "rubric": "A strong answer distinguishes good/bad (noble or master morality: 'good' first meant the socially high and their excellences; 'bad' meant low or common; dominant in Homeric, Greek and Roman culture) from good/evil ('evil' is primary and condemns harm to others; 'good' derived from it; universal and egalitarian); notes that good/evil is a historical innovation we mistake for morality as such; explains the slave revolt driven by ressentiment, which invented 'evil' to condemn the masters; and states the conclusion that our morality of selflessness is at root vindictive. It explains the genetic fallacy (discrediting a value by an irrelevant origin) and gives replies: the history is evidence for a critique of the value of values (preface); Leiter's point that Nietzsche objects to morality's present effect on higher types, 'not error as error'; Anderson's view of genealogy as diagnosis of function rather than refutation. Credit Leiter's scope ('morality in the pejorative sense'), the 'history or hypothesis' objection and reply, the third objection about Nietzsche's own standard of value, and the caution that the Genealogy deploys antisemitic tropes (SEP).", "id": "q5"},
    {"type": "open", "prompt": "How far were Elisabeth Förster-Nietzsche and the Nazis responsible for the image of Nietzsche as a proto-fascist, and how was that image challenged?", "rubric": "A strong answer covers Elisabeth's marriage to the antisemite Bernhard Förster (22 May 1885) and the Nueva Germania colony; her founding of the Nietzsche Archive (1894) and control of the papers; The Will to Power compilation (1901, 1906) and its assessment (SEP: 'marred by Elisabeth's strong anti-Semitic commitments'; Montinari: a forgery) and her suppression of passages; the debate between the 1950s account (Kaufmann) and recent scholarship that her editing aimed mainly to protect her brother and that she never joined the Nazi Party (she joined the DNVP); the Nazi appropriation (SEP: selective passages, partly encouraged by Elisabeth; Baeumler's 1931 book; Hitler's visits to the Archive and attendance at her funeral). It weighs evidence of Nietzsche's hostility to antisemites (break with Schmeitzner, the Fritsch letter, the madness note; Yovel's 'anti-anti-Semitism') against the antisemitic tropes in the Genealogy, and describes the challenge: Jaspers, Löwith and Bataille in the 1930s, Kaufmann's 1950 rehabilitation, and the Colli–Montinari critical edition. Credit the IEP's judgement that the claim his thought leads to National Socialism is 'even more problematic'.", "id": "q6"}
  ]$nietzsche_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/nietzsche', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
