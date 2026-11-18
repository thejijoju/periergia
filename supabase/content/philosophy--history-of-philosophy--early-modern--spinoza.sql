-- Spinoza — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/spinoza @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/spinoza',
    'research',
    'advanced',
    'read',
    $spinoza_master$> **Baruch Spinoza (1632–1677) argued that there is only one substance, which can be called "God, or Nature", that everything in it happens by necessity, and that human freedom lies not in free will but in understanding.** This chapter follows his life from his excommunication in Amsterdam in 1656 to The Hague; sets out the *Ethics* step by step (one substance, God or Nature, determinism, mind and body as two attributes of one thing, the emotions, and the path to freedom); and turns to the *Theological-Political Treatise* on Scripture and toleration, his place in Jewish thought, and a reputation that swung from "atheist" to "God-intoxicated man".

## Bento, Baruch, Benedictus

Bento in Portuguese, Baruch in Hebrew, Benedictus in Latin: all three names mean "blessed". He was born on 24 November 1632 in Amsterdam, the son of Michael, a merchant, and Hannah Deborah. The community was Portuguese-Jewish and of **converso** stock: families coerced into Christianity in Iberia who had privately kept a Jewish identity and, after the Portuguese Inquisition, re-established themselves as Jews in Amsterdam.

His mother died in 1638. Two years later a relative on her side, Uriel da Costa, twice excommunicated for denying the soul's immortality and the Torah's divine origin, took his own life, having been readmitted only after prostrating himself so that the congregation stepped over him.

He attended the congregation's Talmud Torah school but did not reach the upper levels, devoted to the Talmud, that trained rabbis. He left school in his teens to work in the family importing firm, which he ran with his brother Gabriel after his father's death in 1654. When it was ruined, partly by English seizures of cargo, he, as a legal minor, had the city declare him an orphan in March 1656, with a guardian appointed, so that he could renounce his father's debts, breaking the synagogue's rule that disputes be settled inside the community. Meanwhile he learned Latin from Franciscus van den Enden, an ex-Jesuit, reputed freethinker and radical democrat, and in such dissenting circles met the philosophy of Descartes.

## The Herem

On 27 July 1656 the congregation's leaders issued against him, in the words of the Stanford Encyclopedia of Philosophy (SEP), "the harshest writ of herem, ban or excommunication, ever pronounced by the Sephardic community of Amsterdam; it was never rescinded". He was 23. The writ cursed him and forbade anyone to speak with him, do business with him, read anything he wrote, or come near him.

Why? The writ cites only "abominable heresies" and "monstrous deeds" and gives no specifics, and Spinoza never mentions it in his surviving letters. Steven Nadler, his biographer, thinks "an educated guess comes quite easy": he was probably already voicing the views of his later works, denying the soul's immortality, a providential God, and that the Law was literally given by God. Blake Dutton, in the Internet Encyclopedia of Philosophy (IEP), warns that we cannot know how much of those works was in his mind then. Others point to lax observance, the debt case, and the community's caution towards the Dutch authorities. In 2015 the congregation held a symposium on lifting the ban; its rabbi ruled that it stands.

## Lens-Grinder and Correspondent

Spinoza supported himself by teaching and by grinding lenses for microscopes and telescopes, which Christiaan Huygens praised. By 1661 he was at Rijnsburg near Leiden, writing the unfinished *Treatise on the Emendation of the Intellect* and the *Short Treatise on God, Man and His Well-Being*. In 1663, at Voorburg near The Hague, he published *Principles of Descartes' Philosophy*, with a preface by his friend Lodewijk Meyer warning that it was exposition, not endorsement: the only work he published under his own name in his lifetime.

He began the *Ethics* in the early 1660s, set it aside for the *Theological-Political Treatise*, finished it by 1675, and chose not to publish it. From 1670 he lived in The Hague. In 1673 he was offered the chair of philosophy at Heidelberg, with freedom to philosophise provided he did not disturb the established religion. In Letter 48 he declined: teaching would take time from his own work, and he did not know the limits of such a freedom. He died in The Hague on 21 February 1677, aged 44, of a lung disease, probably tuberculosis; it is often suggested, without proof, that glass dust from lens-grinding made it worse. His friends published his manuscripts as the *Opera Posthuma*, with a Dutch version; the States of Holland banned them in 1678.

