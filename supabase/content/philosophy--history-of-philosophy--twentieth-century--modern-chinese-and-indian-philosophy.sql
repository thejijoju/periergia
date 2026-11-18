-- Modern Chinese and Indian Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/modern-chinese-and-indian-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/modern-chinese-and-indian-philosophy',
    'research',
    'advanced',
    'read',
    $modernasia_master$> **In the twentieth century, philosophers in China and India asked what their traditions were worth in a world remade by Western science, empire and revolution.** This chapter follows China from the New Culture movement and the 1923 debate over "science and metaphysics" through Liang Shuming, Xiong Shili, Feng Youlan and the New Confucians around Mou Zongsan, and on to Chinese Marxism and the revival after 1978. In India it turns to Gandhi's philosophy of nonviolence, Ambedkar's critique of Gandhi and his new Buddhism, Radhakrishnan and Aurobindo, and the analytic study of Indian philosophy led by B. K. Matilal. Three arguments are set out step by step, with objections and replies.

## Two Traditions under Pressure

*Philosophy in an Age of Empire* already covers Gandhi's *Hind Swaraj* (1909), Ambedkar's *Annihilation of Caste* (1936) and its "division of labourers" argument, Vivekananda, K. C. Bhattacharyya and Iqbal. This chapter picks up the story. In China a generation of intellectuals asked whether Confucianism could survive the arrival of science and democracy, or deserved to. In India philosophers asked what freedom, caste and religion meant, and whether "Indian philosophy" was spiritual wisdom or argument like any other. Neither story is a simple choice between "tradition" and "the West". The New Confucians read Kant closely in order to defend Mencius; Gandhi drew on Tolstoy and Ruskin; Ambedkar, influenced by John Dewey at Columbia, found in the Buddha a social revolutionary. The interesting question is what each borrowing was for.

## Mr. Science and Mr. Democracy

In September 1915 Chen Duxiu (1879–1942) founded *Youth Magazine* in Shanghai, soon retitled *New Youth*. It became the voice of the New Culture movement (usually dated 1915–1921), with Hu Shi, Li Dazhao and Lu Xun on its board from 1918. Chen's slogan was that "Mr. Confucius" should give way to "Mr. Science" and "Mr. Democracy". He held Confucianism incompatible with both, and after an anarchist phase he turned to Marxism and co-founded the Chinese Communist Party in 1921. The movement's turning point came on 4 May 1919, when students in Beijing protested against the Versailles decision to transfer Germany's rights in Shandong to Japan. (The political story is in the History chapter *Modern China*.)

Hu Shi (1891–1962) had studied with Dewey at Columbia and argued in *New Youth* in January 1917 for literature in the vernacular rather than classical Chinese. His maxim was to "make hypotheses boldly, but verify them carefully". His work as Dewey's interpreter in China and his 1919 dispute with Li Dazhao over "problems and isms" are told in *American Pragmatism: Peirce, James and Dewey*. Lu Xun (1881–1936), whose "Diary of a Madman" (1918) was the first story in modern vernacular Chinese, had read Nietzsche in Tokyo, as *Nietzsche* describes.

A woman thinker had gone further a decade earlier. The anarchist and feminist He-Yin Zhen (c. 1884 – c. 1920), writing in Tokyo, argued in "On the Question of Women's Liberation" (1907) that society could not be free unless women were, and that liberation had to be achieved by women themselves, not granted by men. She used the term *nannü* ("men and women") for a hierarchy that is made by society rather than given by nature. India's comparable voices, Tarabai Shinde, whose *Stri Purush Tulana* (1882) is often considered the first modern Indian feminist text, and Pandita Ramabai, belong to the period of *Philosophy in an Age of Empire*.

## Science or Metaphysics? The Debate of 1923

The New Culture faith in science met its first serious philosophical challenge in February 1923. Zhang Junmai (also known as Carsun Chang, 1887–1969), a disciple of Liang Qichao who had studied with Rudolf Eucken at Jena and been influenced by Henri Bergson, lectured at the Qinghua School in Beijing on "outlooks on life" (*rensheng guan*). His argument, as the Internet Encyclopedia of Philosophy (IEP) reconstructs it, runs:

