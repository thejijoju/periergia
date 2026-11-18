-- Thomas Aquinas — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/aquinas @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/aquinas',
    'research',
    'advanced',
    'read',
    $aquinas_master$> **Thomas Aquinas tried to show that a Christian could take Aristotle, and the Muslim and Jewish thinkers who had read Aristotle before him, entirely seriously.** This chapter follows his life as a Dominican friar and master, then his ideas: faith and reason; the Five Ways to God, with the Second Way set out step by step, its main objections and replies; essence and existence; the soul and what survives death; and his ethics of happiness, natural law and virtue. It ends with the condemnations of 1277, whose bearing on Aquinas is still disputed, and his long afterlife, from Salamanca and the Americas to analytic philosophy.

## A Friar in the Universities

Thomas was born about 1225 (estimates run from 1224 to 1226) into a wealthy family that held a castle at Roccasecca, near Aquino, halfway between Rome and Naples. Educated as a boy at the abbey of Monte Cassino, he was sent in 1239 to study at Naples, where he probably first read Aristotle.

At about nineteen he joined the Dominicans, "a newly founded order of priests devoted to preaching and learning", in the words of Robert Pasnau, author of the Stanford Encyclopedia's entry on him. On their mother's orders his brothers seized him and held him at the family's castles for about a year before his parents gave way. He went on to Paris (1245–48) and then to Cologne, to study under Albert the Great, the leading figure in the programme of joining Christian theology to Greek and Arabic philosophy. Albert's conviction that the faith could only gain from engaging deeply with philosophy and science became Aquinas's own.

Back in Paris from 1252, he lectured on the Bible and on Peter Lombard's *Sentences*, the theology textbook described in *Early Scholasticism: Anselm, Abelard and the Universities*, and became a master in 1256. After a first term in the Dominican chair (1256–59) he taught for nine years in Italy, beginning the *Summa theologiae* in Rome in 1265, then returned to Paris for an unusual second term (1268–72), partly to answer a radical Aristotelianism that opponents called "Averroism".

He wrote more than eight million words, eight times what survives from Aristotle, though he knew no Greek and read Aristotle in Latin. Besides the *Summa contra gentiles* and the unfinished *Summa theologiae*, he wrote disputed questions, short treatises such as *On Being and Essence*, and commentaries on Aristotle and on Neoplatonic works, including the *Book of Causes*, which he correctly recognised as drawn from Proclus (see *Plotinus and Neoplatonism*).

Around December 1273 he had a powerful religious experience during Mass and stopped writing. According to testimony given at his canonisation inquiry in 1319 by Bartholomew of Capua, he said that all he had written seemed like straw compared with what had been revealed to him. The saying survives in more than one form, and the reported Latin word, *paleae*, can mean straw or chaff. He died on 7 March 1274 at the abbey of Fossanova, on his way to the Second Council of Lyon.

{{image: Thomas Aquinas | Aquinas on a panel of a fifteenth-century altarpiece.}}

## Faith and Reason

Aquinas divided truths about God into two kinds. Some, such as that God exists and is one, can be reached by reason; he called these the "preambles of the faith". Others, such as the Trinity, can be known only by revelation: the "articles of faith". Philosophy can establish the first kind; theology, "sacred teaching" (*sacra doctrina*), starts from revelation.

Why reveal even what reason can reach? Because otherwise, he answers, "the truth about God investigated by reason would be available only to a few people, after a long time, and with the admixture of many errors" (Pasnau's translation). Truths of faith and of reason cannot really conflict, and the theologian must show that apparent conflicts are not real. Where a philosopher contradicts the faith, "this is not philosophy but rather an abuse of philosophy, due to a failure of reason" (Pasnau's translation). The Internet Encyclopedia of Philosophy sets this view against evidentialism (believe only what reason can prove), fideism (faith needs no support from reason) and "separatism" (faith and reason go separate ways). For Aquinas faith goes beyond reason, never against it, as in the medieval maxim he used: grace does not destroy nature but perfects it.

