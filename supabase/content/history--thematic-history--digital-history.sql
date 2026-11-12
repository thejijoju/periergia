-- Digital History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/digital-history @ research/advanced/read.
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
    'history/thematic-history/digital-history',
    'research',
    'advanced',
    'read',
    $mn_digihist_master$> **History at the keyboard.** Digital history is the use of digital media to further historical research, analysis and presentation. Its usual creation story begins with a Jesuit's concordance of Thomas Aquinas, punched onto cards by a team of Italian women; another root lies in social historians counting censuses by computer. With the web it grew into online archives, databases of the slave trade and of London's criminal courts, maps, networks of letters, crowdsourced transcription and archives of the web itself. This chapter traces where the field came from, shows how it is done through worked examples from Europe, Africa, Asia, Australia and the Americas, and sets out its debates: who gets digitised, how search and OCR bend what historians see, whether projects can last, who controls Indigenous knowledge, and what machine learning can and cannot do.

## What Digital History Is

Digital history is usually described as a branch of the digital humanities and an extension of quantitative history. It has two broad sides. **Digital public history** brings the past to online audiences through digital archives, exhibits, interactive maps, timelines, audio and virtual worlds. **Digital research methods** include databases, text mining, network analysis, 3D modelling and the analysis of very large bodies of data. Most projects do both: a database built to answer one historian's question becomes, once published, a resource for many others.

The wider field once had a plainer name, **humanities computing**. The switch to "digital humanities" is credited to the editors of *A Companion to Digital Humanities* (2004), John Unsworth, Susan Schreibman and Ray Siemens, who wanted to stop the field being seen as "mere digitization". That worry runs through the whole story: scanning a document is not the same as understanding it. The technology itself, from ENIAC to ARPANET and the World Wide Web, is told in the chapter on Technological Advancements and the Digital Age; this chapter is about what historians did with it.

## Roots: Busa, the Keypunch Operators and the Counters

The usual creation story begins with **Roberto Busa** (1913–2011), an Italian Jesuit born in Vicenza. In 1946 he planned the *Index Thomisticus*, a complete lemmatised concordance of the works of Thomas Aquinas, with every word sorted under its dictionary form. In 1949 he met Thomas J. Watson, the head of IBM, and persuaded him to sponsor it; IBM agreed to back the project until it was finished. The index covered 179 texts and 10,631,980 words over about 34 years, first on punched cards and later on about 1,500 kilometres of tape, at an estimated cost of 10,000 hours of computer time and a million hours of human work. Its 56 printed volumes appeared between 1974 and 1980. In 2020 *The Economist* called the project "the creation story of the digital humanities".

{{image: Roberto Busa | Roberto Busa standing in front of the printed volumes of his Index Thomisticus.}}

Creation stories leave people out. The text was punched onto cards from the 1950s to the late 1960s by a team of **women keypunch operators** in Gallarate, Italy, with 70 workers at the peak in 1962. Julianne Nyhan's *Hidden and Devalued Feminized Labour in the Digital Humanities* (2023) recovers their story; as her title says, their labour was hidden and devalued, while the scholar and the corporation were remembered.

A second root lay in social history. In the 1960s and 1970s **quantitative historians** used computers mainly on censuses, election returns and city directories. A key technique was "nominal record linkage", matching one person's name across censuses, directories and other lists to rebuild ordinary lives. Economic historians developed **cliometrics**, a term coined in 1960; Fogel and North shared the Nobel prize in economics in 1993. The chapter on Social History tells how this computer analysis of censuses grew out of social history, and how *Time on the Cross* provoked a bitter argument about counting slavery, so that story is not repeated here. In the late 1980s quantifiers founded the Association for History and Computing, which helped drive digital history's rise in the 1990s.

## The Web Era: Centres, CD-ROMs and Rosenzweig

At the University of Virginia, Edward L. Ayers conceived **The Valley of the Shadow** in 1991, comparing Augusta County in Virginia with Franklin County in Pennsylvania through the American Civil War. In 1997 Ayers and William G. Thomas III used the term "digital history" when they founded the Virginia Center for Digital History, the earliest centre devoted exclusively to history. Their article "The Differences Slavery Made" (2003), which used XML and GIS, was published both online and in the *American Historical Review*.

