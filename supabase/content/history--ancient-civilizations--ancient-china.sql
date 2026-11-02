-- Ancient China: Shang, Zhou, and the Hundred Schools — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/ancient-china-shang-zhou-and-the-hundred-schools @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Erlitou and Sanxingdui, Shang oracle bones and bronzes, the Zhou and
-- the Mandate of Heaven, Spring and Autumn and Warring States, the Hundred
-- Schools (Confucius, Mencius, Xunzi, Mozi, Laozi, Zhuangzi, the
-- Legalists), and the road to Qin unification in 221 BCE.
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
    'history/ancient-civilizations/ancient-china-shang-zhou-and-the-hundred-schools',
    'research',
    'advanced',
    'read',
    $china_master$> **Ancient China**, from the Shang dynasty around 1600 BCE to the unification under Qin in 221 BCE, laid foundations that lasted into the twentieth century: a writing system whose characters are still recognisably in use, the idea that rulers govern by a revocable "Mandate of Heaven", and a body of philosophy, Confucian, Daoist, Mohist, and Legalist, that shaped East Asian thought ever after. Much of that philosophy was born not in peace but in the long breakdown of royal authority into centuries of war. This chapter follows that paradox: how political chaos produced the ideas that would later hold the largest state on earth together.

## Before the Shang

Later Chinese historians, above all Sima Qian, told of three ancient dynasties, the Xia, Shang, and Zhou, preceded by legendary sage-kings who taught people farming, flood control, and writing. Whether the **Xia** existed is still debated. The large Bronze Age site of **Erlitou** in Henan, dated to about 1900–1500 BCE, with palace foundations and early bronze vessels, has been identified by many Chinese archaeologists with the Xia, but no writing has been found there to confirm it.

Chinese civilization also did not grow from a single centre. The Yellow River valley in the north and the Yangzi in the south developed separately, as the Neolithic chapter described, and other regions had their own cultures. At **Sanxingdui** in Sichuan, pits dated to around 1200–1000 BCE contained astonishing bronze masks with protruding eyes, a bronze figure over two metres tall, and gold-covered objects unlike anything from the Shang heartland. The culture that produced them left no writing and is otherwise almost unknown. The traditional story of a single line of dynasties ruling "China" from the beginning was written later, by historians looking back from a unified empire.

## The Shang: Bronze, Bones, and Ancestors

The **Shang** dynasty ruled much of the north China plain from about 1600 to 1046 BCE. Its last capital, near modern **Anyang** in Henan, known as Yinxu ("ruins of Yin"), was occupied from about 1250 BCE.

The Shang were rediscovered through medicine. In 1899, according to a widely repeated story, a scholar named Wang Yirong noticed ancient writing on "dragon bones" sold as a traditional remedy. The bones were traced to Anyang, and from 1928 the Academia Sinica excavated there systematically. They are **oracle bones**: ox shoulder blades and turtle shells used in divination. A diviner would carve a question, apply a hot point to a prepared hollow, and read the resulting cracks as the answer from the ancestors or the high god **Di**. Questions concerned harvests, weather, military campaigns, hunting, illness, dreams, childbirth, and which ancestor needed sacrifices. Sometimes the result was recorded afterwards. About 150,000 fragments are known, and they form the earliest substantial body of Chinese writing.

The oracle-bone script is the direct ancestor of modern Chinese characters, which means the Chinese writing system has been in continuous use for more than three thousand years, longer than any other living script. Scholars have identified around 4,000 different characters in the inscriptions, of which perhaps a third have been confidently read. The script was already a mature writing system when the oracle bones were made, so writing in China probably began earlier, on perishable materials such as bamboo.

The Shang were masters of bronze. Unlike Mesopotamian and Egyptian metalworkers, they cast vessels in ceramic piece-moulds, producing massive ritual vessels such as the three- or four-legged *ding* cauldron, decorated with stylised animal faces called *taotie*. These vessels were used to offer food and wine to ancestors, and owning them marked status. Shang religion centred on the royal ancestors, who were believed to influence the living and needed regular offerings. It also involved human sacrifice on a large scale. Royal tombs at Anyang contained dozens to hundreds of sacrificed people, and the oracle bones record the sacrifice of thousands of captives, many of them Qiang people from the west.

The richest Shang tomb excavated intact belonged to **Fu Hao**, one of the wives of King Wu Ding, found in 1976. It contained more than 400 bronze objects, about 750 jades, and thousands of cowrie shells, then a form of currency. Oracle bones show that Fu Hao led military campaigns, commanded thousands of troops, conducted rituals, and controlled her own estate, evidence that some elite Shang women held substantial power.

