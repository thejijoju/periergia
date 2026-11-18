-- Mozi, the Daoists and the Legalists: the Hundred Schools — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/hundred-schools @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/hundred-schools',
    'research',
    'advanced',
    'read',
    $hundred_master$> **Rival answers to one question: how should a divided world be ordered?** In the Warring States period, China's states fought one another for survival and its thinkers argued about the Way (*dao*). This chapter follows the main rivals of the Confucians. The Mohists argued for inclusive care and judged every practice by its benefit. The *Daodejing* and the *Zhuangzi* questioned the names and distinctions everyone else relied on. The "disputers" later filed as the School of Names produced paradoxes such as "white horse is not horse". The thinkers of the *fa* tradition, from Shang Yang to Han Fei, designed the state that unified China. The chapter sets out Mozi's argument for inclusive care and the happy-fish debate step by step, and asks whether these "schools" existed at all.

## A Hundred Schools, or Six?

Sources date the Warring States period differently. The most often cited start is Sima Qian's 475 BCE; others use 481 or 453 BCE, and the specialists quoted here variously begin at 479, 453 or 403 BCE. The end is certain: 221 BCE, when Qin unified China. The historian Yuri Pines describes a world remade: centralised, bureaucratic states replaced loose aristocratic ones; iron tools raised harvests; mass armies of peasant conscripts replaced aristocratic chariots; and the hereditary nobility was eclipsed by the *shi*, "men of service", who owed their posts to ability rather than birth. "For intellectuals … this was a golden age," Pines writes. The History chapter Ancient China: Shang, Zhou, and the Hundred Schools tells the political story.

The phrase "writings of the hundred schools" (*baijia*) appears in Li Si's memorial of 213 BCE, which ordered such books handed in for burning; "hundred" means "many". The tidy list used ever since is later. Sima Tan (c. 165–110 BCE), father of the historian Sima Qian, wrote "On the Essentials of the Six Schools": Confucians (Ru), Mohists (Mo), Daoists (Dao), "Legalists" (Fa), the School of Names (Ming) and Yin-Yang. The essay is mainly an argument for the Daoists, whom he favoured, and he coined the term *fajia* himself. Chad Hansen says the Simas "fabricated" the Dao, Fa, Ming and Yin-Yang schools; Chris Fraser calls the School of Names "a taxonomical fiction"; Pines notes that "no early thinker identified himself as a member of the 'School of *fa*'." Only the Ru and the Mo were self-aware movements. The labels below are later shelf-marks, not names the thinkers used. The Confucians have their own chapter, Confucius, Mencius and Xunzi.

## Mozi and the Mohists

Mozi, "Master Mo" (Mo Di), is a shadowy figure. Fraser places him around 430 BCE, "roughly contemporaneous with Socrates"; other estimates run from about 470 to about 390 BCE. "Little is known, not even what state he was from." Fraser thinks he was probably an artisan, perhaps a carpenter. His followers were organised: each group was led by a grand master (*juzi*), and members were placed in official posts, contributed funds and could be expelled. "Far from being pacifists," some of them specialised in defending besieged cities. At their peak, Fraser judges, "no school was more influential"; Mencius complained that the words of Mozi and Yang Zhu "fill the world".

The *Mozi* is an anthology by many hands, and no part of it claims to be by Mo Di. Its core presents ten doctrines, each in three parallel essays (seven of the thirty are lost). The doctrines come in pairs: promoting the worthy and identifying upward with superiors; inclusive care and condemning aggression; moderation in use and in burial; Heaven's intent and the existence of ghosts; condemning music and condemning fatalism. All rest on one standard, benefit (*li*), understood as three goods: wealth, a large population and social order. "Does it benefit people? Then do it. Does it not benefit people? Then stop."

Fraser calls this "the world's earliest form of consequentialism", the view that right practices are those with the best results. Unlike Bentham and Mill, the Mohists sought collective welfare rather than individual happiness, and they judged ways and practices rather than single acts. Their three tests for any claim are described in What Is Philosophy?; the modern theory is the subject of Consequentialism: What Makes Right Acts Right?

