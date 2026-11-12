-- The Global History of Quantitative Data — canonical master article, co-written and human-reviewed.
-- history/thematic-history/the-global-history-of-quantitative-data @ research/advanced/read.
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
    'history/thematic-history/the-global-history-of-quantitative-data',
    'research',
    'advanced',
    'read',
    $mn_quantdata_master$> **How numbers came to rule knowledge.** Writing itself may have begun as bookkeeping, and for five thousand years states, merchants and scientists have turned people, land and goods into numbers. This chapter follows that story around the world, from Mesopotamian tablets, Inca khipus and Mughal land surveys through numerals, ledgers, political arithmetic and the colonial census, to statistics and eugenics, intelligence testing, GDP, the computer, and today's debates over China's social credit system and algorithmic bias. Throughout, it asks the question historians such as Ian Hacking, Theodore Porter, James C. Scott and Alain Desrosières have put: do numbers simply describe the world, or do they help remake it?

## Counting Before Writing

Long before anyone wrote a sentence, people in the ancient Near East were keeping accounts with small clay tokens, possibly from as early as the ninth millennium BCE (though not every token found was an accounting device). By the middle of the fourth millennium BCE tokens were sealed inside clay envelopes, or *bullae*, impressed on the outside with the tokens within, and then came "numerical tablets" bearing numbers alone. Denise Schmandt-Besserat traced a line of descent from tokens to the first script. Her account has been debated and criticised, but the role of these devices as forerunners of writing is accepted, as the chapter on Mesopotamia describes.

That first script, proto-cuneiform, emerged in the Late Uruk period, around 3350–3200 BCE. Of the roughly 5,000 tablets found at archaic Uruk, almost all are administrative: records of goods moving in and out of institutions, plus word lists used to train scribes. Many of its counting systems were sexagesimal (base 60), though different goods were counted in different systems. One tablet reads, in translation, "5617 1/5 N1's, exchange barley, 37 months, Kushim's final account": about 135,000 litres of barley. Whether Kushim was a person, a title or an office is uncertain.

## Empires of Record

Early states counted what they could tax. Egypt's earliest census was a "cattle count" of livestock in the early Old Kingdom. Rome's census listed adult men fit for military service and fixed each citizen's class for war and taxation, and in 6 CE a tax census of Judaea under the legate Quirinius helped provoke the Zealot movement: being counted could be a grievance.

In China a census of 2 CE registered 57,671,400 people in 12,366,470 households, as the chapter on Han China (206 BCE–220 CE) notes. It counted only taxable households, so it measured tax and manpower rather than everyone alive. Chinese officials and merchants calculated with counting rods, a positional decimal method used until the abacus largely replaced it under the Ming. In the early Islamic caliphate, regular censuses began with one ordered by the second caliph, Umar.

{{image: Quipu | A khipu: knotted cords on which the Inca recorded census figures and other numbers.}}

In the Andes, the Inca recorded census figures and other numbers on **khipus**, knotted cords of cotton or camelid fibre whose knots encode numbers in a decimal place-value system, with no knot for zero. Inca administration grouped taxpaying households decimally, under officials responsible for units of 100 or 10,000. But the ability to read the khipus was lost, and estimates of the empire's peak population range from 4 to 37 million. In 1583 the Third Council of Lima ordered some burned as idolatrous. Whether some khipus also recorded language remains unresolved; the chapters on The First Civilizations of the Andes and The Inca Empire follow the decipherment debate.

In England, William the Conqueror's Great Survey, Domesday, is traditionally dated 1086; the chapter What is History? uses it as a classic state-made source. The *Anglo-Saxon Chronicle* complained that not "an ox, nor a cow, nor a swine was there left, that was not set down in his writ". The survey itself was completed in 1086, but the historian Carol Symes has argued that the book may have been finished as late as 1098–1114. In the Ottoman Empire, tax registers called *defters* recorded villages, dwellings, household heads, religion (because it affected tax) and land use. In Mughal India, Akbar's revenue minister Raja Todar Mal, whose reforms the chapter on The Mughal Empire introduces, formalised the *zabt* system in the ten-year settlement of 1580: land was measured with standardised bamboo rods joined by iron rings, and ten harvests of records in each district were averaged to fix a cash rate per crop. Shireen Moosvi later reconstructed the revenue figures in Abu'l Fazl's *Ain-i-Akbari* into a statistical study of the Mughal economy around 1595.

