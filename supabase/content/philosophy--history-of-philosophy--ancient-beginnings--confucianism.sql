-- Confucius, Mencius and Xunzi — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/confucianism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/confucianism',
    'research',
    'advanced',
    'read',
    $confucianism_master$> **Three teachers, one argument about what people are and how they become good.** Confucius taught that humaneness (*ren*), ritual propriety (*li*) and rule by moral example could restore a disordered world; Mencius argued that human nature is good, because everyone has the "sprouts" of virtue; Xunzi replied that human nature is bad, and that goodness is something people make through ritual and learning. This chapter sets out the arguments of Mencius and Xunzi step by step, with the objections each faced, and asks how much we really know: Confucius's dates are traditional, the *Analects* may have reached its present form centuries after his death, and "Confucianism" is a Western coinage. It ends with women and the canon, and the comparison with Aristotle.

## A Tradition Without Its Founder's Name

"Confucius" is not a Chinese name. It is a Latinised combination of the surname Kong with the honorific *fuzi*, "Master", coined by Jesuit missionaries to China in the late sixteenth century. In Chinese he is usually Kongzi, "Master Kong". "Mencius", likewise, is the seventeenth-century Jesuits' Latin form of Mengzi, "Master Meng", whose full name was Meng Ke.

The tradition's Chinese names do not mention Confucius at all. They speak of the *Ru* (Rujia, "the Ru school"), a term older than Confucius that connoted specialists in ritual and music, and later experts in the classical texts. English uses "Confucian" for so many things, from temple cults to "bureaucracy", that Mark Csikszentmihalyi's encyclopedia entry on Confucius avoids the word altogether, and some scholars prefer "Ruism". Lionel Jensen's *Manufacturing Confucianism* (1997) argued that the Jesuits created both the name "Confucius" and the idea of "Confucianism"; Nicolas Standaert answered with an article titled "The Jesuits Did NOT Manufacture 'Confucianism'" (1999). This chapter uses the familiar words for a family of teachers who would have called themselves *Ru*.

## What Can Be Known of Confucius

Confucius's dates are traditionally given as 551–479 BCE; the birth year comes from the *Gongyang Commentary* to the *Spring and Autumn Annals*. He lived in the Spring and Autumn period, though he is known mostly from texts of the later Warring States period (the background is in the History chapter *Ancient China: Shang, Zhou, and the Hundred Schools*). He was born in Zou, in modern Shandong, near or under the state of Lu. His father died when he was small, leaving the family poor but of some standing, and he became known young for his expertise in Zhou ritual.

Beyond this the sources disagree, even about which offices he held: the *Mencius* has him keeping granary accounts, Sima Qian makes him acting Chancellor. Sima Qian's *Records of the Grand Historian* contains the first biography, written about three centuries after Confucius died from anecdotes with teaching purposes of their own: his departure from Lu, his wanderings among states whose rulers failed to appreciate him, his seventy-seven direct disciples (tradition also says seventy-two). Csikszentmihalyi warns that reading the philosophy off this biography is "risky and potentially circular". All our sources postdate him, the IEP notes, "by a few decades at least and several centuries at most", and Han legend made him a superhuman "uncrowned king".

## The Analects and the Problem of Its Composition

The *Analects* (*Lunyu*, roughly "edited conversations") is a collection of short sayings and exchanges in twenty books. Under the Han there were three versions: a Lu text, a Qi text with two extra chapters, and an "Old Text" said to have been found in a wall of Confucius's house.

Tradition, from the historian Ban Gu in the first century CE to Zhu Xi in the twelfth, held that it was compiled by Confucius's first- and second-generation disciples. That view has long been challenged. E. Bruce Brooks and A. Taeko Brooks (*The Original Analects*, 1998) treat the text as an accumulation of layers, in which only part of Book 4 reflects the historical Confucius and the rest was added by students and family members over generations, with sometimes incompatible agendas. Their theory has drawn both appreciation and disagreement.

A more radical challenge concerns dating. Zhu Weizheng argued in 1986 that no source before the second century BCE quotes or names the *Analects*, and Michael Hunter (*Confucius beyond the Analects*, 2017) showed that writers took "an acute interest in the Analects only in the late second and first centuries BCE". Some scholars place its final compilation as late as about 140 BCE; many think it grew over about two centuries; how late it reached its final form, possibly under the Han, is debated. Archaeology cuts both ways: tomb manuscripts of the mid-first century BCE "confirm the sudden wide circulation of the Analects" then, while two collections from before about 300 BCE show that his sayings were already being gathered, only some of them matching the received text.

