-- Intellectual History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/intellectual-history @ research/advanced/read.
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
    'history/thematic-history/intellectual-history',
    'research',
    'advanced',
    'read',
    $mn_intellhist_master$> **How people in the past thought, and why.** Intellectual history studies ideas not as free-floating truths but as things made and used by particular people in particular places. This chapter follows how the field's methods developed: Arthur Lovejoy's "history of ideas", the Cambridge School's insistence that texts are actions in a debate, the German history of concepts, Michel Foucault's archaeology of knowledge, and the history of books and reading. It then shows how the work is done, through worked examples: the strange career of John Locke's *Two Treatises*, the travels of Ibn Khaldun's *Muqaddimah*, and the translation of "liberty" and "civilization" in Meiji Japan, late Qing China and the Arabic Nahda. It ends with the field's open quarrels, over context and the present, ideas and material forces, and who counts as a thinker at all.

## What Intellectual History Studies

Intellectual history, or the history of ideas, studies the history of human thought and of the people who produced it. Its starting premise is that ideas do not develop in isolation from those who conceive and use them, so an idea must be studied twice over: as an argument and as something that happened in a concrete setting of culture, life and history. The field grew out of the history of philosophy and out of German cultural history (*Kulturgeschichte* and *Geistesgeschichte*), and in turn gave rise to the history of the book and of reading. Over the twentieth century the older label "history of ideas" gradually gave way to "intellectual history", a change of name that reflected a change of method towards reading ideas in their contexts.

The Harvard historian Peter E. Gordon finds intellectual historians more relaxed than philosophers about crossing the line between philosophical texts and their non-philosophical contexts; where that line falls is itself historical. Nor is the field only about professional thinkers. The idea of "the intellectual" as a public figure dates only from the nineteenth century, and anyone who set down their thoughts can be the subject of intellectual history. The most famous demonstration is Carlo Ginzburg's *The Cheese and the Worms* (1976), which reconstructs the cosmology of Menocchio, a sixteenth-century miller of Friuli in northern Italy, from the records of his trials before the Inquisition, which ended with his burning as a heresiarch. It has been called probably the most widely read work of microhistory.

## Lovejoy and the History of Ideas

The field's founding classic was written by the American philosopher **Arthur O. Lovejoy** (1873–1962), who taught at Johns Hopkins from 1910 until the late 1930s and founded its History of Ideas Club. In 1940 he co-founded the *Journal of the History of Ideas* with Philip P. Wiener.

Lovejoy's method rested on what he called "unit-ideas". Big "-isms" such as idealism or rationalism, he argued, are compounds of separate ideas, which the historian must take apart and then follow as they combine and recombine over centuries. His *The Great Chain of Being* (1936), which grew out of the William James Lectures he gave at Harvard in 1933, traced three such principles, plenitude, continuity and gradation, from Plato, Aristotle and the Neoplatonists into a picture of the universe as a single ladder running from God through angels, humans, animals and plants down to minerals. That chain, Lovejoy argued, was "temporalized" and undone in the course of the eighteenth century. A 1981 collection edited by the Finnish philosopher Simo Knuuttila called it probably the single most influential work in the history of ideas in the United States during the previous half-century.

## The Cambridge School: Texts as Actions

From the late 1960s a loose group of historians of political thought, mostly associated with Cambridge, challenged this way of working. Its usual founding manifesto is **Quentin Skinner**'s long essay "Meaning and Understanding in the History of Ideas" (1969). Skinner attacked two orthodoxies. One was "perennialism", the belief that philosophers in every age have debated the same fundamental questions; against it, Skinner argued that each text answers the particular questions of its own time and place. The other was the belief that a text can be understood on its own, without its context. He dismissed Lovejoy's unit-ideas as a "reification of doctrines", and catalogued the "mythologies" of bad interpretation: the mythology of doctrines, which turns scattered remarks into a full doctrine on a theme the reader expects; of coherence; of prolepsis, which reads a work for a significance visible only later; and of parochialism.

Skinner drew on Wittgenstein and on the philosopher J. L. Austin, whose lectures published as *How to Do Things with Words* (1962) introduced the "performative utterance": words can do things as well as describe them. A text, on this view, is an intervention in a live debate, and the historian's question is what its author was *doing* in writing it: supporting, discrediting, legitimising. Answering that means reading the lesser-known pamphlets and treatises around a great work, not just the canon. Emphases differed. **J. G. A. Pocock** (1924–2023), raised in New Zealand, studied political "languages", which he described as idioms, rhetorics, specialised vocabularies and grammars, and warned against translating the Greek *polis*, the Latin *civitas*, the Chinese *kuo* and the Florentine *stato* all as "state". **John Dunn** emphasised biography.