1. Science studies its objects by a fixed method and seeks general laws; it is objective, analytic and causal.
2. An outlook on life, a person's attitudes, hopes and demands towards others and the world, is subjective, intuitive, synthetic, grounded in free will and unique to each person, who "ought to develop his own outlook on life according to what his heart-mind (xin) tells him".
3. The human mind is "in perpetual transformation", as Bergson taught, and cannot be divided into fixed states, so science cannot predict humanity's future (which is why Zhang rejected Marxism).
4. Therefore the problems of life cannot be solved by science. They belong to philosophy and moral cultivation, where Song and Ming Neo-Confucianism has much to offer.

The geologist Ding Wenjiang (1887–1936) replied in 1923 (in April or June; sources differ) with "Metaphysics and Science". He accused Zhang of "recalling the specter of metaphysics in a positivist age". Science, Ding argued, is "all-sufficient" in subject matter and method, whereas metaphysics posits a world beyond the senses "constructed from empty words". **Zhang's reply** was that there is knowledge outside science, in philosophy and religion, that science's criteria cannot test, because science is limited in both scope and method.

Liang Qichao, in "The View of Life and Science", tried to arbitrate. Most problems of life, he granted, can be helped by science, and Zhang had overstated the role of intuition. But beauty, love, religious experience and moral sentiment can never be handled by scientific method. Hu Shi and Chen Duxiu sided with Ding. Who won is itself debated. One IEP article judges that Ding's side prevailed; another stresses that the debate "made a strong philosophical impression on an entire generation" and makes Zhang a forerunner of New Confucianism. At bottom, Hu Shi held that humans differ from animals in degree, Zhang that they differ in kind.

## Liang Shuming, Xiong Shili and Feng Youlan

Liang Shuming (1893–1988) drew on Bergson and on Yogācāra Buddhism (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*). His *Eastern and Western Cultures and Their Philosophies* (1921) argued that cultures express three orientations of the will. The West strives outward to conquer nature; China seeks harmony and moderation; India turns backward, renouncing desire. China had reached the second stage "precociously", without passing through the first. "The world culture will eventually be the renovated Chinese culture," he concluded (in a translation the IEP quotes without naming the translator). In 1974 he refused to join the campaign to "Criticize Lin, Criticize Confucius"; Guy Alitto called him "the last Confucian".

Xiong Shili (1885–1968) also began from Yogācāra. His *New Treatise on the Uniqueness of Consciousness* (1932, in classical Chinese; rewritten in the vernacular in 1944) is sometimes considered the first work of modern Confucianism proper. Against Yogācāra's separation of reality from appearance, Xiong held that original reality (*ti*, "substance") and the phenomenal world (*yong*, "function") are one, a ceaseless transformation of "closing" (matter) and "opening" (mind).

Feng Youlan (1895–1990) also studied with Dewey at Columbia. His *History of Chinese Philosophy* appeared in two volumes, dated 1931 and 1934 by the Stanford Encyclopedia of Philosophy (SEP) and 1934 for the complete work by other sources; Derk Bodde translated it. It was the first major history to treat Chinese thought as "philosophy" (*zhexue*), though critics said it favoured Confucianism. His own system, the *New Rational Philosophy* (*Xin lixue*, 1939), was a realist reconstruction of the Cheng–Zhu school of principle (see *Chinese Buddhism and the Rise of Neo-Confucianism*), in which the realm of principle (*li*) is "first" in the order of being, not of time.

Under Mao, Feng told the Chairman that he was "unwilling to be a remnant of a bygone age in a time of greatness". He published a self-criticism in 1950 and in 1973–76 assisted the campaign against Confucius, which cost him his reputation. Outside China he is seen mainly as a historian, inside it as an original philosopher. Wing-tsit Chan's verdict was generous: "At a time when Chinese intellectuals saw little value in the Chinese tradition, Professor Feng upheld it."

## The New Confucians and Mou Zongsan

"New Confucianism" (distinct from the Song–Ming "Neo-Confucianism") usually names Xiong Shili and three younger men, Mou Zongsan, Tang Junyi and Xu Fuguan, though David Elstein in the SEP warns that calling them Xiong's "disciples" is "a little misleading". Mou called Xiong his teacher but criticised him; Tang said he did not understand Xiong well; Xu met him only during the Second World War. Broader definitions add Liang, Feng and Zhang Junmai, and John Makeham argues that the movement was created retrospectively.

In 1958 Zhang, Tang, Mou and Xu signed *A Manifesto for a Re-appraisal of Sinology and Reconstruction of Chinese Culture*, drafted by Tang. It argued that Western sinology had misread China and that understanding required "sympathy and reverence"; that the core of Chinese culture is the teaching of mind and nature, following Lu Xiangshan and Wang Yangming rather than Zhu Xi; and that China must learn science and democracy from the West, while the West could learn from China.

