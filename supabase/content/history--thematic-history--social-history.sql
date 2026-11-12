-- Social History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/social-history @ research/advanced/read.
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
    'history/thematic-history/social-history',
    'research',
    'advanced',
    'read',
    $mn_socialhist_master$> **History seen from below.** Social history asks how ordinary people (workers, peasants, women, servants, migrants, the poor) lived, worked, married, ate and died, and how their lives connect to the large changes that textbooks usually tell through kings and wars. This chapter explains how the field arose, from the French *Annales* and the British Marxist historians to Italian microhistory, Subaltern Studies in India, the schools of Ibadan and Dar es Salaam, and village studies of Mexico and China. It follows historians at work on parish registers, Inquisition trials and oral interviews, and sets out the quarrels over numbers, language and voice that still shape what counts as evidence and whose lives count as history.

## What social history is

Social history, often called "history from below", is the study of the lived experience of the past. It came to prominence in the 1960s, from British and French schools which held that the "Great Man" view of history could not explain how societies changed. The sociologist Charles Tilly summed up its tasks in three parts: "documenting large structural changes; 2) reconstructing the experiences of ordinary people in the course of those changes; and (3) connecting the two". Two sayings capture the argument around it: G. M. Trevelyan defined it as "the history of a people with the politics left out", a phrase critics later turned against it; defenders answered that it was "history with the people put back in".

The phrase goes back to 1932, when a French historian (sources differ between Lucien Febvre and Georges Lefebvre) spoke of "histoire vue d'en bas et non d'en haut", history seen from below and not from above. E. P. Thompson's essay "History from Below" (1966) made it famous, and older works were rediscovered as forerunners, above all W. E. B. Du Bois's *Black Reconstruction in America* (1935).

The field grew fast: in US universities the share of history professors identifying with social history rose from 31 to 41 per cent between 1975 and 1995. The chapter What is History? introduces the basic ideas, such as reading records against the grain; this chapter looks more closely at how the work is done.

## The *Annales* and the slow time of societies

The journal *Annales d'histoire économique et sociale* was founded in 1929 by Marc Bloch and Lucien Febvre, then teaching at the University of Strasbourg. They rejected the politics, diplomacy and war of the historians Febvre called the "Sorbonnistes", and combined geography, history and sociology in pursuit of a "total history". Bloch's *Les Rois thaumaturges* (1924) asked why people believed that French and English kings could cure scrofula by touch, a question an anthropologist might ask. Together they launched the history of *mentalités*, the ways people in the past thought about and classified their world.

{{image: Marc Bloch | Marc Bloch, medievalist and co-founder of the Annales, who joined the Resistance, was arrested by the Gestapo and was shot by German security police on 16 June 1944.}}

Fernand Braudel, who led the second generation, drafted his work on the Mediterranean in German prisoner-of-war camps, famously with few books and often, it is said, from memory, though some historians call that a legend. *La Méditerranée* (1949) layered time at three speeds: short-term events, medium-term *conjonctures* (economic and social cycles lasting decades or centuries) and an almost motionless time of geography and climate, in which, for example, mountain dwellers and plain dwellers were in tension over thousands of years. The *longue durée* became the general name for this slow, structural time-scale. Braudel's *Civilization and Capitalism, 15th–18th Century* (1967–79) turned the method on daily life, describing in thick detail the food, fashion and customs through which ordinary people made pre-industrial economies work. Georges Duby described the history he taught:

```quote
relegated the sensational to the sidelines and was reluctant to give a simple accounting of events, but strove on the contrary to pose and solve problems and, neglecting surface disturbances, to observe the long and medium-term evolution of economy, society and civilisation.
Georges Duby · on Annales history
```

The *Annales* travelled to Poland, Spain, Venezuela and Mexico, where Spanish Republican exiles carried it to El Colegio de México; and, as the chapter on Modern Southeast Asia describes, Anthony Reid later applied Braudel's approach to Southeast Asia.

**A worked example: *Montaillou*.** The third generation, led by Emmanuel Le Roy Ladurie (1929–2023), turned towards historical anthropology. His *Montaillou* (1975; English 1978) rebuilt a Pyrenean village of about 250 people from the register of interrogations by the inquisitor Jacques Fournier, who pursued Cathar heretics in the region between 1318 and 1325. The first half reconstructed material life, through figures such as the shepherd Pierre Maury; the second, the villagers' mentality. The inquisitor wanted heretics; Le Roy Ladurie treated the interrogations as a record of villagers' voices. The book is often seen as a forerunner of microhistory.