## Numerals and Ledgers

Counting became teachable through the place-value numerals invented by Indian mathematicians between the first and fourth centuries CE. They are often called Hindu-Arabic numerals; this curriculum, like the chapter on The Islamic Commercial Revolution (800–1200), calls them **Indian-Arabic**, naming both the people who invented them and those who carried them west. Brahmagupta, writing in 628 CE, is credited with formalising zero as a number with rules for calculating with it. In Baghdad, al-Khwarizmi wrote a book on calculating with Indian numerals around 825; translated into Latin in the twelfth century, it introduced decimal place value to Europe, and the Latin form of his name gave us "algorithm".

In Christian Europe the numerals 1 to 9, without zero, first appear in a Spanish manuscript of 976. Fibonacci, who learned the "method of the Indians" as a boy at the Pisan customs house in Béjaïa, in today's Algeria, introduced them to the Latin world in his *Liber Abaci* (1202), but they came into common use only from the fifteenth century. Long division followed: al-Samaw'al in the twelfth century made calculations that amount to it, and Henry Briggs introduced the modern method around 1600.

Merchants built a second numerical technology. One of the earliest known double-entry records is a ledger kept in 1211 by Florentine money-changers at a fair in Bologna. Benedetto Cotrugli of Ragusa (Dubrovnik) described the method in 1458, and the Franciscan friar Luca Pacioli codified it in print in 1494. Double entry later served the East India Company and the Bank of England, and the Iberian slave trade, where account books helped to value and depersonalise enslaved people, recorded as property. Mary Poovey observes that double entry recalled for early modern Europeans "both the scales of justice and the symmetry of God's world".

## Political Arithmetic and Probability

Around 1654 the Chevalier de Méré asked Blaise Pascal how to divide the stakes of an unfinished game. Pascal's correspondence with Pierre de Fermat on the problem founded the mathematical theory of probability.

Meanwhile a London haberdasher, **John Graunt**, studied the city's Bills of Mortality. His *Natural and Political Observations* (1662) questioned the Bills' reliability, yet drew from them the first life table. Even though the Bills did not record age at death, he is regarded as the founder of demography. **William Petty**, physician to Cromwell's army, carried out the Down Survey of Ireland in 1654–56, mapping land so that confiscated Irish estates could pay Cromwell's soldiers and creditors; Petty himself received about 30,000 acres. Counting was an instrument of conquest. Petty also made the first rigorous estimates of England's national income and wealth, and in his *Political Arithmetick* (published 1690) he promised to express himself "in Terms of Number, Weight, or Measure".

The words for the new science came from Germany and Scotland. In 1749 Gottfried Achenwall of Göttingen introduced *Statistik*, the descriptive "science of state". Sir John Sinclair popularised "statistics" in its modern sense in English with his *Statistical Account of Scotland* (1791–1799), which he hoped would measure "the quantum of happiness" in the nation.

```checkpoint
q: What did the Kushim tablet from Uruk record?
a*: An account of a large quantity of barley, about 135,000 litres, over 37 months.
a: A royal law code.
x: The tablet is an account of barley, not a law code; Uruk's tablets are almost all administrative.
a: The first census of Egypt.
x: Egypt's earliest census was a cattle count; the Kushim tablet comes from Mesopotamia.
a: A poem naming the first known author.
x: Whether Kushim is even a person's name, rather than a title or office, is uncertain.
hint: Think about what most proto-cuneiform tablets record.
why: The tablet shows writing serving accounts, the origin many scholars see for writing itself.
---
q: What was the purpose of William Petty's Down Survey of 1654–56?
a: To count the population of London.
x: London's deaths were studied by Graunt from the Bills of Mortality; the Down Survey was in Ireland.
a: To estimate the population of France.
x: That was Laplace's estimate of 1802.
a*: To map Irish land so that confiscated estates could pay Cromwell's soldiers and creditors.
a: To describe the "science of state" in Germany.
x: That was Achenwall's *Statistik* (1749).
hint: Think of who paid and who was paid.
why: Political arithmetic grew up alongside conquest and colonial land seizure.
```