{{image: Mou Tsung-san | Mou Zongsan teaching in Hong Kong in the 1960s.}}

Mou Zongsan (1909–1995) left for Taiwan in 1949 and taught in Hong Kong from 1960. He translated Kant's three *Critiques*, and works such as *Intellectual Intuition and Chinese Philosophy* (1971) made him, in the SEP's words, "widely acclaimed as the greatest Chinese philosopher of the twentieth century". Kant had reserved **intellectual intuition**, a knowing that grasps things as they are in themselves, to God (see *Kant*). Mou called this Kant's greatest mistake: Confucians, Buddhists and Daoists all affirm that human beings have it, and its Confucian form, the "innate moral knowing" (*liangzhi*) of Mencius and Wang Yangming, is moral and creative. The sudden alarm Mencius describes at seeing a child about to fall into a well is such an intuition. So Mou reversed Kant on freedom. In Elstein's reconstruction: autonomy is necessary for morality to be possible; morality is real, since we feel our moral responses as "a definite presence which cannot be denied"; so autonomy is real, not merely a postulate. Critics reply that such intuitions may be culturally learned rather than a priori, and that Mou gives no test for telling true intellectual intuition from what merely feels like it. (Mou ranked Wang Yangming above Zhu Xi, as *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* notes, but put a third lineage, from Hu Hong to Liu Zongzhou, highest.)

Mou's best-known political argument concerns **self-negation** (*kanxian*), and runs as follows:

1. Confucianism excels at "inner sagehood" (moral cultivation) but was historically weak at "outer kingship" (government, economy, science).
2. Traditional Confucian politics assumed a *direct* link between morality and politics: a good ruler suffices for good government. But it had no way of reliably passing power to sages, so it was unstable.
3. Democracy is not a moral system: elections are not limited to the virtuous, and its goodness lies in objective, value-neutral structures that only theoretical reason, not moral reason, can produce.
4. So moral reason must restrict or negate itself, letting theoretical reason and a partly independent politics develop: an *indirect* link. The same self-negation of moral knowing produces the cognitive mind that does science.
5. The ground of all this is Mencius's teaching that human nature is good: democracy is needed so that each person can realise that nature.
6. Therefore democracy and science are not alien to Confucianism but required by it.

The objections are serious. Traditional Confucians reject Mou's "wholesale acceptance of Western liberty and democracy", and since 1978 "Mainland New Confucians" led by Jiang Qing, and advocates of Confucian meritocracy such as Bell and Bai, have rejected his conclusion. Elstein stresses that the necessity in step 6 is "dialectical or practical", not logical: there is no contradiction in an autocrat letting people realise their nature; "it simply does not often work out". So if democracy is only the likeliest means, a Confucian might prefer a better meritocracy if one existed. Others, as Jason Clower's IEP entry reports, find Mou's intuition propounded rather than argued. **The best reply** is that self-restriction is itself a moral demand: morality realises its own goals better through objective institutions than by hoping for sage-rulers. Tang Junyi (1909–1978) argued in parallel from the equality of moral persons, and Xu Fuguan treated democracy as the full realisation of Confucian "rule by virtue", since it no longer depends on one ruler's goodness. Their student Tu Weiming (born 1940) later spoke of a "third epoch" of Confucianism.

```checkpoint
q: In the 1923 debate, what was Liang Qichao's arbitrating position?
a*: Science can help with most problems of life and Zhang overstated intuition, but beauty, love, religious experience and moral sentiment lie beyond scientific method.
a: Science can solve every problem of life, so Zhang Junmai was simply wrong.
x: That was closer to Ding Wenjiang's claim that science is "all-sufficient".
a: Science is useless for life, which belongs entirely to Neo-Confucian cultivation.
x: Liang explicitly granted that science helps with most problems of life.
a: The debate should be settled by adopting Marxism as the science of history.
x: Zhang rejected Marxism, and Liang's arbitration did not appeal to it.
hint: Liang tried to give each side part of what it wanted.
why: In "The View of Life and Science" he split the difference: science for most of life, but not for beauty, love, religion or moral feeling.
---
q: According to Mou Zongsan, why must moral reason "negate itself"?
a: Because morality is an illusion that science exposes.
x: Mou held morality to be a reality we feel; self-negation serves moral ends.
a: Because Kant proved that human beings lack intellectual intuition.
x: Mou called Kant's denial of human intellectual intuition his greatest mistake.
a*: Because democracy and science need value-neutral structures and a cognitive mind that moral reason cannot directly produce, so it must step back to let theoretical reason work.
a: Because Confucianism requires rule by a single sage-king.
x: Mou argued that reliance on sage-rulers made traditional Confucian politics unstable.
hint: Think about the difference between a "direct" and an "indirect" link between morality and politics.
why: Self-negation (kanxian) creates the indirect link: moral reason restricts itself so that democratic institutions and science can develop.
```

