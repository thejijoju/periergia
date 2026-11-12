-- The Black Death — canonical master article, co-written and human-reviewed.
-- history/medieval-history/across-afro-eurasia/the-black-death @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Yersinia pestis and the Issyk-Kul origin, the spread from Caffa,
-- mortality, the plague in the Islamic world, Byzantium, the steppe,
-- Africa and China, Christian and Muslim responses, quarantine, and
-- divergent consequences.
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
    'history/medieval-history/across-afro-eurasia/the-black-death',
    'research',
    'advanced',
    'read',
    $plague_master$> **The Black Death**, the pandemic of plague that swept across western Eurasia and North Africa between 1346 and 1353, was the deadliest catastrophe in recorded human history relative to population. It killed perhaps a third to a half of the people of Europe, the Middle East, and North Africa within a few years, and it returned in waves for centuries. It is also a test case for how disease shapes societies: how people explained it, how they responded, whom they blamed, and how the survivors' world changed. This chapter covers the bacterium and its origin, as ancient DNA has revealed it; the plague's spread; its mortality; responses in Christian and Muslim societies, including the invention of quarantine and the massacres of Jews; and its long-term consequences.

## The Disease and Its Origin

Plague is caused by the bacterium ***Yersinia pestis***, which normally lives among wild rodents, such as marmots and gerbils, and is transmitted by fleas. In humans it takes several forms. In **bubonic plague**, the bacteria travel to the lymph nodes, which swell into painful buboes in the groin, armpit, or neck; untreated, it kills roughly half (40 to 60 per cent) of its victims, often within days. In **pneumonic plague**, the infection reaches the lungs and can spread directly from person to person through coughing; it is almost always fatal.

From the 1980s, some scholars, such as Graham Twigg and Samuel Cohn, doubted that the Black Death was plague at all, because it seemed to spread faster than rat-borne plague in modern outbreaks. **Ancient DNA** settled the question. Studies in 2010–2011 found *Y. pestis* DNA in plague burials, and in 2011 researchers reconstructed its genome from victims buried in the East Smithfield plague cemetery in London during the epidemic of 1348–1349. Genetic studies also showed that the plague of Justinian in the sixth century, discussed in the chapters on Byzantium and the fall of Rome, was caused by an earlier lineage of the same bacterium.

In 2022 a team led by Maria Spyrou analysed DNA from people buried in 1338–1339 in two cemeteries in the Chüy valley near **Lake Issyk-Kul** in modern **Kyrgyzstan**, in the Tian Shan mountains of Central Asia, where gravestones in Syriac record that the dead had died of "pestilence". The bacteria from these graves belonged to the strain ancestral to the Black Death and to most later plague strains, suggesting that the pandemic emerged from rodent populations in this region a few years before it reached the Black Sea. Not all agree: Ole Benedictow places the origin further west, near the Caspian, and Monica Green argues that the lineages behind the pandemic had diverged earlier, in the thirteenth century.

## The Spread

From Central Asia, plague spread along the trade routes of the Mongol world, as the previous chapter described. In 1346 it struck the army of the Golden Horde besieging the Genoese trading city of **Caffa** in Crimea. An Italian writer, Gabriele de' Mussi, later claimed that the Mongols catapulted the bodies of plague victims into the city, spreading the disease to its defenders; his account was written secondhand, and historians debate it, but plague did reach Caffa's Genoese.

Ships carried the disease across the Black Sea and the Mediterranean. It reached Constantinople in 1347 and Sicily, at Messina, in October 1347. In the same year it reached **Alexandria**, and in 1348 Cairo, Damascus, and the cities of the Islamic world. In 1348 it spread through Italy, France, Spain, and England, arriving at the English port of Melcombe in June; in 1349 it reached Scandinavia and the north, and in 1352–1353 the lands of the Rus'. The Florentine writer **Giovanni Boccaccio**, in the introduction to his *Decameron*, described the plague in Florence in 1348: the swellings, the speed of death, the collapse of normal life, people abandoning sick relatives, and bodies stacked layer upon layer in trenches, like cargo in a ship's hold.

How the disease spread so fast is still debated. The classic model holds that **black rats** and their fleas carried it, with pneumonic plague spreading directly between people. Some researchers have argued, from modelling of mortality patterns, that human fleas and body lice may have played a large role in spreading it between people in crowded households. The answer may differ between places.

## Mortality