**Roy Rosenzweig** (1950–2007) founded the **Center for History and New Media** at George Mason University in 1994 and directed it until his death; in 2011 it was renamed after him. In the centre's own description, its aim was to use digital media "to democratize history": to include many voices, reach diverse audiences and encourage popular participation in presenting and preserving the past. It built the reference manager **Zotero** and **Omeka** (2008), made so that collecting websites need not be built from scratch each time. With the American Social History Project it built the **September 11 Digital Archive**, more than 150,000 first-hand accounts, emails, images and other materials, which became the Library of Congress's first major digital acquisition.

Rosenzweig and Daniel J. Cohen wrote the field's practical handbook, *Digital History: A Guide to Gathering, Preserving, and Presenting the Past on the Web*, released in 2005 though dated 2006. Rosenzweig's 2003 essay "Scarcity or Abundance?" framed a problem that has only grown: historians, he argued, faced an unprecedented abundance of records and at the same time the danger of losing born-digital ones, so that the long-established system of preserving the past was in crisis.

## Mass Digitisation, and Its Unequal Map

From the early 2000s digitisation became an industry. **Google Books**, begun in secret in 2002 and launched in 2004, and by 2019 Google said it had scanned more than 40 million titles; authors sued in 2005, and the American courts ruled for Google on grounds of fair use in 2013, a verdict upheld on appeal in 2015. University libraries founded **HathiTrust** in 2008 ("hathi" is Hindi for elephant, an animal known for its memory). Newspapers followed, among them Chronicling America in the United States and **Trove** at the National Library of Australia, whose readers have corrected the machine-read text of digitised newspapers themselves, some volunteers fixing millions of lines.

Mass digitisation was political from the start. Critics in Europe, among them Jean-Noël Jeanneney, accused Google Books of a kind of linguistic imperialism, since English dominated it, and European governments backed **Europeana**, which by 2024 gave access to records of more than 50 million objects from over 3,000 institutions. Copyright shapes who can read what: HathiTrust restricts readers outside the United States from works published outside the US from 1896 onwards, so a scan open to a reader in Michigan may be closed to a reader elsewhere.

Beyond Europe and North America the picture is uneven, and some of the most interesting work answers that unevenness. The **Chinese Text Project**, launched by Donald Sturgeon in 2005, holds about 5.7 million characters of pre-Qin and Han texts and over 20 million from later periods. The **Qatar Digital Library** (2014), a partnership of Qatari institutions and the British Library, put some 475,000 pages, at its launch, of India Office Records on the Gulf online in English and Arabic: colonial records held in London made freely available to the region they describe.

The British Library's **Endangered Archives Programme**, funded by the Arcadia Fund since 2004, digitises threatened archives *in situ*: the originals stay in their country, and projects often train local staff. By 2019 it had funded over 400 projects, and its collections hold more than 7 million images and 25,000 sound files from Africa, Asia, the Americas and the Caribbean, Russia and Eastern Europe, from magical texts in Djenné, Mali, to Sri Lankan palm-leaf manuscripts and Shui manuscripts from Guizhou in China. The **Timbuktu manuscripts** show why such work matters. The University of Oslo's Timbuktu Manuscripts Project worked to preserve, digitise and catalogue them from 1999 to 2007. During the Mali War of 2012–13, 4,203 manuscripts were burned or stolen and some 350,000 moved to safety; from 2013 the Hill Museum & Manuscript Library, working with SAVAMA-DCI, photographed more than 150,000.

## Worked Examples: Databases, Texts, Maps and Networks

**SlaveVoyages.** In 1990 David Eltis and Stephen Behrendt were separately collecting British slaving data at the Public Record Office in London. With David Richardson and Herbert S. Klein, their work was published by Cambridge University Press in 1999 as a CD-ROM of 27,233 voyages. In December 2008 it was relaunched as a free website, *Voyages: The Trans-Atlantic Slave Trade Database*, covering nearly 35,000 voyages from 1501 to 1867, about four-fifths of the whole trade. What it shows about the trade's scale is set out in the chapter on The Atlantic Slave Trade, and the chapter on Atlantic Slave Wars shows the kind of question it makes answerable: how often captives rose against their captors at sea.

