-- Jewish Philosophy: from Saadia to Maimonides — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/jewish-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/jewish-philosophy',
    'research',
    'advanced',
    'read',
    $jewish_master$> **Philosophy inside a faith, written in Arabic with Hebrew letters.** This chapter follows the medieval Jewish thinkers who asked how the God of the Bible relates to the God of the philosophers. It begins with Saadia Gaon, who defended rabbinic Judaism in the style of Islamic rational theology and tried to prove that the world was created; turns to the Neoplatonist Solomon ibn Gabirol and to Judah Halevi, who turned philosophy's weapons against it; and centres on Maimonides' *Guide of the Perplexed*: his step-by-step case that nothing positive can be said of God's essence, his verdict that neither creation nor eternity can be proved, and his account of prophecy. It ends with Gersonides, who thought reason could go further, and Hasdai Crescas, who attacked the Aristotelian framework itself.

## A Tradition That Began Again in Arabic

Jewish philosophy had an ancient forerunner. Philo of Alexandria (c. 20 BCE – c. 50 CE), who read the Bible in Greek, interpreted scripture so freely through Greek philosophy that his name "has almost become a byword for allegory", and he is counted the founder of *negative theology*, the view that we can say only what God is not, within the monotheistic faiths. The medieval tradition, however, began afresh, some nine centuries later, in Arabic.

Most medieval Jews lived in the Islamic world, and wrote in Judaeo-Arabic: Arabic in Hebrew characters, with words from Jewish tradition mixed in. Two Islamic models of inquiry shaped them: *kalām*, rational theology, especially that of the Muʿtazilites, who tried to show that revelation agrees with reason; and *falsafa*, philosophy in the Greek manner, which read Aristotle through the Neoplatonism described in *Plotinus and Neoplatonism*. Saadia worked in the first style, Maimonides in the second. *Falsafa: al-Kindī, al-Fārābī and Avicenna* and *Al-Ghazālī, Averroes and the Quarrel over Reason* tell the Islamic side; the History chapters *The Rise of Islam and the Caliphates* and *The Islamic Commercial Revolution (800–1200)* describe the world of al-Andalus and Fustat behind these books.

## Saadia Gaon: Reason, Tradition and Creation

Saʿadya ben Yosef (in Arabic Saʿīd ibn Yūsuf al-Fayyūmī) was born in the Fayyūm in Egypt in 882 (some sources say 892) and died in Iraq in 942. At twenty-three he wrote against the followers of Anan ben David, founder figure of the Karaites, a movement that sought to base Jewish law on the Hebrew Bible alone and discard the rabbis' oral tradition, the Mishnah and Talmud. He settled in Baghdad in 922 and in 928 became Gaon, head of the academy of Sura, though he came from none of the prestigious Babylonian families; expelled in 932 after a conflict with the Exilarch, he was later restored. He translated the Torah into Arabic and was the first important rabbinic figure to write extensively in Judaeo-Arabic.

His *Book of Beliefs and Opinions*, completed in 933, has been called the greatest achievement of Jewish *kalām*. It aimed to show that Judaism meets the highest intellectual standards, to defend the oral tradition against the Karaites, and to help believers troubled by doubt. Saadia counted four sources of knowledge: the senses, reason, inference and reliable tradition. Tradition (Arabic *al-khabar*, "report") was not second-class: God had "prepared in our minds a place for the acceptance of reliable tradition", and a reliable report is certain to whoever receives it. This mattered, since revelation reaches most people as a report. Reason knows some moral truths directly, such as approval of truthfulness, so Saadia divided the commandments into "rational" ones, like honouring parents, and "revealed" ones, like the food laws, whose reasons may later be found.

He defended human freedom on the Muʿtazilite pattern: "Man cannot be considered as the agent of an act unless he exercises freedom of choice in performing it"; God's foreknowledge, being outside time, does not cause what we do. He read the Bible's bodily language about God as figurative, and ran God through Aristotle's ten categories to show that none applies: a negative theology of his own, long before Maimonides.

