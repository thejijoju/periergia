-- Health and Healing in African History — canonical master article, co-written and human-reviewed.
-- history/regional-histories/africa/health-and-healing-in-african-history @ research/advanced/read.
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
    'history/regional-histories/africa/health-and-healing-in-african-history',
    'research',
    'advanced',
    'read',
    $mn_healthafrica_master$> **Sickness, healing and the mind.** Africans have long used more than one road to healing at once: herbalists and diviners, possession cults and "drums of affliction", Islamic and Christian remedies, and, from the colonial era, hospitals and injections. This chapter follows that plural world and the ideas of misfortune behind it, above all witchcraft; the colonial invention of a racialised "African mind" and the psychiatrists, Fanon and Lambo among them, who challenged it; khat, cannabis and alcohol under colonial rule; and the wounds of recent decades, from child soldiers to HIV/AIDS and grief. It ends with the argument over whether global mental health's categories fit African experience.

## Many roads to therapy

The modern study of African healing began with something patients had long taken for granted. The American anthropologist **John M. Janzen** did fieldwork among the Kongo of the lower Congo in 1964–66 and again from 1969. In *The Quest for Therapy in Lower Zaire* (1978), written with William Arkinstall, he followed how sufferers diagnosed illness, chose treatments and judged the results, a process the authors called "therapy management". The decisions were rarely the patient's alone: a group of kin and associates decided on treatments and combined them. Pluralism was not a halfway stage on the road to biomedicine; it was how healing worked.

In most African therapeutic systems illness does not arise by chance but from spiritual or social imbalance, so diagnosis is often spiritual, and treatment, usually herbal, carries symbolic as well as physical meaning; commonly cited estimates suggest that 60–80 per cent of Africans use traditional remedies. Among the Nguni, Sotho and Tsonga of southern Africa the classic division is between the diviner (*sangoma*, a Zulu term) and the herbalist (*inyanga*), though colonialism, urbanisation and apartheid blurred it and many healers now practise both. A sangoma is "called" through an initiation illness and trains for months or years in *ukuthwasa*, a Xhosa word meaning to "come out" or be reborn, which ends in song and dance. By one estimate South Africa today has up to 200,000 traditional healers against about 25,000 biomedical doctors, and its Traditional Health Practitioners Act of 2007 gives them legal recognition.

Healing could also be collective. Janzen translated the pan-Bantu word *ngoma* as "drum of affliction", the subject of his *Ngoma* (1992). In *Lemba* (1982) he traced one such Kongo cult from about 1650 to 1930: Lemba's sickness, in his reading, came from subordinates' envy of the merchant elite enriched by the Atlantic trade, and the cult healed its members while binding them through marriage and trade alliances. Affliction was a way of talking about wealth and power.

Spirit possession offered another idiom. In the Horn of Africa and neighbouring lands, *zār* spirits possess people, mostly women. Zār rites aim not to expel the spirit but to reconcile it with its host, since possession is often lifelong. In Sudan, *zār bori* belonged to free-born women of the north and *zār tumbura* to descendants of enslaved people from the south and west, and zār is thought to have reached Egypt with enslaved Ethiopian women in the nineteenth century. Janice Boddy's *Wombs and Alien Spirits* (1989), on northern Sudan, is the standard study, and scholars still argue whether possession is best read as women's refuge and resistance, as therapy, or as entertainment.

In Ethiopia and Eritrea the *debtera*, lay clergy of the Orthodox churches, also served as herbalists and makers of amulets against the evil eye and zār spirits, and the Timbuktu manuscript collections, described in the chapter History of Sub-Saharan Africa to 1860, include works on medicine. African knowledge also travelled: smallpox inoculation was practised in parts of Africa before it reached England and North America, and Onesimus, an enslaved West African man in Boston, described it to Cotton Mather, who urged inoculation in the Boston epidemic of 1721.

In "Struggles for Control" (1985) **Steven Feierman** pushed further: health in Africa could not be separated from wider social change, from struggles over land, labour and power, and healers of any kind, biomedical or African, mattered less to population health than is usually assumed. In a published exchange with Pascal James Imperato, who had defended calling African medicine "traditional", Feierman insisted that African practitioners create medical knowledge rather than merely carry a tradition. Both emphases run through the field.

## Witchcraft and the question "why me?"

