-- Latin America after Independence — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/latin-america-after-independence @ research/advanced/read.
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
    'history/modern-era-19th-century/latin-america-after-independence',
    'research',
    'advanced',
    'read',
    $mn_latam_master$> **A century of making states, and of fighting over who belonged to them.** From about 1830 to the First World War, Latin America's new states fought over who should rule, how far the Church should reach, and who should own and work the land. This chapter follows the caudillos; Brazil's empire and its fall; Mexico from the US invasion through Juárez's Reform and the French intervention to Porfirio Díaz; the wars that devastated Paraguay and made Bolivia landlocked; the new states' wars on Indigenous peoples; Cuba's long struggle and the US interventions after 1898; and the export booms, mass immigration and the debate over dependency.

## Caudillos, Parties and the Church

The chapter on Latin American Independence ends with the rise of the **caudillos**, personal leaders who held military and political power together. Historians disagree about what produced them. John Lynch rooted *caudillismo* not in a distant Spanish past but in the independence wars, which left a vacuum of power; where rural areas lacked state institutions, caudillos imposed order, often violently, and acted as patrons to their followers. E. Bradford Burns saw some, above all Juan Manuel de Rosas, as "folk caudillos", popular with the rural poor and despised by Europeanised city elites whose contempt, he argued, shaped the caudillos' bad name. The political scientist Peter H. Smith grouped Rosas, Diego Portales of Chile and Porfirio Díaz as builders of "integrative dictatorships" that drew power back to the centre.

**Rosas** shows the type. One of Buenos Aires province's largest landowners, with a private militia of gauchos, he became governor in 1829 and returned in 1835 with the *suma del poder público*, the "sum of public power". His parapolice, the *Mazorca*, terrorised opponents; modern estimates put the number killed between 1829 and 1852 at around 2,000. Yet Rosas, a slave-owner who abolished the slave trade in 1839, also lifted the ban on Afro-Argentine *candombes*, attended them and gave to Black mutual-aid societies, and he remained popular among Black Argentines and gauchos. He fell only when his rival Urquiza, allied with Brazil, defeated him at Caseros in 1852. Of his landed supporters after Caseros, Lynch wrote: "Survival, not allegiance, was their politics." Argentine writers long called his rule "the Tyranny of Rosas", but from the 1930s a nationalist *revisionismo* recast him as a defender of sovereignty against Britain and France. In 1989 President Menem brought his remains home from England and, a week later, pardoned nearly 300 military personnel convicted of Dirty War abuses.

In Guatemala Rafael Carrera, a mestizo former swineherd who could not read, led a Catholic peasant and Indigenous uprising against the liberal government in 1837 and became president for life in 1854. The deepest fault line was the Church: liberals wanted a secular state and the sale of corporate property, conservatives defended the Church's courts and lands.

## Brazil: An Empire among Republics

From 1822 to 1889 Brazil was a parliamentary constitutional monarchy, more stable than the Spanish-speaking republics, with free speech and comparatively broad elections, but with legal restrictions on women and with enslaved people treated as property. When Pedro I abdicated in 1831 his son **Pedro II** was five, and regional revolts followed under a weak regency. In 1840 the fourteen-year-old was declared of age. The politicians, writes his biographer Roderick Barman, had "lost all faith in their ability to rule the country on their own. They accepted Pedro II as an authority figure whose presence was indispensable for the country's survival."

Slavery proved the empire's undoing. The chapter on Abolition and Emancipation follows Brazil's road from the Free Womb Law of 1871 to the Golden Law of 13 May 1888, signed by Princess Isabel while her father was in Europe. The Free Womb Law had cost the monarchy the loyalty of ultraconservatives; abolition was "the final blow", pushing them and the coffee planters behind them towards a republic. Nor was Isabel, the heir, considered acceptable as a female monarch. Army officers felt undervalued after the Paraguayan War, and Comte's positivism spread through the military schools.