## Agency from below: the British Marxist historians

In Britain the impulse came from the left. The Communist Party Historians' Group formally existed from 1946; its members included Christopher Hill, Eric Hobsbawm, Rodney Hilton and E. P. Thompson, and in 1952 several of them, with non-Marxist colleagues, founded the journal *Past and Present*. Most left the party after the Soviet invasion of Hungary in 1956. Their guiding idea, paraphrasing Marx, was that people make their own history, but not in conditions of their own choosing.

E. P. Thompson's *The Making of the English Working Class* (1963) became the movement's classic. Its famous promise to rescue the hand-loom weaver and the Luddite cropper from "the enormous condescension of posterity" is quoted in What is History?. Its argument was that "in the years between 1780 and 1832 most English working people came to feel an identity of interests as between themselves, and as against their rulers and employers". Class, for Thompson, was not a thing produced automatically by factories but something that happened in people's shared experience; the working class, he insisted, helped to make itself. Geoffrey Best said Thompson neglected the "flag-saluting, foreigner-hating, peer-respecting side of the plebeian mind", and Joan Scott argued that the book treated class as male; Sheila Rowbotham answered that it was ahistorical to judge a 1963 book that way. His essay on time-discipline is discussed in the chapter on The Industrial Revolution.

Others widened the cast. George Rudé put "faces in the crowd", showing rioters as ordinary, sober citizens, and Hobsbawm's *Primitive Rebels* (1959) treated "social banditry" as an explicable form of rebellion. At Ruskin College, the trade-union college in Oxford, Raphael Samuel founded the History Workshop movement, which wanted history to be "a collaborative enterprise" shared with local and family historians and inspired History Workshops as far away as South Africa. Rowbotham's *Hidden from History* (1973) put women into the story.

## Counting people: demography, family and childhood

In the 1960s social history was transformed by numbers. The French demographer Louis Henry developed **family reconstitution**: transcribing parish registers of christenings, marriages and burials and rebuilding them into family histories, then linking them to tax, land and probate records. In 1964 Peter Laslett and Tony Wrigley founded the Cambridge Group for the History of Population and Social Structure, which worked with amateur volunteers on local records. Laslett's *The World We Have Lost* (1965) began from seventeenth-century lists of villagers, and Wrigley and Roger Schofield's *The Population History of England, 1541–1871* (1981) reconstructed England's population over three centuries. Louise Tilly and Joan Scott's *Women, Work, and Family* (1978) linked women's wage labour to household life, and the family became a field of its own.

**A worked example of a thesis overturned.** Philippe Ariès argued in 1960 that childhood as a separate stage of life was a modern discovery, citing medieval paintings that show children as small adults. The English translation, *Centuries of Childhood* (1962), contained the famous line "in medieval society the idea of childhood did not exist", but as Hugh Cunningham notes, it rendered Ariès's word *sentiment* (feeling) as "idea", sharpening the claim. Geoffrey Elton pointed out that children were dressed as adults only for portraits, and Nicholas Orme's *Medieval Children* concluded that "medieval children were ourselves, five hundred or a thousand years ago". The thesis is now largely refuted, but the argument it provoked made childhood a subject of historical debate.

Numbers also produced the field's fiercest quarrel. The "cliometricians" applied economics to the past, and Robert Fogel and Stanley Engerman's *Time on the Cross* (1974) argued that American slavery was efficient and that enslaved field hands received "approximately ninety percent of the income produced". The historian Thomas Haskell judged in 1975 that the book now "appears at least to be severely flawed", and Herbert Gutman answered with *Slavery and the Numbers Game* (1975) and *The Black Family in Slavery and Freedom, 1750–1925* (1976). The episode set numbers against lived experience, and in 1979 Lawrence Stone diagnosed a "revival of narrative" as historians turned back towards stories.

