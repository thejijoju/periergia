-- Food in World History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/food-in-world-history @ research/advanced/read.
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
    'history/thematic-history/food-in-world-history',
    'research',
    'advanced',
    'read',
    $mn_food_master$> **What people ate, who grew it, and how food remade the world.** Every society has had to decide what to grow, how to store it, who gets it, and what happens when there is not enough. This chapter follows food across the long run: the many homes of the staple crops; the granaries of empires; the spice routes of the Indian Ocean; sugar, slavery and the Columbian exchange; tea, coffee and chocolate; famine and the arguments over its causes; canning, refrigeration and fertiliser; the Green Revolution; and the spread of cuisines. It also introduces the scholars, from Sidney Mintz and Amartya Sen to Rachel Laudan and James Watson, who made food one of history's most revealing subjects.

## Many Cradles of Food

Farming had no single birthplace. As the chapter on The Neolithic Revolution: Farming and Its Costs describes, people in several regions domesticated plants independently. Wheat was first cultivated in the Fertile Crescent, the archaeological record suggests around 9600 BCE. Asian rice was domesticated over a long process in the Yangtze region of China and is now the staple of over half the world's population; African rice was domesticated independently in West Africa about 3,000 years ago.

Africa was a cradle in its own right. Sorghum, now the world's fifth-most important cereal, was domesticated more than 5,000 years ago in eastern Sudan, and pearl millet in the West African Sahel. In the Americas, Indigenous peoples of southern Mexico turned wild teosinte into maize about 9,000 years ago; Andean farmers around Lake Titicaca domesticated the potato 7,000 to 10,000 years ago; and cassava was probably first domesticated in west-central Brazil. Cassava now feeds more than 500 million people, and Nigeria is its largest producer. Sugarcane, which would later carry so much of history's cruelty, began far from the Atlantic, in the New Guinea area; Austronesian sailors carried it as far as Madagascar, and it reached India and then southern China by 500 BCE.

## Feeding Cities and Empires

Rachel Laudan, in *Cuisine and Empire* (2013), argues that empires were the main political units that shaped and spread cuisines, and that cooking is itself a technology. Empires also had to feed their capitals.

Rome's *cura annonae*, the care of the grain supply, became a standing programme with Gaius Gracchus's grain law of 123 BC, under which at first about 40,000 adult male citizens were eligible for grain. In 58 BC Clodius made the grain free, for an estimated 320,000 people; Augustus set the number at about 200,000, roughly where it stayed until near the end of the Western Empire. Later emperors added bread, olive oil, wine and pork. A city of perhaps a million people needed, on Rickman's estimate, about 272,000 tonnes of grain a year, most of it from Egypt, North Africa and Sicily; when the Vandals took Africa around 439, the West lost most of its supply. Juvenal mocked the dole as "bread and circuses", and an older literature treated it as a corrupting bribe; more recent work, drawing on scholars such as Erdkamp and Rickman, places it within a wider policy of food supply, and one study (Vandevoorde, 2015) notes that most *annona* inscriptions concern ordinary cities' supply rather than the capital's handout.

Chinese states relied instead on reserves. The first "ever-normal granary" (*changping cang*) is said to have been built under the Han in 54 BC, and the idea was promoted under the Northern Song. Under the Qing a nationwide network of state granaries, studied by Pierre-Étienne Will and R. Bin Wong in *Nourish the People* (1991), held some 2.2 to 3.3 million tonnes of grain before it declined in the nineteenth century and collapsed in the Taiping era. The US Agriculture Secretary Henry A. Wallace later borrowed the term "ever-normal granary" for American policy. Moving grain mattered too: the Grand Canal, completed under the Sui in 609, linked the rice of Jiangnan to the north, as the chapter on Tang and Song China explains.

In the Andes, the Inca state stored maize and *chuño*, freeze-dried potato that kept for two to four years, in ventilated hillside storehouses called *qullqa*; 2,400 stood above Lake Cotapachi near Cochabamba, as the chapter on The Inca Empire notes.

## Spices and the Indian Ocean

{{image: Spice trade | Overland Silk Road routes (red) and maritime spice routes (blue) linking Asia, Africa and Europe.}}

