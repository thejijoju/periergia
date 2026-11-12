-- Global History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/global-history @ research/advanced/read.
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
    'history/thematic-history/global-history',
    'research',
    'advanced',
    'read',
    $mn_globalhist_master$> **History beyond the nation-state.** Much of what shaped people's lives, silver and sugar, plague and migration, empires and ideas, never respected national borders. Global history, also called world history, is the field that follows such connections and compares across regions. This chapter traces its ancestry in the universal histories of Sima Qian, Rashid al-Din and Ibn Khaldun as well as of Europeans; the making of the modern field after William McNeill; its arguments over world-systems, the Great Divergence, Eurocentrism and "connected histories"; and three ways it is done in practice: following a commodity, taking a sea as the unit, and following one life across empires. It ends with the critiques of 2017–2018 and with what global history shows that national histories cannot.

## History Without Borders

"World history" or "global history" studies the past from a global perspective. It differs from comparative history, which sets cultures or nations side by side without working on a global scale, though global historians compare as well as connect. They are often described as working with two focal points: **integration**, the processes that drew the world's peoples together, and **difference**, the patterns that reveal how varied human experience has been.

The field defines itself against two habits of professional history-writing: letting today's nation-states set the boundaries and agendas of studies of the past, and a deep legacy of Eurocentric assumptions. Instead it studies networks, connections and systems that cross linguistic, cultural and national borders.

The labels overlap. The world historian Jerry H. Bentley observed in 2011 that "the term *world history* has never been a clear signifier with a stable referent", and the field shades into universal history, comparative history, Big History and **transnational history**. Akira Iriye defined transnational history as "the study of movements and forces that have cut across national boundaries"; transnational historians pay particular attention to non-state actors. Sebastian Conrad of the Free University of Berlin, whose *What Is Global History?* (2016) is a widely used introduction, treats global history, as his reviewers summarise it, both as a subject of study and as a distinct way of looking at the past.

## Universal Histories Before the Field

The ambition to write the history of the known world is old, and never only European. **Herodotus** (c. 484–c. 425 BC), from Halicarnassus, then under Persian control, gathered material on many peoples, notably the Egyptians, in his *Histories*; Thucydides rejected that all-embracing approach.

In Western Han China, **Sima Qian** wrote the *Shiji*, the *Records of the Grand Historian*, in the late second and early first centuries BC, building on the work of his father Sima Tan. It covered some 2,500 years from the Yellow Emperor to Emperor Wu, described the world as the Western Han knew it, and became the first of the Twenty-Four Histories.

In Mongol Iran, **Rashid al-Din** (1247–1318), born into a Persian Jewish family in the province of Hamadan, converted to Islam at around the age of thirty and rose to be vizier of the Ilkhan Ghazan. His *Jāmiʿ al-tawārīkh*, the *Compendium of Chronicles*, written in the early fourteenth century in Persian and Arabic, covered peoples from China to Europe and has been called "the first world history", a product of the Mongol age described in the chapter on the Mongol Empire. He was executed in 1318, charged with poisoning the Ilkhan Öljaitü.

{{image: Jami' al-tawarikh | Mongol soldiers in a manuscript of Rashid al-Din's Compendium of Chronicles, an early-fourteenth-century history of peoples from China to Europe.}}

**Ibn Khaldun** (1332–1406) wrote the *Muqaddimah* in 1377 as the introduction to a planned world history, the *Kitab al-ʿIbar*. It analysed the rise and fall of dynasties, the relationship between nomadic and settled life, and *asabiyyah*, social solidarity. Arnold Toynbee later called the *Muqaddimah* "the greatest work of its kind".

European universal history took a more self-regarding turn. In lectures given at Berlin five times between 1822 and 1831 and published in 1837, after his death, the philosopher **Hegel** described world history moving from Asia through Greece and Rome to northern Europe. He treated India and China as "stationary" and wrote, in the old English translation, that Africa "is no historical part of the World, it has no movement or development to exhibit". Twentieth-century works divided the past into civilisations instead. Oswald Spengler's *The Decline of the West* (volume one 1918, volume two 1922) treated cultures as organisms with lifespans, and was warmly received by some intellectuals in China, India and Latin America who hoped Europe's empires would collapse. Arnold J. Toynbee's *A Study of History*, twelve volumes published between 1934 and 1961, traced nineteen or twenty-one civilisations from genesis to disintegration.