The method's classic test case was Machiavelli. As the chapter on the Renaissance describes, *The Prince* was written in 1513 in the form of a traditional "mirror for princes". As early as 1938 Allan H. Gilbert showed that its closing exhortation was a normal feature of that genre, the kind of contextual reading the Cambridge School would generalise. Leo Strauss, in *Thoughts on Machiavelli* (1958), argued that even if Machiavelli was a patriot or a scientist, he was still a teacher of evil. Skinner's early method was widely read as a challenge to Strauss and his followers, among others. In *The Foundations of Modern Political Thought* (1978), Skinner placed Machiavelli in Florentine humanist debate, while Pocock's *The Machiavellian Moment* (1975), whose title Skinner suggested, followed a republican language from Florence through James Harrington's *Oceana* (1656) to the American Revolution.

## Worked Example: Locke's *Two Treatises*

John Locke's *Two Treatises of Government* shows what context can do. The book appeared anonymously in December 1689, though its title page is dated 1690, after the Glorious Revolution, and for generations it was read as a defence of that revolution. The First Treatise attacks Sir Robert Filmer's *Patriarcha*.

In his critical edition of 1960, the historian **Peter Laslett**, who had tracked down much of Locke's own library, showed that the bulk of the text was written earlier, during the Exclusion Crisis of 1679–81, and was revised later. In Laslett's words, "*Two Treatises* is an Exclusion Tract, not a Revolution Pamphlet". The meaning of the work shifts with its date: it belongs to the crisis of 1679–81, not to the aftermath of 1688.

Reception history tells a second surprising story. Of around 200 tracts debating the Revolution's legitimacy in 1689–94, only three mentioned Locke. The French translation of 1691 left out the First Treatise altogether, and that shortened Locke was the one read by Montesquieu, Voltaire and Rousseau. The work was not widely read until the 1760s. Then John Dunn's *The Political Thought of John Locke* (1969) argued that Locke's politics rested on duties owed to the Creator, so that liberal and Marxist readers who claimed him as an ancestor had missed his meaning; that theological universe, Dunn later said, has been lost to a secular age. Where Locke's ideas then went, and how far they shaped American revolutionaries, is a separate debate, followed in the chapter on the American Revolution, and the chapter on the Enlightenment places him among his contemporaries.

