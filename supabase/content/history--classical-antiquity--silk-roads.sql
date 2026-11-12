-- The Silk Roads — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/the-silk-roads @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The name and its critics, the opening of the routes, overland and
-- maritime routes, relay trade and the Sogdians, goods, religions and
-- technologies, disease, and the Dunhuang manuscripts and modern
-- Silk Road politics.
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
    'history/classical-antiquity/the-silk-roads',
    'research',
    'advanced',
    'read',
    $silk_master$> **The Silk Roads** were not a road, and they did not mainly carry silk. They were a shifting web of overland and maritime routes that, from around the second century BCE, linked China, Central Asia, India, Iran, the Mediterranean, and East Africa, and that carried goods, people, religions, technologies, and diseases across Eurasia for more than fifteen centuries. Almost no one travelled the whole way. This chapter describes how the routes worked, who ran them, what moved along them, and why historians now argue about whether the very name "Silk Road" helps or distorts our understanding of them.

## A Name Popularised in 1877

The term is modern. In 1877 the German geographer **Ferdinand von Richthofen**, writing in his study of China, in which he also considered routes for a railway between Germany and China, popularised the term *Seidenstraße* (earlier German writers, such as Carl Ritter, had occasionally used the phrase), "Silk Road", for the overland trade routes between Han China and the Roman world. It became popular in the twentieth century, especially after explorers and archaeologists such as Sven Hedin and Aurel Stein made dramatic discoveries in the deserts of Central Asia. It now covers a vast range of routes, periods, and kinds of exchange, which is part of the problem.

Historians use the plural, **Silk Roads**, to stress that there was no single route, and that the network changed constantly over time. Some, such as **Valerie Hansen** in *The Silk Road: A New History* (2012), have argued from documents found in Central Asia that most trade was local and small-scale, and that long-distance commerce was less important than the romantic image suggests; far more significant were the movements of ideas, religions, and people, and the role of states, especially the Chinese state, whose payments to garrisons stimulated local economies. Others, such as Peter Frankopan in *The Silk Roads* (2015), use the term to argue for the centrality of Central Asia and the Middle East in world history. Both approaches agree that the network mattered enormously, even if "Silk Road" is a simplification.

## Opening the Routes

Exchange across Eurasia is much older than the name. Steppe peoples such as the **Scythians** and the related Saka, Iranian-speaking nomads whose cultures ranged from the Black Sea to the Altai mountains from the first millennium BCE, carried goods, horses, and artistic styles across the grasslands; Chinese silk has been found in a burial at Pazyryk in the Altai, once dated to the fifth century BCE and now usually to the fourth or third. What changed in the second century BCE was the involvement of a great empire. When the Han emperor Wu sent **Zhang Qian** west in 138 BCE, as the chapter on Han China described, his reports of the kingdoms of Central Asia led the Han to push their garrisons west to Dunhuang and beyond, in order to secure horses and allies against the Xiongnu. That state investment, together with the Parthian and Kushan empires further west, turned scattered exchanges into a regular network.

## The Routes

The classic overland route began at the Han capital **Chang'an** and ran northwest through the **Hexi Corridor** to the oasis of **Dunhuang**, at the edge of the desert. Beyond Dunhuang, at the Jade Gate and Yang Pass, travellers faced the **Taklamakan Desert** in the Tarim Basin, one of the driest places on Earth. They skirted it by a northern or a southern route through a chain of oasis towns, such as Turfan, Kucha, Khotan, and Kashgar, watered by rivers from the surrounding mountains. From Kashgar, routes crossed the Pamir mountains to **Sogdiana**, with cities such as **Samarkand** and Bukhara, and to Bactria, then continued through Iran, past Merv, to Mesopotamia and the Mediterranean ports of Syria. Branches ran south into India and north onto the steppe.

Equally important was the **maritime route**. Ships sailed from southern China through the South China Sea, past the Strait of Malacca, to India and Sri Lanka, and on to the Persian Gulf, Arabia, the Red Sea, and East Africa, using the predictable **monsoon winds**, as the chapter on classical India described. Over the long run, sea routes probably carried more goods than land routes, because ships could carry heavy and bulky cargoes much more cheaply than camels.

Travel overland was slow and dangerous. Caravans of Bactrian camels, which can endure cold and drought, crossed deserts and mountain passes, relying on oasis towns and, under strong states, on garrisons and way stations. At **Xuanquanzhi**, a Han postal station near Dunhuang, archaeologists found more than 35,000 wooden slips, about 23,000 of them inscribed, recording the arrival and departure of envoys, officials, and travellers, including people from Central Asian kingdoms such as the Yuezhi and Wusun.