They needed a standard because custom could not be trusted. Defenders of lavish funerals said gentlemen had always held them. Mozi replied with the people of Gai Shu, who ate the first-born son, "calling this 'advantageous to the younger brothers'": their rulers made it policy and their subjects custom, "yet how could these really be the Way of benevolence and righteousness?!" Nor could parents, teachers or rulers serve as models, since "those who are benevolent are few". As artisans use the compass and set square, the world needs models (*fa*), and the only reliable one is Heaven, whose conduct "is broad and impartial".

## The Argument for Inclusive Care

The Mohists' most famous doctrine is *jian ai*, often translated "universal love". Fraser prefers "inclusive care" and Hui-chieh Loy "impartial concern", because *ai* usually means a dispassionate concern rather than an emotion. The argument of the essay "Inclusive Care" (Book 16) can be reconstructed as follows.

1. The great harms of the world, states attacking states, clans disordering clans and people injuring people, should be explained by their causes.
2. They arise from "exclusion" (*bie*): being "for" oneself, one's family or one's state and not for others.
3. If people were "for others' states as for their state", then "who alone would deploy his state to attack others' states? One would be for others as for oneself."
4. States not attacking each other and people not injuring each other is "benefit to the world".
5. These benefits come from caring about and benefiting others, which is "inclusion", not exclusion.
6. Whatever produces great benefit to the world is right.
7. So "inclusion is right".

A second argument says that inclusive care is what Heaven intends. Which is more basic is disputed: Fung Yu-lan and Graham read the Mohists as utilitarians, while Dennis Ahern and others read "Heaven's intent" as a divine command theory, on which acts are right because Heaven commands them.

**The first objection: a false dilemma.** As the Mohists use it, *bie* means despising and harming others, shutting them out of moral consideration altogether. The Mohists never seriously consider a middle option, graded concern, in which we care about everyone but more about those close to us. So the argument shows that total exclusion is wrong and inclusive care permissible. If it is meant to show inclusive care *required*, Fraser notes, it poses a false dilemma, since another guideline might produce as much benefit without demanding equal concern.

**The second objection: "no father".** In Fraser's summary, Mencius "equated inclusive care with renouncing one's father" and so dismissed Mozi as a "beast". (The Chinese, 墨氏兼愛，是無父也, says roughly that Mo's inclusive care amounts to having no father.) Later Confucians followed him, arguing that impartiality runs against human nature. The texts reply that a filial son wants others to benefit his parents, and the way to secure that is to benefit others' parents. The later Mohists went further: we care for all equally but benefit some more than others according to relationship, or, in the words of the Mohist Yi Zhi, "In care, no degrees; in practice, begin from what is close." In Fraser's words, "Contrary to a common misperception, Mohist ethics does not advocate that we treat everyone alike, but only that we have similar moral concern for everyone." This also narrows the false-dilemma objection, since what the later Mohists equalise is concern, not benefit. Most of the texts' examples ask little more than commonsense decency, and contemporaries mostly attacked something else: the Mohists' austerity, their hostility to music and their plain funerals.

## War, Disputation and the Later Mohists

Condemning aggression follows from the same standard. Everyone agrees a murderer does wrong. Rulers who punish one killing but praise mass killing are like someone who calls a little black "black" but much black "white". Yet the Mohists distinguished the sage-kings' just punishment of tyrants from aggression, and went to help besieged states.

Between the late fourth and mid-third centuries BCE, later Mohists wrote the Canons, terse definitions and theses that are "the most difficult and corrupt in all the classical Chinese literature" (Fraser). They cover meaning, knowledge, causation, space and time, geometry, optics and economics, and they "decisively refute" the old view that ancient Chinese thinkers were uninterested in logic. Disputation (*bian*) is defined as contending over which of a pair of terms, such as "ox" and "non-ox", fits a thing, and the Canons state versions of the law of excluded middle (one of the pair must fit) and of non-contradiction (both cannot). They also contain one of the earliest written accounts of a pinhole image. The Canons return in Logic across Traditions.