On **15 November 1889** a bloodless military coup in Rio de Janeiro, led by Marshal Deodoro da Fonseca, himself a monarchist, deposed the emperor. Pedro II died in exile in Paris in 1891. The new flag carried the positivist motto *Ordem e Progresso*, "Order and Progress". How Brazilians received the change is debated. The republican journalist Aristides Lobo wrote that the people watched "bestialized, astonished, surprised, without knowing what it meant"; Maria Tereza Chaves de Mello argues that, though ordinary people had not demanded it, the republic came to be seen as a regime of development. The Old Republic was run by the oligarchies of São Paulo (coffee) and Minas Gerais (dairy), the politics of *café com leite*. In 1896–97 the army destroyed the millenarian community of **Canudos** in Bahia, led by Antônio Conselheiro, at a cost estimated at anywhere from about 5,000 to about 30,000 lives. In 1910 Afro-Brazilian and mixed-race sailors led by João Cândido mutinied against flogging by white officers, the Revolt of the Lash.

## Mexico: Invasion, Reform and Intervention

Mexico's first decades were dominated by Antonio López de Santa Anna, who switched repeatedly between liberals and conservatives and, by the historian Alexander Dawson's count, took the presidency eleven times. The country's weakness was laid bare in the war that Mexicans call the "United States intervention" (1846–1848), which followed the US annexation of Texas, still regarded by Mexico as its own. Mexican governments lasted months, weeks or even days; a president willing to negotiate was denounced as a *vendepatria*, a seller of the country, and overthrown. US forces landed at Veracruz in March 1847 and took Mexico City in September. At Chapultepec six young cadets died, remembered as the *Niños Héroes*. Including civilians and disease, Mexican deaths may have reached 25,000. By the Treaty of Guadalupe Hidalgo (1848) Mexico ceded about half its territory, some 55 per cent if Texas is counted, for $15 million; Mexicans in the ceded lands could take US citizenship, but their land grants were often not honoured. Mexican writers soon gave their verdict:

```quote
the true origin of the war, it is sufficient to say that the insatiable ambition of the United States, favored by our weakness, caused it.
Ramón Alcaraz and others · Mexican account of the war (English translation 1850) · 1848
```

In 1855 regional caudillos such as Juan Álvarez of Guerrero, whom the historian François Chevalier called a "good *cacique*" to his peasants, drove Santa Anna out in the Revolution of Ayutla and brought the liberals to power. Their programme, **La Reforma**, ended the jurisdiction of military and Church courts over civil cases, forced corporate bodies to sell their real estate (the Ley Lerdo of 1856) and culminated in the Constitution of 1857. The Church excommunicated officials who swore to uphold the constitution. The Ley Lerdo struck not only Church estates but also the communal lands of Indigenous villages, and the liberal hope of a nation of small farmers was not met. The conservatives rose, and the **Reform War** (1857–1861) became Mexico's worst civil war between independence and the Revolution of 1910.

