-- Chinese Buddhism and the Rise of Neo-Confucianism — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/chinese-buddhism-and-neo-confucianism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/chinese-buddhism-and-neo-confucianism',
    'research',
    'advanced',
    'read',
    $neoconf_master$> **How Buddhism became Chinese, and how the Confucians answered it.** This chapter follows Buddhism from its arrival in Han China to three Chinese schools: Tiantai, with its "three truths"; Huayan, whose argument that a rafter "is" the building is set out step by step; and Chan, whose founding stories modern scholars have unpicked. It then turns to the Song revival known as the Learning of the Way, or Neo-Confucianism: Zhou Dunyi, Zhang Zai and the Cheng brothers, Zhu Xi's philosophy of pattern (*li*) and vital stuff (*qi*), and Lu Xiangshan's objection that the pattern is already complete in the mind. It asks how Buddhist this anti-Buddhist movement was, and ends in Korea and Japan.

## A Foreign Teaching Arrives

Buddhism reached China by the first or second century CE, during the Han dynasty (206 BCE–220 CE), carried along the trade routes across Eurasia. Its first Chinese name was "the teaching of the images". A legend says that Emperor Ming of Han dreamed of a golden figure and sent envoys west, and that two Indian monks came to Luoyang on white horses, giving the White Horse Temple its name; even the embassy is only semi-legendary. The first documented translator is An Shigao, a Parthian active in Luoyang around 148–180. By the sixth century, according to Peter Hershock, "over two million people—roughly one out of every twenty-five people in China—were ordained as monks and nuns". Buddhism brought monastic communities for women as well as men, and around 516 the monk Baochang compiled the *Lives of the Nuns*, sixty-five biographies of nuns of the fourth to sixth centuries.

How did Chinese readers grasp ideas such as "emptiness"? A textbook story says early translators used *geyi*, "matching concepts", rendering Buddhist terms with Daoist words. Victor Mair has strongly contested this (2010). He finds no evidence that *geyi* was a translation method: the word occurs only about twenty-three times in the Buddhist canon, and it was "a highly ephemeral and not-very-successful attempt on the part of a small number of Chinese teachers to cope with the flood of numbered lists of categories…". The broader point survives. Buddhism arrived while a Daoist revival called *xuanxue*, "profound learning", flourished after the Han, as Mozi, the Daoists and the Legalists anticipates, and its vocabulary shaped early understanding until Buddhism eclipsed it.

The turning point was Kumārajīva (344–413; some sources differ), a monk from Kucha in Central Asia trained in Nāgārjuna's philosophy of emptiness, Madhyamaka, described in Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic. Brought to Chang'an around 401, he led a translation team whose versions of the *Lotus* and *Diamond* sūtras prized clarity and meaning over literal rendering. His student Sengzhao, who died young in the early fifth century, came to Buddhism from Laozi and Zhuangzi and argued, with Zhuangzi-like paradox, that "things do not shift": past things stay in the past and do not come into the present, so arising and ceasing are empty and motion and stillness are "not two". Later Xuanzang (602–664) returned from India in 645 with 657 texts and founded, with his disciple Kuiji, a Chinese Yogācāra school ("Consciousness-only"), which held that not all beings can become buddhas.

Because texts from many Indian traditions arrived piecemeal, Chinese Buddhists did not see them as fundamentally inconsistent. They developed *panjiao*, "doctrinal classification", ranking each teaching as a partial truth by how "rounded" it was; Bryan Van Norden and Nicholaos Jones liken this to inference to the best explanation. The schools that ranked themselves highest were the most distinctively Chinese.

## Tiantai: Everything Includes Its Opposite

Tiantai is named after a mountain in Zhejiang where Zhiyi (538–597) settled in 575. Basing himself on the *Lotus Sūtra*, he read a verse of Nāgārjuna's linking dependent arising, emptiness and the middle way as a "threefold truth": emptiness, provisional positing and the centre. Brook Ziporyn reconstructs the reasoning. To be a determinate X, a thing must exclude what it is not. But any relation between two things needs something in common, and things that wholly exclude each other have nothing in common, so they could not relate at all. Hence X is "non-different" from non-X (emptiness), yet "non-same" with it, or there would be no X (provisional positing); and these are one fact seen two ways (the centre). The consequences are startling: "Good and evil, delusion and enlightenment, Buddhahood and deviltry," Ziporyn writes, "are all 'inherently entailed' in each and every event." He admits this strikes most readers as "wildly outlandish"; Tiantai's reply is that it states "inescapable entailments of everyday experience", in which things constantly appear one way and turn out another. The school passed to Japan as Tendai and to Korea as Cheontae.