{{image: Two Treatises of Government | Title page of John Locke's Two Treatises of Government, dated 1690 although the book appeared in December 1689.}}

```checkpoint
q: What did Peter Laslett's 1960 edition show about Locke's *Two Treatises*?
a*: That most of it was written during the Exclusion Crisis of 1679–81 and revised later, so it was an opposition tract rather than a defence of the 1688 revolution.
a: That Locke wrote it in 1689 to justify the accession of William and Mary.
x: That was the older reading Laslett overturned; he dated the bulk of the writing to a decade earlier.
a: That it was immediately cited by most writers defending the Glorious Revolution.
x: Only three of around 200 tracts on the Revolution in 1689–94 mentioned Locke.
a: That Locke's First Treatise was written in reply to Thomas Hobbes.
x: The First Treatise attacks Sir Robert Filmer's *Patriarcha*.
hint: Think of the difference between an "Exclusion Tract" and a "Revolution Pamphlet".
why: Redating a text changes what its author was doing, which is the Cambridge School's central question.
---
q: What was Quentin Skinner's main objection to Lovejoy's "unit-ideas"?
a: That they paid too much attention to the lives of authors.
x: Lovejoy's method followed ideas across centuries, largely detached from authors' lives.
a: That they ignored ancient Greek philosophy.
x: Lovejoy traced the chain of being back to Plato and Aristotle.
a*: That they treated doctrines as timeless things, instead of reading texts as moves in the particular debates of their own time.
a: That they relied too heavily on economic history.
x: Neither Lovejoy nor Skinner's critique of him turned on economics.
hint: Skinner called this a "reification of doctrines".
why: For Skinner a text is an act in a historical debate, so it cannot be understood apart from that debate.
```

## Concepts, Epistemes and Genealogies

A rival approach grew up in Germany. Conceptual history, *Begriffsgeschichte*, studies the changing meanings of key terms such as "liberty" or "reform". Its central figure was **Reinhart Koselleck** (1923–2006). With Otto Brunner and Werner Conze he edited the great lexicon *Geschichtliche Grundbegriffe* ("Basic Historical Concepts"), published in eight volumes between 1972 and 1997. Its leading hypothesis was the *Sattelzeit*, or "saddle time", roughly 1750 to 1850, when German political and social vocabulary turned into the language of modernity. In *Futures Past* (German 1979) Koselleck proposed that modern times are marked by a widening gap between the "space of experience" and the "horizon of expectation": people stopped expecting the future to resemble the past. In English, Raymond Williams's *Keywords* (1976) traced over a hundred words such as "culture", which originally meant husbandry, the tending of natural growth.

Where Skinner looked at single speech acts in the short run, Koselleck followed concepts across a century. Pocock accepted that the *Sattelzeit* showed concepts inside an ongoing history of debate, but insisted that conceptual history, the history of ideas and the history of discourses can be "confronted, compared, and combined, but not homogenized".

**Michel Foucault** (1926–1984) challenged the history of ideas more radically. *The Order of Things* (1966) argued that each period has an *episteme*, a set of underlying rules deciding what can be thought and said to be true, and *The Archaeology of Knowledge* (1969) attacked the history of ideas' reliance on smooth narrative continuity, stressing ruptures and "discursive formations" instead. Later, borrowing Nietzsche's term "genealogy", Foucault set out not to find the origins of things but to show the contingent, power-laden pasts of practices that seem to have no history at all, from prisons to sexuality; the chapter on the Victorian Era discusses his attack on the "repressive hypothesis".

## Books, Readers and the Communications Circuit

The history of the book became an academic discipline in the later twentieth century, fostered by Lucien Febvre and Henri-Jean Martin's *L'apparition du livre* (1958; in English *The Coming of the Book*, 1976). One of its leading pioneers, **Robert Darnton**, studied who produced, sold and read the books of the French Enlightenment. In "What Is the History of Books?" (1982) he proposed a "communications circuit" linking the production, distribution and reception of books, a loop that the reader completes by in turn influencing authors.

Darnton's most famous essay starts from a joke that no longer seems funny. In the late 1730s apprentice printers in Jacques Vincent's shop in Paris held mock trials and killed cats, including their mistress's favourite; their only chronicler, a worker writing years later, remembered it as hilarious. Darnton, influenced by the anthropologist Clifford Geertz, read the massacre as a symbolic workers' protest. Critics objected: Roger Chartier debated his methods, the historian Dominick LaCapra mocked a "Great Symbol Massacre", and Harold Mah argued that Darnton had suppressed the nature of his single source. **Chartier** himself put the stress on "appropriation", the ways readers make texts their own, shaped by their skills, their communities and the physical format of what they read.

## Going Global

More recently, many intellectual historians have argued that the field had been too European. Samuel Moyn and Andrew Sartori's collection *Global Intellectual History* (2013) set out the programme, and a journal of the same name followed in 2016. Christopher Goto-Jones charged that the Cambridge School had developed in an orientalist direction by neglecting non-Western thought, and Dag Herbjørnsrud warned that strict contextualism could close off comparison between cultures.

```quote
the Skinner perspective is in danger of shutting the door to comparative philosophy, and the search for common problems and solutions across borders and time
Dag Herbjørnsrud · Global Intellectual History · 2019
```

Pocock and Dunn themselves came to call for a global history of political thought. The new work takes several forms. Sartori's *Bengal in Global Concept History* (2008) follows "culture" from eighteenth-century Germany through England to Bengal, arguing that global capitalism drove its spread. C. A. Bayly's *Recovering Liberties* (2012) traces Indian liberalism from Rammohan Roy in the 1820s to G. K. Gokhale in the 1900s, showing Mill, Comte, Spencer and Marx being reworked by Indian thinkers. Sheldon Pollock's *The Language of the Gods in the World of Men* (2006) reconstructs a "Sanskrit cosmopolis" from Afghanistan to Java, in which, by the fifth century, "power in India now had a Sanskrit voice", until regional languages displaced it in a "vernacular millennium".

## Worked Example: The Travels of the *Muqaddimah*

Ibn Khaldun drafted the *Muqaddimah* in 1377 as the introduction to his universal history, proposing a new science of *'umran*, civilisation or society, and the concept of *'asabiyya*, group solidarity, to explain the rise and fall of dynasties; the chapter What is History? describes his critical method. Its afterlife is a model of reception history. Ottoman historians such as Kâtip Çelebi and Mustafa Naima valued it; Pirizade Mehmed (d. 1749) translated the first five chapters into Ottoman Turkish, and Ahmed Cevdet the sixth, with a complete translation published in 1860/61. It was first printed at Bulaq in Cairo in 1857, with the support of Rifa'a al-Tahtawi; Quatremère's Arabic edition followed in Paris in 1858, de Slane's French translation in 1863, and Franz Rosenthal's English translation in 1958. The historian Abdelmajid Hannoum argues that de Slane, in his earlier translation of Ibn Khaldun's history of the Berbers (*Histoire des Berbères*, 1852–56), read a colonial, "racial" opposition between Arabs and Berbers into the text. Ibn Khaldun himself knew how much is lost in transmission.

```quote
There have been numerous sages among the nations of mankind. The knowledge that has not come down to us is larger than the knowledge that has.
Ibn Khaldun · Muqaddimah (1377), trans. Franz Rosenthal (1958)
```

## Worked Example: Translating Liberty and Civilization

When concepts cross languages, translators must choose words, and the choices are themselves arguments. In Japan, **Fukuzawa Yukichi** (1835–1901), whose *Seiyō Jijō* (*Conditions in the West*, from 1866) sold some 250,000 copies counting pirated editions, became a leading voice of *bunmei kaika*, "civilization and enlightenment". His notion of civilization was first shaped by American geography textbooks that ranked peoples on a ladder of stages, and his *Outline of a Theory of Civilization* (1875) drew on the French historian François Guizot. Yet its final chapter put national independence ahead of civilization as an abstract ideal, and an unsigned 1885 editorial usually attributed to him, "Datsu-A Ron" ("Leaving Asia"), urged Japan to distance itself from "backward" neighbours, as the chapter on Nationalism and the Making of Nation-States notes. In 1872 Nakamura Masanao translated John Stuart Mill's *On Liberty* as *Jiyū no kotowari*, and "liberty" (*jiyū*) quickly became a central term of debate in the 1870s; the chapter on the Meiji Restoration gives the political setting.

In China, **Yan Fu** (1854–1921), who had studied at the Royal Naval College at Greenwich, began translating Western works after China's defeat by Japan in 1894–95: Huxley, Adam Smith, Spencer, and Mill, introducing natural selection and Social Darwinism to Chinese readers. His version of *On Liberty* (1903) was titled *Qunji quanjie lun*, "On the boundary between the self and the group", recasting Mill's individual liberty as a line drawn between the individual and the collective.

```quote
There are three difficulties in translation: faithfulness, expressiveness, and elegance.
Yan Fu · preface to his translation of Huxley's Evolution and Ethics · 1898
```

Lydia H. Liu's *Translingual Practice* (1995) studied how new words and meanings arose in Chinese through contact with European languages and Japanese, among them "return graphic loans": classical Chinese terms reimported through their Japanese usage. Even "religion" had to be made, as the titles of Tomoko Masuzawa's *The Invention of World Religions* (2005) and Jason Ananda Josephson's *The Invention of Religion in Japan* (2012) suggest.

The Arabic **Nahda**, or "awakening", offers a parallel, followed in the chapter on the Making of the Modern Middle East. Rifa'a al-Tahtawi went to Paris in 1826 as imam to Muhammad Ali's student mission, published his account of Paris, *Takhlis al-Ibriz fi Talkhis Bariz*, in 1834 and founded a School of Languages for translators in Cairo in 1835. In Beirut, Butrus al-Bustani founded a secular National School in 1863 and created the first modern Arabic encyclopedia, while Ahmad Faris al-Shidyaq's *Leg Over Leg* (1855) defended women's rights. Older scholarship explained the Nahda as a response to the shock of Napoleon's invasion of 1798; more recent work sees it as much homegrown as Western-inspired. In Latin America, too, imported ideas were remade: Brazil's republic of 1889 put an adaptation of Auguste Comte's positivist maxim, "Ordem e Progresso", on its flag, and José Carlos Mariátegui called in 1928 for a Peruvian socialism made "without tracing or copying".

## Other Traditions, and the Uses of the Enlightenment

In Qing China, scholars of *kaozheng*, "evidential research", from Gu Yanwu (1613–1682) to Dai Zhen (1724–1777), turned textual-critical methods on the classics, as the chapter on the Enlightenment describes. Its interpreters disagree: Benjamin Elman called it "an empirical revolution", Yu Ying-shih stressed continuity with neo-Confucianism, and Carsun Chang and Xu Fuguan saw it as sterile. The Timbuktu manuscripts, discussed in the chapter on Ghana, Mali, and the Trans-Saharan World, preserve centuries of writing on law, theology, astronomy and debates over moneylending and slavery; *The Meanings of Timbuktu* (2008), edited by Shamil Jeppie and Souleymane Bachir Diagne, challenges the idea that African history survived only orally.

The Enlightenment itself is a contested inheritance. Koselleck's *Critique and Crisis* (1959) blamed its utopian moral critique of the absolutist state for a modern "permanent crisis", while Jürgen Habermas, in *The Structural Transformation of the Public Sphere* (1962), held up its salons, coffeehouses and print as a model of reasoned public debate. Pocock wrote of "Enlightenments" in the plural. And Liang Qichao and Hu Shih claimed *kaozheng* as China's own scientific tradition, finding, or making, an Enlightenment in a non-European past.

```checkpoint
q: Why is Yan Fu's title for Mill's *On Liberty*, "On the boundary between the self and the group", significant for intellectual historians?
a: Because it shows that Yan Fu misunderstood English.
x: Yan Fu had studied in Britain; the point is the choice of framing, not a failure of language.
a*: Because the translation recast Mill's individual liberty as a boundary between individual and collective, showing that translating a concept also reshapes it.
a: Because it was the first Western book ever translated into Chinese.
x: Yan Fu had already translated Huxley's *Evolution and Ethics* in 1898.
a: Because Mill himself chose the Chinese title.
x: The title was Yan Fu's own choice as translator.
hint: Think of what happens to a concept when it crosses languages.
why: Translation is interpretation, so the words chosen are evidence of what a concept meant to its new readers.
---
q: What does Abdelmajid Hannoum argue about de Slane's colonial-era translation of Ibn Khaldun's history of the Berbers?
a: That it was the first printed edition of the text.
x: The text was first printed at Bulaq, Cairo, in 1857.
a: That it was translated from an Ottoman Turkish version.
x: Hannoum's argument concerns how de Slane interpreted the text, not his source.
a: That it was suppressed by the French government.
x: Hannoum's argument concerns interpretation, not censorship.
a*: That de Slane read a colonial, "racial" opposition between Arabs and Berbers into the text.
hint: Think of the word "colonial".
why: Reception history shows that each translation carries its translator's world into the text.
```

## The Field's Quarrels

**Contextualism against presentism.** The Cambridge School rejects reading old texts as answers to our own questions, the danger of anachronism that the chapter What is History? discusses. Followers of Strauss, and perennialists generally, reply that great texts address permanent questions. Contextualists have doubts too: Pocock conceded that they are better at the short-run picture than at long-run change, and Bernard Bailyn, in a 1995 lecture, criticised over-strict contextualism.

**Ideas against material forces.** Social historians criticised the Cambridge School for its focus on ideas. Mark Bevir has described Skinner and his colleagues as defending the history of political thought on two fronts, against reductionists who dismissed ideas as mere epiphenomena and against canonical theorists who treated texts as timeless. Sartori's capitalism-driven "culture" and Foucault's knowledge-as-power suggest that the real question is how ideas and material forces interact.

**Who counts.** Andreas Dorschel argued that ideas live in music and architecture as well as in words. Ginzburg's miller, Timbuktu's scholars, Pollock's Sanskrit cosmopolis, and the work of philosophers such as Souleymane Bachir Diagne, who has written on Negritude and on Muslim philosophers in conversation with the Western tradition, and Kwame Anthony Appiah all widen the canon. What historians choose to read decides whose thinking is remembered.

## Further exploration

- **Arthur O. Lovejoy, *The Great Chain of Being: A Study of the History of an Idea* (1936).** The founding classic of the history of ideas and the unit-idea method.
- **Quentin Skinner, *Visions of Politics, Volume 1: Regarding Method* (2002).** Skinner's methodological essays, including a revised "Meaning and Understanding".
- **Reinhart Koselleck, *Futures Past: On the Semantics of Historical Time* (German 1979; English 1985).** Conceptual history and the experience of historical time.
- **Robert Darnton, *The Great Cat Massacre and Other Episodes in French Cultural History* (1984).** Readable cultural and book history, and a famous case for debate.
- **Samuel Moyn and Andrew Sartori (eds), *Global Intellectual History* (2013).** The programmatic statement of the global turn.
- **C. A. Bayly, *Recovering Liberties: Indian Thought in the Age of Liberalism and Empire* (2012).** Liberalism remade in India from Rammohan Roy to Gokhale.
- **Sheldon Pollock, *The Language of the Gods in the World of Men: Sanskrit, Culture, and Power in Premodern India* (2006).** A non-European world of language and power as intellectual history.$mn_intellhist_master$,
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
  select $mn_intellhist_quiz$[
    {"type": "mcq", "prompt": "What did Arthur O. Lovejoy mean by 'unit-ideas'?", "options": ["The separate ideas that combine to form big '-isms', which the historian takes apart and follows as they recombine over time", "The single founding idea of each nation's culture", "Ideas that can be expressed only in one language", "The minimum number of ideas needed to make a philosophical system coherent"], "answerIndex": 0, "explanation": "Lovejoy held that '-isms' such as idealism or rationalism are compounds of analytically separate ideas; *The Great Chain of Being* (1936) traced plenitude, continuity and gradation from Plato onwards.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the first appearance and reception of Locke's *Two Treatises of Government* is supported by recent scholarship?", "options": ["It was published under Locke's name in 1688 and was at once the most cited defence of the Revolution", "Laslett showed it was written entirely after William and Mary took the throne", "It appeared anonymously in December 1689 (title page 1690), only three of around 200 tracts on the Revolution in 1689–94 mentioned Locke, and the 1691 French translation omitted the First Treatise", "It was first read in France in a complete translation including the attack on Filmer"], "answerIndex": 2, "explanation": "The book was anonymous; Laslett dated most of it to the Exclusion Crisis of 1679–81; early citations were rare; and Montesquieu, Voltaire and Rousseau read a French version without the First Treatise.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the *Sattelzeit* in Reinhart Koselleck's conceptual history?", "options": ["The period of the Thirty Years War, when German concepts were destroyed", "The threshold period of roughly 1750–1850 when German political and social vocabulary turned into the language of modernity", "The Nazi era, when political language was corrupted", "The age of the Reformation, when religious concepts were translated into German"], "answerIndex": 1, "explanation": "The 'saddle time' was the leading hypothesis of the lexicon *Geschichtliche Grundbegriffe* (1972–1997), edited by Brunner, Conze and Koselleck.", "id": "q3"},
    {"type": "mcq", "prompt": "Who first printed Ibn Khaldun's *Muqaddimah*, and where?", "options": ["Franz Rosenthal, in New York, in 1958", "De Slane, in Paris, in 1863", "The Ottoman historian Kâtip Çelebi, before his death in 1657", "The Bulaq press in Cairo, in 1857, with the support of Rifa'a al-Tahtawi"], "answerIndex": 3, "explanation": "Bulaq (1857) came first; Quatremère's Arabic edition followed in 1858, de Slane's French translation in 1863 and Rosenthal's English in 1958. Kâtip Çelebi valued the work, but its first printing came two centuries after him.", "id": "q4"},
    {"type": "open", "prompt": "Explain how the Cambridge School changed the study of political thought, using Machiavelli or Locke as an example, and outline one criticism of its approach.", "rubric": "A strong answer explains Skinner's 1969 essay (against perennialism and reading texts without context; unit-ideas as 'reification of doctrines'; the mythologies), the debt to Austin's speech acts (what an author was 'doing'), and Pocock's 'languages'; it applies this to Machiavelli (Gilbert on the mirror-for-princes genre; Strauss's 'teacher of evil' against Skinner's and Pocock's Florentine humanist and republican contexts) or Locke (Laslett's Exclusion Crisis dating; the thin early reception; Dunn's theological Locke). It notes at least one criticism: Strauss and perennialists; Goto-Jones on orientalist neglect; Herbjørnsrud on blocking comparison; Pocock's and Bailyn's doubts about long-run change; social historians on neglect of material forces.", "id": "q5"},
    {"type": "open", "prompt": "Using examples from Japan, China, the Arab world or India, discuss what happens to concepts such as 'liberty' and 'civilization' when they are translated across languages.", "rubric": "A strong answer uses examples such as Fukuzawa and bunmei kaika (American textbooks, Guizot, independence before civilization, 'Datsu-A Ron' as usually attributed), Nakamura's Jiyū no kotowari (1872), Yan Fu's 'boundary between the self and the group' title for On Liberty and his three difficulties of translation, Liu's 'return graphic loans', the invention of 'religion' (Masuzawa, Josephson), Tahtawi and the Nahda (1798 shock versus autogenetic reform), Bayly on Indian liberalism or Sartori on 'culture' in Bengal; it argues that translation reshapes concepts and that non-Western thinkers actively reworked them rather than passively receiving them.", "id": "q6"}
  ]$mn_intellhist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/intellectual-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