{{image: Benito Juárez | Benito Juárez, the Zapotec lawyer from Oaxaca who led Mexico's liberals through the Reform War and the French intervention.}}

The liberal leader was **Benito Juárez**, born in 1806 to Zapotec peasants in Oaxaca, a shepherd boy who spoke only Zapotec and could not read until he moved to Oaxaca City at twelve and worked as a servant. As the chapter on Nationalism and the Making of Nation-States notes, he is often called Mexico's first Indigenous president. When Juárez suspended payments on the foreign debt in 1861, Spain, France and Britain occupied Veracruz. Britain and Spain withdrew; France stayed. Mexican conservatives had invited the intervention, and the Church, much of the upper class and some Indigenous communities collaborated with it. On **5 May 1862** about 4,000–5,000 Mexicans under Ignacio Zaragoza, Porfirio Díaz among them, defeated about 6,000 French at Puebla. Napoleon III sent 30,000 troops; in 1863 an Assembly of Notables chosen under French control offered a crown to Maximilian of Habsburg. Even this war was global: a 453-man battalion from Egypt, largely Sudanese, served with the French. Maximilian proved liberal in outlook, but his "Black Decree" of 1865, ordering death for captured republican fighters, created liberal martyrs. Juárez never left Mexican territory during the intervention, and when the French withdrew Maximilian was shot at Querétaro on 19 June 1867; the chapter on the American Civil War notes how Washington kept recognising Juárez throughout. In his manifesto on returning to the capital, Juárez wrote:

```quote
Among individuals, as among nations, respect for the rights of others is peace. [Entre los individuos, como entre las naciones, el respeto al derecho ajeno es la paz.]
Benito Juárez · Manifesto to the nation · 15 July 1867
```

## The Porfiriato

Díaz rebelled when Juárez was re-elected in 1871, and Juárez, who died in 1872, called him "a latter-day Santa Anna". Díaz seized power in 1876 and ruled, apart from brief interludes, notably 1880–84, until 1911, the era called the **Porfiriato**. Its slogan was "order and progress"; its method, *pan o palo*, "bread or bludgeon". Díaz's technocratic advisers, the *Científicos*, drew on positivism and social Darwinism and saw themselves as superior to a largely rural, Indigenous and mixed-race population. Village lands were expropriated as haciendas, many foreign-owned, expanded; in Morelos, Emiliano Zapata rose to defend them. The saying "Poor Mexico, so far from God and so close to the United States!" is usually credited to Díaz, though the attribution is unproven.

Madero, jailed for challenging Díaz in 1910, issued the Plan of San Luis Potosí, which called for revolt on 20 November 1910, and by May 1911 Díaz had left for exile in Paris. Between about one and one and a half million people died in the Revolution that followed. Historians once saw the Porfiriato simply as a dictatorship swept away in 1910; it is increasingly seen as laying the foundations of post-revolutionary Mexico, though its benefits were very unevenly shared.

```checkpoint
q: What did Mexico's Ley Lerdo of 1856 do?
a*: It forced corporate bodies to sell their real estate, a measure aimed at the Church that also struck Indigenous villages' communal lands.
a: It abolished slavery in Mexico.
x: Mexico had abolished slavery in 1829; the Ley Lerdo concerned property.
a: It invited Maximilian of Habsburg to become emperor.
x: Maximilian was invited in 1863 by an Assembly of Notables under French control.
a: It ceded California and New Mexico to the United States.
x: That was the Treaty of Guadalupe Hidalgo of 1848.
hint: Think of what liberals hoped to create: a nation of small landowners.
why: The Reform's attack on corporate property was meant to free land for small farmers, but it undermined Indigenous communities.
---
q: Which combination of pressures best explains the fall of Brazil's monarchy in 1889?
a: A mass popular uprising in the streets of Rio de Janeiro.
x: Aristides Lobo described the people as surprised onlookers; it was a bloodless military coup.
a: Defeat in the Paraguayan War.
x: Brazil won the Paraguayan War, although officers afterwards felt undervalued.
a*: The loss of planters' loyalty after abolition in 1888, doubts about Princess Isabel as heir, and discontented, positivist-influenced army officers.
a: A French invasion like the one in Mexico.
x: No foreign power intervened; the coup was led by a Brazilian marshal.
hint: Think of the Golden Law, the heir, and the military schools.
why: Abolition removed the monarchy's last support among the coffee planters, and the army acted.
```

## Wars between States

The deadliest inter-state war in Latin American history began in 1864, when López's Paraguay seized a Brazilian ship in a conflict that grew out of Brazil's war in Uruguay. Brazil, Argentina and Uruguay signed a secret Treaty of the Triple Alliance in 1865, binding themselves to fight until López's government ceased to exist. López rallied his people in both Spanish and Guaraní, binding Guaraní speakers to the national cause. López was killed at Cerro Corá on 1 March 1870.

How many Paraguayans died is fiercely debated, because no one knows how many lived there before the war: fourteen estimates range from 300,000 to 1,337,000. Vera Blinn Reber argued that losses "have been enormously exaggerated", putting losses at 7 to 18.5 per cent of a pre-war population of about 300,000. Thomas Whigham and Barbara Potthast put the pre-war population at 420,000 to 450,000 and the survivors at 150,000 to 160,000, a loss of 60 to 69 per cent; some older, far higher figures rest on an 1857 census that Reber argues was a government invention. A post-war census, usually dated 1871, counted 106,254 women, 86,079 children and only 28,746 men. Women kept Paraguay alive, becoming almost the only farmers, while Afro-Brazilian *vivandeiras* cooked, washed and carried tents for Brazil's army, work their government called service to male kin, not to the nation. Blame is debated too. Argentine and Paraguayan revisionists, and Eric Hobsbawm, saw British interests behind the war. Leslie Bethell called this "an appealing and intellectually stimulating argument. Unfortunately, there is little or no empirical evidence to support it"; Britain opposed the war, and he placed responsibility on the belligerents.

In the **War of the Pacific** (1879–1884), whose nitrate origins the chapter on the Second Industrial Revolution explains, Chile defeated Bolivia and Peru and occupied Lima in 1881. Chile took Peru's Tarapacá province, and Bolivia lost its coast and became landlocked.

## Indigenous Peoples and the Frontier

For many Indigenous peoples, independence brought conquest by the new states. In Yucatán the Maya rose in 1847, during the war with the United States, against the loss of land to sugar and henequen estates, debt labour and taxes. The **Caste War** became one of the most successful Native American revolts of modern times. Yucatán's government offered sovereignty to the United States, Spain and Britain in return for protection, and sold Maya prisoners into slavery in Cuba.

In a letter of February 1848 to two men in British Honduras, the Maya leader Jacinto Pat explained the rising: "what we want is liberty and not oppression, because before we were subjugated with the many contributions and taxes that they imposed on us."

From 1850 the "Talking Cross" inspired an independent Maya state, Chan Santa Cruz, which bought arms from British Honduras; the Mexican army occupied it only in 1901. In Sonora the army shelled a church at Bácum holding Yaqui prisoners in 1868, killing 120 men, women and children, and from 1903 Díaz's regime deported thousands of Yaqui, perhaps more than ten thousand, to Yucatán and Oaxaca.

In the south, Chile's "Pacification" of Araucanía (1861–1883) incorporated Mapuche territory, de facto independent throughout the colonial era, by military advance and settlement; some Mapuche groups allied with Chile, others resisted, and famine and smallpox killed thousands. In Argentina General Julio A. Roca's **Conquest of the Desert** (main campaign 1878–1885) pushed the frontier to the Río Negro with Remington rifles, killing more than a thousand Mapuche and capturing or displacing over 15,000, some of whom became servants or prisoners. Roca became president. Apologists long presented the campaign as a civilising mission and a defence of settlers; revisionists such as Osvaldo Bayer call it genocide, and Jens Andermann reads contemporary sources as showing an intent to exterminate. In the Amazon the rubber boom brought slave raids and debt peonage, as the chapter on the Second Industrial Revolution describes for the Putumayo; in 2024 Colombia apologised, as it had in 2012, for the killing of tens of thousands of Indigenous people in the boom, estimates running from about 32,000 to the official figure of 60,000.

## Afro-Latin Americans, Cuba and 1898

Slavery ended in stages, from Chile in 1823 to Cuba in 1886 and Brazil in 1888, as the chapter on Abolition and Emancipation shows. Freedom did not bring equality, and sometimes it brought erasure. In Argentina the old story of Afro-Argentines' "disappearance" through war and epidemic is now challenged: historians such as Erika Denise Edwards point to reclassification, including Black women's own pursuit of legal whiteness, and a national project of whiteness that made Afro-Argentines statistically invisible.

Nowhere were race and nation more tightly bound than in **Cuba**, still a Spanish colony. On 10 October 1868 the sugar-mill owner Carlos Manuel de Céspedes freed his slaves and called men of all colours to fight, beginning the **Ten Years' War**. At the constitutional assembly at Guáimaro in 1869, Ana Betancourt argued that, having freed the enslaved, Cuba should now emancipate women, one of the first Cuban feminist statements. Antonio Maceo, the "Bronze Titan", son of the free woman of colour Mariana Grajales, who ran camp hospitals, rose from private to general despite racism among aristocratic patriots, while Spanish propaganda, as Ada Ferrer shows, claimed he sought a race war. When the Pact of Zanjón ended the war in 1878 without abolition or independence, Maceo refused it in the Protest of Baraguá. The war cost tens of thousands of Cuban lives, and still more Spanish soldiers died, mostly of disease.

José Martí founded the Cuban Revolutionary Party in 1892 among the émigré tobacco workers whom the Nationalism chapter describes. The War of Independence began on 24 February 1895; about 40 per cent of the insurgent officers were men of colour. Martí was killed at Dos Ríos on 19 May; the day before, in an unfinished letter, he had written, "I have lived in the monster, and I know its entrails" [*Viví en el monstruo, y le conozco las entrañas*]. Spain's General Weyler forced rural people into fortified towns from 1896; the historian John Lawrence Tone estimates about 170,000 civilian deaths, roughly a tenth of the population.

When the United States entered the war in 1898, Cubans had been fighting for three years. At Santiago, Cuban forces under Calixto García supported the US siege, but General Shafter excluded them from the Spanish surrender and barred them from the city; García protested by letter. Under US pressure the independence army was disbanded in 1899. The Teller Amendment barred annexation, but the Platt Amendment, written into Cuba's constitution in 1901, allowed US intervention and naval bases such as Guantánamo, and was used for an occupation in 1906–09. In 1912 the Partido Independiente de Color, founded by Black veterans, rose in Oriente; the revolt was crushed, with up to 6,000 dead by some estimates, many of them Afro-Cubans killed whether involved or not. As Louis A. Pérez Jr. has shown, US historians long told the "Spanish–American War" with Cubans left out; the chapter on Imperial Expansion and Resistance tells 1898 from the Philippines.

In 1904 Theodore Roosevelt claimed an "international police power" for the United States, declaring that "chronic wrongdoing, or an impotence which results in a general loosening of the ties of civilized society" could justify intervention. Panama seceded from Colombia in 1903 with US backing, and in the "Banana Wars" US forces intervened from Nicaragua to Haiti (1915–1934), with fruit companies such as United Fruit holding stakes, until the Good Neighbor policy of 1933 and the withdrawal from Haiti in 1934.

```checkpoint
q: Why do estimates of Paraguay's losses in the War of the Triple Alliance differ so widely?
a: Because the war's dates are disputed.
x: The war's dates, 1864 to 1870, are not in dispute.
a*: Because estimates of the pre-war population range from 300,000 to over 1.3 million, so losses range from about 7 per cent (Reber) to 60–70 per cent (Whigham and Potthast).
a: Because Paraguay suffered no civilian deaths.
x: Civilians died in great numbers; the post-war census shows how few adult men survived.
a: Because Brazil destroyed all records of the war.
x: The debate turns on population estimates and a doubtful 1857 census, not on lost Brazilian records.
hint: You cannot know how many died without knowing how many lived there first.
why: The population baseline drives every estimate of the catastrophe.
---
q: How did US commanders treat Cuba's independence army at Santiago in 1898?
a: They handed the city over to Calixto García.
x: García was barred from entering the city.
a: They made Cuban officers part of the US command.
x: The Cubans were excluded, and the independence army was soon ordered disbanded.
a: They let Cuban leaders accept the Spanish surrender.
x: Shafter kept the Cubans out of the surrender altogether.
a*: They excluded Cuban forces from the Spanish surrender and barred them from the city, although the Cubans had supported the siege.
hint: Think of Calixto García's letter of protest.
why: Santiago became a symbol of how Cuba's own war was written out of the story of 1898.
```

## Export Booms, Immigrants and Capital

Prosperity came from selling raw materials to industrial nations. Peru's state took control of its **guano** from 1840, and guano royalties became its largest source of revenue. Many diggers were Chinese contract labourers, part of the 80,000 to 100,000, almost all men, who came to Peru between 1849 and 1874, mostly for the sugar estates, and were treated as virtual slaves. In Brazil, **coffee** was the largest export by the 1830s and supplied about three-quarters of export earnings by the early twentieth century.

After refrigerated ships arrived in the 1870s, Argentina's frozen **beef** for Britain became highly profitable, and by 1913 Argentina was among the world's ten richest countries per head. British capital there rose from just over £20 million in 1880 to £157 million in 1890, about two-thirds of all foreign capital, and Argentina was the first destination for British investment in Latin America until 1914. The constitution of 1853, following Alberdi's maxim "to govern is to populate", required the promotion of European immigration. Between 1861 and 1920, 3.8 million Italians and 1.5 million Spaniards arrived, though not all stayed; the population grew from 4 million in 1895 to 7.9 million in 1914, and in 1895 immigrants were over half the people of Buenos Aires. Brazil subsidised European immigration, above all from Italy, which "whitened" its census population; Italians replaced enslaved workers on São Paulo's coffee estates.

Did these booms develop Latin America or keep it subordinate? The chapter on the British Empire describes Gallagher and Robinson's idea of an "informal empire" that included Argentina. Raúl Prebisch and Hans Singer argued that the terms of trade turned against exporters of raw materials. Andre Gunder Frank's "The Development of Underdevelopment" (1966) held that integration into world capitalism itself produced underdevelopment. Fernando Henrique Cardoso and Enzo Faletto argued instead for "dependent development", shaped by class alliances at home as well as ties abroad. The historian D. C. M. Platt, in "Dependency in Nineteenth-Century Latin America: An Historian Objects" (1980), argued that the evidence did not show foreign trade destroying an autonomous path of growth, drawing a sharp reply from Stanley and Barbara Stein; Sanjaya Lall and Tony Smith faulted dependency theory for vagueness and for neglecting domestic politics.

## Women and Ideas

Women faced legal restrictions, as in Brazil, but they shaped intellectual life. Juana Manuela Gorriti, whose Unitarian family fled to Bolivia in 1831, wrote *La quena* (1851), which made her recognised as the earliest novelist of what became Argentina, and her salons in Lima gathered writers to discuss literature, politics and women's rights. Juana Manso, also exiled under Rosas, founded the *Álbum de señoritas* in 1854 and in 1859 became principal of Buenos Aires's first co-educational school. Clorinda Matto de Turner's *Aves sin nido* (1889), a novel of Indigenous life and clerical abuse in the Andes, stirred controversy that, together with a story she published in her magazine, led to her excommunication; she went into exile in 1895.

The century's ideas carried their own exclusions. Domingo Faustino Sarmiento's *Facundo* (1845), written in Chilean exile against Rosas, set "civilisation", Europe and the cities, against "barbarism", the countryside, gauchos and caudillos. Sarmiento directed South America's first teacher-training school (Santiago, 1842) and brought mostly female teachers from the United States, but his dichotomy cast gauchos and Indigenous peoples as barbarians. At the century's end, writers turned against the northern model: Martí in "Nuestra América", and the Uruguayan José Enrique Rodó in *Ariel* (1900), written after 1898, which set the spirit of Shakespeare's Ariel against the utilitarian materialism of Caliban and warned Latin American youth against imitating the United States.

## Further exploration

- **John Lynch, *Caudillos in Spanish America, 1800–1850* (1992).** The standard comparative study, with chapters on Rosas, Páez, Santa Anna and Carrera.
- **Roderick J. Barman, *Citizen Emperor: Pedro II and the Making of Brazil, 1825–1891* (1999).** The leading English biography, explaining the empire's stability and its sudden fall.
- **Peter Guardino, *The Dead March: A History of the Mexican–American War* (2017).** The war from both sides, drawing on Mexican sources.
- **Francisco Doratioto, *Maldita guerra: nova história da Guerra do Paraguai* (2002).** The major Brazilian revisionist history of the Paraguayan War (in Portuguese; Spanish edition *Maldita guerra: nueva historia de la Guerra del Paraguay*).
- **Ada Ferrer, *Insurgent Cuba: Race, Nation, and Revolution, 1868–1898* (1999).** How the struggle against racism and colonialism shaped Cuba's independence wars.
- **Louis A. Pérez Jr., *The War of 1898: The United States and Cuba in History and Historiography* (1998).** How a century of US writing told 1898 with Cuba left out.
- **Fernando Henrique Cardoso and Enzo Faletto, *Dependency and Development in Latin America* (Spanish original 1969; English trans. 1979).** The classic argument for "dependent development", by a future president of Brazil and a Chilean sociologist.$mn_latam_master$,
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
  select $mn_latam_quiz$[
    {"type": "mcq", "prompt": "How much of Mexico's territory was ceded to the United States by the Treaty of Guadalupe Hidalgo (1848)?", "options": ["About half, some 55 per cent if Texas is counted", "About a tenth", "Only Texas", "All of its northern states and the Yucatán"], "answerIndex": 0, "explanation": "Mexico ceded California, Nevada, Utah and most of Arizona, among other lands, for $15 million; the 55 per cent figure includes Texas, which Mexico had not controlled since 1836.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in Rio de Janeiro on 15 November 1889?", "options": ["Princess Isabel signed the Golden Law abolishing slavery", "Pedro II was declared of age", "A bloodless military coup led by Marshal Deodoro da Fonseca deposed Pedro II", "Sailors led by João Cândido mutinied against flogging"], "answerIndex": 2, "explanation": "The coup ended the empire; Pedro II went into exile and died in Paris in 1891. The Golden Law was 1888 and the Revolt of the Lash 1910.", "id": "q2"},
    {"type": "mcq", "prompt": "Which argument did Leslie Bethell reject about the Paraguayan War?", "options": ["That Paraguay suffered heavy losses", "That British interests instigated the war", "That Brazil, Argentina and Uruguay signed a secret treaty", "That López rallied Guaraní speakers"], "answerIndex": 1, "explanation": "Bethell called the British-instigation thesis appealing but found 'little or no empirical evidence' for it; Britain opposed the war.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Platt Amendment, written into Cuba's constitution in 1901, allow?", "options": ["The annexation of Cuba by the United States", "The immediate abolition of slavery in Cuba", "Cuban participation in the Spanish surrender at Santiago", "US intervention in Cuba and the lease of naval bases such as Guantánamo"], "answerIndex": 3, "explanation": "The Teller Amendment had barred annexation; the Platt Amendment allowed intervention, used for the occupation of 1906–09.", "id": "q4"},
    {"type": "open", "prompt": "How did the new Latin American states treat Indigenous peoples between about 1840 and 1910, and how have historians judged campaigns such as the Conquest of the Desert?", "rubric": "A strong answer discusses the Caste War of Yucatán (causes in land loss, debt labour and taxes; Jacinto Pat's demand for liberty; Chan Santa Cruz; Maya prisoners sold to Cuba), the Ley Lerdo's effect on communal lands and Porfirian land expropriation, the Yaqui wars and deportations, Chile's occupation of Araucanía, Roca's Conquest of the Desert (more than 1,000 killed, over 15,000 captured or displaced), and the rubber boom; it contrasts the apologist view of a civilising defence with revisionist charges of genocide (Bayer, Andermann), and may link Sarmiento's 'civilisation and barbarism' to such campaigns.", "id": "q5"},
    {"type": "open", "prompt": "Did the nineteenth-century export booms make Latin America dependent? Assess the debate.", "rubric": "A strong answer uses evidence such as Peruvian guano and Chinese contract labour, Brazilian coffee, Argentine beef, British capital in Argentina (from about £20 million in 1880 to £157 million in 1890, two-thirds of foreign capital) and mass immigration; it explains informal empire (Gallagher and Robinson), the Prebisch–Singer thesis, Frank's 'development of underdevelopment', and Cardoso and Faletto's 'dependent development', and weighs the critics, notably D. C. M. Platt (1980) and the Steins' reply, and the charges of vagueness and neglect of domestic politics.", "id": "q6"}
  ]$mn_latam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/latin-america-after-independence', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
