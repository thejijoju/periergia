-- Women in African History — canonical master article, co-written and human-reviewed.
-- history/regional-histories/africa/women-in-african-history @ research/advanced/read.
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
    'history/regional-histories/africa/women-in-african-history',
    'research',
    'advanced',
    'read',
    $mn_womenafrica_master$> **Women made African history as rulers, traders, soldiers, prophets, organisers and scholars, and some of them made money from slavery too.** This chapter follows women's power across more than two thousand years: the queens of Kush and the queen mothers of West Africa; Njinga and the women soldiers of Dahomey; merchant queens, some of them slave traders; prophets and spirit mediums from Kimpa Vita to Nehanda; the colonial erosion of women's institutions and the Women's War of 1929; nationalist and liberation movements; and leaders from Funmilayo Ransome-Kuti to Ellen Johnson Sirleaf and Wangari Maathai. It ends with the scholars, most of them African women, who recovered this history and still argue over what it means.

## Queens, kandakes and queen mothers

The oldest figures in this chapter are the *kandakes* of Kush. *Kandake* was a Meroitic title for a queen or queen mother, attested for six or seven women; some ruled, others were probably royal wives or mothers. Greek and Roman writers mistook it for a personal name, "Candace". At least ten queens regnant of Meroë are counted between about 260 BCE and 320 CE, and royal stelae show kings with their mothers and wives.

The best known, **Amanirenas**, ruled in the later first century BCE; inscriptions give her both the female title *kandake* and the male ruler's title *qore*, which suggests she ruled in her own right. As the chapter on Kush and Aksum describes, her forces attacked Roman Egypt around 25 BCE and pulled down statues of Augustus; Rome razed Napata in reply, but Kushite envoys won a peace in which Augustus dropped his demand for tribute. The Greek geographer Strabo described "Queen Candace", almost certainly Amanirenas, as "a masculine sort of woman, and blind in one eye". The more famous tale of a Candace of Meroë facing down Alexander the Great comes from the *Alexander Romance* and is legend: Alexander never attacked Nubia.

"Queen mother" is an English umbrella term for many different offices: the Akan *ohemmaa* ("female ruler"), Benin's *iyoba*, the Yoruba *iya oba*, Dahomey's *kpojito*. In Asante each chief's stool had a female counterpart from the same matrilineage, and the Asantehemaa sat on the Kotoko council. Akan queen mothers kept genealogical knowledge, nominated candidates for a vacant stool, held courts for disputes brought by women, and shared in decisions on war, peace and land. Dahomey's *kpojito* counselled the king and pleaded before him in capital cases. In South Africa the office of the Rain Queen (Modjadji) of the Balobedu, who is believed to control the rain, has traditionally passed from mother to eldest daughter; tradition dates the first Rain Queen to about 1800, and the succession is now disputed.

