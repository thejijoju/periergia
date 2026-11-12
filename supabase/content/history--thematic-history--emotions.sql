-- Histories of Emotions: From the 'Rational Self' to Modern Neuroscience — canonical master article, co-written and human-reviewed.
-- history/thematic-history/histories-of-emotions-from-the-rational-self-to-modern-neuroscience @ research/advanced/read.
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
    'history/thematic-history/histories-of-emotions-from-the-rational-self-to-modern-neuroscience',
    'research',
    'advanced',
    'read',
    $mn_emotions_master$> **Do feelings have a history?** Historians of emotion say yes: not only the ways people show anger, grief, love or shame, but the feelings themselves are learned, and so they change between societies and centuries. This chapter treats emotion both as a subject and as a field of research. It runs from European arguments about passion and reason, from Descartes to Hume and Smith, and from theories of feeling made in India, China, Japan and the Arabic and Persian worlds; through the eighteenth-century cult of tears and the stiff upper lip, nostalgia, melancholy and shell shock, honour and humiliation, and the emotional labour of modern service work. It sets out the historian's tools, from Febvre's call of 1941 to Stearns, Reddy, Rosenwein and Scheer, and ends with the debate between universalists and constructionists, from Darwin and Ekman to LeDoux, Damasio and Barrett.

## Do Feelings Have a History?

The history of emotions studies how the experience and expression of feeling have varied between cultures and periods. Like the sociology and anthropology of emotion, it assumes that feelings themselves are learned, and many historians now treat emotion as a category of analysis as basic as class, race or gender.

The usual starting point is an essay by **Lucien Febvre**, co-founder of the *Annales* school, whose story the chapters on Social History and Intellectual History tell. In "La sensibilité et l'histoire" (1941), Febvre asked how the emotional life of the past could be reconstructed, a subject historians had largely neglected. The essay is cited as the main precursor of the *histoire des sensibilités*. Not everyone admired it: the medievalist Barbara Rosenwein, reviewing the field in 2002, called it "public policy masquerading as history", driven by present concerns.

Even the field's central word has a history. In *From Passions to Emotions* (2003), **Thomas Dixon** argued that "emotions" as a single psychological category is modern. Older writers spoke of passions, affections and sentiments; by about 1850 "emotions" had absorbed them in most English-language psychological writing, with the Scottish philosopher Thomas Brown (1778–1820) as a key figure. A critic replied that Brown's innovation was largely terminological, since the older framework of the "passions" had already done much of the work. Either way, a historian writing about "emotion" before about 1800 is using a modern term for things people then described differently.

## Passion, Reason and Sympathy: the "Rational Self"

The "rational self" of early modern European thought is often pictured as reason set against passion. The story is more tangled. **René Descartes**'s last treatise, *The Passions of the Soul* (1649), grew out of his correspondence with Princess Elisabeth of Bohemia, at whose request he wrote it. Descartes did not dismiss the passions; he explained them physically, through "animal spirits" produced in the blood, doing work we would now assign to the nervous system. He meant, he told his editor, to explain them "only as a Physicist", and he named six primitive passions: wonder, love, hatred, desire, joy and sadness. What later critics called his error was the sharp division of mind from body on which this rested.

Ninety years later **David Hume** reversed the hierarchy. In Book 2 of *A Treatise of Human Nature* (1739), "Of the Passions", he argued that reason alone can never move us to act or oppose a passion.

```quote
Reason is, and ought only to be the slave of the passions
David Hume · A Treatise of Human Nature, Book 2 · 1739
```

To press the point, Hume wrote that it is "not contrary to reason to prefer the destruction of the whole world to the scratching of my finger". **Adam Smith**'s *The Theory of Moral Sentiments* (1759) responded to, and departed from, the "moral sense" tradition of Shaftesbury, Hutcheson and Hume, putting sympathy in place of a moral sense. Smith's "sympathy" was the feeling of understanding another's passions by imagining oneself in their place, and moral judgement came from an imagined "impartial spectator". The chapter on The Enlightenment introduces Hume and Smith in other roles; here they appear as thinkers for whom morality was built from feeling.

## Other Theories of Feeling