## The Geometrical Method

The *Ethics* is *Ethica, ordine geometrico demonstrata*, "Ethics, Demonstrated in Geometrical Order": five parts built like Euclid's *Elements*, from definitions and axioms to propositions with demonstrations and scholia (explanatory notes). This chapter cites it in that form: I P14 is Part I, Proposition 14; "s" marks a scholium. Quotations from the *Ethics* are in Edwin Curley's translation (*The Collected Works of Spinoza*, vol. 1, 1985); those from the *Theological-Political Treatise* are in Samuel Shirley's (*Complete Works*, 2002) unless noted.

Why write about how to live as if it were geometry? Dutton argues that starting from God shows how all things follow from God, and following that order is already a step towards the knowledge in which happiness lies. Others stress a therapeutic aim: to "lead us, by the hand, as it were, to the knowledge of the human mind and its highest blessedness".

{{image: Spinoza's Ethics | The opening page of the Ethics in the Opera Posthuma, the Latin edition of Spinoza's works that his friends published after his death.}}

## One Substance

Part I begins with definitions. A **substance** is "what is in itself and is conceived through itself": something that depends on nothing else, even to be understood. An **attribute** is "what the intellect perceives of a substance, as constituting its essence", its basic nature. A **mode** is "that which is in another": a particular way a substance is, as a ripple is a way the water is. **God** is "a being absolutely infinite, that is, a substance consisting of an infinity of attributes". From these, Spinoza argues for **substance monism**, the view that only one substance exists:

1. Every substance has at least one attribute, which is its essence.
2. Two substances could differ only in their attributes or in their modes. But a substance is prior to its modes, so set the modes aside: two substances sharing an attribute would then be indistinguishable, and so identical. Hence: "In Nature there cannot be two or more substances of the same nature or attribute" (I P5).
3. Substances cannot produce one another, so a substance must cause itself; its essence involves existence. So God, the substance with all attributes, "necessarily exists" (I P11).
4. Any other substance would have some attribute, but God already has every attribute, and by step 2 no two substances share one.
5. Therefore "Except God, no substance can be or be conceived" (I P14), and "Whatever is, is in God, and nothing can be or be conceived without God" (I P15).

Unlike Anselm's and Descartes's proofs, step 3 does not reason from our *idea* of God or treat existence as a perfection. The conclusion broke with almost all Western philosophy: Descartes had many substances, minds and bodies plus God, and classical theism a creator distinct from his world.

**The objection.** The argument is "generally deemed a failure by contemporary philosophers", Jason Waller reports in the IEP, and most attacks target I P5. Leibniz objected that two substances could not share *all* their attributes, but could share one and differ in another: one has attributes A and B, the other A and C. They would be distinguishable, yet both have A.

**The reply.** Della Rocca answers on Spinoza's behalf from the conceptual independence of attributes. Each attribute "must be conceived through itself" (I P10). If two substances shared A, we could tell which substance's A we meant only by reference to B or C, and then A would be conceived through another attribute, contrary to I P10. Whether the rescue works is still argued (see *What Exists? Ontology and Universals*).

## God, or Nature

Spinoza's name for the one substance gave the *Ethics* its most famous phrase:

```quote
That eternal and infinite being we call God, or Nature, acts from the same necessity from which he exists.
Baruch Spinoza · Ethics, Part IV, Preface (trans. Edwin Curley) · 1677
```

*Deus, sive Natura* occurs in the Latin edition, but the friends who prepared the Dutch version left out "or Nature", probably out of fear of the reaction. The phrase can be read as divinising nature or as naturalising God; Nadler thinks that for the careful reader there is no mistaking the second.

Spinoza distinguishes *Natura naturans*, "naturing Nature", God and his attributes as the active, productive side, from *Natura naturata*, "natured Nature", all the modes that follow. God's causation is **immanent**: it does not pass outside God. Things follow from God's nature as it follows from the nature of a triangle that its angles equal two right angles (I P17s). There are infinitely many attributes, but we know two, **thought** and **extension**. "Extension is an attribute of God, or God is an extended thing" (II P2) led readers to think he made God a body, though he told Oldenburg that those who think so are "quite mistaken".