```checkpoint
q: Why does Chris Fraser say the Mohist argument for inclusive care poses a "false dilemma"?
a*: Because it compares inclusive care only with total exclusion of others, ignoring graded concern that might bring equal benefit.
a: Because the Mohists confused benefit to the state with benefit to individuals.
x: The Mohists deliberately counted collective goods (wealth, population, order); the dilemma concerns the options they compared, not the kind of good.
a: Because Heaven's intent and benefit point in opposite directions.
x: The Mohists offered both as supporting the same conclusion; the debate is over which is more basic, not whether they conflict.
a: Because Mencius showed that impartiality is impossible for humans.
x: Mencius's objection was that inclusive care meant having no father; Fraser's point is about the structure of the argument itself.
hint: What does the Mohist word *bie*, "exclusion", actually mean in the argument?
why: *Bie* means despising and harming others. Showing that this is wrong makes inclusive care permissible, but not required, since a middle option of graded concern is never considered.
---
q: How did the Mohists reply to the charge that inclusive care destroys filial duty?
a: They agreed that parents deserve no special treatment.
x: Fraser stresses that Mohist ethics does not ask us to treat everyone alike.
a: They said filial duty mattered more than benefit.
x: Benefit was their basic standard; they argued that care for others serves one's parents, not that it ranks below them.
a*: A filial son wants others to benefit his parents, and the way to secure that is to benefit others' parents; concern is equal, but practice begins from what is close.
a: They said Heaven had abolished family obligations.
x: Heaven is the Mohists' model of broad, impartial concern, not an authority that abolishes family ties.
hint: Think of Yi Zhi's slogan reported in the *Mencius*.
why: The texts argue from reciprocity, and the later Mohists distinguished equal care from unequal benefit: "In care, no degrees; in practice, begin from what is close."
```

## Laozi and the Daodejing

Sima Qian, writing around 100 BCE, tells the classic story. Laozi, whose name means "Old Master", was an archivist at the Zhou court whom Confucius consulted on ritual. Seeing Zhou decline, he left; at the frontier an official asked him to write down his teachings, and he produced "some five thousand" characters before departing, "no one knew where". Few scholars outside China accept this in full; Graham called it a conflation of legends. Whether any historical Lao Dan lies behind it is debated. Alan Chan finds "little reason not to accept the traditional claim that Laozi was a senior contemporary of Confucius", though he warns against calling him Daoism's "founder". Ronnie Littlejohn says the single-author tradition "is almost universally rejected by scholars now", and treats the book as material from "ancient masters" collected over centuries.

On the book there is more agreement. Collections of sayings were probably written down from the later fifth century BCE and consolidated in the fourth; D. C. Lau called the result an "anthology". Silk manuscripts from Mawangdui, in a tomb sealed in 168 BCE, put the part on virtue (*de*) before the part on the Way (*dao*). Bamboo slips from Guodian, dated around 300 BCE, are the oldest copies, but they contain only about 2,000 characters of the text, and not the famous chapter 1.

```quote
The Way that can be spoken of is not the constant Way.
Laozi (attributed) · Daodejing, ch. 1 (trans. Alan Chan) · compiled c. 5th–3rd century BCE
```

*Dao* means "way", but as a verb also "to speak", so the line plays on "a *dao* that can be *dao*-ed". The Dao is nameless and generative: "Dao gives birth to One; One gives birth to Two; Two gives birth to Three; Three gives birth to the ten thousand things." *De*, virtue or potency, is what a thing obtains from the Dao; *ziran*, "self-so", is naturalness. The best-known idea is *wuwei*, "non-action" or "effortless action". It does not mean doing nothing; it contrasts with action driven by self-serving desire, as in "The highest virtue is not virtuous; therefore it has virtue". The sage returns to *pu*, the "uncarved block", which D. C. Lau read as a symbol of human nature before artificial desire has been produced in it.

Much of this is advice to rulers. The book condemns war, cruel punishment and heavy taxes, praises "a small country with few inhabitants", and remarks that "governing a large country is like cooking a small fish". Besides mystical and metaphysical readings, scholars such as Lau read it, in Alan Chan's summary, as "an ethical and political masterpiece intended for the ruling class"; Graham thought it both. The earliest known commentaries, in the *Han Feizi*, read it politically. The *Daodejing* did not simply turn away from government.

