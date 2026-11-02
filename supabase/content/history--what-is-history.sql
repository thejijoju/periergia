-- What is History? — canonical master article, co-written and human-reviewed.
-- history/what-is-history @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The opening chapter of the History subject: method, not narrative. It teaches
-- the reasoning every later chapter relies on (source criticism, the silences
-- of the archive, causation and counterfactuals, periodization, objectivity),
-- with interleaved ```checkpoint self-tests after each major section.
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
    'history/what-is-history',
    'research',
    'advanced',
    'read',
    $wih_master$> **History** is not the past. The past is everything that ever happened, and almost all of it is gone. History is what people can responsibly say about that vanished past from the traces it left behind: documents, objects, buildings, bones, memories, and the chemistry of ice and soil. Every other chapter in this subject is a set of conclusions. This one is about how those conclusions are reached, why they change, and how to tell a well-founded claim about the past from a confident-sounding fabrication.

## The Past and History Are Not the Same Thing

The English word *history* does double duty. It names what happened ("the history of Rome") and the account of what happened ("a history of Rome"). Keeping the two apart is the first move in thinking historically. The past cannot be observed, repeated, or interviewed. It survives only as **traces**, and a historian's work is to reason from those traces to statements about events no living person witnessed.

That makes history closer to detective work or geology than to storytelling. A geologist has never watched a mountain range rise; she infers it from folded strata. A historian has never watched the Roman Senate debate; she infers what happened from a speech written up afterwards by an interested party, a few inscriptions, some coins, and the silence of everything that did not survive. The account is always an *argument from evidence*, never a recording.

Two consequences follow, and they run through the rest of this chapter. First, history is always incomplete, because traces are a tiny and badly skewed sample of what happened. Second, history is always written from somewhere. The questions a historian asks come from her own time, and different questions pull different evidence into focus. The novelist L. P. Hartley's line, "The past is a foreign country: they do things differently there" (*The Go-Between*, 1953), captures the discipline's central difficulty. The people of the past did not think as their historians do, and the commonest error in historical reasoning is to assume that they did. Historians call that error **presentism** or **anachronism**: reading present-day categories, values, or knowledge back into people who could not have held them.

```checkpoint
q: What is the most accurate description of the relationship between "the past" and "history"?
a*: History is a reasoned account of the past built from the traces that happen to survive.
a: They are the same thing; history is simply a complete record of the past.
x: No complete record exists or ever could. Most of what happened left no trace at all, so history is necessarily a partial reconstruction, not a copy.
a: History is whatever the official records of a state say happened.
x: Official records are one kind of trace among many, and they are produced for the state's own purposes. Treating them as history itself is exactly the uncritical move the discipline exists to avoid.
a: History is a form of fiction, because nobody alive witnessed the events.
x: Lack of direct observation does not make the account fiction, any more than geology is fiction. Claims are constrained by evidence, and some are demonstrably better supported than others.
hint: Think about what a historian actually has in hand when she starts work.
why: The past is gone; what remains are traces. History is the disciplined inference from those traces, which is why it is both incomplete and revisable.
---
q: A modern writer criticises a fourteenth-century physician for failing to recommend handwashing during the Black Death. What error in historical reasoning does this illustrate?
a: Relying on a secondary source instead of a primary one.
x: Nothing in the scenario concerns the type of source. The problem is the standard being applied, not where the information came from.
a: Excessive scepticism about medieval evidence.
x: The writer is not doubting the evidence at all; they are judging the physician by knowledge that did not yet exist.
a*: Presentism: judging people of the past by knowledge they could not have had.
a: Counterfactual reasoning.
x: A counterfactual asks what would have happened under different conditions as a tool for weighing causes. This criticism asks nothing of the kind.
hint: Germ theory was established in the 1860s–80s.
why: Holding people to knowledge that arrived five centuries later tells us about the critic's world, not the physician's. Understanding requires reconstructing what was thinkable at the time.
```

## Sources: What Survives and Why

Historians divide their material into **primary sources**, produced in or close to the period under study by people with some direct relation to events, and **secondary sources**, later works that interpret primary material. A letter written by a soldier at Gallipoli is primary; a 2015 book about Gallipoli is secondary. The distinction depends on the question rather than the object. That same 2015 book becomes a primary source for anyone studying how the First World War was remembered a century later.

The most important fact about sources is that **survival is not random**. Writing was invented in Sumer around 3200 BCE, and the earliest tablets from Uruk are not poems or chronicles but accounts: rations of barley, numbers of sheep, labour owed to the temple. For most of recorded history, the people who generated documents were states, temples, and the wealthy, and the documents were made to tax, to own, to judge, and to commemorate. The Domesday Book of 1086, the most famous record in English history, exists because William the Conqueror wanted to know what every landholder in his new kingdom owned and therefore owed. It is a magnificent source, and it shows England from the point of view of a tax assessor.

Survival then filters the record a second time. Papyrus survives in Egypt's dry sand and almost nowhere else. Clay tablets survive fires that destroy libraries, because fire bakes them, which is one reason so much Mesopotamian writing outlived so much Greek. Archives are lost to war, flood, damp, insects, and deliberate destruction. The Spanish burned most Maya codices in the sixteenth century; four are generally accepted as surviving. The result is a record that over-represents the literate, the male, the urban, the powerful, and the inhabitants of dry climates, and under-represents nearly everyone else.

None of this makes the record useless. It means that every source has to be asked two questions before it is asked anything else: *why was this made?* and *why did this survive?*

{{image: Domesday Book | The Domesday Book (1086), compiled so that William the Conqueror could know what every landholder in England owned and owed. One of the richest sources for medieval England, and a view of the kingdom through the eyes of a tax assessor.}}

## Interrogating a Document

Historians call the systematic questioning of sources **source criticism**. Its standard questions are simple to state:

- **Who** made it, and what was their position and interest?
- **When and where**, and how close were they to the events described?
- **For whom**, and what did the author want that audience to believe or do?
- **What kind** of document is it, and what were the conventions of its genre?
- **What does it leave out**, and what could its author not have known?
- **Is it what it claims to be?**

The last question, **authenticity**, is called external criticism. Its classic demonstration came in 1440, when the Italian humanist Lorenzo Valla examined the *Donation of Constantine*, a document in which the emperor Constantine supposedly handed the western Roman Empire to Pope Sylvester I. The Donation had underwritten papal claims to temporal power for centuries. Valla showed that its Latin was full of words and usages that did not exist in the fourth century, including the term *satrap* for Roman officials, and that it was inconsistent with everything else known about Constantine's reign. It was an eighth-century forgery. Valla's weapon was **philology**, the historical study of language, and the method still works: a text cannot use words its supposed author had never heard.

Modern forensic science has added new tools to the same logic. In 1983 the German magazine *Stern* paid about 9 million Deutschmarks for sixty volumes of what it presented as Adolf Hitler's secret diaries, and the eminent historian Hugh Trevor-Roper initially vouched for them. Within two weeks, analysis by the West German Federal Institute for Materials Testing showed that the paper, bindings, and glue contained substances not manufactured until after 1945. The forger, Konrad Kujau, had produced them himself. The episode is a lesson in how the desire for a sensational source can defeat expertise, and in why authentication is a technical question to settle *before* interpretation begins.

Most documents are authentic, though, and the harder problem is **internal criticism**: deciding how far an authentic source can be believed. Here the author's purpose dominates. The sixth-century Byzantine historian Procopius wrote the *Wars*, a respectful official history of the emperor Justinian's campaigns; *On Buildings*, a panegyric praising Justinian's construction projects; and the *Secret History*, unpublished in his lifetime, in which the same emperor is a demon in human form and the empress Theodora a monster of depravity. The same man, writing about the same people, produced flattery and venom depending on audience and safety. Neither version can be taken at face value, and the contradiction is itself evidence about the pressures on writers at Justinian's court.

Historians therefore rarely trust a single source. They look for **corroboration**, independent sources that agree, and they weigh *how* independent the sources really are, since ten chroniclers copying one original amount to one witness, not ten. They pay special attention to evidence that runs against an author's interest, since a hostile witness conceding a point is stronger than a friendly one asserting it. They also exploit **unintentional evidence**: what a document reveals without meaning to. A medieval charter written to record a land grant also shows, incidentally, who could write, which saints were invoked, what the witnesses' names say about family ties, and which measurements of land were in use. Marc Bloch called these "witnesses in spite of themselves", and they are often more reliable than a source's deliberate claims, because nobody had a reason to falsify them.

```checkpoint
q: Lorenzo Valla's demonstration that the Donation of Constantine was forged rested mainly on which kind of evidence?
a: Testimony from witnesses who had seen the forgery being made.
x: The forgery was centuries old by Valla's time; no witnesses existed. His case had to come from the text itself.
a*: The document's language: it used Latin words and forms that did not exist in Constantine's time.
a: Chemical analysis of the parchment.
x: That kind of forensic science did not exist in 1440. It is the method that exposed the Hitler diaries in 1983, not the Donation.
a: A confession from the papal court.
x: The papacy did not concede the point; the Donation's authenticity was argued over well after Valla wrote.
hint: Valla was a humanist and a scholar of classical Latin.
why: A text cannot contain vocabulary its supposed author had never encountered. Valla used historical philology to date the document to a much later period.
---
q: Procopius praised the emperor Justinian in one work and savaged him in another. What is the soundest conclusion a historian draws?
a: The flattering works are reliable, because they were officially published.
x: Official publication under an autocrat is a reason for more suspicion, not less. Publication tells us the work was safe to circulate, not that it was true.
a: The Secret History is reliable, because hidden writing is always honest.
x: Private writing has its own distortions, such as resentment, gossip, and the freedom to exaggerate without challenge. Secrecy does not guarantee accuracy.
a: Procopius is worthless as a source and should be discarded.
x: Discarding him would throw away the main narrative of the period. Biased sources are still used constantly; they are read with their bias in mind and checked against other evidence.
a*: Each work reflects its intended audience, so every claim must be weighed against its purpose and checked against other evidence.
hint: Ask what each text was for, not which one to believe wholesale.
why: Source criticism treats bias as information. Knowing why and for whom a text was written tells the historian how to read it, and corroboration settles what one text cannot.
```

## Evidence Beyond Words

Writing appears late, and in some regions very late, in the human story. *Homo sapiens* has existed for roughly 300,000 years, and writing for about 5,000 of them. The term "prehistory", coined in English by the archaeologist Daniel Wilson in 1851, once marked the boundary of the historian's competence: history began where texts began. That boundary has largely dissolved, because historians now routinely use evidence that is not written at all. (The deep human past has its own era in this course, *Before Writing*.)

**Archaeology** recovers material culture: buildings, tools, pots, graves, rubbish. Its great strength is that it records ordinary life that no scribe thought worth describing, such as what people ate, how they built houses, and how long they lived. Its limitation is that objects do not explain themselves. A pot shows a technique and a trade route; it does not say what its owner believed.

**Scientific dating** gave archaeology a calendar. Willard Libby's radiocarbon method, published in 1949 and rewarded with a Nobel Prize in 1960, measures the decay of carbon-14 in once-living material. **Dendrochronology**, which counts and matches tree rings, provides calendar-exact dates and calibrates radiocarbon. **Ice cores and other climate proxies** turn the environment into an archive. Lead pollution trapped in Greenland ice tracks the smelting of silver in the Roman world year by year, and it dips during the plagues and civil wars that disrupted Roman mining. An economic history of Rome can be read, in part, from Arctic ice.

**Ancient DNA**, a field whose pioneer Svante Pääbo received a Nobel Prize in 2022, has transformed the study of migration. It has shown that modern humans interbred with Neanderthals and Denisovans, and that the population of prehistoric Europe was reshaped by large movements of people, which settled arguments that pots and skulls alone could not.

**Oral tradition** is the most contested of these sources and, for much of the world, the most important. In societies where knowledge was carried in memory, by specialists such as the griots of West Africa who preserve the epic of Sunjata, founder of the Mali empire, oral accounts are the principal record of the past. The Belgian historian Jan Vansina, in *Oral Tradition as History* (1985), showed how such traditions can be treated critically: they have genres, transmission chains, and characteristic distortions, such as telescoping long periods into a few generations, just as written sources do. Combined with archaeology and linguistics, oral tradition made possible a scholarly history of precolonial Africa that colonial-era scholars had declared impossible on the grounds that Africa had "no history" because it had few written records. That claim, made notoriously by Hegel and still repeated by the Oxford historian Hugh Trevor-Roper in 1963, said more about the narrowness of the historians' evidence than about the African past.

```checkpoint
q: Why can lead concentrations in Greenland ice serve as evidence for Roman economic history?
a: Romans traded lead with Greenland's inhabitants.
x: There was no Roman contact with Greenland. The connection is atmospheric, not commercial.
a: Lead is a natural marker of volcanic activity, which shaped Roman history.
x: Volcanic eruptions leave their own signatures in ice, chiefly sulphate. The lead signal tracks human metalworking, which is why it rises and falls with the Roman economy.
a*: Smelting silver ores released lead into the atmosphere, which settled in annual ice layers, so the ice records how much smelting took place each year.
a: Roman texts record exactly how much lead reached Greenland.
x: No such texts exist. The value of the ice is precisely that it gives an independent, non-textual record.
hint: Think about what silver production does to the air.
why: Climate proxies turn the physical environment into an archive. Here an unintended by-product of mining, preserved layer by layer in ice, yields a continuous economic series no Roman wrote down.
---
q: What did Jan Vansina's work on oral tradition establish?
a*: That oral traditions can be analysed critically as historical sources, with attention to their genres, transmission, and characteristic distortions.
a: That oral traditions are exact recordings and need no criticism.
x: Vansina argued the opposite: oral sources have systematic distortions, such as telescoping time, and must be criticised like any other source.
a: That oral traditions are myths and cannot be used as historical evidence.
x: This was the colonial-era assumption Vansina helped overturn. His point was that oral sources can be used, provided they are handled with method.
a: That writing is unnecessary for history because memory is more reliable than documents.
x: Vansina did not rank memory above documents. He showed that both are fallible traces that require critical method and benefit from corroboration.
hint: His book's title is Oral Tradition as History.
why: Treating oral tradition as evidence that needs critical handling, rather than as either gospel or fable, opened large parts of the world's past, especially Africa's, to rigorous history.
```

## The Silences of the Archive

If the record is skewed, then what is missing matters as much as what is present. The Haitian anthropologist Michel-Rolph Trouillot made this the subject of *Silencing the Past* (1995), one of the most influential books on historical method of the late twentieth century. Trouillot argued that silences enter history at four distinct moments:

1. **Fact creation**: when sources are made. Some people and events are never recorded at all.
2. **Fact assembly**: when archives are formed. Some records are kept and catalogued; others are discarded.
3. **Fact retrieval**: when narratives are written. Historians choose which records to use.
4. **Retrospective significance**: when a society decides what its history means. Some stories become central and others marginal.

His central example was the Haitian Revolution of 1791–1804, in which enslaved people overthrew French rule and founded the first state in the Americas created by a successful slave revolt. Trouillot argued that for many contemporaries in Europe and North America the revolution was literally *unthinkable*, because it contradicted the assumptions about race and capacity on which the Atlantic world ran. Because it was unthinkable, it was described as something else, such as a riot, a conspiracy, or a tragedy, and for a long time it was then minimised in histories of the "Age of Revolutions" that centred France and the United States.

Historians respond to archival silence in several ways. One is to **read against the grain**: to use records made by the powerful to recover the voices of those they recorded. In *The Cheese and the Worms* (1976), the Italian historian Carlo Ginzburg reconstructed the cosmology of Menocchio, a sixteenth-century miller from Friuli, from the transcripts of the Inquisition that tried him and eventually had him executed. The Inquisitors wanted to convict a heretic; their careful questioning also preserved, at length, the ideas of an ordinary man who would otherwise have left no trace. This kind of close study of a small case to illuminate a whole world is called **microhistory**.

Another response is to acknowledge what cannot be recovered. Writing about enslaved women who appear in the records of the Atlantic slave trade only as names, prices, or entries of death, the historian Saidiya Hartman has asked how a historian can write about people whom the archive registers only at the moment of violence against them. Her answer, which she calls "critical fabulation", openly combines archival research with disciplined speculation and states the limits of the evidence. The approach is debated, but the problem it confronts is not: some silences are permanent, and an honest history says so.

```checkpoint
q: According to Trouillot, at which moment does a silence enter history when an archivist decides that a box of plantation correspondence is not worth cataloguing?
a: Fact creation.
x: The letters were already written, so the records were created. The silence enters later, in deciding what to keep.
a: Fact retrieval.
x: Retrieval is the historian choosing which available records to use. Here the records are being removed before any historian can choose them.
a: Retrospective significance.
x: That is the stage at which a society decides what the past means. The archivist's decision happens earlier and is more mechanical.
a*: Fact assembly.
hint: Trouillot's second moment concerns how archives are built.
why: Fact assembly is the formation of archives. Every decision about what to keep, catalogue, or discard shapes what any future historian can know.
---
q: Carlo Ginzburg used Inquisition trial records to reconstruct the beliefs of the miller Menocchio. Why is this considered "reading against the grain"?
a: Because Ginzburg rejected the trial records as biased and relied on other sources.
x: Ginzburg did the opposite: he relied heavily on the trial records. The point is how he read them, not whether he used them.
a*: Because he used records created to prosecute Menocchio to recover his own worldview, a purpose the record-makers never intended.
a: Because the Inquisition intended its records to celebrate Menocchio's ideas.
x: The Inquisitors intended to convict him of heresy. Ginzburg's insight was to use records whose purpose was hostile.
a: Because he read the documents in reverse chronological order.
x: "Against the grain" is a metaphor about purpose, not about the order of reading.
hint: Ask what the record's makers wanted, and what Ginzburg extracted instead.
why: Reading against the grain means using a source for evidence it was not designed to provide, often the voices of people who appear in it only as the objects of power.
```

## Four Founders: Herodotus, Thucydides, Sima Qian, Ibn Khaldun

Critical history was not invented once. Several traditions arrived independently at the idea that the past should be investigated rather than simply recited, and four early figures are worth knowing as practitioners, not just names.

**Herodotus** of Halicarnassus, writing in the 430s and 420s BCE, opened his account of the wars between Greeks and Persians by calling it a *historiē*, an "inquiry", made "so that the things done by men may not be erased by time". He travelled, interviewed, and compared versions, and he often reported several accounts without choosing between them, sometimes adding that he did not believe one. He has been called both the "father of history" and the "father of lies", and both labels capture something real. He recorded marvels uncritically, but he also wrote one of the first works to treat foreign peoples, Egyptians, Persians, and Scythians, as worth understanding on their own terms.

**Thucydides**, an Athenian general exiled after a military failure, wrote the history of the Peloponnesian War (431–404 BCE) in a deliberately different spirit. He excluded the gods as causes, explained events by human motives and power, and claimed to have checked eyewitness reports against one another. He also admitted that the speeches in his work were reconstructions of "what was called for" in each situation, not verbatim records, an early and honest statement of a source's limits. His distinction between the surface pretexts for the war and its "truest cause", Spartan fear of growing Athenian power, remains a model of causal analysis.

```quote
Thucydides · History of the Peloponnesian War · c. 400 BCE
I have written my work, not as an essay which is to win the applause of the moment, but as a possession for all time.
```

**Sima Qian**, Grand Historian at the Han court, an office that combined astronomy, calendar-keeping, and the archives, completed the *Shiji* (*Records of the Grand Historian*) around 94 BCE, a history of the Chinese world from the legendary Yellow Emperor to his own day. When he defended a disgraced general before Emperor Wu in 99 BCE, he was sentenced to castration, and he chose that humiliation over the honourable suicide expected of him so that he could finish the work. The *Shiji* invented a structure that Chinese historians used for two thousand years: annals of rulers, chronological tables, treatises on institutions such as rites, music, and economy, histories of noble houses, and biographies of individuals of every rank, including merchants, assassins, and jesters. He examined documents and visited sites, and he flagged where his sources conflicted.

```quote
究天人之際，通古今之變，成一家之言
To examine the boundary between Heaven and humanity, to comprehend the changes of past and present, and to complete the words of one school.
Sima Qian · Letter to Ren An · c. 91 BCE
```

**Ibn Khaldun**, a North African statesman and scholar, wrote the *Muqaddimah* (1377) as the introduction to a universal history, and it is arguably the first systematic treatise on historical method. He warned that historians accept reports uncritically through partisanship, overconfidence in their sources, and ignorance of how societies actually work. His remedy was to test every report against what is possible given the nature of human society. He used, for example, the biblical figure of 600,000 Israelite fighting men in the time of Moses, and argued that an army of that size could not have been fielded, supplied, or manoeuvred by such a people in such a territory. He also proposed a theory of history itself: the rise and fall of dynasties driven by *ʿasabiyya*, the group solidarity that lets desert or frontier peoples conquer settled states, and that erodes within a few generations of comfort.

{{image: Ibn Khaldun | Ibn Khaldun (1332–1406), whose Muqaddimah tested historical reports against what was socially and physically possible, an early, systematic statement of critical method.}}

```checkpoint
q: Ibn Khaldun rejected the report that Moses commanded 600,000 fighting men. What principle of historical reasoning was he applying?
a*: That reports should be tested against what is plausible given how societies, armies, and resources actually work.
a: That religious texts can never be used as historical sources.
x: Ibn Khaldun did not reject religious texts as a category. He tested a specific claim against what was possible.
a: That the oldest source on any question is always the most reliable.
x: Age alone does not confer reliability, and Ibn Khaldun was explicitly criticising historians who repeated old reports without examination.
a: That numbers in historical sources should be accepted unless a second source contradicts them.
x: That is close to the uncritical attitude he attacked. He showed that a claim can be rejected on grounds of impossibility even without a contradicting source.
hint: He was asking whether such an army could have been fed and moved.
why: Plausibility testing checks a source against the constraints of the world it describes. Ancient sources often inflate numbers, and logistics are a powerful check.
---
q: Which statement best distinguishes Thucydides' approach from Herodotus'?
a: Herodotus wrote only about Greece, while Thucydides wrote about foreign peoples.
x: It is roughly the reverse: Herodotus devoted long sections to Egypt, Persia, and Scythia, while Thucydides focused narrowly on the war between Greek states.
a: Thucydides recorded speeches word for word, while Herodotus invented them.
x: Thucydides openly said his speeches were reconstructions of what the situation called for, not verbatim records.
a*: Thucydides excluded divine causes and sought to explain events through human motives and power, checking reports against each other.
a: Herodotus never travelled or interviewed anyone.
x: Travel and interviewing were central to Herodotus' method. His weakness was a willingness to report marvels, not a lack of inquiry.
hint: Think about what each writer treats as a cause.
why: Thucydides narrowed history to human causation and rigorously checked testimony. That is why his distinction between pretexts and the deeper cause of the war is still studied.
```

## Ranke's Archives and Carr's Challenge

History became a university discipline in nineteenth-century Germany, and its founding figure is Leopold von Ranke. In the preface to his first book (1824) he wrote that history had been assigned the task of judging the past and instructing the present for the benefit of the future, but that his work aspired only to show *wie es eigentlich gewesen*. The phrase is usually translated "how it actually was", though *eigentlich* in Ranke's German also carries the sense of "essentially". Ranke built his histories on archival documents, especially the confidential reports of Venetian ambassadors, and taught the method in research seminars that trained a generation of professional historians. The **critical use of archival primary sources**, footnotes that let readers check claims, and the seminar as a training ground all spread from German universities to the rest of the world.

The Rankean ideal was often caricatured as the belief that facts speak for themselves. The most famous attack on that belief came from the British historian E. H. Carr, in lectures at Cambridge published as *What is History?* (1961). Carr argued that "facts" in history are not simply given; they become historical facts because historians select them. Millions of people have crossed the Rubicon, he pointed out, but only Caesar's crossing in 49 BCE counts as a historical fact, because historians have decided it matters. The historian is not a passive collector of facts but someone who chooses where to fish and with what tackle. History, Carr concluded, is "an unending dialogue between the present and the past".

```quote
E. H. Carr · What is History? · 1961
The facts are really not at all like fish on the fishmonger's slab. They are like fish swimming about in a vast and sometimes inaccessible ocean; and what the historian catches will depend partly on chance, but mainly on what part of the ocean he chooses to fish in and what tackle he chooses to use.
```

Carr's critics, most prominently Geoffrey Elton in *The Practice of History* (1967), replied that he had made history dangerously subjective, and that disciplined archival work could recover a real past independent of the historian's preferences. The debate between these positions is not settled, but practising historians mostly occupy the ground between them. Selection and interpretation are unavoidable; the evidence nonetheless pushes back, and an interpretation that cannot accommodate the evidence fails.

```checkpoint
q: What was E. H. Carr's main point in noting that millions of people have crossed the Rubicon but only Caesar's crossing is a "historical fact"?
a: That Caesar's crossing is the only one for which documentary evidence survives.
x: Carr's point was not about surviving evidence. Plenty of other crossings may be documented; they are still not treated as historical facts.
a*: That facts become historical because historians select them as significant, so interpretation is present from the start.
a: That historical facts are invented by historians and are therefore unreliable.
x: Carr did not say facts are invented; Caesar did cross the river. He said that which facts count is a matter of the historian's judgement.
a: That ancient history is less reliable than modern history.
x: The example concerns the nature of historical facts in general, not the reliability of any particular period.
hint: Ask what distinguishes Caesar's crossing from everyone else's.
why: Carr argued that the historian's choice of significant facts already involves interpretation, which is why history is a "dialogue between the present and the past".
---
q: Which practice spread from Ranke's seminars and remains standard in historical writing?
a: Writing history mainly to deliver moral lessons for the present.
x: Ranke explicitly distanced himself from the role of judging the past and instructing the present.
a: Relying primarily on earlier chroniclers rather than on documents.
x: Ranke's innovation was the reverse: going behind chroniclers to archival documents produced at the time.
a: Excluding all interpretation from historical writing.
x: Even Ranke interpreted extensively. The lasting legacy is a method of evidence, not the absence of interpretation.
a*: Building accounts on critically examined archival sources, with citations that let readers check the evidence.
hint: Think about what a footnote is for.
why: Ranke's lasting legacy is methodological: archival research, source criticism, and citation, which make historical claims checkable by others.
```

## Who Gets Into History

For most of its existence, written history concentrated on rulers, wars, diplomats, and elites, largely because those were the people documents described. Over the twentieth century, historians repeatedly widened the frame.

The French **Annales school**, named after the journal Marc Bloch and Lucien Febvre founded in 1929, turned attention from events to structures: climate, geography, demography, prices, mentalities. Fernand Braudel's *The Mediterranean and the Mediterranean World in the Age of Philip II* (1949) placed the political events of a king's reign on top of slower cycles of economy and society and, beneath those, the near-motionless *longue durée* of mountains, seas, and climate. Bloch himself, a Jewish veteran of both world wars, wrote his reflections on method, *The Historian's Craft*, while serving in the French Resistance; he was shot by the Gestapo in June 1944 and the book was published unfinished.

**Social history**, "history from below", sought the experience of people who left few records of their own. In *The Making of the English Working Class* (1963), E. P. Thompson set out to rescue "the poor stocking-knitter, the Luddite cropper, the 'obsolete' hand-loom weaver" from "the enormous condescension of posterity". **Women's history** and then **gender history**, formalised in Joan Scott's essay "Gender: A Useful Category of Historical Analysis" (1986), showed that leaving out half the population was not neutral and that ideas about masculinity and femininity shaped politics, work, and war.

In South Asia, the **Subaltern Studies** collective, launched by Ranajit Guha in 1982, challenged both colonial and nationalist histories of India for treating peasants as passive followers of elites. Gayatri Chakravorty Spivak's essay "Can the Subaltern Speak?" (1988) pressed the harder question of whether the voices of the most marginalised can be recovered at all through archives built by their rulers.

**Global history**, which expanded from the 1990s, questioned the nation-state as the natural unit of history and studied connections, comparisons, and flows of goods, people, ideas, and diseases across regions. One of its central debates, the "Great Divergence" set off by Kenneth Pomeranz's 2000 book of that name, asked why industrialisation began in Britain rather than the comparably developed Yangzi delta, a question that could only be posed once Europe stopped being the default measure of normality.

Each widening produced not only new subjects but new methods: parish registers and statistics for social history, court records for women's history, oral history for labour and colonial history, and digital databases, such as the Slave Voyages database of more than 36,000 Atlantic slaving voyages, for global history.

```checkpoint
q: What did Braudel mean by the longue durée?
a*: The slowest layer of historical time, the near-permanent structures of geography and climate that shape human life over centuries.
a: The long reign of a single monarch, such as Philip II.
x: Philip II's reign is the level of political events, the fastest and most superficial layer in Braudel's scheme.
a: A period of prolonged warfare.
x: Wars are events. Braudel's point was that events sit on top of much slower structures.
a: The time it takes for a historical book to become accepted.
x: The term describes historical time itself, not the reception of scholarship.
hint: Braudel layered history by speed of change.
why: Braudel distinguished fast political events, medium-term economic and social cycles, and the slow longue durée of environment, arguing that the slower layers constrain the faster ones.
---
q: What was the central criticism Subaltern Studies made of earlier histories of colonial India?
a: That they gave too little attention to the British viceroys.
x: The viceroys and colonial elites were already the focus of most histories. The collective wanted the reverse.
a: That they relied too heavily on oral sources.
x: The concern was the opposite. Most histories relied on elite documents, which is why peasants appeared only through others' eyes.
a*: That both colonial and nationalist histories treated peasants and other subordinated groups as passive followers rather than as political actors.
a: That they ignored the influence of global trade.
x: Global connections are a concern of global history. Subaltern Studies focused on agency and voice within Indian society.
hint: "Subaltern" means of subordinate rank.
why: Guha and his colleagues argued that elite-centred histories, imperial and nationalist alike, erased the independent politics of subordinated groups.
```

## Cause, Chance, and the Counterfactual

Historians explain as well as describe, and explanation means causation. Most historical events have many causes operating at different levels: long-term **structural** conditions, medium-term **conjunctural** developments, and short-term **triggers**. The assassination of Archduke Franz Ferdinand in Sarajevo in June 1914 triggered the First World War, but no serious account stops there. The alliance system, military planning built around rapid mobilisation, imperial rivalries, and the political pressures inside each government explain why a murder in the Balkans became a continental war within six weeks.

The role of **contingency**, of accident and chance, is a perennial argument. Pascal wrote that if Cleopatra's nose had been shorter, the whole face of the earth would have been changed. Carr took up the challenge with a parable: a man named Robinson, walking to buy cigarettes, is killed by a drunk driver whose brakes were faulty, on a blind corner. Was the cause the drink, the brakes, the corner, or Robinson's smoking? Carr argued that historians, like a coroner's court, look for causes that are *generalisable* and so can explain other cases, such as drunk driving and defective brakes, and treat the cigarettes as accidental. Critics replied that some accidents in history really did matter, and that ruling them out in advance is dogma rather than method.

A disciplined way to weigh causes is the **counterfactual**: asking what would plausibly have happened if one factor had been different. Every causal claim implies one. To say that railways caused American economic growth is to say that growth would have been smaller without them. The economic historian Robert Fogel made the implication explicit in *Railroads and American Economic Growth* (1964), estimating what it would have cost to move the same freight by canal, river, and wagon in 1890. He concluded that the railways' contribution, the "social saving", amounted to only a few per cent of national income, far less than the conventional view held. The method helped earn him a share of the 1993 Nobel Prize in economics. Counterfactuals are useful when they change one variable, stay close to options people actually considered at the time, and are bounded by evidence. They become fantasy when they pile speculation on speculation.

```checkpoint
q: A historian claims the printing press "caused" the Protestant Reformation. What counterfactual does this claim implicitly make?
a: That the Reformation would have happened earlier without printing.
x: That would imply printing delayed the Reformation, the opposite of the claim.
a: That printing would not have been invented without the Reformation.
x: This reverses the direction of causation. Printing (c. 1450) came before Luther's protest (1517).
a: No counterfactual at all, because the claim simply describes what happened.
x: Every causal claim implies a counterfactual. Saying X caused Y means things would have gone differently without X.
a*: That without printing, the Reformation would not have happened, or would have been much more limited, in the way it did.
hint: To say X caused Y is to say something about a world without X.
why: Making the implied counterfactual explicit, asking whether earlier reform movements without print had failed to spread, is the way to test whether a causal claim holds up.
---
q: Which counterfactual question would most historians consider legitimate?
a: What if the Roman Empire had possessed machine guns?
x: This changes so much at once, inserting a technology centuries out of reach, that no evidence can constrain the answer.
a*: What if Britain had stayed neutral in August 1914, an option its cabinet actually debated?
a: What if Napoleon had been born in China?
x: This removes the whole context that made Napoleon's career possible. It is speculation, not analysis.
a: What if the Black Death had never existed and humans had been immune to all disease?
x: Changing human biology entirely abandons the real historical world; nothing can be tested.
hint: Good counterfactuals change one thing and stay close to options available at the time.
why: A plausible counterfactual alters a single variable that contemporaries really considered, so evidence about the actors and circumstances can discipline the answer.
```

## Periodization: Every Map of Time Is an Argument

Historians divide the past into periods, such as "ancient", "medieval", "early modern", and "modern", and it is easy to forget that these divisions are made by people for particular purposes. The idea of a "middle age" was coined by Italian humanists of the fourteenth and fifteenth centuries, beginning with Petrarch's image of a dark age, who saw themselves as reviving classical antiquity after a long decline. The label was a boast about their own era before it was a description of the previous one. "The Renaissance" as the name of a period was popularised in the nineteenth century by Jules Michelet (1855) and Jacob Burckhardt (1860). Neither label fits most of the world. The centuries Europe calls "medieval" coincide with the Tang and Song in China, among the most dynamic periods in Chinese history, and with the height of the Abbasid caliphate.

Calendars are periodizations too. Dating years from the birth of Christ (now often written BCE/CE, "before the Common Era" and "Common Era") is one convention among many. The Islamic calendar counts from Muhammad's migration to Medina in 622 CE; Chinese historians for two thousand years dated events by the reign years of emperors; the French revolutionaries restarted time at Year I in 1792 to mark a new era. Each choice embeds a judgement about where significance begins.

Periodization shapes conclusions. Ending the story of Rome in 476 CE makes "the fall of Rome" a western European catastrophe; continuing it to 1453 with the eastern Roman Empire, as this course does in its chapter on Byzantium, turns it into a slower transformation. Grouping the past by century can manufacture turning points that contemporaries would not recognise. Good historians use periods as tools and say why they chose them.

```checkpoint
q: Why do historians describe the term "Middle Ages" as an argument rather than a neutral description?
a*: Because it was coined by Renaissance humanists who cast the preceding centuries as a dark interval between classical antiquity and their own revival.
a: Because historians disagree about the exact date the Middle Ages began.
x: Disputes over boundary dates are real, but the deeper point concerns where the term came from and what it implied.
a: Because the period is too short to count as an age.
x: The period usually spans about a thousand years. Its length is not what makes the label contentious.
a: Because medieval people called their own era the Middle Ages, and modern historians reject self-descriptions.
x: Medieval people did not think of themselves as living in a "middle" age; that label was applied afterwards.
hint: Ask who invented the term and what they believed about their own time.
why: The label carries the humanists' self-flattering judgement that their era restored something lost, a judgement modern scholarship has largely abandoned.
---
q: A textbook ends its chapter on Rome in 476 CE. What effect does this periodization choice have?
a: None, since 476 CE is a universally agreed date for Rome's end.
x: 476 marks the deposition of the last western emperor, but the Roman Empire continued in the east for nearly another thousand years.
a*: It frames Roman history as ending in a western collapse and sets aside the continuing eastern Roman Empire, which lasted to 1453.
a: It shows that the eastern empire was never Roman.
x: The eastern empire's people called themselves Romans throughout. Excluding it is a choice about the narrative, not a fact about identity.
a: It proves the empire fell because of invasions.
x: A chapter break cannot prove a cause. It does, however, shape which causes readers are inclined to look for.
hint: What happened to the Roman Empire in the east after 476?
why: Where a story is cut determines its shape. A 476 ending tells a story of collapse; a 1453 ending tells one of transformation and survival.
```

## Can History Be Objective?

If historians select facts, ask questions shaped by their own time, and work from biased and incomplete sources, can history be objective? The American historian Peter Novick traced the profession's long argument over this question in *That Noble Dream* (1988), whose title comes from Charles Beard's description of objectivity as a "noble dream". In the 1970s and 1980s, the strongest challenge came from literary theory. Hayden White's *Metahistory* (1973) argued that historians inevitably shape their material into stories with plots, such as tragedy, comedy, romance, or satire, and that the choice of plot is a literary and ideological decision that the evidence does not dictate.

These arguments have real force: the same evidence can support different narratives, and all historians write from a perspective. But they faced a hard test in a London courtroom in 2000. The writer David Irving sued the American historian Deborah Lipstadt and her publisher for libel after she described him as a Holocaust denier. The defence, led on the historical evidence by the Cambridge historian Richard Evans, traced Irving's footnotes back to the original documents and showed repeated misquotation, mistranslation, and selective omission, always in the direction of exonerating Hitler. The judge ruled that Irving had "persistently and deliberately misrepresented and manipulated historical evidence". The case did not decide whether history is objective in some absolute sense. It showed that historical claims are **accountable to evidence**, that the accountability can be checked by others, and that some accounts are not merely different perspectives but are demonstrably false.

The working position of most historians can be summarised in three statements. First, perspective is unavoidable, and should be acknowledged rather than hidden. Second, the evidence constrains what can honestly be said: interpretations compete, but within limits, and some are better supported than others. Third, history is cumulative and self-correcting through a public process of citation, review, and debate, so that errors, including errors driven by bias, are caught over time. Objectivity, in this sense, is less a property of an individual historian than of a discipline whose claims can be checked.

```checkpoint
q: What did the Irving v. Lipstadt trial demonstrate about historical knowledge?
a: That courts, rather than historians, are the final judges of historical truth.
x: The court ruled on libel, not on history as such. Its judgement rested on the historians' demonstration of how Irving had treated the evidence.
a: That because all history involves perspective, Irving's account was as valid as any other.
x: This is the relativist position the trial refuted. Tracing the footnotes showed manipulation, not a legitimate alternative perspective.
a*: That historical claims are accountable to evidence, and checking sources can show that an account is demonstrably false.
a: That the Holocaust can only be proved by eyewitness testimony.
x: The case rested on documentary evidence and Irving's misuse of it, not on a claim that testimony was the only proof.
hint: What did Richard Evans actually do with Irving's footnotes?
why: The defence followed citations back to the documents and exposed systematic distortion. Interpretations may differ, but they must survive contact with the sources.
---
q: Which statement best describes the working position most historians take on objectivity?
a: Historians can achieve perfect neutrality by excluding their own opinions.
x: Perspective cannot be fully excluded; even the choice of topic and question reflects the historian's position.
a: Since perspective is unavoidable, all interpretations are equally valid.
x: That conclusion does not follow. Unavoidable perspective is compatible with some accounts being far better supported than others.
a: Objectivity is achieved only by quantitative history.
x: Numbers involve choices too, about what to count and how. Quantitative methods are powerful but do not escape interpretation.
a*: Perspective is unavoidable, but evidence constrains interpretation and the discipline corrects errors through public scrutiny.
hint: The answer combines an admission with a constraint.
why: Historians acknowledge their standpoint while holding claims accountable to sources that others can check, a collective rather than individual form of objectivity.
```

## Reading Historical Claims in the Wild

Most historical claims people meet arrive not in monographs but in social media posts, speeches, films, and conversation. The methods in this chapter scale down to them.

Popular myths about the past usually have a traceable origin. Napoleon was not unusually short. His height was recorded as five feet two inches in *French* units, roughly 1.69 metres or about five feet seven in English measure, average or slightly above for a Frenchman of his time; the myth combined a units confusion with British caricature. Vikings did not wear horned helmets. The image owes much to nineteenth-century romanticism, especially the costumes for the first full production of Wagner's *Ring* cycle in 1876, and no horned helmet has been found in a Viking-age burial. Educated medieval Europeans did not think the earth was flat; that myth was popularised in the nineteenth century, partly by Washington Irving's 1828 biography of Columbus. Each case shows the same pattern: a later era projecting a story onto an earlier one, then repeating it until it seemed self-evident.

Research on how people evaluate information online has shown that professional fact-checkers outperform even historians and students at spotting unreliable sources, and the main reason is a habit called **lateral reading**. Instead of studying a website closely, they leave it quickly and check what other sources say about it and its claims. The historical version of the method is the source criticism already described, applied fast:

- **Find the source.** Where does the claim come from? A quotation with no work and date attached is a warning sign; misattributed quotations are among the most common historical errors online.
- **Check provenance.** Who made this, when, and why? A "historical photograph" may be staged, cropped, or from a different event.
- **Look for corroboration.** Do independent sources agree, or are they all copying one origin?
- **Watch for anachronism.** Does the claim use concepts, words, or values that the people involved could not have held?
- **Ask what is missing.** Whose perspective does the story leave out, and would it change the picture?
- **Prefer the claim that fits the evidence, not the one that fits the story.** The most satisfying narrative is not more likely to be true; it is more likely to be repeated.

The educational psychologist Sam Wineburg titled one of his books *Historical Thinking and Other Unnatural Acts* (2001). The title states the problem and the reason to work at it. Thinking historically does not come naturally, because it requires holding back from both the assumption that people in the past were just like us and the assumption that they were simply wrong. It is a skill, and, like any skill, it improves with practice. Every chapter that follows in this subject is an exercise in it.

```checkpoint
q: A viral post quotes Winston Churchill on a modern political issue, with no source given. What is the best first step?
a*: Look for the original source, the work, speech, or letter and its date, using reliable references, before accepting or sharing it.
a: Accept it, since Churchill was known for memorable sayings.
x: Churchill is among the most frequently misquoted figures precisely because his reputation makes invented quotations believable.
a: Reject it outright, since all online quotations are fake.
x: Blanket rejection is as uncritical as blanket acceptance. Many quotations are genuine; the task is to check.
a: Check how many times it has been shared, since popularity indicates reliability.
x: Repetition is not corroboration. Thousands of shares can all trace back to one fabricated origin.
hint: Apply the first question of source criticism.
why: A quotation without provenance is an unverified trace. Finding the original document, or failing to, settles most such cases quickly.
---
q: What explains why the myth that Napoleon was very short became widespread?
a: French records deliberately understated his height for propaganda purposes.
x: There was no motive to make an emperor seem short. The confusion was about units and was amplified by his enemies.
a: Contemporary eyewitnesses all agreed he was unusually short.
x: Contemporaries did not generally describe him as unusually short; the myth rests on later misreading and satire.
a*: His recorded height in French units was misread as English measure, and British caricaturists reinforced the image.
a: Modern historians have never established his height.
x: His height is reasonably well established at about 1.69 metres. The myth persists despite the evidence, not for lack of it.
hint: A French inch (pouce) was longer than an English inch.
why: The myth combines a units error, a reading of the evidence out of its original context, with hostile caricature, a source with an obvious motive. Both are classic targets of source criticism.
```

## Further exploration

- **E. H. Carr, *What is History?* (1961).** The most widely read short book on the nature of history, still provocative more than sixty years on.
- **Marc Bloch, *The Historian's Craft* (written 1941–43, published 1949).** An unfinished, humane reflection on method by a historian who died in the Resistance.
- **Michel-Rolph Trouillot, *Silencing the Past: Power and the Production of History* (1995).** On how power shapes what enters the record, with the Haitian Revolution as its central case.
- **Richard J. Evans, *In Defence of History* (1997).** A reply to postmodern scepticism by the historian who later exposed David Irving's methods in court.
- **Carlo Ginzburg, *The Cheese and the Worms* (1976).** The classic microhistory, reconstructing a miller's cosmos from Inquisition records.
- **Ibn Khaldun, *The Muqaddimah* (1377), trans. Franz Rosenthal, abridged ed. N. J. Dawood.** The fourteenth-century foundation of critical historical method.
- **Jan Vansina, *Oral Tradition as History* (1985).** How to use unwritten sources rigorously.
- **Peter Novick, *That Noble Dream: The "Objectivity Question" and the American Historical Profession* (1988).** The history of the profession's argument with itself.
- **Sam Wineburg, *Why Learn History (When It's Already on Your Phone)* (2018).** Historical thinking and lateral reading applied to the information age.$wih_master$,
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
  select $wih_quiz$[
    {"id": "q1", "type": "mcq", "prompt": "Which statement best captures the chapter's distinction between 'the past' and 'history'?", "options": ["History is a complete record of the past kept in official archives", "The past is everything that happened; history is a reasoned account built from the traces that survive", "History is the past as remembered by those who lived through it", "The past is what historians write; history is what actually happened"], "answerIndex": 1, "explanation": "The past is gone and cannot be observed. History is the disciplined inference from surviving traces, which is why it is always partial and always open to revision."},
    {"id": "q2", "type": "mcq", "prompt": "Why did the 1983 'Hitler diaries' fail, even though a leading historian had initially vouched for them?", "options": ["Their handwriting matched Hitler's too perfectly", "Forensic analysis found materials in the paper and bindings that were not made until after 1945", "Hitler's family testified that he never kept a diary", "They contradicted the official Nazi newspaper"], "answerIndex": 1, "explanation": "External criticism, testing whether a document is what it claims to be, settled the case: the materials post-dated Hitler's death. Authentication has to come before interpretation."},
    {"id": "q3", "type": "mcq", "prompt": "Michel-Rolph Trouillot argued that the Haitian Revolution was long minimised in Western histories mainly because:", "options": ["Few documents about it were ever produced", "It was 'unthinkable' to many contemporaries, whose assumptions about race made a successful slave revolution hard to recognise for what it was", "It had no lasting consequences", "Haitian archives were closed to historians until 1990"], "answerIndex": 1, "explanation": "Trouillot's point is that silences are produced by power at several stages, from how events were described at the time to which stories later histories made central."},
    {"id": "q4", "type": "mcq", "prompt": "Ibn Khaldun's critique of the report that Moses led 600,000 fighting men is an early example of:", "options": ["Testing a report against what is possible given how societies and logistics actually work", "Rejecting all religious texts as sources", "Preferring oral tradition to written sources", "Counting the number of sources that repeat a claim"], "answerIndex": 0, "explanation": "Plausibility testing checks a source's claims against the constraints of the world it describes, which is still a basic tool, especially for inflated numbers in ancient sources."},
    {"id": "q5", "type": "open", "prompt": "E. H. Carr argued that historians select which facts count as 'historical facts'. Geoffrey Elton replied that this made history dangerously subjective. Using an example from the chapter, explain where most practising historians stand between these positions, and why.", "rubric": "A strong answer explains Carr's argument (facts become historical through selection; the Rubicon example; history as dialogue between present and past) and Elton's objection (disciplined archival work recovers a real past). It then describes the middle position: selection and perspective are unavoidable, but evidence constrains interpretation, and claims are checkable by others. It supports this with an example, ideally Irving v. Lipstadt, where tracing footnotes to documents showed that an account was not a legitimate perspective but a manipulation of evidence; or the Donation of Constantine or Hitler diaries, where evidence decisively settled a question regardless of anyone's preferences."},
    {"id": "q6", "type": "open", "prompt": "Choose a widely repeated claim about the past, such as one from the chapter or one of your own, and show step by step how you would test it using the methods of source criticism and lateral reading.", "rubric": "A strong answer names a specific claim and applies most of the chapter's checklist: locating the original source and its date; examining provenance (who made it, when, why, for whom); seeking independent corroboration and checking whether apparent agreement traces to a single origin; watching for anachronism; asking what perspectives are missing; and distinguishing the most satisfying story from the best-supported one. Better answers explain what result at each step would raise or lower confidence, and note the difference between debunking (showing a claim is false) and finding the claim unverifiable."}
  ]$wih_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/what-is-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