The classic outside study of African explanations of misfortune is **E. E. Evans-Pritchard**'s *Witchcraft, Oracles and Magic Among the Azande* (1937), based on fieldwork begun in 1926 among the Azande of the Anglo-Egyptian Sudan. His best-known example concerns a granary. When a granary collapses on people sheltering beneath it, the Azande know perfectly well that termites have eaten its supports. What they ask is why it fell at that moment, on those particular people; and the answer to that question is witchcraft. Witchcraft did not excuse human error, incompetence or lying. It answered a different question: not how, but why me.

To identify witches the Azande consulted oracles, above all *benge*, the poison oracle, in which a question was put while a chicken was fed poison. Evans-Pritchard argued that the system was a coherent, rational way of explaining misfortune in its own terms, and that witchcraft worked as a "safety valve" for social conflict. In 1964 the philosopher Peter Winch criticised him for judging Zande beliefs by the standards of Western science.

A later generation insisted that witchcraft was not a relic of tradition at all. Peter Geschiere's *The Modernity of Witchcraft* (French 1995; English 1997), based on fieldwork among the Maka of south-eastern Cameroon, and the collection *Modernity and Its Malcontents* (1993) edited by Jean and John Comaroff, tied witchcraft to postcolonial politics, inequality and the market. The consequences can be grim. In northern Ghana, accused women, many of them widows, some accused by relatives who wanted their husbands' property, have fled to "witch camps" to escape lynching; in 2012 at least six camps housed about 1,000 women, and many residents have mental illnesses. By 2020, despite a government pledge to close them, four camps still housed over 500 people. Accusations against children have also risen this century. UNICEF links them to "urbanization, poverty, conflict and fragmenting communities"; orphanhood caused by AIDS and some Pentecostal-charismatic preachers have also been blamed, and accused children have been beaten in exorcisms, thrown onto the streets or killed.

```checkpoint
q: What did Evans-Pritchard's granary example show about Zande witchcraft?
a*: That witchcraft explained why misfortune struck particular people at a particular moment, alongside ordinary physical causes.
a: That the Azande did not understand that termites weaken wooden supports.
x: The Azande knew perfectly well that termites had eaten the supports; that was not the question witchcraft answered.
a: That witchcraft excused people from blame for their own carelessness.
x: Witchcraft did not excuse human error, incompetence or lying.
a: That the Azande blamed all accidents on the ancestors rather than on witches.
x: In the example the explanation is witchcraft, not the ancestors.
hint: Think of the difference between "how" and "why me".
why: Evans-Pritchard presented witchcraft as a coherent theory of misfortune that worked alongside, not against, practical knowledge.
---
q: How did Peter Geschiere and the Comaroffs change the study of African witchcraft?
a: They showed that witchcraft beliefs had died out after independence.
x: They studied witchcraft's continuing, even growing, importance in postcolonial Africa.
a: They argued that witchcraft was a purely rural survival of precolonial religion.
x: Their point was the opposite: witchcraft was tied to modern politics and markets.
a*: They argued that witchcraft is modern, bound up with postcolonial politics, inequality and the market.
a: They defended Evans-Pritchard against Peter Winch's criticism.
x: Winch's critique was of 1964; Geschiere and the Comaroffs were making a different argument about modernity.
hint: Look at the title of Geschiere's book.
why: Their work helps explain present-day accusations, from Ghana's witch camps to children accused in cities.
```

## Disease, ecology and the colonial clinic

Malaria has exerted what has been called the greatest selective pressure on the human genome in recent history, which is why the sickle-cell trait, protective against malaria, is carried by 10–40 per cent of people across equatorial Africa. Tsetse flies, carriers of sleeping sickness, infest much of sub-Saharan Africa; Marcella Alsan (2015) linked tsetse-suitable land to less use of the plough and less centralised states, though sceptics warn against single-cause explanations. As the chapter Imperial Expansion and Resistance describes, quinine is credited with ending West Africa's reputation as the "white man's grave", and the chapter Modern African History since 1860 tells the story of rinderpest in the 1890s.