A note on quotations: "a journey of a thousand miles begins with a single step" is a genuine line of chapter 64 in loose translation, but the original says the journey starts "beneath one's feet", as in Lau's "A journey of a thousand miles starts from beneath one's feet". Many other popular "Lao Tzu" sayings are not in the text at all.

## The Zhuangzi

Zhuang Zhou, "Master Zhuang", lived in the late fourth century BCE, roughly in Mencius's time; nothing about him can be confirmed outside the book, and some scholars doubt his existence. The text we have was cut to 33 chapters by Guo Xiang (died 312 CE). Only the seven Inner Chapters are conventionally attributed to Zhuangzi, and Graham argued that their author never knew he was a Daoist at all: the link with Laozi comes from later chapters. Its parables feature talking skulls, butchers, fish and birds; Arthur Waley called it "one of the most entertaining as well as one of the profoundest books in the world". Its second chapter, a "Discussion on Making All Things Equal", is read by Steve Coutinho as a reply to the later Mohists' insistence that every judgment is either acceptable or not. It ends with a famous dream.

```quote
But he didn't know if he was Zhuang Zhou who had dreamt he was a butterfly, or a butterfly dreaming that he was Zhuang Zhou. Between Zhuang Zhou and the butterfly there must be some distinction! This is called the Transformation of Things.
Zhuangzi · Zhuangzi, ch. 2 (trans. Burton Watson) · late 4th century BCE
```

The ending matters: the passage does not say there is no difference between man and butterfly. Graham reads it as exposing another false dichotomy, between waking and dreaming; Hansen sees "mild skepticism". How to read Zhuangzi's play with perspectives is a live debate. Guo Xiang's long-received reading is relativist: each thing has its own nature, and the great Peng bird's view is no better than a small bird's. Coutinho objects that radical relativism would make Zhuangzi's own view no improvement over Confucianism or Mohism, so it "is clearly a misreading"; Hansen defends a milder "perspective relativism". Paul Kjellberg and Lisa Raphals compare Zhuangzi with the Greek Pyrrhonian sceptics, who suspended judgment to gain calm; others read his scepticism as therapy rather than doctrine. These options return in Scepticism and the Answers to It.

{{image: Zhuangzi (book) | *The Butterfly Dream* by the Chinese painter Lu Zhi (about 1550), illustrating the story that ends the second chapter of the *Zhuangzi*.}}

## The Happy Fish, Step by Step

The book's best-known argument comes from chapter 17, an Outer Chapter, so it may not be by Zhuangzi at all. He and his friend Huizi are on a bridge over the Hao River.

1. Zhuangzi: "The minnows are darting about free and easy! This is how fish are happy."
2. Huizi: "You are not a fish. How do you know that the fish are happy?" His hidden premise: one can know a creature's state only by being that creature.
3. Zhuangzi turns the premise on him: "You are not I. How do you know that I do not know that the fish are happy?"
4. Huizi accepts the premise: he is not Zhuangzi, so he does not know about him; but Zhuangzi is not a fish, so the case is complete.
5. Zhuangzi: "Let's go back to the beginning of this. You said, How do you know that the fish are happy; but in asking me this, you already knew that I know it. I know it right here above the Hao."

Is the last move a cheap pun? Graham points out that Huizi's word for "how" (安, *an*) literally asks "from where?", so the answer "above the Hao" is a point about perspective: all knowing is from somewhere. Hansen adds that Huizi "cannot consistently insist" that we may say "know" only from the object's own perspective, since he himself claims to know about Zhuangzi. Others read the exchange as wordplay; Victor Mair compares it to a Socratic dialogue.

## The Disputers: Hui Shi and Gongsun Long

Before the Han, Hui Shi, Gongsun Long and others were simply *bian zhe*, "disputers"; they never formed a movement. Hui Shi, a minister of Wei in the late fourth century BCE, was Zhuangzi's friend and foil. "His books filled five carts", but chiefly ten theses survive, without their arguments. Among them: "The dimensionless cannot be accumulated, its size is a thousand miles"; "Today go to Yue but arrive yesterday"; and "Universally care for the myriad things. Heaven and earth are one unit." Fraser thinks they share a theme, that distinctions are relative to a perspective, but admits any interpretation is "partly speculative".

