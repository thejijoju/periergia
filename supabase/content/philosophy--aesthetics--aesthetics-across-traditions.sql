-- Aesthetics across Traditions — canonical master article, co-written and human-reviewed.
-- philosophy/aesthetics/aesthetics-across-traditions @ research/advanced/read.
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
    'philosophy/aesthetics/aesthetics-across-traditions',
    'research',
    'advanced',
    'read',
    $traditions_master$> **Why do audiences enjoy a tragedy that makes them weep?** This chapter treats aesthetic theory beyond Europe as a set of arguments. It begins with the Indian theory of *rasa*, the "taste" of a play or poem, and sets out step by step Abhinavagupta's answer to the puzzle of painful emotions in art, with an objection and a reply. It then turns to Chinese theories of painting, calligraphy and music; to Japanese ideals of *yūgen*, *wabi* and *sabi*, and the modern history of "wabi-sabi"; to Islamic calligraphy, ornament and the long debate over images; and, more briefly, to Yoruba ideas of beauty and character.

## Did Other Traditions Have "Aesthetics"?

The word "aesthetics" is European and modern, and *What Is Art?* describes how recent the European "system" of the fine arts is. Did other traditions, then, have no aesthetics? Yolaine Escande, in the Stanford Encyclopedia of Philosophy (SEP), answers: "Although there is no word such as 'aesthetics' in Chinese philosophy, if we understand it not in the restrictive sense of the science of beauty but in the broader sense of reflection on the theory of art, then aesthetics does indeed exist in Chinese philosophy." The word itself reached China through Japan in the early twentieth century, and its use for the Chinese tradition has been controversial. In Japan too, the discipline "did not get underway until the nineteenth century", though its key ideas arose long before.

The absence of a word, on this argument, does not show the absence of a theory. The questions differ, though. In China, Escande observes, "only artists may theorize", and the focus falls on the creative process and the relation between maker and viewer rather than on the artwork as an object. Yuriko Saito adds that comparative aesthetics has found a greater emphasis on "the aesthetics of everyday life in many non-Western cultures than in the West": Japanese arts are "ways", such as *chadō*, the way of tea.

## Rasa: the Taste of a Performance

The founding text of Indian aesthetics is the ***Nāṭyaśāstra***, a Sanskrit treatise on the performing arts attributed to the sage Bharata; its real author is unknown, and there may have been several. Estimates of its date range from 500 BCE to 500 CE; most scholars put its first complete version between 200 BCE and 200 CE. It calls drama a "fifth Veda" and sets out its theory of rasa in chapters 6 and 7.

*Rasa* literally means "juice, essence or taste". In the theory it names the distinctive emotional flavour a work offers its audience. The central formula, the **rasa sūtra**, reads in Daniel Meyer-Dinkgräfe's translation:

```quote
Rasa is produced from a combination of Determinants (vibhava), Consequents (anubhava) and Transitory States (vyabhicaribhava).
Attributed to Bharata · Nāṭyaśāstra, chapter 6, tr. Daniel Meyer-Dinkgräfe · first complete version probably 200 BCE – 200 CE
```

The **determinants** (*vibhāva*) are the causes of an emotion: the person it is directed at and the circumstances that excite it. The **consequents** (*anubhāva*) are its visible effects, the gestures an actor performs. The **transitory states** are passing feelings that accompany a mood. Behind each rasa lies a **stable emotion** (*sthāyibhāva*). There are eight rasas: the erotic (from love), the comic (from mirth), the furious (from anger), pathos (from sorrow), the heroic (from energy), terror (from fear), disgust (from disgust) and wonder (from astonishment). The ideal spectator is the *sahṛdaya*, "one who has heart".

A ninth rasa, *śānta* (peace), came later: its acceptance "had to undergo much struggle between the sixth and tenth centuries". Abhinavagupta argued for it, likening śānta to the string of a jewelled necklace on which the other eight are strung. Rasa theory spread to dance, music, poetry, painting and sculpture; Satyajit Ray applied it in his Apu Trilogy (1955–59).