**Old Bailey Online.** Launched in 2003 and later extended to the full run, the *Old Bailey Proceedings Online*, edited by Tim Hitchcock and Robert Shoemaker, made searchable every surviving edition of the printed proceedings of London's central criminal court from 1674 to 1913, over 197,000 trials. The Arts and Humanities Research Council, which funded its second phase, calls it the largest single source of searchable information about ordinary British lives and behaviour ever published; the chapter on Social History places it within history from below.

**The China Biographical Database.** Begun by Robert M. Hartwell to study the networks of Song officials, its recent releases hold some 650,000 people from the seventh to the nineteenth centuries, and is run jointly by Harvard, Academia Sinica and Peking University. Its makers state its limits plainly: career data lean towards higher offices, and errors in the sources pass into the database.

**Distant reading and topic modelling.** In "Conjectures on World Literature" (2000), Franco Moretti contrasted the close reading of a small canon with the mass of what Margaret Cohen called "the great unread". He first meant "distant reading" as a way of working from other scholars' research; only later did the phrase come to mean computer analysis of the texts themselves. In "Style, Inc." he studied the titles of about 7,000 British novels from 1740 to 1850 and showed that they grew shorter. Ted Underwood argues that the approach is older than computers, going back to Raymond Williams and Janice Radway.

```quote
Distant reading: where distance, let me repeat it, is a condition of knowledge.
Franco Moretti · "Conjectures on World Literature" · 2000
```

**Topic modelling** groups words that tend to occur together across thousands of documents; the method known as latent Dirichlet allocation was introduced to text analysis in 2003, and an early historical use traced topics in the *Pennsylvania Gazette* from 1728 to 1800. Such methods can also recover absences. Lauren Klein used computational methods on Thomas Jefferson's papers to trace James Hemings, Jefferson's enslaved chef, and the silences in the archive of slavery.

**Spatial history.** A historical geographic information system (GIS) stores and analyses past geographies, by georeferencing old maps onto modern ones or mapping census and parish records; examples include the Great Britain Historical GIS and the Harvard and Fudan University China Historical GIS. Stanford's **Spatial History Project**, founded in 2007 with Richard White as its founding director, mapped how railroads reshaped people's experience of space and time, work that fed into his book *Railroaded* (2011).

**Networks.** Stanford's **Mapping the Republic of Letters**, begun in 2008, drew on about 55,000 letters among about 6,400 correspondents of the early modern scholarly world. Its maps showed Voltaire's network to be strongly centred on France and Locke's on the British Isles. They also showed the limits of data: under 12 per cent of Voltaire's roughly 19,000 letters could be mapped, because many lacked location data.

```checkpoint
q: What was distinctive about how the Index Thomisticus was actually made?
a*: Its text was punched onto cards from the 1950s to the late 1960s by a team of women keypunch operators in Gallarate, whose story Julianne Nyhan has recovered.
a: Roberto Busa typed the whole text in himself.
x: Busa did not do the data entry; the text was punched onto cards by a team of operators.
a: It was produced by volunteers over the internet, like Transcribe Bentham.
x: Online crowdsourcing came decades later; Transcribe Bentham launched in 2010.
a: It was funded by the Italian government after IBM refused to take part.
x: IBM's founder, Thomas J. Watson, agreed in 1949 to sponsor the project until it was finished.
hint: Think about who did the data entry.
why: The creation story of the digital humanities usually remembers the scholar and the corporation, but the work depended on women whose labour was undervalued.
---
q: What did Franco Moretti first mean by "distant reading"?
a: Reading historical documents through a telescope or microscope.
x: The phrase is a metaphor about scale, not about optical instruments.
a: Reading only the works of the literary canon very carefully.
x: That is close reading, which Moretti contrasted with distant reading.
a*: Working from other scholars' research to study literature at a scale no one could read, a sense later extended to computer analysis of texts.
a: Using machine translation to read literatures in other languages.
x: Moretti's original sense did not involve computers at all.
hint: The computer came later.
why: The original meaning shows that the ambition of distant reading came before the tools now associated with it.
```