## Chinese Marxism

Li Dazhao (1889–1927), chief librarian at Peking University from 1918, was the first major Chinese intellectual to support the October Revolution. In "Youth and the Villages" (February 1919) he wrote: "China is a rural nation and most of the laboring class is made up of peasants. If they are not liberated, then our whole nation will not be liberated" (Meisner's translation). He co-founded the Communist Party with Chen Duxiu and was hanged in 1927.

Mao Zedong's two philosophical essays came from lectures at Yan'an in 1937. *On Practice* (July) holds that "man's social practice alone is the criterion of the truth of his knowledge of the external world" (official translation): knowledge rises from perception to rational knowledge and then "leaps" back into revolutionary practice. *On Contradiction* (August), which drew on Ai Siqi, holds that contradiction is universal but also particular, and distinguishes the "principal contradiction" in any situation. In October 1938 Mao spoke of the "Sinification" of Marxism: "the universal truth of Marxism must have a national form before it can be useful". (See *Marx*, and the History chapter *Maoism*.)

After 1978 the picture changed again. Li Zehou (1930–2021) published a new reading of Kant and in *The Path of Beauty* (1981) started an "aesthetics fever" in the 1980s. Confucianism revived on the mainland, and the overseas New Confucians were republished there, usually with their criticisms of the Communist Party cut out.

## Gandhi: Truth-Force

Gandhi (1869–1948) coined his key term in South Africa. A competition in his paper *Indian Opinion* (dated 1906 by some sources, 1907–08 by others) produced *sadagraha*, which he altered to *satyagraha*, from *satya* ("truth") and *āgraha* ("firmness"). He explained the choice:

```quote
Truth (satya) implies love, and firmness (agraha) engenders and therefore serves as a synonym for force. I thus began to call the Indian movement Satyagraha, that is to say, the Force which is born of Truth and Love or non-violence, and gave up the use of the phrase 'passive resistance'.
Gandhi · Satyagraha in South Africa, tr. Valji G. Desai (Navajivan) · 1928
```

Passive resistance, he wrote, was seen as "a weapon of the weak". Ruskin's *Unto This Last*, paraphrased into Gujarati in 1908 as *Sarvodaya*, "the welfare of all", named his social ideal. He extended *ahimsa*, non-harm, to all sentient beings while admitting, in his *Autobiography* (Mahadev Desai's translation), that "Man cannot for a moment live without consciously or unconsciously committing outward himsa (violence)".

Gandhi's case for nonviolence can be reconstructed from his own statements (the numbering is ours):

1. The end of action is Truth, but no human being possesses the whole truth: "what appears to be truth to the one may appear to be error to the other" (1920).
2. So we may not inflict suffering on an opponent who may be right; the opponent "must be weaned from error by patience and compassion".
3. Means and ends are inseparable: "ahimsa is the means; Truth is the end." Violent means corrupt the end.
4. Voluntary self-suffering converts the opponent and moves the public, where coercion only compels. In his words to an inquiry in 1920, the doctrine meant "vindication of truth, not by infliction of suffering on the opponent, but on oneself".
5. Therefore the right way to resist injustice is truth-force: non-cooperation, civil disobedience and self-suffering, never violence.

**Objections.** George Orwell's "Reflections on Gandhi" (*Partisan Review*, January 1949) opens: "Saints should always be judged guilty until they are proved innocent." Orwell argued that Gandhian methods depend on civil rights and publicity and could not work in a totalitarian state. He cited Gandhi's view of 1938, reported by Louis Fischer, that German Jews should have committed collective suicide to rouse the world, and held that Gandhi was being honest about where his principle led. A second objection is historical: perhaps Gandhi succeeded only because Britain was exhausted by the world wars and his opponents relatively sympathetic. A third concerns his letters to Hitler ("Dear friend") of 1939 and 1940, which never reached him (whether intercepted or never sent is disputed): naive, say critics; consistent, say admirers.

