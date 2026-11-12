-- Disease and Epidemics in World History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/disease-and-epidemics-in-world-history @ research/advanced/read.
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
    'history/thematic-history/disease-and-epidemics-in-world-history',
    'research',
    'advanced',
    'read',
    $mn_disease_master$> **Pathogens have shaped empires, economies and ideas, and societies have shaped how pathogens struck.** This chapter follows infectious disease across ten thousand years: the "crowd diseases" that came with farming; the plagues of Rome and Justinian and the debates over how much they mattered; the Black Death as an Afro-Eurasian event; the argument over "virgin soil" in the Americas and the Pacific; smallpox from Asian, African and Ottoman inoculation to eradication in 1980; cholera, plague and the birth of public and international health; malaria, yellow fever and empire; the influenza of 1918; HIV/AIDS; and COVID-19 as history. Throughout, it traces three patterns that recur from 1348 to 2020: blame, quarantine and inequality.

## Disease as a historical actor

Modern writing on disease in world history begins with William H. McNeill's *Plagues and Peoples* (1976), introduced in the chapter on Global History. McNeill treated epidemics as social as well as biological events, shaped by ecology, economy and culture and in turn shaping the fate of cultures. He set disease-causing "microparasites" beside human "macroparasites": the rulers, landlords and conquerors who live off those who produce. With Alfred Crosby's *The Columbian Exchange* (1972), the book popularised the view that disease made European expansion into the Americas possible. Critics found it thinly evidenced in places and Eurocentric, but its core idea, that an epidemic is both biological and social, is now accepted.

A second approach came from the historian of medicine Charles E. Rosenberg. In *Framing Disease* (1992), edited with Janet Golden, he argued that in some ways a disease does not exist until a society has agreed that it does, by perceiving, naming and responding to it. In "What Is an Epidemic?" (1989), written in response to AIDS, he set out a "dramaturgic" model in which an epidemic unfolds like a play, through rising tension to a crisis and then a drift towards closure. Later historians find the model too neat but still start from it.

The third approach is the newest. Ancient DNA from teeth and skeletons confirmed in 2010–11 that *Yersinia pestis*, the plague bacterium, caused the Black Death, and in 2013 that it caused the Plague of Justinian. Historians such as Monica Green and Kyle Harper have built new narratives on it. Most historians now combine all three: the pathogen, the society that frames it, and the evidence of the body.

## Farming, crowds and zoonoses

The chapter on the Neolithic Revolution describes the costs of farming. Settled life spread disease faster: poor sanitation and close contact with domesticated animals let pathogens jump to people. About 60% of known human infectious diseases are estimated to be zoonotic, of animal origin, among them measles, smallpox, influenza and HIV. Genetics dates some of these jumps: measles evolved from rinderpest, a cattle virus, splitting from it between 900 and 2,400 years ago. Malaria began to have a major impact on human survival about 10,000 years ago, with farming, and selected for traits such as sickle-cell.

```quote
not for the last time in history, a precocious leap forward in social development brought biological reverses
Kyle Harper · The Fate of Rome · 2017
```

Harper wrote this of Roman skeletons, which are shorter than those from Italy before and after Roman rule.

## The plagues of Rome and Justinian

The plague of Athens of 430 BCE is told in the chapter on Ancient Greece. Rome suffered two great pandemics. The Antonine Plague (165–180 CE), described by the physician Galen, was tied by ancient writers to the Roman siege of Seleucia in Mesopotamia and reached nearly every corner of the empire by 172. It was probably smallpox, possibly measles. Estimates of its toll range from 2% to 33% of the empire's population, with most around 10%. The Plague of Cyprian, from about 249, broke out in Egypt according to Bishop Dionysius of Alexandria; its pathogen is unknown, and Harper argues that its symptoms fit a viral haemorrhagic fever like Ebola. The chapter on the Silk Roads notes that epidemics also struck Han China in these centuries, though any link is uncertain.

How much did these plagues matter? Harper argued in *The Fate of Rome* that the Antonine pandemic merits a place "squarely in the forefront" of any account of Rome's destiny, alongside climate, a view discussed in the chapter on the Fall of the Roman Empire. In 2018 six historians, including John Haldon and Lee Mordechai, called his position extreme, while accepting that disease and climate had some of the impact he describes.

