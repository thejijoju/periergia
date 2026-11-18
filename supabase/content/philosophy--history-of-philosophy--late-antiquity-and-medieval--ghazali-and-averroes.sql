-- Al-Ghazālī, Averroes and the Quarrel over Reason — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/ghazali-and-averroes @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/ghazali-and-averroes',
    'research',
    'advanced',
    'read',
    $ghazali_master$> **A quarrel about what reason can prove, not a war between faith and reason.** This chapter follows the most famous argument in Islamic philosophy. Al-Ghazālī's *Incoherence of the Philosophers* (around 1095) charged the philosophers with claiming demonstrations they did not have, and condemned three of their doctrines; its seventeenth discussion, on fire and cotton, denies that causes necessitate their effects. Averroes (Ibn Rushd) replied that the religious Law commands philosophy and that fire really burns. The chapter sets out both sides of the causation argument step by step, and introduces the theologians of *kalām*, Averroes' single intellect and his view that women share men's nature, Ibn Ṭufayl's philosophical novel *Ḥayy ibn Yaqẓān*, the Latin myth of a "double truth", and the tradition that continued after Averroes, against the old story that al-Ghazālī killed philosophy in Islam.

## A Quarrel Often Misread

The old story ran like this: a religious zealot, al-Ghazālī, wrote a pamphlet against philosophy; Averroes, the last great rationalist of Islam, answered him in vain; and reason then left the Islamic world for Christian Europe. Recent scholarship has revised almost every part of it. Frank Griffel, al-Ghazālī's leading modern interpreter, writes that the *Incoherence* "has long been misunderstood in Western literature as an anti-philosophical pamphlet from a religious zealot", largely because Europeans read it through Averroes' reply; its philosophical character was only acknowledged in the twenty-first century, after Michael Marmura's full English translation of 1997.

What actually happened was a quarrel among people who all valued reason, about what reason had proved. *Falsafa: al-Kindī, al-Fārābī and Avicenna* tells how *falsafa*, philosophy in the Greek manner, grew up in Arabic; for the political world behind it, see the History chapters *The Rise of Islam and the Caliphates* and *The Islamic Commercial Revolution (800–1200)*.

## The Theologians of Kalām

Al-Ghazālī belonged to another tradition, *kalām*: rational theology, the defence of doctrine by argument. Its practitioners mostly held that the world consists of atoms (indivisible particles) and accidents (passing qualities such as colour or heat), re-created by God at every moment, so that God is the immediate cause of every change.

The first great school, the Muʿtazila, flourished in Basra and Baghdad. Their five principles included God's unity and God's justice, and justice did real philosophical work: if God rewards and punishes us, we must produce our own actions, or the punishment would be unjust.

The school that prevailed was founded by al-Ashʿarī (874–936; one source gives 873–935), a former pupil of the Muʿtazilite al-Jubbāʾī. The Ashʿarites put divine omnipotence first. God produces every atom and accident; on the account al-Ghazālī gave, when I act God creates in me a momentary power for that act, but the power does not cause it, and I merely "acquire" (*kasb*) the act. Bodies have no natures of their own: God creates a new world every moment. This view is called *occasionalism*: creatures are only the occasions on which God acts, never true causes. All Ashʿarites up to al-Ghazālī's generation held some version of it. Al-Ghazālī was an Ashʿarite in theology and a Shāfiʿī in law.

## Al-Ghazālī's Life and the *Deliverance*

Abū Ḥāmid Muḥammad al-Ghazālī was born in Ṭabarān-Ṭūs, near modern Mashhad in north-eastern Iran, in 1055/56 or 1058/59: later medieval historians say 1058 or 1059, but remarks in his own letters and autobiography point to 1055 or 1056. He studied in Nishapur with the leading Ashʿarite al-Juwaynī (1028–85), and in 1091 the Seljuq vizier Niẓām al-Mulk appointed him to the Niẓāmiyya madrasa in Baghdad. In 1095 he suddenly gave up his posts. Under the influence of Sufi literature (the mystical tradition of Islam) he had come to believe that serving rulers made him complicit in corrupt rule. He vowed never again to serve the authorities and founded a small school and Sufi convent at home in Ṭūs. In 1106 he broke his vow to teach again in Nishapur, presenting himself as the "renewer" promised at the start of each Islamic century. He died in Ṭūs in December 1111. His most widely read work is the *Revival of the Religious Sciences*, in forty books.