## Huayan: The Rafter Is the Building

Huayan, "Flower Garland", is named after the *Avataṃsaka Sūtra*. Its first patriarch, Dushun (557–640), called ultimate reality *li*, "principle" or "pattern", and phenomena *shi*, "events", with "mutual non-obstruction" between them, like water and its waves. That word *li* will matter later. The school's systematiser was Fazang (643–712), born in Chang'an of Sogdian descent and favoured by Wu Zetian (r. 690–705), the only female emperor in Chinese history. His teaching is "interpenetration": every phenomenon includes and depends on every other. In his *Essay on the Golden Lion*, the gold is the underlying emptiness and the lion-shape our perception of separate things: "There is really only gold; there is no lion. … The gold really does appear to be a lion" (Van Norden's gloss). In Indra's net, a mythical net with a jewel at every knot, each jewel reflects all the others.

His most famous argument, the Rafter Dialogue, runs as follows in Van Norden and Jones's reconstruction:

1. Whatever is conditioned depends for its existence and identity on something else (a principle inherited from Madhyamaka).
2. A building is nothing more than its parts in their arrangement. Remove one rafter and *this* building is not there, so each part is essential to the building's identity: the building is the rafter.
3. What makes a piece of wood a rafter is its role in a building. Outside it, the wood could become "a bench, or a teeter-totter, or simply kindling". So the rafter is the building.
4. Generalise to the whole cosmos: every phenomenon depends for its identity on every other and on the whole ("one is all"), and the whole on each ("all is one").
5. Yet each part keeps its distinct function: the parts are identical, in Fazang's words, "because they are different".

The obvious objection is common sense about parts and wholes. After a storm, a heap of rafters, planks and tiles is not a building, so a part's presence does not make the whole; and a plank stays the same plank when the building falls, so step 3 seems to trade on a mere redescription. Fazang's reply, in modern paraphrase, is that a rafter wholly creates the building only *as a rafter*, together with all the other conditions; a plank in a heap is not functioning as a rafter at all. And if each part only partly created the building, the whole would never come to be. The point is ethical too: since there is no separate self, failing to feel compassion is "like ignoring a wound to my own limb because it is temporarily numb".

Was this pure metaphysics? Stanley Weinstein saw Huayan's ordered universe, presided over by the cosmic Buddha Vairocana, as "analogous to the highly centralized imperial state" that Wu Zetian ruled, and Norman Harry Rothschild calls Fazang "a propagandist". Philosophers weigh the argument; historians ask whom it served. Huayan went on to Korea as Hwaeom and Japan as Kegon.

## Chan: A Homegrown Buddha

"Chan" transliterates the Sanskrit *dhyāna*, "meditation"; in Japan it became Zen. A Song-era formula described it as "a special transmission outside the scriptures; not established upon words and letters; directly pointing to the human heartmind; seeing nature and becoming a Buddha" (Hershock's translation). Its traditional history runs from the Buddha through Indian lineage holders to Bodhidharma, who brought the teaching to China; scholars now regard much of it, in Hershock's words, as "inventions of tradition".

The central figure is Huineng (638–713), the Sixth Patriarch. In the story he was an illiterate seller of firewood whom the Fifth Patriarch, Hongren, called a "barbarian"; Huineng replied, "Although my 'barbarian' body and yours differ, what difference is there in our buddha-nature?" In a verse contest the head monk Shenxiu wrote that the mind is a mirror to be wiped "moment by moment … not allowing dust to collect"; Huineng's answering verse denied the mirror's stand, and he received the robe of transmission in secret. The story comes from the *Platform Sutra*, the only Chinese Buddhist discourse given the status of a sūtra, which in effect, Hershock says, "proclaimed that Huineng was China's first 'homegrown' Buddha". The best-known form of the verse is this:

```quote
Bodhi originally has no tree. / The bright mirror also has no stand. / Fundamentally there is not a single thing. / Where could dust arise?
Huineng (attributed) · Platform Sutra, later version (trans. John McRae, 2003) · later than the Dunhuang text of c. 850
```

That famous third line is not in the earliest text. John McRae points out that the oldest version, in copies from Dunhuang of around 850, has two different verses, and that this one is later. Most scholars consider Huineng's life story "little more than pious fiction", and Morten Schlütter sees the *Platform Sutra* as "a product of a long evolution" assembled by several Chan groups with different agendas. The contrast between a "sudden" Southern school and a "gradual" Northern one is partly polemical too. In the 730s the monk Shenhui, claiming to be Huineng's student, attacked Shenxiu's imperially favoured line as gradualist and coined the name "Northern School" to deride it. McRae argues that Shenxiu's verse describes "a *constant* practice of cleaning the mirror", not gradual progress, and the *Platform Sutra* itself says: "in the dharma there is no sudden or gradual, but among people some are keen and others dull." McRae's first "Rule of Zen Studies" sums up his approach: "It's not true, and therefore it's more important."

Pure Land practice, which sought rebirth in the paradise of the buddha Amitābha chiefly by reciting his name, is often listed as another school; but many modern scholars doubt that an independent Pure Land school existed in China, where the practice lived within Tiantai, Chan and other traditions. Japan's Pure Land movements appear in the History chapter Medieval Japan: Court, Samurai, and Shogun.

```checkpoint
q: What does Fazang's Rafter Dialogue conclude?
a*: That each part and the whole depend on each other for their identity, so the rafter "is" the building while keeping its own function.
a: That buildings do not really exist, only rafters and planks.
x: Fazang does not dissolve the whole into its parts; the whole depends on the parts as they depend on it.
a: That a rafter remains a rafter whatever happens to the building.
x: This is closer to the objection; Fazang argues that wood is a rafter only through its role in a building.
a: That a building could stand if one rafter were removed.
x: The argument says the opposite: remove one rafter and this building is not there.
hint: Steps 2 and 3 run the dependence in both directions.
why: The building is nothing but its parts, so each part is essential to it; and wood is a rafter only within a building. Generalised, "one is all" and "all is one", yet each part keeps a distinct function.
---
q: Why do scholars such as John McRae treat the story of Huineng's victory over Shenxiu with caution?
a: Because Huineng's verse was written by Shenxiu himself.
x: Nothing in the sources says this; the verses are attributed to two different people.
a: Because the Platform Sutra was composed in Japan.
x: The earliest copies were found at Dunhuang, in China.
a*: Because the Platform Sutra is a late, layered text and the North–South story was shaped by Shenhui's polemic.
a: Because Hongren never had any students.
x: The only record from Huineng's lifetime lists him as Hongren's student.
hint: Who coined the name "Northern School", and why?
why: The earliest Dunhuang copies date from around 850, and the famous line "Fundamentally there is not a single thing" is from a later version. Shenhui, in the 730s, coined "Northern School" to deride Shenxiu's line.
```

## Persecution and the Confucian Response

Under the Tang emperor Wuzong, a zealous Daoist, the state turned on the monasteries. The Huichang persecution, culminating in 845, returned more than a quarter of a million monks and nuns to tax-paying lay life, as the History chapter Tang and Song China describes. Many text-based schools never fully revived, while Chan in the countryside flourished; by the twelfth century most public monasteries supported by the Song court were Chan.

Confucian critics had already spoken. In 819 Han Yu (768–824) called a relic of the Buddha's finger-bone "a filthy object", was condemned to death, and was saved by friends and exiled. He attacked monasticism as economically unproductive and proposed a canon within the canon: the *Mean*, the *Great Learning*, the *Analects* and the *Mencius*. His contemporary Li Ao wrote of the sage's nature as "absolutely still and without movement", language so Buddhist-sounding that T. H. Barrett titled his study *Li Ao: Buddhist, Taoist, or Neo-Confucian?*

A note on names. "Neo-Confucianism" is a modern Western-language label of ambiguous scope. Narrowly, it means the eleventh-century circle around the Cheng brothers and their followers, who called their movement *daoxue*, "Learning of the Way". Chinese scholars more often speak of *lixue*, "learning of principle", for the line of Cheng Yi and Zhu Xi, and *xinxue*, "learning of the heart-mind", for that of Lu Xiangshan and Wang Yangming.

## The Northern Song Masters

Zhou Dunyi (1017–1073), a minor official, wrote the short "Explanation of the Diagram of the Supreme Polarity", which opens: "Non-Polar(ity), and yet Supreme Polarity!" (John Thompson's translation). The Supreme Polarity, or "Great Ultimate", generates yin and yang through alternating stillness and activity; these produce the five phases, the myriad things, human beings and finally the sage. The diagram is widely thought to have Daoist sources, and Zhou's place as the movement's founder was largely Zhu Xi's later construction; one scholar compares it to Shenhui's lineage-building for Chan, "with Confucius taking the place of Huineng".

Zhang Zai (1020–1077) studied Buddhism and Daoism before returning to the Confucian texts. For him everything is *qi*, "vital stuff", the energy-matter that condenses into things and disperses again; against the Buddhists, change proves things real, not illusory. His "Western Inscription" makes Heaven and Earth everyone's parents: "That which fills the universe I regard as my body."

With the brothers Cheng Hao (1032–1085) and Cheng Yi (1033–1107), *li* first became the central concept of a philosophical system. Cheng Hao said that although he had learned much from others, "the two words *tian li* are what I grasped myself", and explained humaneness (*ren*) through doctors, who call numb limbs "not-*ren*": "a person of humanity will be in one body with ten thousand things". Cheng Yi held that "the original nature is just [a matter of] li" and drew the line sharply: Buddhists "based themselves on the heartmind", Confucians "based themselves on Heaven".

## Zhu Xi: Pattern and Vital Stuff

{{image: Zhu Xi | Zhu Xi (1130–1200), in a portrait preserved by his descendants and known today through a later re-engraving.}}

Zhu Xi (1130–1200) drew these threads together. As a young man he studied Chan, drawing on it in his answers when he passed the highest examination at nineteen, before becoming a student of Li Tong, in Cheng Yi's line. In his own day he was one claimant among many to the Chengs' mantle; by the end of the Song he was the movement's authoritative voice. He grouped the Four Books, as Confucius, Mencius and Xunzi explains, and his interpretation became the basis of the civil service examinations from 1313 until their abolition in 1905.

Why add *li* to *qi*? As Justin Tiwald reconstructs the reasoning, everything is made of *qi*, but the world shows a valuable order: plants and animals behave according to their kinds, and the seasons cooperate to sustain life. Some facts are not explained by the stuff alone: why boats travel only by water and carts only by land, why children are inclined to love their parents. And some are normative: it is not just that children tend to serve their parents but that it is *right* that they do. So a further ground is needed, *li*, "pattern" or "principle", whose content is "ceaseless life-generativity", one pattern shared by all things. Li is "prior" to *qi*, though not in time; it is what we infer back to as more fundamental, and it sets the rules *qi* follows of its own power. Human nature is li and therefore good; moral failure is turbid *qi* obscuring it. Zhu's images for li are concrete: the grain in wood, the veins in a leaf.

A minority, from Zhang Zai to Wang Fuzhi (1619–1692) and Dai Zhen (1723–1777), objected that *qi* fully explains the world's order, so that patterns are just regularities in how *qi* interacts. Dai Zhen added that Zhu read his metaphysics into the classics: when Confucius cried that Heaven had forsaken him, did he mean that li had? Kirill Thompson replies for Zhu that li is implicated in the possible configurations of *qi*, which is why regular patterns can emerge at all, and that a *qi*-only view cannot account for a varied yet systematic world; besides, Zhu's commentary on that passage speaks of Confucius' grief, not of pattern. What li is remains disputed. Tiwald finds in Zhu "a certain metaphysical dualism"; Feng Youlan compared li to Plato's Forms, a comparison What Exists? Ontology and Universals takes up; Thompson and A. C. Graham read li as immanent "pattern" that never exists apart from *qi*.

## Investigating Things: Zhu Xi against Lu Xiangshan

How does one become a sage? Zhu settled on a twofold method: reverence (*jing*, which Michael Kalton renders "mindfulness") and the "investigation of things" (*gewu*), a phrase from the *Great Learning*. His case can be set out step by step.

1. Everyone has the moral pattern innately, but it is obscured by *qi* and selfish desire.
2. So our intuitions are unreliable: we are, in Tiwald's account of Zhu's worry, "too predisposed to rationalize or find clever ways of countenancing self-serving inclinations and judgments".
3. We therefore need a check independent of our momentary heart-mind.
4. Pattern is present in things, affairs and the classics, so we should read the classics, study history, handle affairs and observe nature, grasping how things are and "the reasons why it is so".
5. Because pattern is one while its manifestations are many, accumulated cases let us infer by analogy and eventually understand the whole.
6. So investigation, with reverence, is the path to sagehood.

Zhu observed nature closely: he inferred from fossil seashells on a mountain that it had once been seabed. Whether this was science or, in Thompson's words, "pragmatic rather than epistemic" is debated.

Lu Xiangshan (Lu Jiuyuan, 1139–1193) objected. A recorded dialogue with a student runs:

```quote
Bomin asked: How is one to investigate things? The Teacher said: Investigate the principle of things. Bomin said: The ten thousand things under Heaven are extremely multitudinous; how, then, can we investigate all of them exhaustively? The teacher replied: The ten thousand things are already complete in us. It is only necessary to apprehend their principle.
Lu Xiangshan · recorded dialogue (trans. Siu-chi Huang, 1977) · 12th century
```

Book-learning, Lu thought, is fragmentary and cannot be taken wholeheartedly to heart; since our ethical capacities are well formed by nature, we should rely on deeply felt insight in daily life. A famous saying of his, variously translated, runs: "The universe is my mind, and my mind is the universe." Zhu replied that Lu's method had no standard independent of subjective whim, which made it, in his frequent complaint, "too Buddhist"; and that the infinite-task worry misreads the method, for as Cheng Yi had said, once a pattern is exhausted in one case, "for the rest one can infer by analogy". Lu could answer, on John Berthrong's reconstruction, that he was no solipsist: starting from external things, we "fall prey to the problems of self-delusion and partiality".

In 1175 the scholar Lü Zuqian brought Zhu together with Lu and his elder brother at the Goose Lake (Ehu) Temple in Jiangxi, hoping to reconcile them; they parted unreconciled. Lu's school attracted few followers until Wang Yangming revived it, a story told in Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata.

## How Buddhist Was the Learning of the Way?

The Neo-Confucians charged Buddhism with selfishness, for putting personal liberation above family and society, and with making things illusory and worthless through its doctrine of emptiness. Yet the debt looks large. Tiwald argues that their strong reading of Mencius, on which human nature is already well formed rather than merely able to become good, more likely comes from Buddha-nature teaching, with which it shares images of a pearl in muddy water and a dusty mirror. Van Norden and Jones count *li* "precisely zero times" in the *Analects* and *Great Learning*, and find Zhu giving it "a metaphysical meaning very reminiscent of Indra's net". Quiet-sitting and the aim of eliminating selfish desires point the same way. Berthrong grants this "stimulus theory" "a genuine element of truth", but argues that, "once prompted", the Neo-Confucians built "out of materials indigenous to the historical development of the Confucian Way". The History of Philosophy overview's phrase about a synthesis with Buddhist metaphysics states one side of this live debate.

The legacy for women is also contested. Asked about impoverished widows, Cheng Yi said: "To starve to death is a small matter, but to lose one's chastity is a great matter." He is widely blamed for the cult of widow chastity, which peaked under the Qing; yet Lisa Rosenlee notes that he proudly spoke of his father giving a grand-niece in remarriage, and Zhu Xi condoned a widow's remarriage when she would otherwise face destitution. Lijuan Shen and Paul D'Ambrosio note that by the Song, mainstream discourse viewed women's ability and character as inferior. Rosenlee also stresses that footbinding has no textual basis connecting it to Confucian philosophy.

## Korea and Japan

In Korea, Neo-Confucianism became the official ideology of the Chosŏn dynasty, founded in 1392, as Premodern Korean History describes. Korean thinkers pressed a question Zhu had left open: how do li and *qi* work in our emotions? Mencius's Four Beginnings (such as commiseration and the sense of right and wrong) are always good; the Seven Feelings of the *Book of Rites* (such as joy and anger) can go wrong. Yi Hwang (Toegye, 1501–1570) linked the Four with li and the Seven with *qi*; in their letters Kobong (Ki Taesŭng) objected that li and *qi* are inseparable in every actual thing. Toegye's mature answer was "alternate issuance": the Four arise as li issues and *qi* follows, the Seven as *qi* issues and li rides it, like a rider guiding a horse. Yi I (Yulgok, 1536–1584) replied that *qi* activates both, and *ki* issues and *i* "mounts" it; the Seven include the Four. Michael Kalton and his co-translators call the exchange "the most important intellectual event in the entire history of Korean Confucian thought", and Berthrong calls Yulgok's answer "probably the most imaginative reinterpretation of Zhu's daoxue to be found in traditional East Asia".

In Japan, Song Neo-Confucianism arrived from the thirteenth century with Zen monks and long stayed inside Zen monasteries. Hayashi Razan (1583–1657) became an adviser to the second Tokugawa shogun from 1607, and the headship of the Edo Confucian academy became hereditary in his family; the naturalist Kaibara Ekken (1630–1714) recorded doubts about Zhu Xi in a work that opens by quoting Lu Xiangshan. The Tokugawa story continues in Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata; Zen's modern philosophical life in The Kyoto School and Modern Japanese Philosophy; the New Confucians in Modern Chinese and Indian Philosophy; the cultivation of *ren* in Virtue Ethics, Greek and Confucian; and the Chinese and Japanese arts in Aesthetics across Traditions.

```checkpoint
q: Why, according to Tiwald's reconstruction, did Zhu Xi think li was needed in addition to qi?
a: Because li is a substance that existed before qi in time.
x: Zhu denies that pattern exists first and then qi arises; li is prior only as what we infer back to.
a*: Because some features of the world's order, including normative facts such as that it is right for children to serve their parents, are not explained by the stuff alone.
a: Because qi is an illusion, as the Buddhists taught.
x: Zhang Zai and Zhu both treat qi as real; the claim that things are illusory was one the Neo-Confucians attacked.
a: Because Confucius' Analects uses li as its central metaphysical term.
x: Van Norden and Jones count li "precisely zero times" in the Analects.
hint: Think of boats, carts and children's love for their parents.
why: The order of the world, and its normative character, call for a ground beyond qi: li, "ceaseless life-generativity", which sets the rules qi follows.
---
q: What was Lu Xiangshan's objection to Zhu Xi's investigation of things, and Zhu's reply?
a: Lu said the classics should be memorised in full; Zhu replied that only nature should be studied.
x: Lu thought book-learning fragmentary, and Zhu's method included reading the classics.
a: Lu said li does not exist; Zhu replied that qi does not exist.
x: Both accepted li; they disagreed about where and how it is found.
a: Lu said investigation should be left to officials; Zhu replied that only monks could do it.
x: Neither view appears in the debate, which concerns how anyone becomes a sage.
a*: Lu said the myriad things are too many to investigate and are already complete in us; Zhu replied that one infers by analogy and that Lu's method lacked an independent standard.
hint: Recall Bomin's question about the "ten thousand things".
why: Lu held that we need only apprehend the principle already in the mind. Zhu, following Cheng Yi, said one need not exhaust every thing, and called Lu's reliance on the mind "too Buddhist" because it left only subjective whim as a check.
```

## Further exploration

- **Stephen C. Angle and Justin Tiwald, *Neo-Confucianism: A Philosophical Introduction* (2017).** A thematic, argument-centred introduction to the whole movement.
- **Justin Tiwald and Bryan W. Van Norden (eds), *Readings in Later Chinese Philosophy: Han to the Twentieth Century* (2014).** Translations, including Fazang's *Golden Lion* and the Rafter Dialogue.
- **John R. McRae, *Seeing through Zen: Encounter, Transformation, and Genealogy in Chinese Chan Buddhism* (2003).** The "Rules of Zen Studies" and a critique of Chan's lineage history.
- **Brook Ziporyn, *Being and Ambiguity: Philosophical Experiments with Tiantai Buddhism* (2004).** Tiantai's three truths presented as live philosophy.
- **John Makeham (ed.), *The Buddhist Roots of Zhu Xi's Philosophical Thought* (2018).** Essays on how far Zhu drew on Buddhism.
- **Michael C. Kalton et al. (trans.), *The Four-Seven Debate: An Annotated Translation of the Most Famous Controversy in Korean Neo-Confucian Thought* (1994).** The letters of Toegye, Kobong, Yulgok and Ugye.
- **Kathryn Ann Tsai (trans.), *Lives of the Nuns: Biographies of Chinese Buddhist Nuns from the Fourth to Sixth Centuries* (1994).** Baochang's collection of early Chinese nuns' lives.$neoconf_master$,
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
  select $neoconf_quiz$[
    {"type": "mcq", "prompt": "What does Victor Mair argue about geyi, often described as a 'matching concepts' method of translating Buddhism with Daoist vocabulary?", "options": ["That it was the main translation method until the Tang dynasty", "That there is no evidence it was a translation method; it was a short-lived attempt by a few teachers to explain Buddhist numbered lists", "That Kumārajīva invented it", "That it occurs throughout the Daoist canon"], "answerIndex": 1, "explanation": "Mair (2010) finds no evidence for the translation story; the word occurs only about 23 times in the Buddhist canon and nowhere in the Daoist one, and he calls it 'a highly ephemeral and not-very-successful attempt' to cope with numbered lists of categories.", "id": "q1"},
    {"type": "mcq", "prompt": "Which line of the famous verse attributed to Huineng is, according to John McRae, absent from the earliest (Dunhuang) version of the Platform Sutra?", "options": ["'Fundamentally there is not a single thing'", "'Bodhi originally has no tree'", "'Where could dust arise?'", "'The body is the bodhi tree'"], "answerIndex": 0, "explanation": "McRae notes that the earliest version contains two different verses and that the famous one with 'Fundamentally there is not a single thing' is later. 'The body is the bodhi tree' is Shenxiu's verse.", "id": "q2"},
    {"type": "mcq", "prompt": "In Zhu Xi's philosophy, what is the relation of li (pattern) to qi (vital stuff)?", "options": ["Li exists first in time and then qi arises from it", "Li is simply a name for regularities in qi, as Dai Zhen held", "Li is a Buddhist illusion that Zhu rejected", "Li is prior to qi not in time but as what we infer back to as more fundamental, and it sets the rules qi follows of its own power"], "answerIndex": 3, "explanation": "Zhu denies that pattern exists first and qi afterwards. Li is the more fundamental ground of order, including normative order, and 'masters' qi without acting on it directly. The qi-only view was the minority objection of thinkers such as Dai Zhen.", "id": "q3"},
    {"type": "mcq", "prompt": "In the Korean Four–Seven debate, what was Yulgok's position?", "options": ["The Four Beginnings issue from li and the Seven Feelings from qi, alternately", "Li and qi have nothing to do with the emotions", "Qi activates both, li 'rides along', and the Seven Feelings include the Four Beginnings", "Only the Seven Feelings are real"], "answerIndex": 2, "explanation": "'Alternate issuance' was Toegye's mature view. Yulgok held that qi issues and li rides along in all cases, so the Seven include the Four. Berthrong calls this 'probably the most imaginative reinterpretation' of Zhu in traditional East Asia.", "id": "q4"},
    {"type": "open", "prompt": "Set out Fazang's Rafter Dialogue argument for interpenetration step by step. What is the strongest objection to it, and how might Fazang reply?", "rubric": "A strong answer gives the steps: conditioned things depend on others for existence and identity (from Madhyamaka); a building is nothing but its arranged parts, so without one rafter this building is not there (the building is the rafter); wood is a rafter only through its role in a building and could otherwise be a bench or kindling (the rafter is the building); generalised to the cosmos, one is all and all is one; yet each part keeps its distinct function, identical 'because they are different'. It states the common-sense objection that a heap of parts after a storm is not a building and a plank remains the same plank, so step 3 trades on redescription. It gives the reply that a rafter wholly creates the building only as a rafter, with the other conditions, that a plank in a heap is not functioning as a rafter, and that if parts only partly created the whole it would never come to be. Credit for noting the ethical point (compassion as caring for one's own numb limb) and the debate over Huayan and Wu Zetian's imperial ideology.", "id": "q5"},
    {"type": "open", "prompt": "How Buddhist was Neo-Confucianism? Weigh the evidence for Buddhist influence against the Neo-Confucians' own anti-Buddhist polemic and Berthrong's counter-view.", "rubric": "A strong answer gives the Neo-Confucian charges (selfishness in seeking personal liberation, neglect of family and society, emptiness making things worthless) and Cheng Yi's contrast between Buddhists basing themselves on the heart-mind and Confucians on Heaven. It sets out the case for influence: the strong reading of Mencius's 'nature is good' as innately well-formed dispositions, likely from Buddha-nature thought (pearl and mirror images); the term li, used in Huayan from Dushun and absent from the Analects and Great Learning (Van Norden and Jones: Zhu's sense 'reminiscent of Indra's net'); quiet-sitting and the elimination of selfish desires; Zhu's own early study of Chan; Makeham's volume. It gives Berthrong's reply that the stimulus theory has 'a genuine element of truth' but the materials were indigenous Confucian ones. It may note Zhu's charge that Lu was 'too Buddhist' and the parallel between Chan and Neo-Confucian lineage-building, and should treat the question as a live debate.", "id": "q6"}
  ]$neoconf_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/chinese-buddhism-and-neo-confucianism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
