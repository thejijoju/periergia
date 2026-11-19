-- Latin American Philosophy and the Philosophy of Liberation — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/latin-american-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/latin-american-philosophy',
    'research',
    'advanced',
    'read',
    $latinam_master$> **Philosophy in Latin America began with a quarrel about who counts as fully human, and for much of the twentieth century it argued about whether it existed at all.** This chapter covers Nahua thought before the Conquest and the caution the label "philosophy" needs; colonial scholasticism and the Valladolid debate of 1550–51; Guaman Poma, Garcilaso and Sor Juana; the revolt against positivism and Mariátegui's Marxism; Mexican existentialism; the Salazar Bondy–Zea debate on authenticity; Dussel's philosophy of liberation and Freire's pedagogy of the oppressed; and the decolonial and feminist thinkers who followed. Four arguments are set out step by step, with objections and replies.

## What Counts as Latin American Philosophy?

The *Stanford Encyclopedia of Philosophy* (SEP) defines Latin American philosophy as philosophy produced in Latin America, or by people of Latin American ancestry elsewhere. Even the name is awkward: the *Internet Encyclopedia of Philosophy* (IEP) notes that "Latin America" entered use only in the 1850s, so applying it to earlier centuries is anachronistic. The SEP judges the tradition "both original and derivative", more concerned with social questions than philosophy in the United States, and little read outside the region. One question runs through it all. Whether there is a Latin American philosophy is, the SEP says, "perhaps the most discussed subject matter within Latin American philosophy".

## Before the Conquest: Nahua Thought

The tradition is usually dated from about 1550, when Spaniards founded the first schools. Recent historians want to include earlier thought, though, as the SEP warns, the surviving texts "are often fragmentary and religious in tone", and most codices were burned by missionaries who thought them idolatrous. Whether this thought counts as philosophy is disputed. Critics say the label retroactively attributes self-conscious critique where there was none; supporters say the Western concept of philosophy must itself be decentred.

The case for "yes" was made by the Mexican historian Miguel León-Portilla (1926–2019), whose dissertation *La filosofía náhuatl* (dated 1955 or 1956) appeared in English as *Aztec Thought and Culture* (1963). He argued that the Mexica "in fact did philosophy", drawing on the texts collected by the Franciscan Bernardino de Sahagún. Their sages were the *tlamatinime*, "knowers of things". The best known, Nezahualcóyotl (1402–1472), king of Tetzcoco, doubted the permanence of human life and found meaning in "flower and song", that is, in art.

James Maffie's *Aztec Philosophy* (2014) offers a fuller reconstruction. At its centre is *teotl*, a single, dynamic, self-generating sacred energy. In Maffie's formulation, not a Nahua quotation, teotl "is identical with everything and everything is identical with teotl". Reality is an endless oscillation of complementary opposites, such as life and death, in which neither side wins. The defining question was practical: how can humans keep their balance on the "slippery earth"? Truth was not correspondence to facts but rootedness; in León-Portilla's words, "'truth'… was to be identified with well-grounded stability". Maffie warns that these views belonged to an elite of priests and nobles, and that Western labels such as "metaphysics" are only heuristic.

For the Andes the sources are thinner. The Swiss philosopher-theologian Josef Estermann has proposed an Andean philosophy built around relationality and *pacha*, the ordered universe of space and time, and Silvia Rivera Cusicanqui draws on the Aymara idea of *ch'ixi*, the coexistence of opposites that do not fuse. As Dussel noted, however, colonial university philosophy took nothing from the Nahua or Inca sages.

## Scholastics in the New World

The University of San Marcos in Lima was established on 12 May 1551, and a royal decree of 21 September 1551 founded the Royal and Pontifical University of Mexico. Only scholasticism was approved, taught by religious orders: Franciscans followed Scotus, Dominicans Aquinas, and Jesuits were more open to modern thought (see *Scotus, Ockham and the Late Medieval Debates* and *Thomas Aquinas*). Alonso de la Vera Cruz (1507–1584), an Augustinian, wrote the first philosophical books printed in the Americas, including *Recognitio summularum* (1554). He argued that native peoples had not lost their lands by being pagans and that sovereignty ultimately belongs to the people.