The argument returned more sharply over the Plague of Justinian, the first episode of a pandemic that recurred until the mid-eighth century. Procopius first reported it in 541 at Pelusium in Egypt; Justinian himself caught it and recovered. In a passage modelled on Thucydides, Procopius claimed 10,000 deaths a day in Constantinople, a figure whose accuracy is doubted. Genetic studies point to an origin in Central Asia; others propose an East African route through Aksumite merchants. Maximalists estimate 15 to 100 million deaths over two centuries. In 2019 Lee Mordechai and Merle Eisenberg challenged this in "Rejecting Catastrophe", and with colleagues asked whether it was "an inconsequential pandemic". Reviewing texts, coins, papyri, pollen, ancient DNA and burials, they found that high estimates rest on a small subset of texts and that pollen shows no fall in farming attributable to plague: high local mortality, perhaps, but no widespread collapse. Peter Sarris replied in 2022, criticising their methods and handling of sources, and citing genetic evidence that plague may have entered western Eurasia by more than one route. The chapter on Byzantium gives the traditional picture.

## The Black Death as a world event

The Black Death of 1346–1353 has its own chapter. Estimates run to up to 50 million deaths and 30–60% of Europe's population, with Ole Benedictow at the high end. In 2022 a team led by Maria Spyrou found that plague DNA from cemeteries near Lake Issyk-Kul, in today's Kyrgyzstan, where Syriac tombstones record deaths from "pestilence" in 1338–1339, was ancestral to the Black Death strain. Not all agree that this was the origin: Benedictow argues for a Caspian focus, and some still favour China.

Monica Green, in "The Four Black Deaths" (2020), widened the frame. Genetics shows a "Big Bang" in which *Y. pestis* diversified into four lineages around the thirteenth century, a century or more before 1346. Green links this to the Mongol conquests, described in the chapter on the Mongol Empire, and argues that different lineages came to dominate different parts of Eurasia and Africa. Against George Sussman, who held that plague did not reach East Africa until the twentieth century, she argues that the second pandemic reached sub-Saharan Africa. Yet a global Black Death was not a plague everywhere. Sussman found no evidence of a serious fourteenth-century epidemic in the Delhi Sultanate and no specific evidence of plague in Yuan China. Richard von Glahn reports estimates that China's population fell by at least 15%, perhaps a third, between 1340 and 1370, but thinks war and famine were probably the main causes.

Plague returned for centuries: on Biraben's reconstruction it was present somewhere in Europe every year from 1346 to 1671, and it struck the Islamic world almost every year between 1500 and 1850. Responses became institutions. The hadith tradition advised people in a plague region to stay and others not to enter, and Ibn Sina's *Canon of Medicine* (1025) recommended isolation. In 1377 Ragusa (Dubrovnik) imposed thirty days' isolation on arrivals from plague areas, later extended to forty days, *quarantena*, the root of "quarantine". Venice founded the first lazaretto, an island quarantine hospital, in the early fifteenth century.

```checkpoint
q: What did Lee Mordechai and Merle Eisenberg argue about the Plague of Justinian in 2019?
a*: That high death tolls rest on a small subset of texts, and that plague did not cause a widespread demographic collapse.
a: That it was not caused by plague at all.
x: Ancient DNA confirmed in 2013 that *Yersinia pestis* caused it, and they did not dispute this.
a: That it killed between 15 and 100 million people.
x: That is the maximalist estimate they challenged.
a: That it began in Venice and spread east.
x: Procopius first reported it in 541 at Pelusium in Egypt.
hint: Think of the title "Rejecting Catastrophe".
why: Reviewing texts, coins, papyri, pollen and burials, they found no evidence of the general collapse that maximalists assume; Peter Sarris has disputed their methods.
---
q: What does Monica Green's "The Four Black Deaths" (2020) argue?
a: That the Black Death began in Florence in 1348.
x: Green set the pandemic in a much wider frame, beginning in Central Eurasia.
a: That the Black Death was caused by a virus, not plague.
x: Green builds on the ancient-DNA evidence that *Yersinia pestis* was the cause.
a*: That plague diversified into four lineages around the thirteenth century, linked to the Mongol conquests, a century or more before 1346.
a: That plague never reached Africa.
x: Green argues the opposite: that the second pandemic did reach sub-Saharan Africa.
hint: Think of the "Big Bang" in plague genetics.
why: Green's argument makes the Black Death a longer, Afro-Eurasian event rather than a European catastrophe of a few years.
```