Some truths, he held, are self-evident in themselves but not to us. God's existence is one: we do not grasp what God is, so we cannot demonstrate God's existence from God's nature (a demonstration *propter quid*, "on account of which"). We can only reason back from effects to their cause (a demonstration *quia*, "that it is so"). That is why he denied that Anselm's ontological argument proves anything, as *Early Scholasticism: Anselm, Abelard and the Universities* explains.

## The Five Ways

The Five Ways fill a single article of the *Summa theologiae* (part I, question 2, article 3). The First argues from change (in medieval terms "motion"), the Second from efficient causes, the Third from possibility and necessity, the Fourth from degrees of perfection, and the Fifth from the way non-intelligent things act for ends. The first three are cosmological arguments, from the existence of the world to its cause, resting on the impossibility of an infinite series of causes.

None assumes that the world had a beginning. Aristotle and the Arabic philosophers held that it had always existed; many of Aquinas's contemporaries thought they could prove otherwise. In *On the Eternity of the World* Aquinas concluded that no demonstration is possible either way: the beginning is known by faith, a verdict Maimonides had also reached (see *Jewish Philosophy: from Saadia to Maimonides*). Aquinas even preferred to argue from the harder case:

```quote
"The most efficacious way to prove that God exists is on the supposition that the world is eternal. Granted this supposition, that God exists is less manifest."
Thomas Aquinas · Summa contra gentiles I.13 (trans. Anton Pegis) · 1259–65
```

Here is the Second Way, simplified from Christopher Brown's reconstruction in the Internet Encyclopedia of Philosophy. An *efficient cause* is whatever brings something about or keeps it in being.