Above all Saadia argued that the world was created from nothing. His four proofs were borrowed, as Herbert Davidson showed, from the Christian philosopher John Philoponus, whom he does not name. The world is finite, so it had a beginning. Everything is composed of parts, "signs of the handiwork of a Maker". The accidents of things, their passing qualities, require a force outside them. And time cannot be endless: "If time was endless, the present would not be able to exist since the actual moment would not have been able to traverse infinity." He then refuted twelve rival accounts of the world's origin, a Platonist view in which the Creator works with co-eternal spiritual beings, and the doctrine of the world's eternity, among them. Creation was the foundation of everything: "there is no means of proving the existence of a Creator other than that of creation."

That sentence is where Maimonides would part company with him: if the proofs of creation fail, a theology built on them falls too.

## Neoplatonists of the West: Ibn Gabirol

A second current flowed from Neoplatonism. Isaac Israeli, a tenth-century physician to the Fatimid court in North Africa whose dates are disputed, was one of the earliest Jewish Neoplatonists.

Solomon ibn Gabirol was born in Málaga around 1021/2 and most likely died in Valencia around 1057/8, though other dates are proposed. A great poet, he wrote the *Keter Malkhut* ("Kingdom's Crown"), still in many prayer books for Yom Kippur. His philosophical dialogue, the *Fountain of Life*, was written in Arabic, but the original is lost except for fragments; it survives in a twelfth-century Latin translation. Its central doctrine is *universal hylomorphism*. Hylomorphism, from the Greek for matter and form, is Aristotle's analysis of bodies; Gabirol held that everything except God, soul and intellect included, is made of matter and form. He gave a central place to God's Will; whether this Will replaces emanation or works through it is debated.

The book had a strange afterlife. Latin readers knew its author as "Avicebron" and took him for a Muslim or a Christian; Franciscans used him against Dominicans such as Aquinas (see *Thomas Aquinas*). Only in 1846 did Salomon Munk, comparing a Hebrew abridgement with the Latin, show that Avicebron was Ibn Gabirol. In the same Andalusian world Bahya ibn Paquda's *Guidance to the Duties of the Heart* (around 1080) urged Jews who kept the outward "duties of the limbs" not to neglect the inward ones.

```checkpoint
q: Why did Saadia Gaon treat reliable tradition as a genuine source of knowledge?
a*: Because God prepared the mind to accept reliable reports, which are certain to those who receive them, and revelation reaches most people as a report.
a: Because he thought reason was unreliable and should be replaced by tradition.
x: He counted reason as a source of knowledge alongside the senses, inference and tradition.
a: Because he agreed with the Karaites that only the written Bible counts.
x: He fiercely defended the oral tradition against the Karaites.
a: Because he took the idea from Maimonides' Guide.
x: Saadia died in 942, long before Maimonides was born.
hint: Think of how the revelation at Sinai reaches a believer centuries later.
why: Saadia listed four sources of knowledge (senses, reason, inference, tradition), and held that God made a place in our minds for reliable tradition.
---
q: What is distinctive about Solomon ibn Gabirol's "universal hylomorphism"?
a: It holds that only bodies are made of matter and form, while souls are pure form.
x: That is the view Gabirol rejected; he extended matter to the spiritual world.
a: It holds that God too is composed of matter and form.
x: The doctrine covers everything other than God.
a*: It holds that everything other than God, including soul and intellect, is composed of matter and form.
a: It holds that matter does not exist at all.
x: Gabirol made matter present at every level of creation.
hint: The word "universal" is doing the work.
why: Gabirol applied Aristotle's analysis of bodies into matter and form to all created things, even intellectual ones.
```

## Judah Halevi: the God of Abraham and the God of Aristotle

Judah Halevi, born probably in Tudela in the 1070s or early 1080s, was a physician and one of the greatest Hebrew poets. His philosophical work, in Judaeo-Arabic, bears a polemical title: *The Book of Refutation and Proof on Behalf of the Despised Religion*, known as the *Kuzari*. Recent study of letters in the Cairo Geniza suggests he wrote it quickly, shortly before 1140, not over many years as older scholarship held.