Vera Cruz had studied at Salamanca under Francisco de Vitoria (c. 1483–1546), whose lecture *De Indis* (1539) asked whether the native peoples were true masters of their goods and affairs. Vitoria answered yes: neither sin, unbelief nor alleged irrationality took away their dominion, so neither pope nor emperor had a rightful claim to them. Yet the same lecture listed "just titles" for war, such as violating Spaniards' right to travel and preach. The SEP entry on colonialism, by Margaret Kohn and Kavita Reddy, comments that "within Victoria's critique… was a rationalization for conquest, albeit a restrictive one".

## The Valladolid Debate

The sharpest test came in 1550, when Charles V ordered further conquests halted until a *junta* of jurists and theologians, meeting at the Colegio de San Gregorio in Valladolid, judged their justice. Juan Ginés de Sepúlveda (1490–1573), a humanist translator of Aristotle who never visited America, read the conclusions of his *Democrates alter*. Bartolomé de las Casas (1484–1566), a former encomienda holder turned Dominican, Bishop of Chiapas and official "Protector of the Indians", read his Latin *Apologia*. The History chapter *The Conquest of the Americas* tells the story; here is the argument. Sepúlveda's case ran:

1. By their natural condition some Indians cannot govern themselves; they are natural slaves in Aristotle's sense, and should be ruled by Spaniards as children are ruled by parents.
2. Cannibalism is a crime against nature, which Spaniards may stop.
3. So is the sacrifice of innocent people.
4. Conversion to Christianity requires that the people first be pacified.
5. Therefore war against the Indians is just.

The first premise borrows Aristotle's definition of one who perceives reason but does not possess it (see *Aristotle*). Las Casas answered each point. Indians were fully capable of reason, with legitimate rulers and ordered societies; if any people were simple enough to be natural slaves, they could be found in Spain as easily as in America. Scripture sanctioned war only against certain Canaanite tribes, not all heathens. Augustine and Chrysostom opposed forcing faith, so peaceful persuasion is the only true way to convert. Human sacrifice is wrong, but war is worse: better that some weak Indians suffer from strong ones than that all suffer at Spanish hands. And neither Spain nor the Church has jurisdiction over those who have never accepted Christ.

**Objection.** Las Casas's position still assumed that evangelisation and the Crown's sovereignty were legitimate; he wanted peaceful conversion, not no conversion. **Reply.** Even so, Susana Nuccetelli treats his ethics as a counterexample to the claim that dependent cultures cannot think for themselves: it was "original, authentic, and peculiar, though developed under extreme cultural and economic dependence". In Mendieta's summary of Dussel, Valladolid marks "the clear emergence of a liberation discourse".

The outcome was inconclusive. The judges "scattered without any definite decision", and both sides claimed victory. Conquest resumed, and expansion was formally allowed again in 1556. One stain remains. In plans of 1516–18 Las Casas suggested replacing Indian labour with imported African slaves; he later regretted it and included an apology in his *Historia de las Indias*. How much this mattered is debated: John Fiske and Benjamin Keen argued that the trade was already in place, while Sylvia Wynter argued that his 1516 *Memorial* led directly to Charles V's 1518 licence for African slaves.

## Colonial Voices: Guaman Poma, Garcilaso and Sor Juana

Indigenous and mestizo writers answered in their own way. Felipe Guaman Poma de Ayala (born about 1535, or 1550 on another estimate; died after 1616), a Quechua noble, finished *El primer nueva corónica y buen gobierno* around 1615: nearly 1,200 pages with some 400 drawings, addressed to Philip III, and called "the longest sustained critique of Spanish colonial rule produced by an Indigenous subject" in the colonial period. It made, the IEP says, "a powerful case for maximum Indian autonomy"; Walter Mignolo treats him as an early decolonial thinker. The Inca Garcilaso de la Vega (1539–1616), son of a conquistador and an Inca princess, published his *Comentarios Reales de los Incas* in Lisbon in 1609.

{{image: Juana Inés de la Cruz | Sor Juana Inés de la Cruz, in a portrait by Miguel Cabrera painted around 1750, some fifty years after her death.}}

