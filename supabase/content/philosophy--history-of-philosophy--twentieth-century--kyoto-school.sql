-- The Kyoto School and Modern Japanese Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/kyoto-school @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/kyoto-school',
    'research',
    'advanced',
    'read',
    $kyoto_master$> **In the 1920s and 1930s a circle of philosophers at Kyoto Imperial University tried to think Western philosophy and Mahāyāna Buddhism together, and produced the first original body of modern Japanese philosophy.** This chapter sets out Nishida Kitarō's logic of place step by step, with Tanabe Hajime's objection; follows Tanabe, Nishitani Keiji and Watsuji Tetsurō; meets Kuki, the left-wing critics and the women thinkers of the age; and weighs the controversy over the School's wartime nationalism.

## A School That Never Founded Itself

The Stanford Encyclopedia of Philosophy (SEP) entry by Bret W. Davis describes the Kyoto School (*Kyōto-gakuha*) as "a group of 20th century Japanese philosophers who drew on the intellectual and spiritual traditions of East Asia, those of Mahāyāna Buddhism in particular, as well as on the methods and content of Western philosophy". Its founding figure was Nishida Kitarō (1870–1945); the other two most prominent members were Tanabe Hajime (1885–1962) and Nishitani Keiji (1900–1990), and the name comes from their association with Kyoto Imperial University. Unlike Plato's Academy, it never founded an institution, and Nishida reportedly never meant to found a "school".

It is often said that the Marxist Tosaka Jun invented the name, but the story is more tangled. Tsuchida Kyōson, a former student of Nishida, used *Kyōto-ha* in a book written in English (published 1927) and in its Japanese version, published first, in 1926 spoke of "the so-called Kyōto School, the founder of which is Nishida", the "so-called" implying the phrase was already in use. Tosaka's 1932 essay "The Philosophy of the Kyoto School" then gave the School its lasting name, *Kyōto-gakuha*, in an attack on Nishida, Tanabe and Miki Kiyoshi as the epitome of "bourgeois philosophy in Japan", an idealism blind to material conditions. Ironically, Tosaka and Miki are now counted by some as the School's "left wing".

Membership has always been disputed. John Maraldo lists six criteria scholars have used, from a connection with Nishida to attitudes towards the Pacific War and towards "absolute nothingness". Ōhashi Ryōsuke's later generations include Hisamatsu Shin'ichi, Kōsaka Masaaki, Kōyama Iwao, Suzuki Shigetaka and Ueda Shizuteru. Watsuji Tetsurō (1889–1960) and Kuki Shūzō (1888–1941), brought to Kyoto by Nishida, "remained too independent" for the inner circle. D. T. Suzuki (1870–1966), who helped introduce Nishida to Zen practice, was not an academic philosopher: a "closely related thinker".

## Nishida Kitarō: A Miner of Ore

Nishida was born on 19 May 1870 in Unoke, on the Sea of Japan. He graduated from Tokyo Imperial University in 1894 with a thesis on Hume's theory of causation, then taught at provincial schools while "more intent on formal meditation practice under Zen masters in Kyoto". After nearly a decade of practice he passed the *mu* kōan of the *Gateless Barrier* (a kōan is a Zen riddle meant to break through ordinary thinking; *mu* means "nothing"). He told Nishitani that his early, "impossible desire" had been to bring Zen and philosophy together. *Chinese Buddhism and the Rise of Neo-Confucianism* traced Zen's arrival in Japan; this is its modern philosophical life.

His *An Inquiry into the Good* (1911), built on "pure experience" before any split into subject and object, is discussed in *Philosophy in an Age of Empire*. From a post at Kyoto Imperial University (from 1910) he brought in Tanabe, Watsuji and Kuki, before retiring in 1928 and moving to Kamakura in 1929. He described himself, in Robert Schinzinger's translation: "I have always been a miner of ore; I have never managed to refine it."