It is a dialogue set at the court of a king of the Khazars, a people reported to have converted to Judaism, in the Jewish year 4500 (739–740 CE). Troubled by a repeated dream, the king summons a philosopher, a Christian, a Muslim and finally a Jewish sage, the *Ḥaver*, whose conversation with him fills most of the book. Ehud Krinis reads this frame as a "cover story" aimed at Halevi's real audience, the Jewish courtly elite of al-Andalus and its fascination with philosophy.

Halevi has been called the premier formulator of Jewish *fideism*, the view that religious truth rests on faith rather than proof. He turned the sceptic's tools on the philosophers: they disagree endlessly, and every argument they offer can be met by an equally strong one. Then he offered another foundation. At Sinai, the sage observes, God introduced himself not as "Creator of the world" but as the God "who brought you out of the land of Egypt": a historical event, witnessed by a whole people and handed down through many independent chains of transmission, not a truth reached by argument. Aristotle took the way of philosophy and Abraham the way of prophecy, and the king comes to see how far the God of Abraham differs from the God of Aristotle (4:15–16). Against al-Fārābī's account of prophecy as union with the cosmic Active Intellect, Halevi spoke of an "internal eye" and of "taste", terms from Sufi literature.

How far Halevi depended on al-Ghazālī is debated. He names only Greek philosophers, but attacks the doctrines of al-Fārābī, Avicenna and Ibn Bājja in al-Ghazālī's formulations, and Wolfson traced his critique of emanation to al-Ghazālī. Others stress his Sufi vocabulary and his specifically Jewish fideism, so how far he depended on al-Ghazālī remains debated.

The book ends not with the king's conversion but with the sage leaving for the Land of Israel. Halevi followed him: he reached Alexandria in September 1140, sailed for the Land of Israel in May 1141, and probably died there that summer, as Geniza letters suggest. The story that an Arab horseman trampled him at the gates of Jerusalem is a legend first recorded some 450 years later.

## Maimonides: from Córdoba to Fustat

Abraham ibn Daud (c. 1110 – c. 1180), who worked in Toledo, is considered the first Aristotelian in medieval Jewish philosophy, and Maimonides followed him in many ways on prophecy. But it was Moses ben Maimon, Maimonides, who made Aristotelian philosophy central to Judaism. He was born in Córdoba in 1138 (older books say 1135). When the Almohads took Córdoba in 1148 and offered non-Muslims conversion, exile or death, his family wandered for years, reaching Fez in 1160. After a brief stay in the Land of Israel they reached Egypt in 1166, and he eventually settled in Fustat. When his brother David, a merchant who supported the family, was lost at sea on a voyage to India, Maimonides lived as a physician, serving at the court of Saladin's Egypt in the household of the vizier al-Qāḍī al-Fāḍil, and at times led Egypt's Jewish community. He died in Fustat in 1204; tradition says he was buried in Tiberias, though there is no contemporary evidence that his body left Egypt.

His *Commentary on the Mishnah* (finished 1168) set out thirteen principles of faith, among them God's existence, unity and incorporeality, prophecy and the resurrection of the dead: the first attempt to give Judaism articles of faith, and the start of a lasting controversy. His *Mishneh Torah*, fourteen volumes in Hebrew, organised the whole of Talmudic law and argued that every law has a rational purpose. The *Guide of the Perplexed*, completed in 1190 in Judaeo-Arabic, is ostensibly a letter to an advanced student torn between philosophy and his religion. It is at once a commentary on the biblical words that seem to give God a body, a defence of negative theology, a critique of *kalām*, and a treatment of creation, prophecy, providence and law, steeped in the Neoplatonised Aristotle of al-Fārābī, Avicenna and al-Ghazālī. Maimonides acquired Averroes' commentaries around this time, but whether they shaped the *Guide* itself is debated.

