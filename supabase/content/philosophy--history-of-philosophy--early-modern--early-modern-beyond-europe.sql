-- Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/early-modern-beyond-europe @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/early-modern-beyond-europe',
    'research',
    'advanced',
    'read',
    $beyondeurope_master$> **While Descartes, Spinoza and Locke were remaking European philosophy, other traditions were having arguments of their own.** This chapter visits four. In Ming China, Wang Yangming argued that knowing and acting are one; the argument is set out step by step, with the obvious objection and his replies. In Safavid Iran, Mullā Ṣadrā argued that existence, not essence, is what is real, and that things change down to their very substance. In Tokugawa Japan, Confucians quarrelled over how to read the classics while nativists tried to strip Chinese learning away. In Ethiopia, a Geʿez text called the *Hatata* subjects religious law to reason, and whether it was written in the seventeenth century or the nineteenth is still argued.

## Same Centuries, Other Conversations

"Early modern" is a European label, and applying it elsewhere is a choice. The historian John Tucker deliberately calls seventeenth- to early-nineteenth-century Japanese Confucianism "early modern", to stress its role in laying foundations for modernity rather than treating it as "late medieval" or "feudalistic". Wang Yangming (1472–1529) was a contemporary of the thinkers in *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*; Mullā Ṣadrā (c. 1571/2–1635/6, traditionally 1640) was a younger contemporary of Montaigne; the Tokugawa shoguns ruled Japan from 1603 to 1868; and the *Hatata* dates itself to 1667/8.

None of these thinkers was reacting to Europe. Each worked inside a long tradition of commentary on authoritative texts, and each pushed hard against the received reading of it, with reasons.

## Wang Yangming and the Bamboo

{{image: Wang Yangming | Portrait of Wang Yangming (1472–1529), who taught that the mind is pattern and that knowing and acting are one.}}

Wang Shouren, called Yangming, was the son of a successful official. He was long torn between Daoism, Buddhism and Confucianism before passing the highest civil-service examination in 1499. In 1506 he protested against a palace eunuch's imprisonment of officials, was publicly beaten, and was exiled to a minor post in what is now Guizhou. There, in 1508, he underwent a "deep philosophical awakening". He rose to high civil and military office and died in 1529 with the words: "'This mind' is luminous and bright. What more is there to say?"

The background is the orthodoxy described in *Chinese Buddhism and the Rise of Neo-Confucianism*. Zhu Xi had taught that every thing has its *li*, its pattern or principle, and that one becomes wise by *gewu*, "investigating things" to grasp their pattern. By Wang's day Zhu's commentaries were the examination curriculum.

Wang's own recollection, in the *Chuanxi lu* (*Record for Practice*, compiled by his disciples), tells how this went wrong for him. He and a friend named Qian resolved to "investigate all the things in the world", starting with the bamboos in front of a pavilion. Qian investigated "day and night" and fell ill on the third day. Wang then tried, could not find "the Pattern of the bamboos", and fell ill on the seventh. They concluded, sighing, "that it was impossible to be a sage or a worthy". Whether Wang applied Zhu's method fairly is disputed: the historian Qian Mu observed that Zhu's investigations were fruitful because he brought questions to them, whereas Wang's gazing had no hypothesis.