```checkpoint
q: What does family reconstitution, pioneered by Louis Henry, involve?
a*: Rebuilding the histories of individual families from parish registers of baptisms, marriages and burials, linked to other records.
a: Interviewing elderly people about their memories of family life.
x: That is oral history. Reconstitution works from written registers, often centuries old.
a: Reading Inquisition trials to recover a single villager's beliefs.
x: That describes microhistory, such as Ginzburg's study of Menocchio.
a: Studying portraits to see how children were dressed.
x: That was Ariès's evidence for his thesis on childhood, not a demographic method.
hint: Think of the church records kept in every parish.
why: Family reconstitution turned millions of routine entries in registers into measurable patterns of birth, marriage and death.
---
q: Why is Ariès's claim that "in medieval society the idea of childhood did not exist" a useful warning?
a: Because it was proved correct by later research.
x: Later historians such as Nicholas Orme largely refuted the thesis.
a: Because Ariès had invented his sources.
x: His paintings were real; the problem lay in how they were interpreted, and children were dressed as adults only for portraits.
a*: Because the famous English wording mistranslated Ariès's word for "feeling", and the thesis itself was later largely refuted.
a: Because it came from a cliometric study of slavery.
x: Ariès worked on French family life and images, not on the economics of slavery.
hint: Compare the French word *sentiment* with the English word "idea".
why: Social history's bold theses are tested against new evidence, and translation can change what a claim appears to say.
```

## Small places, large questions: microhistory

Microhistory, in Charles Joyner's phrase, "asks large questions in small places". It became popular in Italy in the 1970s, through Carlo Ginzburg, Giovanni Levi and Edoardo Grendi, the journal *Quaderni Storici* and Einaudi's *Microstorie* series. It reacted against grand narratives and treated gaps in the sources as part of the story.

Ginzburg (1939–2026), son of the novelist Natalia Ginzburg and of an antifascist murdered by the Gestapo, wrote its most widely read book, *The Cheese and the Worms* (1976), on the miller Menocchio, which What is History? discusses. His key argument was that peasant and learned culture formed "a circular relationship composed of reciprocal influences, which traveled from low to high as well as from high to low". And microhistory was not only Italian: the Mexican historian Luis González y González had already published *Pueblo en vilo: Microhistoria de San José de Gracia* in 1968.

**A worked example and a debate: Martin Guerre.** Natalie Zemon Davis (1928–2023) advised on a French film of the case and wrote *The Return of Martin Guerre* (French 1982, English 1983). In sixteenth-century Artigat, in southwestern France, the peasant Martin Guerre left his wife Bertrande de Rols. Years later Arnaud du Tilh took his place and was accepted until he was tried at Toulouse, the real Martin returned, and Arnaud was executed. Davis argued that Bertrande was not a dupe but an active accomplice. In the *American Historical Review* in 1988 Robert Finlay replied that Bertrande had been deceived, that Davis's evidence was weak and her reading anachronistic. Davis answered, in a 1988 reply, that her circumstantial evidence supported a range of plausible readings. The exchange remains a standard test of how far a historian may infer what someone in the past felt.

Robert Darnton's *The Great Cat Massacre* (1984) took a joke as its source: Paris printing apprentices in the late 1730s, fed worse than their master's wife's cats, staged a mock trial and hanging of cats. What is no longer funny to us, Darnton argued, opens a way into an alien mentality. Laurel Thatcher Ulrich's *A Midwife's Tale* (1990) built a Pulitzer-winning study from the diary of the midwife Martha Ballard, long dismissed as repetitive and ordinary.

## Women and gender

Women's history exploded in the 1970s. Joan Kelly asked in 1977 "Did Women Have a Renaissance?", questioning whether that familiar period applied to women at all. Joan Scott's essay of 1986, summarised in What is History?, argued that gender, based on perceived differences between the sexes, is also a primary way of signifying relationships of power, and so explains all history, not only women's. The history of masculinity followed in the 1990s. The field was not only Western: Chen Dongyuan's *History of the Lives of Chinese Women*, published in 1928 (second edition 1937), was the first systematic Chinese women's history, framed in the spirit of the New Culture Movement as a history of abuse.

## Crime and punishment from below

Courts recorded the poor far more often than the poor recorded themselves. Thompson's *Whigs and Hunters* (1975) and *Albion's Fatal Tree* (1975), written with Douglas Hay, Peter Linebaugh and others, read eighteenth-century English criminal law as an instrument of class rule and treated "crimes" such as poaching and wrecking as the defence of customary rights. Thompson's essay on "the moral economy of the English crowd" (1971) showed food riots as the enforcement of customary norms of fair dealing. Davis's *Fiction in the Archives* (1987) read sixteenth-century French pleas for pardon as stories crafted by their tellers. Michel Foucault's *Discipline and Punish* (1975; English 1977) argued that the prison arose not simply from humanitarian reform but from new "disciplines" of power. Digitised sources such as the Old Bailey Online now open such records to anyone. In southern Africa, Charles van Onselen's *The Small Matter of a Horse* (1984) traced the life of the bandit-gang leader 'Nongoloza' Mathebula.