Long before Europeans arrived, the Indian Ocean was the world's great spice market. Black pepper is native to the Malabar Coast of south-western India, the ancient world's sole source, and it flowed west to the Middle East and Rome; many recipes in the Roman cookbook *Apicius* call for it. In the late second century BC Ptolemaic Greek sailors learned, from Indian mariners, to ride the monsoon winds directly across the Arabian Sea from the Red Sea to India. Cloves and nutmeg grew only in the Maluku and Banda Islands. Austronesian sailors carried cinnamon to East Africa, and later Arab seafarers from Yemen and Oman dominated the ocean's routes.

Europeans entered this world late and violently. Vasco da Gama reached Calicut by the Cape in 1498, and the Portuguese took Malacca in 1511. In 1621 the Dutch East India Company conquered the Banda Islands: of a population generally estimated at 13,000 to 15,000, perhaps 1,000 remained, as forced labourers, and Coen divided the nutmeg land into 68 plantations worked by imported enslaved people. The chapter on Trading Companies and Empires: the VOC and the East India Company tells that story. For the Bandanese, Europe's taste for spice meant the destruction of a society.

```checkpoint
q: How does more recent work tend to view Rome's grain distribution, the *cura annonae*?
a*: As part of a wider policy of food supply for cities, not only the capital's handout.
a: As a purely satirical invention of the poet Juvenal.
x: The grain law of Gaius Gracchus (123 BC) and its successors were real policies; Juvenal only coined the mocking label "bread and circuses".
a: As a free distribution that grew without limit until the end of the Western Empire.
x: Numbers were capped: Caesar cut them to 150,000 and Augustus set about 200,000, roughly where they stayed.
a: As a bribe that was abolished under the Severans.
x: The Severans did not abolish it; Septimius Severus added olive oil, and grain was later replaced by bread (a change often credited to Aurelian).
hint: Think about the difference between an older and a more recent literature.
why: The older view saw the dole as a corrupting political device; recent work places it within the wider problem of feeding cities.
---
q: Where was black pepper, the most important spice of the ancient world, native to?
a: The Banda Islands.
x: The Banda Islands were the home of nutmeg, not pepper.
a: The Maluku Islands.
x: The Maluku were famous for cloves.
a*: The Malabar Coast of south-western India.
a: Yemen and Oman.
x: Arab sailors from Yemen and Oman later dominated Indian Ocean routes, but pepper did not grow there.
hint: The ancient world had only one source.
why: Pepper from Malabar reached Rome by sea, which is why so many recipes in *Apicius* use it.
```

## Sugar, Slavery and the Columbian Exchange

Few foods have carried more historical weight than sugar. The anthropologist Sidney W. Mintz, who did his doctoral fieldwork among cane workers in Puerto Rico, wrote *Sweetness and Power: The Place of Sugar in Modern History* (1985), considered one of the most influential works in food studies. Mintz tied two worlds together: the enslaved Africans who grew cane in the Caribbean, and the British working people who consumed its sugar. By Mintz's figures, as his reviewers reported them, British consumption per head rose roughly fourfold or more across the eighteenth century. The plantation story is told in the chapters on The Columbian Exchange and the First Global Economy and The Atlantic Slave Trade, and the Global History chapter discusses Mintz's argument. After slavery, the demand for sugar labour drove new migrations, including Indian indentured labourers.

Enslaved Africans were not only labour on someone else's crop. Judith Carney and Richard Nicholas Rosomoff, in *In the Shadow of Slavery* (2009), restore Africa's botanical legacy in the Atlantic world: African crops, and the food plots in which enslaved people grew them, shaped what the Americas ate.

The wider transfer of plants, animals and microbes was named the "Columbian exchange" by Alfred W. Crosby in 1972. The economists Nunn and Qian estimate that the potato alone contributed roughly 12 to 25 per cent of Afro-Eurasian population growth between 1700 and 1900. Chillies, first cultivated in Mexico, were carried by the Portuguese to Africa, Arabia, Goa and Malacca in the sixteenth century and by the Spanish across the Pacific on the Manila galleons, so chilli heat entered many African and Asian cuisines only in the last five centuries. The tomato, whose wild ancestor is South American, first appears in a European herbal in 1544. The exchange carried danger too: the potato blight that would devastate Ireland is most often traced to central Mexico's Toluca Valley, though some scholars argue for an Andean origin.

## Tea, Coffee and Chocolate