## Virgin soil? The Americas and the Pacific

The devastation of the Americas by Afro-Eurasian diseases, led by smallpox, is described in the chapters on the Conquest of the Americas and the Columbian Exchange. In 1976 Crosby gave it a name. A "virgin soil epidemic", he wrote, is one

```quote
in which the populations at risk have had no previous contact with the diseases that strike them and are therefore immunologically almost defenseless
Alfred Crosby · "Virgin Soil Epidemics as a Factor in the Aboriginal Depopulation in America" · 1976
```

The idea spread widely, not least through Jared Diamond's *Guns, Germs and Steel*, and seemed to fit the Pacific, where measles and other epidemics killed perhaps a tenth to a third of Hawaiians in 1848–49, and measles killed about a third of Fiji's in 1875. But in "Virgin Soils Revisited" (2003) David S. Jones argued that the term implies a genetic predisposition and hides the social, environmental and biological conditions that made people more or less vulnerable. Paul Kelton stresses how the European-driven trade in Indigenous slaves spread smallpox; Gregory Cushman finds that Pacific deaths came more from tuberculosis and dysentery among overworked, exploited people. Jeffrey Ostler writes that "virgin soil epidemics did not occur everywhere and ... Native populations did not inevitably crash as a result of contact". Christopher Browning adds that disease "as the chief killing agent ... does not remove settler colonialism from the rubric of genocide". The debate has moved the story from immune systems to the conditions that colonial rule created.

## Smallpox: from inoculation to eradication

Smallpox emerged 3,000–4,000 years ago, according to genetic evidence. The first defence against it came from Asia and Africa. Variolation deliberately infected people with material from smallpox cases; only 1–2% of those treated died, against about 30% of natural cases. In China the oldest documented practice, from the sixteenth century, blew powdered scabs into the nose, and the Kangxi Emperor had his children and troops inoculated. In Sennar, in today's Sudan, mothers "bought the smallpox", bargaining for pustules. The Greek doctor Emmanuel Timoni described the practice in Constantinople to the Royal Society (1714), and Lady Mary Wortley Montagu wrote of it in 1717. In Boston, Cotton Mather learned of it from Onesimus, an enslaved West African man, as the chapter on Health and Healing in African History relates.

On 14 May 1796 Edward Jenner inoculated eight-year-old James Phipps with cowpox and later showed that smallpox material produced no disease; "vaccine" comes from *vacca*, cow. Jenner was not the first to use cowpox: John Fewster by 1768 and the Dorset farmer Benjamin Jesty in 1774 were among those who knew of or tested its protection, and the story that milkmaids' complexions inspired him appears to be a myth. The Spanish Balmis Expedition (1803–1806) carried the vaccine to the Americas and Asia.

{{image: Edward Jenner | Edward Jenner, whose 1796 experiment with cowpox gave the world vaccination, though others had tested cowpox before him.}}

Even so, smallpox killed an estimated 250–500 million people in the twentieth century. In 1967 the WHO intensified its eradication campaign, and its vaccinators still met variolators in remote Pakistan and Afghanistan. The last natural case of variola major was Rahima Banu in Bangladesh in 1975; the last natural case of all was Ali Maow Maalin, a hospital cook in Merca, Somalia, in October 1977. The World Health Assembly endorsed eradication on 8 May 1980. Smallpox remains the only human disease ever eradicated.

## Cholera, plague and public health

Cholera became a world disease in 1817, when the first of seven pandemics spread from Bengal along trade routes to South-East Asia, China, Korea, the Middle East and East Africa; the seventh, which began in Indonesia in 1961, is officially ongoing. India is estimated to have lost over 15 million people to cholera between 1817 and 1860 and another 23 million between 1865 and 1917. Pilgrims carried it to Mecca. The chapter on the Victorian Era tells how John Snow traced the Broad Street outbreak of 1854 to a water pump. Charles Rosenberg's *The Cholera Years* (1962) traced how Americans made sense of their cholera epidemics; many blamed poor immigrants, especially the Irish.