Csikszentmihalyi concludes that the "essential core of the teachings of Confucius is historically underdetermined"; Hunter's point, he stresses, attacks the *authority* of the *Analects*, not Confucius's existence. Following Bryan Van Norden, this chapter uses "Confucius" as shorthand for Confucius as represented in the received *Analects*.

{{image: Analects | A page from the *Analects*, the collection of sayings in which most readers have met Confucius, whatever its exact history.}}

## Ren: Humaneness

The central virtue of the *Analects* is *ren*. It has been translated "benevolence" (D. C. Lau), "Goodness" (Arthur Waley, Edward Slingerland), "humaneness" and "co-humanity". Before Confucius the word referred to the strong, handsome bearing of the aristocracy; in the *Analects* it becomes a moral excellence that anyone can in principle achieve. Confucius defines it as caring for others (12.22), uses it both for complete virtue and for one virtue among others, and never claims it for himself.

*Ren* is tied to ritual from the start. In Slingerland's translation of 12.1, "Restraining yourself and returning to the rites constitutes *ren*. ... The key to achieving *ren* lies within yourself—how could it come from others?" The ideal person is the *junzi*, originally "lord's son", now a person of ethical nobility (the "gentleman" or "exemplary person"), opposed to the *xiaoren*, the "small person".

The disciple Zengzi summed up the Master's way as *zhong* and *shu*, conventionally "loyalty" and something like "reciprocity" (4.15). *Shu* is explained in 15.24 (numbered 15.23 in some editions, since numbering in Book 15 varies). In David Hinton's translation, Zigong asks: "Is there any one word that could guide a person throughout life?" The Master replies: "How about 'shu' [reciprocity]: never impose on others what you would not choose for yourself?" This negative form, which asks only that we refrain from harming others, is sometimes called the Silver Rule. But Brooks and others suspect such passages are later additions, since a single axiom is unlike the *Analects*' usual teaching tied to situations, and Csikszentmihalyi notes that reading them as abstract principles owes much to their likeness to the Gospels' Golden Rule.

## Li: Ritual Propriety

*Li* originally meant formal ceremonies such as offerings to ancestors; it came to cover etiquette and ethics generally. Confucius presented himself as a conserver: "I transmit rather than innovate. I trust in and love the ancient ways" (7.1, Slingerland). But what was new, Csikszentmihalyi argues, was his *reason* for ritual: not its external benefits but the inner state of the person performing it. Ritual without the right feeling is worthless. "A man who is not *ren*—what has he to do with ritual?" (3.3). The same logic governs filial piety (*xiao*). In Slingerland's translation of 2.7: "Nowadays 'filial' means simply being able to provide one's parents with nourishment. But even dogs and horses are provided with nourishment. If you are not respectful, wherein lies the difference?"

How exactly *ren* and *li* relate is a live debate. On what Kwong-loi Shun (1993) calls the "instrumental" reading, ritual cultivates or expresses a humaneness that is already there; on the "definitionalist" reading, ritual partly defines what humaneness is. Herbert Fingarette (1972) went further, reading ritual as an end in itself, the shared and beautiful ceremony of human community.

## Government by Virtue

The political core of the *Analects* is that a ruler governs best by *de*. The word first meant a king's charisma, accumulated through good character and generosity, and is often translated "Virtue" or "moral force". In the IEP's rendering of 12.19, "The moral force of the profound person is like the wind; the moral force of the small person is like the grass. Let the wind blow over the grass and it is sure to bend." The contrast is with government by law and punishment:

```quote
If you try to guide the common people with coercive regulations and keep them in line with punishments, the common people will become evasive and will have no sense of shame. If, however, you guide them with Virtue, and keep them in line by means of ritual, the people will have a sense of shame and will rectify themselves.
Confucius · Analects 2.3 (trans. Edward Slingerland, 2003) · received text; date of composition debated
```

Confucius treated force as a last resort, not as forbidden. Government also needed the "rectification of names" (*zhengming*, 13.3): social reality had drifted from the names of roles, and conduct, beginning with the ruler's, had to be brought back into line with them. On human nature Confucius said little ("By nature people are close, by habituation they are miles apart", 17.2), leaving the question his successors fought over.