Three drinks, from three continents, became global commodities. Tea drinking spread widely in China under the Tang, when Lu Yu wrote *The Classic of Tea*, and on to Korea, Japan and Vietnam; for centuries the Tea Horse Road traded Chinese tea for Tibetan horses. A Dutch ship brought the first tea to Amsterdam in the early seventeenth century, Catherine of Braganza's marriage to Charles II in 1662 brought it to the English court, and by 1750 it was Britain's national drink. Britain paid China in silver and then turned to Indian opium to buy it, as the chapter on History and Drugs explains. The British then introduced tea culture to India in 1836 and Ceylon in 1867, though tea became widely popular among Indians themselves only from the 1950s, after an India Tea Board advertising campaign.

Wild coffee, *Coffea arabica*, is Ethiopian, but the drink began in Yemen, where fifteenth-century Sufis used it for night prayers; it had reached Mecca and Cairo by the early sixteenth century and Damascus and Istanbul by the 1550s, and until the late seventeenth century the Yemeni port of Mocha was the main gateway of the world's coffee trade. Then plantations took over: the Dutch planted coffee in Java, and by 1788 Saint-Domingue supplied half the world's coffee. Brazil became the largest producer by 1852 and has remained so; Vietnam became the second-largest in 1999.

Cacao was first domesticated in what is now Ecuador; the Mokaya of Chiapas drank it by 1900 BC, its beans served as currency, and the Maya introduced chocolate to the Aztecs. Its earliest documented arrival in Spain, in 1544, came with Q'eqchi' Maya nobles. Its labour history repeats sugar's. The Portuguese brought cacao from Brazil to Príncipe in 1824, then to São Tomé, and recreated slave plantations there; after abolition in 1869 they kept a captive workforce by legal trickery, and in 1905 São Tomé and Príncipe was the world's largest producer. Child labour remains an issue in a chocolate trade worth over US\$100 billion in 2018.

## Famine and Its Politics

Historians increasingly treat famine as a political event. The Bengali economist Amartya Sen, later a Nobel laureate, changed the question in *Poverty and Famines* (1981).

```quote
Starvation is the characteristic of some people not having enough food to eat.
Amartya Sen · Poverty and Famines · 1981
```

Sen argued that famine arises not only from a lack of food but from failures in the mechanisms that distribute it: people starve when their "entitlements", their wages, crops or goods to exchange, can no longer buy food. His case was the Bengal famine of 1943, where a wartime urban boom raised food prices beyond what rural workers could pay. Critics defended a "food availability decline" account: Peter Bowbrick argued that supply really did fall, and Mark Tauger, building on the plant pathologist S. Y. Padmanabhan's report of 1973, that brown-spot disease of rice was badly underestimated. Much recent work stresses politics and asks whether Bengal's disaster reflected an inept, panicky wartime government or deliberate colonial priorities. The causes included the loss of Burmese rice after Japan's occupation, a "denial policy" against rice and boats in 1942, inflation, trade barriers between provinces, a cyclone, the rice disease, and the limited relief offered by Churchill's war cabinet. Estimates of the dead range from 0.8 to 3.8 million; in Cormac Ó Gráda's words, "today the scholarly consensus is about 2.1 million". More than half the deaths came in 1944, from disease.

Bengal had suffered before. Deaths in the famine of 1770, under East India Company rule, are given as anywhere from 1 to 10 million: the traditional 7 to 10 million derive from Company-era estimates, Rajat Datta proposes about 1.2 million, and Dyson calls 10 million "barely credible". In Ireland, the Great Famine of 1845–1852, caused by potato blight, killed between 775,000 and 1.5 million people in excess deaths, and a million or more emigrated, while large food exports continued and London refused to bar them. Most historians reject the charge of genocide, though the question persists in public debate; the chapter on the British Empire places both famines in the wider history of imperial rule. Mike Davis, in *Late Victorian Holocausts* (2001), went further, blaming laissez-faire, Malthusian colonial ideology for the 30 to 60 million deaths he counts in the El Niño famines of 1876–1902 in India, China, Brazil, Ethiopia and beyond. Their victims, he wrote, "died, not outside the 'modern world system', but in the very process of being forcibly incorporated into its economic and political structures."