## The Avalanche of Numbers

Ian Hacking called the years 1820–1840 "the avalanche of printed numbers", when states began to collect and publish statistics. **Adolphe Quetelet**, founder of the Brussels Observatory, in 1835 proposed a "social physics" built around the "average man", defined by the mean values of measured traits that follow a normal distribution. He treated the average as an ideal and deviations from it as falling short. His index of weight and height survives as the body mass index, and his work, which influenced Francis Galton, played a part in the origins of eugenics.

Numbers were also becoming pictures. William Playfair's *Statistical Breviary* (1801) contains the earliest known pie charts, one dividing the Ottoman Empire among Asia, Europe and Africa. **Florence Nightingale**'s polar-area "rose" diagrams, such as her 1858 diagram of the causes of mortality in the army in the East, showed politicians that most soldiers had died of preventable disease. She did not invent the form, which André-Michel Guerry had used in 1829; her innovation was in persuasion. In her first winter at Scutari, 4,077 British soldiers died there, ten times more from disease than from wounds. A much-repeated claim that the death rate fell from 42 to 2 per cent comes from Stephen Paget's entry in the *Dictionary of National Biography*, and the credit is shared with the Sanitary Commission, which arrived in March 1855.

## Censuses, Machines and Empire

The United States wrote a census into its Constitution. The first count, of 1790, recorded the household head and five categories of people, one of which counted enslaved people: about 698,000, or 17.8 per cent of the population, the highest share of any US census. The 1880 census took eight years to process. **Herman Hollerith** recorded data as holes in cards, and his electric tabulators were used for the census of June 1890. The machines, together with more staff and other changes, cut processing by at least two years (estimates of the total time range from under three years to about six); the Census Bureau says the count finished months ahead of schedule and far under budget. Hollerith's firm became part of a company that Thomas J. Watson renamed International Business Machines (IBM) in 1924. In 1933 the Nazi government announced a census designed partly to identify Jews, Roma and others, and Edwin Black's *IBM and the Holocaust* (2001) argues that the punch-card technology of IBM and its German subsidiary, Dehomag, was central to Nazi censuses, camp administration and the Holocaust; the *New York Times* reviewer Richard Bernstein accepted his documentation but doubted that IBM bore "unique or decisive responsibility", and IBM criticised his methods.

In British India, the census of 1872 was in fact taken piecemeal between 1867 and 1872 and omitted the princely states; the first synchronous census came in 1881. The census had no formal definition of caste, race or tribe. The 1901 census, under H. H. Risley, whose anthropometric race theories are now discredited, recorded 1,646 castes, and that of 1931 recorded 4,147. Because people believed the census fixed social rank, many petitioned to be recorded under higher-status names. Others resisted, fearing new taxes or conscription. The historian Michael Mann judged the census "more telling of the administrative needs of the British than of the social reality". Colonial counting provoked resistance in Africa too: in 1929 the Women's War in south-eastern Nigeria began with a census dispute, as the chapter on The Interwar Period describes.

Did the census make caste? Bernard S. Cohn argued that it objectified Indian society into fixed categories, and Nicholas Dirks, in *Castes of Mind* (2001), that caste took its rigid modern form under a colonial "ethnographic state". Critics reply that this denies Indians any real identity before colonialism (Dipankar Gupta), overstates officials' power to control people by counting them (Timothy Alborn), or ignores genetic evidence of long-term endogamy (David Reich).

## Measuring Bodies and Minds

Modern statistics and eugenics grew up together. Francis Galton coined "eugenics" in 1883 and presented "regression" in 1885. Karl Pearson founded the world's first university statistics department, at University College London, in 1911, and was the first Galton Professor of Eugenics; in 1925, with Margaret Moul, he opposed Jewish immigration as "somewhat inferior physically and mentally to the native population". Ronald Fisher, who developed the analysis of variance and the 5 per cent significance convention at Rothamsted, succeeded him in that chair. In 2020 UCL removed Galton's and Pearson's names from its buildings, and honours to Fisher have also been withdrawn. Whether their methods can be separated from their aims is still debated.