```checkpoint
q: Why does the chapter use "Confucius" to mean "Confucius as represented in the received *Analects*"?
a*: Because when, and by whom, the *Analects* was composed is disputed, so its sayings cannot simply be assumed to be the historical Confucius's words.
a: Because scholars agree that Confucius never existed.
x: Hunter's argument attacks the authority of the *Analects*, not the historicity of Confucius.
a: Because the *Analects* was written by Confucius himself in the 6th century BCE.
x: No source claims he wrote it; tradition credits his disciples, and many modern scholars date its final form much later.
a: Because Sima Qian's biography is the only reliable source.
x: Sima Qian wrote about three centuries later from didactic anecdotes; Csikszentmihalyi warns against reading the philosophy off that biography.
hint: Think about Brooks and Brooks, Zhu Weizheng and Hunter.
why: Views range from compilation by disciples, to accumulation over generations (Brooks and Brooks), to a final form as late as the Han (Zhu Weizheng, Hunter). Using "Confucius" as shorthand for the figure in the received text avoids claiming more than is known.
---
q: What did Confucius claim about governing people by punishments (Analects 2.3)?
a: That punishments are the surest way to make people good.
x: That is closer to the Legalist view; Confucius said punishment makes people evasive and shameless.
a: That rulers should never use force under any circumstances.
x: He did not wholly dismiss force, but treated it as a last resort.
a*: That people kept in line by punishments become evasive and have no sense of shame, whereas Virtue and ritual give them a sense of shame and they correct themselves.
a: That ritual is unnecessary if laws are clear.
x: He paired guidance by Virtue with ritual, not with laws.
hint: The passage contrasts two ways of guiding the people.
why: Government by *de* works through example, like wind on grass; punishment may control behaviour but does not create the sense of shame that makes people correct themselves.
```

## Mencius and His Rivals

Mencius was born about a century after Confucius died, in the state of Zou. His dates are traditionally 372–289 BCE, but many recent scholars put his life about twenty years earlier; Van Norden thinks he was probably born around 390. He held office (perhaps honorary) in Qi and argued with kings. The *Mengzi* was probably compiled by his disciples or theirs; its seven books each have two parts, so passages are cited as 1A1 to 7B38. Its authorship is far less contested than the *Analects*'.

Mencius defended Confucius against two rivals. Mozi taught "impartial caring" (*jian ai*), concern for all alike (see *Mozi, the Daoists and the Legalists: the Hundred Schools*); Yang Zhu was "for oneself". In Van Norden's translation of 3B9, Mencius dismisses both: "To not have a father and to not have a ruler is to be an animal." His positive answer was a theory of human nature.

## The Child at the Well

Mencius's slogan is *xing shan*, "human nature is good". It is often quoted as "human nature is *fundamentally* good", but that is a gloss by Zhu Xi which entered the popular *Three Character Classic*; Mencius's own phrase appears in only two passages. What does "nature" (*xing*) mean here? Following A. C. Graham, Van Norden explains that the *xing* of a thing is what it will develop if given a healthy environment for its kind. An orange seed's nature is to bear fruit, though most seeds never germinate. To say human nature is good is to say that people tend to become good when conditions are right.

The famous argument is in 2A6. In Van Norden's translation: "Suppose someone suddenly saw a child about to fall into a well: anyone in such a situation would have a feeling of alarm and compassion—not because one sought to get in good with the child's parents, not because one wanted fame among one's neighbors and friends, and not because one would dislike the sound of the child's cries." It can be set out like this.

1. Anyone who suddenly sees a child about to fall into a well feels alarm and compassion.
2. This feeling is not explained by self-interest: not by wanting the parents' favour, not by wanting a reputation, not by disliking the noise. (This rules out the egoist account associated with Yang Zhu.)
3. So all humans have a heart that is "not unfeeling toward others"; someone without it "is not human".
4. In the same way, all humans have feelings of shame, of deference to others, and of approval and disapproval.
5. These four feelings are the "sprouts" (*duan*) of four virtues: of humaneness (*ren*), rightness (*yi*), ritual propriety (*li*) and wisdom (*zhi*).
6. A thing's nature is what it develops under healthy conditions, and these sprouts grow into full virtues if they are cultivated by reflection (*si*).
7. Therefore human nature is good: it has a built-in tendency towards virtue. When people become bad, "this is not the fault of their potential" (6A6).