## How Does Rasa Arise? The Commentators

The sūtra says rasa is "produced", but where, and how? Commentators gave rival answers. A caution: the oldest surviving commentary is Abhinavagupta's *Abhinavabhāratī*; the earlier commentators' works are lost, and we know them mainly through Abhinavagupta, who quotes them in order to criticise them.

Bhaṭṭa Lollaṭa is reported to have held a **production** view: rasa is the stable emotion intensified by its causes and effects, located in the character portrayed, and in the actor by imitation. The objection is that this leaves out the spectator. Śaṅkuka offered an **inference** view: the spectator infers the character's emotion from the performance, and the cognition of the actor as the character is neither true nor false, like recognising a painted horse. Abhinavagupta's teacher Bhaṭṭa Tauta, and Abhinavagupta himself, objected that inference is merely intellectual and cannot produce relish.

Bhaṭṭa Nāyaka (c. 900 CE), in his lost *Mirror of the Heart*, went further. As Malcolm Keating's SEP entry reports, rasa for him is not a meaning words convey but "an experiential event which is caused by sentences". Poetry has a **generalising power** (*bhāvakatva*): it presents situations not as one particular person's circumstances but in general form, a process called *sādhāraṇīkaraṇa*, "universalisation". The audience then enjoys the result through a further capacity (*bhojakatva*), "and the result is a transcendent, rapturous experience of rasa".

## Dhvani: Meaning by Suggestion

Abhinavagupta's own answer drew on Ānandavardhana (c. 820–890), a Kashmiri court poet and author of the *Dhvanyāloka* ("Light on Suggestion"). Before him, Keating writes, Indian poetics focused mainly on classifying figures of speech; after him it theorised about meaning itself. Ānandavardhana argued for a third power of language, **suggestion** (*dhvani*), beyond literal and metaphorical meaning. In his example, "The village is on the Ganges" suggests the purity of a village beside the holy river; suggestion operates after both literal and metaphorical meaning. Among the things suggested are aesthetic moods, so rasa is conveyed by suggestion, and rasa is the proper aim of all poetry. Keating compares dhvani to Grice's implicature, but only roughly, since Ānandavardhana denied that suggestion works by inference.

This was debated too: Mahima Bhaṭṭa (c. 1025) reduced suggestion to inference, others to existing powers of language. And where does rasa live? For Ānandavardhana it is in the text; after Abhinavagupta's commentary on him, the *Locana* ("The Eye"), the emphasis shifts to the reader's experience. *Interpretation and Meaning in Art* takes up the wider question of what a work means.

## Why Do We Enjoy Sorrow? Abhinavagupta's Answer

Abhinavagupta (c. 950–c. 1016/1020), a Kashmir Śaiva philosopher and mystic, faced a problem that European philosophy calls the **paradox of tragedy**. David Hume stated it in "Of Tragedy" (1757): "It seems an unaccountable pleasure, which the spectators of a well-written tragedy receive from sorrow, terror, anxiety, and other passions, that are in themselves disagreeable and uneasy." Rasa theory faces it in sharper form, because pathos, terror and disgust are themselves rasas, and a rasa is something relished. Abhinavagupta held that delight in art "is not limited to pleasant experiences but also includes painful ones". His reasoning can be reconstructed like this:

1. The emotions portrayed in drama include sorrow, fear and disgust, which are painful in ordinary life.
2. Rasa, the aim of drama and poetry, is a relish: something enjoyed.
3. Rasa cannot simply be the emotion located in the character, or the spectator's own experience is left unexplained; nor can it be a mere inference about the character's emotion, since inference is a cool intellectual act that yields no relish.
4. Poetry generalises: it presents causes and effects of emotion not as the circumstances of a particular person but in universal form (Bhaṭṭa Nāyaka's point, which Abhinavagupta accepted).
5. In this generalised state the spectator's own latent dispositions, such as love and sorrow, are manifested, and the spectator "transcends the limitations of one's limited self".
6. So what is relished is not the private emotion that makes sorrow painful but a transformed state that scholars describe as *alaukika*, non-worldly, and essentially pleasurable, even when its material is sorrow.

Abhinavagupta did not accept Bhaṭṭa Nāyaka's two special powers, objecting to positing extra powers; he explained universalisation through suggestion instead.

**Objection.** Jonathan Gilmore's SEP entry on the paradox of tragedy presses a worry against solutions that remove or distance the painful feeling: such a theory "doesn't explain how we can take pleasure in a displeasing emotion, it just implicitly denies that we experience the displeasing emotion". Has the spectator stopped feeling sorrow at all? There is an internal strain too: Abhinavagupta says even disgust is pleasurable for the sensitive spectator, yet elsewhere treats disgust as incompatible with enjoying its object.

**Reply.** On Abhinavagupta's behalf one can accept the consequence. Rasa is not the stable emotion itself but something derived from it; tears and grief can be present while the overall state is relish, as when one savours a bitter flavour (an interpretive gloss on the metaphor of taste, not his words). In one older paraphrase, rasa is "the original emotion transfigured by aesthetic delight". This places him near what Gilmore calls **conversionary** accounts, Hume's among them, on which the painful passions are "converted into pleasure". Whether the sorrow survives the conversion is the point both sides still dispute.

Comparisons with Aristotle are modern; Abhinavagupta did not make them. On a traditional reading Aristotle's *catharsis* is a release of pity and fear, though its proper understanding "is controversial" (see *Aristotle*). One comparative study argues that catharsis works by weakening an emotion's intensity, whereas Abhinavagupta locates the solution in "heart-sharing through aesthetically transformed emotions themselves": the feeling is not drained off but transformed.

```checkpoint
q: Why did Bhaṭṭa Tauta and Abhinavagupta reject Śaṅkuka's inference theory of rasa?
a*: Because inference is merely intellectual and cannot produce the relish that rasa is.
a: Because Śaṅkuka located rasa only in the text, not in any person.
x: That is closer to Ānandavardhana's view of where rasa lives; Śaṅkuka's theory concerned the spectator's inference.
a: Because they thought an actor could never be mistaken for a character.
x: Śaṅkuka himself said the cognition of the actor as the character is neither true nor false; the objection was about relish.
a: Because they denied that rasa has anything to do with the spectator.
x: Abhinavagupta placed the emphasis on the spectator's experience, not away from it.
hint: Ask whether inferring that someone is sad is the same as enjoying a rasa.
why: Śaṅkuka said the spectator infers the character's emotion. His critics answered that inference is a cool, intellectual act; it explains knowing about an emotion, not relishing it.
---
q: What is the strongest objection, drawn from Gilmore's SEP entry, to Abhinavagupta's solution of the paradox of painful emotions?
a: That the Nāṭyaśāstra lists only pleasant rasas.
x: Pathos, terror and disgust are among its eight rasas; that is what creates the puzzle.
a: That Abhinavagupta copied his solution from Aristotle's catharsis.
x: Abhinavagupta did not compare rasa with catharsis; such comparisons are modern.
a*: That removing the painful side of the emotion does not explain pleasure in a displeasing emotion but denies that we feel one.
a: That universalisation makes art impossible to understand.
x: The objection is about pain and pleasure, not about understanding.
hint: If rasa is wholly pleasurable, is the spectator still sad?
why: Solutions that distance or transform the painful feeling risk explaining the paradox away: if the sorrow is no longer painful, the theory has not shown how we enjoy something painful. The reply is that grief can persist inside an overall relish.
```

## Chinese Painting and Calligraphy

The first Chinese theoretical texts on painting and calligraphy date from the second to fourth centuries CE, and their recurring theme is that a work must be alive. Wang Xizhi (303–361), "considered the greatest calligrapher", is credited with the principle that "the intention must precede the execution, then the character is realized" (Escande's translation). **Calligraphy** (*shufa*) is what the Chinese consider their most accomplished art, and a brushstroke is described as a body: "bone" for structure, "flesh" for thickness, "sinew" for tension and "blood" for ink. The ninth-century critic Zhang Yanyuan held that the stroke defines painting: colour blown onto silk "cannot be called painting".

The best-known painting theory is the **Six Laws** of the painter and critic Xie He, from the preface to his *Record of the Classification of Old Painters*, whose date within the sixth century is unsettled. The first law, *qiyun shengdong*, is often rendered "spirit resonance"; the others concern the "bone method" of the brush, correspondence to the object, colour, composition, and copying models. Without spirit resonance, Xie He said, there was no need to look further. But each law is only four characters long, every period has read them its own way, and scholars such as William Acker, Alexander Soper and Paul Goldin have offered competing translations.

Behind these ideas lies an argument about **resemblance**. Sikong Tu (837–908) held that "the resemblance is obtained by leaving the form behind", distinguishing formal likeness (*xingsi*) from spiritual likeness (*shensi*). Jing Hao in the tenth century put it precisely: "Formal resemblance means obtaining the apparent form (xing) but leaving out its breath (qi). Truth means that breath as well as substance are perfectly rendered." Truth, Escande comments, "goes beyond resemblance" but "does encompass it". Shen Zongqian, in a treatise of 1781, gave the underlying reason: paintings arise from "animated breaths" as heaven and earth create living things, so painting is not imitation of nature but analogous to nature's own creating. This is a real rival to the Greek theory of art as imitation.

{{image: Early Spring (painting) | Guo Xi's *Early Spring*, a hanging scroll dated 1072, now in the National Palace Museum, Taipei.}}

Guo Xi (c. 1020–c. 1090), a Northern Song court painter, is credited with a treatise compiled after his death by his son, which describes **three distances**, defined variously in the sources but roughly: looking up from a mountain's foot to its peak, looking past its front to what lies behind, and looking from a near mountain to far ones. Su Shi (1037–1101), poet, calligrapher and painter, championed spirit over outward likeness; one of his lines says, literally, that to judge painting by formal likeness is to see as a child does. From the Northern Song, scholar-artists who disdained realism, bright colour and paid work made ink painting a gentleman's art joined to poetry and calligraphy: **literati painting** (*wenrenhua*). In the twentieth century that spirit was blamed for China's decline and rejected, until interest revived in the early 1980s.

## Music and the Craftsmen: Xunzi and Zhuangzi

Chinese philosophy also argued about whether art is worth having. The Mohists condemned music as wasteful (see *Mozi, the Daoists and the Legalists: the Hundred Schools*). Xunzi (third century BCE; see *Confucius, Mencius and Xunzi*) answered in his "Discourse on Music": ritual and music are human artifices created by the sages, ritual for social cohesion, music for "the orderly expression of human emotions". The Mohists, in the words of Paul Goldin's SEP entry, missed "the psychological utility of music as an instrument of moral suasion": "When music is centered and balanced," Xunzi wrote, "the people are harmonious and not dissipated."

The *Zhuangzi* offered a different ideal: "butchers, musicians, cicada catchers, wheelmakers" who act with precision, ease "and a sense of flow". Writers on art took these craftsmen as models. Yu Shinan (558–638) compared the calligrapher to Zhuangzi's wheelwright, who could not put his skill into words: "First, we must seize the movement with our heart before our hand may echo it. This cannot be expressed by words." The artist here is less an imitator than a medium through which the Way acts.

## Japan: Depth, Austerity and Patina

*Mono no aware*, "the pathos of things", is introduced in *The Meaning of Life and the Fear of Death*. Motoori Norinaga (1730–1801), through his study of *The Tale of Genji*, made it central to literary theory, broadening it into "a profound sensitivity to the emotional and affective dimensions of existence in general" (see *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*). Behind the Japanese ideals lies a view of reality: the world of flux is the only one, with no "Platonic" realm behind it, and the arts reflect impermanence, "sometimes lamenting but more often celebrating it".

After the Heian court (see *Medieval Japan: Court, Samurai, and Shogun*), new ideals appeared "suggestive of retreat or withdrawal". **Yūgen**, "mysterious grace" or profundity, was first a Chinese word for the dark or mysterious. Kamo no Chōmei, author of the *Hōjōki* (1212), described it: "It is like an autumn evening under a colorless expanse of silent sky. Somehow, as if for some reason that we should be able to recall, tears well uncontrollably." Yūgen concerns the depth of this world, not another one. Zeami Motokiyo (c. 1363–c. 1443), actor and playwright of Nō drama, called it "the highest principle": "Cannot the beauty of Grace be compared to the image of a swan holding a flower in its bill, I wonder?" He also held that the actor reaches a "higher naturalness" only after years of practising set forms that run "counter to the movements of the body": spontaneity is the fruit of discipline.

**Wabi**, a "subdued, austere beauty", was first praised in poetry and developed most fully in tea and Zen. Kenkō asked, in Donald Keene's translation: "Are we to look at cherry blossoms only in full bloom, at the moon only when it is cloudless?" Branches about to blossom, or gardens strewn with faded flowers, "are worthier of our admiration". The great practitioner was the tea master Sen no Rikyū (1522–1591), who was ordered by Toyotomi Hideyoshi to commit suicide, for reasons that remain uncertain. Rikyū built tiny rustic tea rooms and preferred local wares to costly Chinese ones. His crawl-in entrance, about sixty centimetres square, made samurai leave their swords outside, so that all guests entered alike; Dennis Hirota reads wabi as "non-hierarchical awareness of the real". The aesthetic carries an argument about equality.

The *Nampōroku*, a record of Rikyū's teachings that appeared a century after his death, advises that "In the small [tea] room, it is desirable for every utensil to be less than adequate". Its authenticity is doubted: some scholars attribute it to Tachibana Jitsuzan (1655–1708), who claimed to have found it.

**Sabi**, "rustic patina", meant desolateness in the *Man'yōshū* and later what has aged well (its homophone *sabi* means rust). Its classic modern defence is Tanizaki's *In Praise of Shadows*:

```quote
We do not dislike everything that shines, but we do prefer a pensive lustre to a shallow brilliance.
Tanizaki · In Praise of Shadows · 1933
```

What of "**wabi-sabi**"? As a single concept it is largely modern. Leonard Koren's *Wabi-Sabi for Artists, Designers, Poets & Philosophers* (1994) popularised it in the West, but in *Wabi-Sabi: Further Thoughts* (2015) Koren admitted that though both words are ancient, "they have not been used as a set phrase until very recent days". Paul Atkins argues the compound is "of recent, not ancient, vintage", far more common outside Japan, and re-imported there; sabi comes chiefly from poetry and wabi from tea. The two ideals share an outlook, but the history tells against presenting wabi-sabi as a timeless Japanese essence.

Kuki Shūzō's *The Structure of "Iki"* (1930), discussed in *The Kyoto School and Modern Japanese Philosophy*, carried this line into modern philosophy, and Yuriko Saito's books, from *Everyday Aesthetics* (2007) to *Aesthetics of Care* (2022), draw on Japanese aesthetics to argue that philosophy should attend to daily life.

```checkpoint
q: Why does Jing Hao distinguish "formal resemblance" from "truth" in painting?
a: Because he held that good painting should avoid any likeness to its subject.
x: Escande stresses that truth goes beyond resemblance but still encompasses it.
a*: Because formal resemblance captures the apparent form but leaves out the breath (qi), while truth renders breath as well as substance.
a: Because he thought colour mattered more than the brushstroke.
x: Zhang Yanyuan held that the brushstroke defines painting; colour blown onto silk was not painting at all.
a: Because he followed Xie He's sixth law, which ranks copying above everything else.
x: Xie He said that without spirit resonance, his first law, there was no need to look further.
hint: Think of the contrast between xingsi and shensi.
why: Chinese theorists from Sikong Tu to Su Shi held that likeness of outward form is not enough; a true painting conveys the animating breath of its subject, and in doing so also achieves resemblance.
---
q: What is the main historical point made by Koren's later book and by Paul Atkins about "wabi-sabi"?
a: That wabi and sabi are recent words invented in the twentieth century.
x: Both words are ancient; what is recent is using them as one set phrase.
a: That Sen no Rikyū first joined the two words in the Nampōroku.
x: Nothing in the sources says this, and the Nampōroku's authenticity is itself doubted.
a: That sabi comes from tea and wabi from poetry.
x: Atkins says the reverse: sabi chiefly from poetry and wabi from tea.
a*: That the two words were not used as a set phrase until very recently, and the compound is far more common outside Japan.
hint: Ask whether the compound or its parts is new.
why: Koren himself conceded in 2015 that the two ancient words had not been used together as a phrase until recently, and Atkins argues the compound was popularised abroad and re-imported to Japan.
```

## Islamic Aesthetics: Writing, Pattern and the Image Question

Islamic art is often explained by one claim: that Islam forbids images. The Qur'ān itself does not prohibit representing living beings; it condemns idolatry. Prohibitions occur in the hadith, reports of the Prophet's sayings, some of which threaten image-makers on the Day of Judgement, when they will be challenged to "breathe life" into what they made. These condemn makers more than owners and allow exceptions such as dolls. From the ninth century Sunni scholars increasingly read them as categorical; Shia and Sufi traditions were less stringent, and practice varied by period, place and school.

Neither the claim that Islam bans images nor the claim that there was never any restriction fits. Mosques and copies of the Qur'ān are consistently without figures, yet secular figural art "historically flourished in nearly all Islamic cultures", and the human figure is central to Persian, Ottoman and Mughal painting. Kamāl al-Dīn Behzād (c. 1455/1460–1535), head of the royal workshops at Herat and later Tabriz, is regarded as the high point of Persian manuscript painting, and some prefaces to albums of paintings defended images by comparing God to an artist.

**Calligraphy** holds the place of honour, reflecting not simply limits on images but, as one survey puts it, "the central role of writing and the written word in Islamic culture"; Ibn Muqla (d. 939/940) codified the proportions of its scripts. The **arabesque**, a rhythmic scroll of stylised foliage probably invented in Baghdad around the tenth century, seems "infinitely extendable" beyond its frame, and **geometric patterns** grew elaborate: ten-pointed *girih* designs appear in the Jameh Mosque of Isfahan (1086).

What do such patterns mean? Keith Critchlow and others argue that they lead "the viewer to an understanding of the underlying reality, rather than being mere decoration". Art historians reply that claims about the arabesque's theological meaning are "without support from written historical sources", since the medieval Islamic world left no record of its makers' intentions. Valérie Gonzalez's *Beauty and Islam* (2001), which reconstructs a classical Arabic theory of beauty, has likewise been criticised for a universalising method.

Philosophers did reflect on beauty. Al-Ghazālī (c. 1056–1111; see *Al-Ghazālī, Averroes and the Quarrel over Reason*) devoted a book of his *Revival of the Religious Sciences* to love; according to summaries of it, he lists beauty among the causes of love and argues that inner beauty is loved more than outer. Another book weighs the case for and against **samāʿ**, listening to music and poetry in Sufi gatherings; his permission was conditional, placing the limits not in music itself but in external factors and the right "time, place and company". Ibn al-Haytham (c. 965–c. 1040; see *Perception and the External World*) is reported by modern scholars to have explained how beauty is perceived from visible properties such as light, colour and proportion; this rests on secondary studies and should be held loosely.

## Character Is Beauty: Yoruba Aesthetics

African aesthetics raises the problem discussed in *African Philosophy: the Ethnophilosophy Debate and Beyond*: whose theory is being reported, the people's or the researcher's? The Yale art historian Robert Farris Thompson reportedly asked Yoruba critics to judge sculptures and recorded nineteen criteria, the most frequent being *jijora*, moderate resemblance to the subject. His essay "An Aesthetic of the Cool" (1973) described *itutu*, coolness: the composure and calm face of Yoruba sculpture, which he traced into the Americas.

In Yoruba thought *iwa* means "both character and morality", and also being or nature; Gbadegesin calls it "perhaps the most important moral concept". A Yoruba saying, "character is beauty", has been treated as central to Yoruba aesthetics by scholars such as Rowland Abiodun (*Yoruba Art and Language*, 2014): outward beauty without good character is hollow. Between criteria gathered from informants and the work of Yoruba scholars, the evidence is still being sifted, so these ideas are best read as proposals rather than a settled system.

## What Comparison Shows

Comparison reveals no single universal aesthetics, but it does show shared problems met with different arguments. Abhinavagupta and Hume both asked why painful emotions please in art. Chinese theorists and Plato both asked how art relates to what it depicts, and the Chinese answer, that a painting should share nature's animating breath, rivals imitation. Rikyū's tea room and Xunzi's music both treat art as shaping how people live together. And every tradition had its quarrels: over how rasa arises, what Xie He meant, what geometric ornament signifies. To study these traditions as philosophy is to take those quarrels seriously.

## Further exploration

- **Sheldon Pollock (ed. and tr.), *A Rasa Reader: Classical Indian Aesthetics* (2016).** The rasa debates in translation, with analysis.
- **Daniel H. H. Ingalls, Jeffrey Moussaieff Masson and M. V. Patwardhan (trs.), *The Dhvanyāloka of Ānandavardhana with the Locana of Abhinavagupta* (1990).** The standard English translation of the theory of suggestion and Abhinavagupta's commentary.
- **Susan Bush and Hsio-yen Shih, *Early Chinese Texts on Painting* (1985).** Early Chinese writings on painting in English translation.
- **J. Thomas Rimer and Yamazaki Masakazu (trs.), *On the Art of the Nō Drama: The Major Treatises of Zeami* (1984).** Zeami's own writings on yūgen and the actor's training.
- **Dennis Hirota (ed.), *Wind in the Pines: Classic Writings of the Way of Tea as a Buddhist Path* (1995).** Translated sources on tea and wabi, including the *Nampōroku*.
- **Valérie Gonzalez, *Beauty and Islam: Aesthetics in Islamic Art and Architecture* (2001).** A debated attempt to reconstruct Islamic theories of beauty and aesthetic experience.
- **Robert Farris Thompson, *Flash of the Spirit: African and Afro-American Art and Philosophy* (1983).** Yoruba and other African aesthetics and their afterlife in the Americas.$traditions_master$,
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
  select $traditions_quiz$[
    {"type": "mcq", "prompt": "What is the status of śānta (peace) in the Indian theory of rasa?", "options": ["It is the first of the eight rasas listed in the Nāṭyaśāstra", "It was invented by Ānandavardhana as the rasa of suggestion", "It is a ninth rasa whose acceptance was contested between the sixth and tenth centuries and which Abhinavagupta championed", "It is the stable emotion behind the comic rasa"], "answerIndex": 2, "explanation": "The Nāṭyaśāstra lists eight rasas. Śānta was added later; its acceptance 'had to undergo much struggle between the sixth and tenth centuries', and Abhinavagupta argued for it, likening it to the string on which the other eight are strung like jewels.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Malcolm Keating's SEP entry, where did Ānandavardhana locate rasa, and how did this change after Abhinavagupta?", "options": ["In the text; after Abhinavagupta's commentary the emphasis shifted to the reader's emotional experience", "In the actor; after Abhinavagupta it was located in the playwright", "In the character; after Abhinavagupta it was located in the text", "In the reader; after Abhinavagupta it was located in the text"], "answerIndex": 0, "explanation": "For Ānandavardhana rasa is found within the text, conveyed by suggestion (dhvani). After Abhinavagupta's Locana, the emphasis shifts onto the reader's emotive experience.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement best describes the evidence on images in Islam?", "options": ["The Qur'ān explicitly bans all pictures of living beings, so figural art never existed in Islamic lands", "There were never any religious objections to images in Islam", "Only Shia scholars objected to images, while Sunni scholars permitted them", "The Qur'ān does not prohibit images but condemns idolatry; hadith condemn image-makers; mosques and Qur'āns are without figures, yet secular figural art flourished, including Persian, Ottoman and Mughal painting"], "answerIndex": 3, "explanation": "The Qur'ān condemns idolatry but does not prohibit representing living beings. Hadith condemn image-makers, and from the ninth century Sunni scholars increasingly read them as categorical, while Shia and Sufi traditions were less stringent. Religious art is aniconic, but secular figural art flourished in nearly all Islamic cultures.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Sen no Rikyū's small crawl-in entrance to the tea room achieve, on the SEP's account?", "options": ["It kept the room dark so that lacquerware would gleam", "It made samurai leave their swords outside, so that all guests entered alike", "It allowed the host to inspect guests before admitting them", "It displayed costly Chinese wares to guests as they entered"], "answerIndex": 1, "explanation": "The entrance, about 60 by 60 cm, meant samurai left their swords on a rack outside and every guest entered in the same way; Hirota reads wabi as 'non-hierarchical awareness of the real'. Rikyū in fact preferred local, rustic wares to costly Chinese ones.", "id": "q4"},
    {"type": "open", "prompt": "Reconstruct Abhinavagupta's answer to the question of how audiences can enjoy painful emotions such as sorrow in drama. State the strongest objection and a reply, and compare his view with Hume's and with Aristotle's catharsis.", "rubric": "A strong answer sets out the steps: painful emotions such as sorrow, fear and disgust are portrayed; rasa is a relish; rasa cannot be merely the character's emotion (Lollaṭa) or an inference about it (Śaṅkuka), since that leaves the spectator out or yields no relish; poetry universalises its situations (sādhāraṇīkaraṇa, Bhaṭṭa Nāyaka's point, accepted by Abhinavagupta); the spectator's latent dispositions are manifested and the limited self transcended; so what is relished is a transformed, non-worldly (alaukika) state, pleasurable even when its material is sorrow. It gives the objection from Gilmore's SEP entry: such accounts deny rather than explain pleasure in a displeasing emotion (and the internal strain over disgust). It gives a reply: rasa is derived from the stable emotion, not identical to it, and grief can persist within an overall relish, close to 'conversionary' accounts like Hume's, on which painful passions are 'converted into pleasure'. It notes that catharsis, on a traditional and contested reading, is a release or weakening of pity and fear, whereas Abhinavagupta speaks of transformed emotion, and that the comparison is modern. Credit for noting that the earlier commentators are known only through Abhinavagupta.", "id": "q5"},
    {"type": "open", "prompt": "What do Islamic arabesques and geometric patterns mean? Present the debate fairly, and explain what the evidence does and does not allow us to say.", "rubric": "A strong answer describes the arabesque (rhythmic scrolling foliage, probably invented in Baghdad around the tenth century, apparently 'infinitely extendable') and geometric girih patterns (e.g. the Jameh Mosque of Isfahan, 1086). It presents the spiritual reading (Keith Critchlow and others: patterns lead the viewer to an understanding of underlying reality, not mere decoration) and the art historians' reply that theological claims about the arabesque lack support from written historical sources, since the medieval Islamic world left no record of makers' intentions. It may mention that calligraphy's prominence reflects the central role of the written word, not only limits on images, and the criticism of Gonzalez's universalising method. Credit for distinguishing what is documented from what is interpretation, and for avoiding the oversimplification that ornament exists only because Islam bans images.", "id": "q6"}
  ]$traditions_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/aesthetics/aesthetics-across-traditions', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