## Many Hands: Crowdsourcing and Public History

Some of the most important digital history is done by volunteers. **Transcribe Bentham**, launched by University College London's Bentham Project in 2010, invites anyone to transcribe Jeremy Bentham's manuscripts, about 85,000 pages at UCL alone. Volunteers have worked on tens of thousands of pages, feeding the scholarly edition of his collected works.

Crowdsourcing can also gather memories. The **1947 Partition Archive**, founded by Guneeta Singh Bhalla, who began recording interviews in 2010, trains volunteer "Citizen Historians" to record the oral histories of people who lived through the partition of India. By 2025 it held over 12,000 interviews from more than 450 cities and villages in 14 countries, including India, Pakistan and Bangladesh, with full access restricted because of their sensitivity. The chapter on Partition and its Consequences: Ireland, India, Palestine tells the history those voices remember.

## Born-Digital Sources and the Archive of Our Own Time

Historians of recent decades face sources that were never on paper. "Born-digital" material originates in digital form, unlike a scan of an old letter. Brewster Kahle founded the **Internet Archive** in 1996, with the mission of "universal access to all knowledge"; its web captures sat on tape until the **Wayback Machine** opened to the public in October 2001, already holding over 10 billion pages. In October 2025 the Archive celebrated its first trillion archived web pages.

These archives are fragile. The Internet Archive lost a lawsuit brought by publishers in 2023, and in 2024 cyberattacks and a data breach briefly took the Wayback Machine offline. By early 2026 some news organisations, including *The Guardian* and *The New York Times*, had begun blocking it over concerns about AI scraping. Formats decay too. The BBC's Domesday Project of 1986, a survey of the United Kingdom made 900 years after the Domesday Book, was stored on LaserDisc; the discs became hard to read and were rescued by emulation from 2002, while the Domesday Book of 1086 is still legible. In 2015 Vint Cerf warned that future historians might be unable to read today's digital records.

## Machines That Read

Optical character recognition (OCR), which turns printed pages into searchable text, underlies mass digitisation. Handwriting is harder. **Transkribus**, developed at the University of Innsbruck out of European Union research projects and run since 2019 by READ-COOP, a non-profit cooperative, is a platform for recognising text, including handwriting, in historical documents; the National Archives of Finland used it to make more than three million handwritten pages of court records full-text searchable.

The most dramatic case is the **Vesuvius Challenge**. More than 1,800 papyrus scrolls were carbonised by the eruption of Vesuvius in 79 CE and found from 1752 in the Villa of the Papyri at Herculaneum; many hold works of the Epicurean philosopher Philodemus. Brent Seales of the University of Kentucky had used "virtual unrolling" on Herculaneum material in 2018. In 2023 he, Nat Friedman and Daniel Gross announced a prize competition. That October Luke Farritor, a 21-year-old University of Nebraska student, won \$40,000 for detecting the first word in an unopened scroll: *porphyras*, "purple". In February 2024 the Grand Prize went to Youssef Nader, Luke Farritor and Julian Schilliger, who recovered more than 2,000 characters in 15 columns, about 5 per cent of one scroll: previously unknown text, probably by Philodemus, on pleasures such as music and food. In June 2026 the team announced, in a preprint, the first complete virtual reading of a rolled scroll, reported to contain 22 columns of a Stoic treatise possibly by Chrysippus.

## Debates

**Who gets digitised.** In 2012 Matthew K. Gold summarised criticisms of the digital humanities, among them inattention to race, class, gender and sexuality, little diversity among practitioners, and concentration in well-funded research universities. Critics speak of **digital colonialism**, in which powerful states and corporations build infrastructure in the Global South and extract its data, and Roopika Risam's postcolonial digital humanities examines colonial violence in digital archives. Others point to models that change the terms: in-situ digitisation with local training, as in the Endangered Archives Programme, and open access to colonial records for the regions they concern, as in the Qatar Digital Library.