Step 1 is modest: Mencius claims only that the onlooker *feels* alarm, not that every onlooker acts. Sprouts developed "to the full" are, in the IEP's rendering, "like fire catching alight, or a spring as it first bursts through". Wrongdoing comes from neglect, from failing to reflect (6A15). Growth also needs material security, education and effort.

Cultivation works by "extension". King Xuan of Qi spared an ox being led to slaughter; Mencius urged him to extend that compassion to his people, since claiming he could not was like saying one could lift a heavy weight but not a feather (1A7).

## Gaozi's Objections and Mencius's Replies

The strongest early objections come from Gaozi, known only from the *Mencius*, who held that human nature is neither good nor bad. In James Legge's 1895 translation, Gaozi likens human nature to willow wood, and making people humane and right to carving cups and bowls from it: morality is imposed from outside. Mencius replies: "You must do violence and injury to the willow, before you can make cups and bowls with it." If morality were carved out of human nature, people would come to see benevolence and righteousness as injuries done to them.

Gaozi tries again: human nature is like water swirling in a pool, which flows east or west depending on where a channel is opened; it is "indifferent to good and evil". Mencius turns the image round. Water may be indifferent to east and west, but not to up and down: "The tendency of man's nature to good is like the tendency of water to flow downwards." Water struck so that it leaps up moves by force, not by nature; so it is when people are made to do wrong.

When Gaozi says nature is simply what is inborn, Mencius objects that dogs, oxen and humans would then share one nature (6A3). David Wong points out that Mencius's two favourite images differ. Water flows downhill unless something interferes; a sprout needs to be tended. Xunzi's criticisms, he suggests, hit the water version much harder than the sprout version.

Mencius's ethics shaped his politics. Asked whether a vassal may kill his lord, he replied, in the IEP's rendering, "I have heard that [Wu] punished the outlaw Zhou – I have not heard that he murdered his lord" (1B8): one who destroys humaneness and rightness has forfeited the name of ruler. Yet the IEP judges him "no democrat"; his ideal was a sage-king. Bai Tongdong (2008) draws on him to support a limited democracy, while Justin Tiwald (2008) warns against overestimating his championing of the popular will, a debate continued in *Democracy and Its Critics*.

## Xunzi: Goodness as Artifice

Xun Kuang, known as Xunzi, was born around 310 BCE and died some time after 238 BCE; the dates are uncertain. He studied at the Jixia Academy in Qi and later served as magistrate of Lanling in Chu. The *Xunzi* consists of sustained essays, which the consensus holds to be predominantly authentic, though Xunzi did not arrange them. His students Han Fei and Li Si were associated with Legalism, which long damaged his reputation; today, Paul Goldin writes, "the tide has reversed almost completely".

Mencius was probably long dead when Xunzi attacked him in a chapter titled *Xing'e*. Goldin translates the title "Human Nature is Evil"; Eric Hutton's 2014 translation has "Human Nature Is Bad". The word *e* is close in basic meaning to "detestable" (as a verb, the same character means "to hate"). Goldin accepts "evil" only if no Augustinian sense of wickedness is intended; others prefer "bad", or Michael Nylan's "odious". As the IEP puts it, Xunzi does not think people deliberately and perversely violate morality; they are "morally blind by nature".

```quote
Human xing is evil; what is good is artifice.
Xunzi · Xunzi 23.1a (trans. Paul R. Goldin) · 3rd century BCE
```

Xunzi defines nature differently from Mencius: "What is so by birth is called *xing*" (22.1b, Goldin). His argument runs as follows.

1. Nature (*xing*) is what we have at birth, unlearned and not worked at: the eye's seeing, the ear's hearing, and desires for profit, sights, sounds and flavours.
2. If these inborn desires are simply followed, they lead to contention, robbery and disorder, and courtesy is destroyed.
3. What leads to disorder when followed cannot be called good; so nature is *e*, bad.
4. Yet goodness (deference, courtesy, ritual order) does exist. It requires teachers, ritual and righteousness: "artifice" (*wei*), meaning conscious, deliberate effort.
5. Whatever has to be learned or worked at is, by definition, not part of nature.
6. So "human *xing* is evil; what is good is artifice". (Two further arguments support this: if people were good by nature, the sages would not have needed to create ritual; and people desire goodness precisely because they lack it, since one desires what one does not have.)
7. Moral cultivation therefore *transforms* nature, rather than growing it.

