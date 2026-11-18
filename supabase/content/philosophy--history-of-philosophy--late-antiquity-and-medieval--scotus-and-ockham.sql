-- Scotus, Ockham and the Late Medieval Debates — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/scotus-and-ockham @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/scotus-and-ockham',
    'research',
    'advanced',
    'read',
    $ockham_master$> **Between about 1290 and 1350, two Franciscans, John Duns Scotus and William of Ockham, reshaped Latin philosophy.** This chapter sets out Scotus's argument that "being" means the same thing when said of God and of creatures, with the main objection and his reply; his common natures and "thisness"; and his account of the free will. It then follows Ockham's stormy life, his arguments that real universals are incoherent, what he actually said about the "razor", and his views on God's power and ethics. It ends with Buridan and Autrecourt in Paris, two women writing outside the universities, and the debate over whether scholastic philosophy declined on the eve of the Renaissance.

## After 1277

On 7 March 1277 Bishop Stephen Tempier of Paris prohibited 219 philosophical and theological theses, an episode described in *Thomas Aquinas* and *Al-Ghazālī, Averroes and the Quarrel over Reason*. In condemning articles that limited divine power, in the historian Hans Thijssen's words, "Tempier endorsed God's absolute power to do whatever he wills." One condemned view was Aquinas's: that there could not be more than one angel in a species, tied to his teaching that matter individuates. That is one origin of the late medieval debate about what makes an individual.

Pierre Duhem argued that Tempier thereby freed Christian thought from dogmatic Aristotelianism and "marked the birth of modern science". Thijssen reports that "no one in the field any longer endorses" that view, though Edward Grant has defended a refined version.

The most influential Paris theologian of the next generation was Henry of Ghent (d. 1293), who sat on the commission that drew up the condemnations. "But it was John Duns Scotus," writes John Marenbon, "who transformed the subject." Marenbon sums up what followed: Ockham "followed Scotus's line on God's will, but substituted for his metaphysics a very sparse ontology in which the distinctions Scotus had thrust on reality are made through a mental language."

## John Duns Scotus, the Subtle Doctor

"Scotus" means "the Scot"; Duns was his family name and that of his birthplace, a village a few miles from the English border. His birth date is disputed. The traditional 1265 or 1266 was worked back from his ordination on 17 March 1291, assuming he was ordained at the earliest permitted age, 25; Stephen Dumont argued in 2023 that the records point to 1263 or 1264. So: c. 1265, perhaps 1263/64.