{{image: Taklamakan Desert | The Taklamakan Desert in the Tarim Basin. Silk Road travellers skirted it by northern and southern routes through a chain of oasis towns.}}

```checkpoint
q: Why do historians prefer to speak of the "Silk Roads" in the plural?
a*: Because there was no single road but a shifting network of overland and maritime routes that changed over time.
a: Because there were exactly two roads, one by land and one by sea.
x: The plural reflects a complex, changing network of many routes, not just two.
a: Because silk was carried on separate roads from other goods.
x: Different goods often travelled the same routes; the plural concerns the network's complexity.
a: Because the Chinese and Romans each built their own road.
x: Neither empire built a road across Eurasia; the routes were used and maintained by many peoples and states.
hint: Think about what "network" means.
why: The plural captures the many routes, both land and sea, and their constant change over fifteen centuries.
---
q: Why did maritime routes probably carry more goods than overland routes over the long run?
a: Because sea travel was always faster and completely safe.
x: Sea travel had its own dangers, such as storms and piracy; its advantage was cost and capacity.
a: Because camels could not carry any goods.
x: Camels carried goods on overland routes; they simply carried far less than ships.
a*: Because ships could carry heavy, bulky cargoes much more cheaply than pack animals, using predictable monsoon winds.
a: Because overland routes were closed for all of their history.
x: Overland routes operated for long periods, though they were often disrupted.
hint: Compare the capacity of a ship and a camel.
why: Cheap bulk transport by sea made maritime routes central to long-distance trade, especially in the Indian Ocean.
```

## Middlemen: Relay Trade and the Sogdians

Very few individuals travelled from China to the Mediterranean. Instead, goods moved in a **relay**, passing through the hands of many merchants and states, each of whom bought, sold, and taxed them. The Han Chinese envoy Gan Ying, as the chapter on Han China described, was apparently discouraged by Parthian intermediaries from reaching Rome, and Roman writers had only vague ideas of the "Seres", the silk people, at the other end.

Among the most important middlemen were the **Sogdians**, an Iranian-speaking people from the region around Samarkand, who dominated Silk Road trade from around the fourth to the eighth century CE. Sogdian merchant communities settled along the routes into China, and some Sogdians became soldiers, officials, and entertainers in the Chinese empire. In 1907 the archaeologist Aurel Stein found in a watchtower near Dunhuang a bundle of letters written by Sogdian merchants in the early fourth century CE, known as the **Sogdian Ancient Letters**, apparently never delivered. They describe trade in silver, musk, and other goods, the chaos caused by the sack of Chinese cities, and, in one letter, a woman named Miwnay, abandoned in Dunhuang by her husband with her daughter, telling him she would rather have married a dog or a pig than him. These letters are a rare window into the ordinary people of the Silk Roads.

Nomadic peoples of the steppe, such as the Xiongnu, and later the Turks and Mongols, were not simply raiders on the edge of the Silk Roads. They were participants who traded horses and furs, demanded silk as tribute, protected or taxed caravans, and at times, especially under the Mongols in the thirteenth century, made long-distance travel safer than ever before.

## What Moved

**Silk** was the most famous export from China, prized in Rome for its lightness and sheen. Roman moralists such as Seneca complained that silk garments revealed too much, and Pliny the Elder complained about the drain of Roman gold eastward to pay for luxuries. Early in Tiberius's reign (in 16 CE, according to Tacitus) the Senate decreed that men should not wear silk. Chinese silk was also a currency: Chinese states paid soldiers and allies in bolts of silk. The secret of silk production eventually spread. According to the Byzantine historian Procopius, around 552 CE monks brought silkworm eggs to Constantinople (a later account says they were hidden in a hollow cane), allowing the eastern Roman empire to produce its own silk.

Many other goods travelled too: horses from Central Asia to China; glass, silver vessels, and coral from the Roman world and Iran; spices, pepper, cotton textiles, and precious stones from India; jade from Khotan; and later **paper** from China to the Islamic world, porcelain, and much more. Plants and animals moved as well, such as grapes and alfalfa from Central Asia to China.

The most important things that moved may have been ideas:

- **Buddhism** spread from India through the Kushan lands of Central Asia into China from the first century CE. Monks such as **Kumarajiva**, from Kucha, translated Buddhist texts into Chinese in the early fifth century, and the Chinese monk **Xuanzang** travelled to India between 629 (some sources say 627) and 645 to collect texts, a journey later fictionalised in the novel *Journey to the West*. Buddhist cave temples, such as the Mogao Caves at Dunhuang, line the routes.
- **Manichaeism**, a religion founded by the Persian prophet Mani in the third century, spread both west and east, and became the state religion of the Uyghur empire in the eighth century.
- **Christianity** of the Church of the East reached China by the seventh century; a stone stele erected in Chang'an in 781 records its history in Chinese and Syriac.
- **Zoroastrianism**, Judaism, and, later, **Islam** also travelled the routes.

Technologies spread along the same paths, including papermaking, which reached the Islamic world by the eighth century, and later, printing and gunpowder.

```checkpoint
q: What do the Sogdian Ancient Letters reveal?
a: The official correspondence of the Roman and Chinese emperors.
x: The letters were written by Sogdian merchants and their families, not by emperors.
a*: The everyday world of Sogdian merchants and families, including trade, the effects of war, and personal hardship such as an abandoned wife's anger.
a: The first written description of the Silk Road by Richthofen.
x: Richthofen wrote in 1877; the letters date from the early fourth century CE.
a: Instructions for producing silk in Central Asia.
x: The letters concern trade and personal affairs, not silk production.
hint: Who wrote them, and why were they never delivered?
why: Undelivered letters preserve the voices of ordinary participants in Silk Road trade, rather than those of emperors and officials.
---
q: Which statement best describes how Buddhism reached China?
a: It was imposed by the Han emperors after conquering India.
x: The Han never conquered India; Buddhism spread through trade and missionaries.
a: It was brought directly from India by sea in the third century BCE.
x: Buddhism reached China mainly overland via Central Asia, beginning around the first century CE.
a: It was carried to China by Roman traders.
x: Romans played no significant role in the spread of Buddhism.
a*: It spread from India through Central Asia, especially the Kushan lands, carried by merchants and monks, from around the first century CE.
hint: Think about the Kushans and the oasis towns.
why: Buddhism travelled the Silk Roads with merchants and missionaries, transforming Chinese religion and culture.
```

## Disease and the Silk Roads

The same connections that carried goods and ideas also carried disease. Epidemics that struck the Roman and Chinese empires in the second and third centuries CE, such as the **Antonine Plague**, may have travelled along trade routes, though their origins are uncertain. The **Plague of Justinian** of 541 CE, caused by the bacterium *Yersinia pestis*, spread through the Mediterranean world from Egypt, probably arriving by sea from the Indian Ocean or overland from Central Asia. Eight centuries later, the **Black Death** of the fourteenth century travelled along the trade routes of the Mongol era; a 2022 genetic study traced its source to the Tian Shan region near Lake Issyk-Kul, in modern Kyrgyzstan, where victims died in 1338–39, as the chapter on the Black Death describes. Connection was a source of both wealth and catastrophe.

## Rediscovery and the Modern Silk Road