Colonial medicine's great campaigns targeted sleeping sickness. An epidemic that broke out in Uganda around 1900–01 eventually killed more than 250,000 people, about two-thirds of the population of the affected lakeshore areas, and in 1903 David Bruce identified the tsetse fly as the vector. The responses were often coercive. Robert Koch's German expedition of 1906–07 treated patients in a camp on the Sese Islands of Lake Victoria with atoxyl, an arsenic compound, and Koch himself reported 22 cases of blindness from it. In Cameroon the French military doctor Eugène Jamot sent mobile teams from village to village to screen and treat whole populations, and he is still honoured there. In the 1950s mass preventive injections of pentamidine (Lomidine) were given across French and other colonies; Guillaume Lachenal's *The Lomidine Files* shows that near Yokadouma, in eastern Cameroon, in November 1954, dozens died after contaminated injections, which he attributes to poorly filtered water used to prepare the drug.

**Megan Vaughan**'s *Curing Their Ills* (1991) is the classic critique of this world: biomedicine claimed scientific neutrality while serving colonial power, in campaigns against venereal disease, in mission hospitals and in psychiatry. Yet Africans were never only patients. James Africanus Beale Horton of Sierra Leone became a British Army surgeon in 1859 and in 1861 urged a medical school in West Africa, ideally headed by an African. Cecilia Makiwane became in 1908 the first African woman registered by the state as a professional nurse in what became South Africa.

## Inventing the "African mind"

Colonial psychiatry began with containment. In 1910 the authorities of British Kenya converted a smallpox isolation centre into the Nairobi Lunatic Asylum, later Mathari Hospital, where Africans made up 95 per cent of patients and were kept in the worst, most overcrowded wards. In Nigeria, asylums such as Yaba in Lagos confined people seen as a public nuisance; Jonathan Sadowsky's *Imperial Bedlam* (1999) shows that many Nigerians regarded them with suspicion and kept going to healers.

The theory came later. **J. C. Carothers**, a South African-born doctor who headed Mathari for twelve years, argued in "Frontal Lobe Function and the African" (1951) that Africans were developmentally childlike, their underdeveloped frontal lobes amounting in effect to a natural leucotomy. In 1953 the WHO published his monograph *The African Mind in Health and Disease*, which psychiatrists and anthropologists reviewed scathingly for its biological determinism. Recalled to Kenya during the Mau Mau rebellion, he wrote *The Psychology of Mau Mau* (1955), which helped guide British psychological warfare that painted the rebels as irrational and bestial. In French Algeria, the "Algiers School" of Antoine Porot described the Algerian Muslim as hysterical, prone to crime and intellectually inferior.

{{image: Frantz Fanon | Frantz Fanon, the Martinican psychiatrist who worked at the Blida-Joinville hospital in Algeria and attacked the racism of colonial psychiatry.}}

The sharpest answer came from inside the profession. **Frantz Fanon**, a psychiatrist from Martinique trained under François Tosquelles, ran a service at the Blida-Joinville Psychiatric Hospital in Algeria from 1953 until his expulsion in January 1957. There he introduced a sociotherapy adapted to patients' cultures, and once the war of independence began he treated both French soldiers who tortured and Algerians who had been tortured. In essays from 1952 onwards he attacked the racist assumptions of colonial medicine, including those of Porot's Algiers School, and he looked for the causes of disorder in colonial violence rather than in African brains. The chapter Decolonization discusses his *The Wretched of the Earth* (1961).

In Nigeria, **Thomas Adeoye Lambo**, born in Abeokuta and a medical graduate of Birmingham, became in 1954 the first indigenous Nigerian to earn a specialty degree in psychiatry in the United Kingdom, according to the historian Matthew Heaton. From 1954 he headed the new Aro Neuro-Psychiatric Hospital at Abeokuta, where he created the Aro Village System: patients lodged in nearby villages, often with relatives, and were treated with modern psychiatry alongside the help of traditional healers. He later became Deputy Director-General of the WHO. Heaton's *Black Skin, White Coats* (2013) argues that Nigerian psychiatrists actively decolonised psychiatric knowledge through a "humanistic universalism", and follows them through debates over "brain fag" and encounters with healers. Local idioms of distress persisted beside the clinic: the Xhosa *amafufunyana*, for example, is described as an extreme form of depression with psychotic features, which healers treat with herbal mixtures.

## Drink, khat and dagga