A fourth objection asks whose freedom Gandhi defended. In 1896 he complained that whites in South Africa were "degrading the Indian to the level of a raw Kaffir", using a racial slur. Ashwin Desai and Goolam Vahed argue that he kept Indian grievances apart from Africans', took part on occasion in racial stereotyping, and in 1906 led a stretcher-bearer unit during the suppression of the Bambatha (Zulu) rebellion. Others note that by 1910 he wrote that Africans "alone are the original inhabitants of the land", and that Mandela admired him. A fifth is consistency: in 1918 Gandhi recruited Indian soldiers for the British army.

**Replies.** On the recruiting, Gandhi held that true ahimsa cannot coexist with cowardice, so people had to be capable of fighting before they could choose not to. Andrew Fiala's SEP entry on pacifism treats nonviolence as "a total practice of virtue" and points to Martin Luther King and to Mandela and Desmond Tutu as evidence that it is not tied to one opponent. Some readers even find that Orwell's essay moves towards Gandhi. How "absolute" Gandhi's pacifism was remains an open question.

## Ambedkar: Against Gandhi, Towards the Buddha

B. R. Ambedkar (1891–1956) was born a Mahar, a Dalit ("untouchable") caste. His sharpest clash with Gandhi came in 1932. Ramsay MacDonald's Communal Award gave the "Depressed Classes" separate electorates with 71 seats. Ambedkar argued: untouchables are a distinct minority whose interests conflict with caste Hindus'; in joint electorates caste-Hindu majorities choose which Dalit candidates win; so only separate electorates guarantee representatives answerable to Dalits. Gandhi held that untouchability was a sin within Hinduism that Hindus themselves must remove, and that separate electorates would divide Hindu society for good. He began a fast unto death in Yerwada jail. Ambedkar's objection was that the fast coerced the weaker party, making the minority's leader answerable for the Mahatma's life; it turns "self-suffering" into pressure on the powerless. The Poona Pact of 24 September 1932 replaced separate electorates with 148 reserved seats in joint electorates. Historians debate whether it was a compromise or a defeat for Dalits. In 1945 he wrote that Congress had "sucked the juice out of the Poona Pact and threw the rind in the face of the Untouchables".

His later work moved from critique to construction. *Who Were the Shudras?* (1946) argued that the Shudras had been an Aryan community of the warrior rank, degraded after feuds with Brahmins, and called "the Aryan race theory" "so absurd that it ought to have been dead long ago". He chaired the committee that drafted India's Constitution. On 14 October 1956 at Nagpur he became a Buddhist and led about half a million followers into conversion. *The Buddha and His Dhamma* (published 1957, after his death) gives suffering, ignorance and nirvana social and political meanings. It is the scripture of **Navayāna**, the "New Vehicle", his own name for this Buddhism. Critics say its social emphasis distorts the canonical teaching; supporters reply that the caste passages in Buddhist texts are late.

## Radhakrishnan and Aurobindo

Sarvepalli Radhakrishnan (1888–1975) began by answering the missionary charge that Vedānta had no room for ethics. After *Indian Philosophy* (1923 and 1927) he became, in 1936, the first Spalding Professor of Eastern Religion and Ethics at Oxford, and later President of India. In *The Hindu View of Life* (1927) he wrote that "The Vedanta is not a religion, but religion itself in its most universal and deepest significance" (p. 23): all religions interpret one intuitive experience, which Śaṅkara's Advaita, the non-dualism described in *Vedānta: Śaṅkara, Rāmānuja and Madhva*, expresses best. Critics, as Michael Hawley's IEP entry reports, find his reasoning circular (experience validated by the Upaniṣads, the Upaniṣads by experience) and his "East" and "West" orientalist. His statement that "the system of caste is the outcome of tolerance and trust" (p. 93) shows how far he stood from Ambedkar.

Aurobindo Ghose (1872–1950), a radical nationalist, withdrew in 1910 to French Pondicherry after his acquittal in the Alipore Bomb Case. *The Life Divine*, serialised in his journal *Arya* from 1914 to 1919 and revised as a book in 1939–40, rejects Śaṅkara's view of the world as *māyā*, illusion. Brahman manifests as the world in play (*līlā*); evolution runs from matter to life to mind because spirit is already "involved" in matter; and its goal is not escape but the descent of the **Supermind**, a divine "Truth-Consciousness". Man is a "transitional being", and integral yoga aims at a transformation of the whole person.