Nishida later dropped "pure experience", worried that it was tainted with psychologism, the reduction of philosophy to facts about individual minds. Maraldo heuristically divides his work into phases of consciousness, place (about 1927–32) and the dialectical historical world (until his death on 7 June 1945); James Heisig rejects discrete stages. The middle phase began with the essay "Place" (*Basho*), published in June 1926 and collected in *From That Which Acts to That Which Sees* (1927), which many scholars treat as the start of "Nishida philosophy" proper. Its preface states the programme:

```quote
…does there not lie hidden at the base of our Eastern culture … something which sees the form of the formless and hears the voice of the voiceless? … it is my wish to provide this quest with a philosophical foundation.
Nishida Kitarō · Preface to From That Which Acts to That Which Sees (tr. Bret W. Davis) · 1927
```

{{image: Kitarō Nishida | Nishida Kitarō (1870–1945), the founding figure of the Kyoto School.}}

## The Logic of Place, Step by Step

Western culture, Nishida wrote in the same preface, "thought form as being"; he proposed that the ultimate ground of reality is "absolute nothingness". Two words help. *Zettai*, "absolute", literally means "severing of opposition", having no opposing other; *sōtai*, "relative", means "mutual opposition". A true absolute therefore cannot stand over against the relative, or it would be one more relative thing; it must embrace it. Following Davis's outline of the 1926 essay and Maraldo's account, the argument runs:

1. Whatever is, is related to other things, and any relation between A and B needs a third term, a place "in which their relation is situated". To be is to be within.
2. Physical space is not enough, since things are determined by more than location; the place is better understood as a field of judgment, a category: red and blue contrast "within the same color field".
3. Categories are unified in consciousness, which combines colour, size and shape into the perception of one apple; so consciousness is a more concrete place. Reversing Aristotle, for whom substance is the subject that can never be a predicate, Nishida calls consciousness the "transcendental predicate" that can never be a subject: a "relative nothingness", no-thing relative to the things it knows.
4. But "as Kant demonstrated", consciousness reflects things only as they appear under its categories; and it is still set over against its objects, so its nothingness remains relative to being.
5. There must therefore be an ultimate place where subject and object "come to be and pass away": "the place, not just of intellectual judgments, but of birth and death".
6. That place cannot be a being, or it would need a further place and be opposed to other beings. It must be opposed to nothing: "the place of true [absolute] nothingness", a "groundless ground" that envelops all beings while letting them determine themselves.

The conclusion is that reality is the self-determination of absolute nothingness, and individuals are its "focal points". Nishida had a further motive: only in such a place can there be truly individual persons and genuine encounters between I and thou, since "there is no universal [of being] whatsoever that subsumes the I and the thou".

**The strongest objection** came from Tanabe in 1930, in "Requesting Instruction from Professor Nishida". He made two charges. First, the place of absolute nothingness rests on a religious or mystical intuition, crossing illegitimately from reason to supra-rational experience: "a kind of Plotinian 'emanationism'", the view that the world flows out of a transcendent One (see *Plotinus and Neoplatonism*). Second, by making nothingness an unchanging, enveloping place above the interaction of beings, Nishida "ends up falling back into a metaphysics of being after all". Nothingness, Tanabe argued, should be thought as a movement of "absolute mediation" or "absolute negation". The two men "infamously stopped speaking to one another".

**Nishida's reply** was that his idea involves religious experience but is neither mystical ecstasy nor "thought in the direction of substance, as is Plotinus' One": "it is not a matter of the self-determination of being, but rather the self-determination of nothingness". A transcendent One would swallow the world; only a nothingness that negates itself affirms the many, so that, as he put it, "the mountain is mountain, the river is river". He also changed course. Under pressure from Tanabe, Miki and Tosaka in the early 1930s, he turned to the historical, dialectical world and to the body acting in history. Nishitani and others judged that Tanabe's criticisms "often fail to do justice to Nishida's thought"; Davis adds that they "were not without their point".

Suki Finn, in the *Internet Encyclopedia of Philosophy*, asks whether absolute nothingness, defined in contrast to the relative, really escapes relative definition: "It seems that we have stumbled upon contradictions and binaries again." Scholars of Buddhism may add that Nishida's Buddhism stayed at the level of personal experience and rarely engaged the philosophical traditions of Madhyamaka, Yogācāra, Tiantai or Huayan.