The third plague pandemic began in Yunnan in 1855, reached Hong Kong in 1894 and travelled by steamship to every inhabited continent, killing at least 15 million people, 10–12 million of them in British India. In Hong Kong Alexandre Yersin and Kitasato Shibasaburō independently isolated the bacterium, and in 1898 Paul-Louis Simond showed that rat fleas carried it. Science advanced alongside coercion. Harsh British quarantines in India bred resentment; in Cape Colony Black South Africans were forcibly moved to the city's outskirts, which historians read as segregation; in Honolulu in 1900 the Board of Health burned much of Chinatown, leaving over 7,000 Chinese and Japanese residents homeless. In Manchuria in 1910–11, by contrast, the Penang-born doctor Wu Lien-teh led China's own response to a pneumonic plague that killed about 60,000, promoting masks.

Epidemics also built institutions. From 1851 fourteen International Sanitary Conferences, with the Ottoman Empire taking part from the first, tried to standardise quarantine. The World Health Organization, which Szeming Sze of the Republic of China helped initiate, was established in 1948 and absorbed earlier international health offices.

## Mosquitoes and empire

Yellow fever originated in Africa and probably crossed to the Americas with the Atlantic slave trade. Africans from endemic areas often had immunity from childhood infection, while newcomers died. In *Mosquito Empires* (2010) J. R. McNeill argued that this "differential immunity" decided Caribbean wars, as seasoned defenders survived and invading armies did not. Most of the French soldiers sent to Saint-Domingue under Leclerc died, chiefly of yellow fever, a war told in the chapter on the French and Haitian Revolutions. Critics warn that the argument risks determinism. The Cuban doctor Carlos Finlay proposed in 1881 that a mosquito carried yellow fever, which Walter Reed's commission confirmed in 1900–01. Even in Panama, where William Gorgas's campaign eliminated yellow fever and sharply reduced malaria, about 5,600 canal workers died of disease and accidents, mostly West Indians, against about 350 Americans.

Quinine's story begins in the Andes, where Quechua people used cinchona bark; it was used against malaria from at least 1632. In 1865 Manuel Incra Mamani collected high-quinine cinchona seeds in Bolivia, whose export was banned, for the English trader Charles Ledger; the Dutch planted them in Java and came to hold a world monopoly. As the chapter on Imperial Expansion and Resistance explains, quinine is credited with ending Africa's reputation as the "white man's grave". Ronald Ross of the Indian Medical Service showed mosquito transmission in 1897–98, and tropical medicine grew up in the service of empire, as the sleeping-sickness campaigns in Health and Healing in African History show. Tu Youyou isolated artemisinin under China's Project 523 and won a Nobel Prize in 2015. Malaria still killed 610,000 people in 2024, about 95% of the deaths falling in the WHO's African Region.

## Influenza, 1918

The influenza pandemic of 1918–1920 infected about a third of the world. Estimates of the toll run from about 17 million to as many as 100 million (John M. Barry); about 50 million is the figure most often cited. Its origin is undetermined: Kansas, France and China have all been proposed. Its names were accusations: "Brazilian flu" in Senegal, "German flu" in Brazil, a "white man's sickness" to some Africans. The burden was unequal. India lost 12–17 million people; Iran lost between 8% and 22% of its population amid famine; Western Samoa, under New Zealand occupation, lost 22% in two months. American Samoa and New Caledonia had no deaths in 1918–19, thanks to maritime quarantine.

```checkpoint
q: What did David S. Jones argue in "Virgin Soils Revisited" (2003)?
a: That Indigenous Americans had more immunity than Europeans.
x: Jones did not argue about relative immunity; he questioned the framework itself.
a*: That the term implies genetic predisposition and hides the social and environmental conditions that made people vulnerable.
a: That smallpox never reached the Americas.
x: Smallpox was the leading killer among the Afro-Eurasian diseases in the Americas.
a: That Crosby had exaggerated the role of colonial warfare.
x: Jones and later historians placed more weight, not less, on colonial conditions.
hint: Think of what "virgin" suggests about bodies.
why: Jones and later historians shifted attention from immune systems to colonial conditions, such as the Indigenous slave trade and overwork, that made epidemics deadlier.
---
q: Why did American Samoa suffer no deaths from influenza in 1918–19 while Western Samoa lost 22% of its people?
a: Because American Samoa had a vaccine.
x: The difference came from a policy at the ports, not from medicine.
a: Because the virus never crossed the Pacific.
x: It reached Western Samoa, Tahiti and many other islands with devastating effect.
a: Because American Samoans had immunity from an earlier epidemic.
x: The difference lay in policy, not immunity.
a*: Because American Samoa imposed a strict maritime quarantine.
hint: Think of ships and harbours.
why: Quarantine, often coercive and abused, could also save lives when applied in time.
```