His images answer Mencius's sprouts. "Crooked wood must await steaming and straightening on the shaping frame, and only then does it become straight. Blunt metal must await honing and grinding, and only then does it become sharp" (in Ivanhoe and Van Norden's translation). A potter's vessel comes from the potter's conscious activity, not from the clay's nature; so the sages produced ritual and righteousness by deliberate effort.

**The objection.** Are Mencius and Xunzi even disagreeing? Scholars since A. C. Graham have argued that they define "nature" differently: for Mencius it is what a thing develops under healthy conditions, for Xunzi what it has at birth before any effort. And both agree that every human being can become good. Perhaps the famous quarrel is a verbal one. **The reply.** There still seems to be a real disagreement underneath. Xunzi explicitly denies that we have innate moral sprouts, and he locates the models of goodness outside the self, in the rituals created by the sages, whereas Mencius says that the virtues "are not welded to us externally" (6A6, Van Norden). Interestingly, a manuscript from about 300 BCE found at Guodian defines *xing* much as Xunzi does, which suggests that Mencius's usage may have been the unusual one.

## Ritual and a Silent Heaven

Why do rituals exist? In Goldin's translation, Xunzi says that if people follow their desires, "boundaries cannot contain them and objects cannot satisfy them. Thus the Former Kings restrained them and established for them ritual and morality in order to divide them" (4.12). The picture is superficially like Hobbes's state of nature. But rituals are not arbitrary conventions: they fit the distinctions humans naturally draw and foster moral growth.

Xunzi's Heaven (*tian*, which some translators render "nature") never intervenes in human affairs. "If the sacrifice for rain [is performed], and it rains, what of it? I say: It is nothing. Even if there had been no sacrifice, it would have rained" (17.8, Goldin). The noble person treats such ceremonies as embellishment. Whether Xunzi's Way is discovered in the nature of things or constructed by the sages is, in Goldin's judgement, "probably the greatest controversy in Xunzi studies today"; David Nivison suggested he could be both a constructivist and an objectivist.

```checkpoint
q: What does Mencius claim the child-at-the-well example shows?
a: That everyone who sees the child will rush to save it.
x: Mencius claims only the feeling of alarm and compassion; he does not claim that everyone acts.
a*: That everyone has a spontaneous feeling of compassion not explained by self-interest, the "sprout" of humaneness.
a: That human nature is fundamentally good, with no need for cultivation.
x: "Fundamentally good" is Zhu Xi's later gloss; for Mencius the sprouts must be cultivated by reflection.
a: That compassion comes from wanting the parents' gratitude.
x: Mencius explicitly rules this out, along with the wish for fame and dislike of the child's cries.
hint: Look at what the feeling is "not because of".
why: The example is designed to exclude egoist explanations. The feeling is a sprout of *ren*; together with shame, deference and approval it shows a built-in tendency towards virtue that must be extended.
---
q: How does Xunzi's warped wood image differ from Mencius's sprout image?
a: The wood image shows that goodness grows naturally if left alone.
x: That would be closer to Mencius's water image; Xunzi's wood must be steamed and straightened.
a: Both images make the same point, that goodness is innate.
x: Xunzi denies innate moral sprouts; the images are meant to conflict.
a: The wood image shows that people cannot become good at all.
x: Xunzi holds that anyone can become good through learning and effort.
a*: For Xunzi goodness requires reshaping our nature by outside effort (teachers, ritual), as crooked wood needs a shaping frame, whereas a sprout grows by tending what is already there.
hint: Think about whether cultivation transforms nature or develops it.
why: Xunzi's cultivation transforms nature through artifice, like steaming wood or firing clay; Mencius's cultivation develops a tendency already present, like tending a sprout.
```

## Women and the Canon

In the classical texts man and woman are roles defined by kinship and ritual, marked by *nei* (inside, the household) and *wai* (outside, public life). One much-discussed *Analects* passage groups women with the "small people" as hard to deal with, and commentators have long argued over whether it means all women. Sin Yee Chan (2000) observes that the *Analects* and *Mencius* assume women's roles are domestic but give no argument that women have lesser capacities, leaving room for women to become *junzi*; Lisa Raphals and Michael Nylan find the early texts relatively positive about women compared with later Neo-Confucian writing.