## Contradiction, Action and History

Nishida's later key phrase was "absolutely contradictory self-identity" (*zettai mujunteki jikodōitsu*), the title of an essay of March 1939. In 1934 he had written, in Davis's translation, that "Reality is being and at the same time nothingness … the self-identity of what is absolutely contradictory." Unlike Hegel's dialectic, it holds opposites together without resolving them in a higher synthesis. Its practical side is "acting intuition" (*kōi-teki chokkan*), "seeing a thing by becoming it", as an artist or an experimenting scientist does; the historical world moves "from the created to the creating" out of an "absolute present".

In his last essay, "The Logic of Place and the Religious Worldview" (February–April 1945), God, or the absolute, "contains its own absolute self-negation within itself": neither pantheist nor wholly beyond the world, but "immanently transcendent". The closer the self approaches God, the sharper the difference ("inverse correspondence"), an idea drawn partly from D. T. Suzuki's "logic of *soku-hi*" ("is and is not"). Was this Buddhist philosophy? Nishida's answer was careful: "It is not that I conceived of my way of thinking in dependence on Mahāyāna Buddhism; and yet it has come into accord with it."

```checkpoint
q: What was Tanabe Hajime's main charge against Nishida's place of absolute nothingness in 1930?
a*: That it rested on mystical intuition, a kind of "Plotinian emanationism", and fell back into a metaphysics of being.
a: That it was too close to Marxist materialism and ignored the spirit.
x: That was nearly the opposite of Tosaka's complaint that the School was an idealism ignoring material conditions; Tanabe's worry was mysticism.
a: That it copied Heidegger's Being and Time without acknowledgement.
x: Tanabe's objection concerned mysticism and the metaphysics of being, not any borrowing from Heidegger.
a: That it denied the existence of individual things altogether.
x: Nishida argued the opposite: only absolute nothingness lets truly individual beings and I–thou encounters exist.
hint: Tanabe's objection named a late ancient philosopher.
why: Tanabe argued that Nishida crossed from reason to supra-rational religious experience and, by making nothingness a fixed enveloping place, slipped back into a metaphysics of being; nothingness should instead be a movement of absolute mediation.
---
q: Why, on Nishida's account, must the ultimate place be "absolute" nothingness?
a: Because the senses show us that nothing really exists.
x: Nishida did not deny that things exist; absolute nothingness is the place in which they are and determine themselves.
a: Because Zen masters had told him so, and no argument was needed.
x: Nishida offered an argument, moving from physical space to fields of judgment to consciousness and beyond.
a*: Because anything that stood over against beings would itself be relative; only what is opposed to nothing can embrace both subject and object.
a: Because consciousness is the final place, and it can never be an object.
x: Consciousness is only a relative nothingness: it is limited by its categories and still set over against its objects.
hint: Recall what zettai, "absolute", literally means.
why: Zettai means "severing of opposition". A place that was a being, or a nothingness opposed to being, would need a further place; only a nothingness opposed to nothing can embrace everything while letting it determine itself.
```

## Tanabe Hajime: Species and Repentance

Tanabe, born in Tokyo on 3 February 1885, trained in mathematics before philosophy. Nishida invited him to Kyoto in 1919; in Germany in 1922–23 he studied with Husserl and befriended the young Heidegger, and in 1924 he wrote what the SEP calls the world's first article on Heidegger's thought (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*). He succeeded Nishida in 1928. Tosaka's point, often repeated, is that without Tanabe's critique there would have been no "school", only disciples.

From 1934 Tanabe developed the "logic of species" (*shu no ronri*). Between the individual and universal humanity stands the "species": a people with its own specific character. Adapting Hegel, he argued that the nation-state could embody and make rational a people's specificity as a "concrete universal". Here came what Davis calls a critical lapse: Tanabe proposed that the Japanese nation-state could be a "supreme archetype" for other nations. Heisig judges this "a step that was fatal but really unnecessary, if not outright inconsistent with the principles of his logic … nothing in the logic of the specific allows any one instance to become an archetype for the others."