Eugenic sterilisation spread worldwide. In *Buck v. Bell* (1927), a US Supreme Court decision never expressly overturned, Justice Holmes wrote that "three generations of imbeciles are enough"; tens of thousands of Americans were sterilised. Nazi Germany, whose law was modelled partly on American ones, sterilised over 400,000 people; in the 1970s the US Indian Health Service sterilised an estimated 25–42 per cent of the Native American women of reproductive age who came to it for care; and India's Emergency brought sterilisation drives in 1976.

Testing turned minds into numbers. China's imperial examinations influenced civil-service examinations in Europe and the East India Company. In France, Alfred Binet, serving on a government commission on children with learning difficulties, published a preliminary intelligence test with Théodore Simon in 1905. In America, Lewis Terman, who published the Stanford–Binet in 1916, promoted eugenic ideas, and the Army's intelligence tests (Alpha and Beta) had been given to 1,726,966 men by November 1918. Carl Brigham used the Army data in 1923 to claim "Nordic" superiority, feeding the anti-immigration politics behind the 1924 quotas discussed in the chapter on Modern American History: the United States in the Twentieth Century. He then created the SAT, first sat in 1926, and in 1930 recanted, writing that his study's "entire hypothetical superstructure of racial differences collapses completely". Stephen Jay Gould's *The Mismeasure of Man* (1981) attacked the ranking of intelligence as a single quantity; its scientific reception was highly polarised.

## Measuring Nations

In 1934 the economist **Simon Kuznets** delivered the first official US estimate of national income to the Senate, to help understand the Great Depression. He warned at once against reading too much into it.

```quote
The welfare of a nation can, therefore, scarcely be inferred from a measurement of national income as defined above.
Simon Kuznets · National Income, 1929–1932 · 1934
```

After the Bretton Woods Conference of 1944, GDP and GNP became the main measures of national economies, standardised in the UN's System of National Accounts from 1953. Critics note that it omits unpaid household work, environmental depletion and inequality. Angus Maddison reconstructed GDP back to the year 1 CE, showing India and China as the largest economies before the eighteenth century, figures the chapters on Modern South Asia and Chinese History use. But his estimates before 1800 rest on a few conjectural benchmark years, some little more than informed guesses, and they are being revised.

Present-day figures are fragile too. Morten Jerven's *Poor Numbers* (2013) argued that rankings of African economies by GDP are misleading. In 2010 Ghana's statisticians raised its GDP estimate by over 60 per cent, lifting it to lower-middle-income status overnight, by moving the base year from 1993 to 2006; in 2014 Nigeria's rebasing raised its estimate of 2013 GDP by 89 per cent. African statisticians such as South Africa's Pali Lehohla disputed Jerven's claims. In the early People's Republic of China, Arunabh Ghosh shows in *Making It Count* (2020), Soviet-style full enumeration proved hard to sustain by the mid-1950s; Indian statisticians shaped Chinese interest in random sampling, and the Great Leap Forward pushed statistics towards ethnographic methods.

```checkpoint
q: What did Herman Hollerith's punch-card machines do for the 1890 US census?
a: They let the whole census be tabulated within a single year.
x: That popular claim is not supported; processing time fell, but only by a few years.
a*: Together with more staff and other changes, they helped cut processing by at least two years, finishing months ahead of schedule.
a: They were first used to count the population in 1790.
x: The 1790 census was taken by US marshals; Hollerith was born in 1860.
a: They were invented for the Nazi census of 1933.
x: Hollerith filed his patent in 1884, decades before the Nazi census.
hint: Compare the 1880 and 1890 processing times.
why: Mechanised tabulation sped up the census and grew into IBM, but its effect is often exaggerated.
---
q: What did Morten Jerven's *Poor Numbers* argue?
a: That Africa has no economic statistics at all.
x: He studied the weaknesses of existing statistics, not their absence.
a: That GDP is the best measure of welfare.
x: Even Kuznets warned that welfare cannot be inferred from national income.
a: That Maddison's figures for ancient China are exact.
x: Maddison's pre-1800 figures are conjectural benchmarks, and Jerven wrote about modern Africa.
a*: That GDP figures for African economies rest on weak foundations, so rankings based on them mislead.
hint: Think of Ghana's overnight jump in 2010.
why: Rebasing in Ghana and Nigeria showed how much depends on statisticians' choices.
```