Europe was not the first place to theorise emotion. In India the *Natyashastra*, a treatise on drama attributed to Bharata Muni and probably completed between 200 BCE and 200 CE, devotes its sixth chapter to **rasa**, the "relish" of emotion a performance evokes in its audience from underlying states, or *bhava*. It names eight rasas: love, mirth, fury, compassion, disgust, terror, heroism and wonder. A ninth, *śānta* (peace), was added after debate between the sixth and tenth centuries, and Abhinavagupta, around 1000 CE, gave the theory its fullest exposition.

In China, ***qing*** (情) is translated as emotion, feeling, sentiment or passion. The *Book of Rites* names seven emotions: happiness, anger, grief, fear, love, hate and desire. Daoist teaching in the *Zhuangzi* aimed at freedom from *qing*. **Mencius** (c. 371 – c. 289 BCE) took another path. Anyone, he argued, feels alarm at seeing a child about to fall into a well, and such reactions are the "four beginnings" of virtue: commiseration (of humanity), shame and dislike (of righteousness), deference (of propriety) and the sense of right and wrong (of wisdom). "The feeling of commiseration definitely is the beginning of humanity", in Wing-tsit Chan's translation. Against Xunzi, who held human nature to be bad, Mencius made moral feeling the root of virtue, not reason's opponent.

In Japan the psychoanalyst **Takeo Doi** (1920–2009) made ***amae***, dependence on another's indulgent goodwill, central to Japanese relationships in *Amae no Kōzō* (1971; in English *The Anatomy of Dependence*, 1973). Critics say he overstated its uniqueness, in the manner of *nihonjinron* writing on Japanese distinctiveness; some psychologists liken it to attachment theory.

Arabic and Persian literature built a rich language of love. **Layla and Majnun** tells of the seventh-century poet Qays ibn al-Mulawwah, called *Majnun*, "mad" (literally "possessed by jinn"), for his love of Layla. Nizami Ganjavi's Persian poem of 1188 carried the story into Persian, Turkish and Indian literatures. In exile from Córdoba, at Xàtiva in al-Andalus, in about 1022 **Ibn Hazm** wrote *The Ring of the Dove*, a treatise on love that praised restraint and chastity. María Rosa Menocal argued in 1987 that the troubadours' courtly love owed something to the Arabic poetry of al-Andalus. The chapter on Sex, Love, and Marriage in the Middle Ages describes the troubadours; the Arabic influence remains one theory, not settled fact.

## Sensibility and the Culture of Tears

Eighteenth-century Britain prized **sensibility**, an acute responsiveness, above all to other people's feelings. It drew on Locke's philosophy of the senses and on nerve medicine: George Cheyne blamed the "English Malady" on over-taxed nerves, but sensitive nerves were also thought to sharpen perception of beauty and moral truth.

In the sentimental novel characters wept, fainted and fell into fits as signs of fine feeling, from Richardson's *Pamela* (1740) to Mackenzie's *The Man of Feeling* (1771). Rousseau's *Julie, or the New Heloise* (1761) was perhaps the century's best-selling novel. Readers wrote to Rousseau in droves about their tears, sighs and ecstasies, as Robert Darnton showed in his essay "Readers Respond to Rousseau" in *The Great Cat Massacre*, a book the chapters on Social History and Intellectual History discuss; one reader claimed violent sobbing had cured his cold. Goethe's *The Sorrows of Young Werther* (1774) caused "Werther fever", and fear of imitative suicides led Leipzig to ban the novel and Werther-style dress in 1775.

Sentiment had political effects. Fiction that invited identification with the weak, such as orphans and condemned criminals, fed campaigns against the death penalty and slavery, a line running to Harriet Beecher Stowe's *Uncle Tom's Cabin* (1852). There was a backlash: by the 1790s anti-sensibility writers linked emotional volatility with the French Revolution and branded "sensible" men unpatriotic and effeminate.

## Restraint and the Stiff Upper Lip

The most influential story of long-term emotional change came from **Norbert Elias** (1897–1990), a German-Jewish sociologist who fled to Paris in 1933 and Britain in 1935; his mother was murdered at Treblinka. He later taught at the University of Ghana in 1962–64. *The Civilizing Process*, published in German in 1939, was almost ignored because of the war; republished in 1969 and translated into English from 1978, it became a classic. Elias argued that from roughly the end of the Middle Ages, European standards of violence, sex, bodily functions, table manners and speech were transformed by rising "thresholds of shame and repugnance", spreading outward from court etiquette, as centralised states grew and social interdependence thickened.