**What search hides.** Tim Hitchcock argued in 2013 that algorithmic discovery, misleading search, poor OCR and the selection bias of digitised print had led historians to keep the forms of scholarship while ignoring its principles. Lara Putnam (2016) argued that keyword search lets historians trace transnational connections without the local knowledge that archive visits once demanded, and she urged caution about what such search leaves out.

**The limits of counting and seeing.** Johanna Drucker argues that data should be rethought as "capta, taken and constructed", and that visualisations wrongly present interpreted material as neutral data. Stanley Fish criticised a method in which "first you run the numbers, and then you see if they prompt an interpretive hypothesis". Jo Guldi's *The Dangerous Art of Text Mining* (2023) replies from inside the field: textual data from the past is dangerous because records are occluded and biased, unless historians bring critical reading to them. Practitioners still argue, too, over what counts as a scholarly argument when the output is a database or a map rather than an article.

**Can projects last?** The *Index Thomisticus* survived by moving from cards to print, to CD-ROM, to a website in 2005 and a new site in 2026. Others did not: Stanford's Spatial History Project was active from 2007 to 2022 and now survives only as a static copy of its website. In 2021 the Rosenzweig Center announced that Zotero, Omeka and Tropy were moving entirely to a separate body, the Corporation for Digital Scholarship.

**Indigenous data sovereignty.** Open access is not always right. **Mukurtu**, designed in 2007 for the Warumungu people of Australia's Northern Territory, and developed by the anthropologist Kimberly Christen with the community, takes its name from the Warumungu word for a dilly bag, a bag for keeping things safe. It lets communities control access by cultural protocol: for example, so that family members may not view images of deceased relatives. The Passamaquoddy used it to repatriate wax-cylinder recordings made in 1890. The **CARE principles** of 2019 (Collective Benefit, Authority to Control, Responsibility, Ethics) set Indigenous governance of data alongside the familiar demand that data be findable, accessible, interoperable and reusable.

**Artificial intelligence.** Handwriting recognition and the Herculaneum scrolls show machine learning extending what historians can read. Generative AI raises sharper worries. In 2025 the American Historical Association approved guiding principles for AI in history education, warning that its output may be false unless verified, and that imitation of historians' work should not be mistaken for teaching or learning. The tools change what is possible, but weighing sources remains the historian's task, as the chapter on What is History? explains.

```checkpoint
q: Why did Lara Putnam argue that keyword search changes what historians see?
a: Because search engines delete documents that contain no keywords.
x: Nothing is deleted; the point is about which material is easiest to find and which people appear in it.
a*: Because it lets historians make connections across borders without the local, place-based knowledge that archive visits once demanded.
a: Because digitised newspapers are less accurate than manuscripts.
x: Her argument concerns visibility and context, not the accuracy of newspapers as such.
a: Because it makes transnational history impossible.
x: She argued the opposite: search makes transnational connections easier to find.
hint: Think about who appears in digitised newspapers and who does not.
why: Digitisation changes not just access but the shape of the evidence that historians notice.
---
q: What does Mukurtu allow Indigenous communities to do?
a: Sell their recordings to commercial archives.
x: It was built for community control of access, not for sale.
a: Publish everything openly under the FAIR principles alone.
x: Mukurtu exists because complete openness can breach cultural protocols.
a: Translate archives automatically into English.
x: It manages access and metadata; it is not a translation tool.
a*: Control access to digital heritage according to their own cultural protocols, such as restricting images of deceased relatives.
hint: Its name is the Warumungu word for a dilly bag.
why: Mukurtu shows that the right answer for some material is not open access but community control.
```

## Further exploration