## McNeill and the Making of a Field

As a distinct academic field, world history is usually traced to the United States in the 1960s. Its landmark text was **William H. McNeill**'s *The Rise of the West: A History of the Human Community* (1963), which won the National Book Award in 1964. McNeill, who taught at the University of Chicago from 1947 to 1987, had conceived the book as a student in 1936 as an answer to Spengler and Toynbee, and its title deliberately reversed Spengler's. Against the idea of sealed civilisations rising and falling, he argued that contact, and the spread of techniques and ideas across the Eurasian "ecumene", was the motor of historical change. He went on to write *Plagues and Peoples* (1976), an early major history of disease.

McNeill later judged his own title harshly. Looking back in the first issue of the *Journal of World History* in 1990, he wrote that the book should be seen as "an expression of the postwar imperial mood in the United States", a "form of intellectual imperialism". **Marshall Hodgson**, author of *The Venture of Islam* and coiner of the term "Islamicate", had made a sharper case in essays published as *Rethinking World History* (1993), setting Europe's rise inside wider Eurasian developments such as the innovations of Song China.

Institutions followed. The **World History Association** was founded in 1982. Jerry Bentley established the *Journal of World History* at the University of Hawaiʻi in 1990, and the *Journal of Global History* followed in 2006, with roots in a seminar that Patrick O'Brien had started at the Institute of Historical Research in 1990. In American schools world history often displaced "Western Civilization", but the field has had strong centres elsewhere too: in Germany (Conrad, Jürgen Osterhammel), in Britain (C. A. Bayly), and among historians from India such as Sanjay Subrahmanyam and Dipesh Chakrabarty. At its widest, **Big History**, taught by David Christian at Macquarie University in Sydney from 1989, runs from the Big Bang to the present; it remains contested.

## World-Systems and Their Rivals

The most ambitious model of how the world hung together came from the New York-born scholar **Immanuel Wallerstein**, whose *The Modern World-System* appeared in four volumes between 1974 and 2011.

```quote
a system is defined as a unit with a single division of labor and multiple cultural systems
Immanuel Wallerstein · "The Rise and Future Demise of the World Capitalist System" · 1974
```

For Wallerstein, a capitalist world-economy took shape in western Europe and the Americas in the "long" sixteenth century, roughly 1450 to 1640, and divided the world into a **core**, a **semi-periphery** and a **periphery**, with leadership passing from the Netherlands to Britain to the United States. The approach grew partly out of dependency theory, above all Andre Gunder Frank's "development of underdevelopment", and the Egyptian economist **Samir Amin** was among its thinkers, alongside Giovanni Arrighi.

Its challengers attacked its starting point. **Janet Abu-Lughod**, in *Before European Hegemony: The World System A.D. 1250–1350* (1989), argued that a world system already spanned Eurasia in the thirteenth century, linking the Champagne fairs, the Mongol Empire, the Mamluk Sultanate and India. Europe's later rise, she argued, was made possible by the collapse of that earlier system, not by qualities peculiar to Europe. Frank went further in *ReOrient: Global Economy in the Asian Age* (1998): between about 1400 and 1800 the world economy was centred on Asia, with China at its heart; Europe used American silver to buy its way in; and the "rise of the West" was a late and perhaps temporary episode. Eric Wolf's *Europe and the People Without History* (1982) saw Europe's growth until the late eighteenth century as tributary rather than capitalist. And Sidney Mintz objected in 1977 that world-systems theory was too determinist: larger forces were always met by local initiative and local response.

## The Great Divergence

These arguments fed the field's best-known debate: why did parts of northwestern Europe pull ahead of the rest of the world? The phrase "Great Divergence" was coined by Samuel P. Huntington in 1996 and popularised by **Kenneth Pomeranz**'s *The Great Divergence* (2000). Pomeranz argued that England and China's Yangzi Delta were comparable until about 1800, and that Britain escaped shared land constraints through accessible coal and colonies, an argument set out, with its critics, in the chapter on the Industrial Revolution.