Communist states produced some of the twentieth century's deadliest famines. In Soviet Ukraine the Holodomor of 1932–33 killed about 3.5 to 5 million people by recent estimates, as the chapter on The Soviet Union: History of the Soviet Empire discusses. In China, the famine that followed the Great Leap Forward killed tens of millions. Historians using archives reached 32.5 million (Cao Shuji), 36 million (Yang Jisheng) and at least 45 million (Frank Dikötter), and most recent scholarly estimates fall around 30 to 45 million; the chapters on Maoism and Modern China examine the figures and the arguments over responsibility. Alex de Waal's *Mass Starvation* (2018) draws the long lesson: mass starvation killed about ten million people every decade until the 1980s but had all but disappeared by the early 2000s, thanks above all to politics, fewer wars and less totalitarian rule, and he warns that the decline may be reversing.

```checkpoint
q: What was the core of Amartya Sen's "entitlement" approach to famine?
a: That famines are always caused by a fall in the total amount of food available.
x: That is the "food availability decline" view, which Sen argued against.
a*: That people starve when their means of obtaining food, such as wages or goods to exchange, fail, even if food exists.
a: That famines happen only in wartime.
x: Sen's argument concerned how food is distributed, not war as such, although war helped cause the Bengal famine.
a: That brown-spot disease caused the Bengal famine of 1943.
x: That was the argument of Sen's critic Tauger, building on Padmanabhan.
hint: Think of the rural workers of Bengal in 1943 and the price of rice.
why: Sen shifted attention from the quantity of food to who can command it, which made famine a question of economics and politics.
---
q: How did Mike Davis explain the El Niño famines of the late nineteenth century?
a: As natural disasters that no government could have prevented.
x: Davis blamed political choices, not the weather alone.
a: As the result of overpopulation, in line with Malthus.
x: Davis attacked Malthusian ideology as part of the problem.
a: As the product of Communist collectivisation.
x: These famines took place in 1876–1902, and Davis's target was laissez-faire colonial ideology.
a*: As made deadly by laissez-faire, Malthusian colonial policy as these societies were forced into the world economy.
hint: Consider the subtitle "the Making of the Third World".
why: Davis argued that millions died "in the very process of being forcibly incorporated" into the modern world system.
```

## Industrial Food

The nineteenth century learned to defeat the seasons. Nicolas Appert began in 1795 to seal food in glass jars and boil it, and in 1810 the French government paid him 12,000 francs to publish his method. That same year Peter Durand patented preserving food in tin and other vessels in England; the buyers of his patent found their early market in the Army and Navy. Refrigeration followed: James Harrison built an ice machine in Australia in 1851, and in 1882 the ship *Dunedin* left Port Chalmers in New Zealand carrying thousands of frozen carcasses and reached London 98 days later with only one condemned; within five years 172 frozen-meat shipments had followed, as the chapter on The Second Industrial Revolution describes. Clarence Birdseye, inspired by Inuit practice he had seen in Labrador, brought flash-frozen food to American shops from 1930.

The most consequential invention was chemical. Haber demonstrated the synthesis of ammonia in 1909, and Bosch scaled it up for the first industrial plant in 1913, making synthetic nitrogen fertiliser possible. Vaclav Smil calculates that, without the yield increases since 1900, the harvest of 2000 "would have required nearly four times more land", and cultivation "would have claimed nearly half of all ice-free continents, rather than under 15%". The process now uses 1 to 2 per cent of the world's energy.

## The Green Revolution and Its Critics

```quote
These and other developments in the field of agriculture contain the makings of a new revolution. It is not a violent Red Revolution like that of the Soviets, nor is it a White Revolution like that of the Shah of Iran. I call it the Green Revolution.
William S. Gaud · speech · 8 March 1968
```

The name was coined in the Cold War, by an American aid administrator, but the work began in Mexico. In the 1940s Henry Wallace persuaded the Rockefeller Foundation to fund an agricultural programme there with the support of the government of Ávila Camacho. Norman Borlaug developed semi-dwarf, high-yielding, disease-resistant wheats; Mexico became a net wheat exporter by 1963. M. S. Swaminathan invited Borlaug to India, where Punjab was chosen for the new seeds, and wheat yields nearly doubled in India and Pakistan between 1965 and 1970. The International Rice Research Institute in the Philippines released IR8 rice in 1966, and in China Yuan Longping's hybrid rice is credited with comparable effects. Borlaug received the Nobel Peace Prize in 1970. Gregg Easterbrook wrote in *The Atlantic* in 1997 that Borlaug's work "may have prevented a billion deaths"; the claim is often repeated, but it is Easterbrook's estimate, not an established figure.