{{image: The Guide for the Perplexed | A draft page of the Guide in Maimonides' own hand, Arabic written in Hebrew letters, preserved in the Cairo Geniza.}}

The driving concern is idolatry. Read literally, the Bible gives God a body, which for Maimonides amounts to worshipping something that is not God. His rule of interpretation is bold: if a reading attributes to scripture a doctrine that has been demonstrated false, the reading is wrong; had science demonstrated that the world is eternal, scripture would have to be reinterpreted.

## What Cannot Be Said of God

Maimonides' proofs that God exists, versions of the cosmological argument (see *God: Arguments For and Against*), reason from the eternal motion of the heavens to an infinite power that is "neither a body nor a force in a body". They show *that* God is. Can we know *what* God is? His answer gave negative theology, which he did not invent, its most rigorous medieval form.

1. God is absolutely one: "no multiplicity should be posited in Him; there is no notion that is superadded to His essence" (*Guide* 1.52). In God, essence and existence are identical.
2. A God composed of distinct elements would need something to bring and hold them together: a cause prior to God, which is absurd. Nor can God belong to a genus, as humans belong to the genus animal, for then something would be wider than God. So God cannot be defined.
3. Nothing created can be put "on the same scale" as God: God's power, knowledge and life are not larger versions of ours. Words applied to God and to us are therefore *completely equivocal*, that is, they share only the sound, like "bank" for a river and a building, not a meaning, whether the same or analogous.
4. Every positive attribute, such as "wise", "powerful" or "living" understood as a quality God has, would either add plurality to God's essence or compare God with creatures.
5. Therefore God "cannot have an affirmative attribute in any respect" (1.58).

```quote
"Know that when you make an affirmation ascribing another thing to Him, you become more remote from Him in two respects: one of them is that everything you affirm is a perfection only with reference to us, and the other is that He does not possess a thing other than His essence."
Maimonides · The Guide of the Perplexed 1.59 (trans. Shlomo Pines) · 1190
```

What language is left? Two kinds. The first is *attributes of action*: "Every attribute that is found in the books of the deity ... is therefore an attribute of His action and not an attribute of His essence" (1.53). "God is merciful" describes the effects of God's activity, such as the careful ordering of an embryo's growth, not an emotion in God, just as fire softens wax, hardens clay, blackens and whitens without being soft, hard, black or white. Moses, asking to see God's glory (Exodus 33), was shown God's "back", the effects, not the "face", the essence. The second kind is *negation*. "God is powerful" means that God is not lacking in power, and does not possess it in any way comparable to anything else. Negations paint no false picture: "the more you can prove inapplicable to God, the better". Even negation falls short, and the last word, citing Psalm 65, is silence: "when the tongues aspire to magnify Him by means of attributive qualifications, all eloquence turns into weariness and incapacity!" Prayer remained obligatory, its words read as negations or attributes of action.

**The objection.** If "knows" said of God shares nothing whatever with "knows" said of us, we cannot even say that God knows rather than does not know; the conception left is too thin for the ordinary worshipper, and to an atheist it has no content at all, as Seeskin puts the worries of a traditional theist and of a sceptic. Within the Jewish tradition, Gersonides rejected Maimonides' negative way, and Hasdai Crescas, who at first defended Maimonides against Gersonides, came to hold that divine and human attributes are "common in essence but divergent in quantity": the same in kind, but perfect and infinite in God.

**The reply.** Maimonides can answer in three steps. First, we still know *that* God is, and speaking of what God causes is a meaningful way to speak of God. Second, negations are not empty: each one removes an error, and the more of them we grasp, the closer our apprehension. Third, the paradoxes the objector worries about arise only when we treat the words as shared. On God's knowledge he is explicit: "between our knowledge and His knowledge there is nothing in common, as there is nothing in common between our essence and His essence" (3.20). The puzzle of how God can know in advance what we freely choose arises only if God's "knowing" is like ours. On Kenneth Seeskin's sympathetic reading, what survives is a Socratic insight: the wise recoil in awe and humility before what they cannot fathom.

## Creation or Eternity?

Maimonides rejected the *kalām* method, Saadia's method, of proving creation first and then inferring a Creator. Beginning in *Guide* 2.13 he sets out three views. On the view of Moses, God created the world from nothing, with a first moment. On the view of Plato, God created it with a first moment but from matter that already existed. On the view of Aristotle, the world is eternal. (Seeskin notes that these labels are neither precise nor historically accurate.)

His verdict, like Aquinas's later, is that neither creation nor eternity can be demonstrated; one can only tip the scales. Aristotle's arguments fail. The argument from nature, that every change comes from something, assumes that a thing's origin obeys the laws of its later development, which need not be so. The argument from God, that a perfect being cannot begin to act without changing, fails because a perfect will can include something new in its original intention: changing one's will is not the same as willing a change. On the other side, the speeds and order of the heavenly spheres look chosen rather than necessary, and it is hard to see how such complexity could flow by necessity from an utterly simple first cause. None of this is a demonstration. But a God without free will could issue no commandments, and creation does less violence to scripture. So Maimonides prefers the view of Moses, while counting Plato's acceptable. One tension remains: if God is simple, God's will is identical with God's wisdom, which pushes back towards necessity, a question the *Guide* never settles.

## Prophecy

Prophecy, for Maimonides, is "an overflow overflowing from God ... through the intermediation of the active intellect" (the cosmic intelligence that, in the philosophy he inherited, brings human minds to understanding), and the highest perfection a human can reach. In *Guide* 2.32 he sets out three opinions, comparing them with the three on creation. The common view is that God can make anyone a prophet. The philosophers' view is that prophecy is a natural perfection of intellect, imagination and character, so that a perfected person necessarily prophesies. The view of "our Law" agrees with the philosophers "except in one thing": someone fit and prepared may still not become a prophet, because of the divine will. Scholars call this the "divine veto". When the overflow reaches the intellect alone, the result is a speculative thinker; when it reaches intellect and imagination, a prophet. Moses was an exception, his prophecy wholly intellectual. How naturalistic this account really is, and what the veto amounts to, remain open questions.

## Reading the *Guide*: Contradictions and Secrets

Jewish law forbade public teaching of the "Account of the Beginning" and the "Account of the Chariot", which Maimonides identified with physics and metaphysics. His introduction says the contradictions in the *Guide* stem from the needs of teaching and from very obscure matters, where "the vulgar must in no way be aware of the contradiction". Leo Strauss (1952) built on this an esoteric reading: the more evidence Maimonides presents for a view, the less likely he held it, so that his real position on creation might be Aristotle's. Lately that reading has lost favour (Davidson, Ivry, Ravitzky, Seeskin), though most agree he scattered topics deliberately. Scholars have defended nearly every option on creation, from the explicit view of Moses to a secret Aristotle or a real Plato, and Josef Stern reads the *Guide* as fundamentally sceptical.

The book was translated into Hebrew twice soon after it was written, and into Latin in the thirteenth century. It was also dangerous. In 1232 rabbis led by Jonah Gerondi and Solomon ben Abraham of Montpellier banned the study of philosophy, the *Guide* included, and Dominicans confiscated and burned Maimonides' books (in 1232 or 1233), reportedly at the instigation of anti-Maimonideans, though the details remain unclear.

```checkpoint
q: Which statement best describes Maimonides' "attributes of action"?
a: They are positive qualities that exist in God's essence alongside God's wisdom.
x: Maimonides denies that God has any positive essential attribute.
a*: They describe the effects of God's activity in the world, not anything in God's essence.
a: They are the actions God commands humans to perform.
x: They describe what God does, not what God commands.
a: They are metaphors Maimonides thought should be removed from prayer.
x: He kept daily prayer obligatory, reading its words as negations or attributes of action.
hint: Remember the fire that softens wax and hardens clay.
why: "God is merciful" describes what God's activity produces; like fire, God produces varied effects without having those qualities.
---
q: What did Maimonides conclude about the creation or eternity of the world?
a: That Aristotle had demonstrated the world's eternity.
x: He argued that Aristotle's arguments for eternity fail.
a: That Saadia's kalām proofs had demonstrated creation.
x: He rejected the kalām method of proving creation first.
a: That the question was religiously unimportant.
x: He thought creation mattered because a God without free will could issue no commandments.
a*: That neither could be demonstrated, but the balance tilts towards creation.
hint: He speaks of "tipping the scales".
why: Neither side has a demonstration; the apparent choice in the heavens and the needs of the Law tip the balance towards the view of Moses.
```

## Gersonides: Reason Without Retreat

Levi ben Gershom, Gersonides, was born in Provence in 1288, lived mostly in Orange, and died in 1344. Writing in Hebrew, he knew Aristotle through Averroes' commentaries, and was the first Jewish philosopher to use the analytic method of the scholastics. He was also an astronomer, who invented an instrument for measuring the height of stars that Christians called "Jacob's staff". His *Wars of the Lord*, completed in 1329, treats immortality, prophecy, God's knowledge, providence, astronomy and creation. Against Maimonides he held that creation can be demonstrated, on an "unambiguously Platonic" model: a free agent shaped the world from eternal formless matter.

```quote
"the Law cannot prevent us from considering to be true that which our reason urges us to believe."
Gersonides · The Wars of the Lord · 1329
```

His most notorious argument concerns God's knowledge of future contingents, events such as human choices that may or may not happen.

1. If God knows in advance which of two possible outcomes will occur, that outcome is no longer contingent: such knowledge rules out contingency. (Here he rejects Maimonides' claim that God's knowledge does not necessitate what it knows.)
2. There is real contingency in the world, above all human choice, which the Torah's commands presuppose.
3. God's knowledge is perfect, and it is no defect to fail to know as settled what is not in fact settled.
4. Therefore God knows particulars only "insofar as they are ordered": God knows the general order, and knows that certain outcomes may or may not be realised, but not which one will be.

He presented this as a middle way between Aristotle, for whom God does not know particulars, and Maimonides, for whom God does. The objection is obvious, and one opponent made it by renaming the book "Wars *against* the Lord": a God who does not know what you will choose seems diminished, and individual providence and prophecy seem lost. Gersonides replied that God knows contingents perfectly, *as* contingents, since the order God knows is the whole intelligible content of things; prophecy gives general knowledge that the prophet applies to particulars; and providence is general, reaching individuals in proportion to their intellectual perfection, as members of a kind. Maimonides had dissolved the problem by calling "knowledge" equivocal; Gersonides, refusing that move, accepted a limit instead.

## Crescas and After

Hasdai Crescas (c. 1340 – 1410/11), rabbi of Saragossa, planned his *Light of the Lord* as an attack on the *Guide*, criticising fourteen of the twenty-six Aristotelian premises behind Maimonides' proofs. He argued that an actual infinite is possible and that choice is compatible with an uncompromising determinism (see *Free Will and Determinism*). Philosophy, he held, can prove a simple first cause but not the God of the Bible.

The tradition did not stay within Judaism. Maimonides influenced Aquinas, Spinoza, Leibniz and Newton; Gersonides' ideas reached Spinoza and Leibniz through Crescas and others; Crescas influenced Pico della Mirandola. The sources name no woman philosopher in this tradition, though Hebrew translation preserved one argument about women: Averroes' commentary on Plato's *Republic*, which held that women can be philosophers and rulers, has lost its Arabic original and survives through a Hebrew translation. The story continues in *Thomas Aquinas*, *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne* and *Spinoza*; for a naturalist like Spinoza, Maimonides was too ready to fall back on creation and the divine will.

## Further exploration

- **Colette Sirat, *A History of Jewish Philosophy in the Middle Ages* (1985).** The standard survey, from Saadia to the fifteenth century.
- **Herbert A. Davidson, *Moses Maimonides: The Man and His Works* (2005).** A detailed life and works, sceptical of esoteric readings.
- **Sarah Stroumsa, *Maimonides in His World: Portrait of a Mediterranean Thinker* (2009).** Maimonides in his Islamic context, including Almohad theology.
- **Moshe Halbertal, *Maimonides: Life and Thought* (2014).** Reads Maimonides' law and philosophy together.
- **Josef Stern, *The Matter and Form of Maimonides' Guide* (2013).** The case for a sceptical reading of the *Guide*.
- **Raymond P. Scheindlin, *The Song of the Distant Dove: Judah Halevi's Pilgrimage* (2008).** Halevi's last years, through his poems and Geniza letters.
- **Seymour Feldman, *Gersonides: Judaism within the Limits of Reason* (2010).** An introduction to Gersonides.$jewish_master$,
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
  select $jewish_quiz$[
    {"type": "mcq", "prompt": "Which of these did Saadia Gaon count among the four sources of knowledge?", "options": ["Reliable tradition", "Mystical union with the Active Intellect", "Dreams", "The authority of Aristotle"], "answerIndex": 0, "explanation": "Saadia listed sense perception, reason, inference and reliable tradition; God, he said, prepared a place in our minds for accepting reliable tradition.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Maimonides, what does a sentence such as \"God is merciful\" actually describe?", "options": ["An emotion God feels towards creatures", "A quality God shares with humans in a higher degree", "The effects of God's activity, not anything in God's essence", "Nothing at all, so it should be dropped from prayer"], "answerIndex": 2, "explanation": "It is an attribute of action: like fire that softens wax and hardens clay without being soft or hard, God produces effects we call merciful without having an emotion. Prayer remained obligatory, read in this way.", "id": "q2"},
    {"type": "mcq", "prompt": "In Maimonides' three views of creation, what distinguishes the view he attributes to Plato?", "options": ["The world is eternal and uncreated", "The world was created with a beginning, but from pre-existing matter", "The world was created from nothing", "The world is re-created at every moment by God"], "answerIndex": 1, "explanation": "Moses: created from nothing with a beginning; Plato: created with a beginning from pre-existing matter; Aristotle: eternal. Maimonides preferred Moses and counted Plato's view acceptable.", "id": "q3"},
    {"type": "mcq", "prompt": "What was Gersonides' conclusion about God's knowledge of future contingents?", "options": ["God knows every future choice in detail, and this does not make it necessary", "God knows nothing about particular things at all", "The word 'knowledge' means something wholly different when said of God", "God knows the general order and which outcomes are possible, but not which will occur"], "answerIndex": 3, "explanation": "Since foreknowledge would destroy contingency, and real contingency exists, Gersonides held that God knows particulars only insofar as they are ordered: a middle way between Aristotle and Maimonides.", "id": "q4"},
    {"type": "open", "prompt": "Set out Maimonides' argument that no positive attribute can be ascribed to God's essence. Then state the objection associated with Gersonides and Crescas, and say how Maimonides could reply.", "rubric": "A good answer gives the premises (God's absolute unity with nothing superadded to the essence; a composite God would need a prior cause; God falls under no genus and cannot be defined; nothing created is on the same scale as God, so terms are completely equivocal; positive attributes would add plurality or comparison) and the conclusion (no affirmative attribute; only attributes of action and negations; ultimately silence). It states the objection that wholly equivocal terms leave no content, and that Gersonides and later Crescas held divine and human attributes to be the same in kind, perfect and infinite in God. It gives a reply: we still know that God is; speaking of what God causes is meaningful; each negation removes an error; and puzzles such as foreknowledge and freedom arise only if God's 'knowledge' is treated as like ours (Guide 3.20).", "id": "q5"},
    {"type": "open", "prompt": "Compare Judah Halevi's and Maimonides' views of the relation between philosophy and revelation. Where would each locate the foundation of religious belief?", "rubric": "A good answer explains Halevi's fideism: the sceptical case against the philosophers (endless disagreement, counter-arguments of equal strength), the Sinai revelation as a historical event witnessed by a people and transmitted by many chains, and the contrast between the God of Abraham reached by prophecy and the God of Aristotle reached by intellect. It contrasts Maimonides' use of philosophy within religion: proving God's existence, reinterpreting scripture where a doctrine is demonstrated false, negative theology, and prophecy as a perfection of intellect and imagination subject to a divine veto. It may note the debate over Halevi's debt to al-Ghazālī and the esoteric debate over what Maimonides really held.", "id": "q6"}
  ]$jewish_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/jewish-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