The outstanding philosopher of the colonial period was Sor Juana Inés de la Cruz, born in San Miguel Nepantla in 1648 or 1651, who died in Mexico City in 1695. She became a Hieronymite nun. In 1690 the Bishop of Puebla, writing as "Sor Filotea", published without her permission her critique of a sermon, with a letter urging her towards religious study. Her *Respuesta a Sor Filotea de la Cruz* (1691), introduced in *Women Philosophers of the Early Modern Era*, defends women's right to learn and older women's right to teach younger ones. In the IEP's summary it "defends rational equality between men and women" and treats wisdom as self-realisation. Knowledge, she insists, can be found even in the kitchen: "Si Aristóteles hubiera guisado, mucho más hubiera escrito", that is, had Aristotle done the cooking he would have written a great deal more. Her poem *Primero sueño* (published 1692), the soul's night journey towards knowledge, is in the words of the SEP's Hurtado and Sanchez "an original exercise in philosophy". The SEP calls her retrospectively "the first Latin American feminist writer and philosopher", while Hurtado and Sanchez allow that one might argue she "does not fully recognize the role of race, caste, or indigeneity".

Independence brought a new worry. From Simón Bolívar's Jamaica Letter (1815) onwards, the SEP notes, Latin American liberals feared that their ideas were "imported".

```checkpoint
q: Which reply did Las Casas give to Sepúlveda's claim that the Indians were Aristotle's natural slaves?
a*: The Indians were fully capable of reason, with legitimate rulers and ordered societies, and simple-minded people could be found in Spain as easily as in America.
a: He accepted the theory but said the Spanish Crown had no money to rule them.
x: Las Casas rejected the application of the theory; he did not argue from cost.
a: He argued that Aristotle's Politics had been mistranslated by Sepúlveda.
x: His reply concerned the facts about Indigenous societies, not the translation of Aristotle.
a: He agreed, but said natural slaves should be converted before they were conquered.
x: He denied that the Indians were natural slaves at all.
hint: Think about what Las Casas said of Indigenous rulers and societies.
why: Las Casas denied that the natural-slave category applied: the peoples of the Americas reasoned, ruled themselves and lived in ordered societies.
---
q: What did Sor Juana's Respuesta (1691) chiefly defend?
a: The right of nuns to leave their convents.
x: She remained a nun; the Respuesta concerns learning.
a: The Jesuit sermon she had earlier criticised.
x: She had criticised the sermon; the Respuesta defends her right to do such work.
a*: Women's right to learn and to teach other women.
a: The superiority of Indigenous knowledge to scholastic philosophy.
x: Hurtado and Sanchez allow that one might argue she did not fully recognise questions of race or indigeneity.
hint: Recall what "Sor Filotea" had urged her to do.
why: Replying to the bishop's letter, she defended women's learning and the rational equality of men and women, citing her own drive to know.
```

## The Revolt against Positivism

From the mid-nineteenth century to about 1910, positivism, Comte's philosophy of scientific progress, was the ideology of nation-building; it became the official state philosophy of several nations and, the SEP says, was used to justify dictatorship in Mexico. *Philosophy in an Age of Empire* tells that story, from Barreda and Brazil's "Order and Progress" to Martí, Rodó, the Ateneo de la Juventud and Vasconcelos's *La raza cósmica* (1925); see also *Latin America after Independence*.

What follows is the "generation of founders", born between 1849 and 1883: Alejandro Korn (1860–1936) in Argentina, Alejandro Deústua (1849–1945) in Peru, Carlos Vaz Ferreira (1872–1958) in Uruguay, Raimundo de Farias Brito (1862–1917) in Brazil, and Antonio Caso (1883–1946) and José Vasconcelos (1882–1959) in Mexico. Trained as positivists, they broke with it on one main ground: positivism implies determinism, and determinism leaves no room for human freedom. Vaz Ferreira's *Sobre feminismo* (1933) argued for a "compensatory feminism", in which institutions make up for women's supposed biological disadvantages. Caso's *La existencia como economía, como desinterés y como caridad* (1919) ranked three levels of existence, biological, aesthetic and charitable, with charity as the highest expression of human dignity. The SEP faults the founders for adopting borrowed anti-positivist solutions from Bergson and others "uncritically".

Vasconcelos's later life darkened his reputation. After losing a disputed presidential election in 1929, he drifted into Catholic conservatism, wrote sympathetically of Franco and praised Hitler in his magazine *Timón* in 1940. The SEP notes that in his vision indigenous peoples were "something to be assimilated".

## Mariátegui: The Problem of the Indian Is the Problem of the Land

The Peruvian José Carlos Mariátegui (1894–1930) spent 1919–23 in Europe, mostly in Italy, founded the journal *Amauta* (1926) and the Peruvian Socialist Party (1928), and called for a socialism "without tracing or copying" Europe's. In 1925 he had written, in Nuccetelli's translation, that "Hispanic-American thought is generally only a rhapsody composed from the motifs and elements of European thought". His *Seven Interpretive Essays on Peruvian Reality* (1928) contains his most famous argument:

1. Indigenous people make up some four-fifths of Peru's agricultural population.
2. Their misery is not at root a racial, legal, educational or religious problem, but an economic one.
3. Its root is land tenure: the great estates, a semi-feudal regime inherited from the colony and left untouched by an independence that criollos led.
4. So humanitarian, educational or legal remedies will fail while that structure survives.
5. Andean communities preserve elements of agrarian collectivism, a basis for socialism.
6. Therefore Peru should pass to socialism, even though capitalism never fully developed there.

The argument was heterodox: Marx's European stages, Mariátegui held, did not apply to Peru, and religion and "myth" could fuel revolution. Critics included the Catholic Víctor Andrés Belaúnde and later readers such as Grijalva who charged him with "Inka utopianism".

## Gaos, Ramos and the Philosophy of Mexicanness

The Spanish Civil War sent dozens of philosophers to Mexico, the *transterrados* in José Gaos's word. Gaos (1900–1969), a pupil of Ortega y Gasset and the first Spanish translator of Heidegger's *Being and Time*, taught a generation. Samuel Ramos's *El perfil del hombre y la cultura en México* (1934) had already diagnosed a national "inferiority complex", born of imitating more developed nations.

From the late 1940s to 1952 the Hyperion group of young philosophers, among them Leopoldo Zea, Emilio Uranga, Jorge Portilla and Luis Villoro, used existentialist categories to analyse *lo mexicano*, as *Existentialism: Sartre, Beauvoir and Camus* notes. "It might be said that we Mexicans are existentialist from birth," Portilla wrote in 1949. Uranga's *Análisis del ser del mexicano* (1952) described Mexican being as "accidentality": "The accident is fragility: oscillation between being and nothingness." Since all human being is accidental, he argued, Mexicans stand closer to the human essence than Europeans do. Gaos replied that the "Mexican being" they studied did not exist; Roger Bartra later traced the project to "the disdain of the dominant classes".

## Is There a Latin American Philosophy?

The question was put most sharply by the Peruvian Augusto Salazar Bondy (1925–1974) in *¿Existe una filosofía de nuestra América?* (1968). Following Nuccetelli's reconstruction, his "critical" argument runs:

1. An authentic philosophy is one that has integrity and is free of pretence; mere regional colour, or *peculiarity*, is the cheapest feature a philosophy can have.
2. A culture's philosophy is shaped by its social and economic conditions.
3. Latin America lives in dependence on Europe and the United States, which produces a "defective culture" that mistakes imitation for creation.
4. So its philosophy has been, since colonial times, "a thought of the upper class or of a refined oligarchical elite… In all these cases underdevelopment and domination are influential" (Salazar Bondy 1969, as quoted by Nuccetelli).
5. Therefore authentic Latin American philosophy requires liberation from domination; until then, philosophy must be a philosophy of liberation.

Leopoldo Zea (1912–2004) had defended a different view since the 1940s. Every philosophy is authentic in that it expresses the circumstances of its making; Latin American works express theirs; so they are authentic. Universal problems receive situated answers:

```quote
Even though being, God, etc., are issues appropriate for every man, the solution to them will be given from a Latin American standpoint.
Leopoldo Zea · 1948 essay, English as quoted by Susana Nuccetelli · 1948
```

In *La filosofía americana como filosofía sin más* (1969) Zea replied that philosophy needs no qualifier and asked why the question was posed only of Latin America; authenticity, as Hurtado and Sanchez put it, "did not require complete liberation from European colonialism".

**Objections.** To Salazar Bondy: the argument is reductive, and Las Casas is a counterexample; its defenders usually belong to the upper class, so by its own lights it is inauthentic; and it borrows from Marxism and existentialism, foreign traditions. To Zea: his first premise is too strong. It is "not obvious what is Greek about Aristotle's theory of the syllogism or German about Kant's categorical imperative" (Nuccetelli), and given the region's diversity no one can say what *the* Latin American circumstance is (Jorge Gracia). A third, universalist position, Risieri Frondizi's (1949), demanded originality, but critics reply that no other philosophy is held to so high a bar.