One woman wrote within the early tradition itself: Ban Zhao (born 45 or 49, died c. 117–120 CE). She completed the *Book of Han* after the death of her brother Ban Gu and taught palace women and male scholars. Her *Lessons for Women* (*Nüjie*, early second century CE) urges modesty and compliance, yet argues that girls should receive a classical education, citing the ritual classics in support; it has been called the earliest surviving Chinese text by a woman on women's education, though it accepts women's subordinate status. (Her place in Han society is described in the History chapter *Han China (206 BCE–220 CE)*.)

Modern philosophers have reopened the question. Chenyang Li (1994) compared *ren* with the feminist ethics of care. Li-Hsiang Lisa Rosenlee's *Confucianism and Women* (2006) argues that imposing Western frameworks misconstrues gender oppression in Confucianism; in later work, such as the essay "Why Care?" (2014), she defends filial care as the root of a care ethic and asks men to share the caring. These debates return in *Feminist Philosophy*.

## Confucius and Aristotle

Readers of the chapter on *Aristotle* will notice parallels: character before rules; Aristotelian habituation broadly corresponds to Confucian cultivation; Mencius's wisdom, a flexible responsiveness to situations, is "somewhat like Aristotelian *phronēsis*" (practical wisdom); and both distinguish genuine virtues from their counterfeits. The differences are as telling. Aristotle has nothing like the Confucian emphasis on ritual; he prizes theoretical contemplation, which the Confucians do not; and the Confucians treat family life as part of living well in itself. Some scholars doubt that Confucian thought is a "virtue ethics" in the Western sense at all: Roger Ames (with Henry Rosemont) proposes instead a "role ethics", centred on relationships such as parent and child. That debate is the subject of *Virtue Ethics, Greek and Confucian*.

## What Came After

Under the Han, experts in the Five Classics received government posts, and Han Confucianism became a syncretic blend drawing on Daoist, Legalist and yin–yang ideas. Much later, provoked by Buddhism, a revival known as the "Learning of the Way" reread Mencius with Buddhist-influenced concepts, and Zhu Xi (1130–1200) grouped the *Analects*, the *Mencius*, the *Great Learning* and the *Mean* as the Four Books, as *Chinese Buddhism and the Rise of Neo-Confucianism* explains. The New Culture and May Fourth reformers of 1915–1921 called for "Mr. Science" and "Mr. Democracy" in place of "Mr. Confucius"; the New Confucians defended the tradition, a story continued in *Modern Chinese and Indian Philosophy*.

## Further exploration