Gongsun Long (c. 320–250 BCE), a retainer at the court of Zhao, is famous for "white horse is not horse". His first argument runs:

1. "Horse" names a shape.
2. "White" names a colour.
3. Naming the colour is not naming the shape.
4. So "white horse is not horse".

A second argument: if you want a horse, a brown or black one will do; if you want a white horse, it will not; so a white horse is not a horse. Fraser diagnoses an ambiguity between saying white horses are *among* horses (true) and that white horse *is identical with* horse (false). Other readings find relations of part and whole, of kinds, or of use and mention. Graham doubted any reading could avoid "an improbable medley of gross fallacies and logical subtleties", and, following Christoph Harbsmeier, Fraser suspects Gongsun Long was a court entertainer, "roughly a Chinese analogue to ... Lewis Carroll". Paradoxes: the Liar, the Heap and Zeno compares other traditions' puzzles.

```checkpoint
q: Which statement about the *Daodejing* is supported by the manuscript evidence?
a: The Guodian slips contain the complete 81-chapter text, including chapter 1.
x: The Guodian slips match only about 2,000 characters of the text and lack chapter 1.
a*: The oldest copies, from Guodian (c. 300 BCE), contain only part of the text, and the Mawangdui silks put the part on virtue before the part on the Way.
a: The text was written in a single sitting by Laozi at the frontier, as all scholars now agree.
x: That is Sima Qian's legend; most scholars treat the book as an anthology, and the historical Laozi is debated.
a: The line "a journey of a thousand miles begins with a single step" is a later invention wrongly attributed to Laozi.
x: It is a genuine line of chapter 64 in loose translation; the original says "beneath one's feet".
hint: Think about what Guodian and Mawangdui each showed.
why: The Guodian slips are the oldest copies but are partial; the Mawangdui manuscripts reverse the order of the two parts. Both support the view that the book took shape over time.
---
q: In the happy-fish debate, what is Graham's point about Huizi's word for "how"?
a: It shows that Huizi admitted fish have no feelings.
x: Huizi never says this; his premise concerns who can know another's state.
a: It proves that the debate is in one of the Inner Chapters.
x: The debate is in chapter 17, an Outer Chapter.
a: It shows that Zhuangzi conceded he could not know the fish were happy.
x: Zhuangzi ends by claiming that he does know, "right here above the Hao".
a*: It literally asks "from where?", so Zhuangzi's reply "above the Hao" answers from his own standpoint rather than making a cheap pun.
hint: Zhuangzi's last words name a place.
why: Huizi uses 安 (*an*), "whence?", so Zhuangzi can answer with the place he knows from: a claim that knowing is always from a perspective.
```

## Legalist Statecraft: Shang Yang to Han Fei

"Legalism" is, in Pines's words, "a popular—albeit quite inaccurate—designation". *Fa* means standards and methods as often as law, and there was no self-aware school, so Pines speaks of "the *fa* tradition". Graham credits these thinkers with being the first Chinese political philosophers to start "not from how society ought to be but how it is".

Shang Yang (c. 390–338 BCE) entered the service of Duke Xiao of Qin in 359 BCE and led two rounds of reform. Families were made mutually responsible, and failing to denounce a crime was punished like the crime. Ranks of merit, won above all by taking enemy heads, replaced hereditary aristocracy: "one of the most daring acts of social engineering in human history", in Pines's judgment. Farming and war were promoted, and trade and "talkative intellectuals" suppressed. The *Book of Lord Shang*, only partly his, declares that "when the people are weak, the state is strong". After Duke Xiao's death Shang Yang was killed, though the details are too legendary to say much with confidence. Qin became "arguably the most formidable military machine in China's long history". Two others supplied key terms: Shen Buhai, chancellor of Hán, is associated with administrative technique (*shu*), and Shen Dao with positional power (*shi*).