What matters here is method. Pomeranz and R. Bin Wong, whose *China Transformed* appeared in 1997, belonged to the **"California School"**, which compared the most advanced regions of China and Europe on equal terms; Wong and Jean-Laurent Rosenthal later extended that balanced comparison in *Before and Beyond Divergence* (2011). Critics replied with evidence. Philip Huang argued that the Yangzi Delta was not developing but "involuting", a debate followed in the chapter on The Modern History of Rural China. Robert Allen's wage data led him to explain Britain's breakthrough by high wages and cheap coal. From India, Prasannan Parthasarathi's *Why Europe Grew Rich and Asia Did Not* (2011) widened the comparison to South Asia and added Indian textile competition and British state policy to Pomeranz's ecological account.

```checkpoint
q: Who coined the phrase "Great Divergence", and who made it famous?
a*: Samuel P. Huntington coined it in 1996, and Kenneth Pomeranz's book of 2000 popularised it.
a: Kenneth Pomeranz coined it in 2000 and Samuel Huntington popularised it.
x: The order is reversed: Huntington coined it in 1996 and Pomeranz's 2000 book popularised it.
a: Immanuel Wallerstein coined it in 1974 in The Modern World-System.
x: Wallerstein's work concerned the core, semi-periphery and periphery of a world-economy, not this phrase.
a: Eric Jones coined it in The European Miracle (1981).
x: Jones popularised the phrase "European miracle", a rather different framing.
hint: The phrase is older than the famous book that carries it as a title.
why: The phrase predates Pomeranz, but his comparison of England and the Yangzi Delta turned it into the central debate of global economic history.
---
q: What did Janet Abu-Lughod argue in Before European Hegemony (1989)?
a: That a world system first appeared in western Europe in the long sixteenth century.
x: That is Wallerstein's view, which Abu-Lughod challenged.
a: That Europe rose because of qualities unique to European culture.
x: She argued the opposite: Europe's rise depended on the collapse of a wider system.
a*: That a world system spanning Eurasia existed in the thirteenth century, and its collapse opened the way for Europe's later rise.
a: That the Americas were the centre of the world economy before 1500.
x: Her thirteenth-century system linked Europe, the Mongol Empire, the Mamluk Sultanate and India.
hint: Think of the Champagne fairs, the Mongols and the Mamluks.
why: Abu-Lughod pushed the origins of a world system back before European dominance and moved its centre away from Europe.
```

## Eurocentrism and Connected Histories

The critique of Europe as the measure of history came largely from scholars of the colonised world. **Edward Said**'s *Orientalism* (1978) showed how Western scholarship on the "Orient" was bound up with imperial power. Samir Amin developed the concept of **Eurocentrism** as the name of an ideology from the 1970s and published *Eurocentrism* in 1988. J. M. Blaut followed with *The Colonizer's Model of the World* (1993).

The most influential statement came from **Dipesh Chakrabarty**, a Kolkata-born historian at the University of Chicago. In *Provincializing Europe* (2000) he argued that, in academic history, "Europe" "remains the sovereign, theoretical subject of all histories, including the ones we call 'Indian,' 'Chinese,' 'Kenyan,' and so on". Historicism, the modern European idea of history, he wrote, came to non-European peoples in the nineteenth century "as somebody's way of saying 'not yet' to somebody else": an image of colonised peoples kept in history's waiting room until they became sufficiently like Europe.

One answer was to stop comparing civilisations as if they were sealed boxes. In a 1997 essay, "Connected Histories", the Delhi-born historian **Sanjay Subrahmanyam** proposed reconfiguring early modern Eurasia by following the links among its societies rather than comparing sealed civilisational units. In 2003 Michael Werner and Bénédicte Zimmermann proposed a related *histoire croisée*, "crossed" or entangled history, attentive both to real crossings between societies and to how historians' own categories shape what they see. The great syntheses that followed, C. A. Bayly's *The Birth of the Modern World, 1780–1914* (2004), which rejected European "exceptionalism", and Osterhammel's *The Transformation of the World* (German 2009, English 2014), were admired, but reviewers asked whether even they escaped a Eurocentric frame.

## Following a Commodity

The most concrete way to do global history is to follow a thing. Silver is the classic case, told in detail in the chapters on the Columbian Exchange, Ming China and the Voyages of Zheng He, and Ming–Qing history. In outline: Bolivia's Potosí and the mines of Mexico produced, by one estimate, about 80 per cent of the world's silver between 1500 and 1800. From 1565 the **Manila galleons** carried American silver from Acapulco to Manila and returned with Asian, mostly Chinese, goods. Ming China ran on silver and valued it at about double its price elsewhere, so a large share, about 30 per cent by one estimate, ended up there, alongside silver from Japan. Dennis Flynn and Arturo Giráldez argued in 1995 that world trade was "born" in 1571, when Manila became a Spanish trading hub and all the important populated continents began exchanging goods continuously. A single coin thus ties Andean miners, Spanish officials, Chinese tax-payers and merchants into one story that no national history contains.