**Middle ways.** Gracia proposes treating Latin American philosophy as the philosophy of an ethnic group, united by family resemblance rather than a defining essence. Moulines points to universal arguments by Latin Americans with international uptake, such as da Costa's paraconsistent logic. Nuccetelli defends original arguments sensitive to Latin American context. African philosophers fought a parallel battle over authenticity (see *African Philosophy: the Ethnophilosophy Debate and Beyond*), and Chinese and Indian thinkers asked whether their traditions counted as "philosophy" (see *Modern Chinese and Indian Philosophy*).

```checkpoint
q: Why did Salazar Bondy conclude that Latin American philosophy had so far been inauthentic?
a: Because it was written in Spanish and Portuguese rather than Indigenous languages.
x: His argument concerned economic and cultural dependence, not language.
a*: Because dependence and underdevelopment produced a culture that mistook imitation for creation, so its philosophy served an elite.
a: Because no Latin American had ever published a philosophy book.
x: He knew a long tradition of Latin American philosophy and judged its character, not its existence.
a: Because philosophy is universal, so no regional philosophy can be authentic.
x: That is closer to Frondizi's universalism; Salazar Bondy's argument was critical and social.
hint: Look at premises 2 and 3 of his argument.
why: Salazar Bondy held that philosophy reflects socio-economic conditions; under domination it becomes imitative, so authenticity requires liberation.
---
q: What was the main objection to Zea's claim that every philosophy expresses its circumstances?
a: That Zea had never read European philosophy.
x: Zea was trained by Gaos and wrote on European and Mexican thought; the objection was logical.
a: That circumstances never influence philosophy at all.
x: Critics allowed influence; they denied that it guarantees authenticity.
a: That Latin America had no circumstances distinct from Europe's.
x: The objection was rather that its circumstances are too diverse to name one.
a*: That it is not obvious what is Greek about Aristotle's syllogism or German about Kant's categorical imperative, so circumstance gives at most peculiarity.
hint: Think of a famous European argument and ask where its nationality shows.
why: Critics such as Nuccetelli argued that Zea's premise is too strong and yields only regional colouring; Gracia asked what the single Latin American circumstance could be.
```

## Dussel and the Philosophy of Liberation

The Salazar Bondy–Zea debate, the SEP's Eduardo Mendieta suggests, began the philosophy of liberation, which took its name at an Argentine philosophy congress in Córdoba in 1971. It drew on dependency theory, which analysed the region's economic dependence and underdevelopment, on Freire, and on liberation theology. That theology, outlined by the Peruvian priest Gustavo Gutiérrez in 1968 and developed in *A Theology of Liberation* (Spanish 1971), called for a "preferential option for the poor" (see *Latin America in the Cold War*); the IEP warns that the two movements "should not be confused". After the Argentine coup of March 1976 its philosophers were persecuted, and many went into exile.

Its best-known figure, Enrique Dussel (1934–2023), born in Mendoza province, saw his house bombed and moved to Mexico in 1975. His *Philosophy of Liberation* (Spanish 1977, English 1985) starts from a charge summarised by the IEP: European philosophy's progress "has come at the expense of the vast majority of humanity, whose massive poverty has only rarely appeared as a fundamental philosophical theme". His argument can be reconstructed:

1. Modernity began not with Descartes but with 1492: Europe made itself the centre by conquering a periphery.
2. So, as Dussel puts it, before the Cartesian "I think" came an "I conquer", which was its practical foundation.
3. A philosophy that thinks only from the centre's "totality", the closed system that takes itself as the whole, cannot see the victims it excludes: the poor, the colonised, women, Indigenous peoples.
4. Ethics begins when the Other who stands outside the system, in Levinas's term its "exteriority", makes a claim on us.
5. Therefore philosophy must start from the periphery and serve its liberation.

Dussel called his method *analectic* (from Greek *ana*, beyond), against the "totalizing tendencies" of Hegel's dialectic, which absorbs every opposite into one whole. **Objections.** Ofelia Schutte (1993) found his early "erotics", which cast woman as man's "Other", a "machista" fixing of Catholic gender roles; Linda Martín Alcoff found too little attention to identity; Vargas argued that a philosophy built on Levinas, Hegel and Marx is Eurocentric despite itself; Horacio Cerutti-Guldberg charged parts of the movement with a populist idealisation of "the people"; and analytic philosophers dismissed the whole as unrigorous. **Reply.** Dussel listened. In a 1994 epilogue he rejected his earlier views on women and their "homophobic" dimension, and Mendieta stresses that liberation philosophy criticises European philosophy "from within, immanently". After engaging Apel and Habermas, Dussel moved to a "more dialectical" position (see *Critical Theory: the Frankfurt School and Habermas*), and he later described his project with the term "transmodernity", beyond both modernity and postmodernity.