Critics counted other costs. The Indian activist Vandana Shiva, in *The Violence of the Green Revolution*, linked the new agriculture to ecological degradation and political conflict in Punjab, and founded the seed-saving network Navdanya in 1991. Others point to dependence on fertiliser, pesticides and irrigation and to lost crop diversity. Shiva has her own critics: she advised Sri Lanka before its 2021 ban on chemical fertilisers, which was followed by sharp falls in farm output. Mexico itself has been called both the Green Revolution's "birthplace" and its "burial ground".

## Cuisines on the Move

Food is also a story of taste, class and identity. The anthropologist Jack Goody, in *Cooking, Cuisine and Class* (1982), began among the LoDagaa of northern Ghana and asked why a differentiated haute cuisine developed in Eurasia but not in West Africa, tying cuisine to class and hierarchy. Laudan, writing three decades later, traced the rise of "middling cuisines" for new middle classes, and challenged the romantic, agrarian and nationalist myths of modern food movements, while Lizzie Collingham's *The Taste of Empire* (2017) tells the history of the British Empire through twenty meals.

Nations make cuisines as much as cuisines make nations. Arjun Appadurai showed in 1988 how English-language cookbooks written for India's new middle class assembled a national cuisine from regional ones without hiding their regional and ethnic roots. Since 2010 UNESCO has listed foodways as intangible heritage: the gastronomic meal of the French, traditional Mexican cuisine and the Mediterranean diet in 2010, and Japanese washoku and Korean kimchi-making, gimjang, in 2013. Critics read such listings partly as nation-branding.

Globalisation sharpened the debate. McDonald's, founded in California in 1940, had more than 45,000 restaurants in over 100 countries by the end of 2025. The sociologist George Ritzer described "McDonaldization" (1983; book 1993) as the spread of efficiency, calculability, predictability and control, a reworking of Weber's idea of rationalisation. James L. Watson's edited volume *Golden Arches East* (1997), with studies of Beijing, Hong Kong, Taipei, Seoul and Japan, argued the reverse: East Asian consumers localised McDonald's, turning it into something of their own and challenging the thesis of cultural imperialism.

## Hunger Today

Farmers have answered globalisation with movements of their own. La Vía Campesina, "the peasant way", was founded at Mons, Belgium, in 1993 in reaction to the Uruguay Round of world trade talks under the GATT; its members coined "food sovereignty" in 1996, and the Declaration of Nyéléni, agreed in Mali in 2007, defined it.

Hunger has not ended. According to *The State of Food Security and Nutrition in the World 2026*, published by five UN agencies in July 2026, about 645 million people, some 7.8 per cent of humanity, faced hunger in 2025, the third yearly fall in a row. Africa, where about one person in five was hungry, now had more hungry people (309 million) than Asia (292 million). About 2.69 billion could not afford a healthy diet, and the report projected 510–520 million chronically undernourished people in 2030. The long history of food suggests that whether those projections come true will depend less on how much the world can grow than on who can claim it.

## Further exploration