Han Fei (c. 280–233 BCE), of the ruling house of Hán, studied according to the *Shiji* under Xunzi alongside Li Si. He combined the three ideas. Laws must be public; techniques of rule hidden: "laws (*fa*) are best when they are clear, whereas techniques should not be seen." Power comes from position, not virtue. The ruler checks ministers by matching their proposals to their results and applying "the two handles", reward and punishment, which he must never delegate. Behind this lies an argument against Confucian and Mohist moralism. People are selfish, and education cannot change them; there are "no more than ten honest and trustworthy men of service, but there are hundreds of offices", so government cannot depend on virtue. Appeals to the sage-kings cannot be checked: since Confucius and Mozi died, the Ru have split into eight sects and the Mo into three, each claiming the true teaching, and the ancient kings cannot return to judge. "He who claims certain knowledge without examining the issue is a fool; he who relies on things which are impossible to ascertain is an impostor." So the system must work for an average ruler, neither sage nor monster.

Han Fei has been called a theorist of despotism, and is often compared with Machiavelli. Sima Qian says the King of Qin admired his writings, but when Han Fei came to Qin, Li Si had him imprisoned and sent him poison; Masayuki Sato doubts the details. The king conquered the other six states between 230 and 221 BCE and became the First Emperor, with Li Si as the architect of his empire. The case for and against such a state is taken up in Authority and the State: the Social Contract and Its Critics.

## Did Qin Burn the Hundred Schools?

The *Shiji* reports that in 213 BCE Li Si proposed burning all histories but Qin's and confiscating the *Poems*, the *Documents* and the "writings of the hundred schools" from everyone outside the court scholars, and that scholars were killed the next year. The story is usually told as Legalism crushing Confucianism. Pines calls that "wrong. Confucianism as such was not targeted; actually, it prospered among the court erudites", as Martin Kern showed; the target was private learning. Kern also notes that no earlier text mentions the executions, and Ulrich Neininger argues that Sima Qian's word means "to kill", not "to bury alive". The modern consensus is that the First Emperor destroyed many works and had scholars killed, probably not buried alive, and that the victims were not "Confucians" as a school.

## What Became of the Rivals

Early Han courts favoured "Huang–Lao", a blend named after the Yellow Emperor and Laozi that grounded law in the Dao, and Sima Tan's "Daoists" probably meant this. After Confucianism won imperial favour in 136 BCE, the Mohists faded, "eventually vanishing altogether by the middle of the Western Han". Fraser thinks Confucians absorbed their appealing ethics, and unification made their opposition to war (and, Graham adds, their defensive expertise) redundant. The *Mozi* survived only because it was copied into the Daoist canon. Daoist texts met Buddhism in the centuries that followed, the story of Chinese Buddhism and the Rise of Neo-Confucianism, and the History chapter Han China (206 BCE–220 CE) follows the empire that inherited all these schools.

## Further exploration