## Necessity and the Sanctuary of Ignorance

"In nature there is nothing contingent" (I P29), and "Things could have been produced by God in no other way, and in no other order than they have been produced" (I P33). There are no miracles: "Nothing happens in nature that does not follow from her laws" (TTP 6).

Is this world the only possible one? Garrett says yes. On Curley's reading, finite things follow partly from laws and partly from other finite things, in a chain with no first member, so none exists necessarily; the cost, Curley concedes, is that nothing explains why this series exists rather than another (see *Possibility and Necessity* and *Free Will and Determinism*).

There is no free will: the mind "is determined to will this or that by a cause that is also determined by another, and so to infinity" (II P48). Why then do we feel free? "Men believe themselves free because they are conscious of their own actions and are ignorant of the causes by which they are determined" (III P2s). Nor is there purpose in nature. The Appendix to Part I traces all prejudices to one: that "men commonly suppose that all natural things act, as men do, on account of an end", and that God made all things for man. Faced with a stone that falls and kills someone, such people "will not stop asking for the causes of causes until you take refuge in the will of God, i.e., the sanctuary of ignorance."

## Two Attributes, One Thing

Descartes left a puzzle, pressed by Elisabeth of Bohemia, as the chapter on *Descartes* explains: how can an unextended mind move an extended body? Spinoza's answer is that it does not, and need not. A second short argument shows why.

1. "The knowledge of an effect depends on, and involves, the knowledge of its cause" (I A4).
2. If a body caused an idea, knowing the idea would involve knowing extension; but it does not.
3. So causes and effects lie within one attribute: bodies cause bodies, ideas cause ideas.
4. Yet "The order and connection of ideas is the same as the order and connection of things" (II P7), because "a mode of extension and the idea of that mode are one and the same thing, but expressed in two ways".

The human mind is the idea of the human body; a circle and the idea of that circle "are one and the same thing, which is explained through different attributes". Every body has a corresponding idea, so in a sense all things are minded, differing as bodies differ in complexity. The mind–body problem, Nadler says, "does not, technically speaking, arise". This view is usually called **parallelism**, though Spinoza's claim is stronger: one thing expressed in two ways (see *The Mind–Body Problem*).

He also ranks three kinds of knowledge: **imagination**, "confused and mutilated"; **reason**, which sees things as necessary, "under a species of eternity"; and **intuition**, the highest.

```checkpoint
q: Which step in Spinoza's argument for one substance did Leibniz attack, and how?
a*: I P5, by arguing that two substances could share one attribute while differing in another.
a: The definition of God, by denying that any being could have infinitely many attributes.
x: Leibniz's objection, as reported by the IEP, targets the claim that substances cannot share an attribute, not the definition of God.
a: The claim that God necessarily exists, by arguing that existence is not a perfection.
x: Spinoza's proof does not treat existence as a perfection, and Leibniz's objection concerned shared attributes.
a: The conclusion I P15, by arguing that finite things are separate substances created by God.
x: Leibniz's objection concerns the premise about shared attributes; it does not simply deny the conclusion.
hint: Imagine one substance with attributes A and B and another with A and C.
why: I P5 says no two substances share an attribute. Leibniz replied that substances with A and B, and with A and C, would be distinguishable yet share A. Della Rocca answers that A would then be conceived through B or C, against the self-conceived nature of attributes (I P10).
---
q: How does Spinoza explain why people believe their wills are free?
a: Because God gives each person a small share of his own free will.
x: Spinoza denies free will in God as in us: everything follows from the necessity of God's nature.
a: Because the mind is a separate substance that can act on the body.
x: Spinoza rejects mind–body interaction; mind and body are one thing under two attributes.
a*: Because they are conscious of their actions but ignorant of the causes that determine them.
a: Because reason shows that some events are contingent.
x: Spinoza says it is of the nature of reason to regard things as necessary, not contingent.
hint: Look at Ethics III P2s.
why: In III P2s Spinoza writes that men believe themselves free because they are conscious of their own actions and ignorant of the causes by which they are determined; II P48 says the mind is determined to will by a chain of causes.
```