Rosenwein saw here a "grand narrative" equating Western civilisation with ever-growing restraint, resting on a "hydraulic" model of emotions as pressurised liquids eager to burst out. Others challenged its chronology. Peter Stearns's *American Cool* (1994) argued that Victorian Americans still prized intense, if channelled, feeling; Victorian advice treated controlled anger as a manly virtue. Only from about the 1920s did an aversion to emotional intensity, "cool", take hold, solidifying by the 1960s. In *Weeping Britannia* (2015), Dixon traced six centuries of British tears from Margery Kempe onward and argued that the **stiff upper lip**, bred in public schools through sport, corporal punishment and cold showers, was a fairly brief product of a militaristic, imperial age running from the late Victorian period to the mid-twentieth century, later projected back as a timeless national trait. The chapter on The Victorian Era describes the culture of respectability from which it grew.

```checkpoint
q: What did Thomas Dixon argue in *From Passions to Emotions* (2003)?
a*: That "emotions" as a single psychological category is modern, absorbing older terms such as passions and sentiments in English writing by about 1850.
a: That emotions are identical in every culture and period.
x: Dixon's argument was historical: it traced how a category of thought changed.
a: That Descartes coined the word "emotion" in 1649.
x: Descartes wrote of "passions"; Dixon's story centres on the early nineteenth century and Thomas Brown.
a: That the stiff upper lip dates back to the Middle Ages.
x: His later book *Weeping Britannia* dates it to the late Victorian and imperial age.
hint: Think about the words people used before "emotion".
why: Dixon showed that even the field's central term has a history, though one critic calls Brown's change largely terminological.
---
q: How did Mencius treat moral feeling?
a: As a dangerous force that reason must suppress.
x: Mencius saw feelings such as commiseration as the starting point of virtue.
a: As something to be escaped entirely.
x: It was Daoist teaching, in the *Zhuangzi*, that aimed at freedom from *qing*.
a*: As the root of virtue: reactions such as alarm at a child about to fall into a well are the "four beginnings" of humanity, righteousness, propriety and wisdom.
a: As proof that human nature is bad.
x: That was Xunzi's view, which Mencius opposed.
hint: Remember the child and the well.
why: Mencius offers a theory in which emotion and morality are allies, not opposites.
```

## The Historian's Toolkit

From the 1980s historians built concepts to make feeling researchable. **Peter and Carol Stearns** introduced **emotionology** in 1985: the standards by which a society judges emotions, and the institutions that promote them, as distinct from emotional experience itself. They read prescriptive sources such as advice manuals, and went on to write a history of anger in America.

**William Reddy** of Duke University, in a 1997 article titled "Against Constructionism" and in *The Navigation of Feeling* (2001), introduced the **emotive**. Modelled on J. L. Austin's performative speech acts, an emotive is an emotional statement that both describes and changes the speaker's feeling: saying "I am angry" or "I love you" helps make, intensify or hide the feeling. An **emotional regime** is the set of required emotions with the rituals and emotives that teach them. Strict regimes cause "emotional suffering"; people seek "emotional refuges"; and Reddy proposed "emotional liberty" as a standard for judging regimes. In his France of about 1700–1850, court honour codes formed a strict regime and salons a refuge; a "sentimentalist" regime prizing sincerity fed the Revolution, whose demands for visible love of the fatherland and hatred of its enemies spiralled into suspicion and the Terror. Reddy later compared Europe, South Asia and Japan in *The Making of Romantic Love* (2012).

**Barbara Rosenwein** answered with **emotional communities** (2002; book 2006): groups such as monasteries, courts, families and political circles that share norms about which emotions to value and how to express them. Several coexist in any society, overlapping and competing; where Reddy's regimes work from the top down, Rosenwein stresses plurality. **Monique Scheer** proposed in 2012 that emotions are **practices**, embodied habits, drawing on Bourdieu's idea of habitus. Katie Barclay's 2021 survey named communities, regimes, styles and practices as the field's main concepts.

