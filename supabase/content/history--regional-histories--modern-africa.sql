-- Modern African History since 1860 — canonical master article, co-written and human-reviewed.
-- history/regional-histories/africa/modern-african-history-since-1860 @ research/advanced/read.
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
    'history/regional-histories/africa/modern-african-history-since-1860',
    'research',
    'advanced',
    'read',
    $mn_modafrica_master$> **A continent remade, and remaking itself.** In the 1870s Europeans held about a tenth of Africa; by 1914 only Ethiopia and Liberia remained independent. Within another lifetime nearly all of it was independent again, and today Africa holds nearly one person in five on Earth. This chapter follows that story with African actors at its centre: conquest and the cattle plague that eased it; colonial rule, forced labour, mines and peasant cash crops; the prophets and thinkers who made Christianity and Islam African; the new states, their ideologies, coups and wars; debt, structural adjustment and the democratic openings of the 1990s; the young, urban continent of today; and the arguments historians have had about how to tell this history at all.

## Conquest and Resistance in Brief

As late as the 1870s Europeans controlled roughly a tenth of the continent, almost all of it near the coasts. By 1914 only Ethiopia and Liberia, declared independent by Americo-Liberian settlers in 1847, were free. As the chapter on Imperial Expansion and Resistance describes in detail, the partition was agreed in outline at the Berlin Conference of 1884–85, to which no African state was invited, and carried out over the following decades.

Africans resisted it everywhere. Samori Touré resisted the French in West Africa until 1898 and died in exile in Gabon in 1900. At **Adwa** on 1 March 1896 the Ethiopian army of Menelik defeated an Italian invasion, the victory that kept Ethiopia independent. Elsewhere conquest brought mass death. In King Leopold II's **Congo Free State**, which had no census before 1924, estimates of the population loss run from about 1.2 million to 10 million, with disease the main direct killer: Adam Hochschild, extrapolating from Jan Vansina's earlier estimate that the population of the rubber regions halved, gives about ten million; Vansina later criticised Hochschild for extending the toll of the worst rubber districts to the whole colony, and the demographer Sanderson argues for one to five million. In German South West Africa (now Namibia), estimates of the Herero who died in and after the war of 1904 run from 40,000 to 80,000, about four-fifths of the people, with some 10,000 Nama, about half. In German East Africa the **Maji Maji** rising began in July 1905 when villagers destroyed a cotton crop they had been forced to grow; estimates of the dead by 1907 range from 75,000 to 300,000, most from famine.

## The Cattle Plague

One catastrophe of these years had no general. **Rinderpest**, a disease of cattle, is usually thought to have reached Africa with infected animals imported from Asia to feed the Italian army in its war with Ethiopia of 1887–89. In the 1890s it swept through eastern and southern Africa. About nine in ten of Ethiopia's cattle died, and 80–90 per cent of the herds of Fulani pastoralists. In the famine that followed, by rough estimates, perhaps a third of Ethiopia's people and two-thirds of the Maasai of what is now Tanzania died.

```quote
Never before in the memory of man, or by the voice of tradition, have the cattle died in such vast numbers; never before has the wild game suffered.
Frederick Lugard · on the rinderpest epizootic · 1890s
```

{{image: 1890s African rinderpest epizootic | Cattle killed by the rinderpest epizootic of the 1890s, which devastated herding peoples across eastern and southern Africa.}}

The epizootic eased further conquest: it brought famine and economic dislocation just as European armies advanced, and it changed the land itself, as grassland gave way to thornbush.

## Ruling Africa

**Indirect rule** is traced to Frederick Lugard, High Commissioner of the Protectorate of Northern Nigeria from 1900 to 1906, who held that because Europeans and Africans were culturally different, Africans had to be governed through their own institutions. Forms of it were used well beyond British Africa, from French Algeria to Belgian Rwanda; the chapter on the British Empire follows its workings through emirs and "warrant chiefs".

France governed its African subjects under the **Code de l'indigénat**, a shifting set of arbitrary regulations that gave them an inferior legal status. Decreed for Algeria in 1881, it spread across most of French Africa by 1910 and was officially abolished only in 1946. Portugal, which formally abolished slavery in 1869, relied on **chibalo**, a system of forced labour and debt bondage in Angola and Mozambique that outlasted slavery itself; under Salazar's Estado Novo it was used in Mozambique to grow cotton, build roads and serve settlers.