Sugar was the subject of the founding commodity history. The anthropologist **Sidney Mintz**, who had done fieldwork among sugar-cane workers in Puerto Rico from 1948, argued in *Sweetness and Power* (1985) that sugar grown by enslaved people in Europe's tropical colonies went from aristocratic luxury to working-class staple in Britain, often in sweetened tea, so that Caribbean slavery and English factory life were part of one system. Some food historians, such as Rachel Laudan, have doubted the working-class part of the argument; the chapter on History and Drugs follows sugar's circuits further. **Sven Beckert**'s *Empire of Cotton* (2014) did the same for cotton and gave the name "war capitalism" to the slavery, land seizure and armed trade on which industrial capitalism rested, as the chapter on the Industrial Revolution describes. Reviewers have called the term loosely defined; the historian Peer Vries judged the book "a must read for every historian interested in global history, but in my view it is better as a story on cotton than as an analysis of capitalism".

## The Sea as a Unit

A second way is to make a body of water, rather than a landmass, the unit of history. The model was Fernand Braudel's *The Mediterranean* (1949). **Atlantic history** treats the Americas, Europe and Africa as a common sphere after the sixteenth century, an approach pioneered by Robert R. Palmer's *The Age of the Democratic Revolution* (1959, 1964), following C. L. R. James's 1930s linking of the French and Haitian revolutions; Bernard Bailyn's Harvard seminar spread it from 1995. Paul Gilroy's *The Black Atlantic* (1993) described a transatlantic Black culture mixing African, American, British and Caribbean elements. Critics have called Atlantic history imperial history under another name, and Caroline Dodds Pennock has shown that thousands of Native Americans crossed the Atlantic in the sixteenth century.

The **Indian Ocean**, where trade ran on the seasonal monsoon winds, has been reread from Asian vantage points. K. N. Chaudhuri's *Trade and Civilisation in the Indian Ocean* (1985) was commissioned as a Braudel-style history of that ocean. Sunil Amrith, born in Nairobi to Indian parents and raised in Singapore, followed migrants across the Bay of Bengal, and the natural forces that shaped their journeys, in *Crossing the Bay of Bengal* (2013). The Sri Lankan-born historian Sujit Sivasundaram, in *Waves Across the South* (2020), retold the age of revolutions and empires from the Indian Ocean and the Pacific, seen from the sea. Anthony Reid's Braudelian history of Southeast Asia, described in the chapter on Modern Southeast Asia, is another.

The most radical reframing came from the **Pacific**. The Tongan-Fijian anthropologist **Epeli Hauʻofa**, in his essay "Our Sea of Islands" (1993), reframed the Pacific from "islands in a far sea" to "a sea of islands": Pacific Islanders, in one magazine's paraphrase of his argument, were "connected rather than separated by the sea". The chapter on Pacific Voyagers shows the deep history behind that claim.

Oceans also carried the **mobilities** global historians study: the crops, animals and diseases of Alfred Crosby's *The Columbian Exchange* (1972) and McNeill's *Plagues and Peoples*, and the forced migration of some 12 to 12.8 million Africans embarked across the Atlantic, as current estimates put it, described in the chapter on the Atlantic Slave Trade.

## One Life Across Empires

A third way works at the smallest scale. **Microhistory** began in Italy in the 1970s; Carlo Ginzburg's *The Cheese and the Worms* (1976), on the miller Menocchio, is its best-known work. Since the 2010s, **global microhistory** has applied the same close focus to lives that crossed empires. Natalie Zemon Davis's *Trickster Travels* (2006) followed al-Hasan al-Wazzan, known in Europe as Leo Africanus: born in Granada around 1494, raised in Fez, a visitor to Timbuktu, captured by Spanish corsairs in 1518, presented to Pope Leo X and baptised, and the author of a celebrated description of Africa. Davis read his writings as showing "the possibility of communication and curiosity in a world divided by violence". Linda Colley's *The Ordeal of Elizabeth Marsh: A Woman in World History* (2007) brought the same approach to one woman's life. In 2019 a special issue of *Past & Present*, edited by John-Paul Ghobrial, asked what "seeing the world like a microhistorian" could add. In the same volume, Jan de Vries warned that the genre gives undue prominence to unusually cosmopolitan people, who may not be typical at all.