Colonial states also tried to govern what Africans consumed. The liquor clauses of the Brussels Conference Act of 1890 made it the first international treaty to control a psychoactive substance. In the Gold Coast, as Emmanuel Akyeampong's *Drink, Power, and Cultural Change* (1996) shows, liquor duties were critical to British colonial finances; officials banned local distilling, the illicit spirit *akpeteshie* became linked to the independence struggle.

Khat (*Catha edulis*), whose cultivation began in the Harar region of Ethiopia and which Sufis chewed to intensify devotion, became a target of colonial control: in British Somaliland from the early 1920s, and in Kenya from the 1940s, where the ban aimed at pastoralists in the north while Meru growers were exempt. These controls were eventually suspended as unworkable; in Kenya the ban collapsed under widespread smuggling, which the historians Anderson and Carrier read as African agency. Cannabis (*dagga*) had been widely used among Khoisan and Bantu-speaking peoples of South Africa before 1652; Basotho used it in childbirth. Natal banned its use by Indian indentured workers in 1870, it was criminalised nationally in 1922, and in 1923 South Africa asked the League of Nations to add it to the list of controlled narcotics; the Geneva Opium Convention of 1925, pressed by Egypt with South African support, brought cannabis under international trade control. Racialised settler law thus helped shape global drug control, a theme the chapter History and Drugs explores more widely.

```checkpoint
q: What was the Aro Village System pioneered by Thomas Adeoye Lambo?
a: A network of colonial asylums for confining people judged a public nuisance.
x: That describes colonial asylums such as Yaba; Lambo's model was an alternative to confinement.
a*: Care in which patients lodged in nearby villages, often with relatives, and were treated with modern psychiatry alongside traditional healers.
a: A WHO programme to replace traditional healers with psychiatric nurses.
x: Aro worked with traditional healers rather than replacing them.
a: A study proving that Africans had underdeveloped frontal lobes.
x: That was Carothers's discredited theory, which Lambo's work contradicted.
hint: The patients did not live in the hospital.
why: Aro is an early African model of community-based, culturally adapted mental health care.
---
q: Why did colonial Kenya's khat ban fail?
a: Because the World Health Organization declared khat harmless.
x: The ban failed because of what happened on the ground in Kenya, not because of an international ruling.
a: Because Meru growers persuaded the government to repeal it immediately.
x: The ban was aimed at pastoralists in the north, and it collapsed through smuggling, not repeal on growers' petition.
a: Because Britain banned khat at home and needed the Kenyan supply.
x: Britain's own ban came only in 2014.
a*: Because widespread smuggling made it unworkable.
hint: Think of how consumers and traders responded.
why: Historians read the failure of colonial khat prohibition as an instance of African agency.
```

## Epidemics of the twentieth century

Two older epidemics frame these stories. The influenza pandemic of 1918–19 reached Freetown by ship in late August 1918 and South Africa in September. The historian Howard Phillips gives about 300,000 deaths in South Africa (some estimates go up to 350,000), mostly within six weeks of his "Black October"; in the Gold Coast influenza killed at least 100,000 people. Smallpox made its last natural stand in the Horn of Africa. The last person in the world to catch it naturally was **Ali Maow Maalin**, a hospital cook and occasional vaccinator in Merca, Somalia, infected in October 1977. He had avoided vaccination because, he later said, "it looked like the shot hurt".

## HIV/AIDS: denial, treatment and grief

AIDS was identified in 1981. In south-western Uganda in the early 1980s the disease was known as "Slim", and many sufferers first consulted healers. Sub-Saharan Africa carries about two-thirds of the world's people living with HIV, and at the epidemic's height life expectancy collapsed: in Eswatini it fell by about ten years between 1990 and 2009.

From 1999 to 2008 AIDS denialism shaped South African policy under President Thabo Mbeki. In 2000 he convened an advisory panel of 33 scientists, about half of them denialists, and in a letter to Bill Clinton he called AIDS a "uniquely African catastrophe". That July more than 5,000 scientists signed the Durban Declaration that HIV causes AIDS. His health minister promoted garlic, beetroot and lemon juice over antiretroviral drugs. His motives remain debated; some link them to suspicion of Western medicine and of racial stereotypes about African sexuality. Modelling studies have tried to count the cost. Chigwedere and colleagues (2008) estimated that more than 330,000 lives were lost over 2000–05 because a feasible antiretroviral programme was not implemented, and about 35,000 babies born with HIV for lack of a mother-to-child prevention programme; Nicoli Nattrass estimated about 343,000 deaths.