In settler colonies Europeans took land as well as power; the Union of South Africa, formed in 1910 from four colonies, was the largest. Colonial rule could also harden identities. In Rwanda, occupied by Belgium in 1916, compulsory identity cards labelled every person Tutsi, Hutu or Twa, freezing categories that had once been permeable, while missionaries spread the "Hamitic" theory that the Tutsi had come from outside Africa. Those cards would be checked at the roadblocks of 1994.

## Colonial Economies

Colonies were meant to pay, and where capital was short the state took labour. The **Congo–Ocean Railway** in French Equatorial Africa was built between 1921 and 1934 by forced labourers recruited from what are now southern Chad and the Central African Republic; at least 17,000 of them died from accidents and disease. André Gide and Albert Londres exposed it to French readers. In what is now Mali the **Office du Niger**, founded in 1932, was planned to irrigate 1.85 million hectares; tens of thousands were forced to work on it, yet by 1948 it irrigated only about 20,000.

Mining created a different economy. Diamonds were found near Hopetown in 1867 and at Kimberley in 1871, and gold on the Witwatersrand in 1886, in what proved the world's largest goldfield; the rush founded Johannesburg. The mines ran on **migrant labour**. Their recruiting agency, the Witwatersrand Native Labour Association, or "Wenela", eventually used depots, buses and aeroplanes to draw men from Basutoland, Bechuanaland, the Rhodesias, Nyasaland, Angola, Mozambique and beyond; recruits learned Fanagalo, the mines' lingua franca. Further north the **Copperbelt** straddled what is now Zambia and the Belgian Congo's Katanga, drawing migrant workers from across the region.

Yet much export wealth was grown by Africans on their own farms. Ghana's cocoa, mostly from peasant plots of under three hectares, made it the world's largest producer by the early 1960s. In Senegal, the Sufi **Mouride** order founded in 1883 by Amadou Bamba (born about 1853) built its own economy around groundnuts, the colony's main cash crop. The French exiled Bamba to Gabon in 1895 for more than seven years, but his doctrine of salvation through work and submission to the shaykh sent young disciples to farm marginal land, and after the First World War the order and the administration cooperated. The Mourides show Africans turning a colonial economy to their own religious ends.

Late-colonial "development" could fail spectacularly: Britain's **Tanganyika groundnut scheme**, meant to grow groundnuts for margarine on three million acres, cost £36 million and was abandoned in 1951.

```checkpoint
q: Why does the 1890s rinderpest epizootic matter to the history of colonial conquest?
a*: It killed most of the cattle in large regions, causing famine and dislocation that weakened African societies just as European armies advanced.
a: It killed most of the European soldiers sent to Africa, slowing conquest for a decade.
x: Rinderpest is a disease of cattle; its human toll came through famine.
a: It was deliberately spread by the Berlin Conference powers.
x: On the usual account it arrived with cattle imported from Asia to feed the Italian army in 1887–89; it was not a deliberate policy.
a: It affected only North Africa and spared the herding peoples of the east.
x: It swept through eastern and southern Africa, devastating the Maasai and Ethiopian herds.
hint: Think of what happens to a herding society when nine in ten of its cattle die.
why: The epizootic created famine and economic dislocation that facilitated further conquest.
---
q: Which of these is an example of Africans shaping a colonial economy to their own ends?
a: The Congo–Ocean Railway.
x: The railway was built by forced labourers, at least 17,000 of whom died.
a: The Tanganyika groundnut scheme.
x: That was a British government scheme of 1946–51, which failed and was abandoned.
a*: The Mouride order's groundnut-growing communities in Senegal.
a: The Code de l'indigénat.
x: That was a French legal regime imposing an inferior status on colonial subjects.
hint: Look for an African religious movement.
why: Amadou Bamba's disciples grew the colony's main cash crop in communities organised around a Sufi doctrine of work, and the order bargained with the French.
```

## Faith, Prophets and Thinkers

There were under ten million African Christians in 1900; there are over 700 million today. Muslims make up between a third and nearly half of Africans, by different estimates. The Christian growth was African-led. **Samuel Ajayi Crowther**, a Yoruba freed from a slave ship by the Royal Navy, became Bishop of the Niger in 1864, the first African Anglican bishop in West Africa. In 1913–14 the Liberian prophet **William Wadé Harris**, in white robe and turban, baptised more than 100,000 people in eighteen months, leaving hundreds of "Harris" churches in Côte d'Ivoire. In the Belgian Congo **Simon Kimbangu** founded his movement in April 1921; the Belgians saw it as a threat to the colonial labour order and imprisoned him until his death in 1951, but his church was recognised in 1959. The **Aladura** ("praying people") churches arose in western Nigeria from about 1918 amid epidemics of influenza, smallpox and plague; in southern Africa "Ethiopian" churches taught that Black Christians should control African churches. Mission-educated Christians could also lead revolt, as John Chilembwe did in Nyasaland in 1915.