## Freire: Against Banking Education

Paulo Freire (1921–1997) was born in Recife. By 1962 his "culture circles" had taught 300 sugar-cane workers to read in 45 days, starting from "generative words" such as *tijolo*, brick; literacy was then a condition for voting. After the 1964 coup he was jailed, for 70 or 75 days by different accounts, and spent some sixteen years in exile. *Pedagogy of the Oppressed*, written in Portuguese in 1967–68, appeared first in Spanish (1968) and in English in 1970, in Myra Bergman Ramos's translation, dedicated "To the oppressed, and to those who suffer with them and fight at their side". Its central argument runs:

1. In "banking" education the teacher deposits knowledge into students, who are treated as empty containers.
2. This makes students objects rather than subjects, and trains them to adapt to the world rather than question it.
3. It thereby mirrors and reproduces oppression.
4. The oppressed have, moreover, internalised the oppressor's view of them.
5. Liberation cannot be handed down; the oppressed must win it themselves.
6. Therefore education must be dialogical and "problem-posing": teacher and students investigate together the themes of their own lives, gaining *conscientização*, awareness of social contradictions joined to action against them.

**Objections.** Critics found the style verbose and the language sexist (later editions revised it); others doubted that the method transfers to rich countries. Some on the left found dialogue too slow, while Sol Stern charged that it ignores curriculum and licenses political teaching. **Reply.** Freire's point is that method and goal must match: an education that commands obedience cannot produce free people. His influence runs from critical pedagogy to Steve Biko's Black Consciousness Movement.

## The Decolonial Turn and Feminist Philosophy

From the 1990s the Peruvian sociologist Aníbal Quijano (1928 or 1930–2018) argued for a "coloniality of power": colonial hierarchies, above all the invention of "race" as a natural difference and a racial division of labour, outlived colonialism itself, and Europe's hegemony concentrated control over subjectivity, culture and, above all, knowledge. Walter Mignolo's *The Idea of Latin America* (2005) argued that the very idea still rests, in the IEP's summary, on colonial foundations. María Lugones (born 1944, or 1948 by another account; died 2020) was the first to articulate the "coloniality of gender": the modern two-sex, heterosexual gender system was itself a colonial imposition, which she held Quijano's account left too narrow. Dussel counted his own work part of this turn (see *Race, Colonialism and Philosophy*).

Latin American feminist philosophy has its own history. Schutte's *Cultural Identity and Social Liberation in Latin American Thought* (1993) linked theory and practice and criticised liberation philosophy. In Mexico Graciela Hierro (1928–2003) brought feminist philosophy into the UNAM curriculum from the 1970s and, in *Ética y feminismo* (1985), proposed an ethics of pleasure against the "double sexual morality". Yet Schutte warned in 2011 that "feminism is too new there to be able to effectively transform centuries of masculine intellectual dominance in philosophy" (see *Feminist Philosophy*). From Valladolid to Lugones, the tradition has kept asking who is excluded from "the human", and from philosophy itself.

## Further exploration