1. We observe orders of efficient causes: things that exist now because of causes that are themselves being caused now. (Brown's example: an animal kept alive now by the warmth of the air, kept warm now by the sun.)
2. Nothing causes itself, for then it would exist before itself, which is impossible.
3. So any such order either goes on to infinity or has a first, uncaused cause.
4. In an ordered series the first member causes the intermediate ones, which cause the last; and to take away a cause is to take away its effect.
5. An infinite series has no first member, so it would have no intermediate causes and no last effect.
6. But there are effects.
7. Therefore there is a first efficient cause, "to which everyone gives the name of God" (English Dominican translation).

**The obvious objection.** Step 4 looks false. Effects often outlive their causes: a sculpture survives its sculptor, a dog its parents. Why can there not be an endless chain of causes stretching back in time?

**The reply.** Aquinas agreed that such a chain cannot be proved impossible. Commentators generally hold that the Second Way concerns causes acting at the same time: a "vertical" series, not a "horizontal" one running into the past. The difference is often put as one between *per se* and *per accidens* series, or "essentially" and "accidentally" ordered ones (a phrase from Duns Scotus). In an essentially ordered series each member has its causal power only through the present activity of the one before it, as when a hand moves a stick that moves a stone, or as a song lasts only while the singer sings. Such a series, defenders argue, must end in a first cause that is not itself being caused, or nothing in it would act.

Oberle argues that showing that a finite essentially ordered series loses its power when its first member is removed does not show that an infinite one is impossible. Ross Cameron replies that without a first member the explanation is "never fulfilled", a vicious regress; Oberle answers that there is no vicious regress if the series is taken member by member. The question, as the Stanford Encyclopedia puts it, is partly whether invoking the *per se* distinction begs the question.

Another objection asks whether the conclusion reaches God at all. Pasnau notes that Aquinas puts it cautiously: a first cause falls well short of a being worthy of the name, and might even be a body. The Ways are only beginnings; the following questions of the *Summa* argue that the first cause must be simple, perfect, good, infinite, unchanging, eternal and one.

The Third Way has a problem of its own. It argues that "if everything can not-be, then at one time there was nothing in existence", and then nothing could ever have begun to exist. Critics including Plantinga and Kenny reply that this is a quantifier shift: from "each thing fails to exist at some time" it does not follow that there is a time when everything fails to exist, just as "everyone has a mother" does not mean one woman is everyone's mother. John Haldane replies that the argument is fallacious only on a temporal reading, and Aquinas means a timeless order of dependence. The Third Way's first half follows Avicenna's proof of a being necessary in itself, set out in *Falsafa: al-Kindī, al-Fārābī and Avicenna*; the Indian philosopher Udayana gave a brief argument from dependence of a similar kind (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*). Anthony Kenny's *The Five Ways* (1969), which reviewers credit with lasting influence, argued that none of the Ways is wholly valid. Hume's, Russell's and Kant's objections to cosmological arguments are followed in *God: Arguments For and Against*.

```checkpoint
q: Why does the Second Way not depend on the world having a beginning in time?
a*: Because it concerns causes acting at the same time, each sustaining the next, not a chain stretching back into the past.
a: Because Aquinas thought he had proved that the world began.
x: He held that neither a beginning nor an eternal world could be demonstrated; the beginning is known by faith.
a: Because it relies on the ontological argument instead of on effects in the world.
x: Aquinas rejected Anselm's argument; the Second Way starts from observed causes.
a: Because Aristotle had already proved that the world began.
x: Aristotle held that the world had always existed.
hint: Think about the singer and the song, or the hand moving the stick.
why: Commentators generally agree the argument rules out an infinite "vertical" series of simultaneous causes. Aquinas did not think an infinite series of past causes could be shown impossible.
---
q: What is the quantifier-shift objection to the Third Way?
a: That nothing can come from nothing.
x: That principle is one the Third Way relies on, not an objection to it.
a: That a first cause might be a body rather than God.
x: That is the objection that the conclusion falls short of God, which applies to all the cosmological Ways.
a*: That "each thing fails to exist at some time" does not imply "there is a time when nothing exists".
a: That essentially ordered series must end in a first member.
x: That is the defenders' claim about the Second Way.
hint: Compare "everyone has a mother" with "someone is everyone's mother".
why: Plantinga, Kenny and others charge that the Third Way moves illegitimately from a claim about each thing to a claim about all things at once. Haldane replies that Aquinas means a timeless order of dependence.
```

## Essence and Existence

The *essence* of a thing is what it is: what makes a human a human or a triangle a triangle. Its *existence* (*esse*, "to be") is its act of being. In every creature, Aquinas held, the two are distinct; only in God are they the same.

*On Being and Essence*, written for fellow Dominicans in his first Paris years, argues for this in three stages, as Gaven Kerr reconstructs them. First, we can understand what a human or a phoenix is without knowing whether any exists; so existence comes to an essence from outside. Second, a being whose essence simply was its existence could only be one, since nothing could tell two of them apart; in everything else essence and existence differ. Third, whatever has existence distinct from its essence must receive it from another, since nothing gives itself existence; and to avoid an infinite regress there must be a cause that is existence alone. God is "subsistent being itself" (*ipsum esse subsistens*) and "pure act" (*actus purus*), with no composition at all: God does not have goodness but is his goodness.

The first stage echoes Avicenna, who argued that we can know what a triangle is without knowing whether one exists, and held that only in God are essence and existence identical; whether Avicenna meant a real distinction or only a conceptual one is disputed. The same question divides Aquinas's readers. Joseph Owens and John Wippel hold that the first stage proves only a conceptual distinction; Walter Patt, Kenny and Steven Long that it proves a real one. Wippel thinks the second stage decisive, Owens that only the third does the work. Fabro and Geiger brought out the Platonic thread in this metaphysics: creatures "participate" in existence.

The distinction did real work. The Franciscan Bonaventure, among others, held "universal hylomorphism", the view that even angels have a kind of matter. Aquinas attributed it to Avicebron, whom Latin readers did not know was the Jewish philosopher Solomon ibn Gabirol (see *Jewish Philosophy: from Saadia to Maimonides*). Angels, he replied, need no matter to be limited: an angel's essence receives an existence it does not have of itself.

Talk about God is limited from the start: "because it is not possible for us to know what God is, but rather what God is not, we cannot consider how God exists, but rather how God does not exist" (Pasnau's translation). Yet "good" said of God is not empty. It is used neither in the same sense as of creatures nor in an unrelated one, but *analogically*, as "healthy" is said of an animal and, derivatively, of exercise. "God is good" does not merely mean that God is not evil, the reading he attributed to Maimonides, but that "whatever good we attribute to creatures, pre-exists in God, and in a more excellent and higher way" (English Dominican translation). Scotus would insist that "being" has a single meaning for God and creatures, as *Scotus, Ockham and the Late Medieval Debates* explains.

## The Soul

Following Aristotle, Aquinas treated the soul as the *form* of a living body: not a ghost inside it but the principle that makes a body alive and the kind of thing it is. Plants and animals have wholly material souls. A human has a single soul doing the work of life, sensation and thought.

This "unitarian" thesis was controversial. Many contemporaries posited several substantial forms, including a "form of bodiliness" that would explain why a body stays the same body after death. Aquinas replied that if Socrates were animal and rational by different forms, nothing would unite them, and "a human being is one thing only as an aggregate, like a heap" (Pasnau's translation). The cost: a corpse is "human" only by a manner of speaking.

Yet the human soul, unlike a dog's, can exist without the body. The argument starts from thinking. When we think what a cat is, we grasp something universal, true of every cat. Whatever receives forms in a bodily organ, as the senses do, receives them as individual: this colour, this shape. So the intellect does not work through a bodily organ. Since a thing acts as it is, the soul is "incorporeal and subsistent", and not being a body it has no natural way of falling apart. Pomponazzi objected in 1516 that even on Aristotle's account we cannot think without mental images, which need the brain, yet judged this the best argument for immortality that could be made (see *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*).

The same view drove his attack on Averroes in *On the Unity of the Intellect* (the subtitle "against the Averroists" seems to be later), written in his second Paris regency. If all humans shared one intellect, "if I think about stone and you do likewise, then it would be necessary that you and I have one and the same intellectual operation" (Pasnau's translation), against our experience of ourselves as individual thinkers; *Al-Ghazālī, Averroes and the Quarrel over Reason* gives Averroes' side.

Is Aquinas a dualist? If a dualist holds that humans have a material body and an immaterial mind, Pasnau says, he clearly qualifies, though he insists on one substance. The tension shows after death. The soul survives until the resurrection, but "Abraham's soul's having life would not suffice for Abraham's being alive... The life of the whole compound is required, soul and body" (Pasnau's translation); elsewhere he wrote *anima mea non est ego*, "my soul is not I". "Corruptionists" such as Toner read him as holding that the person does not survive as a separated soul; "survivalists" such as Eleonore Stump find that incredible and at odds with other texts. Readers also divide over whether his will ("the will and free choice are not two powers, but one") is compatibilist or libertarian; see *Free Will and Determinism* and *The Mind–Body Problem*.

## Happiness, Natural Law and Virtue

About half the *Summa theologiae* is ethics. All agents act for an end, and after ruling out riches, honour and pleasure Aquinas concludes that "final and complete happiness can consist in nothing other than the vision of the divine essence" (Pasnau's translation). In this life only imperfect happiness is possible, through the virtues.

He distinguishes four kinds of law: *eternal law*, God's plan for governing everything; *natural law*, rational creatures' share in that plan; *human law*; and *divine law*, revealed in Scripture. The first precept of natural law is "the good should be done and pursued, and the bad should be avoided" (Pasnau's translation), self-evident and derived from nothing else. John Finnis, following Grisez, warns that shortening it to "do good and avoid evil" is unsound: it is not yet a moral command but the principle that directs all practical reasoning. Further precepts follow "the order of natural inclinations": to preserve life, to have and bring up children, to know the truth, including about God, and to live in society. Mark Murphy writes that if any moral theory is a natural law theory, Aquinas's is.

Critics say this derives what we ought to do from facts about human nature. Finnis and Grisez, the "new natural law" theorists, deny it: the basic goods are grasped directly as worth pursuing, not deduced from facts. Others, such as McInerny, give human nature and its inclinations first place (see *Metaethics: Are There Moral Facts?*). Virtues are settled dispositions (*habitus*) built by repeated acts: the cardinal virtues of prudence, which underlies the rest, justice, courage and temperance, and three that God infuses, faith, hope and charity (see *Virtue Ethics, Greek and Confucian*).

One short article on self-defence has had a long afterlife. Augustine had condemned private self-defence; Aquinas replied that "nothing hinders one act from having two effects, only one of which is intended, while the other is beside the intention." One may intend to save one's life, foreseeing the attacker's death, provided one uses no more force than necessary. Aquinas is credited with introducing the principle of double effect here. But Mangan, in a 1949 historical study, judged it "not entirely clear" that Aquinas himself states the principle; its classic modern form is usually credited to the Jesuit Jean-Pierre Gury (1850), who, Julia Fleming argues, relied far more on later theologians than on Aquinas (see *Deontology: Duty and Respect*). Aquinas also gave three conditions for a just war, legitimate public authority, just cause and right intention, later developed by Vitoria, Suárez and Grotius.

On women he followed Aristotle's biology, which overweighted the male part in reproduction. As regards the individual nature, he wrote, woman is "defective and misbegotten" (*deficiens et occasionatus*), since the male seed tends to produce its own likeness; as regards human nature in general, she is not misbegotten but intended by nature for the work of generation. *Occasionatus* means roughly "produced by an accidental cause", so "misbegotten" is a loose rendering. Women were excluded from the universities, yet Christine de Pizan (1364–c. 1430) took Aquinas, with Boethius, as a reference point while writing from a strong sense of women's capabilities.

```checkpoint
q: What does Aquinas say is the first precept of natural law?
a: Love God above all things.
x: That belongs to revealed divine law, not the first principle of practical reason.
a*: The good should be done and pursued, and the bad avoided.
a: Obey the laws of the community.
x: Human law derives from natural law, not the other way round.
a: Never intend harm, even as a side effect.
x: That garbles double effect, which concerns intended effects and side effects; it is not the first precept.
hint: It is self-evident and governs all practical reasoning.
why: The first precept is that good is to be done and pursued and bad avoided. Finnis stresses that it directs practical reasoning rather than being a moral command; further precepts follow natural inclinations.
---
q: Why do corruptionist readers think Aquinas denies that the person survives as a separated soul before the resurrection?
a: Because he held the soul to be material and to perish with the body.
x: He argued that the human soul is incorporeal and survives death.
a: Because he followed Averroes in thinking all humans share one intellect.
x: He attacked Averroes' single intellect.
a: Because he believed there is no resurrection.
x: The separated soul exists until the resurrection.
a*: Because he wrote that a soul's having life does not make the person alive, and that "my soul is not I".
hint: Consider his remark about Abraham's soul.
why: Corruptionists such as Toner take these texts to mean that the separated soul is not the person. Survivalists such as Stump find that incredible and at odds with other texts.
```

## The Condemnations of 1277

On 7 March 1277, three years to the day after Aquinas's death, Bishop Étienne Tempier of Paris prohibited 219 philosophical and theological theses "discussed and disputed in the faculty of arts", among them the eternity of the world, the single intellect and theses on free will. Sixteen masters of theology, including Henry of Ghent, assisted. Tempier had already condemned thirteen propositions in 1270.

The main targets are usually taken to be arts masters such as Siger of Brabant and Boethius of Dacia. Did the condemnation touch Aquinas? Hissette found few theses traceable to him; Wippel argued that some were drawn from his writings or implied his teaching; Pasnau judges that a significant number seem to implicate him. Robert Wielockx argued that a separate process against Aquinas himself was begun that March and halted on orders from the papal court; this is widely accepted, but Wippel and Hans Thijssen question it. On Pasnau's account, following Jean-Pierre Torrell, its targets were his single substantial form and his view of prime matter as pure potentiality.

At Oxford on 18 March 1277 Archbishop Robert Kilwardby, himself a Dominican, prohibited thirty articles on grammar, logic and natural philosophy, some taken at the time as aimed at Aquinas's unity of form, though Hissette challenged that reading. The Franciscan William de la Mare compiled a "correction" of Aquinas, and Dominicans answered.

Pope John XXII canonised Aquinas at Avignon on 18 July 1323. In February 1325 Bishop Étienne Bourret of Paris declared the 1277 condemnation not to apply to his teaching, while making clear that this was no endorsement. The wider effects of 1277 are also disputed: Duhem's thesis that it gave birth to modern science is now rejected, though afterwards nondeterministic views of the will came to dominate scholasticism, as *Scotus, Ockham and the Late Medieval Debates* shows.

## Later Influence

Dominicans were required to promote his teaching. Capreolus championed Thomism as a system in the early fifteenth century, and Cajetan (Thomas de Vio, 1469–1534) wrote the most influential commentary on the *Summa theologiae* and met Luther, who predicted that soon "no Thomist, Albertist, Scotist, or Ockhamist will be left in the world" (see *The Protestant and Catholic Reformations*). Aquinas also travelled east: Latinophile Byzantine scholars translated him into Greek between the thirteenth and fifteenth centuries (see *Byzantium: the Empire of New Rome*), and he was translated into Hebrew in the fourteenth and fifteenth, a return on his debts to Maimonides and Ibn Gabirol.

At Salamanca, Francisco de Vitoria (1486–1546), teaching from 1524, made the *Summa theologiae* a textbook. With Domingo de Soto and Melchor Cano he applied Thomist principles to the evangelisation of the indigenous peoples of the Americas and the legality of slavery, departing from Aquinas where they saw fit (see *The Conquest of the Americas*). In 1567 Pius V named Aquinas a Doctor of the Church.

On 4 August 1879 Leo XIII's encyclical *Aeterni Patris* called for a revival of Aquinas as the model Christian philosopher, producing the critical Leonine edition and a twentieth century of "Thomisms of all kinds", from Maritain and Gilson to Anscombe and MacIntyre. Haldane coined "analytical Thomism" in the early 1990s, with Anscombe, Geach and Kenny as forerunners; Finnis carried natural law into jurisprudence, and Foot and MacIntyre virtue into ethics (see *Analytic Philosophy since 1950*). Aquinas now looks, Pasnau concludes, "not so much like the culmination of an era, but rather like the brilliant beginning of Europe's philosophical renaissance".

## Further exploration

- **Eleonore Stump, *Aquinas* (2003).** A major philosophical study of his metaphysics, mind and ethics by a leading scholar of medieval philosophy.
- **Jean-Pierre Torrell, *Saint Thomas Aquinas, Volume 1: The Person and His Work* (1993; English 3rd edn 2022).** The standard biography.
- **Anthony Kenny, *The Five Ways: St. Thomas Aquinas's Proofs of God's Existence* (1969).** The classic critical analysis of the Five Ways.
- **Robert Pasnau, *Thomas Aquinas on Human Nature* (2002).** A close study of the soul, mind and knowledge in the *Summa theologiae*.
- **John Finnis, *Aquinas: Moral, Political, and Legal Theory* (1998).** The "new natural law" reading of his ethics and politics.
- **David B. Burrell, *Knowing the Unknowable God: Ibn-Sina, Maimonides, Aquinas* (1986).** Aquinas in conversation with Muslim and Jewish thought.$aquinas_master$,
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
  select $aquinas_quiz$[
    {"type": "mcq", "prompt": "What did Aquinas conclude in On the Eternity of the World about whether the world had a beginning?", "options": ["That reason can prove the world began, as many of his contemporaries thought", "That Aristotle had proved the world eternal", "That no demonstration is possible either way, and the beginning is known by faith", "That the question is meaningless"], "answerIndex": 2, "explanation": "Aquinas held that neither the world's beginning nor its eternity can be demonstrated; the beginning is held by faith. Maimonides had reached the same verdict.", "id": "q1"},
    {"type": "mcq", "prompt": "In On Being and Essence, which stage of Aquinas's argument do Joseph Owens and John Wippel agree proves only a conceptual, not a real, distinction between essence and existence?", "options": ["The first stage: we can understand what a phoenix is without knowing whether it exists", "The second stage: a being whose essence is its existence could only be one", "The third stage: there must be a cause that is existence alone", "None: they hold that no stage gives even a conceptual distinction"], "answerIndex": 0, "explanation": "Owens and Wippel read the first, 'understanding of essence', stage as yielding only a conceptual distinction; Patt, Kenny and Long think it proves a real one. Wippel then finds the second stage decisive, Owens only the third.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the status of the claim that Aquinas invented the principle of double effect?", "options": ["It is certain: he set out the principle's four conditions himself", "It was invented by Augustine, whom Aquinas followed", "It was first stated by Finnis in the twentieth century", "He is credited with introducing it in his discussion of self-defence, but whether he stated the principle as later formulated is disputed"], "answerIndex": 3, "explanation": "Aquinas is credited with introducing it (ST II-II q.64 a.7), but Mangan (1949) judged it 'not entirely clear' that he stated the principle, and its classic formulation is usually credited to Gury (1850). Augustine had condemned private self-defence.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the condemnations of 1277 is accurate?", "options": ["Tempier's list was drawn up entirely from Aquinas's writings", "Robert Kilwardby, himself a Dominican, issued separate prohibitions at Oxford on 18 March 1277", "Aquinas was alive and defended himself against the charges", "The condemnation was revoked in 1323 at his canonisation"], "answerIndex": 1, "explanation": "Kilwardby, a Dominican, prohibited thirty articles at Oxford on 18 March 1277. Aquinas had died three years earlier; how far Tempier's 219 theses touched him is disputed; and the Paris condemnation was declared not to apply to his teaching only in 1325, two years after his canonisation in 1323.", "id": "q4"},
    {"type": "open", "prompt": "Set out Aquinas's Second Way step by step. Then explain the objection that causes can disappear while their effects remain, and the reply based on the difference between per se and per accidens series. Is the reply decisive?", "rubric": "A strong answer gives the steps: there are orders of efficient causes; nothing causes itself; so the order is either infinite or has a first cause; in an ordered series the first causes the intermediate, which cause the last, and removing a cause removes its effect; an infinite series has no first member and so no effects; but there are effects; so there is a first cause, which 'everyone' calls God. It states the objection (a sculpture outlives its sculptor; a dog its parents), notes that Aquinas did not think an infinite series of past causes could be shown impossible, and explains that the argument concerns simultaneous, essentially ordered (per se) causes, such as a hand moving a stick moving a stone. Credit discussion of whether the reply works: Oberle's objection that an infinite essentially ordered series is not shown impossible, Cameron's vicious-regress reply, and the question whether the per se distinction begs the question; also the objection that a first cause falls short of God.", "id": "q5"},
    {"type": "open", "prompt": "Explain Aquinas's argument that the human intellect does not operate through a bodily organ, and why it led him both to insist that body and soul form one substance and to face the question whether a person survives death as a separated soul.", "rubric": "A good answer explains that the intellect grasps universals (what a cat is), while whatever receives forms in a bodily organ receives them as individual, so the intellect works without an organ; since a thing acts as it is, the soul is incorporeal and subsistent, and so incorruptible. It notes Pomponazzi's objection that thought needs mental images and so the brain. It explains the unitarian thesis: the soul is the single substantial form of the body, otherwise a human would be one only 'like a heap'. It then sets out the separated-soul debate: Aquinas says the soul's life does not suffice for Abraham's being alive and that 'my soul is not I'; corruptionists (Toner and others) conclude that the person does not survive as a separated soul, survivalists (Stump and others) reject this. Credit mention of the argument against Averroes' single intellect.", "id": "q6"}
  ]$aquinas_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/aquinas', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