{{image: Oracle bone | A Shang dynasty oracle bone, carved with a divination question. The script is the direct ancestor of modern Chinese characters.}}

```checkpoint
q: What were Shang oracle bones used for?
a*: Divination: questions were carved on bone or shell, heat was applied, and the cracks were read as answers from ancestors or gods.
a: Keeping tax records for the royal treasury.
x: Oracle bones are divination records, not tax accounts. This is a key difference from the earliest Mesopotamian writing, which began as accounting.
a: Recording laws for public display.
x: Oracle bones were used in private royal rituals, not as public legal texts.
a: Making medicine to cure illness.
x: They were used as medicine only in modern times, as "dragon bones", which is how they were rediscovered.
hint: Think about the heat and the cracks.
why: Oracle bones record questions put to ancestors and gods, so the earliest Chinese writing we have is religious and political rather than commercial.
---
q: What does the tomb of Fu Hao reveal about Shang society?
a: That women were excluded from all political and military roles.
x: Oracle bones record Fu Hao leading armies and conducting rituals, which contradicts this.
a: That the Shang had no bronze technology.
x: Her tomb contained more than 400 bronze objects.
a*: That some elite Shang women held substantial power, as Fu Hao commanded military campaigns and conducted rituals.
a: That the Shang did not practise human sacrifice.
x: Human sacrifice is well attested at Anyang, including in royal tombs.
hint: Compare the tomb's contents with what oracle bones say about her.
why: Combining an intact tomb with oracle-bone records shows a royal consort who was also a general and ritual leader.
```

## The Zhou and the Mandate of Heaven

Around 1046 BCE, the **Zhou**, a people from the Wei River valley to the west, defeated the last Shang king at the battle of Muye. Later tradition portrayed that king as a monster of cruelty and excess, and the Zhou founders, King Wen, King Wu, and the Duke of Zhou, who acted as regent for Wu's young son, as models of virtue.

To justify overthrowing a ruling dynasty, the Zhou developed one of the most influential political ideas in history: the **Mandate of Heaven** (*tianming*). Heaven (*tian*) grants the right to rule to a virtuous ruler, and withdraws it from one who becomes corrupt and neglects the people. Natural disasters, famines, and rebellions were signs that the mandate was being lost; a successful rebellion proved that it had passed to a new house. The idea was double-edged. It made royal power sacred, but conditional; it legitimated every successful rebel. Every later Chinese dynasty, down to the Qing in the twentieth century, claimed the Mandate of Heaven, and later historians organised the past as a **dynastic cycle** of virtuous founders, gradual decline, and loss of the mandate.

The **Western Zhou** (1046–771 BCE) ruled from near modern Xi'an. Its kings granted territories to relatives and allies, who ruled them as hereditary lords owing loyalty, tribute, and military service, a system often compared to European feudalism, though the comparison can mislead. Inscriptions cast inside Zhou bronze vessels record royal appointments and gifts and are a major source for the period. One, on a vessel known as the He *zun*, from the eleventh century BCE, contains the earliest known use of the term *zhongguo*, "central state" or "middle kingdom", which later became the Chinese name for China.

Over time the lords' loyalty to the king weakened. In 771 BCE the Zhou capital was sacked by an alliance of rebels and the Quanrong, a people from the west, and the last Western Zhou king was killed. A later story, told by Sima Qian, blames the king's infatuation with his consort Bao Si: he lit the alarm beacons to make her laugh, so that when real invaders came, no one answered. The tale is almost certainly a later moral fable. The dynasty moved its capital east to Luoyang, beginning the **Eastern Zhou**, but the kings now held little real power.

```checkpoint
q: Why was the Mandate of Heaven a double-edged idea for rulers?
a: Because it gave rulers absolute power that could never be challenged.
x: The mandate was conditional: Heaven could withdraw it from a bad ruler, which made rebellion potentially legitimate.
a*: Because it made royal power sacred but conditional on virtuous rule, so a successful rebellion could be taken as proof that Heaven had transferred the mandate.
a: Because it applied only to the Shang and was abandoned by the Zhou.
x: The Zhou created the idea to justify overthrowing the Shang, and later dynasties continued to use it.
a: Because it required rulers to be chosen by election.
x: The mandate was conferred by Heaven, not by voters; hereditary dynasties claimed it.
hint: Think about who could claim the mandate after a successful revolt.
why: The mandate legitimised rulers while setting a moral condition on their rule, and it gave successful rebels a way to claim legitimacy.
---
q: How should historians read the story of the last Western Zhou king lighting beacons to amuse Bao Si?
a: As a reliable eyewitness account of the fall of the Western Zhou.
x: The story was told centuries later and has the shape of a moral lesson rather than a contemporary record.
a: As proof that women caused the fall of dynasties.
x: Blaming a consort for a dynasty's fall is a recurring trope in Chinese history-writing, not evidence of what happened.
a: As a translation of an oracle-bone inscription.
x: The story comes from much later literary history, notably Sima Qian, not oracle bones.
a*: As a later moral fable that reflects how historians explained a dynasty's fall, rather than a reliable account of events.
hint: Think about the "boy who cried wolf" structure of the story.
why: Source criticism treats such stories as evidence of later moral and political attitudes; the fall of 771 BCE is better explained by the weakening of royal power and external attack.
```