Some queens are harder to pin down. **Amina of Zazzau** (Zaria, in today's northern Nigeria) is remembered as a Hausa warrior queen, but she is missing from the regnal lists of the *Chronicle of Abuja* and from two lists published by E. J. Arnett. The *Kano Chronicle* puts her in the fifteenth century; oral tradition points to the early sixteenth; the historian Abdullahi Smith placed her reign after 1576. Each is one tradition among several. Sultan Muhammad Bello of Sokoto credited her with conquests and with tribute from Katsina and Kano, a claim modern historians dispute. The historian Michael Crowder argued that after Amina, ruling-class Hausa women "experienced a steady diminution in their influence and were systematically deprived of their authority and autonomy."

## Njinga, women soldiers and the Atlantic age

{{image: Nzinga of Ndongo and Matamba | Njinga Mbande, ruler of Ndongo and Matamba in what is now northern Angola.}}

**Njinga Mbande** (about 1583–1663), whose wars are narrated in the chapter on Kongo, Asante, and Dahomey, ruled Ndongo from 1624 and Matamba from 1631. She first appears as her brother's envoy to Portuguese Luanda in 1621–22, where she was baptised as Dona Ana de Sousa; the popular story that an attendant made herself into a seat for her rests on a missionary account written decades later and may be embellished. After Portugal declared war in 1626 she allied with the Imbangala, conquered Matamba, joined the Dutch after they took Luanda in 1641, and made peace with Portugal in 1656. In war she took the masculine dress and manner of an Imbangala warlord; lurid tales about her lovers, some from Dapper's *Description of Africa*, have no proof behind them.

Njinga was also a slave trader on a large scale. By one account the Dutch bought as many as 13,000 enslaved people a year from her kingdom, and the peace of 1656 concentrated the slave trade at a market in her capital. Joseph C. Miller, writing in 1975, stressed her autocratic methods; John Thornton placed her in the making of an Atlantic Creole culture; Linda Heywood (2017) warns against turning her into either a populist hero or a tyrant, and presents a politician who used culture, diplomacy, religion and war. Angola's nationalists made her a symbol of resistance during the independence war.

The kingdom of Dahomey kept a corps of women soldiers from the seventeenth century to the 1890s. Europeans called them "Amazons"; one Fon name was *Mino*, "our mothers". King Ghezo (1818–1858) made them a serious military force. Visitors' reports put them at between 1,000 and 6,000 by the mid-nineteenth century, perhaps a third of the army. They were recruited from palace women, from captives and from free Dahomean women and were legally married to the king. They also took part in slave raiding: survivors of the *Clotilda*, the last ship known to have carried enslaved Africans to the United States, said women soldiers had helped to capture them. At Adégon in October 1892, during the war with France, the corps was largely destroyed in hand-to-hand fighting; the figures given are 417 Mino and 86 Dahomean regulars killed, against six French dead.

## Markets, merchant queens and the slave trades

Women's economic power in much of West Africa rested on trade. In Igbo dual-sex government, the *Omu* ("mother of the society") headed a council of women, regulated the market, set prices and settled disputes, and held her title independently of any male relative. **Omu Okwei** of Ossomari (1872–1943), a Niger merchant crowned Omu in 1935, is described as the last such merchant queen before the British displaced the council's oversight of trade. The Yoruba *Iyalode* was a high-ranking female chieftaincy, sometimes called "king of the women". In Ghana, market women formed part of the mass base of Nkrumah's Convention People's Party, as the chapter on Decolonization notes.

Commercial success sometimes came from the slave trades. **Efunroye Tinubu** (about 1810–1887), a Lagos aristocrat and merchant, traded tobacco, salt, arms and enslaved people, and by one account owned more than 360 enslaved people herself. She kept trading slaves after Lagos's 1852 treaty with Britain, was expelled to Abeokuta under British pressure, and became Iyalode of the Egba; Lagos's Tinubu Square bears her name. On the Senegal coast the *signares* of Saint-Louis and Gorée, African and Afro-European women, built wealth through marriages "by local custom" to European traders, and many owned property and enslaved people. Anne Pépin was the richest woman on Gorée; her brother Nicolas built the house now visited as the *Maison des Esclaves*.

Robertson and Klein's *Women and Slavery in Africa* (1983) argued that women were the majority of enslaved people inside Africa, partly because of internal demand for their labour. The Atlantic trade, described in the chapter on the Atlantic Slave Trade, carried more men: estimates based on the Eltis data put women at roughly a third of captives for much of the eighteenth century, figures that may still be revised. Elite women such as Njinga, Tinubu and the signares were neither simply victims nor simply heroines; they were powerful people inside a brutal economy.

```checkpoint
q: What does the evidence suggest about Amina of Zazzau?
a*: Her dates and deeds rest on conflicting traditions, and she is missing from some regnal lists.
a: Her reign is securely dated by contemporary documents.
x: No contemporary documents fix her reign; the Kano Chronicle, oral tradition and Abdullahi Smith give different dates, from the fifteenth to the late sixteenth century.
a: She was a Kushite queen who fought Rome.
x: That was Amanirenas of Kush; Amina belongs to Hausa tradition in what is now northern Nigeria.
a: All historians accept that she received tribute from Katsina and Kano.
x: The tribute claim comes from Muhammad Bello's nineteenth-century account and is disputed by modern historians.
hint: Compare the Kano Chronicle, oral tradition and Abdullahi Smith.
why: Amina's popular image is built from late oral tradition and a nineteenth-century account, so historians treat her dates as traditions, not facts.
---
q: Which of these women profited from or took part in the slave trades?
a: None: African women appear in the slave trades only as captives.
x: Njinga, Tinubu, many signares and the Dahomey women soldiers all took part in or profited from slaving.
a: Only European women in the colonies.
x: The chapter's examples are African and Afro-European women in Africa itself.
a*: Njinga of Ndongo, the Lagos merchant Efunroye Tinubu and many of the signares of Senegal.
a: Only Omu Okwei, and only after 1935.
x: Okwei is described as a merchant on the Niger; the chapter does not connect her to slave trading.
hint: Think of a queen, a Lagos merchant and the women of Gorée.
why: Women's history includes powerful women who were complicit in slavery, not only its victims.
```

## Priestesses, prophets and spirit mediums

**Nana Asma'u** (1793–1864), daughter of the Sokoto reformer Usman dan Fodio, left more than sixty surviving works in Arabic, Fulfulde and Hausa (she also knew Tamasheq), many written in *ajami*, African languages in Arabic script. From about 1830 she trained women teachers, the *jajis*, who taught women in their homes; their students became the *'yan taru*, "those who congregate together".

In Kongo, as the chapter on Kongo, Asante, and Dahomey also recounts, **Kimpa Vita** (1684–1706), a noblewoman trained as a religious medium, claimed in 1704 to be possessed by Saint Anthony. She taught that Jesus, Mary and Saint Francis were Kongolese, reoccupied the capital, São Salvador, in 1705, and rewrote the Salve Regina as the *Salve Antoniana*. With the advice of two Capuchin missionaries, the forces of King Pedro IV tried her as a witch and heretic and burned her in 1706.

In what became Zimbabwe, **Charwe Nyakasikana**, remembered as Mbuya Nehanda, was a *svikiro* (spirit medium) of the Nehanda royal ancestral spirit among the Zezuru Shona. With the medium Kaguvi she was a leader of the First Chimurenga, the rising of 1896–97 against the British South Africa Company. She was convicted of ordering the killing of a Native Commissioner and hanged on 27 April 1898. Nationalists later made her a founding heroine; the words "my bones will rise again", often put in her mouth, belong to that later nationalist tradition, not to any contemporary record.

Historians disagree about her role. D. N. Beach argued in 1998 that her central place in the rising had been overstated: she was convicted by male witnesses and a male bench as a scapegoat, and Kaguvi mattered more. Ruramisai Charumbira replied in 2008 that Beach's reading ignored women's and gender history, and revisited the evidence.

## Colonial rule and the women's war

Colonial officials negotiated with titled men and often recorded queen mothers only as "sisters" of rulers, and female office-holders lost "social, religious, constitutional, and political privileges and rights". In Abeokuta, councils that had traditionally included at least one woman were replaced after 1897 by an all-male Egba United Government. In Igboland, women had enforced their interests by "sitting on a man": gathering at an offender's compound, singing out their grievances, and sometimes damaging his house. Judith Van Allen's classic essay of 1972 argued that colonialism destroyed such institutions. Colonial rule could also elevate individual women. Ahebi Ugbabe, whom Nwando Achebe calls the only female king in colonial Nigeria, became a warrant chief and *eze* of Enugu-Ezike; Achebe describes her as both "a strong leader of her people" and "a collaborator empowered by and serving the British colonial regime".

Women also led armed resistance. In 1900, as the chapter on Imperial Expansion and Resistance tells, **Yaa Asantewaa**, Queen Mother of Ejisu and regent after the British exiled her grandson along with Prempeh I, was chosen by several Asante chiefs to lead the war that followed the governor's demand for the Golden Stool. Tradition holds that she shamed hesitant chiefs with a fiery speech; its wording is of uncertain provenance. She was exiled to the Seychelles in 1901 and died there in 1921, and the British never got the Golden Stool. In Kenya, Mekatilili wa Menza led Giriama resistance to British rule in 1913, which fed into the rising of 1914.

The Women's War broke out in south-eastern Nigeria in November 1929. Direct taxation of men had begun in 1928; a recount of the nominal roll in 1929 listed wives, children and livestock; and the slump was hurting women's trade. At Oloko a census-taker told a woman named Nwanyeruwa to count her goats, sheep and people, and she answered, "Was your widowed mother counted?" About 10,000 women gathered at Oloko, and the revolt spread across Owerri and Calabar provinces. Women attacked sixteen Native Courts and looted European trading posts. Troops killed more than fifty women by the official counts; oral accounts collected by T. Obinkaram Echewa put the toll at about a hundred women. Women from other towns asked Nwanyeruwa for a statement of their demands; as recorded in her evidence to the commission of inquiry, she summed them up:

```quote
Women will not pay tax till the world ends [and] Chiefs were not to exist any more.
Nwanyeruwa · 1929, as recorded by the Aba Commission of Inquiry
```

The commission heard 485 witnesses, only about 103 of them women. The warrant-chief system was abolished, and women were appointed to the reformed Native Courts, where before only a handful, such as the Onitsha trader Omu Okwei, had sat. The name is itself contested. British records called it the "Aba Riots"; the Igbo name, *Ogu Umunwanyi*, and the Ibibio and Annang *Ekong Iban* both mean "women's war", and Van Allen argued in 1975 that the colonial label depoliticised it. The chapter on the Interwar Period sets it among the protests of the slump.

## Nationalists and liberation fighters

In Abeokuta, **Funmilayo Ransome-Kuti** (1900–1978) helped found the Abeokuta Ladies' Club in 1932, which in the 1940s became the Abeokuta Women's Union, joining educated women and market women against the flat-rate taxes on women and against the Alake and the Sole Native Authority. In 1947 up to 10,000 women protested, camping outside the palace, and when permits were refused they held "picnics" instead. In January 1949 the Alake abdicated (he later returned); four women got seats in the reformed administration and the women's tax was suspended. Ransome-Kuti, the "Lioness of Lisabi", was the only woman in the 1947 nationalist delegation to London, where she wrote an article titled "We Had Equality 'til Britain Came". In 1977 soldiers stormed the compound of her son, the musician Fela, and threw her from a window; she died of her injuries in 1978.

Women formed a core part of Kenya's Mau Mau movement, mostly keeping supply and intelligence lines open; Mũthoni Kĩrĩma was the only woman to reach its rank of field marshal. In Mozambique, Josina Machel served in FRELIMO's Women's Detachment, and the anniversary of her death is now Women's Day. Opening the First Conference of Mozambican Women in March 1973, Samora Machel declared, in one translation, that "the liberation of women is a fundamental necessity for the revolution".

In South Africa, as the chapter on Apartheid and Its End describes, Charlotte Maxeke, the first Black South African woman to graduate from a university, founded the Bantu Women's League in 1918, after women in the Orange Free State had campaigned against passes for women in 1913. The Federation of South African Women, founded in 1954, organised the march of 9 August 1956, when an estimated 20,000 women, led by Lilian Ngoyi, Helen Joseph, Rahima Moosa and Sophia Williams-De Bruyn, carried about 14,000 petitions to the Union Buildings in Pretoria. They stood thirty minutes in silence, then sang "Wathint' abafazi, wathint' imbokodo" ("you strike the women, you strike a rock").

```checkpoint
q: What set off the Women's War of 1929 in south-eastern Nigeria?
a: A ban on women trading in markets.
x: The grievances were taxation and the census, made worse by a slump in women's trade; trading was not banned.
a*: Fear that taxes on men would extend to women, sparked by a census count at Oloko, amid a trade slump.
a: The arrest of Funmilayo Ransome-Kuti.
x: Ransome-Kuti's campaigns in Abeokuta came in the 1940s, in western Nigeria.
a: The British demand for the Golden Stool.
x: That demand set off the Asante war of 1900 in what is now Ghana.
hint: Think of Nwanyeruwa's question to the census-taker.
why: A new tax, a census that listed wives, children and livestock, and a falling market came together, and the protest spread across two provinces.
---
q: What did D. N. Beach and Ruramisai Charumbira disagree about?
a: Whether Nehanda's "my bones will rise again" was recorded at her execution.
x: That phrase is a later nationalist tradition; their debate was about her role in the rising.
a: The date of Kimpa Vita's death.
x: Their exchange concerned the Shona rising of 1896–97, not Kongo.
a: Whether Yaa Asantewaa was captured in 1900 or 1901.
x: Their debate was about Zimbabwe, not Asante.
a*: How central Nehanda was to the 1896–97 rising, and whether her conviction made her a scapegoat.
hint: One scholar thought Kaguvi more central; the other said gender history had been ignored.
why: Beach argued her role was overstated; Charumbira answered that his reading neglected women's and gender history.
```

## After independence

Independence did not automatically restore women's lost authority. Ghana's leaders in 1957 worked only with male chiefs and left queen mothers out; the 1992 constitution recognised the queen mother as a customary office, and in 2010 the National House of Chiefs announced the inclusion of 20 queen mothers.

Women's movements could end wars and win office. In Liberia, the Women of Liberia Mass Action for Peace, started in 2003 by Leymah Gbowee and others, united Christian and Muslim women in nonviolent protest to end the Second Liberian Civil War. **Ellen Johnson Sirleaf** won the 2005 run-off with about 59 per cent of the vote and took office in January 2006 as Africa's first *elected* female head of state. Her past was contested: in 2009 Liberia's Truth and Reconciliation Commission listed her among 50 people who should be barred from public office for 30 years, because of her early financial support for Charles Taylor. In 2011 she shared the Nobel Peace Prize with Gbowee and Tawakkol Karman of Yemen.

Rwanda, rebuilding after the genocide described in the chapter on Modern African History since 1860, set a quota of at least 30 per cent women in its 2003 constitution. In 2008 it became the first country where women held a majority in the lower house of parliament, and after the 2024 election women held 51 of the 80 seats, about 64 per cent. Commentators credit the quota and post-genocide reconstruction, and note that women legislators shaped laws on inheritance, property and gender-based violence; some also note that the quota operates within an authoritarian political system.

In Kenya, **Wangari Maathai** (1940–2011) founded the Green Belt Movement in 1977, which reports more than 51 million trees planted. She fought a planned tower in Nairobi's Uhuru Park, was beaten unconscious by police at a 1992 hunger strike for political prisoners, won a parliamentary seat in 2002, and in 2004 became the first African woman to win the Nobel Peace Prize, "for her contribution to sustainable development, democracy and peace".

## Recovering women's voices

Much of this history was recovered by African women scholars, who disagree among themselves. Ifi Amadiume's *Male Daughters, Female Husbands* (1987), based on fieldwork in the Igbo town of Nnobi, argued that in pre-colonial Igbo society gender and sex did not necessarily coincide: daughters could become "male daughters" with the rights of sons, and wealthy women could become "female husbands" by marrying wives. Colonialism and Christianity, she argued, eroded women's power. Oyèrónkẹ́ Oyěwùmí's *The Invention of Women* (1997) went further. Among the Oyo-Yoruba, she argued, seniority, not gender, was the main organising principle; Yoruba pronouns and kin terms are not gendered; and "woman" as a subordinate social category was a colonial imposition.

Both books were praised and challenged. Bibi Bakare-Yusuf accepted Oyěwùmí's critique of Western universalism but charged her with linguistic determinism and essentialism. Carole Boyce Davies found the picture static and short on pre-colonial evidence; Olalade Balogun pointed to Yoruba proverbs that belittle women; Sefinatu Dogo argued that one ethnic group cannot stand for pre-colonial Africa; Camilla Gibb suggested that Amadiume's account of matriarchy could be read as essentialist. Nwando Achebe has noted that her own Igbo findings, like Amadiume's, differ from Oyěwùmí's. Amadiume and Oyěwùmí also insist that "female husbands" should not be read as evidence of homosexuality. Achebe calls that exchange contentious, and holds that Western scholars often misread African institutions through modern categories.

A second argument is over the word "feminism" itself. Molara Ogundipe coined STIWA, "Social Transformation Including Women in Africa"; Chikwenye Okonjo Ogunyemi proposed African womanism; Catherine Acholonu offered "motherism"; Obioma Nnaemeka, "nego-feminism", a feminism of negotiation. Others, such as Amina Mama and Patricia McFadden, argue for an explicitly radical feminist politics, and the African Feminist Forum published a *Charter of Feminist Principles for African Feminists*. Chimamanda Ngozi Adichie's talk "We Should All Be Feminists" (2012) carried the word to a global audience. Ogundipe described why the imported version could seem beside the point:

```quote
I discovered that the Yoruba woman had more private and public spaces and respected roles than pre-feminist American middle-class women. They needed Betty Friedan; we already had the right to work outside the home and secure our material needs.
Molara Ogundipe · Interview with Desiree Lewis, Feminist Africa · 2002
```

The best recent work holds both truths together: African women had forms of power that colonial rule diminished, and those forms of power were themselves shaped by hierarchy, seniority and, sometimes, slavery.

## Further exploration

- **Nwando Achebe, *Female Monarchs and Merchant Queens in Africa* (2020).** A short, open-access survey by a Nigerian historian, from queens and merchant queens to Nehanda and Ahebi Ugbabe.
- **Kathleen Sheldon, *African Women: Early History to the 21st Century* (2017).** A chronological synthesis of the whole field.
- **Linda M. Heywood, *Njinga of Angola: Africa's Warrior Queen* (2017).** A full-length scholarly biography of Njinga.
- **Ifi Amadiume, *Male Daughters, Female Husbands: Gender and Sex in an African Society* (1987).** The Igbo ethnography that launched the debate on gender and colonialism.
- **Oyèrónkẹ́ Oyěwùmí, *The Invention of Women: Making an African Sense of Western Gender Discourses* (1997).** The argument that Yoruba society was organised by seniority, not gender.
- **Cheryl Johnson-Odim and Nina Emma Mba, *For Women and the Nation: Funmilayo Ransome-Kuti of Nigeria* (1997).** The standard biography.
- **Gracia Clark, *Onions Are My Husband: Survival and Accumulation by West African Market Women* (1994).** The market queens of Kumasi.$mn_womenafrica_master$,
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
  select $mn_womenafrica_quiz$[
    {"type": "mcq", "prompt": "What did the Meroitic title kandake mean?", "options": ["A queen or queen mother of Kush; Greek and Roman writers wrongly took it for a personal name", "A Roman governor of Egypt", "A priestess of the Nehanda spirit", "A Hausa princess of Zazzau"], "answerIndex": 0, "explanation": "Kandake was a Meroitic term for a queen or queen mother, attested for six or seven women. Some, like Amanirenas, ruled in their own right and also bore the male ruler's title qore.", "id": "q1"},
    {"type": "mcq", "prompt": "From whom were Dahomey's women soldiers recruited, according to the sources used in this chapter?", "options": ["Only from European captives", "Only from the king's daughters", "From palace women, captives and free Dahomean women", "From Portuguese mercenaries"], "answerIndex": 2, "explanation": "They were recruited from palace women, from captives and from free Dahomean women. Visitors' reports put their numbers at between 1,000 and 6,000 by the mid-nineteenth century.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the outcome of the Aba Commission of Inquiry after the Women's War of 1929?", "options": ["Women were barred from all courts", "Direct taxation was extended to women", "The Igbo name Ogu Umunwanyi was officially adopted", "The warrant-chief system was abolished and women were appointed to the reformed Native Courts"], "answerIndex": 3, "explanation": "The commission heard 485 witnesses, only about 103 of them women. Afterwards the warrant-chief system was abolished and women were appointed to the reformed Native Courts, where only a handful had sat before.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Oyèrónkẹ́ Oyěwùmí argue in The Invention of Women (1997)?", "options": ["That Yoruba society was a matriarchy ruled by queen mothers", "That among the Oyo-Yoruba seniority, not gender, was the main organising principle, and 'woman' as a social category was a colonial imposition", "That colonialism improved the status of Yoruba women", "That African women did not take part in trade"], "answerIndex": 1, "explanation": "Oyěwùmí argued that seniority organised Oyo-Yoruba society, noting that Yoruba pronouns and kin terms are not gendered. Critics such as Bibi Bakare-Yusuf charged her with linguistic determinism and essentialism.", "id": "q4"},
    {"type": "open", "prompt": "Why does this chapter insist that elite African women should not be presented only as victims or heroines? Use at least two examples.", "rubric": "A strong answer uses specific cases: Njinga, who fought the Portuguese but was a large-scale slave trader (the Dutch bought as many as 13,000 enslaved people a year from her kingdom, by one account); Efunroye Tinubu, a Lagos merchant who by one account owned more than 360 enslaved people and kept trading slaves after 1852; the signares of Saint-Louis and Gorée, many of whom owned enslaved people; the Dahomey women soldiers, who took part in slave raiding (the Clotilda survivors' testimony). It may contrast these with Robertson and Klein's finding that women were the majority of the enslaved inside Africa, and with figures such as Ahebi Ugbabe, both leader and collaborator. It should conclude that power, complicity and victimhood coexisted.", "id": "q5"},
    {"type": "open", "prompt": "Did colonial rule erode African women's power? Assess the argument, drawing on both historical cases and the scholarly debate.", "rubric": "A strong answer gives evidence for erosion: officials dealt with titled men and recorded queen mothers as 'sisters'; Abeokuta's all-male Egba United Government after 1897; Van Allen's argument about 'sitting on a man'; the displacement of the Omu's council; the Women's War of 1929 and the Abeokuta women's campaigns as responses. It presents Amadiume (male daughters, female husbands) and Oyěwùmí (seniority, not gender) and their critics (Bakare-Yusuf, Boyce Davies, Balogun, Dogo, Gibb, Achebe's differing Igbo findings). It notes complications: Ahebi Ugbabe raised up by colonial rule; Crowder's view that ruling-class Hausa women's influence diminished after Amina, well before colonial rule; independence governments such as Ghana's in 1957 also excluding queen mothers. Credit a reasoned conclusion.", "id": "q6"}
  ]$mn_womenafrica_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/africa/women-in-african-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