In October 1944 he lectured on "metanoetics" (*zangedō*, the way of repentance), published in 1946 as *Philosophy as the Way of Metanoetics* (English 1986, translated by Takeuchi Yoshinori with Valdo Viglielmo and James Heisig). Reason, driven by Kant's antinomies to "absolute critique", must die to its own power and be reborn through "Other-power" (*tariki*), the term of Shinran's Shin Buddhism. The book renewed the quarrel with Nishida: "only that which entails the absolute existential mediation of the death and resurrection of the self can be called absolute nothingness", not a mere "self-identity of absolute contradictories". Davis finds this "hardly convincing", since Nishida too speaks of the self's death and resurrection. And Heisig notes that "one looks through that work in vain for any admission of guilt for particular actions or statements that he had made."

## Nishitani Keiji: Through Nihilism to Emptiness

Nishitani (1900–1990) studied under Nishida and Tanabe and, from 1937 to 1939, with Heidegger in Freiburg, just as Heidegger was turning to nihilism; Heidegger often invited him home to learn about Zen. After *Nihilism* (1949; see *Nietzsche*) came his masterpiece, *Religion and Nothingness* (1961; English 1982, translated by Jan Van Bragt), whose Japanese title literally means "What is religion?". The programme, in his own words, was "overcoming nihilism by way of passing through nihilism". Nishitani judged that Nishida began from a standpoint where the ego was already broken through, and so neglected the existential path to it. His own path has five steps:

1. Modern people treat themselves as egos and things as objects to be manipulated by technology: the field of being and consciousness.
2. This standpoint collapses into nihilism: God as the highest being is dead, as Nietzsche's madman announced, and self and things lose their reality.
3. Fleeing back to the old certainties is no solution; one must step into the field of nihility (*kyomu*) and pass through it.
4. But nihility is still a relative nothingness: it negates being from outside, and so remains defined against being.
5. Only by descending beneath nihility to the field of emptiness (*śūnyatā*), where emptiness "empties itself even of the standpoint that represents it as some 'thing' that is emptiness", are self and things affirmed again, neither nullified nor reified, "on their own home-ground".

True emptiness, he wrote in Van Bragt's translation, "is to be realized as something united to and self-identical with being". Behind this lie Nāgārjuna's "emptiness of emptiness" and the *Heart Sutra*'s "form is emptiness; emptiness is form"; as *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* explained, *śūnyatā* is not "nihility". By this measure Nietzsche reached only "a standpoint of relative absolute nothingness". To the objection that this is Zen theology rather than philosophy, Nishitani refused the label "natural theologian of Zen", while admitting he spoke from "the standpoint of Zen" (see also *Existentialism: Sartre, Beauvoir and Camus*).

## Watsuji Tetsurō: Ethics as Betweenness

Watsuji, born in Himeji on 1 March 1889, wrote early books on Nietzsche and Kierkegaard, then turned to criticising Western individualism, and "single-handedly", says Robert Carter, rescued the Zen master Dōgen from obscurity. He held the chair of ethics at Tokyo Imperial University from 1934 to 1949. His *Fūdo* (1935; *Climate and Culture*) argued that Heidegger had overplayed time and underplayed space; that critique is set out in *Phenomenology: Husserl, Heidegger and Merleau-Ponty*.

*Ningen*, "human being", is written with characters for "person" and "space" or "between". A human being is both individual and social, never just one: we exist in *aidagara*, "betweenness", the network of relationships into which we are born, beginning with the mother. Robinson Crusoe and Hobbes's state of nature are abstractions. So, as *Ethics as the Study of Humanity* (1934; some sources say completed 1935) and the three-volume *Rinrigaku* (*Ethics*, 1937, 1942, 1949) argue, the study of ethics is the study of human being, and ethics "consists of the laws of social existence". Ethical life is a double negation. The individual negates the group to become an individual, then negates its own separateness to return to the whole; "the annihilation of the self", in Yamamoto Seisaku and Carter's translation, "constitutes the basis of every selfless morality since ancient times".