- **Rachel Laudan, *Cuisine and Empire: Cooking in World History* (2013).** A global history of cuisines as technologies spread by empires.
- **Sidney W. Mintz, *Sweetness and Power: The Place of Sugar in Modern History* (1985).** The classic study linking Caribbean slavery and British consumers through sugar.
- **Amartya Sen, *Poverty and Famines: An Essay on Entitlement and Deprivation* (1981).** The entitlement approach to famine, with Bengal 1943 as its central case.
- **Judith A. Carney and Richard Nicholas Rosomoff, *In the Shadow of Slavery: Africa's Botanical Legacy in the Atlantic World* (2009).** African crops and enslaved people's food plots in the Atlantic world.
- **Mike Davis, *Late Victorian Holocausts: El Niño Famines and the Making of the Third World* (2001; some sources date it 2000).** A polemical indictment of colonial political economy in the famines of the 1870s to 1900s.
- **Alex de Waal, *Mass Starvation: The History and Future of Famine* (2018).** Why famine declined, and why its decline may not last.
- **Lizzie Collingham, *The Taste of Empire: How Britain's Quest for Food Shaped the Modern World* (2017).** The British Empire told through twenty meals.$mn_food_master$,
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
  select $mn_food_quiz$[
    {"type": "mcq", "prompt": "Where did coffee drinking begin?", "options": ["In Yemen, where fifteenth-century Sufis used it for night prayers", "In Ethiopia's royal court", "In Istanbul's coffeehouses", "In Java, under the Dutch"], "answerIndex": 0, "explanation": "Wild Coffea arabica is Ethiopian, but the drink began in Yemen; it reached Mecca and Cairo by the early sixteenth century and Istanbul by the 1550s, and the Dutch planted it in Java later.", "id": "q1"},
    {"type": "mcq", "prompt": "Who coined the term \"Green Revolution\", and when?", "options": ["Norman Borlaug, in his Nobel lecture of 1970", "Henry A. Wallace, in the 1940s", "USAID administrator William S. Gaud, in a speech of 8 March 1968", "Vandana Shiva, in 1989"], "answerIndex": 2, "explanation": "Gaud contrasted it with the 'Red Revolution' of the Soviets and the 'White Revolution' of the Shah of Iran. Shiva was a critic; Wallace helped begin the Mexican programme; Borlaug developed its high-yielding wheats.", "id": "q2"},
    {"type": "mcq", "prompt": "What did James L. Watson's edited volume Golden Arches East (1997) argue?", "options": ["That McDonald's imposed American culture unchanged on East Asia", "That East Asian consumers localised McDonald's, challenging the cultural-imperialism thesis", "That fast food failed to take root in East Asia", "That McDonaldization rests on efficiency, calculability, predictability and control"], "answerIndex": 1, "explanation": "Watson's case studies of Beijing, Hong Kong, Taipei, Seoul and Japan stressed consumer agency; the four principles of McDonaldization are George Ritzer's.", "id": "q3"},
    {"type": "mcq", "prompt": "Which estimate does Cormac Ó Gráda give as the scholarly consensus for deaths in the Bengal famine of 1943?", "options": ["About 100,000", "About 10 million", "About 30 million", "About 2.1 million"], "answerIndex": 3, "explanation": "Estimates range from 0.8 to 3.8 million; Ó Gráda (2007) wrote that 'today the scholarly consensus is about 2.1 million'.", "id": "q4"},
    {"type": "open", "prompt": "Compare explanations of famine offered by Amartya Sen, his critics, Mike Davis and Alex de Waal, using at least two famines as examples.", "rubric": "A strong answer explains Sen's entitlement approach in Poverty and Famines (1981): famine arises from failures in the mechanisms that distribute food, as when Bengal's wartime urban boom in 1943 raised prices beyond rural wages. It contrasts the 'food availability decline' view (Bowbrick; Tauger, after Padmanabhan, on brown-spot disease), and the political readings of Bengal (inept wartime government versus deliberate colonial priorities, Churchill's war cabinet). It presents Davis's indictment of laissez-faire, Malthusian colonial ideology in the El Niño famines of 1876–1902 (30–60 million deaths by his count) and de Waal's argument that famine declined for political reasons by the early 2000s and may be returning. Good examples include Ireland 1845–52 (775,000–1.5 million excess deaths while food exports continued), Bengal 1943 (about 2.1 million by Ó Gráda's consensus figure) and the Great Leap famine (most recent estimates about 30–45 million). Figures should be given as ranges or attributed estimates.", "id": "q5"},
    {"type": "open", "prompt": "How have historians and social scientists used food to study global connections and identity? Discuss at least three of Mintz, Carney and Rosomoff, Laudan, Goody, Appadurai, Ritzer and Watson.", "rubric": "A strong answer explains Mintz's linking of Caribbean slave plantations and British working-class consumers in Sweetness and Power (1985); Carney and Rosomoff's recovery of African crops and enslaved people's food plots; Laudan's view of empires as the spreaders of cuisines, cooking as technology and the rise of 'middling cuisines'; Goody's comparative question about haute cuisine in Eurasia but not West Africa; Appadurai on cookbooks making an Indian national cuisine; and the debate between Ritzer's homogenising 'McDonaldization' and Watson's localisation by East Asian consumers. Better answers note debates, such as UNESCO heritage listings as nation-branding.", "id": "q6"}
  ]$mn_food_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/food-in-world-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