## Matilal, Daya Krishna and Mohanty

Daya Krishna (1924–2007) attacked the picture of India that Radhakrishnan had made famous. In "Three Myths about Indian Philosophy" (*Diogenes*, 1966) he rejected the claims that Indian philosophy is essentially spiritual, aimed at liberation (*mokṣa*); that it is bound to the authority of the Vedas; and that it consists of fixed "schools". He also organised dialogues between Sanskrit pandits and English-writing philosophers.

Bimal Krishna Matilal (1935–1991) embodied that meeting. After teaching at the Sanskrit College in Calcutta, he wrote a Harvard doctorate on the Navya-Nyāya doctrine of negation, studied with Quine, and became Spalding Professor at Oxford in 1976 or 1977, succeeding R. C. Zaehner. His *Perception* (1986) defends a realism close to Nyāya–Vaiśeṣika (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*) against Buddhist phenomenalism and idealism, while engaging modern sense-data theorists; *The Word and the World* (1990) presented India's contribution to the philosophy of language. His method also allowed critique: he speculated that Nyāya's doctrine of non-overlapping universals (*jāti*, also the word for caste) might reflect a Brahmanical ideal of a society without "intermixture of classes". J. N. Mohanty (1928–2023), a Göttingen doctorate and a scholar of both Husserl and classical Indian philosophy, read the two traditions side by side.

Both halves of this chapter end in the same place: Mou, Matilal and Daya Krishna treated their traditions neither as museum pieces nor as preparations for Western thought, but as partners in argument.

```checkpoint
q: What was Ambedkar's main objection to Gandhi's 1932 fast?
a: That fasting was forbidden by the Hindu scriptures.
x: Ambedkar's objection concerned power, not scripture.
a*: That it coerced the weaker party, making the Dalit leader answerable for the Mahatma's life.
a: That Gandhi wanted to keep separate electorates for Dalits.
x: Gandhi fasted against separate electorates.
a: That Gandhi's fast was too short to be taken seriously.
x: It was a fast unto death; its seriousness was the problem.
hint: Ask who carried the pressure created by the fast.
why: Under the fast's pressure separate electorates were dropped; the Poona Pact gave 148 reserved seats in joint electorates instead.
---
q: Which of these was one of Daya Krishna's "Three Myths about Indian Philosophy"?
a: That Indian philosophy has no theory of perception.
x: That was not among his myths; Matilal's Perception treats Indian theories of perception at length.
a: That Indian philosophy began only under British rule.
x: Daya Krishna did not discuss this; his myths concerned spirituality, authority and schools.
a: That Indian philosophy was invented by Radhakrishnan.
x: He criticised the "spiritual India" picture associated with Radhakrishnan, but this was not one of his myths.
a*: That Indian philosophy is essentially spiritual, aimed at liberation.
hint: The three myths were about aim, authority and organisation.
why: The essay (Diogenes, 1966) rejected the claims that Indian philosophy is spiritual, authority-bound and divided into fixed schools.
```

## Further exploration