Is this collectivism? Carter argues that Watsuji insists on a balanced dual nature, and that the third volume of *Rinrigaku* says no nation has the one correct path and rejects any universal state. William LaFleur replies that by giving the state the authority of the whole, Watsuji "provides a smooth rationale for a totalizing state". His wartime writings sharpen the question: *The Idea of Reverence for the Emperor and Its Tradition* (1943), for which he was branded a reactionary, and a 1944 volume contrasting Japanese readiness for self-sacrifice, if the Emperor required it, with Western egoism, which the Occupation authorities banned from sale. Whether he repented is disputed: some accounts say he regretted his wartime support, while LaFleur suggests he felt no need to recant.

## Kuki, the Left Wing, and Women Philosophers

Kuki Shūzō spent seven or eight years in Europe (sources differ), studying with Rickert, Husserl and Heidegger and hiring the young Sartre as a French tutor. *The Structure of Iki* (1930) analysed *iki*, a refined style born in the erotic culture of Edo's pleasure quarters, into three moments: coquetry, brave composure and resignation. Leslie Pincus excoriates him as an ultranationalist, even a fascist; Graham Parkes rejects the claim that he was a fascist.

Miki Kiyoshi (1897–1945), arrested in 1930 after money he had lent was passed, without his knowledge, to the Communist Party, later headed the cultural division of Prime Minister Konoe's Shōwa Research Association (from 1937, a date some dispute). Arrested again in 1945 for sheltering a fugitive, he died of kidney disease in Toyotama Prison on 26 September 1945, forty days after the war ended. Tosaka (1900–1945) was arrested in 1938 under the Peace Preservation Law, and died in Nagano prison on 9 August 1945, the day of the Nagasaki bombing. Davis writes that both died "as a result of their intellectual resistance"; Miki's think-tank role shows that their records, too, were mixed.

Women did philosophy in modern Japan, though none was a member of the School. Yosano Akiko, Hiratsuka Raichō and Yamakawa Kikue are now acknowledged as philosophers and appear in *Japanese Philosophy: A Sourcebook* (2011). Hiratsuka, a Zen practitioner, founded the women's magazine *Seitō* (*Bluestocking*) in 1911 with the words "In the beginning, woman was the sun". In the motherhood-protection debate of 1918–19, Yosano argued for women's economic independence against Hiratsuka's call for state support of mothers, and the socialist Yamakawa joined in. Among scholars of the School, Michiko Yusa wrote Nishida's main English biography and Yoko Arisaka has criticised his universalism.

## The War: A Structured Debate