## The archives of the inarticulate: oral history

In the late 1930s the US Federal Writers' Project interviewed about 2,300 formerly enslaved people. The collection is invaluable but compromised: most interviewers were white and rendered speech in phonetic dialect, and John Blassingame warned of "a simplistic and distorted view of the plantation". Even so, their publication from 1972 transformed slavery studies. Britain's Mass-Observation, founded in 1937, enlisted volunteer diarists and observers to record everyday life. The Italian oral historian Alessandro Portelli, who compared workers' experiences in Harlan County, Kentucky, and Terni, Italy, explained what such sources offer:

```quote
[oral history] tells us less about events as such than about their meaning [...] the unique and precious element which oral sources force upon the historian ... is the speaker's subjectivity.
Alessandro Portelli · on oral history
```

Jan Vansina pioneered methods for using African oral tradition as evidence, in *Oral Tradition* (English edition 1965) and *Oral Tradition as History* (1985). Oral evidence now counts in law: in *Delgamuukw v. British Columbia* (1997) the Supreme Court of Canada held that in Aboriginal title claims oral histories are as important as written testimony. The 1947 Partition Archive records survivors of the division of India, and a project in Uzbekistan uncovered famine stories from collectivisation that are absent from the state archive.

**A worked example: *The Gender of Memory*.** Gail Hershatter and her collaborator Gao Xiaoxian of the Shaanxi Women's Federation spent ten years interviewing 72 elderly rural women in Shaanxi about the 1950s and 1960s. Hershatter's book (2011) brings into history the memories of village women who rarely appear in written accounts of China's collective past.

## Social history beyond the West

**South Asia.** Subaltern Studies, launched by Ranajit Guha (1923–2023) in 1982 and introduced in What is History?, borrowed the word "subaltern" from Antonio Gramsci, first for peasants outside industrial capitalism and later for any group of subordinate rank by class, caste, gender, race or religion. Its target was both colonial and nationalist history, including traditional Marxism, that showed elites inspiring passive masses. Guha's *Elementary Aspects of Peasant Insurgency in Colonial India* (1983) read colonial records for the peasants' own politics. Dipesh Chakrabarty's *Provincializing Europe* (2000) argued that European categories cannot simply be applied to everyone's past. Critics came from within: Sumit Sarkar's "Decline of the Subaltern in Subaltern Studies" charged that the turn to discourse abandoned the empirical work of the early volumes, and Vivek Chibber argued that it erased class exploitation. Spivak's "Can the Subaltern Speak?", discussed in What is History?, asked whether such voices can be recovered at all; the chapter on Modern South Asia places the group in India's historiography.

**Africa.** At University College Ibadan, Kenneth Dike, its first African professor of history, and colleagues such as J. F. Ade Ajayi built an African-centred history from the 1950s. The Ibadan School wrote mainly nationalist political history, but it was modern in its sources, using oral evidence and other disciplines. At Dar es Salaam, historians working under Terence Ranger stressed African agency and initiative, as in Isaria Kimambo and Arnold Temu's *A History of Tanzania* (1969); later critics charged the school with naïvely celebrating nationalist governments, and Ranger replied that its commitment was to African agency. From the 1970s social and labour history rose. Van Onselen's *Chibaro* (1976) studied African mine labour in Southern Rhodesia; he followed it with *Studies in the Social and Economic History of the Witwatersrand* (1982), and *The Seed is Mine* (1996) reconstructed the life of Kas Maine, a Black sharecropper, under South Africa's land laws.

**Latin America.** Gilberto Freyre's *Casa-Grande & Senzala* (1933) was an early social history of plantation domestic life in Brazil, now criticised for portraying slavery as mild and feeding the myth of "racial democracy". Florencia Mallon's *Peasant and Nation* (1995) traced peasant political cultures in Puebla and Morelos, against the French intervention in Mexico, and in Junín and Cajamarca, against the Chilean invasion of Peru, and her 1994 essay weighed "the promise and dilemma" of Subaltern Studies for Latin American history. A Latin American Subaltern Studies Group, mostly of literary scholars, was founded in 1992.