**Edward Wilmot Blyden**, sometimes called the father of Pan-Africanism, spoke of an "African Personality" and argued in *Christianity, Islam and the Negro Race* (1887) that Islam united Africans better than Christianity. In 1900 the Trinidadian barrister Henry Sylvester Williams called the first Pan-African Conference in London, against land theft and racial discrimination. The South African Native National Congress, later the ANC, was founded at Bloemfontein in January 1912, and the National Congress of British West Africa, with the Gold Coast barrister J. E. Casely Hayford prominent, in Accra in 1920. The later Pan-African Congresses and Négritude belong to the chapter on the Interwar Period.

## War and Independence

Africans fought and carried for Europe's empires in both world wars, as the chapters on the First World War and the Second World War show, from the hundreds of thousands of carriers in East Africa in 1914–18 to the killings of African soldiers by French troops at Thiaroye in 1944.

The chapter on Decolonization tells how independence came: Ghana in 1957; seventeen colonies in 1960, the "Year of Africa"; the war in Algeria; Zimbabwe in 1980; and Portugal's colonies, Mozambique and Angola among them, only in 1974–75, after the Carnation Revolution in Lisbon. On 25 May 1963 thirty-two states (some count thirty-three) founded the **Organisation of African Unity** in Addis Ababa. In the Congo, independence in 1960 collapsed into a five-year crisis that cost Patrice Lumumba his life. Frantz Fanon's *The Wretched of the Earth* (1961) gave the anti-colonial struggle its most searing theory. In South Africa, from Sharpeville in 1960 and Soweto in 1976, the liberation struggle ended only with the election of April 1994 that made Nelson Mandela president, as the chapter on Apartheid and Its End tells.

## Building New States

The new states' leaders tried very different answers. Kwame Nkrumah made Ghana a one-party state with himself president for life in 1964 and was overthrown by soldiers on 24 February 1966. In Tanzania **Julius Nyerere** sought an African socialism, *ujamaa*. The **Arusha Declaration** of 5 February 1967 nationalised banks, natural resources and major industries, and from 1973 to 1975 Operation Vijiji forced villagisation on millions; by Nyerere's own account, as quoted by John Shao, over seven million people were moved by June 1975. The results are still argued over: adult literacy rose from 17 per cent in 1960 to 63 per cent in 1975, and life expectancy from 37 to 52 between 1960 and 1984, but Nyerere ruled through a single party, detained opponents without trial, and his successor Ali Hassan Mwinyi reversed many of his economic policies after 1985.

**Mobutu Sese Seko**, president of Congo from 1965 to 1997, renamed it Zaire, launched an "authenticity" campaign, and ran a regime widely called a kleptocracy; estimates of his fortune range from \$50 million to \$5 billion. In Uganda **Idi Amin** (1971–79) expelled most of Uganda's roughly 80,000 Asians in 1972. Estimates of those killed under his rule range from 100,000 to 500,000: the International Commission of Jurists put it at no fewer than 80,000 and more likely about 300,000, while exile groups working with Amnesty International gave 500,000. In Ethiopia the emperor Haile Selassie, on the throne since 1930, was deposed by the military Derg in 1974. Then there was **Thomas Sankara**, the Marxist pan-Africanist who ruled Burkina Faso from 1983 until his assassination in 1987. His government ran mass literacy and vaccination campaigns, planted over ten million trees against desertification, and banned female circumcision, forced marriage and polygamy; Blaise Compaoré succeeded him.

## Coups and Wars

Sankara, like many, came to power by coup. On data compiled by the political scientists Powell and Thyne up to 2023, Africa has seen more coup attempts since 1950 than any other region: 220, of which 109 succeeded. Sudan led with eighteen attempts; Burkina Faso had ten, nine of them successful.