## Striving, Feeling and Bondage

Spinoza rejects the picture of man in nature "as a dominion within a dominion", disturbing rather than following its order; he will treat human actions "just as if it were a Question of lines, planes, and bodies". The foundation is the **conatus**, or striving: "Each thing, as far as it can by its own power, strives to persevere in its being" (III P6), and this striving is the thing's actual essence.

From it come three primary **affects**, Spinoza's word for emotions. **Joy** is the passage to greater power or perfection; **sadness** the passage to lesser; **desire** is striving accompanied by awareness of it. When we are the adequate cause of what happens in us we act; when outside causes drive us we undergo **passions**.

Part IV is titled "Of Human Bondage, or the Powers of the Affects". **Bondage** is the lack of power to moderate the affects, so that a person "often, though he sees the better for himself, he is still forced to follow the worse". Reason alone cannot restrain an affect; only a stronger affect can.

Spinoza's ethics is frankly self-interested: "reason demands that everyone love himself, seek his own advantage" (IV P18s). Yet reason also unites people: those who live by it "must always agree among themselves" (IV P35), and "Knowledge of God is the mind's greatest good" (IV P28). The goal is sketched in the **free man**, a model of human nature to aim at, not one anyone fully reaches, since "man is necessarily always subject to passions". In Curley's translation of IV P67, he "thinks of nothing less than of death, and his wisdom is a meditation on life, not on death" (see *The Meaning of Life and the Fear of Death*). Whether he is attainable or only an exemplar is debated.

## The Intellectual Love of God

Part V offers the remedy, and it is knowledge. An affect that is a passion ceases to be one once we form a clear idea of it; seeing that things are necessary weakens their hold. "The power of the mind is defined by knowledge alone." Nadler and Dutton hear the Stoics here (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*).

The highest state, arising from the third kind of knowledge, is the **intellectual love of God**, *amor Dei intellectualis*: "the very love by which God loves himself", and blessedness itself. It asks nothing back: "He who loves God cannot strive that God should love him in return" (V P19). Then comes a surprise: "The human mind cannot be absolutely destroyed with the body, but something of it remains which is eternal" (V P23). This is not personal immortality. Memory and imagination perish; what remains is the idea of the body's essence and the adequate ideas the mind has formed, so the more one understands, the greater the part that remains. Bennett called the doctrine "rubbish"; Karolina Hübner and others argue it is consistent with II P7. The book ends:

```quote
If the way I have shown to lead to these things now seems very hard, still, it can be found. And of course, what is found so rarely must be hard. For if salvation were at hand, and could be found without great effort, how could nearly everyone neglect it? But all things excellent are as difficult as they are rare.
Baruch Spinoza · Ethics, Part V, Proposition 42, Scholium (trans. Edwin Curley) · 1677
```

## Scripture, Prophecy and the Freedom to Philosophise

The *Theological-Political Treatise* (TTP) appeared anonymously in 1670, with a false imprint naming Hamburg, soon after Koerbagh, who had published similar views in Dutch under his own name, died in prison. Its aim was to show that "the freedom to philosophize" not only can be granted "without injury to piety and the peace of the Commonwealth", but that both are endangered by suppressing it.