**China and Southeast Asia.** Fei Xiaotong's *Peasant Life in China* (1939), from fieldwork in a Jiangsu village, became a foundational village study for social historians. Philip C. C. Huang's studies of North China (1985) and the Yangzi delta (1990) argued for "involution": population pressure drove labour into ever more intensive, low-return work. In a Malaysian village, James C. Scott's *Weapons of the Weak* (1985) found resistance not in revolt but in foot-dragging, false compliance, pilfering, feigned ignorance and slander. The chapter The Modern History of Rural China follows the Chinese countryside in more detail.

**Germany.** West German historians of the Bielefeld School built a social-science "history of society" in the 1960s and 1970s. In the 1980s Alf Lüdtke and Hans Medick answered with *Alltagsgeschichte*, the history of everyday life. Lüdtke's concept of *Eigen-Sinn*, workers' own sense of themselves expressed in factory-floor horseplay and breaks, helped explain how ordinary Germans took part in, and acquiesced to, dictatorship.

```checkpoint
q: What did the Subaltern Studies historians object to in earlier histories of colonial India?
a: They thought earlier historians had paid too much attention to peasants.
x: Their complaint was the reverse: peasants had been treated as passive followers.
a*: Colonial and nationalist histories alike showed elites leading passive masses, ignoring the peasants' own politics.
a: They rejected all use of colonial records.
x: Guha read colonial records closely, against the grain, to recover peasant insurgents' politics.
a: They believed only economic statistics could reveal the past.
x: That was closer to the cliometricians' view; Subaltern Studies focused on consciousness and agency.
hint: "Subaltern" means of subordinate rank.
why: The group set out to recover the politics of those whom both colonial and nationalist historians had treated as followers.
---
q: How is the Ibadan School best described?
a: As a Marxist school of working-class history modelled on Thompson.
x: Ibadan's historians wrote mainly nationalist political history; Marxist and social schools rose later.
a: As a school that rejected oral evidence.
x: Ibadan was notable for promoting oral evidence.
a: As a group of literary scholars studying Latin America.
x: That describes the Latin American Subaltern Studies Group, founded in 1992.
a*: As a pioneer of African-centred history, mainly nationalist and political, but modern in its use of oral and interdisciplinary sources.
hint: Think of Kenneth Dike and the decades after independence.
why: Ibadan pioneered African-centred history and new sources; social and labour history in Africa developed later.
```

## Quarrels over language and evidence

From the late 1970s, and especially in the 1980s, the "linguistic turn" argued that language and discourse do not simply reflect social reality but help to constitute it. In social history, Joan Scott and William Sewell stressed the constitutive role of language, and Gareth Stedman Jones's *Languages of Class* (1983) read English working-class politics through its vocabulary. After 1990 cultural history increasingly challenged social history. Bryan Palmer's *Descent into Discourse* (1990) protested that a reliance on discourse obscures oppression and resistance, and Elizabeth Fox-Genovese and Eugene Genovese mocked a social history concerned with "the bedrooms, bathrooms, and kitchens of each one's favourite victims".

A newer debate concerns silence itself. Writing in 2008 about enslaved women in the Atlantic world, whose lives survive only in fragments, Saidiya Hartman developed "critical fabulation", combining archival research, critical theory and fictional narrative; she later used it for young Black women in early twentieth-century Philadelphia and New York in *Wayward Lives, Beautiful Experiments* (2019). Supporters see an honest response to an archive built by enslavers; sceptics ask whether it goes beyond what evidence can bear, a question that echoes the Finlay–Davis exchange.

## What social history changed

Social history has gone global. Eric Wolf's *Europe and the People Without History* (1982) showed peoples left out of Western accounts as active participants in the world of commercial empire. Marcel van der Linden's *Workers of the World* (2008), from the International Institute of Social History in Amsterdam, set out a global labour history that treats slavery and indentured labour alongside wage work. Digital history, which grew out of social historians' computer analysis of censuses in the 1960s and 1970s, now adds text mining and mapping.

The field's lasting achievement is to have changed what counts as evidence: parish registers, court depositions, diaries, jokes and interviews. It also changed whose lives count as history. The miller, the midwife, the sharecropper and the village woman of Shaanxi now stand in the same story as the king and the general.

## Further exploration