In Nigeria, a coup and counter-coup in 1966 and pogroms against Igbo in the north led to the secession of **Biafra** and civil war from 1967 to 1970. The federal blockade, a deliberate policy, starved Biafra. Estimates of Biafran civilian deaths, mostly from starvation, run from half a million to two million or more; some recent estimates put the war's total toll at 500,000 to one million. In **Sudan**, the second civil war (1983–2005) killed roughly two million people on the estimates of the US Committee for Refugees and others, though some say one to two million, most of them from starvation, and displaced four million southerners; South Sudan became independent in 2011, only to fall into its own civil war in 2013. In Ethiopia the famine of 1983–85, caused by drought, civil war and the Derg's policies, affected 7.75 million people and killed, by estimates that vary widely, from more than 300,000 (USAID's figure) to 1.2 million.

The Cold War made Angola, Mozambique and the Horn of Africa proxy battlefields, as the chapter on the Global Cold War and the Arms Race explains. After it, as the chapter on Modern Conflicts since 1991 sets out, came the genocide in **Rwanda** in 1994, in which most scholarly estimates put the Tutsi killed at about 500,000 to 662,000, with moderate Hutu and Twa also murdered (the government's count of over a million was judged not credible by a 2020 scholarly symposium); and the **Second Congo War** of 1998–2003, which drew in nine African states. Its toll is disputed: the International Rescue Committee estimated 5.4 million excess deaths for 1998–2007, while the Human Security Report Project revised the toll for 2001–07 to about 860,000.

## Debt, Adjustment and Democracy

The OAU's **Lagos Plan of Action** (1980) blamed largely external causes and called for self-sufficiency, food security and regional industrial co-operation. It was soon supplanted by the World Bank's **Berg Report** of 1981, which blamed African governments' own policies. Through the 1980s most countries of sub-Saharan Africa accepted IMF and World Bank loans conditional on **structural adjustment**: liberalisation, privatisation, devaluation and balanced budgets. As the chapter on the Neoliberal Age shows, critics blamed adjustment for deindustrialisation and cuts to health and education, while Ghana, adjusting from 1983 under Jerry Rawlings, who had seized power by coup, was held up as a success. Debt relief came slowly: the Heavily Indebted Poor Countries initiative, launched in 1996, had helped only four countries by 1999, though 37 countries, most of them African, eventually had debts cancelled, the last Somalia in December 2023.

A democratic wave followed. In February 1990 Benin held the first "national conference" in francophone Africa, which stripped the Marxist–Leninist military ruler Mathieu Kérékou of his powers; he later returned to office by election. In June 1990, at La Baule, President Mitterrand urged France's African partners to adopt multiparty democracy, a speech read as tying French aid to reform, though commentators dispute that African democratisation began there; Benin's conference had come five months earlier. Bratton and van de Walle, in *Democratic Experiments in Africa* (1997), found that almost every country in sub-Saharan Africa underwent significant political reform between 1989 and 1994. In 2005 Ellen Johnson Sirleaf of Liberia was elected Africa's first female head of state.

Military rule has not gone away. A run of coups in Mali, Chad, Guinea, Sudan, Burkina Faso, Niger and Gabon between 2020 and 2023 earned the region the name "Coup Belt"; since 1990, 21 of 27 coups in sub-Saharan Africa have taken place in former French colonies. In September 2023 the juntas of Mali, Burkina Faso and Niger formed the Alliance of Sahel States, denouncing French "neo-colonialism", and in 2025 all three left the regional bloc ECOWAS.

```checkpoint
q: What does Benin's national conference of February 1990 suggest about the causes of Africa's democratic wave?
a: That democratisation was simply imposed by France after the La Baule speech.
x: Benin's conference came five months before La Baule, which is why commentators dispute that the wave began there.
a*: That internal pressures mattered, since Africans were already forcing political change before France's call for multiparty democracy.
a: That military rulers never lost power in francophone Africa.
x: The conference stripped Kérékou, a military ruler, of his powers.
a: That democratisation came only after the HIPC debt relief of 1996.
x: The conference was in 1990, six years before HIPC was launched.
hint: Compare the date of the conference with the date of La Baule.
why: Historians weigh external pushes (the end of the Cold War, donor conditions) against internal drivers such as Benin's conference and protest movements.
---
q: Which statement about Julius Nyerere's ujamaa is best supported by the evidence?
a: It was a market-led reform programme backed by the World Bank.
x: Ujamaa was an African socialism that nationalised banks and major industries.
a: It produced economic success and was continued unchanged after 1985.
x: Nyerere's successor Ali Hassan Mwinyi reversed many of its policies.
a: It was entirely voluntary and involved no coercion.
x: Operation Vijiji forced villagisation on millions between 1973 and 1975.
a*: It brought real gains in literacy and health but also forced villagisation, detention without trial and economic failure.
hint: Historians weigh its social record against its methods.
why: Adult literacy rose from 17 to 63 per cent by 1975, but the gains came with coercion and one-party rule.
```

## Africa Today

Africa's population passed one billion in 2009 and now exceeds one and a half billion, about 19 per cent of humanity; UN projections suggest some 2.5 billion by 2050 and 3.8 billion by 2100, over a third of the world. With a median age of about 19, against about 43 in Europe, it is the youngest continent. It is urbanising fast: at most 11 per cent of Africans lived in towns in 1900, and over 37 per cent in 2000. Lagos, with an estimated 17 to 21 million people, is Africa's largest urban area; Kinshasa has about 18.5 million.

The **African Union**, launched in Durban on 9 July 2002, has 55 member states and has joined the G20. Almost every African state has signed the **African Continental Free Trade Area** agreement of 2018. China became Africa's largest trading partner in 2009; trade between them grew from \$1 billion in 1980 to \$55 billion in 2006. Whether Chinese lending is a "debt trap" is disputed: Deborah Brautigam's research found no evidence of deliberate "debt-trap diplomacy", and the Kenyan economist Anzetse Were points instead to African states' weak bargaining positions and lack of fiscal transparency: African governments are negotiators, not just targets.

M-Pesa, launched in Kenya in 2007, let people send money by mobile phone; a widely cited study by Tavneet Suri and William Jack in *Science* (2016) found that it lifted 194,000 households, about 2 per cent of Kenya's, out of poverty, though its fees have been criticised. African culture reached the world, from Chinua Achebe's *Things Fall Apart* (1958) and Wole Soyinka's Nobel Prize in 1986, the first for a Black African writer, to Nigeria's Nollywood video films, usually dated from *Living in Bondage* (1992), and the Afrobeats pop of the 2000s and 2010s. Sub-Saharan Africa has carried over two-thirds of the world's HIV infections, and the West African Ebola epidemic of 2013–16 killed 11,310 people. In April 2015, after the Rhodes Must Fall protests at the University of Cape Town, Cecil Rhodes's statue was removed; the students demanded the "decolonisation" of education.

## Writing Modern Africa's History

That demand has a long history. In lectures broadcast by the BBC in 1963 the historian Hugh Trevor-Roper said, in words reproduced slightly differently in different sources, "Perhaps, in the future, there will be some African history to teach." For now there was only the history of the Europeans in Africa: "The rest is largely darkness." Hegel had said much the same in lectures of the 1820s, published in 1837, and African historians had already answered. The **Ibadan School** in Nigeria, around Kenneth Dike and J. F. Ade Ajayi, combined archives with oral tradition, and the Dar es Salaam School around Terence Ranger presented modern nations as continuations of the African past.

Historians still argue over what colonialism meant. Ajayi called it, in a famous essay of 1969, "an episode in African history"; Peter Ekeh replied that it was an epoch that transformed everything. Walter Rodney's *How Europe Underdeveloped Africa* (1972) brought dependency theory to African history, arguing that Africa developed Europe at the same rate as Europe underdeveloped Africa. (Rodney was killed by a car bomb in Guyana in 1980.) The economist Nathan Nunn traces part of today's poverty further back, to the long-term effects of the slave trades. Mahmood Mamdani's *Citizen and Subject* (1996) argued that the colonial state split people into citizens and "native" subjects ruled by a "decentralised despotism" of chiefs, a legacy the independent states inherited; Ranger's chapter on Africa in *The Invention of Tradition* (1983), edited with Eric Hobsbawm, launched the argument that many supposedly ancient "tribal" traditions were colonial inventions. Frederick Cooper described the post-colonial "gatekeeper state", strong where it met the world economy and weak within. And observers have swung between moods: *The Economist* called Africa "The Hopeless Continent" in May 2000 and celebrated "Africa Rising" in December 2011, while many Africans rejected "Afro-pessimism" for what they called "Afro-realism".

## Further exploration

- **John Iliffe, *Africans: The History of a Continent* (1995; 3rd ed. 2017).** The standard one-volume history by a Cambridge Africanist, strong on population and demography.
- **Richard J. Reid, *A History of Modern Africa: 1800 to the Present* (2009; 3rd ed. 2019).** A modern survey stressing African agency and the nineteenth-century roots of the modern continent.
- **Paul Nugent, *Africa Since Independence: A Comparative History* (2004).** A comparative history of the post-colonial states.
- **Frederick Cooper, *Africa since 1940: The Past of the Present* (2002).** Late colonialism, decolonisation and the "gatekeeper state".
- **Mahmood Mamdani, *Citizen and Subject: Contemporary Africa and the Legacy of Late Colonialism* (1996).** How indirect rule's "decentralised despotism" shaped the post-colonial state.
- **Walter Rodney, *How Europe Underdeveloped Africa* (1972).** The Guyanese historian's classic of dependency theory.
- **Deborah Brautigam, *The Dragon's Gift: The Real Story of China in Africa* (2009).** An evidence-based corrective on Chinese aid and loans.$mn_modafrica_master$,
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
  select $mn_modafrica_quiz$[
    {"type": "mcq", "prompt": "According to the usual account, how did rinderpest reach Africa in the late nineteenth century?", "options": ["With infected cattle imported from Asia to feed the Italian army in its war with Ethiopia of 1887–89", "With British settlers arriving in Kenya after 1920", "Through the Atlantic slave trade in the eighteenth century", "With camels brought across the Sahara by the Mahdist army"], "answerIndex": 0, "explanation": "On the usual account, rinderpest arrived with cattle imported from Asia to feed Italian forces in 1887–89 (one study finds no contemporary evidence for this route), then swept through eastern and southern Africa in the 1890s, killing about nine in ten of Ethiopia's cattle and causing famine.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the Portuguese system known as chibalo?", "options": ["A form of indirect rule through Muslim emirs", "A peasant cocoa cooperative in Angola", "A system of forced labour and debt bondage in Angola and Mozambique that outlasted the formal abolition of slavery in 1869", "A Sufi order that grew groundnuts in Mozambique"], "answerIndex": 2, "explanation": "Chibalo was forced labour and debt bondage; under Salazar's Estado Novo it was used in Mozambique to grow cotton, build roads and serve settlers.", "id": "q2"},
    {"type": "mcq", "prompt": "According to the data compiled by Powell and Thyne up to 2023, which statement about coups in Africa is correct?", "options": ["Africa has had fewer coup attempts since 1950 than Latin America", "No African coup has succeeded since 1990", "Most African coups have taken place in former British colonies", "Africa has had more coup attempts since 1950 than any other region: 220, of which 109 succeeded"], "answerIndex": 3, "explanation": "Africa leads the world with 220 attempts and 109 successes; Sudan had the most attempts (18), and since 1990 most coups in sub-Saharan Africa have been in former French colonies.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the World Bank's Berg Report of 1981 argue, in contrast to the OAU's Lagos Plan of Action?", "options": ["That Africa's crisis was caused mainly by external shocks", "That Africa's economic problems stemmed largely from African governments' own policies", "That African states should pursue regional industrial self-sufficiency", "That all African debt should be cancelled immediately"], "answerIndex": 1, "explanation": "The Lagos Plan (1980) stressed external causes and self-sufficiency; the Berg Report blamed domestic policies and became the template for structural adjustment.", "id": "q4"},
    {"type": "open", "prompt": "Was colonialism 'an episode' or an epoch in African history? Discuss with reference to historians' arguments and at least two examples from the colonial period.", "rubric": "A strong answer explains J. F. Ade Ajayi's 1969 view of colonialism as an episode in a longer African history, and Peter Ekeh's reply stressing its transforming force. It may draw on Rodney's underdevelopment thesis, Mamdani's 'decentralised despotism', Ranger on invented traditions, or Cooper's 'gatekeeper state'. Examples might include forced labour (the Congo–Ocean Railway, chibalo), migrant labour to the Rand, Belgian identity cards in Rwanda (continuity vs transformation), or African initiative within colonial structures such as the Mouride groundnut economy, Ghanaian peasant cocoa, or the African-led churches of Harris, Kimbangu and Aladura.", "id": "q5"},
    {"type": "open", "prompt": "Compare two post-independence leaders or regimes and assess what they reveal about the choices and constraints facing new African states.", "rubric": "A strong answer compares, for example, Nyerere's ujamaa (Arusha Declaration 1967; forced villagisation 1973–75; literacy rising from 17 to 63 per cent; one-party rule and detention without trial), Nkrumah's one-party state and overthrow in 1966, Mobutu's kleptocracy, Amin's rule (deaths estimated at 100,000–500,000, with the ICJ and Amnesty-linked exile groups giving different figures), or Sankara's literacy, vaccination and tree-planting campaigns. It discusses constraints such as export-dependent economies, the Cold War, coups, debt and structural adjustment, and weighs genuine achievements against coercion and failure.", "id": "q6"}
  ]$mn_modafrica_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/africa/modern-african-history-since-1860', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