Institutions followed. Ute Frevert became director of the Center for the History of Emotions at Berlin's Max Planck Institute for Human Development in January 2008; Queen Mary in London opened the first British centre that November; and in 2011 the Australian Research Council founded a Centre of Excellence for the History of Emotions, based in Perth and funded with about A\$24 million, then the largest humanities award in Australian history. **Jan Plamper** (1970–2023) wrote the standard survey (German 2012, English 2015). Since the 2010s some historians have also used computer-assisted "sentiment mining" of digitised texts.

## Honour, Shame and Humiliation

Shame has long been used to sort societies. Ruth Benedict's *The Chrysanthemum and the Sword* (1946) popularised a contrast between American "guilt cultures" and a Japanese "shame culture". *Honour and Shame* (1965), edited by J. G. Peristiany, made those values the key to the Mediterranean; in 1980 Michael Herzfeld led the critique of treating that region as one culture area, and Benedict's contrast is now widely seen as reductive.

Historians prefer to study honour as an institution that changes. Reddy's *The Invisible Code* (1997) followed honour and sentiment in France between 1814 and 1848. Frevert, after a history of the duel, distinguished in *The Politics of Humiliation* (2020) between public shaming, which peaked in early modern Europe with state-decreed pillories, beatings and branding, and modern humiliation. Liberal states largely abolished official shaming, she argued, but humiliation persists, not least in international politics.

## Diagnoses of Feeling: Nostalgia, Melancholy, Shell Shock

Some emotions began as illnesses. **Nostalgia** was coined in 1688 by Johannes Hofer in a Basel medical dissertation, from Greek *nostos* (return home) and *algos* (pain), for the homesickness of Swiss mercenaries. It was still diagnosed among soldiers in the American Civil War, but by the 1870s medical interest had almost vanished. **Melancholy**, from the Greek for "black bile", was treated by Hippocrates as a disease of excess black bile; the tenth-century Persian physician Al-Akhawayni Bukhari described it as a chronic illness of black bile acting on the brain, and Robert Burton's *The Anatomy of Melancholy* (1621) made it both a medical and a literary condition.

**Shell shock** was first named in print by Charles Myers in *The Lancet* on 13 February 1915. In 1917 the British Army banned it as a diagnosis, and a War Office committee reported on it in 1922. Of 3,080 British death sentences passed by courts martial in the war, 346 were carried out, 268 for desertion and 18 for cowardice; in 2006, 306 of them, those shot for desertion, cowardice and similar offences, received a posthumous pardon; those shot for murder were excluded. Sassoon and Owen were patients at Craiglockhart War Hospital. The chapter on The First World War (WW1) tells the wider story of that war.

## Reading Feeling Elsewhere: Anthropology and Colonial India

Anthropologists posed the sharpest challenge to fixed emotions. Catherine Lutz's *Unnatural Emotions* (1988), on the Micronesian atoll of **Ifaluk**, described *fago*, combining compassion, love and sadness, and *song*, a "justifiable anger" at wrongdoing, associated with clan chiefs and flowing down the hierarchy: anger as a moral, pro-social feeling, not an outburst to be tamed.

In northern Luzon, Michelle and Renato Rosaldo worked among the **Ilongot** (Bugkalot). Michelle Rosaldo's *Knowledge and Passion* (1980) studied Ilongot ideas of self, including a valued anger-like force; she died in a fall during fieldwork in 1981. In "Grief and a Headhunter's Rage" (1984), Renato Rosaldo reported an older man's explanation that rage born of grief drove headhunting, and admitted he could not grasp it until his own bereavement.

In *Emotions and Modernity in Colonial India* (2019), Margrit Pernau used Urdu sources from 1857 to 1914 to trace a shift from an ideal of balance to the valuing of intense, untameable passion as a sign of a community's vitality, treating Urdu writers as authors of their own emotional theories.

## Feeling for Pay: Emotional Labour

Modern capitalism made feeling into work. In 1979 the sociologist **Arlie Russell Hochschild** introduced "feeling rules", shared standards for how one ought to feel, and in *The Managed Heart* (1983) coined **emotional labour**. She studied flight attendants, trained to stay cheerful and calm passengers' fears while suppressing their own, and bill collectors, trained to suspect debtors; at Delta's training centre, she recalled, trainees were urged to make their smiles sincere. She distinguished "surface acting", showing a feeling one lacks, from "deep acting", changing one's feelings to fit, and found the burden fell disproportionately on women. Her later work followed Filipina nannies caring for American children in a "global care chain", and she has warned of "concept creep" as the term spread.