## Machines That Count

Punched cards were older than Hollerith. Jacquard's loom of 1804 was controlled by them, and Charles Babbage, troubled by errors in printed mathematical tables, borrowed them in 1837 for his design for an Analytical Engine, a general-purpose machine; he completed neither it nor his earlier Difference Engine. Ada Lovelace's notes on it (1843) set out an algorithm for Bernoulli numbers, often called the first published computer program. Her title of "first programmer" is disputed: some scholars hold that the programs were mostly Babbage's. The electronic computer ENIAC, completed in 1945, whose six primary programmers were women, is described in the chapter on Technological Advancements and the Digital Age. In 1979 Dan Bricklin and Bob Frankston released VisiCalc for the Apple II; the electronic spreadsheet, heir to the ruled tables Babylonian scribes kept on clay as early as 1800 BCE, became the personal computer's "killer application".

## Data, Algorithms and Surveillance

"Big data", a term in use since the 1990s, promised new knowledge from sheer volume, though Google Flu Trends repeatedly overestimated flu, at the 2012–13 peak predicting about twice the doctor visits the CDC recorded. India's Aadhaar, set up in 2009 (the first numbers were issued in 2010), links a twelve-digit number to fingerprints and iris scans for about 1.38 billion people; in 2018 the Supreme Court upheld it while barring it from being made mandatory for bank accounts, mobile connections and school admissions.

China's **social credit system** is often imagined in the West as a single score for every citizen. It is not. It is a fragmented set of credit ratings and blacklists, run by state agencies and courts and focused mainly on businesses. A court blacklist of judgment defaulters began in 2013; by June 2019, 26.82 million air tickets and 5.96 million high-speed rail tickets had been denied to people on "untrustworthy" blacklists, most prominently the courts' list of judgment defaulters. In 2019 the government ruled that people could be punished only for legally defined offences, not for low scores in pilot cities. A February 2022 report by MERICS concluded that "such a score simply does not exist".

In the United States, the COMPAS risk score used in courts was found by ProPublica in 2016 to be biased against Black defendants, while its maker showed it was equally accurate across races. Both claims were true, under two definitions of fairness that cannot be satisfied at once. Cathy O'Neil's *Weapons of Math Destruction* (2016) argues that such algorithms often reinforce inequality.

## Historians of Numbers

Historians have learned to read numbers as historical artefacts. Hacking argued that new classifications can bring new kinds of people into being, "making up people", and that the people classified change the categories in turn, a "looping effect" of the kind seen in the Indian caste petitions. Porter's *Trust in Numbers* (1995) argued that quantification spreads not because it copies physics but because weak or exposed officials need impersonal rules to win legitimacy.

```quote
A decision made by the numbers (or by explicit rules of some other sort) has at least the appearance of being fair and impersonal.
Theodore M. Porter · Trust in Numbers · 1995
```

James C. Scott's *Seeing Like a State* (1998) showed states making societies "legible" through surnames, cadastral surveys, censuses and standard measures, and traced the failure of "high modernist" schemes from Soviet collectivisation to Tanzanian villagisation; David Laitin praised it but called its evidence selective. Alain Desrosières, of the French statistical institute INSEE, treated official statistics as a constructed reality, neither simple facts nor mere political artefacts. Michel Foucault's "biopower" placed population statistics at the centre of modern government. Historians also count: Robert Fogel's cliometrics, and the fierce debate over *Time on the Cross* (1974), show how much is at stake in measuring the past; the chapter on Social History follows the demographic historians who rebuilt past populations from parish registers. The lesson running from Uruk to the social credit system is that numbers are made by people, for purposes, and are never only neutral.

## Further exploration