- **David Elstein, *Democracy in Contemporary Confucian Philosophy* (2014).** Mou, Tang, Xu and others on Confucian democracy, by the author of the SEP entry.
- **John Makeham (ed.), *New Confucianism: A Critical Examination* (2003).** Critical essays, including on the movement's retrospective creation.
- **Stephen C. Angle, *Contemporary Confucian Political Philosophy* (2012).** Confucian political theory after Mou, including self-restriction.
- **Lydia H. Liu, Rebecca E. Karl and Dorothy Ko (eds.), *The Birth of Chinese Feminism: Essential Texts in Transnational Theory* (2013).** He-Yin Zhen's essays in translation.
- **Ashwin Desai and Goolam Vahed, *The South African Gandhi: Stretcher-Bearer of Empire* (2015).** The revisionist account of Gandhi and Africans.
- **Nalini Bhushan and Jay L. Garfield, *Minds Without Fear: Philosophy in the Indian Renaissance* (2017).** Indian philosophers writing in English, including Aurobindo and Radhakrishnan.
- **Bimal Krishna Matilal, *Perception: An Essay on Classical Indian Theories of Knowledge* (1986).** An analytic defence of Nyāya realism.$modernasia_master$,
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
  select $modernasia_quiz$[
    {"type": "mcq", "prompt": "In the 1923 'science and metaphysics' debate, what did Zhang Junmai argue?", "options": ["Problems of life ('outlooks on life') are subjective, intuitive and rooted in free will, so science cannot solve them", "Science is 'all-sufficient' and metaphysics is built from empty words", "Marxism is the only scientific outlook on life", "Chinese culture should be replaced wholesale by Western culture"], "answerIndex": 0, "explanation": "Zhang, influenced by Eucken and Bergson, held that outlooks on life lie outside science's method; Ding Wenjiang replied that science is 'all-sufficient'.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Mou Zongsan call Kant's 'greatest mistake'?", "options": ["Making freedom a postulate of practical reason", "Writing three Critiques instead of one", "Denying that human beings have intellectual intuition", "Holding that morality requires autonomy"], "answerIndex": 2, "explanation": "Kant reserved intellectual intuition to God; Mou held that Confucians, Buddhists and Daoists all affirm humans have it, in the Confucian case as innate moral knowing (liangzhi).", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Poona Pact of 24 September 1932 do?", "options": ["Created separate electorates for the Depressed Classes with 71 seats", "Ended Ambedkar's campaign for Dalit rights", "Made Ambedkar chairman of the Constitution's drafting committee", "Replaced separate electorates with 148 reserved seats in joint electorates"], "answerIndex": 3, "explanation": "The Communal Award had given separate electorates with 71 seats; after Gandhi's fast, the Pact substituted 148 reserved seats within joint electorates.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about B. K. Matilal's Perception (1986) is accurate?", "options": ["It argues that Indian philosophy is essentially spiritual", "It defends a realism close to Nyāya–Vaiśeṣika against Buddhist phenomenalism and idealism", "It is a commentary on Aurobindo's The Life Divine", "It argues that perception gives no knowledge of the external world"], "answerIndex": 1, "explanation": "Matilal defended a Nyāya-style realism against Sautrāntika and Yogācāra views, engaging modern sense-data theorists along the way.", "id": "q4"},
    {"type": "open", "prompt": "Reconstruct Mou Zongsan's argument that the 'self-negation' (kanxian) of moral reason grounds democracy and science. Then give the strongest objection and the best reply.", "rubric": "A strong answer explains inner sagehood versus outer kingship; the traditional 'direct' link between morality and politics and its instability (no reliable way of passing power to sages); democracy as value-neutral structures produced by theoretical rather than moral reason; moral reason restricting itself to create an 'indirect' link, the same self-negation producing the cognitive mind of science; the Mencian ground that human nature is good; and the conclusion that democracy and science are required by Confucianism. It notes Elstein's point that the necessity is practical, not logical, and states objections: traditional Confucians, Jiang Qing's Political Confucianism and meritocrats (Bell, Bai) reject the conclusion; if democracy is only the likeliest means, a better meritocracy might be preferred; Mou's intuition is propounded rather than argued. The reply: self-restriction is itself a moral demand, since morality achieves its goals better through institutions than through hoping for sage-rulers; Tang and Xu offer parallel arguments.", "id": "q5"},
    {"type": "open", "prompt": "Set out Gandhi's case for satyagraha as a sequence of premises and a conclusion. Which objection do you find strongest, and how might a defender of Gandhi reply?", "rubric": "A strong answer gives: Truth as the end, but no one has the whole truth; so we may not inflict suffering on an opponent who may be right; means and ends are inseparable ('ahimsa is the means; Truth is the end'); self-suffering converts and moves the public; so injustice should be resisted by non-cooperation, civil disobedience and self-suffering. It weighs objections: Orwell (1949) that the method needs publicity and civil rights and would fail against totalitarianism, citing Gandhi's 1938 view of German Jews reported by Fischer; the historical claim that Britain was exhausted and relatively sympathetic; the undelivered letters to Hitler; Desai and Vahed on Gandhi and Africans in South Africa; the 1918 recruiting; Ambedkar's charge that the 1932 fast coerced the weaker party. Replies may include Gandhi's view that ahimsa cannot coexist with cowardice, Fiala on nonviolence as a total practice of virtue and the later successes of King, Mandela and Tutu, and readings of Orwell as moving towards Gandhi. Credit a reasoned judgement either way.", "id": "q6"}
  ]$modernasia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/modern-chinese-and-indian-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