The answer came from people living with the virus. The Treatment Action Campaign, founded in 1998 by Zackie Achmat and others after the death of the gay anti-apartheid activist Simon Nkoli, won a Constitutional Court case that obliged the government to provide nevirapine to prevent mother-to-child transmission in public clinics. Achmat, himself HIV-positive, refused antiretrovirals until all South Africans could get them, and began taking them only in 2003, when a TAC congress urged him to. In September 2008 the new health minister, Barbara Hogan, broke with the past.

```quote
The era of denialism is over completely in South Africa.
Barbara Hogan · to the New York Times · 2008
```

Africans on antiretroviral treatment rose from 1 million in 2005 to 7.1 million in 2012, but the epidemic left a long shadow of loss. Grandmothers nursed dying adult children and then raised the orphans; children took on earning and caring roles; and orphanhood itself fed the accusations against child "witches". Healers remained part of the response, some trained in HIV prevention, though some herbal remedies could interfere with treatment.

## War, trauma and the limits of categories

Charles Taylor's rebel forces in Liberia had "Small Boy Units", and about 21,000 Liberian child soldiers still needed demobilising in early 2004; in Mozambique both FRELIMO and RENAMO used children. Ishmael Beah's memoir *A Long Way Gone* (2007) gave one former child soldier from Sierra Leone a global readership.

How to heal them was contested. Post-traumatic stress disorder entered American psychiatry's diagnostic manual in 1980, shaped largely by Vietnam veterans. Anthropologists question whether its criteria travel: forcing local idioms of distress, such as soul loss or affliction by spirits, into a category built for post-Vietnam America is what they call a "category fallacy". The Mozambican anthropologist **Alcinda Honwana**, in *Child Soldiers in Africa* (2006), documented the cleansing and purification rites through which communities in Mozambique and Angola freed former fighters from a tainted past, protected them from the spirits of the dead, and settled the spirits of relatives killed without proper funerals. Healing, in this view, was collective and spiritual as well as individual. Official categories failed in other ways too: Mozambican child soldiers under fifteen were excluded from demobilisation benefits because they did not fit the definition of a "soldier".

## Epidemics, institutions and the global mental health debate

The West African Ebola epidemic of 2013–16, centred on Guinea, Liberia and Sierra Leone, killed 11,310 people. Weak health systems, distrust of governments after years of war, a delayed response and burial customs of washing the dead all fed it, and 22,000 children lost one or both parents. In Lagos the endocrinologist Ameyo Adadevoh kept Nigeria's first patient in isolation despite pressure to release him; she died of the disease, and Nigeria was declared Ebola-free in October 2014. In 2026 a new Ebola epidemic, caused by the Bundibugyo virus, against which existing Ebola vaccines and treatments were not designed, was first reported in May in Ituri, eastern DR Congo; by early November 2026 more than 5,000 deaths had been reported, mostly in the DRC.

Beside these emergencies runs an argument about the mind. Advocates of global mental health stress a "treatment gap": an estimated 76–85 per cent of people with severe mental disorders in low- and middle-income countries receive no treatment, against 35–50 per cent in high-income countries. Critics such as China Mills, in *Decolonizing Global Mental Health*, and Ethan Watters, in *Crazy Like Us*, see a neo-colonial, "missionary" project that medicalises distress and ignores local understandings and healers. African history offers a warning to each side. Carothers shows a universal science built on racial assumptions; Lambo's Aro villages, Fanon's ward at Blida and the cleansing rites Honwana documented show care that took local meanings seriously. Janzen's patients, combining clinic and diviner, had long practised the pluralism the debate keeps rediscovering.

## Further exploration