## Spring and Autumn, Warring States

The Eastern Zhou is divided into two periods. The **Spring and Autumn period** (771–476 BCE) is named after the *Spring and Autumn Annals*, a chronicle of the state of Lu traditionally associated with Confucius. Dozens of states competed, and the strongest lords acted as "hegemons" who claimed to protect the Zhou king while pursuing their own interests. Wars were frequent but often limited, conducted by aristocrats in chariots according to codes of ritual behaviour.

The **Warring States period** (475–221 BCE) was different. Seven large states, Qin, Chu, Qi, Yan, Han, Zhao, and Wei, swallowed the smaller ones and fought each other for survival. Warfare was transformed:

- **Mass infantry armies** of conscripted peasants replaced aristocratic chariot warfare. Armies of tens or even hundreds of thousands are recorded, though the figures in later histories are often exaggerated.
- **The crossbow**, with a bronze trigger mechanism, gave ordinary soldiers great firepower.
- **Iron**, including cast iron, which Chinese metalworkers were producing by around the fifth century BCE, more than a thousand years before Europe, spread in tools and weapons and increased agricultural output.
- **Bureaucracy** replaced aristocratic rule. States appointed officials based on ability and paid them salaries, conducted censuses, built walls and canals, and registered peasants for tax and military service.
- **Coinage** in bronze, in the shapes of spades and knives and later round coins with square holes, spread trade.

The **battle of Changping** in 260 BCE, in which Qin defeated Zhao, illustrates the scale and brutality. Sima Qian claimed that Qin buried 400,000 surrendered Zhao soldiers alive. The figure is almost certainly an exaggeration, but archaeologists have found mass graves at the site.

## The Hundred Schools of Thought

Out of this chaos came an extraordinary burst of thinking about how to live and how to govern, later called the **Hundred Schools of Thought**. Rulers competing for survival welcomed advisers who could offer them a winning strategy, and wandering scholars travelled from court to court. The state of Qi even founded an academy at Jixia, where scholars of different schools were supported and debated.

**Confucius** (Kong Fuzi, about 551–479 BCE) was a minor official and teacher from the state of Lu who never achieved the political influence he sought. His teachings survive in the *Analects*, a collection of sayings compiled by his disciples after his death. He presented himself as a transmitter of the wisdom of the early Zhou, not an innovator: "I transmit but do not create." At the centre of his teaching was the cultivation of moral character. The ideal person, the *junzi* or "gentleman", was defined by virtue rather than birth. Key virtues were *ren*, humaneness or benevolence; *li*, ritual propriety, the proper conduct of relationships and ceremonies; and *xiao*, filial piety, respect for parents and ancestors. Good government came from rulers setting a moral example, not from harsh laws. Confucius also stressed the "rectification of names": a ruler should truly act as a ruler, a father as a father.

Later Confucians developed his ideas in different directions. **Mencius** (about 372–289 BCE) argued that human nature is fundamentally good and that a ruler who oppresses the people loses the Mandate of Heaven and may rightly be overthrown. **Xunzi** (about 310–235 BCE) argued the opposite: human nature is bad, and people become good only through education and ritual.

**Mozi** (about 470–391 BCE) founded the most organised rival school, the Mohists. He attacked Confucian ritual as wasteful, especially elaborate funerals and music, and taught *jian ai*, impartial care for everyone rather than graded love beginning with one's own family. He condemned wars of aggression, and his followers became experts in defensive warfare, offering to help besieged cities. Mohism disappeared as a school after the unification of China and was largely forgotten until modern times.

The **Daoists** turned away from political engineering altogether. The *Daodejing*, attributed to the legendary sage **Laozi** but probably compiled over time, with the earliest known versions on bamboo slips from Guodian dating to around 300 BCE, teaches harmony with the *Dao*, the "Way" underlying all things, and *wu wei*, effortless or non-coercive action. The best ruler governs so lightly that people hardly know he exists. The *Zhuangzi*, attributed to Zhuang Zhou, uses humour and parables, such as the famous dream in which Zhuangzi cannot tell whether he is a man who dreamed he was a butterfly or a butterfly dreaming he is a man, to question fixed distinctions and conventional values.