```checkpoint
q: What did Epeli Hauʻofa argue in "Our Sea of Islands" (1993)?
a: That the Pacific Islands were too small and isolated to have a history of their own.
x: That was the outsiders' view of "islands in a far sea" that Hauʻofa rejected.
a*: That Pacific Islanders lived in "a sea of islands", connected rather than separated by the ocean.
a: That Pacific history should be written mainly from European explorers' records.
x: His essay reframed the Pacific from Islanders' own perspective.
a: That the Pacific had no trade before the Manila galleons.
x: The essay concerned Islanders' own connections, not the Spanish galleon trade.
hint: Islands in a far sea, or a sea of islands?
why: Hauʻofa turned the ocean from a barrier into a highway, a model for treating seas as units of history.
---
q: What was Jan de Vries's criticism of global microhistory?
a: That it ignored the experience of individuals.
x: Global microhistory is built around individual lives.
a: That it was only interested in Europe.
x: Its subjects, such as Leo Africanus, often moved between Africa, Asia and Europe.
a: That it relied too heavily on statistics.
x: It relies on close reading of a few lives, not on aggregate data.
a*: That it gives undue prominence to unusually cosmopolitan individuals.
hint: Are people who crossed empires typical of their societies?
why: The worry is that following travellers can make a world of mostly settled people look more mobile than it was.
```

## The Critiques of 2017–2018

In March 2017, after, as commentators note, the Brexit vote and Donald Trump's election, **Jeremy Adelman**, a Canadian historian of Latin America (cited in the chapter on Latin American Independence), then at Princeton, published "What is global history now?" in the magazine *Aeon*. In paraphrase, he argued that the field's prestige had been tied to globalisation and its boosters; that it had favoured connection and mobility and neglected those who stayed put or were left behind; and that historians should treat separation and disunity as seriously as connection. Commentators quoted his warning against "borderless, do-good storytelling" and his remark that global history had become a narrative fit for the "now-defunct Clinton Global Initiative".

The reply came in the *Journal of Global History* in 2018 from Richard Drayton and David Motadel, who also answered an earlier critique by David Bell. In summary, they argued that global history had never ignored disconnection, and that it was needed more than ever to counter the myths of imperial and national pasts that were feeding nationalist populisms. Behind the exchange lay older doubts: Mintz's insistence on local response, the charge that Atlantic history treated Indigenous peoples as static, and McNeill's confession of "intellectual imperialism". The field is still centred in American and European universities, and many of its own practitioners ask whether its frames remain Eurocentric even when its subjects do not.

## What Global History Reveals

Global history does not replace national or local history; it changes what they can see. Some questions cannot be asked inside one country: why silver mined in the Andes mattered so much in China, why British workers' tea was sweetened by Caribbean slavery, why Britain rather than the Yangzi Delta industrialised first. It recovers older traditions, from Sima Qian to Rashid al-Din and Ibn Khaldun, that make Hegel's Europe-centred version look like one parochial attempt among several, and it brings in people national histories leave at the edges: migrants, the enslaved, Indigenous travellers, Pacific Islanders. And its own debates teach caution: about whose categories set the frame, and about the many people shaped by the wider world without ever leaving home.

## Further exploration