Popular religion, Spinoza argued, feeds on fear and hope. The prophets were pious people with vivid imaginations, not superior intellects: "no one needed to have a more perfect mind in order to prophesy, but only a more vivid imagination" (Curley's translation). Against Maimonides, for whom a prophet needed great intellect as well, this meant prophets carry no authority on science or philosophy.

Then came the Bible's authorship. Moses did not write most of the Pentateuch, which narrates his death; Ezra was the likely compiler of the books through Kings. Abraham ibn Ezra in the twelfth century and Hobbes had suggested as much, but no one had argued it so boldly. The method was naturalistic: "the method of interpreting Scripture is no different from the method of interpreting Nature". A text's meaning comes from its language and history, not from what we think true, a direct challenge to Maimonides' practice of reinterpreting Scripture to fit demonstrated truth. Scripture's core message is to love God and one's neighbour; it teaches obedience, not knowledge, so faith and philosophy are separate spheres.

The political chapters owe much to Hobbes (see *Hobbes*): right in the state of nature equals power, and a contract hands right to a sovereign, who controls outward religion. Yet democracy is "the most natural" form, and inner belief cannot be surrendered: "Everyone is by absolute natural right the master of his own thoughts", and attempts to force people to speak as the sovereign prescribes will fail (TTP 20). Seditious speech is excluded. Because the sovereign governs public worship, Nadler thinks it "misleading" to call Spinoza a proponent of the separation of church and state (see *Liberty and Rights*).

One critic called it "a book forged in hell by the devil himself", and it earned Spinoza a reputation for atheism that he greatly resented. It was banned in 1674.

## The Political Treatise and the Disaster Year

In 1672, the *rampjaar* or "disaster year", France invaded, and Grand Pensionary Johan de Witt, whom Spinoza admired, was killed with his brother by a mob. According to one famous account, recorded later, his landlord had to stop Spinoza from posting a sign reading *ultimi barbarorum*, "ultimate of barbarians", at the scene. In the aftermath he wrote the *Political Treatise*, which opens by echoing Machiavelli's attack on utopian theorising (see *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*); he had just begun its chapters on democracy when he died. His model democracy excluded foreigners, servants and women, the last on grounds of "natural" inequality, an exclusion Moira Gatens has criticised (see *Feminist Philosophy*).

## Spinoza and the Jewish Tradition

Spinoza was steeped in Maimonides and Gersonides, and Crescas's treatment of the infinite, and of God as "the place of the world", helped him make extension an attribute of God; Crescas is one of the few medieval philosophers he quotes with sympathy (see *Jewish Philosophy: from Saadia to Maimonides*). The intellectual love of God, Nadler says, takes its cue from Maimonides' view of human happiness. Yet, as the SEP puts it, "for a naturalist like Spinoza, Maimonides is too willing to dismiss science and take refuge in traditional concepts like creation and divine volition", and the *Treatise* attacks his views of prophecy and interpretation. Wolfson read him as the last of the medieval Jewish rationalists. Later readers called him the "first secular Jew", and secular Zionists claimed him from a passing remark in the TTP. Nadler notes that Spinoza himself thought that without the Law the Jews lacked a source of identity.

```checkpoint
q: Why did Spinoza argue that prophets have no special authority on scientific or philosophical questions?
a: Because the prophets were frauds who invented their revelations.
x: Spinoza described the prophets as pious and morally upright; his point concerns imagination, not fraud.
a*: Because prophecy came from vivid imagination, not a more perfect intellect.
a: Because the Hebrew Bible was written entirely by Ezra.
x: He thought Ezra the likely compiler of some books, but his case about prophecy rests on imagination, not authorship.
a: Because only the Talmud has authority on such questions.
x: The Treatise grounds no authority in the Talmud; its point is that Scripture teaches obedience, not knowledge.
hint: Compare Spinoza with Maimonides, for whom a prophet needed great intellect as well as imagination.
why: Spinoza wrote that no one needed a more perfect mind to prophesy, only a more vivid imagination. So prophets teach piety and obedience, while truth about nature is the business of reason.
---
q: Why does Steven Nadler think it misleading to call Spinoza a proponent of the separation of church and state?
a: Because Spinoza wanted the clergy to rule the state.
x: Spinoza criticised clergy who exploit fear and hope; he gave authority to the sovereign, not the clergy.
a: Because Spinoza thought inner belief should be controlled by the sovereign.
x: Spinoza held that everyone is by natural right master of his own thoughts, which no sovereign can command.
a: Because Spinoza rejected the freedom to philosophise.
x: Defending the freedom to philosophise was the Treatise's declared aim.
a*: Because the sovereign controls outward religion, even though inner belief remains free.
hint: Distinguish public worship from private belief.
why: In the Treatise the sovereign governs outward religious practice for the sake of peace, while freedom of thought and, within limits, of speech is inalienable. That is toleration, but not separation in the modern sense.
```

## The Reputation of a "Spinozist"

For a century after his death "Spinozist" was a slur, and philosophers read him largely in secret. In 1697 Bayle likened his "atheism" to a Chinese sect known from Jesuit reports, which he called "Foe Kiao", apparently Buddhism. Such comparisons multiplied: Kant paired him with Laozi as "pantheists" (see *Mozi, the Daoists and the Legalists: the Hundred Schools*), and nineteenth-century Indologists likened his substance to the Brahman of Vedānta while noting that he could not have known it (see *Vedānta: Śaṅkara, Rāmānuja and Madhva*). These are parallels, not influences.

In 1780, at Wolfenbüttel, Lessing reportedly told Friedrich Heinrich Jacobi that he knew no philosophy but Spinozism. Lessing died in 1781. When Jacobi published the conversation in 1785, in letters to Moses Mendelssohn, the **Pantheism Controversy** broke out: Jacobi held that consistent rationalism leads to Spinozism, and so to fatalism and atheism. The *Ethics* became a touchstone for German philosophy. Novalis called Spinoza "the God-intoxicated man", and Hegel said that "to be a follower of Spinoza is the essential commencement of all philosophy", and that "you are either a Spinozist or not a philosopher at all" (see *German Idealism: Fichte, Schelling and Hegel*).

Was he a **pantheist**, identifying God with everything? The word dates only from Toland in 1705. If God is both *naturans* and *naturata*, the label fits. Curley, reading finite things as God's causal effects rather than properties, resists identifying them as parts of God. Gueroult and Clare Carlisle prefer **panentheism**, the world being "in" God; Nadler now argues that pantheism is still a reverent theism and "Spinoza's philosophy is an atheism" (see *God: Arguments For and Against*). In April 1929, asked by Rabbi Herbert S. Goldstein whether he believed in God, Albert Einstein replied, in one translation, "I believe in Spinoza's God who reveals himself in the orderly harmony of what exists, not in a God who concerns himself with the fates and actions of human beings."

The historian Jonathan Israel argues that Spinoza and Spinozism "were in fact the intellectual backbone of the European Radical Enlightenment everywhere", leading towards modern democracy (see the History chapter *The Enlightenment*). Critics including Antoine Lilti, Samuel Moyn and Dan Edelstein reject his split between radical and moderate Enlightenments and Spinoza's role as single origin (see *The Enlightenment and Rousseau*). Leibniz, who visited him in 1676, takes the story on (see *Leibniz*).

## Further exploration

- **Steven Nadler, *Spinoza: A Life* (1999; 2nd ed. 2018).** The standard biography.
- **Steven Nadler, *A Book Forged in Hell: Spinoza's Scandalous Treatise and the Birth of the Secular Age* (2011).** The *Theological-Political Treatise* and the storm it caused.
- **Steven Nadler, *Think Least of Death: Spinoza on How to Live and How to Die* (2020).** The ethics of the free man, for general readers.
- **Beth Lord, *Spinoza's Ethics: An Edinburgh Philosophical Guide* (2010).** A reader's guide through the *Ethics*, part by part.
- **Clare Carlisle, *Spinoza's Religion: A New Reading of the Ethics* (2021).** A panentheistic, religious reading of the *Ethics*.
- **Susan James, *Spinoza on Philosophy, Religion, and Politics: The Theologico-Political Treatise* (2012).** A study of the *Treatise* and its arguments.
- **Moira Gatens and Genevieve Lloyd, *Collective Imaginings: Spinoza, Past and Present* (1999).** Imagination, politics and feminist philosophy.$spinoza_master$,
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
  select $spinoza_quiz$[
    {"type": "mcq", "prompt": "What do we know about the reasons for Spinoza's excommunication in 1656?", "options": ["The writ cites only 'abominable heresies' and 'monstrous deeds' and gives no specifics, so the reasons must be inferred", "The writ lists his denial of the soul's immortality and his views on Scripture", "Spinoza explained the reasons at length in his surviving letters", "He was excommunicated for publishing the Theological-Political Treatise"], "answerIndex": 0, "explanation": "The herem of 27 July 1656 gives no specifics, and Spinoza never mentions it in his surviving letters. Nadler infers that he was already voicing the views of his later works; Dutton warns that we cannot know how much of them he held then; others point to lax observance, the 1656 debt case and the community's caution towards the Dutch authorities. The Treatise appeared only in 1670.", "id": "q1"},
    {"type": "mcq", "prompt": "Where does the phrase 'God, or Nature' (Deus, sive Natura) appear in a form this chapter quotes, and what happened to it in the Dutch edition?", "options": ["In the opening definition of Part I; the Dutch edition kept it unchanged", "In the Preface to Part IV of the Ethics; the Dutch version left out 'or Nature', probably out of fear of the reaction", "Only in the Theological-Political Treatise; it never appears in the Ethics", "In Letter 48 to Heidelberg; it was never translated"], "answerIndex": 1, "explanation": "The Preface to Part IV reads: 'That eternal and infinite being we call God, or Nature, acts from the same necessity from which he exists.' The friends who prepared the Dutch version omitted 'or Nature', probably fearing the reaction.", "id": "q2"},
    {"type": "mcq", "prompt": "According to Spinoza, why is there no causal interaction between mind and body?", "options": ["Because the mind is a separate substance that God keeps in harmony with the body", "Because only bodies exist and the mind is an illusion", "Because knowledge of an effect involves knowledge of its cause, so causes and effects must lie within one attribute; mind and body are one thing expressed in two ways", "Because the pineal gland blocks the passage of motion"], "answerIndex": 2, "explanation": "From I A4, if a body caused an idea, knowing the idea would involve knowing extension, which it does not. So bodies cause bodies and ideas cause ideas. Yet by II P7 the order and connection of ideas is the same as that of things, because a body and its idea are one and the same thing under two attributes.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Spinoza mean by 'the intellectual love of God'?", "options": ["Obedience to the ceremonial law of the Hebrew state", "Loving God in the hope that God will reward us with love in return", "Belief in a personal God who answers prayer", "A constant joy arising from the third kind of knowledge, which is 'the very love by which God loves himself' and is blessedness"], "answerIndex": 3, "explanation": "The intellectual love of God arises from intuitive knowledge and is blessedness itself. It asks nothing back: 'He who loves God cannot strive that God should love him in return' (V P19). Nadler sees in it Spinoza taking his cue from Maimonides' view of human happiness.", "id": "q4"},
    {"type": "open", "prompt": "Set out Spinoza's argument that only one substance exists (Ethics I P5, P11, P14). Then give Leibniz's objection and the best reply on Spinoza's behalf.", "rubric": "A strong answer defines substance (in itself and conceived through itself), attribute (what the intellect perceives of a substance as constituting its essence), mode (that which is in another) and God (a substance of infinitely many attributes). It gives the steps: every substance has an attribute; I P5, no two substances share an attribute, since setting modes aside they would be indistinguishable and so identical; I P11, God necessarily exists, since substances cannot produce one another and so must be self-caused; any other substance would share an attribute with God, who has them all; so I P14, except God no substance can be or be conceived, and I P15, whatever is, is in God. It states Leibniz's objection that two substances could share one attribute and differ in another (A and B, A and C), and Della Rocca's reply that distinguishing a shared attribute by reference to another would make it conceived through another, against I P10. Credit noting that the argument is generally deemed a failure by contemporary philosophers, or that the proof of God does not argue from our idea of God.", "id": "q5"},
    {"type": "open", "prompt": "How does the Theological-Political Treatise defend the freedom to philosophise, and how far does Spinoza's toleration go?", "rubric": "A strong answer explains the stated aim (that freedom to philosophise can be granted without injury to piety and peace, which are endangered by suppressing it); prophecy as vivid imagination rather than superior intellect, against Maimonides, so prophets have no authority on science or philosophy; the naturalistic method of interpreting Scripture from its language and history, as nature is interpreted; Scripture teaching obedience and love of God and neighbour, not knowledge, so faith and philosophy are separate spheres; and TTP 20, that everyone is by natural right master of his own thoughts. On limits, it notes that seditious speech is excluded, that the sovereign controls outward religion (so Nadler thinks it misleading to call Spinoza a proponent of church–state separation), and may mention the Political Treatise's exclusion of women, criticised by Gatens. Credit context: anonymous publication in 1670, Koerbagh's death, the ban of 1674 and the charge of atheism.", "id": "q6"}
  ]$spinoza_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/spinoza', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