The **Legalists** offered rulers the most effective programme. They argued that people respond to rewards and punishments, not moral examples, so the state should rule by clear, strictly enforced laws applied equally to all, with harsh penalties for disobedience. **Shang Yang**, chief minister of Qin from the 350s BCE, reorganised the state: he grouped households into units responsible for each other's behaviour, abolished hereditary aristocratic privilege in favour of ranks earned by military merit, and promoted agriculture and war above trade and scholarship. The reforms made Qin the most powerful state, though Shang Yang himself was executed by a later ruler. The philosopher **Han Feizi** (died 233 BCE) systematised Legalist theory, and his fellow student **Li Si** became chief minister of the Qin ruler who unified China.

{{image: Confucius | A later portrait of Confucius (c. 551–479 BCE). His teachings, collected by his disciples in the Analects, became the foundation of Chinese ethical and political thought.}}

```checkpoint
q: How did Confucius think a state should be governed well?
a: Through strict laws enforced with harsh punishments.
x: That is the Legalist programme. Confucius emphasised moral example and ritual over punishment.
a: By withdrawing from politics and practising effortless action.
x: That is closer to Daoist ideas such as wu wei.
a*: Through rulers who cultivated virtue and set a moral example, with proper ritual and relationships, rather than relying on harsh laws.
a: By treating everyone with impartial care regardless of family ties.
x: That is Mozi's teaching of jian ai, which criticised Confucian graded love.
hint: Think about the junzi and the role of example.
why: Confucius believed virtue and ritual in rulers would transform society, a sharp contrast with the Legalists' reliance on law and punishment.
---
q: Why did Legalism prove so effective for the state of Qin?
a*: Because its strict laws, collective responsibility, and ranks earned by military merit mobilised the population for agriculture and war.
a: Because it encouraged scholars and merchants above soldiers.
x: Shang Yang's reforms did the opposite, promoting agriculture and war and restricting trade and scholarship.
a: Because it relied entirely on the moral example of the ruler.
x: Legalists rejected rule by moral example in favour of law, reward, and punishment.
a: Because it abolished all punishments.
x: Legalism was known for harsh punishments, not their abolition.
hint: Look at what Shang Yang's reforms rewarded.
why: Legalist reforms turned Qin into a highly organised state able to mobilise people and resources for war, which helped it defeat its rivals.
```

## The Road to Qin

The state of **Qin**, in the Wei River valley in the west, was long regarded by other states as semi-barbarian. It became the most powerful through Shang Yang's reforms, its strong defensive position behind mountain passes, and large irrigation projects such as the Zhengguo Canal. Between 230 and 221 BCE, the Qin king **Ying Zheng** conquered the remaining six states one after another.

In 221 BCE he took a new title, **Shi Huangdi**, "First Emperor". The Qin standardised the script, weights and measures, coinage, and even the width of cart axles, and divided the empire into commanderies governed by appointed officials rather than hereditary lords. According to later Han historians, the Qin burned books of rival philosophies in 213 BCE and executed scholars who criticised the regime; the scale of these events may have been exaggerated by Confucian historians hostile to Qin, but they reflect real Legalist suspicion of independent thought. The First Emperor's tomb complex near Xi'an, guarded by the Terracotta Army discovered in 1974, is among the most famous archaeological sites in the world.

The Qin dynasty collapsed within fifteen years of unification, but the unified state it created endured. The story of that state, beginning with the Han dynasty, continues in the chapter *Han China*, and the long arc of Chinese history in *Chinese History*. The ideas of the Hundred Schools, especially Confucianism, Daoism, and the Legalist techniques of administration, would shape it for the next two thousand years.

```checkpoint
q: Which Qin policy did the most to create lasting unity after 221 BCE?
a: Granting conquered territories to hereditary lords.
x: That was the Zhou system. Qin replaced it with commanderies run by appointed officials.
a: Making Daoism the official state religion.
x: Qin favoured Legalist administration, not Daoism.
a: Abolishing all written records.
x: Qin destroyed some texts of rival schools, but its administration depended on writing and standard script.
a*: Standardising the script, weights, measures, and coinage, and governing through appointed officials.
hint: Think about what helps people across a large territory communicate and trade.
why: A shared script and standard measures allowed a vast empire to be administered and to share a written culture across regions with different spoken languages.
---
q: Why should historians treat accounts of the Qin "burning of the books" with some caution?
a: Because no books existed in the Qin period.
x: Many books existed, written on bamboo slips and silk, and some survive.
a*: Because they come mainly from later Han historians, who were hostile to Qin and may have exaggerated its scale.
a: Because the event was invented by modern historians.
x: The event is reported in ancient sources, notably Sima Qian; the question is its scale.
a: Because Qin rulers were Confucian scholars who would never burn books.
x: The Qin were strongly Legalist and suspicious of independent scholarship.
hint: Who wrote the accounts, and how did they feel about Qin?
why: Accounts by a later dynasty's historians, who presented Qin as a cautionary tale, need to be read with their bias in mind.
```