## HIV/AIDS

HIV-1 descends from a virus of chimpanzees in west-central Africa. The pandemic strain emerged in Léopoldville (Kinshasa), in the Belgian Congo, where its common ancestor is dated to the early twentieth century, most often to around 1920. Michael Worobey and Jacques Pépin link its spread to colonial cities, labour migration and, in Pépin's argument, unsterile injection campaigns. HIV reached Haiti around 1966–67, probably with a worker returning from the Congo, and the United States around 1969. Gaëtan Dugas, the "Patient Zero" of legend, was not the source: HIV was in New York by about 1971, before he joined Air Canada in 1974.

AIDS was officially recognised in June 1981. In 1982 the CDC named Haitians a risk group, which damaged Haiti's tourism and exports. In *AIDS and Accusation* (1992) Paul Farmer asked whether the theory of a Haitian origin for American AIDS rested on racism rather than evidence. About 44 million people had died by the end of 2024, and over half of those now living with HIV are in eastern and southern Africa. South Africa's struggle over treatment is told in Health and Healing in African History.

## COVID-19 as history

SARS, which emerged in Guangdong in 2002, led to revised International Health Regulations in 2005 and the category of a "public health emergency of international concern". COVID-19, first identified in Wuhan in December 2019, was declared one on 30 January 2020. On 11 March the WHO's Director-General, Tedros Adhanom Ghebreyesus, said that "COVID-19 can be characterized as a pandemic"; the emergency ended on 5 May 2023. The WHO estimated 14.9 million excess deaths in 2020–21, against 5.4 million reported. Old patterns returned: prejudice against people of East Asian descent was documented worldwide, and vaccines were shared unequally, as the chapters on Contemporary History and the Post-Cold War Era describe.

On 20 May 2025 the World Health Assembly adopted a WHO Pandemic Agreement without objection; it explicitly denies the WHO any power to order national measures. It cannot open for signature until an annex on sharing pathogens and their benefits is agreed, and in May 2026 the Assembly failed to adopt one and extended talks. The United States' withdrawal from the WHO took effect on 22 January 2026. A Bundibugyo Ebola epidemic, declared an international emergency on 17 May 2026, is described in Health and Healing in African History.

## Blame, quarantine and inequality

Three patterns recur. The first is blame: Jews accused of poisoning wells in 1348; the Irish blamed for cholera; Honolulu's Chinatown burned in 1900; influenza named after enemies and neighbours; Haitians labelled a risk group; "Chinese virus" in 2020. Frank Snowden's *Epidemics and Society* (2019) traces how epidemics feed scapegoating and repression. The second is quarantine, rooted in Ragusa's thirty days and the hadith's counsel to stay put, which saved American Samoa in 1918 and was turned against the colonised in India, the Cape and Honolulu. The third is inequality. Thomas McKeown argued, in a contested thesis, that tuberculosis deaths in England and Wales had already fallen by most of their eventual decline before streptomycin and BCG, thanks to better living standards. Today tuberculosis is the world's leading infectious killer, with 1.23 million deaths in 2024, and three-quarters of Africa's malaria deaths are of children under five. Epidemics follow the lines societies draw between rich and poor, citizen and subject.

## Further exploration