- **Susana Nuccetelli, Ofelia Schutte and Otávio Bueno (eds), *A Companion to Latin American Philosophy* (2010).** A broad survey by leading scholars.
- **James Maffie, *Aztec Philosophy: Understanding a World in Motion* (2014).** The major reconstruction of Nahua metaphysics, including *teotl*.
- **Ofelia Schutte, *Cultural Identity and Social Liberation in Latin American Thought* (1993).** A feminist critique of liberation philosophy.
- **Carlos Alberto Sánchez and Robert Eli Sanchez (eds), *Mexican Philosophy in the 20th Century: Essential Readings* (2017).** Translations of Caso, Ramos, Zea, Uranga, Portilla, Villoro and others.
- **Alejandro A. Vallega, *Latin American Philosophy from Identity to Radical Exteriority* (2014).** From the identity debate to Dussel and decoloniality.
- **Linda Martín Alcoff and Eduardo Mendieta (eds), *Thinking from the Underside of History: Enrique Dussel's Philosophy of Liberation* (2000).** Critical essays with a reply by Dussel.
- **Walter Mignolo, *The Idea of Latin America* (2005).** The decolonial case that "Latin America" itself rests on colonial foundations.$latinam_master$,
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
  select $latinam_quiz$[
    {"type": "mcq", "prompt": "What was the outcome of the Valladolid debate of 1550–51 between Sepúlveda and Las Casas?", "options": ["The judges scattered without a definite decision, both sides claimed victory, and conquest later resumed.", "Las Casas won outright, and the Crown permanently banned all further conquest.", "Sepúlveda won, and his Democrates alter became the official textbook of the Spanish universities.", "The Pope overruled the junta and declared the Indians natural slaves."], "answerIndex": 0, "explanation": "The SEP calls the results inconclusive. The judges 'scattered without any definite decision'; conquest resumed, and expansion was formally allowed again in 1556, while Las Casas's limits on force were never officially adopted.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Mariátegui's Seven Interpretive Essays (1928), what was the root of 'the problem of the Indian' in Peru?", "options": ["A lack of schools in the Andes", "The racial inferiority claimed by positivists", "Land tenure: the semi-feudal system of great estates inherited from the colony", "The influence of the Catholic Church"], "answerIndex": 2, "explanation": "Mariátegui argued that the problem was economic, rooted in land tenure; so educational, legal or humanitarian remedies would fail while the estates survived, and Andean communal traditions offered a basis for socialism.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Enrique Dussel mean by calling his method 'analectic'?", "options": ["A method of logical analysis borrowed from Frege", "A method that starts from the Other outside the system, against the totalising tendencies of Hegel's dialectic", "A historical method for dating colonial manuscripts", "A method of interviewing village sages"], "answerIndex": 1, "explanation": "From Greek ana, 'beyond': drawing on Levinas, Dussel held that ethics begins from the claim of those excluded from the 'totality', such as the poor and the colonised, not from a dialectic that absorbs every opposite into one whole.", "id": "q3"},
    {"type": "mcq", "prompt": "Which concept did María Lugones add to Aníbal Quijano's 'coloniality of power'?", "options": ["Transmodernity", "Accidentality", "Conscientização", "The coloniality of gender"], "answerIndex": 3, "explanation": "Lugones argued that the modern two-sex, heterosexual gender system was itself imposed through colonialism, a dimension Quijano had overlooked. Transmodernity is Dussel's term, accidentality Uranga's and conscientização Freire's.", "id": "q4"},
    {"type": "open", "prompt": "Set out Salazar Bondy's argument that Latin American philosophy had been inauthentic, and Zea's reply. Assess the strongest objection to each, and explain one 'middle way'.", "rubric": "A strong answer reconstructs Salazar Bondy's critical argument (1968): authenticity as integrity rather than mere peculiarity; philosophy shaped by socio-economic conditions; dependence and underdevelopment producing a 'defective culture' that mistakes imitation for creation; philosophy as the thought of an oligarchic elite; so authenticity requires liberation, and meanwhile philosophy must be a philosophy of liberation. It explains Zea's circumstantialism: all philosophy expresses its circumstances, universal problems receive situated answers (1948), and authenticity did not require complete liberation; philosophy 'sin más' (1969). Objections: to Salazar Bondy, Las Casas as counterexample, the self-undermining upper-class and borrowed-theory charges; to Zea, the over-strong premise (what is Greek about the syllogism?) and the diversity of Latin American circumstances (Gracia). Middle ways: Gracia's ethnic philosophy (family resemblance), Moulines's internationally received arguments, Nuccetelli's context-sensitive original arguments. Credit comparison with the African ethnophilosophy debate.", "id": "q5"},
    {"type": "open", "prompt": "Explain Freire's critique of 'banking' education and his alternative. How might a critic object, and how could Freire reply?", "rubric": "A strong answer explains banking education (teacher deposits knowledge in students treated as empty containers; students as objects; adaptation rather than questioning; reproduction of oppression), the internalisation of the oppressor, the claim that liberation must be won by the oppressed themselves, and the problem-posing alternative: dialogue, generative themes and words (tijolo), culture circles, conscientização as awareness joined to action. It gives the context (literacy and voting, the 300 workers in 45 days, the 1964 coup, Pedagogy of the Oppressed first in Spanish 1968, English 1970, tr. Myra Bergman Ramos). Objections: verbose style, sexist language (later revised), doubts about transfer to rich countries, too slow for revolutionaries, or Stern's charge that it neglects curriculum and politicises teaching. Reply: method and goal must match. Credit a reasoned verdict.", "id": "q6"}
  ]$latinam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/latin-american-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