Mortality was catastrophic. For Europe, most historians estimate that between a third and a half of the population died between 1347 and 1351; some, such as Ole Benedictow, argue for as many as 60 per cent. Cities and regions varied: some, like Florence, may have lost more than half their people, while a few areas were relatively spared. The Middle East and North Africa suffered comparably; the later Egyptian historian al-Maqrizi (1364–1442), drawing on earlier accounts, described Cairo's streets filled with the dead. Evidence for sub-Saharan Africa and China is much thinner, and whether the Black Death struck China in the fourteenth century is uncertain.

Plague did not disappear. It returned in waves every decade or two for centuries, including an outbreak in 1361 that seems to have hit children especially hard, and later great epidemics such as London's in 1665 and Marseille's in 1720. These recurrences kept populations low: England's population did not regain its pre-plague level until the seventeenth century.

{{image: Triumph of Death | Pieter Bruegel the Elder's The Triumph of Death (about 1562), painted during the long era of recurring plague that followed the Black Death.}}

```checkpoint
q: What did the 2022 ancient DNA study of burials in the Chüy valley near Lake Issyk-Kul show?
a*: That people who died of "pestilence" in 1338–1339 in Central Asia carried the plague strain ancestral to the Black Death, suggesting the pandemic emerged from that region.
a: That the Black Death was not caused by plague.
x: The study confirmed plague and identified the strain behind the Black Death.
a: That the Black Death began in Florence.
x: The study points to Central Asia, years before plague reached Italy.
a: That the Black Death was caused by a virus.
x: The Black Death was caused by the bacterium Yersinia pestis.
hint: The gravestones were inscribed in Syriac.
why: Combining written gravestones with ancient DNA traced the pandemic's origin to the Tian Shan region shortly before its spread west.
---
q: Why does Boccaccio's Decameron matter as a source on the Black Death?
a: Because it gives exact official death counts for all of Europe.
x: Boccaccio gives a vivid description of Florence, not statistics for Europe.
a: Because it was written by a doctor who discovered the cause of plague.
x: Boccaccio was a writer, not a physician, and the cause was unknown at the time.
a*: Because its introduction gives a vivid contemporary description of the plague in Florence in 1348, including its symptoms and its social effects.
a: Because it describes the plague in China.
x: The Decameron describes Florence.
hint: Think about what a contemporary observer can tell us that DNA cannot.
why: Literary and eyewitness sources capture the human and social experience of the pandemic that scientific evidence cannot.
```

## Explaining and Responding

People at the time had no knowledge of bacteria. Christian and Muslim scholars alike explained the plague through religion and the medicine they had inherited from Galen and Ibn Sina. In 1348 the medical faculty of the University of Paris reported to the king of France that the plague had been caused by a conjunction of planets in 1345, which had corrupted the air. **Miasma**, bad air, was the most common medical explanation, and people were advised to avoid foul smells, carry sweet-smelling herbs, and burn aromatic substances.

Many Christians saw the plague as God's punishment for sin. Bands of **flagellants** travelled from town to town in Germany and the Low Countries, whipping themselves in public penance, until Pope Clement VI condemned them in 1349.

The most horrifying response was the persecution of **Jews**. Accused of causing the plague by poisoning wells, Jewish communities were massacred across the Holy Roman Empire (including the Swiss towns), France, and Aragon in 1348–1349. In **Strasbourg**, after the city council that had tried to protect them was overthrown by the guilds, the Jewish community was burned to death on 14 February 1349; contemporaries put the dead at about 2,000. Pope Clement VI issued bulls in 1348 condemning the accusations and pointing out that Jews were dying of the plague like everyone else, but they had little effect. Hundreds of Jewish communities were destroyed, and many survivors moved east to Poland and Lithuania, whose rulers welcomed them.

In the **Islamic world**, responses differed. Muslim scholars generally taught, following hadith, that plague was a mercy and a martyrdom for believers sent by God, and that Muslims should neither flee nor enter a plague-stricken land. Large public prayers were held; Ibn Battuta described a procession in Damascus in 1348 in which Muslims, Jews, and Christians prayed together. Persecution of minorities was rare. Some scholars, notably **Ibn al-Khatib** of Granada, argued from observation that the disease was contagious, contrary to religious teaching.

The most lasting practical response was **quarantine**. Italian cities created health boards to bury the dead, isolate the sick, and regulate movement. In 1377 the Adriatic city of **Ragusa**, modern Dubrovnik, ordered that travellers from plague-infected places spend thirty days in isolation before entering the city; the period was later extended to forty days, *quarantena* in Venetian (from *quaranta*, "forty"), from which the word **quarantine** derives.

```checkpoint
q: Why did Pope Clement VI argue that Jews could not have caused the plague?
a: Because Jews had already left Europe.
x: Large Jewish communities lived across Europe in 1348.
a*: Because Jews were dying of the plague like everyone else, and the disease struck places where there were no Jews.
a: Because the plague had already ended.
x: Clement wrote during the epidemic, in 1348.
a: Because the Church believed the plague was caused by the Mongols.
x: The Church generally explained plague as divine punishment, not Mongol action.
hint: Think about who was dying.
why: Clement's reasoning used evidence to refute a conspiracy theory, though it failed to stop the massacres.
---
q: Where does the word "quarantine" come from?
a: From a Latin word for "hospital".
x: The word comes from Italian, referring to a number of days.
a: From the name of a doctor who discovered plague.
x: Quarantine is named after the isolation period, not a person.
a: From the Arabic word for plague.
x: The word is Italian in origin.
a*: From the Venetian quarantena, "forty days", the period of isolation required of travellers, extended from the thirty days first ordered by Ragusa in 1377.
hint: Count the days.
why: Quarantine was a lasting public-health invention born of the plague era.
```

## The Plague Beyond Europe

The Black Death is often told as a European story, largely because European archives are so rich. It was not. Some of the most penetrating contemporary writing about it came from the Islamic world, and its effects were felt from the steppe to the Nile.

**In the Islamic world**, the Syrian scholar **Ibn al-Wardi** wrote an *Essay on the Report of the Pestilence* as the plague reached Aleppo in 1348, tracing its path from "the land of darkness" in the east through China, India, and the lands of the Uzbeks to Syria, in a rhymed literary work that later writers took too literally as a map of the plague's route; he died of it in 1349. In Tunis, the plague killed the parents and teachers of the young **Ibn Khaldun**, whose methods of historical criticism appear in *What is History?*. Decades later, in the *Muqaddimah*, he described it as a turning point in world history.

```quote
Ibn Khaldun · Muqaddimah · 1377
Civilization both in the East and the West was visited by a destructive plague which devastated nations and caused populations to vanish. It swallowed up many of the good things of civilization and wiped them out.
```

In **Mamluk Egypt and Syria**, later chroniclers such as al-Maqrizi recorded the death toll in Cairo, perhaps 200,000 people, a third or more of the city, the collapse of agricultural labour, and the state's attempts to keep revenues flowing. In **Byzantium**, the emperor John VI Kantakouzenos, whose own son died in Constantinople, wrote a description of the disease modelled on Thucydides' account of the plague of Athens.

**On the steppe**, the plague struck the Golden Horde and its capital Sarai, and historians such as Marie Favereau argue that it weakened the Horde and the trade networks of the Mongol world, contributing to the fragmentation of the khanates described in the previous chapter.

**In sub-Saharan Africa**, written evidence is scarce, but historians and archaeologists, such as Monica Green and Gérard Chouin, have argued that plague may have reached parts of West and East Africa, pointing to signs of abandoned settlements and disrupted societies in the mid-fourteenth century. The case is not yet proven, and it shows how evidence, not just events, shapes whose history is told.

**In China**, Yuan sources record devastating epidemics in the 1330s–1350s, which contributed to the rebellions that overthrew the Mongol dynasty in 1368. Whether these were plague is unknown; no ancient DNA has yet confirmed it.

## Consequences

The Black Death transformed the societies that survived it, in different ways in different places.

- **Labour and wages.** With so many dead, labour became scarce. Peasants and workers demanded higher wages and better terms, and farm wages in England roughly doubled between 1350 and 1450, and real wages rose substantially, especially from the 1370s. Governments tried to hold wages down, as with England's Statute of Labourers of 1351, provoking resentment that fed into revolts such as the English Peasants' Revolt of 1381, as the chapter on lords, peasants, and towns described.
- **The end of serfdom in the west.** Lords competing for scarce tenants had to offer better terms, and serfdom gradually disappeared from much of western Europe. In eastern Europe, by contrast, lords used their political power to tighten serfdom, in what historians call the "second serfdom", a divergence with long consequences.
- **Abandoned villages and changing land use.** Thousands of villages were abandoned; in England, much arable land was turned over to sheep pasture.
- **Different paths in Europe and Egypt.** The historian **Stuart Borsch** compared England and Mamluk Egypt and argued that the plague had very different effects. In England, landowners had to adapt to scarce labour, and the economy eventually recovered and grew. In Egypt, a centralised landholding elite and the decline of the labour-intensive irrigation system in the Nile valley meant that the economy declined for a long period.
- **Disrupted connections.** The Mongol khanates fragmented, the overland routes across Central Asia became less secure, and the Mongol Yuan dynasty in China, weakened by epidemics, famine, and rebellion, fell in 1368. The connected world that had carried the plague was itself broken by it.
- **Culture and belief.** In Europe, art and literature became preoccupied with death, as in the *danse macabre*, the "dance of death". In the Islamic world, scholars debated contagion against divine decree, a debate that Ibn al-Khatib's argument for contagion sharpened. Some historians, such as David Herlihy, argued that the plague, by making labour expensive, encouraged labour-saving innovation in Europe, though the connection is debated, and comparisons such as Borsch's show that the same disease could lead to growth in one society and long decline in another.

The Black Death remains the benchmark for pandemics. Its history, of a disease spread by the connections of a globalising world, of scapegoating, and of public health measures such as quarantine, has been recalled in every pandemic since, including COVID-19.

## Further exploration

- **Ole J. Benedictow, *The Complete History of the Black Death* (2021).** A comprehensive and demographically detailed account.
- **Monica H. Green (ed.), *Pandemic Disease in the Medieval World: Rethinking the Black Death* (2015).** New genetic and global perspectives.
- **David Herlihy, *The Black Death and the Transformation of the West*, ed. Samuel K. Cohn Jr. (1997).** Posthumously published lectures, short and influential, on the plague's consequences.
- **Stuart J. Borsch, *The Black Death in Egypt and England* (2005).** A comparative study of the plague's economic effects.
- **Giovanni Boccaccio, *The Decameron*, trans. G. H. McWilliam (2nd ed., 1995).** Including the famous description of plague in Florence.$plague_master$,
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
  select $plague_quiz$[
    {"type": "mcq", "prompt": "What causes plague?", "options": ["The bacterium Yersinia pestis, normally carried by rodents and fleas", "A virus spread by mosquitoes", "Bad air (miasma)", "Contaminated water"], "answerIndex": 0, "explanation": "Ancient DNA from plague cemeteries has confirmed that Yersinia pestis caused both the Black Death and the earlier plague of Justinian.", "id": "q1"},
    {"type": "mcq", "prompt": "Where did the 2022 ancient DNA study trace the origin of the Black Death strain?", "options": ["Florence", "Alexandria", "Near Lake Issyk-Kul in Central Asia, in burials of 1338–1339", "London"], "answerIndex": 2, "explanation": "Gravestones recording 'pestilence' and DNA from the burials point to the Tian Shan region.", "id": "q2"},
    {"type": "mcq", "prompt": "Which North African scholar, who lost his parents to the plague in Tunis, later described it as a turning point in world history?", "options": ["Ibn Battuta", "Al-Bakri", "Ibn Fadlan", "Ibn Khaldun"], "answerIndex": 3, "explanation": "In the Muqaddimah, Ibn Khaldun wrote that civilization in both East and West was visited by a destructive plague.", "id": "q3"},
    {"type": "mcq", "prompt": "What does the word 'quarantine' come from?", "options": ["The Latin word for disease", "The Italian for 'forty days', the isolation period that grew from Ragusa's thirty-day rule of 1377", "The name of a doctor", "The Arabic word for hospital"], "answerIndex": 1, "explanation": "Italian and Adriatic cities developed isolation rules that became a lasting public-health measure.", "id": "q4"},
    {"type": "open", "prompt": "Compare responses to the Black Death in Christian Europe and the Islamic world.", "rubric": "A strong answer discusses shared medical ideas (miasma, Galen and Ibn Sina, the Paris faculty's planetary explanation), Christian responses (divine punishment, flagellants, massacres of Jews such as Strasbourg 1349 and Clement VI's bulls), Islamic responses (plague as mercy and martyrdom for believers, the teaching not to flee, communal prayers such as the Damascus procession described by Ibn Battuta, rarer scapegoating, Ibn al-Khatib's contagion argument), and public-health innovation such as quarantine. It draws conclusions about how belief shaped response.", "id": "q5"},
    {"type": "open", "prompt": "Why did the Black Death have different long-term consequences in different societies?", "rubric": "A strong answer explains the decline of serfdom in western Europe and the 'second serfdom' in the east; Borsch's comparison of England (adaptation and eventual growth) and Mamluk Egypt (centralised elite, decline of irrigation, prolonged decline); the fragmentation of Mongol khanates and the fall of the Yuan; the uncertain evidence for Africa and China; and how social and political structures, not just mortality, shaped outcomes.", "id": "q6"}
  ]$plague_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/across-afro-eurasia/the-black-death', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