- **Theodore M. Porter, *Trust in Numbers: The Pursuit of Objectivity in Science and Public Life* (1995).** Why bureaucracies and professions turned to numbers.
- **Ian Hacking, *The Taming of Chance* (1990).** The nineteenth-century avalanche of printed numbers and the rise of statistical laws of society.
- **James C. Scott, *Seeing Like a State: How Certain Schemes to Improve the Human Condition Have Failed* (1998).** Legibility, censuses and high-modernist failures from Europe to Tanzania.
- **Alain Desrosières, *The Politics of Large Numbers: A History of Statistical Reasoning* (1993; English trans. 1998).** Official statistics as both science and state-building.
- **Morten Jerven, *Poor Numbers: How We Are Misled by African Development Statistics and What to Do about It* (2013).** The weak foundations of African GDP figures.
- **Arunabh Ghosh, *Making It Count: Statistics and Statecraft in the Early People's Republic of China* (2020).** Chinese state statistics between Soviet models and Indian sampling.
- **Nicholas B. Dirks, *Castes of Mind: Colonialism and the Making of Modern India* (2001).** How the colonial census and ethnography shaped caste.$mn_quantdata_master$,
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
  select $mn_quantdata_quiz$[
    {"type": "mcq", "prompt": "When was the first synchronous census of British India taken?", "options": ["1881", "1857", "1872", "1947"], "answerIndex": 0, "explanation": "The so-called 1872 census was in fact taken piecemeal between 1867 and 1872 and left out the princely states; the first synchronous decennial census came in 1881.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best describes China's social credit system?", "options": ["A single national score given to every citizen by one algorithm", "A private rating run only by Alibaba", "A fragmented set of credit ratings and blacklists, focused mainly on businesses, which by June 2019 had been used to deny millions of air and rail tickets to blacklisted people", "A census of China's population taken every ten years"], "answerIndex": 2, "explanation": "Scholars and a 2022 MERICS report stress that it is fragmented and business-focused, and that a single personal score 'simply does not exist'; by June 2019, 26.82 million air tickets and 5.96 million high-speed rail tickets had been denied to people on blacklists, most prominently the courts' list of judgment defaulters.", "id": "q2"},
    {"type": "mcq", "prompt": "In which document did Simon Kuznets warn that 'the welfare of a nation can, therefore, scarcely be inferred from a measurement of national income'?", "options": ["The Bretton Woods agreement of 1944", "A 1962 article in The New Republic", "The UN System of National Accounts of 1953", "His report National Income, 1929–1932, presented to the US Senate in 1934"], "answerIndex": 3, "explanation": "The warning appears in the first official US estimate of national income, a Senate document of 1934, commissioned to help understand the Great Depression.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Carl Brigham do in 1930?", "options": ["He created the Army Alpha test", "He recanted his 1923 claims of 'Nordic' superiority, writing that their racial superstructure 'collapses completely'", "He published the Stanford–Binet test", "He abolished the SAT"], "answerIndex": 1, "explanation": "Brigham had used Army test data in 1923 to claim Nordic superiority and created the SAT in 1926, but in 1930 he called his earlier conclusions without foundation.", "id": "q4"},
    {"type": "open", "prompt": "Did the colonial census in British India describe caste or help to make it? Discuss with evidence and with reference to historians' arguments.", "rubric": "A strong answer describes how the census was taken (piecemeal 1867–72, synchronous from 1881), its lack of formal definitions of caste, the growth in recorded castes (1,646 in 1901, 4,147 in 1931), Risley's discredited race theories, petitions for higher-status names and popular resistance, and Michael Mann's judgement. It sets Cohn's and Dirks's argument (caste's rigid modern form under a colonial 'ethnographic state') against critics such as Dipankar Gupta, Timothy Alborn and David Reich, and may use Hacking's idea of 'making up people' and the looping effect. It reaches a reasoned conclusion.", "id": "q5"},
    {"type": "open", "prompt": "Why have numbers come to carry such authority? Use at least two historians of quantification and examples from more than one region.", "rubric": "A strong answer uses Porter (numbers as impersonal 'mechanical objectivity' that gives weak or exposed officials legitimacy), Hacking (the avalanche of printed numbers; making up people), Scott (legibility and the failures of high-modernist schemes) and/or Desrosières (statistics as constructed reality). It draws examples from several regions, such as Uruk's accounts, Inca khipus, the Han census of taxable households, Mughal zabt, Petty's Down Survey, the Indian census, Jerven's Poor Numbers and Ghana's rebasing, Ghosh on the early PRC, or the social credit system, and notes the limits of numbers (Kuznets's warning, eugenics, algorithmic bias).", "id": "q6"}
  ]$mn_quantdata_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/the-global-history-of-quantitative-data', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