The awakening of 1508 turned the search inward. "Everyone has within an unerring compass," Wang wrote in a poem for his students (in Philip Ivanhoe's translation); "The root and source of the myriad transformations lies in the mind." His slogan was *xin ji li*, "the mind is pattern": "Is there any affair outside the mind? Is there any Pattern outside the mind?" Pattern is not an object waiting to be found but is coextensive with the mind's own responses. So Wang reread *gewu* not as "reaching things" but as "rectifying things", correcting one's own thoughts and their objects. In this he revived the line of Lu Xiangshan, later called the Learning of the Heart-mind (*xinxue*), against the Cheng–Zhu Learning of Pattern (*lixue*), though the tidy two-school picture is partly a later historians' construction.

The faculty that does the rectifying Wang called *liangzhi*, a term from Mencius, who said that babes in arms know to love their parents "without pondering". It is translated "pure knowing", "innate knowledge" or, loosely, "conscience". Everyone has it; it is not learned; it can be lost sight of but never lost; and selfish desires cloud it. Hence Wang's claim that "all the people filling the street are sages".

## Knowing and Acting Are One

Wang's most famous doctrine, *zhi xing he yi*, "the unity of knowing and acting", challenges Zhu Xi, for whom knowledge and action need each other "like how eyes cannot walk without feet, but feet cannot see without eyes", but knowledge comes first. On Zhu's view one can know the good and fail to do it.

```quote
There never have been people who know but do not act. Those who "know" but do not act simply do not yet know.
Wang Yangming · Chuanxi lu (trans. Tiwald & Van Norden) · early sixteenth century
```

Wang's argument, reconstructed from his dialogues, runs:

1. Saying the right words is not knowing. One cannot be said to know filial piety simply because one can say something filial, any more than one knows pain, cold or hunger without having felt them.
2. The *Great Learning* says that loving the good should be like loving a lovely sight, and hating evil like hating a hateful odour.
3. In such cases, perceiving and responding are not two steps. "As soon as one smells that hateful odor, one naturally hates it. It is not as if you first smell it and only then, intentionally, you decide to hate it." Someone with a blocked nose does not hate the smell, and that is "simply not to know the hateful odor".
4. Moral knowledge, properly understood, is like this: genuinely to see that something is good is already to be drawn to it.
5. Therefore genuine knowing already contains acting, and apparent cases of knowing the good without doing it are cases of not yet really knowing.

The objection was put to Wang by a student. Some people know perfectly well that parents should be served with filial piety and elder brothers with respect, yet do not do it; so knowledge and action "are clearly two different things". A modern version is the plagiarist who says, "I knew it was wrong, but I gave in to temptation." Philosophers call this weakness of will, and Bryan Van Norden notes that Wang's doctrine can be read as denying that it is possible at all.

Wang had two replies. The first, in Wing-tsit Chan's translation, is that "the knowledge and action you refer to are already separated by selfish desires and are no longer knowledge and action in their original state". The second, which Van Norden thinks perhaps the most compelling, is practical. Talking of knowing and acting separately is legitimate only as a remedy: stress knowing to those who act "blindly and recklessly", and acting to those who "engage in speculation while suspended in a vacuum". Zhu's followers think they must finish knowing before they act, and so become bookworms. "My current teaching regarding the unity of knowing and acting," Wang said, "is a medicine directed precisely at this disease."

Van Norden presses back. The pain example shows at most that one must once have felt good or evil to understand the words, not that knowing now moves one to act. The odour and beauty examples show at most that knowing involves *some* motivation, which need not issue in action: finding someone attractive (the Chinese phrase carries that connotation) does not always lead to pursuing them. Youngmin Kim reads Wang differently: "knowledge" is knowing how to respond to a situation, and "action" is every response, including study. As Wang put it, to know bitterness you must eat a bitter melon yourself. *Virtue Ethics, Greek and Confucian* returns to the link between perception and right action.

```checkpoint
q: In Wang Yangming's own account of trying to "investigate" the bamboos, what happened?
a*: His friend Qian fell ill on the third day; Wang tried and fell ill on the seventh, and they concluded they could not become sages that way.
a: Wang stared at the bamboo alone for seven days and then achieved enlightenment.
x: This is the popular simplification. In Wang's telling a friend named Qian tried first, and the attempt ended in illness and discouragement, not enlightenment; the awakening came years later in exile.
a: Wang discovered the pattern of the bamboo and wrote it down for Zhu Xi.
x: Wang reports that he was "unable to find the Pattern of the bamboos"; the attempt ended in illness, not discovery.
a: Wang concluded that bamboo has no pattern because only the mind is real.
x: The episode ended in failure and illness. Wang's later claim that "the mind is pattern" came out of his 1508 awakening, and it is not the claim that only the mind exists.
hint: Wang did not start the experiment alone.
why: The Chuanxi lu tells it as a shared failure: Qian ill on day three, Wang on day seven. The story dramatises Wang's doubt about seeking pattern in external things.
---
q: How did Wang reply to the student who said that people who know they should be filial yet fail to act show that knowing and acting are two things?
a: He conceded that such people know but lack willpower, which must be trained separately.
x: That concession is exactly Zhu Xi's picture, in which knowledge can exist without action. Wang denied it.
a: He said such people do not exist, because everyone always acts filially.
x: Wang did not deny that people fail to act well. He denied that they genuinely know while failing.
a*: He said their knowing and acting had already been separated by selfish desires, so it was no longer knowing in its original state.
a: He said filial piety is a custom, not a matter of knowledge.
x: Wang treated filial piety as something pure knowing (liangzhi) grasps; his point was about what genuinely knowing it involves.
hint: Think of the person with a blocked nose.
why: For Wang, real knowing is like smelling a foul odour: the response comes with the perception. Selfish desires dull it, so what is left is not real knowing.
```

## Wang's Heirs and Critics

After Zhu Xi, Wang became, in Justin Tiwald's words, the second most influential Neo-Confucian philosopher. His disciples quarrelled over his Four-Sentence Teaching, which opens by saying that the mind in itself is neither good nor evil: Qian Dehong read it as a teaching for everyone, while Wang Ji treated it as provisional and pressed that first line further. The Taizhou school of Wang Gen (1483–1541) found sagehood in the everyday lives of ordinary people, and Li Zhi (1527–1602) defended the education of women, as *Ming-Qing History* notes.

The reaction was fierce. Luo Qinshun warned that identifying mind with principle was "an infinitesimal mistake in the beginning leading to an infinite error at the end": if pattern is in the mind, what checks each person's opinion? After 1644 came a backlash against the late-Ming radicals. Gu Yanwu (1613–1682) led a turn to "evidential studies", and Qing scholars dismissed both Zhu and Wang for "empty words". Dai Zhen charged both schools with treating subjective opinion as an infallible moral sense, reading Buddhist ideas into the classics, and ignoring the value of ordinary desires. How Buddhist Wang was remains debated; the New Confucian Mou Zongsan held that Wang understood Confucianism more deeply than Zhu, a story continued in *Modern Chinese and Indian Philosophy*.

Wang's teaching also travelled. Tiwald notes the "tremendous influence of Zhu Xi and Wang Yangming in Korea, Japan, and Vietnam". In Japan it became Yōmeigaku, founded by Nakae Tōju (1608–1648), "the Sage of Ōmi", and carried on by Kumazawa Banzan (1619–1691). Ōshio Heihachirō (1793–1837), who ran a Yōmeigaku academy in Osaka, led the 1837 rising described in *Tokugawa Shogunate*, and Wang inspired some leaders of the Meiji Restoration.

## Mullā Ṣadrā and the "School of Isfahan"

Ṣadr al-Dīn Muḥammad Shīrāzī, known as Mullā Ṣadrā, was born in Shiraz around 1571–72, the only child of a courtly family. He followed the Safavid capital to Qazvin and, in 1597, to Isfahan (see *Safavid Iran*), where he studied philosophy with Mīr Dāmād (d. 1631) and the scriptural sciences with the jurist Shaykh Bahāʾī (d. 1620–21). Henry Corbin claimed he also studied with Mīr Findiriskī; Sajjad Rizvi finds "no evidence" for this.

Back in Shiraz, he found no adequate patron in a city that, in Rizvi's phrase, "had forgotten the value of the study of philosophy". He withdrew to Kahak, a village near Qom, for a retreat of probably five years. (Some accounts say clerics had condemned him; the main reference works describe a retreat, not an exile.) In 1630–31 the governor of Shiraz brought him back to teach at a college founded expressly for philosophy and science. He died in Basra on his way to Mecca, traditionally in 1640, though his grandson's report and the dates of his last works point to 1635–36.

His masterpiece, *The Transcendent Wisdom of the Four Journeys of the Intellect* (the *Asfār*), begun at Kahak in 1606 and completed in Shiraz in 1628, opens with a definition worth setting beside Descartes:

```quote
Know that philosophy is the perfecting of the human soul, by the cognition of the true natures of existents, as they truly are, through judgements concerning them that are ascertained through demonstrations, and not understood through conjecture, or adherence to prior authority, insofar as is humanly possible.
Mullā Ṣadrā · Asfār (trans. Sajjad Rizvi) · completed 1628
```

Ṣadrā is often placed in a "School of Isfahan" with Mīr Dāmād. The label is modern: Corbin and Seyyed Hossein Nasr coined it when, with Izutsu, they introduced Ṣadrā to Western readers as part of a project of reviving "perennial wisdom". Critics call the school "retroactively inaugurated" and coloured by Nasr's perennialism, which Corbin himself disliked. Ṣadrā, after all, taught mainly in Qom and Shiraz. The label is an umbrella, not an institution.

## Existence Comes First

Since Avicenna (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*), philosophers had analysed every contingent thing into its essence (*what* it is) and its existence (*that* it is). Which is real? Suhrawardī, and after him Ṣadrā's teacher Mīr Dāmād, answered: essence; existence is a "merely mental consideration". Ṣadrā began as an essentialist and changed his mind. His case for *aṣālat al-wujūd*, the primacy of existence, runs:

1. Every contingent thing is analysable into essence and existence.
2. If the two are distinct, one of them must be what is real and active in the thing.
3. Essence taken by itself is a universal in the mind with no effects: a real horse can give you a ride, but the universal horse in the mind cannot. Particularity and effects come from existence.
4. An essence waiting to receive existence would have to exist before it existed, which is absurd.
5. God has no essence, so his causal link to the world can only be through existence.
6. Therefore existence is what is real, and essences are mental delimitations of it.

The strongest objection is a regress argument used by post-Avicennan philosophers. If existence were a real thing outside the mind, existence itself would have to exist, requiring a second existence, and that a third, without end. Better to treat existence as a concept the mind adds to real essences.

Ṣadrā's answer, roughly, is that the objection confuses the *concept* of existence, which the mind does attach to essences, with existence as a concrete *reality*. The reality is not an item that needs something further added to make it exist; it simply is existing, so the regress never starts. It is simple, has no essence, and admits of degrees. That is his second doctrine, *tashkīk al-wujūd*, the gradation of existence: one single reality, differing only "by perfection and deficiency", priority and posteriority, independence and dependence. In Sayeh Meisami's image, existence is a colourless light and essences the coloured glass; sunlight and candlelight are one reality in different grades. His proof of God climbs this scale to its limit, pure existence. *What Exists? Ontology and Universals* and *God: Arguments For and Against* take these questions further.

The third doctrine is the most daring: *al-ḥaraka al-jawhariyya*, substantial motion. Change is not only in a thing's accidents, its passing features, but in its very substance, so that "the young Zayd is thus literally not the same existent as the old Zayd", and time is a dimension of existence. If everything is in motion, what is the subject that changes? Existence, Ṣadrā replied, is its own subject. The doctrine let him argue that the world is created anew at every instant, against the Avicennan eternity of the world, and that the soul is "corporeal in its origination and spiritual in its survival". *Identity, Change and Persons* returns to persistence through change.

Ṣadrā's influence came late but ran deep. His thought has dominated the Shiʿi seminaries since the early nineteenth century, revived by Hādī Sabzavārī (d. 1873) among others; his commentary on Abharī's *Hidāya* became a staple of Indian madrasas; and Ayatollah Khomeini and Morteza Motahhari were "profoundly influenced" by him. Critics range from his son-in-law Lāhījī, who defended Avicennan essentialism, to a modern school that accuses him of mixing faith with "Greek science".

## Tokugawa Japan: Was There an Orthodoxy?

Neo-Confucianism reached Japan with Zen monks and long lived inside monasteries, until Hideyoshi's invasions of Korea brought Korean scholars to Japan as prisoners. Hayashi Razan (1583–1657), pupil of the former monk Fujiwara Seika, advised the second shogun from 1607, and his family inherited the headship of the Confucian academy in Edo.

The traditional story, shaped by Inoue Tetsujirō and then by Maruyama Masao's wartime *Studies in the Intellectual History of Tokugawa Japan*, made Zhu Xi Confucianism the shogunate's static official ideology, gradually dissolved by bolder thinkers. Revisionists disagree. Herman Ooms argued that Seika and Razan were not the only teachers close to the early regime, that Zen and Shinto served it too, and that the Hayashi promoted a "fiction" of shogun-backed orthodoxy; Watanabe Hiroshi and Hori Isao reached similar conclusions in Japanese. Tucker calls Maruyama's framework, borrowed from Hegel, "flawed", though still "a starting point". The revisionists' best evidence is a date: only in 1790 did the chief councillor Matsudaira Sadanobu issue the Kansei edict against "heterodox learning", enforcing Zhu Xi teaching in the Hayashi school, which the historian Bodart-Bailey calls the "first official insistence" on orthodoxy. How far it was enforced is disputed, and Thomas Kasulis notes that the shogunate did believe Confucianism could support its aims.

Japan's Confucians argued freely. Yamazaki Ansai (1619–1682), a Zen monk turned Zhu Xi loyalist, attacked Buddhism and also turned to Shinto. The naturalist Kaibara Ekken (1630–1714), "to the end a professed Neo-Confucian", opened his record of doubts about Zhu Xi with Lu Xiangshan's line: "In learning, a person should be worried when he has no doubts." The conduct book *Greater Learning for Women*, long attributed to Ekken, is argued by modern scholars to be by other hands.

Others went back behind Zhu Xi to the ancient texts. Itō Jinsai (1627–1705), a Kyoto merchant's son, purged Buddhist borrowings from Confucian vocabulary, calling *ri* (pattern) a "dead word" and *michi* (the Way) a "living word"; Tucker warns that labelling him an anti-Neo-Confucian is misleading. Ogyū Sorai (1666–1728) went back further, to the Six Classics, and argued that the Way is something made: "the rites, music, penal laws and administrative systems which the ancient kings established". His reason was that the mind cannot govern itself without splitting into a controlling and a controlled mind, so order must come from institutions. Tucker notes his view was seen as a heterodox alternative much like Xunzi's (see *Confucius, Mencius and Xunzi*).

## Nativists and Dissenters

The philological turn had a twist. Kokugaku, "Native Japan Studies" or nativism, sought a native Way, distinct from Buddhism and Confucianism, in Japan's most ancient writings. Kamo no Mabuchi (1697–1769) pictured ancient Japan as governed by the spirit of heaven and earth until Chinese theories brought "tremendous chaos". Motoori Norinaga (1730–1801), a doctor in Matsusaka, spent about thirty-five years on a commentary on the *Kojiki*. He read *The Tale of Genji* as leaving aside questions of good and bad to dwell on *mono no aware*, the sorrow of things (see *Aesthetics across Traditions*), and diagnosed *karagokoro*, the "Chinese heart": "The heart of a man / Who reads Chinese / Is still Chinese." The legacy has a dark side: Norinaga held Japan to be the primal source of all countries, and after 1868 Kokugaku ideas of racial identity and superiority fed nationalist ideology, as *The Kyoto School and Modern Japanese Philosophy* discusses.

Some fit no school. Andō Shōeki (1703–1762) rejected Buddhism, Confucianism and feudal hierarchy, calling recorded history a "World of Law" made by rulers, priests and scholars and imagining a world in which all farm as equals. Tominaga Nakamoto (1715–1746), an Osaka merchant, applied textual criticism to the Buddhist sutras, arguing that most were composed long after the Buddha, and said of Shinto secrecy that "hiding is the beginning of lying and stealing".

```checkpoint
q: What is Mullā Ṣadrā's answer to the objection that if existence were real, existence itself would need a further existence, and so on without end?
a: He accepted the regress and concluded that existence is only a concept.
x: That conclusion is the essentialist position of Suhrawardī and Mīr Dāmād, which Ṣadrā rejected.
a*: He distinguished the concept of existence from existence as a concrete reality, which simply is existing and needs nothing further added to it.
a: He said essences give existence to things, so no regress arises.
x: This reverses his view. For Ṣadrā essences, taken by themselves, have no effects; everything real comes from existence.
a: He denied that God exists, which removes the first term of the regress.
x: Ṣadrā held that God is pure existence; his proof of God climbs the gradation of existence to its highest point.
hint: The objection treats existence as if it were one more item that has to exist.
why: Ṣadrā kept apart existence as a mental concept attached to essences and existence as the simple, graded reality itself; the regress applies only to the first.
---
q: Why do historians such as Herman Ooms doubt that Zhu Xi Confucianism was the Tokugawa state's orthodoxy from the start?
a: Because Confucianism never reached Japan before the nineteenth century.
x: Neo-Confucianism reached Japan with Zen monks from the thirteenth century, and Razan advised the shogun from 1607.
a: Because the shoguns banned Confucianism in 1607.
x: In 1607 Hayashi Razan began advising the second shogun; nothing was banned.
a: Because the shogunate made Wang Yangming's teaching the official creed instead.
x: No Tokugawa regime made Wang's teaching official; Yōmeigaku spread through private teachers such as Nakae Tōju and Kumazawa Banzan.
a*: Other scholars, Zen and Shinto were also used by the early regime, the Hayashi promoted a "fiction" of orthodoxy, and the first official insistence on Zhu Xi teaching came only with the Kansei edict of 1790.
hint: Look at the date of the first formal prohibition of "heterodox learning".
why: If a formal orthodoxy was first imposed in 1790, the earlier picture of a fixed state creed looks retrospective; revisionists add that the regime drew on several traditions at once.
```

## Ethiopia: The Hatata

The Ethiopian emperor Susenyos (r. 1606/7–1632) converted to Catholicism in 1622 and tried, with Portuguese Jesuits, to impose it; his son Fasilides restored Orthodoxy and expelled the Jesuits in 1633. The *Hatata* (Geʿez for "inquiry") presents itself as the work of a man caught up in this. Its author, Zera Yacob, says he was born near Aksum to a poor farming family, received a church education, was denounced before Susenyos, and fled to a cave near the Tekezé river for two years. He later settled under a patron, married Hirut, a maid of the household, and wrote at the request of the patron's son Walda Heywat, who wrote a second *Hatata* of his own. By the text's own dates Zera Yacob lived 1599/1600–1692/3 and wrote in 1667/8; those dates stand or fall with its authenticity.

The *Hatata* accepts from scripture and tradition only what survives rational inquiry; seeing Christians, Jews and Muslims contradict one another, its author refuses the authority of tradition as such. He argues to God by a first cause: there cannot be an endless chain of parents, so there must be an uncreated creator. Because the creator is good, creation is good; so the text attacks ascetic rules such as fasting, food laws and monastic celibacy, rejects polygamy, and holds husband and wife equal in marriage. It also argues that a law allowing people to be bought like animals cannot come from a creator who made human beings equal. Wendy Laura Belcher summarises the texts as condemning slavery and warfare and advocating for the rights of women and animals.

Its best-known argument concerns the law of Moses that declares menstruating women impure:

1. The creator in his wisdom made blood flow monthly from women's wombs so that they can bear children.
2. What the creator ordains as part of creation is good, and cannot be impure.
3. The law of Moses declares menstruating women impure.
4. That law obstructs marriage and the whole life of a woman, undermines mutual help and the raising of children, and destroys love.
5. A law that contradicts the creator's order and harms love and mutual help cannot come from God.
6. Therefore the purity law is a human invention, not a divine command; and in general any religious law that contradicts what reason finds in creation is human.

The obvious objection comes from within the tradition: revelation may command what reason does not understand. The reply the text implies is that God gave us reason precisely to judge religious claims; a good creator would not command what reason sees as harmful; and since rival faiths each claim revelation while contradicting one another, revelation itself needs a rational test.

## Who Wrote the Hatata?

The only known manuscripts are two copies sent in the early 1850s by Giusto d'Urbino, an Italian Capuchin missionary, to the French collector Antoine d'Abbadie, who paid him for twenty-four manuscripts in all. In 1920 the Italian scholar Carlo Conti Rossini argued that Giusto wrote the texts himself, pointing to the late manuscripts, Giusto's role as discoverer and copyist, his knowledge of Geʿez, and the demand d'Abbadie's collecting created; the French historian Anaïs Wion calls this "a set of evidence rather than a decisive proof". Eugen Mittwoch added linguistic arguments in 1934, which Wion considers flawed. Conti Rossini later publicly backed Italy's 1935 invasion of Ethiopia, which bears on his outlook, not on the evidence.

The case for Ethiopian authorship was made at length by the Jesuit Claude Sumner, who published the first complete English translation in 1976 and argued that the ideas diverge from Giusto's views and exceed his Geʿez, and that the two treatises use scripture differently, suggesting two authors. The Ethiopian scholars Amsalu Aklilu and Alemayehu Moges pointed to the texts' tone, syntax and Geʿez usage, and Teodros Kiros also defended them. In 2017 the leading Geʿez philologist Getatchew Haile wrote that he was "now firmly inclined to believe that the original Hatata is the work of an Ethiopian *debtera*" of the Catholic era (note "original"). The 2023 translators, Ralph Lee, Mehari Worku and Wendy Laura Belcher, are "confident that two Ethiopians named Zara Yaqob and Walda Heywat composed these two texts"; Belcher adds that almost everyone who has argued otherwise has not read them in Geʿez.

The other side has not gone away. In 2021 Wion, using the manuscripts and the unpublished Giusto–d'Abbadie correspondence, revived the case for Giusto in "The History of a Genuine Fake Philosophical Treatise". John Marenbon suggests the works, if inauthentic, are "not forgeries but simply pseudonymous". Fasil Merawi sees the effort to make the *Hatata* a foundation of Ethiopian philosophy as part of a debate politicised by nationalism and decolonial aims, and the 2024 volume he edited with Lea Cantor and Jonathan Egid treats the question as open, urging that the near-exclusive focus on authorship has obscured the texts' philosophy. The fair summary is that the question is unsettled, and the arguments deserve weighing on their merits whoever wrote them. *African Philosophy: the Ethnophilosophy Debate and Beyond* asks why so much rides on the answer, and *The Enlightenment* places the text in its global setting.


## Further exploration

- **Wing-tsit Chan (trans.), *Instructions for Practical Living and Other Neo-Confucian Writings by Wang Yang-ming* (1963).** The standard complete translation of the *Chuanxi lu*.
- **Philip J. Ivanhoe (trans.), *Readings from the Lu-Wang School of Neo-Confucianism* (2009).** Lu Xiangshan and Wang Yangming in a compact modern selection.
- **Sajjad H. Rizvi, *Mulla Sadra and Metaphysics: The Modulation of Being* (2009).** A close study of Ṣadrā's doctrine of existence by a leading scholar.
- **Fazlur Rahman, *The Philosophy of Mulla Sadra* (1975).** The classic English-language study.
- **Herman Ooms, *Tokugawa Ideology: Early Constructs, 1570–1680* (1985).** The revisionist case against an early Confucian orthodoxy.
- **Peter Nosco, *Remembering Paradise: Nativism and Nostalgia in Eighteenth-Century Japan* (1990).** Kokugaku and its longing for an ancient Japan.
- **Ralph Lee, Mehari Worku and Wendy Laura Belcher (eds. and trans.), *The Hatata Inquiries* (2023).** An open-access translation of both texts, arguing for their Ethiopian authorship.$beyondeurope_master$,
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
  select $beyondeurope_quiz$[
    {"type": "mcq", "prompt": "Which reinterpretation of the Neo-Confucian term gewu did Wang Yangming propose?", "options": ["'Rectifying things', correcting one's own thoughts and their objects, rather than 'reaching things' to find their external pattern", "'Investigating bamboo', the exact observation of plants as Zhu Xi had prescribed", "'Memorising the classics', as the examination system required", "'Abandoning things', the Buddhist renunciation of the world"], "answerIndex": 0, "explanation": "Against Zhu Xi's reading of gewu as reaching things and investigating their pattern, Wang read it as rectifying things, since for him 'the mind is pattern' (xin ji li).", "id": "q1"},
    {"type": "mcq", "prompt": "Who coined the label 'School of Isfahan' for Mullā Ṣadrā and Mīr Dāmād's circle?", "options": ["Shah ʿAbbās I, in a decree founding a college", "Mullā Ṣadrā himself, in the Asfār", "Henry Corbin and Seyyed Hossein Nasr, in the twentieth century", "Avicenna's earliest commentators"], "answerIndex": 2, "explanation": "The name is a modern label coined by Corbin and Nasr. Critics call the school 'retroactively inaugurated' and perennialist, and Ṣadrā taught mainly in Qom and Shiraz rather than Isfahan.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Mullā Ṣadrā's doctrine of substantial motion claim?", "options": ["That only a thing's place changes, never its qualities", "That change reaches a thing's very substance, so the young Zayd is not literally the same existent as the old Zayd", "That essences are eternal and existence is an illusion", "That nothing changes at all, since change is an illusion"], "answerIndex": 1, "explanation": "For Ṣadrā substance itself is in flux and time is a dimension of existence; existence is its own subject of change. This let him argue that the world is created anew at every instant.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is the Kansei edict of 1790 important to the debate over Tokugawa Confucian 'orthodoxy'?", "options": ["It banned Confucianism from Japan altogether", "It made Wang Yangming's teaching the official creed", "It ended the Tokugawa shogunate", "It was the first official insistence on Zhu Xi orthodoxy, which suggests no strict state orthodoxy existed before it"], "answerIndex": 3, "explanation": "Issued under Matsudaira Sadanobu, it prohibited 'heterodox learning' and enforced Zhu Xi teaching in the Hayashi school. Revisionists such as Ooms, Watanabe and Hori argue against the older Inoue–Maruyama picture of an orthodoxy from the start; how far the edict was enforced is itself disputed.", "id": "q4"},
    {"type": "open", "prompt": "Set out Wang Yangming's argument for the unity of knowing and acting, the main objection to it, Wang's replies, and Van Norden's counter-objections. Is the doctrine defensible?", "rubric": "A strong answer reconstructs the argument: verbal assent is not knowledge (pain, cold, hunger; saying something filial); the Great Learning's lovely sight and hateful odour, where perceiving and responding are not two steps and the person with a blocked nose does not know the odour; so genuine knowing already includes acting. It states the objection (people who know they should be filial but do not act; weakness of will, as in the plagiarist) and both replies: knowing and acting 'separated by selfish desires' are not in their original state, and the pragmatic reply that the doctrine is 'a medicine' against bookworms who separate the two. It gives Van Norden's objections (the pain case shows only past experience is needed; the odour and beauty cases show only some motivation, not action) and may mention Youngmin Kim's reading of knowing as knowing how to respond. It reaches a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Who wrote the Hatata? Present the case for seventeenth-century Ethiopian authorship and the case for composition by Giusto d'Urbino, and explain why the question remains open.", "rubric": "A strong answer notes that the only manuscripts are copies sent by the Capuchin Giusto d'Urbino to Antoine d'Abbadie in the early 1850s. For Giusto's authorship: Conti Rossini (1920) on the late manuscripts, Giusto's role, his Geʿez and d'Abbadie's demand (a 'set of evidence rather than a decisive proof', per Wion); Mittwoch (1934); Wion (2021) using the Giusto–d'Abbadie correspondence ('a genuine fake'); Marenbon's 'pseudonymous' suggestion. For Ethiopian authorship: Sumner (1976) on Giusto's views and weak Geʿez and different scriptural citation in the two treatises; Amsalu Aklilu, Alemayehu Moges and Teodros Kiros; Getatchew Haile (2017) on 'the original Hatata'; the 2023 translators Lee, Worku and Belcher. It notes context (Conti Rossini's support for the 1935 invasion bears on motive, not evidence; Fasil Merawi on politicisation) and that the 2024 Cantor–Egid–Merawi volume treats the question as open, without claiming that 'most scholars' agree either way.", "id": "q6"}
  ]$beyondeurope_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/early-modern-beyond-europe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