- **Edward Slingerland (trans.), *Confucius: Analects: With Selections from Traditional Commentaries* (2003).** A standard translation, read alongside the traditional Chinese commentators; the source of several quotations here.
- **Bryan W. Van Norden (trans.), *Mengzi: With Selections from Traditional Commentaries* (2008).** The translation of Mencius quoted in this chapter, with commentary.
- **Eric L. Hutton (trans.), *Xunzi: The Complete Text* (2014).** The complete translation, including the chapter "Human Nature Is Bad".
- **Kwong-loi Shun, *Mencius and Early Chinese Thought* (1997).** The major scholarly study of Mencius and the debates around him.
- **Michael J. Hunter, *Confucius beyond the Analects* (2017).** The case against treating the *Analects* as the authoritative core of Confucius's teaching.
- **Li-Hsiang Lisa Rosenlee, *Confucianism and Women: A Philosophical Interpretation* (2006).** A feminist philosophical reading of the tradition.
- **Annping Chin, *The Authentic Confucius: A Life of Thought and Politics* (2007).** An accessible biography.$confucianism_master$,
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
  select $confucianism_quiz$[
    {"type": "mcq", "prompt": "What does Michael Hunter's research on the *Analects* (following Zhu Weizheng) chiefly challenge?", "options": ["The authority of the *Analects* as the oldest and most reliable record of Confucius's teaching", "The historical existence of Confucius", "The traditional dates of Mencius", "The authenticity of Xunzi's chapter on human nature"], "answerIndex": 0, "explanation": "Hunter showed that writers took an acute interest in the *Analects* only in the late second and first centuries BCE. Csikszentmihalyi stresses that this attacks the authority of the text, not the historicity of Confucius.", "id": "q1"},
    {"type": "mcq", "prompt": "Why is 'human nature is fundamentally good' a misleading summary of Mencius?", "options": ["Because Mencius actually said human nature is bad", "Because Mencius never discussed human nature", "Because 'fundamentally good' is a later gloss from Zhu Xi; Mencius's slogan is simply that nature is good, meaning it tends towards goodness given healthy conditions", "Because the phrase comes from Xunzi's attack on Mencius"], "answerIndex": 2, "explanation": "Mencius's slogan is *xing shan*, 'nature is good'. The 'fundamentally' (*ben*) comes from Zhu Xi and entered the *Three Character Classic*. Following Graham, a thing's nature is what it develops in a healthy environment, so the claim is about a tendency that needs cultivation.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Mencius reply to Gaozi's claim that human nature is like water that flows east or west wherever a channel is opened?", "options": ["He agreed that nature is indifferent to good and bad", "He said water may be indifferent to east and west but not to up and down, and the tendency of human nature to good is like water's tendency to flow downwards", "He said that water, like willow wood, must be carved into shape", "He said human nature is like fire, not water"], "answerIndex": 1, "explanation": "Mencius turned Gaozi's image round: water flows downwards by nature, and making it leap up takes force; so people made to do wrong are acted on against their nature.", "id": "q3"},
    {"type": "mcq", "prompt": "Why do some scholars prefer not to translate Xunzi's word *e* as 'evil'?", "options": ["Because *e* means 'good' in classical Chinese", "Because Xunzi wrote that people are perfectly good at birth", "Because the word was invented by Jesuit translators", "Because its basic meaning is closer to 'detestable', and 'evil' can suggest deliberate, Augustinian wickedness, which Xunzi does not mean"], "answerIndex": 3, "explanation": "Goldin notes that *e* is close to 'detestable' (as a verb the character means 'to hate') and accepts 'evil' only without an Augustinian sense; others prefer 'bad' or 'odious'. The IEP says Xunzi thinks people are 'morally blind by nature', not perversely wicked.", "id": "q4"},
    {"type": "open", "prompt": "Set out Mencius's child-at-the-well argument that human nature is good, then explain Xunzi's counter-argument and his warped-wood and potter images.", "rubric": "A strong answer reconstructs Mencius 2A6: anyone seeing a child about to fall into a well feels alarm and compassion; the feeling is not explained by self-interest (the parents' favour, reputation, dislike of the noise); so all have a heart not unfeeling towards others, and likewise feelings of shame, deference and approval; these are the four sprouts of ren, yi, li and zhi; nature is what develops under healthy conditions, so nature is good. It notes that Mencius claims only the feeling, not the action. It then gives Xunzi's definition of nature as what we have at birth, unlearned; that inborn desires followed lead to contention and disorder; that goodness requires teachers, ritual and 'artifice' (wei); so 'human nature is bad; what is good is artifice'. It explains that crooked wood needs a shaping frame and the potter's vessel comes from his conscious activity, so cultivation transforms nature rather than growing a sprout. Credit discussion of Graham's view that they define 'nature' differently, and the reply that Xunzi still denies innate moral sprouts.", "id": "q5"},
    {"type": "open", "prompt": "How do *ren* (humaneness) and *li* (ritual propriety) relate in the *Analects*, and how does Confucius's idea of government by virtue depend on them?", "rubric": "A strong answer defines ren (translated benevolence, Goodness, humaneness; caring for others, 12.22; a moral excellence open to anyone, not an aristocratic trait) and li (originally ceremonies such as ancestral offerings, extended to etiquette and ethics). It cites 12.1 (restraining oneself and returning to the rites constitutes ren) and 3.3 (a person without ren has nothing to do with ritual), and notes that Confucius stressed the inner feeling behind ritual. It presents the debate: instrumental versus definitionalist readings (Shun), and Fingarette's ritual as an end in itself. It connects this to government by de (Virtue, moral force): 2.3, where punishments make people evasive and shameless but Virtue and ritual give them a sense of shame, and the wind-and-grass image of 12.19. Credit awareness that the passages' attribution to the historical Confucius is debated.", "id": "q6"}
  ]$confucianism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/confucianism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