- **Daniel J. Cohen and Roy Rosenzweig, *Digital History: A Guide to Gathering, Preserving, and Presenting the Past on the Web* (2005; dated 2006).** The founding practical handbook, free online.
- **Roy Rosenzweig, *Clio Wired: The Future of the Past in the Digital Age* (2011).** His essays on abundance, scarcity and the web.
- **Shawn Graham, Ian Milligan and Scott Weingart, *Exploring Big Historical Data: The Historian's Macroscope* (2015).** A hands-on guide to text mining, topic modelling and networks.
- **Roopika Risam, *New Digital Worlds: Postcolonial Digital Humanities in Theory, Praxis, and Pedagogy* (2018).** Colonial power in digital archives and the Global South.
- **Roopika Risam and Kelly Baker Josephs (eds), *The Digital Black Atlantic* (2021).** Digital methods and the African diaspora, open access.
- **Jo Guldi, *The Dangerous Art of Text Mining: A Methodology for Digital History* (2023).** A critical method for mining historical texts.
- **Julianne Nyhan, *Hidden and Devalued Feminized Labour in the Digital Humanities: On the Index Thomisticus Project 1954–67* (2023).** The women behind Busa's punched cards.$mn_digihist_master$,
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
  select $mn_digihist_quiz$[
    {"type": "mcq", "prompt": "When did Roberto Busa plan the Index Thomisticus, and when did IBM agree to sponsor it?", "options": ["He planned it in 1946 and persuaded IBM's founder to sponsor it in 1949", "He planned it in 1974 and IBM sponsored it in 1980", "He planned it in 1949 and IBM sponsored it in 1946", "He planned it in 1966 and IBM never sponsored it"], "answerIndex": 0, "explanation": "Busa planned the concordance of Aquinas in 1946 and in 1949 persuaded Thomas J. Watson of IBM to sponsor it; the printed volumes appeared from 1974 to 1980.", "id": "q1"},
    {"type": "mcq", "prompt": "How did the Trans-Atlantic Slave Trade Database first appear, and when did it become a free website?", "options": ["As a printed atlas in 1990, online in 1999", "As a free website in 1999, a CD-ROM in 2008", "As a CD-ROM from Cambridge University Press in 1999, and as a free website in December 2008", "As a Google Books project in 2004"], "answerIndex": 2, "explanation": "The 1999 CD-ROM covered 27,233 voyages but was expensive; the open website of 2008 covered nearly 35,000.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Vesuvius Challenge's Grand Prize, awarded in February 2024, given for?", "options": ["Physically unrolling a complete Herculaneum scroll by hand", "Recovering more than 2,000 characters in 15 columns, about 5 per cent of one carbonised scroll", "Finding the Villa of the Papyri", "Digitising every manuscript in Timbuktu"], "answerIndex": 1, "explanation": "Youssef Nader, Luke Farritor and Julian Schilliger recovered previously unknown text, probably by Philodemus, on pleasures such as music and food.", "id": "q3"},
    {"type": "mcq", "prompt": "What is distinctive about the British Library's Endangered Archives Programme?", "options": ["It moves endangered archives to London for safekeeping", "It only digitises printed books in English", "It sells digitised copies to commercial publishers", "It digitises archives in situ, so the originals stay in their country, often with local training"], "answerIndex": 3, "explanation": "Funded by the Arcadia Fund since 2004, it had funded over 400 projects by 2019 across Africa, Asia, the Americas and elsewhere.", "id": "q4"},
    {"type": "open", "prompt": "Explain how digital history arose, from humanities computing to the web.", "rubric": "A strong answer covers Busa's Index Thomisticus (planned 1946, IBM sponsorship from 1949) and the women keypunch operators of Gallarate recovered by Nyhan; quantitative history's computer analysis of censuses in the 1960s and 1970s and cliometrics; the Valley of the Shadow and the Virginia Center for Digital History (1997); Rosenzweig's Center for History and New Media (1994), its tools and the September 11 Digital Archive; and the move from projects to mass digitisation in the 2000s.", "id": "q5"},
    {"type": "open", "prompt": "Assess the main criticisms of digital history and the responses to them.", "rubric": "A strong answer discusses unequal digitisation and digital colonialism (Jeanneney's charge of linguistic imperialism, copyright limits, Gold's criticisms, Risam) against in-situ and open models (Endangered Archives Programme, Qatar Digital Library); the distortions of search and OCR (Hitchcock, Putnam); the limits of quantification (Drucker's 'capta', Fish, Guldi); sustainability (the Spatial History Project's static copy, the Index Thomisticus's migrations, web archive fragility); and Indigenous data sovereignty (Mukurtu, CARE principles), with some reference to AI.", "id": "q6"}
  ]$mn_digihist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/digital-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