- **William H. McNeill, *Plagues and Peoples* (1976).** The founding global synthesis of disease as a force in history; read it critically.
- **Kyle Harper, *Plagues upon the Earth: Disease and the Course of Human History* (2021).** An up-to-date long-run synthesis from the Neolithic to COVID-19.
- **Frank M. Snowden, *Epidemics and Society: From the Black Death to the Present* (2019).** Plague, smallpox, cholera, tuberculosis, malaria, HIV and Ebola and their social fallout.
- **Monica H. Green (ed.), *Pandemic Disease in the Medieval World: Rethinking the Black Death* (2015).** The ancient-DNA and "global Black Death" turn, including Africa and Asia.
- **J. R. McNeill, *Mosquito Empires: Ecology and War in the Greater Caribbean, 1620–1914* (2010).** Yellow fever and malaria as makers and breakers of empires, including in Haiti.
- **Paul Farmer, *AIDS and Accusation: Haiti and the Geography of Blame* (1992).** An anthropology of AIDS, blame and inequality.
- **Myron Echenberg, *Plague Ports: The Global Urban Impact of Bubonic Plague, 1894–1901* (2007).** The third pandemic in ten port cities across five continents.$mn_disease_master$,
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
  select $mn_disease_quiz$[
    {"type": "mcq", "prompt": "Who was the last person to catch smallpox naturally, whose rash appeared on 26 October 1977?", "options": ["Ali Maow Maalin, a hospital cook in Merca, Somalia", "Rahima Banu in Bangladesh", "James Phipps in England", "Onesimus in Boston"], "answerIndex": 0, "explanation": "Rahima Banu (1975) was the last natural case of variola major; Ali Maow Maalin had variola minor and was the last natural case of all. The World Health Assembly endorsed eradication on 8 May 1980.", "id": "q1"},
    {"type": "mcq", "prompt": "Which Dorset farmer tested cowpox as protection against smallpox in 1774, more than twenty years before Jenner?", "options": ["John Snow", "Zabdiel Boylston", "Benjamin Jesty", "Charles Ledger"], "answerIndex": 2, "explanation": "Jesty, like John Fewster before him, knew of or tested cowpox's protection; the story that milkmaids' complexions inspired Jenner appears to be a myth.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Sussman's research and Richard von Glahn's estimates suggest about the fourteenth-century Black Death in Asia?", "options": ["That China lost two-thirds of its people to plague", "That plague began in Delhi", "That India suffered the worst mortality of any region", "That there is no specific evidence of plague in China or of a serious epidemic in India, and China's population fall was probably due mainly to war and famine"], "answerIndex": 3, "explanation": "Von Glahn reports estimates that China's population fell by at least 15%, perhaps a third, between 1340 and 1370, but attributes it mainly to war and famine.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the WHO, how many excess deaths did COVID-19 cause in 2020–21, against the 5.4 million reported?", "options": ["About 1 million", "About 14.9 million", "About 50 million", "About 100 million"], "answerIndex": 1, "explanation": "The WHO's estimate of 14.9 million excess deaths for 2020–21 is nearly three times the deaths officially reported for those years.", "id": "q4"},
    {"type": "open", "prompt": "How have historians debated the idea of 'virgin soil' epidemics in the Americas and the Pacific?", "rubric": "A strong answer gives Crosby's 1976 definition (populations with no previous contact, immunologically almost defenceless) and its influence (McNeill, Diamond); explains David S. Jones's 2003 critique that the term implies genetic predisposition and hides social and environmental conditions; and uses Kelton (the Indigenous slave trade spreading smallpox), Cushman (tuberculosis and dysentery among exploited Pacific workers), Ostler (crashes were not inevitable) and Browning (disease does not remove settler colonialism from the charge of genocide). It may cite measles in Hawaii and Fiji and reach a judgement on how biology and colonial conditions combined.", "id": "q5"},
    {"type": "open", "prompt": "Using at least three epidemics from different periods, assess how blame, quarantine and inequality recur in the history of disease.", "rubric": "A strong answer uses examples such as the massacres of Jews in 1348, Ragusa's quarantine of 1377, the burning of Honolulu's Chinatown and harsh quarantines in British India during the third plague pandemic, the naming of the 1918 influenza and its unequal toll (India, Western Samoa) against American Samoa's successful quarantine, the Haitian 'risk group' label in the AIDS epidemic (Farmer), and anti-Asian prejudice and the gap between reported and excess deaths in COVID-19. It recognises that quarantine could both save lives and serve coercion, and may draw on Rosenberg's 'framing', Snowden or McKeown.", "id": "q6"}
  ]$mn_disease_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/disease-and-epidemics-in-world-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