In 1900 a Daoist monk named Wang Yuanlu discovered a sealed chamber, now called the Library Cave, in the Mogao Caves at Dunhuang, containing tens of thousands of manuscripts, paintings, and printed texts in Chinese, Tibetan, Sogdian, Sanskrit, Uyghur, and other languages, sealed in the early eleventh century. Among them was a copy of the *Diamond Sutra* dated 868 CE, the earliest dated printed book in the world. In 1907 and 1908, the explorers Aurel Stein and Paul Pelliot bought large numbers of these manuscripts and took them to London (with part of Stein's share going to India) and Paris. Many Chinese scholars regard this as plunder, and the documents remain divided between collections across the world, now partly reunited online by the International Dunhuang Programme.

The image of the Silk Road has also been used politically. Since 2013 the Chinese government has promoted a global infrastructure programme, now called the **Belt and Road Initiative**, deliberately invoking the Silk Road as a symbol of peaceful, mutually beneficial exchange led by China. Other states and organisations have promoted their own "new Silk Roads". These uses show how a term popularised by a German geographer in 1877 has become a powerful modern myth, which, like other historical myths, says as much about the present as about the past.

{{image: Diamond Sutra | The frontispiece of the Diamond Sutra from Dunhuang, dated 868 CE, the earliest dated printed book in the world.}}

```checkpoint
q: Why is the removal of the Dunhuang manuscripts by Stein and Pelliot controversial?
a: Because the manuscripts were forgeries.
x: The manuscripts are genuine; the controversy concerns how they left China.
a: Because Stein and Pelliot destroyed most of the manuscripts.
x: The manuscripts were preserved in European collections; the issue is their removal, not their destruction.
a*: Because they were bought cheaply and taken abroad in the early twentieth century, which many Chinese scholars regard as plunder, and the collection was scattered across the world.
a: Because the manuscripts were found in Rome.
x: They were found at Dunhuang in western China.
hint: Think about the history of colonial collecting.
why: The Dunhuang manuscripts are part of a wider debate about cultural heritage removed under unequal conditions, similar to the Aksum obelisk.
---
q: Why do historians describe the modern "Silk Road" as partly a myth?
a*: Because the term, popularised in 1877, simplifies a complex network and has been used to support modern political projects such as the Belt and Road Initiative.
a: Because the trade routes never existed.
x: The routes and exchanges were real; the myth concerns the romanticised and political uses of the name.
a: Because silk was never traded at all.
x: Silk was traded, though it was only one of many goods.
a: Because the name was invented by the Han dynasty.
x: The term was popularised by Ferdinand von Richthofen in 1877, not invented by the Han.
hint: Who popularised the term, and who uses it today?
why: A term can be useful and still shape the past to fit modern purposes, which is why historians use it critically.
```

## Further exploration

- **Valerie Hansen, *The Silk Road: A New History* (2012).** A history based on documents found along the routes, emphasising local trade and the role of states.
- **Peter Frankopan, *The Silk Roads: A New History of the World* (2015).** A sweeping argument for the centrality of Central Asia and the Middle East.
- **Susan Whitfield, *Life Along the Silk Road* (2nd ed., 2015).** Portraits of twelve individuals, from merchants and soldiers to a nun and a shipmaster.
- **Étienne de la Vaissière, *Sogdian Traders: A History* (English trans. 2005).** The standard history of the Sogdians.
- **James A. Millward, *The Silk Road: A Very Short Introduction* (2013).** A brief, balanced introduction.$silk_master$,
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
  select $silk_quiz$[
    {"type": "mcq", "prompt": "Who popularised the term 'Silk Road'?", "options": ["Marco Polo", "The Han emperor Wu", "Ferdinand von Richthofen, in 1877", "Herodotus"], "answerIndex": 2, "explanation": "The German geographer Richthofen used 'Seidenstraße' in 1877; it became popular in the twentieth century.", "id": "q1"},
    {"type": "mcq", "prompt": "Which people dominated Silk Road trade from about the fourth to the eighth century CE?", "options": ["The Sogdians of the Samarkand region", "The Romans", "The Vikings", "The Aztecs"], "answerIndex": 0, "explanation": "Sogdian merchant communities settled along the routes into China and acted as key middlemen.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the significance of the Diamond Sutra found at Dunhuang?", "options": ["It is the oldest silk garment", "It records Zhang Qian's journey", "It is a Roman trade contract", "It is the earliest dated printed book, from 868 CE"], "answerIndex": 3, "explanation": "Found in the Library Cave, sealed in the early eleventh century, it is the earliest dated printed book in the world.", "id": "q3"},
    {"type": "mcq", "prompt": "Why did Valerie Hansen argue that the romantic image of the Silk Road is misleading?", "options": ["Because silk was never traded", "Because documents show most trade was local and small-scale, with ideas, religions, and state spending more important than long-distance commerce", "Because the routes were invented in the nineteenth century", "Because only Romans travelled them"], "answerIndex": 1, "explanation": "Documents from Central Asia reveal mostly local exchange, with the movement of people and ideas, and Chinese state spending on garrisons, playing major roles.", "id": "q4"},
    {"type": "open", "prompt": "What were the most important things to move along the Silk Roads? Argue for your choice.", "rubric": "A strong answer weighs goods (silk, horses, glass, spices, paper, silver), religions (Buddhism via the Kushans, Kumarajiva and Xuanzang; Manichaeism; Church of the East; Zoroastrianism; Islam), technologies (papermaking, later printing and gunpowder), and diseases (Antonine and Justinianic plagues, the Black Death traced to the Tian Shan around 1338–39). It argues for a choice and uses evidence such as the Sogdian Ancient Letters or the Dunhuang Library Cave.", "id": "q5"},
    {"type": "open", "prompt": "Is 'Silk Road' a useful term for historians? Explain the arguments on both sides.", "rubric": "A strong answer explains the term's origin with Richthofen in 1877 and its popularisation; its simplifications (no single road, silk only one good, much trade local, maritime routes probably more important, relay trade); critiques by Hansen; the uses of the term by Frankopan to centre Central Asia; and modern political uses such as the Belt and Road Initiative. It reaches a reasoned position, such as using the plural and the term critically.", "id": "q6"}
  ]$silk_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/the-silk-roads', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