- **Sebastian Conrad, *What Is Global History?* (2016).** The standard short introduction to the field's methods and politics.
- **Janet L. Abu-Lughod, *Before European Hegemony: The World System A.D. 1250–1350* (1989).** The thirteenth-century Eurasian world system that preceded Europe's rise.
- **Kenneth Pomeranz, *The Great Divergence: China, Europe, and the Making of the Modern World Economy* (2000).** The book that launched the divergence debate.
- **Dipesh Chakrabarty, *Provincializing Europe: Postcolonial Thought and Historical Difference* (2000).** The classic critique of Europe as history's default subject.
- **Sidney W. Mintz, *Sweetness and Power: The Place of Sugar in Modern History* (1985).** The founding commodity history, linking Caribbean slavery to British consumers.
- **Sunil S. Amrith, *Crossing the Bay of Bengal: The Furies of Nature and the Fortunes of Migrants* (2013).** Migration and the sea from an Asian vantage.
- **Jürgen Osterhammel, *The Transformation of the World: A Global History of the Nineteenth Century* (German 2009; English 2014).** The landmark synthesis of a century.$mn_globalhist_master$,
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
  select $mn_globalhist_quiz$[
    {"type": "mcq", "prompt": "Which work, written in the early fourteenth century by a vizier of the Ilkhan Ghazan, has been called \"the first world history\"?", "options": ["Rashid al-Din's Compendium of Chronicles (Jāmiʿ al-tawārīkh)", "Ibn Khaldun's Muqaddimah", "Sima Qian's Shiji", "Herodotus's Histories"], "answerIndex": 0, "explanation": "Rashid al-Din's Compendium, in Persian and Arabic, covered peoples from China to Europe. Ibn Khaldun wrote the Muqaddimah in 1377; Sima Qian wrote in Western Han China.", "id": "q1"},
    {"type": "mcq", "prompt": "How did William McNeill later describe his book The Rise of the West (1963)?", "options": ["As a refutation of dependency theory", "As the first history of disease", "As an expression of the postwar imperial mood in the United States", "As a continuation of Spengler's Decline of the West"], "answerIndex": 2, "explanation": "In the Journal of World History in 1990 he called it \"an expression of the postwar imperial mood in the United States\" and a \"form of intellectual imperialism\". The book was conceived as an answer to Spengler, not a continuation.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Dennis Flynn and Arturo Giráldez argue happened in 1571?", "options": ["Potosí's silver was first discovered", "The Manila galleons were abolished", "Ming China abandoned silver", "World trade was \"born\", when Manila became a Spanish trading hub and all the important populated continents began exchanging goods continuously"], "answerIndex": 3, "explanation": "Their 1995 article dated the origin of world trade to the founding of Manila as a Spanish entrepôt in 1571. Potosí was found in 1545, and the galleons ran until 1815.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Sanjay Subrahmanyam's idea of \"connected histories\" (1997) propose?", "options": ["Comparing sealed civilisations as separate units", "Following the links among societies of early modern Eurasia rather than treating them as sealed units", "Writing history from the Big Bang to the present", "Dividing the world into core, semi-periphery and periphery"], "answerIndex": 1, "explanation": "Subrahmanyam set connection against comparisons of sealed civilisational units. Big History is David Christian's approach; core and periphery belong to Wallerstein's world-systems analysis.", "id": "q4"},
    {"type": "open", "prompt": "Was the modern world economy born in Europe? Use the debate over world-systems and the Great Divergence to answer.", "rubric": "A strong answer sets out Wallerstein's capitalist world-economy originating in western Europe and the Americas in the long sixteenth century, with core, semi-periphery and periphery; then the challengers: Abu-Lughod's thirteenth-century Eurasian system whose collapse enabled Europe's rise, Frank's Asia-centred world economy before 1800 (ReOrient, 1998), Wolf's tributary Europe, Flynn and Giráldez on 1571 and Manila; and the Great Divergence debate (term coined by Huntington in 1996, popularised by Pomeranz in 2000; the California School's late divergence through coal and colonies, against Huang, Allen and Parthasarathi). It reaches a reasoned judgement and notes that the answer depends on the unit and period chosen.", "id": "q5"},
    {"type": "open", "prompt": "Has global history escaped Eurocentrism? Assess the critiques of the field.", "rubric": "A strong answer explains the field's aims against nation-centred and Eurocentric history; non-European traditions of universal history (Sima Qian, Rashid al-Din, Ibn Khaldun) versus Hegel's Europe-centred scheme; McNeill's own 1990 self-criticism; Said, Amin (who developed the concept of Eurocentrism from the 1970s and published Eurocentrism in 1988) and Chakrabarty's Provincializing Europe; doubts about Bayly's and Osterhammel's syntheses; the field's US and European institutional base; and the 2017–2018 exchange, presented in paraphrase: Adelman on the field's ties to globalisation and its neglect of disconnection and those who stayed put, and Drayton and Motadel's reply that global history studies disconnection and is needed against nationalist myths. It may draw on de Vries's critique of global microhistory and on oceanic and Pacific perspectives such as Hauʻofa's.", "id": "q6"}
  ]$mn_globalhist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/global-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