On Dumont's reconstruction, Scotus taught at Cambridge and Paris before studying theology at Oxford, where in 1298–99 he lectured on the *Sentences*, the set textbook of theology (the *Lectura*). He began revising these lectures into the *Ordinatio*, his premier work, which he left unfinished. In June 1303, during King Philip IV's quarrel with Pope Boniface VIII, royal agents took a census of the Paris Franciscans; Scotus sided with the pope and had to leave France. (The Internet Encyclopedia of Philosophy dates this to 1301; the Stanford Encyclopedia follows Dumont's 1303.) He returned, became master at Paris, and was sent to Cologne, where he died on 8 November 1308.

He was known as the "Subtle Doctor", and even Ockham praised his judgement as excelling all others in subtlety. He was beatified in 1993, and his school flourished into the seventeenth century. When sixteenth-century Scotists opposed humanism, humanists and reformers turned "dunce" into a term of abuse; the Oxford English Dictionary records *dunce* for a follower of Duns Scotus, a pedant or a fool.

## Univocity: One Meaning of "Being"

Aquinas and Scotus agreed that knowledge of God starts from creatures and that in this life we cannot know God's essence. They disagreed about our words. A term is **univocal** when it has exactly the same meaning in two uses, **equivocal** when its meanings differ, as "bank" does for a riverside and a lender. Aquinas allowed words such as "good" to apply to God and creatures only by **analogy**, a related but not identical meaning. Scotus held that some concepts, above all "being", apply univocally. His tests: affirming and denying the concept of the same thing yields a contradiction, and the concept can link the premises of a syllogism as its middle term.

It mattered because metaphysics is the science of being as such: if "being" had no single meaning, metaphysics would have no unified subject, and every argument from creatures to God would slide between senses. "In Scotus's view," the Internet Encyclopedia notes, "analogy is just a form of equivocity." His most influential argument, in Jeffrey Hause's reconstruction, runs:

1. A concept of which one is certain is different from concepts of which one is doubtful; one concept cannot be both certain and doubtful for the same person.
2. A person can be certain that God is a being while doubting whether God is finite or infinite, created or uncreated.
3. So the concept of being of which they are certain differs from "finite being", "infinite being", "created being" and "uncreated being".
4. Yet it is included in each of them.
5. So it is a single concept common to God and creatures: being is univocal.

Scotus added that, on Aquinas's own premise that all our concepts come from creatures, any concept we apply to God must be one we got from creatures, or we could not speak of God at all. And he used Anselm's "pure perfections": to test whether "good" is a perfection it is better in every respect to have, we must apply one concept to creatures and God alike.

**The objection.** Univocity seems to give God and creatures something in common, threatening the doctrine that God is wholly other. This was the Thomists' worry.

**The reply.** Univocity is a logical doctrine, not a metaphysical one: God and creatures share no reality. By setting aside "finite" and "infinite" we form an "incomplete" concept that fits both. Finite and infinite are "intrinsic modes", degrees of being, not differences dividing a genus, so being is not a genus. Analogy remains, but it rests on a univocal core. Scotus also rejected Henry of Ghent's view that the mind conflates two concepts of being into one "fruitful error": if the mind naturally merged close concepts, the unity of every concept, even "human being", would be in doubt.

Infinity, for Scotus, is a positive, intrinsic excellence, and "infinite being" is the simplest concept of God we have; Thomas Williams observes that infinity is for Scotus what simplicity is for Aquinas. On it Scotus built a proof of God's existence, which Hause calls perhaps the most complicated ever written (see *God: Arguments For and Against*). Later Scotists split over whether univocity was purely logical or implied a real community of being.

## Common Natures and Thisness

Scotus was a realist about universals, the problem introduced in *Early Scholasticism: Anselm, Abelard and the Universities*. Outside the mind there is a **common nature** (*natura communis*), such as humanity, "indifferent" to being in one individual or many, but existing only in particulars, "contracted" in each. It has a real but "less than numerical" unity. Why believe this? If all real unity were the unity of one individual, Socrates would be as different from Plato as from a line, and "human" would be a fiction. And fire generates fire whether or not any mind is watching, so the two fires share a mind-independent nature. Yet the common nature is not itself a universal: only a concept is predicable of many. Scotus drew on Avicenna's dictum that "horseness is just horseness" (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*).

What makes this human Socrates rather than Plato? Scotus rejected individuation by matter, Aquinas's answer, and by quantity or existence. The individuator must be positive, intrinsic and unshared. He called it the "individual entity" and, outside the *Ordinatio*, **haecceity** (from Latin *haec*, "this"): "thisness", as against "whatness". It is not a quality, nor a bare featureless particular. Robert Adams revived "thisness" in modern metaphysics in 1979.

Nature and thisness are related by Scotus's **formal distinction**, which lies between a real distinction (things that can exist apart) and a merely conceptual one. Two items are formally distinct when they are really the same but have different definitions, neither including the other: the common nature and its individuator, intellect and will, God's attributes. Ockham would find this machinery one of the things to cut away.

## Scotus on the Will

For a choice to be free, Scotus argued, the agent must, "at the very moment of willing, have the power to will otherwise": **synchronic contingency**, an alternative open at the same instant, not merely later. Aquinas placed freedom in the will as subject but in reason as cause; for Scotus, "in any moment of free choice the will can either accept or disregard the intellect's judgment." Only the will is a self-determining power for opposites. Hause calls this "moderate voluntarism", voluntarism being the view that will, not intellect, has priority. To explain how anything is contingent if God causes everything, Scotus argued that God wills contingently.

The ethical consequences are striking. **Natural law** in the strict sense consists of propositions self-evident from their terms, such as that God, if he exists, is to be loved; not even God can make these false. They cover the first table of the Ten Commandments, our duties to God, or part of it. The second table, honouring parents and the bans on killing, stealing, adultery and lying, is natural law only in a broad sense: "highly consonant" with the strict law but contingent on God's will, so that God could dispense from it, as with Abraham and Isaac. Does this make Scotus a divine command theorist, for whom rightness simply is what God commands? Williams has argued so; Borland and Hillman (2017) and Ward (2019) read him as grounding morality in the natures of agents and acts.

```checkpoint
q: In Scotus's argument for univocity, what work is done by the claim that someone can be certain God is a being while doubting whether God is finite or infinite?
a*: It shows that the concept "being" differs from "finite being" and "infinite being", yet is included in both, so it is one concept common to God and creatures.
a: It shows that God is finite.
x: The argument leaves open whether God is finite or infinite; Scotus himself held God to be infinite being.
a: It shows that all talk of God is analogical.
x: That is Aquinas's position, which the argument is designed to reject.
a: It shows that God and creatures share some real feature.
x: Scotus replied to this objection by saying univocity is a logical doctrine: God and creatures share no reality.
hint: One concept cannot be both certain and doubtful for the same person.
why: Since the concept of being is certain and the narrower concepts doubtful, they must be different concepts; since being is contained in each, it is a single concept applying to God and creatures alike.
---
q: What is Scotus's "haecceity"?
a: The common nature, such as humanity, shared by many individuals.
x: The common nature is what haecceity "contracts"; haecceity is what makes it this individual.
a: The matter that makes one angel distinct from another.
x: Individuation by matter was Aquinas's view, which Scotus rejected.
a*: A positive, non-shared principle, "thisness", that makes an individual this one.
a: A quality such as colour that distinguishes one person from another.
x: Haecceity is not a quality; qualities can be shared, thisness cannot.
hint: The Latin *haec* means "this".
why: Scotus argued that the individuator must be positive, intrinsic and not common; he called it the individual entity or haecceity, "thisness".
```

## William of Ockham: a Life in Controversy

William was born probably late in 1287 or early in 1288 in Ockham ("Oak Hamlet"), Surrey, and given to the Franciscans as a boy. At Oxford he lectured on the *Sentences* in 1317–19 but never completed the mastership, hence his nickname "Venerable Beginner". In London his colleagues Walter Chatton and Adam Wodeham were sharp critics of his views.

{{image: William of Ockham | William of Ockham depicted in a stained-glass window at All Saints' Church, Ockham.}}

In 1323 someone, perhaps John Lutterell, a former Oxford chancellor, charged him with heresy at Avignon, where the papacy sat from 1309 to 1376/77. Summoned in May 1324, he never returned to England. The investigation produced stern pronouncements, but "his views were never officially condemned as heretical" (Stanford Encyclopedia). What changed his life was the dispute over poverty. Pope John XXII condemned as heresy the Franciscan doctrine that Christ and the Apostles owned nothing; asked by the Franciscan minister general, Michael of Cesena, to study the papal statements, Ockham concluded that John was himself a heretic. On the night of 26 May 1328 Michael, Ockham and others fled to Ludwig of Bavaria, and Ockham was excommunicated for leaving without permission. He spent his last years in Munich writing on politics, and died on the night of 9/10 April 1347, just before the Black Death reached Munich (see *The Black Death*).

His political works attacked the pope's claimed "fullness of power", which, he argued, would make all Christians the pope's slaves. His language could be ferocious:

```quote
"heretical, erroneous, silly, ridiculous, fantastic, insane, and defamatory, contrary and likewise plainly adverse to orthodox faith"
William of Ockham · Letter to the Friars Minor, on John XXII's claims (trans. John Kilcullen) · 1334
```

He is increasingly seen as a contributor to Western ideas of limited government (see *Authority and the State: the Social Contract and Its Critics*).

## Logic and Mental Language

Ockham called logic "the most useful tool of all the arts" (Paul Vincent Spade's translation), though the Stanford Encyclopedia warns that his logical originality should not be exaggerated. He was the first to develop in detail the idea of a **mental language**. Written words depend on spoken words, spoken words on concepts; "dog" and *chien* signify by convention, but concepts are natural signs. Whether this mental language is a lean, ideal language or contains redundancies like ours is still argued (see *Meaning and Reference*). His key tool was the distinction between **absolute** terms, such as "human being", which signify their objects directly, and **connotative** terms, such as "parent", "white" or "similar", which signify one thing directly and another indirectly. Connotative terms can be paraphrased without positing extra entities.

## Against Real Universals

Ockham's thesis: everything that exists is singular. The only universals are concepts, and the words subordinated to them, "universal" only in being predicable of many. This is **nominalism** (from *nomina*, "names"); the Internet Encyclopedia calls his version "conceptualism".

A common story says he shaved universals away with his razor. Both major encyclopedias say otherwise: he held the realist theories of his day outright incoherent. In the Internet Encyclopedia's translation (translator unnamed): "There is no universal outside the mind really existing in individual substances or in the essences of things…. everything that is not many things is necessarily one thing in number and consequently a singular thing." As steps:

1. Whatever exists is either many things or not many things.
2. Whatever is not many things is one thing in number, a singular thing.
3. A universal in things is supposed to be neither a mere plurality nor a singular thing.
4. So there is no such universal.

A second argument uses God's power. If humanity were a real constituent of each human, God could not annihilate one human without destroying the universal in him, and so every other human. **The realist reply:** destroying one human destroys only part of the universal. **Ockham's rejoinder:** then it is not one single shared essence after all, contradicting the realist's own claim.

No common nature is needed: two humans are simply more alike than a human and a brute, and the mind forms a concept representing each indifferently. Similarity is no extra entity:

```quote
"for the truth of 'Socrates is similar to Plato', it is required that Socrates have some quality and that Plato have a quality of the same species."
William of Ockham · Summa of Logic II.11 (trans. Paul Vincent Spade) · c. 1323–25
```

Was he fair? He mocked the realist "old way" for saying that a column is to the right by "to-the-rightness"; Gyula Klima judges the charge "not quite justified", since several realists posited no new entity for each such term. *What Exists? Ontology and Universals* carries the argument to the present.

## The Razor

Ockham did use a principle of economy, constantly. But "Entities must not be multiplied beyond necessity" is not his. "Although the sentiment is certainly Ockham's," the Stanford Encyclopedia notes, "this particular formulation is nowhere to be found in his texts." He wrote *Numquam ponenda est pluralitas sine necessitate*, "Plurality must never be posited without necessity", and *Frustra fit per plura quod potest fieri per pauciora*, "It is futile to do with more things that which can be done with fewer". Positing something is justified, he said, by reason, experience or the authority of Scripture.

Similar phrases were commonplace in thirteenth-century scholastic writing. The famous phrasing appears to come from a 1639 commentary on Scotus by the Irish Franciscan John Punch, who called it a "common axiom", though that attribution rests on secondary reports; the name "razor" came centuries after Ockham. (The *History of Philosophy* overview's "do not multiply entities beyond necessity" is true of the sentiment, not the words.)

For Ockham it was a cautionary rule of method. He used it to cut Aristotle's ten categories to two real kinds, substance and quality (with theological exceptions): a body is extended by having parts outside parts, not by an extra entity "quantity". He used it against "intelligible species", representations between mind and object. He restricted it where God's power and miracles were concerned. Chatton replied with an "anti-razor": if three things are not enough to make a proposition about things true, a fourth must be added.

## God's Power, Knowledge and Morals

Ockham distinguished God's **absolute power** from his **ordained power**, warning that this "must not be understood to mean that there are really two powers in God." On William Courtenay's reading, absolute power is the whole range of possibilities initially open to God, limited only by contradiction; ordained power is what God has chosen. Later "Ockhamists" equated absolute power with miracles, arguably a misreading. (These details come from secondary summaries and are best held lightly.)

This shaped his theory of knowledge. **Intuitive cognition**, a distinction Scotus originated, is cognition of a thing as existing and present, by which "it can be known whether the thing exists or not" (Spade's translation). Ockham held that God could cause an intuitive cognition of a non-existent thing, which would then yield the true judgement that it does not exist. Wodeham objected that if God deceives, no mark distinguishes true from false perception (see *Scepticism and the Answers to It*).

In ethics intentions count for everything, and outward acts are in themselves neutral. The Israelites' "spoiling of the Egyptians" was right because God commanded it. Yet Ockham also allows a "science of morals" through experience and reason. Sharon Kaye reads him as a straightforward divine command theorist and a "fideist"; the Stanford Encyclopedia says "scholars continue to debate" his ethics. *Free Will and Determinism* follows the will's later career.

```checkpoint
q: How did Ockham argue against real universals?
a: Mainly by the razor: universals are unnecessary, so they should not be posited.
x: Both the Stanford and Internet encyclopedias say he did not rely on the razor here; he argued realism was incoherent.
a*: By arguing that a universal in things would have to be both one and many, which is incoherent.
a: By appealing to Scripture, which denies that universals exist.
x: His arguments were philosophical, about one and many and about God's power to annihilate.
a: By showing that common natures have less than numerical unity.
x: Less than numerical unity is Scotus's realist doctrine, which Ockham rejected.
hint: Whatever is not many things is one thing in number.
why: Ockham argued that whatever exists is either many things or one singular thing, so a universal supposed to be one thing wholly present in many cannot exist.
---
q: Which of these is an attested formulation of Ockham's principle of economy?
a: "Entities must not be multiplied beyond necessity."
x: The Stanford Encyclopedia says this wording is nowhere in his texts; it appears to come from John Punch in 1639.
a: "The simplest explanation is usually the right one."
x: This is a modern paraphrase, not one of his formulations.
a: "Occam's razor cuts away all universals."
x: He did not call it a razor, and he did not use it against universals.
a*: "Plurality must never be posited without necessity."
hint: Think about which wording appears in his commentary on the *Sentences*.
why: *Numquam ponenda est pluralitas sine necessitate* is in his *Sentences* commentary; the famous "entities" wording is a later formulation.
```

## Buridan, Autrecourt and the Paris Arts Masters

John Buridan (born around 1300 near Béthune, died about 1360) spent his career in the Paris arts faculty and never took a theology degree. Legends about him, such as being thrown into the Seine in a sack, cannot be verified. His logic systematised the new nominalist way, and the "way of Buridan" shaped teaching from Paris to Prague and Vienna well into the Renaissance.

He developed **impetus**, a force passed from mover to projectile, replacing Aristotle's explanation that the air keeps it moving; he thought it "would be of infinite duration were it not diminished and corrupted by some contrary force". Duhem made him a forerunner of Galileo; Jack Zupko calls that "too much to claim" (see *The Scientific Revolution*). "Buridan's ass", starving between two equal haystacks, is nowhere in his writings; versions go back to Aristotle, and al-Ghazālī used two equal dates (see *Al-Ghazālī, Averroes and the Quarrel over Reason*). Zupko suggests it began as a parody of Buridan's view that the will can defer choice.

Nicholas of Autrecourt (born 1295–98, died 1369) argued that all evident knowledge reduces to the principle of non-contradiction, so that "from the fact that some thing is known to be, it cannot be inferred evidently … that there is some other thing": no evident inference from cause to effect, or from accidents to substance. Convicted in 1346, he publicly recanted and burned his writings in Paris on 25 November 1347. Hastings Rashdall called him "the medieval Hume", and Charles Bolyard finds in him the Middle Ages' most radical scepticism; Thijssen replies that it is now generally agreed he trusted the senses and attacked only rationalist claims about causality and substance. Buridan answered that experience supplies a "virtual infinity" of self-evident principles. Nicole Oresme (d. 1382) argued that no proof shows the Earth to be stationary, though he affirmed that it was, and wrote on money (see *Ancient and Medieval Economic Thought*).

## Women Outside the Schools

Women were excluded from the universities, but some wrote philosophy in other forms. Marguerite Porete was burned in Paris on 1 June 1310 for refusing to cooperate in the process against her book, *The Mirror of the Simple Souls*; Marenbon notes that she "stands out for her argumentative manner", with Reason "roundly defeated by Love". Christine de Pizan (1364–c. 1430), widowed and supporting her family by writing, became philosophical, in Catherine König-Pralong's words, "with Boethius but also Aquinas as points of reference", conscious of both the restrictions on women and their capabilities (see *Sex, Love, and Marriage in the Middle Ages* and *The Renaissance*). Christina Van Dyke argues that such contemplatives have much to teach philosophers about reason, love and will.

## On the Eve of the Renaissance

From the later fourteenth century the nominalist "modern way" (*via moderna*), begun by Ockham's semantics and systematised by Buridan, was set against the realist "old way" (*via antiqua*). Domingo de Soto, schooled in both, said the realist doctrine was harder to understand and the nominalist harder to believe.

Petrarch (1304–1374) attacked contemporaries who followed Aristotle "blindly" and debated questions such as the number of hairs on a lion's head; humanists prized eloquence as the road to virtue. He is also credited with creating the idea of the "Dark Ages", which most modern scholars find misleading. Nicholas of Cusa (1401–1464) wrote *On Learned Ignorance* (1440) on God as the "coincidence of opposites", beyond the reach of the principle of contradiction.

Did scholasticism decline? Klima describes the quarrel of the two "ways" breeding humanist "contempt" and ending in the demise of both. Marenbon replies that university philosophy "continued vigorously for at least three centuries", through Paul of Venice, Pomponazzi and Suárez, and that Ficino and Pico, usually called Renaissance thinkers, died before 1500. *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne* takes up the story from the other side of that disputed border.

## Further exploration

- **Richard Cross, *Duns Scotus* (1999).** The standard introduction to Scotus's thought.
- **Giorgio Pini (ed.), *Interpreting Duns Scotus: Critical Essays* (2023).** Recent essays, including Stephen Dumont's revised account of Scotus's life.
- **Marilyn McCord Adams, *William Ockham* (1987).** The comprehensive two-volume study of Ockham's philosophy.
- **Claude Panaccio, *Ockham on Concepts* (2004).** Mental language and the foundations of Ockham's nominalism.
- **Paul Vincent Spade (ed. and trans.), *Five Texts on the Mediaeval Problem of Universals: Porphyry, Boethius, Abelard, Duns Scotus, Ockham* (1994).** The key primary texts on universals in translation.
- **Jack Zupko, *John Buridan: Portrait of a Fourteenth-Century Arts Master* (2003).** Buridan's logic, natural philosophy and ethics.
- **Christina Van Dyke, *A Hidden Wisdom: Medieval Contemplatives on Self-Knowledge, Reason, Love, Persons, and Immortality* (2022).** Medieval women contemplatives read as philosophers.$ockham_master$,
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
  select $ockham_quiz$[
    {"type": "mcq", "prompt": "Which of these is true of the slogan 'Entities must not be multiplied beyond necessity'?", "options": ["It is Ockham's own wording from the Summa of Logic", "It expresses Ockham's sentiment, but this formulation is not found in his texts and appears to come from a 1639 commentary by John Punch", "It was coined by Duns Scotus and rejected by Ockham", "Ockham used it to prove that universals do not exist"], "answerIndex": 1, "explanation": "The Stanford Encyclopedia says the sentiment is Ockham's but the formulation is nowhere in his texts; it appears to come from John Punch's 1639 commentary on Scotus. Ockham wrote, for example, 'Plurality must never be posited without necessity', and he argued against universals by showing realism incoherent, not by the razor.", "id": "q1"},
    {"type": "mcq", "prompt": "Why was William of Ockham excommunicated in 1328?", "options": ["For leaving Avignon without permission, after fleeing with Michael of Cesena to Ludwig of Bavaria", "Because his nominalism was officially condemned as heretical", "For refusing to lecture on the Sentences at Oxford", "For writing The Mirror of the Simple Souls"], "answerIndex": 0, "explanation": "Ockham fled Avignon on 26 May 1328 with Michael of Cesena and was excommunicated for leaving without permission. His philosophical views were never officially condemned as heretical.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Scotus mean by 'synchronic contingency'?", "options": ["That God's will changes over time", "That the intellect always determines what the will chooses", "That a free agent can will one thing now and something else later", "That a free agent, at the very moment of willing, has the power to will otherwise"], "answerIndex": 3, "explanation": "Scotus required that the alternative be open at the same instant as the choice. Willing one thing now and another later is only a diachronic alternative, which he found in Aquinas's account.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about 'Buridan's ass' is correct?", "options": ["It is Buridan's main argument for impetus", "It appears in Buridan's Summulae de dialectica", "It is nowhere in Buridan's writings; versions go back to Aristotle and al-Ghazālī, and it may have begun as a parody of Buridan's view that the will can defer choice", "It was invented by Nicholas of Autrecourt to attack causation"], "answerIndex": 2, "explanation": "Jack Zupko reports that the example is not found in Buridan. Aristotle imagined a man equally hungry and thirsty, al-Ghazālī two equal dates, and the donkey probably began as a parody of Buridan's theory of choice.", "id": "q4"},
    {"type": "open", "prompt": "Set out Scotus's argument from certain and doubtful concepts for the univocity of being. What objection did it face, and how did Scotus reply?", "rubric": "A strong answer defines univocal (exactly the same meaning) against analogical and equivocal predication, and gives the steps: one concept cannot be both certain and doubtful for the same person; one can be certain God is a being while doubting whether God is finite or infinite, created or uncreated; so the concept of being differs from those narrower concepts; yet it is included in them; so being is a single concept common to God and creatures. It explains why this mattered (a unified subject for metaphysics; arguments from creatures to God would otherwise equivocate). It gives the objection (univocity seems to give God and creatures something in common, against divine transcendence) and the reply: univocity is logical, not metaphysical; God and creatures share no reality; finite and infinite are intrinsic modes, so being is not a genus; analogy rests on a univocal core. Credit mention of Henry of Ghent's 'fruitful error' or the later Scotist split.", "id": "q5"},
    {"type": "open", "prompt": "Explain how Ockham argued against real universals and what he put in their place. Why is it misleading to say he simply used his razor against them?", "rubric": "A strong answer states Ockham's thesis that everything that exists is singular and that universals are concepts (and words) predicable of many. It sets out the one-and-many argument (whatever is not many things is one thing in number, so a universal in things that is supposed to be one yet in many cannot exist) and the annihilation argument, with the realist reply (only part of the universal is destroyed) and Ockham's rejoinder (then it is not one shared essence). It describes his positive account: individuals are more or less similar, similarity is no extra entity, and concepts represent individuals indifferently. It notes that both major encyclopedias say he argued realism incoherent rather than merely unnecessary; the razor was a cautionary methodological rule used against extra categories and intelligible species. Credit mention of Klima's view that his charge against the realists was 'not quite justified'.", "id": "q6"}
  ]$ockham_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/scotus-and-ockham', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