The nationalism these philosophers faced had older roots: as *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* describes, Kokugaku ideas of racial identity and superiority fed nationalist ideology after 1868 (see also *The Meiji Restoration* and *Japan's Empire in Asia, 1895–1945*). The record is mixed. In a 1941 address to the emperor, Nishida warned that "any totalitarian system that negates outright the role of the individual is but an anachronism" (tr. Yusa). In 1943 Yatsugi Kazuo of the Center for National Strategy asked him for a rationale for the Greater East Asia Co-Prosperity Sphere. Nishida reportedly exploded in anger, then agreed; the result, "Principles for a New World Order", was "edited and 'simplified'" by a go-between. It insists that the Sphere must not mean imperialism, colonialism or totalitarianism, yet says, in Arisaka's translation, "In East Asia today there is no other but Japan," and calls the Imperial House "the beginning and the end of our world". He used slogans such as "all the world under one roof"; Ueda Shizuteru calls this a "tug-of-war over meaning" that Nishida lost.

Kōsaka, Nishitani, Kōyama and Suzuki held three round-table discussions in 1941–42, published in the magazine *Chūōkōron* in 1942–43 and as a book in 1943. They attacked Western imperialism's hypocrisy but whitewashed Japanese aggression in China and proposed "Japanizing" some "more superior" Asian peoples. Nishitani and Suzuki also joined a July 1942 symposium on "Overcoming Modernity", organised by the literary group *Bungakukai* rather than the School, where the Kyoto participants argued, against the critic Kobayashi Hideo, for overcoming modernity by going through it, not back to the classics. As Nishitani later wrote (tr. Parkes), "There is no turning back to the way things were." Notebooks kept by Tanabe's student Ōshima Yasuma, published by Ōhashi in 2001, record secret meetings of Tanabe, Nishitani and others (not Nishida) with a moderate faction of the Navy from 1942; the aim they detail is ending the war quickly; Ōshima's own 1965 account adds that the group agreed Tōjō's cabinet had to fall. As Nishitani told a student, "During the war we were struck on the cheek from the right; after the war we were struck on the cheek from the left." He and others were purged from their university posts for several years (see *The Second World War (WW2)*).

How should this be judged? **The critics** read the philosophy itself as ideology. Tetsuo Najita and H. D. Harootunian (1998) wrote that no group "came closer … to defining the philosophic contours of Japanese fascism". Other critical works include Bernard Faure's "The Kyoto School and Reverse Orientalism" (1995), Peter Dale's *The Myth of Japanese Uniqueness* (1986), Pincus's study of Kuki, and Naoki Sakai's "Modernity and Its Critique: The Problem of Universalism and Particularism" (1989). Robert Sharf (1993) and Brian Victoria's *Zen at War* (1997) documented Zen institutions' and D. T. Suzuki's support for the war.

**The careful critics** grant the philosophy its depth but refuse the excuse. Arisaka (1999) argues that "the chief claim of the defenders—that Nishida's philosophical 'universalism' is incompatible with nationalist ideology—fails because universalist discourse was used both as a tool of liberation and oppression"; a nation claiming to bear a universal principle, she adds, "should be familiar from recent American experience".

**The defenders and contextualisers** include Heisig and Maraldo, whose *Rude Awakenings* (1994) reopened the question in the West. Heisig holds that one must "ignore the greatest bulk of the writings of these thinkers" to find imperialism in their fundamental inspiration. Parkes (1997) rejected "the putative fascism of the Kyoto School"; Christopher Goto-Jones (2005) read Nishida's politics as neither ultranationalist nor liberal but Mahāyāna; David Williams (2005) offered a "revisionist" defence centred on Tanabe. Ōhashi, citing the Ōshima memos, speaks of "cooperative resistance": correction from within, which Davis concedes was "more or less successfully co-opted" by the nationalism it tried to reorient. Davis himself says many philosophers now treat the politics as "lamentable footnotes to the main text"; that is his view, and the debate is far from closed.

```checkpoint
q: What does Watsuji's word ningen show about human beings, on his account?
a: That human beings are essentially solitary thinkers, like Descartes's thinking self.
x: Watsuji rejected such abstractions; he dismissed even Robinson Crusoe as an abstraction from relationships.
a*: That a human being is both individual and social, existing in betweenness (aidagara).
a: That human beings are wholly determined by climate.
x: In Fūdo climate is "the agent by which human life is objectivised", shared with others; ningen itself names the individual–social structure of human life.
a: That the individual counts for nothing and should simply be absorbed into the state.
x: Carter stresses that Watsuji insists on a balanced dual nature, though critics such as LaFleur think his state theory tips towards totality.
hint: The word is written with characters for "person" and "between".
why: Ningen combines "person" with "space/between"; for Watsuji we are individuals and yet not just individuals, social and yet not just social, living in a network of relationships.
---
q: What do the Ōshima memos, published in 2001, record?
a: Nishida's private letters endorsing the attack on Pearl Harbor.
x: The memos record meetings Nishida did not attend; they concern Tanabe, Nishitani and others.
a: The minutes of the "Overcoming Modernity" symposium.
x: That symposium was organised by the Bungakukai literary group and published separately.
a: Tosaka Jun's prison diary.
x: Ōshima Yasuma was Tanabe's student; the notebooks are his.
a*: Secret meetings of Kyoto School members with a moderate faction of the Navy, aimed at ending the war quickly.
hint: Ōhashi Ryōsuke used them to support his "cooperative resistance" thesis.
why: Ōshima's notebooks record meetings from 1942 to just before the war's end involving Tanabe and Nishitani (not Nishida); they record in detail how to end the war quickly (the plan to topple Tōjō comes from Ōshima's later account).
```

## Afterlives: Dialogue and World Philosophy

From the 1970s Western departments of religious studies took up the School's philosophies of religion, largely ignoring the politics. The Nanzan Institute for Religion and Culture in Nagoya, founded in the mid-1970s and directed in turn by Heinrich Dumoulin, Jan Van Bragt and Heisig, has long been the centre of international research, and *Japanese Philosophy: A Sourcebook* (2011), edited by Heisig, Thomas Kasulis and Maraldo, was the first comprehensive collection. Abe Masao carried the School into Buddhist–Christian dialogue in North America, notably with "Kenotic God and Dynamic Sunyata" (in *The Emptying God*, 1990). Ueda Shizuteru, Nishitani's student, an Eckhart scholar and lay Zen master, led a Nishida revival from the 1980s with the formula "I, not being I, am I".

One question runs through all of this: is "Western being versus Eastern nothingness" a useful contrast? Heisig calls the School's "East" "something of an invention", while Maraldo holds that Nishida's problems "are universal" and "put 'East' and 'West' to rest". Davis presents the School as a contribution to a "world philosophy" beyond Eurocentrism. Its critics, following Arisaka, reply that universal claims once served an empire too. The debate continues.

## Further exploration

- **James W. Heisig, *Philosophers of Nothingness: An Essay on the Kyoto School* (2001).** The standard introduction to Nishida, Tanabe and Nishitani, including the political debates.
- **Robert E. Carter, *The Kyoto School: An Introduction* (2013).** An accessible first book on the School's main thinkers.
- **Michiko Yusa, *Zen and Philosophy: An Intellectual Biography of Nishida Kitarō* (2002).** The main English biography of Nishida.
- **Thomas P. Kasulis, *Engaging Japanese Philosophy: A Short History* (2018).** A comprehensive history with long treatments of Nishida and Watsuji.
- **Bret W. Davis (ed.), *The Oxford Handbook of Japanese Philosophy* (2020).** Chapters on all the major Kyoto School figures and their contemporaries.
- **James W. Heisig and John C. Maraldo (eds.), *Rude Awakenings: Zen, the Kyoto School, and the Question of Nationalism* (1994).** The landmark collection on the political controversy.
- **Christopher S. Goto-Jones, *Political Philosophy in Japan: Nishida, the Kyoto School, and Co-Prosperity* (2005).** A contested reinterpretation of the School's politics.$kyoto_master$,
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
  select $kyoto_quiz$[
    {"type": "mcq", "prompt": "Which statement about the name 'Kyoto School' is best supported?", "options": ["Tsuchida Kyōson spoke of the 'so-called' Kyōto-ha in 1926–27, and Tosaka Jun's 1932 essay, an attack on the School, gave it its lasting name, Kyōto-gakuha", "Nishida Kitarō founded the Kyoto School as an official institute in 1913", "Tosaka Jun invented the name from nothing in 1932 to praise his teachers", "American occupation officials coined the name in 1946"], "answerIndex": 0, "explanation": "Tsuchida, a former student of Nishida, used Kyōto-ha in Japanese in 1926 and wrote of 'the so-called Kyōto School' in English in 1927, implying the phrase was already in use. Tosaka's 1932 essay gave the lasting form Kyōto-gakuha while attacking the School as 'bourgeois philosophy'. The School never founded an institution, and Nishida reportedly never meant to found a 'school'.", "id": "q1"},
    {"type": "mcq", "prompt": "In Nishitani Keiji's Religion and Nothingness, why is the field of nihility not the final standpoint?", "options": ["Because nihility is identical with God as the highest being", "Because modern science has refuted nihilism", "Because nihility is still a relative nothingness, defined against being; only in the field of emptiness are self and things affirmed again", "Because Nishitani held that one should flee nihilism by returning to traditional beliefs"], "answerIndex": 2, "explanation": "Nishitani sought to overcome nihilism 'by way of passing through nihilism'. Nihility negates being from outside and so remains relative to it; only by descending to the field of emptiness (śūnyatā), which 'empties itself' even of being represented as a thing, are self and things affirmed 'on their own home-ground'. Fleeing back to reified being was, for him, no solution.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the meaning of Watsuji Tetsurō's term aidagara?", "options": ["The pure experience that precedes subject and object", "Betweenness: the network of relationships in which human beings exist as both individual and social", "The Other-power of Shinran's Shin Buddhism", "The refined style of Edo's pleasure quarters"], "answerIndex": 1, "explanation": "For Watsuji, ningen (human being) is written with characters for 'person' and 'between'; we exist in aidagara, betweenness, born into relationships beginning with the mother. Pure experience is Nishida's early term, Other-power (tariki) is Tanabe's borrowing from Shinran, and iki is Kuki Shūzō's subject.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about Nishida's 'Principles for a New World Order' (1943) is accurate?", "options": ["Nishida wrote it on his own initiative and it was published unedited", "It openly called for Japan to colonise the rest of Asia", "It persuaded Prime Minister Tōjō to change his war policy", "It rejected imperialism and colonialism for the Co-Prosperity Sphere, yet said that 'In East Asia today there is no other but Japan' to lead it"], "answerIndex": 3, "explanation": "Asked by Yatsugi Kazuo for a rationale for the Greater East Asia Co-Prosperity Sphere, Nishida reportedly exploded in anger, then agreed; a go-between edited and 'simplified' the text, and Nishida was disappointed that it had no effect on Tōjō. It insists the Sphere must not entail ethnocentrism, imperialism, colonialism or totalitarianism, yet names Japan as its necessary centre (tr. Arisaka).", "id": "q4"},
    {"type": "open", "prompt": "Reconstruct Nishida Kitarō's argument for the 'place of absolute nothingness'. Then state Tanabe Hajime's 1930 objection and assess Nishida's reply.", "rubric": "A strong answer explains zettai ('severing of opposition') and sōtai ('mutual opposition'), then gives the steps: to be is to be within a place; physical space gives way to fields of judgment (red and blue within the colour field); consciousness unifies categories and is a 'transcendental predicate', a relative nothingness; but consciousness is limited (as Kant showed) and still opposed to its objects; so there must be an ultimate place of 'birth and death' that is opposed to nothing, absolute nothingness, letting individuals determine themselves. It states Tanabe's charges in 'Requesting Instruction from Professor Nishida': a mystical leap, 'a kind of Plotinian emanationism', and a relapse into a metaphysics of being; nothingness should be absolute mediation. It gives Nishida's reply (not substance like Plotinus' One but the self-determination of nothingness; 'the mountain is mountain') and his turn to history, and may add Finn's objection that 'absolute' is itself defined against the relative and the verdict of Nishitani and others that Tanabe's criticisms were often unfair, with Davis's rider that they were 'not without their point'.", "id": "q5"},
    {"type": "open", "prompt": "Was the Kyoto School's wartime thought an ideology of Japanese imperialism, or an attempt at 'resistance from within'? Use evidence from the record and from both sides of the debate.", "rubric": "A strong answer uses the record: Nishida's 1941 warning against totalitarianism and his 1943 'Principles for a New World Order' (anti-imperialist language alongside 'no other but Japan' and the Imperial House as 'the beginning and the end of our world'); Tanabe's logic of species and the Japanese state as 'supreme archetype' (Heisig: 'fatal but really unnecessary'); the Chūōkōron round tables (criticism of Western imperialism alongside whitewashing aggression in China and 'Japanizing' other peoples); the Overcoming Modernity symposium as a Bungakukai event; the Ōshima memos of meetings with a moderate Navy faction; Watsuji's state theory and wartime writings, with his postwar stance disputed; Miki's and Tosaka's deaths in prison, with Miki's think-tank role complicating 'resistance'. It sets critics (Najita and Harootunian, Faure, Dale, Pincus, Sakai; Sharf and Victoria on Zen) against defenders (Heisig and Maraldo, Parkes, Ueda's 'tug-of-war over meaning', Goto-Jones, Williams, Ōhashi's 'cooperative resistance'), weighs Arisaka's argument that universalism served both liberation and oppression, and treats Davis's 'lamentable footnotes' as one side's view.", "id": "q6"}
  ]$kyoto_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/kyoto-school', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