- **Chris Fraser, *The Philosophy of the Mozi: The First Consequentialists* (2016).** The fullest philosophical study of Mohism, by the leading scholar of the subject.
- **A. C. Graham, *Disputers of the Tao: Philosophical Argument in Ancient China* (1989).** The classic account of the Hundred Schools as a single argument, source of many readings in this chapter.
- **Karyn L. Lai, *An Introduction to Chinese Philosophy* (2008; 2nd ed. 2017).** An accessible survey of Mohism, Daoism, the disputers and the *fa* tradition, using the excavated texts.
- **Bryan W. Van Norden, *Introduction to Classical Chinese Philosophy* (2011).** A clear introductory textbook to the period.
- **Paul R. Goldin, *The Art of Chinese Philosophy: Eight Classical Texts and How to Read Them* (2020).** A reading guide that includes the *Laozi*, the *Zhuangzi* and the *Han Feizi*.
- **Yuri Pines (trans. and ed.), *The Book of Lord Shang: Apologetics of State Power in Early China* (2017).** A translation and study of Shang Yang's text.
- **Benjamin I. Schwartz, *The World of Thought in Ancient China* (1985).** A wide-ranging interpretation of the whole period.$hundred_master$,
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
  select $hundred_quiz$[
    {"type": "mcq", "prompt": "Where does the familiar division of early Chinese thought into six schools (Confucians, Mohists, Daoists, Legalists, School of Names, Yin-Yang) come from?", "options": ["From the thinkers' own descriptions of their movements", "From an essay by the Han historian Sima Tan, written long after the Warring States period", "From the Jixia Academy's official register of teachers", "From Confucius's Analects"], "answerIndex": 1, "explanation": "Sima Tan (c. 165–110 BCE) wrote 'On the Essentials of the Six Schools', mainly to argue for the Daoists, and coined the term fajia. Hansen says the Simas 'fabricated' several of these schools; Fraser calls the School of Names 'a taxonomical fiction'; Pines notes that no early thinker called himself a member of the 'School of fa'. Only the Ru and Mo were self-aware movements.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Chris Fraser, what does Mohist inclusive care (jian ai) require?", "options": ["Similar moral concern for everyone, while benefit may still begin from those close to us", "Treating every person exactly alike in all respects", "Abandoning one's family obligations entirely", "Loving all people with equal emotional warmth"], "answerIndex": 0, "explanation": "Fraser: 'Contrary to a common misperception, Mohist ethics does not advocate that we treat everyone alike, but only that we have similar moral concern for everyone.' The later Mohists said we care for all equally but benefit some more according to relationship ('In care, no degrees; in practice, begin from what is close'). Ai usually means dispassionate concern rather than an emotion.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the burning of books in 213 BCE does Yuri Pines endorse?", "options": ["It was the victory of Legalist over Confucian ideology", "It never happened at all", "It targeted only books on medicine and divination", "Confucianism as such was not targeted; the target was private learning, and Confucianism prospered among the court erudites"], "answerIndex": 3, "explanation": "Pines calls the 'Legalism versus Confucianism' reading 'wrong'. Books on medicine, divination and agriculture were exempt. Kern and others also doubt the story that scholars were buried alive: no earlier text mentions the executions, and Neininger argues the word means 'to kill'.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the best-supported view of the line 'a journey of a thousand miles begins with a single step'?", "options": ["It is a modern invention falsely attributed to Laozi", "It comes from the Analects of Confucius", "It is a genuine line of Daodejing chapter 64, but the original says the journey starts 'beneath one's feet'", "It is the first line of the Guodian manuscripts"], "answerIndex": 2, "explanation": "The line is in chapter 64; 'single step' is a loose translation, and D. C. Lau renders it 'A journey of a thousand miles starts from beneath one's feet'. It is sometimes wrongly credited to Confucius. Many other popular 'Lao Tzu' sayings are not in the text at all.", "id": "q4"},
    {"type": "open", "prompt": "Set out Mozi's argument for inclusive care step by step. Then give the strongest objection to it and the best Mohist reply.", "rubric": "A strong answer reconstructs the argument: the world's great harms (states attacking states, people injuring people) arise from 'exclusion' (bie), being for oneself and not others; if people were for others as for themselves, they would not attack; this is benefit to the world; what produces great benefit is right; so inclusion is right. It notes the second, Heaven-based argument and the debate between utilitarian and divine-command readings. It presents Fraser's false-dilemma objection (bie means total exclusion, so graded concern is never considered; the argument shows inclusive care permissible, not required) and/or Mencius's 'no father' objection. Replies: the filial son benefits his own parents by benefiting others'; the later Mohists' distinction between equal care and unequal benefit ('In care, no degrees; in practice, begin from what is close'); Fraser's point that Mohism does not require treating everyone alike.", "id": "q5"},
    {"type": "open", "prompt": "Reconstruct the happy-fish debate between Zhuangzi and Huizi and assess whether Zhuangzi's final move is a cheap pun.", "rubric": "A strong answer sets out the steps: Zhuangzi says the minnows are happy; Huizi objects that Zhuangzi is not a fish, relying on the premise that one can know a creature's state only by being it; Zhuangzi turns the premise against Huizi ('You are not I'); Huizi accepts the premise and claims victory; Zhuangzi returns to the start, saying the question presupposed that he knew, and that he knows it 'right here above the Hao'. It weighs readings: Graham's point that Huizi's 'how' (an) literally means 'from where?', so the answer is about perspective; Hansen's point that Huizi cannot consistently restrict 'know' to the object's own perspective; the wordplay reading; Mair's comparison with a Socratic dialogue. Credit noting that the passage is in chapter 17, an Outer Chapter, and may not be by Zhuangzi, and linking it to wider debates about Zhuangzi's relativism or scepticism.", "id": "q6"}
  ]$hundred_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/hundred-schools', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