His best-known book in the West, the late *Deliverance from Error*, tells how he fell into scepticism, doubting the senses and then even the first truths of reason, until after about two months he was cured not by proof but by "a light which God Most High cast into my breast"; and how he mastered the philosophers' sciences in under two years. Readers often compare it with Descartes (see *Descartes*). But it is no diary. Griffel calls its account of his philosophical studies "hardly credible" and "apologetic", designed to answer critics who said he had learned *falsafa* before his religious education was complete. He most probably met philosophy with al-Juwaynī, whose works already show Avicenna's influence, and the *Incoherence* may have been decades in the making.

## A Critic Who Championed Demonstration

The man who wrote against the philosophers was no enemy of logic. Against the Ismāʿīlīs, a rival movement who claimed that all rational proofs are equally balanced, he defended Aristotle's ideal of *demonstration* (*burhān*), proof from certain premises by valid steps: "A [valid] rational demonstration is never wrong." He wrote logic manuals, among them the *Standard of Knowledge* (*Miʿyār al-ʿilm*), and held that logic "does not conflict with religion".

He also gave theology a lasting rule: if a demonstration contradicts the literal sense of revelation, read the text allegorically (God's "hand" or "throne", for instance); where no demonstration disproves the literal sense, allegory is not allowed. Almost all later Muslim theologians accepted the rule, Averroes included; he disagreed only about what had been demonstrated. Griffel credits al-Ghazālī with beginning "the successful introduction of Aristotelianism or rather Avicennism into Muslim theology". He adopted Avicenna's psychology and account of prophecy almost wholesale, and Richard Frank judged that the Avicennan theses he rejected "are relatively tame and inconsequential compared to those in which he follows the philosopher".

## The *Incoherence of the Philosophers*

The *Incoherence* (*Tahāfut al-falāsifa*) has twenty discussions, sixteen on metaphysics and four on natural science, aimed chiefly at al-Fārābī (d. 950) and Avicenna (c. 980–1037). Its method is distinctive. Al-Ghazālī does not generally try to prove the opposite of each thesis; he argues, he says, "as one who demands and denies, not as one who claims [and] affirms", showing that no argument meets the philosophers' own standard of demonstration. Some positions he "refutes" he actually held true; he denied only that they had been proved.

The first and longest discussion attacks the eternity of the world. The philosophers argued that an eternal, unchanging divine will, with every condition for acting fulfilled, could not delay its effect, so the world must be as eternal as God. Al-Ghazālī replies that an eternal will can choose a moment, and, drawing on the Christian John Philoponus, he goes further than anywhere else in the book: he argues that an infinite past, and so an eternal world, is impossible.

At the end he judges seventeen theses mere "innovations" but three unbelief: that the world has no beginning in time; that God knows only universals, not particulars; and that there is no bodily resurrection. Whoever teaches these publicly, he rules, is an apostate who may be killed. This harsh verdict should not be softened, though in his later *Decisive Criterion* the eternity of the world no longer appears as a test of faith.

## Fire and Cotton: the Seventeenth Discussion

The seventeenth discussion, on causation, aims not to destroy natural science but to force the philosophers to admit that the miracles reported in the Qurʾān are possible. It opens with its thesis.

```quote
"The connection between what is habitually believed to be a cause and what is habitually believed to be an effect is not necessary, according to us."
al-Ghazālī · The Incoherence of the Philosophers, 17th discussion (trans. M. E. Marmura) · c. 1095
```

The connection, he continues, is due to God's prior decision, who creates the two side by side. His examples include drinking and quenching thirst, decapitation and death, and fire and the burning of cotton. The argument runs:

1. The philosophers claim that fire is a real agent that burns cotton by its nature, and that the connection is necessary: given contact, burning must follow.
2. Their only evidence that fire is the agent is that burning is observed when cotton touches fire.
3. But observation shows only that the two occur together, not that one produces the other: we see the cotton burn when it touches the fire, not the fire burning it.
4. A connection is necessary only if its failure is inconceivable; and we can conceive of fire touching cotton without burning it.
5. So the connection is not necessary, and nothing rules out that God, "either through the mediation of His angels or without mediation", is the one who blackens and consumes the cotton.
6. So miracles, in which the habitual sequence fails, are possible.

Step 4 marks a real difference. Avicenna, following an Aristotelian model, counted as necessary whatever always was, is and will be the case. Al-Ghazālī replaced this with a test of conceivability.

He then raises the strongest objection himself, in the philosophers' mouths. If nothing is necessarily connected, anything goes: a book left at home might have turned into a beardless slave boy or an animal, ashes into musk, stones into gold. We would have to face the world, as one modern scholar puts it, "with no expectations".

His reply is that God has created a regular order and follows it as a custom (*ʿāda*): "the continuous habit of their occurrence repeatedly, one time after another, fixes unshakably in our minds the belief in their occurrence according to past habit." Revelation adds that God's habit does not change. A miracle is God departing from His custom. In practice, Griffel notes, such a universe "will always remain indistinguishable from one governed by secondary causality", that is, by created causes that really act.

There is a twist. Al-Ghazālī offers a second answer: grant the philosophers their natures and fixed connections, and miracles may still have natural causes unknown to us. Moses' staff might have become a serpent through a rapid sequence of changes, from wood to earth to plants to animals, set off by some unknown agent. Marmura called this "al-Ghazālī's second causal theory". So the discussion gives at least two coherent responses, and only the first is occasionalist.

## Was al-Ghazālī an Occasionalist, and Was He Hume?

That second answer divides scholars. Marmura held that al-Ghazālī never deviated from Ashʿarite occasionalism, his talk of natural causes being ambiguous, perhaps borrowed language to lure the philosophers' followers; this was long the standard reading, though recent work has challenged it. Frank argued that his cosmos is essentially Avicenna's, with God acting through chains of secondary causes. Griffel argues that al-Ghazālī held both to be possible explanations and stayed undecided all his life: in the twentieth discussion he writes, "Both these two views are possible for us", and his last work says the question cannot be settled decisively. On this reading the seventeenth discussion targets not causation as such but Avicenna's picture of the world as a necessary effect of God's essence; al-Ghazālī's God chooses freely among possible worlds.

The discussion is often said to anticipate David Hume, whose analysis of causation is the subject of *Berkeley and Hume*. On one point the likeness is real: both argue that observation shows only that events go together, never a necessary connection, and both explain our expectations by repeated habit. The differences matter as much. Al-Ghazālī does not deny that connections exist, only that they are necessary. His argument is modal, about what God could have chosen, and theological, built to defend miracles; nature's regularity rests on God's unchanging custom, not on mere psychology. For Hume there is no such further ground, and he used his analysis to doubt reports of miracles. They are strikingly similar on one point and differently motivated, and there is no documented evidence that Hume knew al-Ghazālī's work. Nicholas of Autrecourt, apparently acquainted with al-Ghazālī's arguments, is the one usually called "the fourteenth-century Hume" (see *Scotus, Ockham and the Late Medieval Debates*). The chapter *Causation* takes up the problem itself.

```checkpoint
q: What was the main purpose of al-Ghazālī's seventeenth discussion, on fire and cotton?
a*: To force the philosophers to admit that the miracles reported in the Qurʾān are possible.
a: To show that natural science is worthless and should be abandoned.
x: He did not attack natural science as such; he objected to it only on certain points.
a: To prove that fire has no effect on cotton in ordinary experience.
x: He accepts that cotton habitually burns in fire; he denies only that the connection is necessary.
a: To argue that Avicenna's psychology was mistaken.
x: He adopted Avicenna's psychology almost wholesale.
hint: Think about what would be impossible if fire must burn whatever it touches.
why: The discussion attacks the necessity of causal connections so that God's departure from His habit, a miracle, becomes possible.
---
q: Which statement best describes Griffel's reading of al-Ghazālī on causation?
a: He was a strict occasionalist who never allowed any natural causes.
x: That is Marmura's reading, which Griffel disputes.
a: He accepted Avicenna's view that the world follows necessarily from God's essence.
x: Griffel insists that al-Ghazālī's God chooses freely; the necessitarian picture is what the seventeenth discussion attacks.
a*: He held occasionalism and secondary causality to be two possible explanations and remained undecided.
a: He took his argument from Hume.
x: Hume came centuries later, and the two arguments are differently motivated.
hint: Recall the twentieth discussion: "Both these two views are possible for us".
why: The seventeenth discussion offers two approaches, one occasionalist and one allowing natures, and his last work says the question cannot be settled decisively.
```

## Averroes: Judge, Physician, Commentator

Abū al-Walīd Muḥammad Ibn Rushd, Averroes in Latin, was born in Córdoba in 1126 and died in 1198, by one account in Marrakesh. He wrote no autobiography, and much of his life is obscure. Ibn Ṭufayl, whose work he read but whose disciple he was not, introduced him to the Almohad caliph Abū Yaʿqūb Yūsuf. The caliph wanted Aristotle made accessible, and Ibn Ṭufayl passed the task to him. He became judge of Seville in 1169, later chief judge of Córdoba and court physician, and wrote major works of law and medicine. In 1195 a tribunal in Córdoba condemned his teachings, ordered his books burned and banished him to Lucena, for reasons that remain unclear; he was restored to favour after a few years and died soon after.

## The *Decisive Treatise*: the Law Commands Philosophy

In 1178 or 1179 Averroes wrote the *Decisive Treatise*, a legal opinion aimed implicitly at al-Ghazālī's ruling. The Qurʾān commands reflection ("Reflect, you have a vision"); philosophy is nothing more than reflection on existing things as evidence of their maker; so the Law makes philosophy recommended or even obligatory. For those with the natural intelligence and religious integrity for it, studying the ancients is obligatory, whatever their religion. That philosophy sometimes harms people is accidental, like choking on water, which is no reason to forbid drinking.

Following al-Fārābī, he distinguished three paths to assent: demonstration, for philosophers; dialectic, for theologians; and rhetoric, for most people. Allegorical interpretation belongs only to those capable of demonstration, and publishing such interpretations, as al-Ghazālī did in the *Incoherence*, damages ordinary believers' faith. Beneath it lay one conviction.

```quote
"For truth does not oppose truth, but rather agrees with and bears witness to it."
Averroes · Decisive Treatise §12 · 1178/9
```

Whether he ranked philosophy above religion is debated: since Ernest Renan in 1852 many have treated his commentaries as his true view and his religious treatises as popular, while others defend the unity of his work.

## Fire Burns: the *Incoherence of the Incoherence*

In 1180 or 1181 Averroes answered al-Ghazālī discussion by discussion in the *Incoherence of the Incoherence*. Aristotle, he held, had demonstrated the world's eternity, so by al-Ghazālī's own rule it should be accepted; God knows the world "in his own manner, neither in universal nor particular", as its cause; and he refused to endorse bodily resurrection.

On causation his reply has three steps. First, natural things such as fire really are causes. Second, al-Ghazālī misreported the philosophers, who never held that fire burns whatever it touches without qualification: things act through one relation out of an infinite number, and one relation often hinders another, as talc can protect a body from fire. "But one need not therefore deny fire its burning power so long as fire keeps its name and definition." So contact with fire, without impediments, necessarily produces burning. Third, natural science exists, and knowledge of nature just is knowledge of natural causes; whoever denies them "denies with his tongue what is present in his mind".

The objection is that this may miss its target. Al-Ghazālī's test of necessity was conceivability, and we can conceive of fire failing to burn unprotected cotton as easily as protected cotton; adding "no impediments" does not make the failure unthinkable. His argument from observation may also leave fire a cause that does not itself act, which insisting on its "burning power" does not refute. The deepest disagreement, scholars conclude, is theological, about miracles and the reach of divine power.

## The Single Intellect

Averroes' European fame rests on his commentaries on nearly all of Aristotle, described in *Aristotle*. He fought what he saw as Neoplatonic readings of Aristotle (see *Plotinus and Neoplatonism*) and wrote that in nearly 1,500 years no one had added a word worthy of attention to what Aristotle said. Contrary to a common claim, most of his works survive in Arabic: of forty-nine in the Stanford Encyclopedia's list, fourteen are not extant in Arabic.

His most controversial thesis, in the Long Commentary on Aristotle's *On the Soul*, is that the receptive or "material" intellect, the capacity that takes in universal concepts, is a single, separate, eternal substance shared by all human beings. He had once called the idea repulsive, and knew it was new: "I have not seen it in anyone else before me." It resolves a puzzle of three plausible claims that cannot all be true: humans think abstractly; no bodily thing can think abstractly; humans are bodily. Narrowly understood, a human being is bodily and does not think; understood broadly, as a person joined to the one separate intellect that is fed by that person's imagination, we do think. Why only one? Because an intellect divided up by bodies would receive only individualised forms, and without shared concepts no teacher could pass knowledge to a pupil. The Stanford Encyclopedia calls it "the first developed statement of the extended-mind thesis", the modern idea that the mind reaches beyond the individual body.

## Women in the *Republic* Commentary

Because Aristotle's *Politics* had not reached al-Andalus, Averroes commented on Plato's *Republic* instead, using it to criticise the Almohads; the commentary survives only in Hebrew, and *Plato* points to it. He holds that women share the same nature as men and are suited to the same activities, so they can be guardians, philosophers and rulers. He turns this against the cities around him, where "since women in these cities are not prepared with respect to any of the human virtues, they frequently resemble plants", and their being a burden on men is one cause of poverty. The fault, on this argument, lies in how such cities prepare women, not in women's nature.

## Ibn Ṭufayl's Philosophical Novel

Averroes' patron Ibn Ṭufayl (c. 1105–1185), born at Guadix near Granada and later vizier and physician to the caliph, wrote *Ḥayy ibn Yaqẓān*, "Alive, son of Awake". A child raised by a doe on an island reaches, by unaided reason, knowledge of nature and finally of God. Later he meets Absāl, and through him a religious community, but his attempt to teach its people fails, and he resigns himself to the fact that some people do not want to be intellectually challenged. Ibn Ṭufayl borrowed his title and characters' names from tales by Avicenna, and drew on Avicenna's "floating man", turning its sensory deprivation into social isolation. The novel illustrates al-Fārābī's view that religion's truths can be reached by reason, while most people need religious authority and its symbols.

{{image: Hayy ibn Yaqdhan | Frontispiece of Simon Ockley's English translation of Ibn Ṭufayl's novel, first published in 1708 (here from a 1929 reprint).}}

Edward Pococke the Younger published it in Latin as *Philosophus Autodidactus*, "the self-taught philosopher", in 1671, and Simon Ockley translated it directly from the Arabic into English in 1708.

## Latin Averroism and the Myth of Double Truth

By the 1270s "Averroist" was an insult in Latin Europe, aimed especially at the single intellect, the eternity of the world and determinism; Aquinas's *On the Unicity of the Intellect* (1270) contains the first known use of the word (see *Thomas Aquinas*). Bishop Tempier's condemnation of 1277 accused some masters of saying things were true in philosophy but not in faith, "as if there were two contrary truths". Hence the label "double truth". But scholars now agree that no medieval author held that two contradictory propositions can both be true; the charge caricatured the practice of judging a doctrine "philosophically speaking" and then from faith. Averroes himself held that truth does not oppose truth.

```checkpoint
q: How did Averroes answer al-Ghazālī on fire and cotton?
a: He agreed that God alone burns the cotton.
x: He insisted that natural things such as fire really are causes.
a*: He held that fire really burns, though impediments such as talc can block it, so contact without impediments necessarily produces burning.
a: He argued that fire burns only when observed.
x: Nothing in his reply makes burning depend on an observer.
a: He accepted al-Ghazālī's test of conceivability and drew the same conclusion.
x: His critics say precisely that he did not answer that test.
hint: Remember "so long as fire keeps its name and definition".
why: Averroes said the philosophers never claimed fire burns without qualification; one relation can hinder another, but fire keeps its burning power.
---
q: Which statement about the "double truth" is accurate?
a: Averroes taught that philosophy and religion can both be true while contradicting each other.
x: Averroes held the unity of truth: "truth does not oppose truth".
a: Al-Ghazālī invented it in the Incoherence.
x: The phrase comes from the Latin West, not from al-Ghazālī.
a: Siger of Brabant wrote a treatise defending it.
x: Scholars agree no medieval author held the doctrine.
a*: It was Bishop Tempier's caricature in 1277; no medieval author is known to have held it.
hint: Ask who used the phrase, and against whom.
why: Tempier accused some masters of speaking "as if there were two contrary truths"; modern scholars agree nobody actually held that contradictory propositions can both be true.
```

## After Averroes: a Tradition That Continued

Steven Weinberg wrote in 2007, in the *Times Literary Supplement*, that al-Ghazālī argued "against the very idea of laws of nature" and that after him "there was no more science worth mentioning in Islamic countries". Few specialists accept this. Griffel is sharper: "If al-Ghazālī tried to establish thought-police in Islam, he remained unsuccessful. There was simply no Inquisition in Islam."

The newer scholarship sees transformation, not decline. Al-Ghazālī's *Doctrines of the Philosophers*, a summary of Avicenna, became the nucleus of a genre called *ḥikma*, "wisdom", in which theologians presented, criticised and improved philosophy. Dimitri Gutas has argued that the golden age of Arabic philosophy ran to about 1350; George Saliba argues that the centuries after al-Ghazālī were the most creative in Arabic astronomy, associated with Maragha (see *The Scientific Revolution*), though reviewers have questioned how far his story of continued creativity can be generalised.

The figures are formidable. Fakhr al-Dīn al-Rāzī (1149–1210), an Ashʿarite, criticised Avicenna on nearly every point. Suhrawardī (c. 1154–1191), the "Master of Illumination", offered a Platonic critique of Avicenna built on an ontology of lights, and was executed after accusations of heresy. Naṣīr al-Dīn al-Ṭūsī (1201–1274) defended Avicenna against al-Rāzī. Ibn Taymiyya (1263–1328) rejected al-Ghazālī's rule of interpretation and attacked Aristotelian logic: the syllogism is valid but unnecessary, its elaborate figures "lean camel meat on a rugged mountain peak". Ibn Khaldūn (1332–1406), trained in philosophy and logic, criticised philosophy in a line descending, on one account, from al-Ghazālī and al-Rāzī.

Nor was Averroes forgotten. The claim that he had no influence on Islamic thought is false: he had thirty-nine direct disciples, was read in North Africa, was used extensively by Ibn Taymiyya, and was copied in Safavid Iran in the sixteenth and seventeenth centuries, though his influence cannot compare with Avicenna's. Maimonides acquired his commentaries, launching four centuries of Jewish interest (see *Jewish Philosophy: from Saadia to Maimonides*). The line runs on to Mullā Ṣadrā (c. 1571–1636), arguably the most significant Islamic philosopher after Avicenna, in *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*.

Both men thought a valid demonstration could not be wrong. They disagreed about what had been demonstrated, what necessity means, and how free God is to act otherwise than nature does: questions taken further in *God: Arguments For and Against*.

## Further exploration

- **Frank Griffel, *Al-Ghazālī's Philosophical Theology* (2009).** The standard modern study, arguing that al-Ghazālī left occasionalism and secondary causes undecided.
- **Al-Ghazālī, *The Incoherence of the Philosophers*, trans. Michael E. Marmura (1997; 2nd ed. 2000).** The primary text in a parallel Arabic–English edition.
- **Edward Omar Moad, *Coherence of the Incoherence: Between Al-Ghazali and Ibn Rushd on Nature and the Cosmos* (2023).** The two *Incoherences* read side by side.
- **Averroes, *The Book of the Decisive Treatise*, trans. Charles E. Butterworth (2001).** Averroes' case that the Law commands philosophy.
- **Averroes, *Long Commentary on the De Anima of Aristotle*, trans. Richard C. Taylor with Thérèse-Anne Druart (2009).** The source of the single-intellect thesis.
- **Frank Griffel, *The Formation of Post-Classical Philosophy in Islam* (2021).** The rise of the *ḥikma* genre and the case against the decline story.
- **Peter Adamson, *Philosophy in the Islamic World* (2016).** An accessible survey from al-Kindī to the modern period, including Andalusia and the later traditions.$ghazali_master$,
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
  select $ghazali_quiz$[
    {"type": "mcq", "prompt": "Which three doctrines did al-Ghazālī, at the end of the Incoherence of the Philosophers, judge to be unbelief rather than mere innovation?", "options": ["That the world has no beginning in time, that God knows only universals and not particulars, and that there is no bodily resurrection", "That logic is valid, that mathematics is certain, and that the soul is immaterial", "That the Qurʾān is created, that humans produce their own acts, and that God is just", "That fire burns cotton, that the heavens move, and that the stars influence events"], "answerIndex": 0, "explanation": "He judged seventeen theses innovations but three unbelief: the world's eternity, God's knowing only universals, and the denial of bodily resurrection. He accepted logic and mathematics, and the created Qurʾān was a Muʿtazilite doctrine.", "id": "q1"},
    {"type": "mcq", "prompt": "Why should al-Ghazālī's Deliverance from Error be read with caution as autobiography?", "options": ["It was written by one of his students after his death", "It survives only in a Latin translation", "Griffel calls its account of his philosophical studies 'apologetic', shaped to answer critics, and his own remarks on his age conflict with the historians' birth date", "It was written before he had read any philosophy"], "answerIndex": 2, "explanation": "The Deliverance was written late in life by al-Ghazālī himself; Griffel finds its two-year account of his philosophical study 'hardly credible', designed to rebut critics who said he learned falsafa too early.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the strongest objection to Averroes' reply that fire, without impediments, necessarily burns?", "options": ["That talc does not in fact protect anything from fire", "That al-Ghazālī's test of necessity was conceivability, and fire failing to burn unprotected cotton remains conceivable, so adding 'no impediments' does not restore necessity", "That Averroes denied the existence of natural science", "That Aristotle never discussed fire"], "answerIndex": 1, "explanation": "Averroes refines the causal claim, but al-Ghazālī's modal criterion makes even the impediment-free connection non-necessary, so the reply may miss its target; the deepest disagreement is theological.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Averroes argue about women in his commentary on Plato's Republic?", "options": ["That women should be excluded from all public life by nature", "That women are by nature suited only to household tasks", "That the Republic's proposals about women were a later addition to Plato's text", "That women share the same nature as men and could be guardians, philosophers and rulers, though the cities of his day left them unprepared for the virtues"], "answerIndex": 3, "explanation": "Averroes held that women share men's nature and are suited to the same activities, and blamed the cities around him for not preparing women for any of the human virtues.", "id": "q4"},
    {"type": "open", "prompt": "Set out al-Ghazālī's argument in the seventeenth discussion of the Incoherence that the connection between fire and burning is not necessary. Give the objection he raises against himself and his reply, and explain why scholars disagree about whether he was an occasionalist.", "rubric": "A strong answer states the purpose (to show that the Qurʾān's miracles are possible), then the steps: the philosophers hold that fire burns by its nature and necessarily; their only evidence is observing burning on contact; observation shows only concomitance, not that fire produces the burning; necessity requires that the alternative be inconceivable, but fire without burning is conceivable; so the connection is not necessary and God, directly or through angels, may be the agent; so miracles are possible. It gives the self-objection (anything goes: a book might turn into a boy, stones into gold; we would face the world 'with no expectations') and the reply (God created a regular order, a habit or custom that fixes belief in our minds and that revelation says will not change). On the debate it notes the second approach, allowing natures and unknown natural causes (Moses' staff), and contrasts Marmura (consistent occasionalist, long the standard reading), Frank (an essentially Avicennan cosmos of secondary causes) and Griffel (both views held possible, undecided for life, citing 'Both these two views are possible for us').", "id": "q5"},
    {"type": "open", "prompt": "Assess the claim that al-Ghazālī killed philosophy and science in the Islamic world, and explain why the 'double truth' should not be attributed to Averroes.", "rubric": "A strong answer reports Weinberg's charge and the replies: al-Ghazālī championed logic and demonstration, adopted Avicenna's psychology and gave theology a rule of interpretation guided by demonstration; Griffel ('there was simply no Inquisition in Islam') and the ḥikma genre that grew from the Doctrines of the Philosophers; Gutas's golden age to about 1350; Saliba on Maragha astronomy, with the criticism that he exaggerates; and later thinkers such as al-Rāzī, Suhrawardī, al-Ṭūsī, Ibn Taymiyya, Ibn Khaldūn and Mullā Ṣadrā, plus Averroes' own Islamic readers (thirty-nine disciples, Ibn Taymiyya, Safavid manuscripts). On double truth it explains that the phrase comes from Bishop Tempier's 1277 accusation of speaking 'as if there were two contrary truths', that scholars agree no medieval author held that contradictory propositions can both be true, and that Averroes held the unity of truth: 'truth does not oppose truth'.", "id": "q6"}
  ]$ghazali_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/ghazali-and-averroes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