- **E. P. Thompson, *The Making of the English Working Class* (1963).** The founding classic of history from below; begin with the Preface and the chapters on the Luddites.
- **Natalie Zemon Davis, *The Return of Martin Guerre* (1983).** A short, gripping microhistory of identity and marriage in a sixteenth-century French village.
- **Ranajit Guha, *Elementary Aspects of Peasant Insurgency in Colonial India* (1983).** The Subaltern Studies founder reads colonial records for peasant rebels' own politics.
- **Laurel Thatcher Ulrich, *A Midwife's Tale: The Life of Martha Ballard, Based on Her Diary, 1785–1812* (1990).** Pulitzer-winning women's social history built from an "ordinary" diary.
- **Charles van Onselen, *The Seed is Mine: The Life of Kas Maine, a South African Sharecropper, 1894–1985* (1996).** A Black sharecropper's life under South Africa's land laws.
- **Dipesh Chakrabarty, *Provincializing Europe: Postcolonial Thought and Historical Difference* (2000).** Why European categories cannot simply be applied to everyone's past.
- **Gail Hershatter, *The Gender of Memory: Rural Women and China's Collective Past* (2011).** An oral history of 72 Shaanxi village women under Mao.$mn_socialhist_master$,
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
  select $mn_socialhist_quiz$[
    {"type": "mcq", "prompt": "In Braudel's scheme of historical time, what is the longue durée?", "options": ["The slow, almost motionless time of structures such as geography and climate", "The rapid succession of political events in a king's reign", "The span of a single human life recorded in a diary", "The decades-long economic cycles Braudel called conjonctures"], "answerIndex": 0, "explanation": "Braudel layered time at three speeds: short-term events, medium-term conjonctures, and the slow structural time-scale known as the longue durée, which includes geography and climate.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Robert Finlay argue against Natalie Zemon Davis in their 1988 exchange about Martin Guerre?", "options": ["That the case had never come to trial", "That Arnaud du Tilh was the real Martin Guerre", "That Bertrande de Rols had been deceived, and that Davis's evidence for her complicity was weak", "That microhistory should rely only on statistics"], "answerIndex": 2, "explanation": "Davis argued Bertrande was an active accomplice; Finlay replied that she had been deceived and that Davis's evidence was weak and her reading anachronistic. Davis answered that her circumstantial evidence supported a range of plausible readings.", "id": "q2"},
    {"type": "mcq", "prompt": "Which source did Emmanuel Le Roy Ladurie use to reconstruct the village of Montaillou?", "options": ["Parish registers of baptisms, marriages and burials", "Oral interviews with the villagers' descendants", "Paintings of medieval village life", "The register of interrogations by the inquisitor Jacques Fournier, 1318–1325"], "answerIndex": 3, "explanation": "Montaillou (1975) rebuilt a Pyrenean village of about 250 people from the Fournier Register, the record of an inquisitor's campaign against Cathar heretics.", "id": "q3"},
    {"type": "mcq", "prompt": "What did James C. Scott mean by 'weapons of the weak' in his study of a Malaysian village?", "options": ["Armed peasant uprisings against the state", "Everyday resistance such as foot-dragging, false compliance, pilfering and feigned ignorance", "Petitions to colonial courts", "Strikes organised by trade unions"], "answerIndex": 1, "explanation": "Scott's Weapons of the Weak (1985) found peasant resistance not in open revolt but in small, everyday acts that avoided direct confrontation.", "id": "q4"},
    {"type": "open", "prompt": "E. P. Thompson's The Making of the English Working Class (1963) is often called the founding classic of history from below. Explain its main argument and summarise two criticisms made of it.", "rubric": "A strong answer explains that Thompson argued that between 1780 and 1832 English working people came to feel an identity of interests against other classes, and that class was something people made through shared experience rather than a thing produced automatically by economic change. It gives two criticisms, such as Geoffrey Best's charge that Thompson neglected the patriotic, deferential side of popular attitudes, and Joan Scott's argument that the book treated class as male (with Sheila Rowbotham's reply that this judged a 1963 book unhistorically).", "id": "q5"},
    {"type": "open", "prompt": "Social history set out to recover the lives of people who left few records of their own. Choosing two examples from different parts of the world, explain how historians have tried to do this and what limits their sources impose.", "rubric": "A strong answer uses two contrasting examples, for instance Guha's reading of colonial records for peasant insurgents' politics (and Spivak's question whether the subaltern can be heard through rulers' archives), the WPA interviews with formerly enslaved people (with Blassingame's warning about white interviewers and dialect transcription), Hershatter's interviews with 72 women in Shaanxi, Ginzburg's or Le Roy Ladurie's use of Inquisition records, or Vansina's methods for African oral tradition. It explains the method and identifies a real limitation, such as the purposes of those who made the record, the influence of interviewers, or the gaps that led Hartman to propose critical fabulation.", "id": "q6"}
  ]$mn_socialhist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/social-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