## Further exploration

- **Sima Qian, *Records of the Grand Historian*, trans. Burton Watson.** The founding work of Chinese history-writing, including the story of Qin.
- **Li Feng, *Early China: A Social and Cultural History* (2013).** A clear, up-to-date survey from the Neolithic to the Qin.
- **Confucius, *The Analects*, trans. D. C. Lau or Edward Slingerland.** The core text of Confucianism, best read in a translation with commentary.
- **Benjamin I. Schwartz, *The World of Thought in Ancient China* (1985).** A classic study of the Hundred Schools.
- **Mark Edward Lewis, *Sanctioned Violence in Early China* (1990).** On warfare and the transformation of the Warring States.$china_master$,
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
  select $china_quiz$[
    {"type": "mcq", "prompt": "What makes the Shang oracle-bone script especially significant?", "options": ["It is the direct ancestor of modern Chinese characters, part of the longest continuously used writing system", "It was an alphabet borrowed from Mesopotamia", "It was used only for tax records", "It has never been deciphered"], "answerIndex": 0, "explanation": "Oracle-bone characters evolved into modern Chinese characters, giving Chinese writing more than three thousand years of continuous use.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Mandate of Heaven allow later Chinese dynasties to claim?", "options": ["That their rule could never be lost", "That their power was sacred but conditional, and that a successful rebellion showed Heaven had transferred the mandate", "That rulers were chosen by popular vote", "That only the Shang royal family could rule"], "answerIndex": 1, "explanation": "The idea, created by the Zhou to justify overthrowing the Shang, linked legitimacy to virtue and was used by every later dynasty.", "id": "q2"},
    {"type": "mcq", "prompt": "Which thinker taught 'impartial care' and opposed wars of aggression?", "options": ["Confucius", "Laozi", "Mozi", "Han Feizi"], "answerIndex": 2, "explanation": "Mozi's jian ai challenged Confucian graded love; his followers specialised in defending besieged cities.", "id": "q3"},
    {"type": "mcq", "prompt": "Which change in Warring States warfare helped transform Chinese states?", "options": ["A return to aristocratic chariot duels", "Mass conscript infantry armies, the crossbow, and bureaucratic mobilisation of peasants", "The abolition of armies", "The use of gunpowder cannon"], "answerIndex": 1, "explanation": "Mass infantry, iron, crossbows, and bureaucracies that registered and taxed peasants replaced the older aristocratic warfare.", "id": "q4"},
    {"type": "open", "prompt": "Compare the Confucian and Legalist answers to the question of how to govern a state. Why did Legalism help Qin win, and why did Confucianism outlast it?", "rubric": "A strong answer contrasts Confucian rule by moral example, ritual (li), humaneness (ren), filial piety, and the junzi with Legalist rule by clear laws, rewards and punishments, collective responsibility, and ranks earned by merit (Shang Yang, Han Feizi, Li Si). It explains how Legalist reforms mobilised Qin for agriculture and war, enabling unification in 221 BCE. It notes Qin's rapid collapse and, ideally with reference to later Han history, how Confucian ideas became the state orthodoxy while Legalist administrative techniques were kept in practice. Better answers mention Mencius and Xunzi's contrasting views of human nature.", "id": "q5"},
    {"type": "open", "prompt": "Why is it said that the Hundred Schools of Thought were born out of political chaos?", "rubric": "A strong answer explains that the weakening of Zhou royal authority led to the Spring and Autumn and Warring States periods, with intense competition among states; rulers sought advisers with winning strategies; scholars travelled between courts; institutions such as the Jixia academy supported debate. It shows how each school responded to disorder: Confucius by restoring virtue and ritual, Mozi by impartial care and opposition to aggressive war, Daoists by withdrawal and wu wei, Legalists by law and state power. It may note that much of this thought later became the foundation of a unified empire.", "id": "q6"}
  ]$china_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/ancient-china-shang-zhou-and-the-hundred-schools', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