- **Megan Vaughan, *Curing Their Ills: Colonial Power and African Illness* (1991).** The classic critique of colonial biomedicine, psychiatry and mission medicine in East and Central Africa.
- **Steven Feierman and John M. Janzen, eds., *The Social Basis of Health and Healing in Africa* (1992).** The foundational collection on African therapeutic systems and the social history of disease.
- **Matthew M. Heaton, *Black Skin, White Coats: Nigerian Psychiatrists, Decolonization, and the Globalization of Psychiatry* (2013).** Lambo, Aro and the decolonisation of psychiatry.
- **Alcinda Honwana, *Child Soldiers in Africa* (2006).** A Mozambican anthropologist on war, childhood and healing rituals in Mozambique and Angola.
- **Abena Dove Osseo-Asare, *Bitter Roots: The Search for Healing Plants in Africa* (2014).** Healers, scientists and drug companies in Ghana, Madagascar and South Africa.
- **John Iliffe, *The African AIDS Epidemic: A History* (2006).** A concise historical synthesis of why Africa suffered such an epidemic.
- **Guillaume Lachenal, *The Lomidine Files: The Untold Story of a Medical Disaster in Colonial Africa* (2014; English 2017).** Colonial mass prophylaxis against sleeping sickness and its victims.$mn_healthafrica_master$,
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
  select $mn_healthafrica_quiz$[
    {"type": "mcq", "prompt": "What did John Janzen's The Quest for Therapy in Lower Zaire (1978) show about how Kongo patients sought healing?", "options": ["That kin and community managed the sufferer's care and combined biomedicine with African therapies", "That patients abandoned healers as soon as mission hospitals opened", "That only diviners, never herbalists, were consulted for serious illness", "That colonial law prevented any use of African medicine"], "answerIndex": 0, "explanation": "Janzen described 'therapy management' by a group of kin and community, who used medical systems in combination; pluralism was the norm, not a transitional stage.", "id": "q1"},
    {"type": "mcq", "prompt": "What did J. C. Carothers argue in 'Frontal Lobe Function and the African' (1951)?", "options": ["That colonial violence was the main cause of mental disorder in Africa", "That African healers should work alongside psychiatrists", "That Africans were developmentally childlike because of underdeveloped frontal lobes", "That PTSD was a category fallacy"], "answerIndex": 2, "explanation": "Carothers's racialised theory, followed by his WHO monograph The African Mind in Health and Disease (1953), was reviewed scathingly for its biological determinism.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Treatment Action Campaign win in South Africa's Constitutional Court?", "options": ["The resignation of President Thabo Mbeki", "The legal recognition of traditional healers", "The decriminalisation of cannabis", "An order that the government provide nevirapine in public clinics to prevent mother-to-child transmission of HIV"], "answerIndex": 3, "explanation": "TAC, founded in 1998 by Zackie Achmat and others, won the case on the constitutional right to health care.", "id": "q3"},
    {"type": "mcq", "prompt": "Who identified the tsetse fly as the vector of sleeping sickness in 1903?", "options": ["Eugène Jamot", "David Bruce", "Robert Koch", "James Africanus Beale Horton"], "answerIndex": 1, "explanation": "Bruce had earlier shown that the trypanosome caused nagana in cattle and horses. Jamot later led mobile screening teams in Cameroon.", "id": "q4"},
    {"type": "open", "prompt": "How did colonial psychiatry construct an 'African mind', and how did Fanon and Lambo challenge it?", "rubric": "A strong answer describes colonial asylums (Mathari in Nairobi, Yaba in Lagos) as institutions of containment; Carothers's frontal-lobe theory, his 1953 WHO monograph and its use in the Mau Mau war; and Porot's Algiers School. It explains Fanon's critique of the Algiers School's biologism and racism, his sociotherapy at Blida-Joinville and his attention to colonial violence, and Lambo's Aro Village System combining psychiatry with traditional healers and family care. It may use Heaton's 'humanistic universalism', Sadowsky on Nigerian suspicion of asylums, and Vaughan on biomedicine and colonial power.", "id": "q5"},
    {"type": "open", "prompt": "Do Western psychiatric categories such as PTSD fit African experiences of war and loss? Discuss with reference to historians and anthropologists.", "rubric": "A strong answer explains PTSD's origin in DSM-III (1980) and post-Vietnam America, and the anthropologists' 'category fallacy' critique of applying it across cultures. It uses Honwana's work on cleansing and purification rites for former child soldiers in Mozambique and Angola, and may cite Liberia's Small Boy Units or Ishmael Beah. It weighs the global mental health movement's 'treatment gap' argument against critics such as China Mills and Ethan Watters, and may draw on Lambo's Aro model, Janzen's medical pluralism, HIV-related grief and orphanhood, or idioms of distress such as amafufunyana.", "id": "q6"}
  ]$mn_healthafrica_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/africa/health-and-healing-in-african-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