## Universal Faces? Darwin, Ekman and Their Critics

**Charles Darwin**'s *The Expression of the Emotions in Man and Animals* (1872), drawing on a questionnaire sent through missionaries, merchants and travellers, argued that expressions evolved and are shared with animals: "The young and the old of widely different races, both with man and animals, express the same state of mind by the same movements."

{{image: The Expression of the Emotions in Man and Animals | The title page of Darwin's *The Expression of the Emotions in Man and Animals* (1872).}}

Against the 1950s anthropological view, held by Margaret Mead among others, that expressions are learned, **Paul Ekman** (1934–2025) and Wallace Friesen reported in 1971 that the Fore of Papua New Guinea recognised the same facial expressions, and Ekman named six basic emotions: anger, disgust, fear, happiness, sadness and surprise. Critics called his method circular, since people matched posed photographs to preset labels. A 2019 review by Lisa Feldman Barrett and colleagues of more than 1,000 studies concluded that facial movements are not universally diagnostic of emotions; in Barrett's summary, people scowl when angry about 25 per cent of the time. Ekman's defenders still point to cross-cultural recognition data.

## The Neuroscience Turn

**Joseph LeDoux**'s *The Emotional Brain* (1996), built on fear conditioning in rats, described a quick "low road" to the amygdala and a slower cortical "high road"; Daniel Goleman, drawing on LeDoux's research, had already popularised the idea in 1995 as the "amygdala hijack". LeDoux later rejected the label "fear circuits": they are **survival circuits** for detecting and responding to threat, while conscious fear is constructed by the cortex. "I'm not studying emotion," he said in 2018. "I'm studying the function of survival circuits."

**Antonio Damasio**'s *Descartes' Error* (1994) used the case of Phineas Gage (1848) and modern patients with frontal damage to argue that reasoning needs emotional signals from the body; Descartes's split of mind from body was the "error". **Barrett**'s theory of **constructed emotion**, set out in *How Emotions Are Made* (2017), holds that emotions are not hard-wired circuits but are built in the moment by the whole brain from bodily sensation, culturally learned concepts and social reality, as a continuous spectrum of light is sorted into colour categories that vary between cultures.

```quote
In every waking moment, your brain uses past experience, organized as concepts, to guide your actions and give your sensations meaning. When the concepts involved are emotion concepts, your brain constructs instances of emotion.
Lisa Feldman Barrett · How Emotions Are Made · 2017
```

Brain imaging has clear limits. A 2012 meta-analysis by Lindquist, Barrett and colleagues found "little evidence that discrete emotion categories can be consistently and specifically localized to distinct brain regions"; even the amygdala, long tied to fear, proved not to be specific to it. Constructionist neuroscience thus meets the historians' claim that feelings are learned. Rob Boddice frames the field as a "biocultural" history, while Reddy's emotives, offered "against constructionism", remain a middle path: a universal capacity for feeling, whose expression and political management history shapes.

```checkpoint
q: What did Reddy mean by an "emotive"?
a: A brain circuit dedicated to one emotion.
x: Reddy's concept concerns language and society, not neural circuits.
a*: An emotional statement, modelled on performative speech acts, that both describes and changes the speaker's feeling.
a: A society's standards for judging emotions.
x: That describes the Stearnses' "emotionology".
a: A group sharing norms about which feelings to value.
x: That describes Rosenwein's "emotional communities".
hint: Think of what saying "I love you" does.
why: Emotives let Reddy explain how feelings are shaped under social pressure, and how a regime like that of the French Revolution could cause suffering.
---
q: What did Joseph LeDoux come to argue about the circuits he had studied?
a: That they prove fear is identical in rats and humans.
x: LeDoux separated threat detection from conscious fear, which he said the cortex constructs.
a: That the amygdala is active only in fear.
x: The 2012 meta-analysis found that even the amygdala was not specific to fear.
a: That emotions have nothing to do with the brain.
x: LeDoux is a neuroscientist; his revision concerned which brain processes count as emotion.
a*: That they are "survival circuits" for detecting and responding to threat, not "fear circuits", and that conscious fear is constructed by the cortex.
hint: He said he was not studying emotion.
why: LeDoux's revision narrows what neuroscience can claim and leaves room for the cultural shaping of conscious feeling that historians study.
```

## Further exploration

- **Jan Plamper, *The History of Emotions: An Introduction* (2015).** The standard survey of the field, from Febvre to neuroscience.
- **William M. Reddy, *The Navigation of Feeling: A Framework for the History of Emotions* (2001).** Emotives and emotional regimes, tested on the French Revolution.
- **Thomas Dixon, *Weeping Britannia: Portrait of a Nation in Tears* (2015).** A readable history that dismantles the "timeless" stiff upper lip.
- **Margrit Pernau, *Emotions and Modernity in Colonial India: From Balance to Fervor* (2019).** Emotion and community through Urdu sources.
- **Catherine Lutz, *Unnatural Emotions: Everyday Sentiments on a Micronesian Atoll and Their Challenge to Western Theory* (1988).** The anthropology of feeling on Ifaluk.
- **Arlie Russell Hochschild, *The Managed Heart: Commercialization of Human Feeling* (1983).** The founding study of emotional labour.
- **Lisa Feldman Barrett, *How Emotions Are Made: The Secret Life of the Brain* (2017).** The constructionist case from neuroscience.$mn_emotions_master$,
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
  select $mn_emotions_quiz$[
    {"type": "mcq", "prompt": "Which concept did Arlie Russell Hochschild coin in The Managed Heart (1983)?", "options": ["Emotional labour", "Emotionology", "Emotional communities", "The emotive"], "answerIndex": 0, "explanation": "Studying flight attendants and bill collectors, Hochschild described how workers are paid to manage their own and others' feelings, distinguishing surface acting from deep acting.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Natyashastra's theory of rasa describe?", "options": ["The four beginnings of virtue", "The aesthetic relish of emotion evoked in an audience from underlying states (bhava)", "Dependence on another's indulgent goodwill", "A disease of excess black bile"], "answerIndex": 1, "explanation": "Its sixth chapter names eight rasas, from love and mirth to terror and wonder; a ninth, peace, was added later.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the 2019 review by Barrett and colleagues of more than 1,000 studies conclude?", "options": ["That six basic facial expressions are recognised everywhere", "That each emotion has its own brain region", "That facial movements are not universally diagnostic of emotions", "That Darwin's questionnaire was fraudulent"], "answerIndex": 2, "explanation": "In Barrett's summary, people scowl when angry only about 25 per cent of the time.", "id": "q3"},
    {"type": "mcq", "prompt": "What was nostalgia when Johannes Hofer coined the word in 1688?", "options": ["A literary genre", "A Persian theory of love", "A term for shell shock", "A medical diagnosis for the homesickness of Swiss mercenaries"], "answerIndex": 3, "explanation": "It was still diagnosed among soldiers in the American Civil War, but medical interest had almost vanished by the 1870s.", "id": "q4"},
    {"type": "open", "prompt": "Compare Reddy's 'emotional regimes' with Rosenwein's 'emotional communities'. What does each help a historian see?", "rubric": "A strong answer defines emotives (performative emotional statements) and regimes (normative emotions with rituals and emotives), mentions emotional suffering, refuges and liberty, and uses Reddy's France c. 1700–1850 and the Terror; it defines emotional communities as plural, overlapping groups sharing emotional norms, contrasts top-down regimes with horizontal plurality, and may mention Rosenwein's critique of Elias's 'grand narrative' and 'hydraulic' model, Stearns's emotionology or Scheer's practices.", "id": "q5"},
    {"type": "open", "prompt": "Are emotions universal or made? Assess the debate using both historical and scientific evidence.", "rubric": "A strong answer sets Darwin (1872) and Ekman's six basic emotions and Fore studies against Mead, Lutz on Ifaluk (fago, song) and the Rosaldos on the Ilongot; uses Barrett's constructed emotion, the 2019 review and the 2012 meta-analysis, and LeDoux's shift to 'survival circuits'; draws on historical cases such as Dixon on the category 'emotion' and the stiff upper lip, or non-Western theories (rasa, Mencius); and may present Reddy's middle path or Boddice's 'biocultural' history.", "id": "q6"}
  ]$mn_emotions_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/histories-of-emotions-from-the-rational-self-to-modern-neuroscience', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
